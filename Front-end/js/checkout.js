// checkout.html - </body> teqindən əvvəl
const token = localStorage.getItem('token');

document.getElementById('place-order-btn').addEventListener('click', (e) => {
    // Səhifənin yenilənməsinin qarşısını alırıq
    e.preventDefault(); 

    // Bütün input sahələrindən məlumatları toplayırıq
    const Name = document.getElementById('Name').value;
    const Surname = document.getElementById('Surname').value;
    const state = document.getElementById('state').value;
    const city = document.getElementById('city').value;
    const address = document.getElementById('address').value;
    const phone = document.getElementById('phone').value;
    const email = document.getElementById('email').value;
    const zipCode = document.getElementById('zipCode').value;
    
    // Kart məlumatları (Serverə gedir, amma orderDetails-də göstərilmir)
    const cartNumber = document.getElementById('cartNumber').value;
    const expiryMonth = document.getElementById('expiryMonth').value;
    const expiryYear = document.getElementById('expiryYear').value;
    const cvc = document.getElementById('cvc').value;

    // Ümumi məbləği götürürük (total ID-si olmalıdır)
    const totalAmount = document.getElementById('total')?.textContent || 'N/A';
    
    // Bütün lazım olan məlumatları bir obyektə yığırıq (Front-end üçün)
    const orderDetailsForDisplay = {
        name: Name,
        surname: Surname,
        country: state,
        city: city,
        address: address,
        phone: phone,
        email: email,
        zipCode: zipCode,
        totalAmount: totalAmount // Ümumi məbləği əlavə etdik
    };

    let cartIds = JSON.parse(localStorage.getItem('cartIdss'));

    if (cartIds && cartIds.length > 0) {
        let promises = cartIds.map(cartId => {
            const order = {
                cartId: cartId,
                Name: Name,
                Surname: Surname,
                country: state,
                city: city,
                address: address,
                phone: phone,
                email: email,
                cartNumber: cartNumber,
                zipCode: zipCode,
                expiryMonth: expiryMonth,
                expiryYear: expiryYear,
                cvc: cvc
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
                let successResponse = responses.find(resp => resp.ok);
                
                if (successResponse) {
                    let message = await successResponse.text();
                    
                    // UĞURLU CAVAB: Məlumatları LOCALSTORAGE-ə yaz və yönləndir
                    localStorage.setItem('displayOrderDetails', JSON.stringify(orderDetailsForDisplay));
                    
                    // Swal.fire əvəzinə birbaşa yönləndirmə edirik (və ya Swal göstərib sonra yönləndirmə)
                    window.location.href = 'orderDetails.html'; 
                    
                    // Qeyd: Yönləndirmədən əvvəl Swal göstərmək istəsəniz, bu hissəni dəyişə bilərsiniz.
                    // Hazırda isə birbaşa yönləndiririk.

                    localStorage.removeItem('cartIdss');
                } else {
                    // XƏTA CAVABI (Server xətası zamanı əvvəlki xəta kodları işləyəcək)
                    for (let res of responses) {
                        if (!res.ok) {
                             // Xətanın idarə edilməsi hissəsi (Sizin əvvəlki kodunuzdakı kimi)
                             let data = await res.json();
                             // ...
                        }
                    }
                }
            })
            .catch(error => {
                // Şəbəkə xətası və ya fetch problemi
                console.error('Fetch error:', error);
                alert('Sifariş zamanı şəbəkə xətası baş verdi.');
            });
    } else {
        alert('Səbətdə heç bir məhsul yoxdur!');
    }
});

// Qalan funksiyalar (getSubTotal və log-out) eyni qalır.
// getSubTotal()

document.getElementById('log-out-btn').addEventListener('click', () => {
    localStorage.removeItem('token');
})
function getSubTotal() {
    fetch(`http://localhost:8085/cart/getCart`, {
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${token}`
        }
    })
        .then(async response => {
            let data = await response.json();
            console.log(data);

            let cartIds = JSON.parse(localStorage.getItem('cartIdss'));

            if (cartIds) {
                let total = 0;

                cartIds.forEach(cartId => {
                    let item = data.find(cart => cart.id === cartId);
                    if (item) {
                        total += item.subTotal;
                    }
                });

                document.getElementById('sub-total').textContent = total + " AZN";
                document.getElementById('total').textContent = total + " AZN";

            }


        })
}

getSubTotal()