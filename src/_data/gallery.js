// src/_data/gallery.js
// const localPhotos = require('./sources/local');
// const gcsPhotos = require('./sources/gcs');
const dummyPhotos = require('./sources/dummy');

module.exports = async function() {
  // 1. Fetch (Commented out real sources for UI testing)
  // const local = await localPhotos();
  // const gcs = await gcsPhotos(); 
  const dummy = dummyPhotos(); // Not async in your snippet, but fine if it returns array

  // 2. Merge
  // const allPhotos = [...local, ...gcs, ...dummy];
  const allPhotos = [...dummy];

  // 3. Sort (Ensure dummy items have dates, or remove sort for now)
  return allPhotos; 
};