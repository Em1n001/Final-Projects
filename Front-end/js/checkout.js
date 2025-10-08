
const token = localStorage.getItem('token');

document.getElementById('place-order-btn').addEventListener('click', () => {

    let Name = document.getElementById('Name').value;
    let Surname = document.getElementById('Surname').value;
    let state = document.getElementById('state').value;
    let city = document.getElementById('city').value;
    let address = document.getElementById('address').value;
    let phone = document.getElementById('phone').value;
    let email = document.getElementById('email').value;
    let cartNumber = document.getElementById('cartNumber').value;
    let zipCode = document.getElementById('zipCode').value;
    let expiryMonth = document.getElementById('expiryMonth').value;
    let expiryYear = document.getElementById('expiryYear').value;
    let cvc = document.getElementById('cvc').value;

    let cartIds = JSON.parse(localStorage.getItem('cartIdss'));
})

    if (cartIds) {
        let promises = cartIds.map(cartId => {
            const order = {
                cartId: cartId,
                name: firstName,
                surname: lastName,
                country: state,
                city: city,
                address: address,
                phone: phone,
                email: email,
                cartNumber: cartNumber,
                zipCode: zipCode,
                expiryMonth: expiryMonth,
                expiryYear: expiryYear
            }
            return fetch(`http://localhost:8085/orders/add`, {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${token}`,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(order)
            })

        });

        Promise.all(promises)
            .then(async responses => {
                let response = responses.find(resp => resp.ok);
                if (response) {
                    let message = await response.text();
                    Swal.fire({
                        title: message,
                        icon: "success",
                        width: '300px',
                        position: 'bottom-end',
                        toast: true,
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true,
                        background: '#d4edda',
                        color: '#155724',
                    });

                    // document.getElementById('firstName').value = "";
                    // document.getElementById('lastName').value = "";
                    // document.getElementById('country').value = "";
                    // document.getElementById('address').value = "";
                    // document.getElementById('city').value = "";
                    // document.getElementById('phone').value = "";
                    // document.getElementById('email').value = "";
                    // document.getElementById('cartNumber').value = "";
                    // document.getElementById('zipCode').value = "";
                    // document.getElementById('expiryMonth').value = "";
                    // document.getElementById('expiryYear').value = "";

                    document.getElementById('Name').value  = "";
                    document.getElementById('Surname').value = "";
                    document.getElementById('state').value = "";
                    document.getElementById('city').value = "";
                    document.getElementById('address').value = "";
                    document.getElementById('phone').value = "";
                    document.getElementById('email').value = "";
                    document.getElementById('cartNumber').value = "";
                    document.getElementById('zipCode').value = "";
                    document.getElementById('expiryMonth').value = "";
                    document.getElementById('expiryYear').value = "";
                    document.getElementById('cvc').value = "";

                    localStorage.removeItem('cartIdss');
                } else {
                    for (let res of responses) {
                        let data = await res.json();
                        console.log(data);

                        if (data.message) {
                            Swal.fire({
                                title: data.message,
                                icon: 'error',
                                width: '300px',
                                position: 'bottom-end',
                                toast: true,
                                showConfirmButton: false,
                                timer: 3000,
                                timerProgressBar: true,
                                background: '#f8d7da',
                                color: '#721c24',
                            });
                        }

                        document.querySelectorAll('.error-message').forEach(error => error.remove());
                        document.querySelectorAll('input, select').forEach(input => {
                            input.style.borderColor = "";
                        })

                        if (data.validations) {
                            data.validations.forEach(error => {
                                let field = error.field;
                                let message = error.defaultMessage;

                                let inputField = document.getElementById(field);

                                if (inputField) {
                                    inputField.style.borderColor = "red";
                                    let errorMessage = document.createElement('div');
                                    errorMessage.classList.add('error-message');
                                    errorMessage.innerText = message;
                                    errorMessage.style.color = "red";
                                    errorMessage.style.fontSize = "12px";

                                    inputField.parentElement.appendChild(errorMessage);
                                }
                            });
                        }
                    }
                }
            })
    }

