
const registerForm = document.querySelector('form');

registerForm.addEventListener('submit' , (e) =>{
    e.preventDefault();

    const user = {
        name: document.getElementById('name').value,
        surname: document.getElementById('surname').value,
        email: document.getElementById('email').value,
        username: document.getElementById('username').value,
        password: document.getElementById('password').value
    }

    fetch(`http://localhost:8085/users/register`,{
        method: 'POST',
        headers: {
            'Content-Type':'application/json'

        },
        body:JSON.stringify(user)
    })
    .then(async response =>{
        if(response.ok ){
            alert("Qeydiyyat ugurlu oldu")
        document.getElementById('name').value = '';
        document.getElementById('surname').value = '';
        document.getElementById('email').value = '';
        document.getElementById('username').value = '';
        document.getElementById('password').value = '';
            window.location.href=`login.html`
        }else{
            const data = await response.json();
            alert(data.message);
        }

    })
}) 
