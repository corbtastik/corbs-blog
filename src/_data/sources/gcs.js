// src/_data/sources/gcs.js

// We will enable the real GCS logic later when you have the JSON key.
// For now, return an empty array so the build passes.

module.exports = async function() {
  console.log("Skipping GCS fetch (No credentials configured)");
  return [];
};

/* --- SAVE THIS CODE FOR LATER ---
const { Storage } = require('@google-cloud/storage');
const storage = new Storage({ keyFilename: 'src/assets/service-account.json' });

module.exports = async function() {
  const bucketName = 'corbs-blog-portfolio';
  const [files] = await storage.bucket(bucketName).getFiles();

  return files.map(file => {
    const pubUrl = `https://storage.googleapis.com/${bucketName}/${file.name}`;
    return {
      id: file.id,
      src: pubUrl,
      thumb: pubUrl,
      width: 0,
      height: 0,
      alt: file.metadata.metadata?.alt || file.name,
      date: file.metadata.timeCreated,
      source: "gcs"
    };
  });
};
*/