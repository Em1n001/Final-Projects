
function addProduct() {
    const token = localStorage.getItem('token');

    const productForm = document.querySelector('form');

    productForm.addEventListener('submit', (e) => {
        e.preventDefault();

        const product = {
            model: document.getElementById('product-model').value,
            brand: document.getElementById('product-brand').value,
            price: document.getElementById('product-price').value,
            category: document.getElementById('product-category').value,
            description: document.getElementById('product-description').value,
            image: document.getElementById('product-image').value,
            rating: document.getElementById('product-rating').value
        }

        const productId = localStorage.getItem('productId');
        localStorage.removeItem('productId');

        if (productId) {
            updateProduct(product, productId);
        } else {
            fetch('http://localhost:8085/products/create', {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${token}`,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(product)
            })
                .then(response => {
                    if (response.ok) {
                        alert('Product added successfully');
                        document.getElementById('product-model').value = '';
                        document.getElementById('product-brand').value = '';
                        document.getElementById('product-price').value = '';
                        document.getElementById('product-category').value = '';
                        document.getElementById('product-description').value = '';
                        document.getElementById('product-image').value = '';
                        document.getElementById('product-rating').value = '';
                        window.location.href = `myProduct.html`
                    }
                })
        }
    })
}

addProduct();


function editProduct() {
    const token = localStorage.getItem('token');

    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get('id');

    if (productId) {
        localStorage.setItem('productId', productId);

        fetch(`http://localhost:8085/products/getById/${productId}`, {
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${token}`
            }
        })
            .then(async response => {
                if (response.ok) {
                    const object = await response.json();
                    console.log(object);
                    document.getElementById('product-model').value = object.model;
                    document.getElementById('product-brand').value = object.brand;
                    document.getElementById('product-price').value = object.price;
                    document.getElementById('product-category').value = object.category;
                    document.getElementById('product-description').value = object.description;
                    document.getElementById('product-image').value = object.image;
                    document.getElementById('product-rating').value = object.rating;

                }
            })
    }

}

editProduct();

function updateProduct() {

    const token = localStorage.getItem('token');

    const productForm = document.querySelector('form');

    const productId = localStorage.getItem('productId');

    const product = {
        id: productId,
        model: document.getElementById('product-model').value,
        brand: document.getElementById('product-brand').value,
        price: document.getElementById('product-price').value,
        category: document.getElementById('product-category').value,
        description: document.getElementById('product-description').value,
        image: document.getElementById('product-image').value,
        rating: document.getElementById('product-rating').value
    }

    productForm.addEventListener('submit', (e) => {
        e.preventDefault();

        fetch('http://localhost:8085/products/update', {
            method: 'PUT',
            headers: {
                'Authorization': `Bearer ${token}`,
                'Content-Type': 'application/json'

            },
            body: JSON.stringify({
                id:productId,
                brand:product.brand,
                model:product.model,
                category:product.category,
                price:product.price,
                description:product.description,
                rating:product.rating,
                image:product.image
            })
        })
            .then(response => {
                if (response.ok) {
                    alert('product update succsessfully');
                    localStorage.removeItem('productId');
                    window.location.href = "myProduct.html"
                }
            })
    })
}
