// Dark/Light Mode Toggle
document.addEventListener('DOMContentLoaded', () => {
    const darkModeToggle = document.createElement('button');
    darkModeToggle.textContent = '🌓 Toggle Mode';
    darkModeToggle.classList.add('dark-mode-toggle');
    document.querySelector('header').appendChild(darkModeToggle);
  
    darkModeToggle.addEventListener('click', () => {
      document.body.classList.toggle('dark-mode');
      document.body.classList.toggle('light-mode');
    });
  });
  
  // Simple Analytics
  window.addEventListener('load', () => {
    console.log('Page loaded at: ' + new Date().toLocaleString());
    // Replace with privacy-friendly analytics in production
  });
  
  // Navigation Smooth Scroll
  document.querySelectorAll('nav a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      document.querySelector(this.getAttribute('href')).scrollIntoView({
        behavior: 'smooth'
      });
    });
  });
  