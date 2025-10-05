
const loginForm = document.querySelector('form');

loginForm.addEventListener('submit' , (e) =>{
    e.preventDefault();

    const user = {
        username: document.getElementById('username').value,
        password: document.getElementById('password').value
    }

    fetch('http://localhost:8085/users/login',{
        method: 'POST',
        headers: {
            'Content-Type':'application/json'

        },
        body:JSON.stringify(user)
    })
    .then(async response =>{
        if(response.ok ){
            alert("Giriş uğurlu oldu")
            const token = await response.text();
            localStorage.setItem('token',token);
            document.getElementById('username').value,
            document.getElementById('password').value
           window.location.href=`home.html`
        }else{
         let data = await response.json();
         alert("Username veya Password Yanlışdır");   
        }

    })
}) 
