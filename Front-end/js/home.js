
document.addEventListener('DOMContentLoaded', () => {
    const wrapper = document.getElementById('slider-wrapper');
    const slides = document.querySelectorAll('.slide');
    const dotsContainer = document.getElementById('slider-dots');
    const dots = document.querySelectorAll('.dot');
    const prevBtn = document.querySelector('.prev-btn');
    const nextBtn = document.querySelector('.next-btn');
    
    let currentIndex = 0;

    const totalSlides = slides.length;

    function goToSlide(index) {
        
        if (index >= totalSlides) {
            currentIndex = 0;
        } else if (index < 0) {
            currentIndex = totalSlides - 1;
        } else {
            currentIndex = index;
        }

        
        const offset = -currentIndex * 100;
        wrapper.style.transform = `translateX(${offset}%)`;

        
        updateDots();
    }

    
    function updateDots() {
        dots.forEach((dot, index) => {
            dot.classList.remove('active');
            if (index === currentIndex) {
                dot.classList.add('active');
            }
        });
    }

    
    nextBtn.addEventListener('click', () => {
        goToSlide(currentIndex + 1);
    });

    
    prevBtn.addEventListener('click', () => {
        goToSlide(currentIndex - 1);
    });

    
    dotsContainer.addEventListener('click', (e) => {
        if (e.target.classList.contains('dot')) {
            const slideIndex = parseInt(e.target.getAttribute('data-slide'));
            goToSlide(slideIndex);
        }
    });

});

document.getElementById('log-out-btn').addEventListener('click',() => {
    localStorage.removeItem('token');
})