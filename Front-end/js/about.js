document.getElementById('log-out-btn').addEventListener('click',() => {
    localStorage.removeItem('token');
})