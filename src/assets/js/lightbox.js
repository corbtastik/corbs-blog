document.addEventListener("DOMContentLoaded", () => {
    const lightbox = document.getElementById('lightbox');
    const lightboxImg = document.getElementById('lightbox-img');
    const gridImages = document.querySelectorAll('.image-grid img');

    // 1. Open Lightbox
    gridImages.forEach(img => {
        img.addEventListener('click', (e) => {
            e.stopPropagation(); // Prevent bubbling
            const src = img.getAttribute('src');
            const alt = img.getAttribute('alt');
            
            lightboxImg.src = src;
            lightboxImg.alt = alt;
            
            lightbox.style.display = 'flex';
            // Small timeout to allow display:flex to apply before adding opacity class for transition
            setTimeout(() => {
                lightbox.classList.add('active');
            }, 10);
        });
    });

    // 2. Close Lightbox (Click anywhere)
    lightbox.addEventListener('click', () => {
        lightbox.classList.remove('active');
        
        // Wait for CSS transition to finish before hiding
        setTimeout(() => {
            lightbox.style.display = 'none';
            lightboxImg.src = ''; // Clear src
        }, 300);
    });
});