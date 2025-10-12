
function loadOnProducts(){
    const token = localStorage.getItem('token');

    fetch('http://localhost:8085/products/getAll', {
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${token}`
        }
    })
    .then(async response => {
            if (response.ok) {
            let data = await response.json();
            console.log(data);

            let products_body = document.getElementById("products-tbody");

            let tableContent = '';
            data.products.forEach(element => {
                tableContent += `
                <tr>
                <td>${element.id}</td>
                <td>${element.brand}</td>
                <td>${element.model}</td>
                <td>${element.category}</td>
                <td>${element.price} AZN</td>
                <td>${element.rating}</td>
                <td>
                    <img src="${element.image}" />
                </td> 
                <td><button type="button" class="btn btn-primary edit-btn" data-id="${element.id}">Edit</td>
                <td><button type="button" class="btn btn-danger delete-btn" data-id="${element.id}">Delete</td>

                </tr>
                
                `
            })
            products_body.innerHTML += tableContent;
        }
    })
}

loadOnProducts();

document.addEventListener('click', (e) => {
    if (e.target.classList.contains('edit-btn')) {
        const productId = e.target.getAttribute('data-id');
        console.log(productId);

        window.location.href = `createProduct.html?id=${productId}`;
    }
})

document.addEventListener('click', (e) => {
    if(e.target.classList.contains('delete-btn')) {
        const productId = e.target.getAttribute('data-id');
        console.log(productId);

        const token = localStorage.getItem('token');

        if (confirm('Silmek istediyinizden eminsinizmi?')) {
            fetch(`http://localhost:8085/products/delete/${productId}`, {
                method: 'DELETE',
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            })
            .then(response => {
                if(response.ok) {
                    alert("Product Delete Succsessfully");
                    e.target.closest('tr').remove();
                }
            })
        }
    }
})

document.getElementById('log-out-btn').addEventListener('click',() => {
    localStorage.removeItem('token');
})