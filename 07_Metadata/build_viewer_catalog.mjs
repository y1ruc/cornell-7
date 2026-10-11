import { readdir, readFile, stat, writeFile } from "node:fs/promises";
import { extname, join, relative, sep } from "node:path";
import { fileURLToPath } from "node:url";

const metadataDir = fileURLToPath(new URL(".", import.meta.url));
const archiveRoot = join(metadataDir, "..");
const outputPath = join(archiveRoot, "catalog.json");
const allowedExtensions = new Set([
  ".pdf", ".html", ".htm", ".txt", ".md", ".csv", ".json", ".jsonl", ".xml",
  ".mp4", ".webm", ".mov", ".jpg", ".jpeg", ".png", ".gif", ".webp",
]);
const categoryOrder = ["01_Court", "02_Prosecutors", "03_Cornell", "04_Police", "05_News", "06_Archives", "07_Metadata", "08_Analysis"];

function cleanTitle(name) {
  return name.replace(/\.[^.]+$/, "").replaceAll("_", " ").replaceAll("-", " ").replace(/\s+/g, " ").trim();
}

function decodeHtml(value) {
  return value.replace(/&amp;/gi, "&").replace(/&quot;/gi, '"').replace(/&#39;|&apos;/gi, "'").replace(/&lt;/gi, "<").replace(/&gt;/gi, ">").replace(/&nbsp;/gi, " ");
}

async function titleFor(absolute, name) {
  if (![".html", ".htm"].includes(extname(name).toLocaleLowerCase())) return cleanTitle(name);
  try {
    const handle = await import("node:fs/promises").then(({ open }) => open(absolute, "r"));
    try {
      const buffer = Buffer.alloc(65536);
      const { bytesRead } = await handle.read(buffer, 0, buffer.length, 0);
      const head = buffer.toString("utf8", 0, bytesRead);
      const title = head.match(/<title[^>]*>([\s\S]*?)<\/title>/i)?.[1];
      if (title) return decodeHtml(title.replace(/<[^>]*>/g, "").replace(/\s+/g, " ").trim()).slice(0, 180);
      const heading = head.match(/<h1[^>]*>([\s\S]*?)<\/h1>/i)?.[1];
      if (heading) return decodeHtml(heading.replace(/<[^>]*>/g, "").replace(/\s+/g, " ").trim()).slice(0, 180);
    } finally {
      await handle.close();
    }
  } catch {}
  return cleanTitle(name);
}

async function gatherFiles(directory, files = []) {
  const children = await readdir(directory, { withFileTypes: true });
  children.sort((a, b) => a.name.localeCompare(b.name, undefined, { numeric: true, sensitivity: "base" }));
  for (const child of children) {
    if ([".git", "node_modules", "viewer"].includes(child.name)) continue;
    const absolute = join(directory, child.name);
    if (child.isDirectory()) {
      await gatherFiles(absolute, files);
      continue;
    }
    const extension = extname(child.name).toLocaleLowerCase();
    const path = relative(archiveRoot, absolute).split(sep).join("/");
    if (!allowedExtensions.has(extension) || ["index.html", "catalog.json", "STATIC_SITE.md"].includes(path)) continue;
    const details = await stat(absolute);
    const parts = path.split("/");
    files.push({ absolute, path, name: child.name, extension, size: details.size, modified: details.mtime.toISOString(), category: parts.length > 1 ? parts[0] : "Root" });
  }
  return files;
}

const entries = await gatherFiles(archiveRoot);
const depth = (path) => path.split("/").length;
entries.sort((a, b) => depth(a.path) - depth(b.path) || categoryOrder.indexOf(a.category) - categoryOrder.indexOf(b.category) || a.path.localeCompare(b.path, undefined, { numeric: true, sensitivity: "base" }));

const seen = new Set();
const uniqueEntries = [];
for (const entry of entries) {
  // Prefer the top-level archive copy when an older nested snapshot has the same name and size.
  const duplicateKey = `${entry.name.toLocaleLowerCase()}|${entry.size}`;
  if (seen.has(duplicateKey)) continue;
  seen.add(duplicateKey);
  uniqueEntries.push(entry);
}

const catalog = await Promise.all(uniqueEntries.map(async (entry) => ({
  path: entry.path,
  name: entry.name,
  title: await titleFor(entry.absolute, entry.name),
  category: entry.category,
  extension: entry.extension,
  size: entry.size,
  modified: entry.modified,
})));

await writeFile(outputPath, `${JSON.stringify(catalog, null, 2)}\n`, "utf8");
console.log(`Wrote ${catalog.length} archive entries to catalog.json`);
