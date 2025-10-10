
function showProducts(){
    const token = localStorage.getItem('token');

    fetch('http://localhost:8085/products/all', {
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${token}`
        }
    })
    .then(async response => {
        if(response.ok) {
            const data = await response.json();
            console.log(data);

            data.products.forEach(element => {

                let cardsDiv = document.querySelector('.cards');

                let cardDiv = document.createElement('div');
                cardDiv.classList.add('card');
                cardDiv.setAttribute('data-id',element.id);

                let imgDiv = document.createElement('div');

                let image = document.createElement('img');
                image.src = element.image;

                let h5 = document.createElement('h5');
                h5.textContent = element.brand;

                let p = document.createElement('p');
                p.textContent = element.price + " AZN";

                let addToCardBtn = document.createElement('button');
                addToCardBtn.textContent = 'add to card';
                addToCardBtn.setAttribute('data-id', element.id);

                addToCardBtn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    let productId = addToCardBtn.getAttribute('data-id');
                    console.log(productId);

                    addToCart(productId);
                })

                addToCardBtn.style.backgroundColor = 'black';
                addToCardBtn.style.color = 'white';
                addToCardBtn.style.border = 'none';
                addToCardBtn.style.width = '100%';
                addToCardBtn.style.padding = '10px';    


                imgDiv.append(image);
                cardDiv.append(imgDiv);
                cardDiv.append(h5);
                cardDiv.append(p);
                cardDiv.append(addToCardBtn);

                cardsDiv.append(cardDiv);
            });
        }
    }) 
}

showProducts();

function searchProduct(){
    const token = localStorage.getItem('token');

    const query = document.getElementById('searchInput').value;

    fetch(`http://localhost:8085/products/search?query=${query}`, {
        method: 'GET',
        headers:{
            'Authorization': `Bearer ${token}`
        }
    })
    .then(async response => {
        let data = await response.json();
        console.log(data);

        let cards = document.querySelector('.cards');
        cards.innerHTML = '';
        
        data.forEach(element => {

                let cardsDiv = document.querySelector('.cards');

                let cardDiv = document.createElement('div');
                cardDiv.classList.add('card');
                
                let imgDiv = document.createElement('div');

                let image = document.createElement('img');
                image.src = element.image;

                let h5 = document.createElement('h5');
                h5.textContent = element.brand;

                let p = document.createElement('p');
                p.textContent = element.price + " AZN";
                p.style.marginLeft = '20px';

                let addToCardBtn = document.createElement('button');
                addToCardBtn.textContent = 'add to card';
                addToCardBtn.style.backgroundColor = 'black';
                addToCardBtn.style.color = 'white';
                addToCardBtn.style.border = 'none';
                addToCardBtn.style.width = '100%';
                addToCardBtn.style.padding = '4px';
                addToCardBtn.style.cursor = 'pointer';

        

                imgDiv.append(image);
                cardDiv.append(imgDiv);
                cardDiv.append(h5);
                cardDiv.append(p);
                cardDiv.append(addToCardBtn);

                cardsDiv.append(cardDiv);
            });
    })
}

 function sortProducts(){

     const token = localStorage.getItem('token');

     let sortSelect = document.getElementById('sortSelect');

     sortSelect.addEventListener('change', () => {
         let sortValue = document.getElementById('sortSelect').value;

         fetch(`http://localhost:8085/products/sort?sort=${sortValue}`, {
             method: 'GET',
             headers: {
                 'Authorization': `Bearer ${token}`
             }
         })
         .then(async response => {
             let data = await response.json();
             console.log(data);

             let cards = document.querySelector('.cards');
             cards.innerHTML = '';

             data.forEach(element => {

                 let cardsDiv = document.querySelector('.cards');

                 let cardDiv = document.createElement('div');
                 cardDiv.classList.add('card');
                
                 let imgDiv = document.createElement('div');

                 let image = document.createElement('img');
                 image.src = element.image;

                 let h5 = document.createElement('h5');
                 h5.textContent = element.brand;

                 let p = document.createElement('p');
                 p.textContent = element.price + " AZN";

                 let addToCardBtn = document.createElement('button');
                 addToCardBtn.textContent = 'add to card';
                 addToCardBtn.style.backgroundColor = 'black';
                 addToCardBtn.style.color = 'white';
                 addToCardBtn.style.border = 'none';
                 addToCardBtn.style.width = '100%';
                 addToCardBtn.style.padding = '4px';
                 addToCardBtn.style.cursor = 'pointer';

        
                 imgDiv.append(image);
                 cardDiv.append(imgDiv);
                 cardDiv.append(h5);
                 cardDiv.append(p);
                 cardDiv.append(addToCardBtn);

                 cardsDiv.append(cardDiv);
            });
                        
         })
     })
 }

 sortProducts();

document.addEventListener('click', (e) =>{
    if(e.target.closest('.card')) {
     let productId = e.target.closest('.card').getAttribute('data-id');
     console.log(productId);   

     window.location.href = `productDetails.html?id=${productId}`;
    }
})

function addToCart(productId){

    const token = localStorage.getItem('token');

    const cart = {
        productId: productId
    }

    fetch(`http://localhost:8085/cart/add`, {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'   
        },
        body: JSON.stringify(cart)
    })
    .then(async response => {
        let message = await response.text();
        alert(message);
    })
}
document.addEventListener('DOMContentLoaded', () => {
    const products = JSON.parse(localStorage.getItem('products')) || [];
    const categoryFiltersDiv = document.getElementById('category-filters');
    const productContainer = document.getElementById('product-container');

    const categories = new Set(products.map(p => p.category));
    
    if (categoryFiltersDiv) {
        
        categories.forEach(category => {
            if (category) { 
                const filterLink = document.createElement('a');
                filterLink.href = '#';
                filterLink.className = 'filter-item';
                filterLink.setAttribute('data-category', category);
                filterLink.textContent = category;
                categoryFiltersDiv.appendChild(filterLink);
                // a.addEventListener('click', (e) =>{
                    
                // })
            }
        });
        
        categoryFiltersDiv.addEventListener('click', (e) => {
            if (e.target.classList.contains('filter-item')) {
                e.preventDefault();
                
                document.querySelectorAll('.filter-item').forEach(link => link.classList.remove('active'));
                e.target.classList.add('active');
                
                const selectedCategory = e.target.getAttribute('data-category');
                displayProducts(selectedCategory); 
            }
        });
    }

    // 4. Məhsulları göstərən əsas funksiya
    function displayProducts() {
        let categories = document.querySelectorAll("#category-filters a")
        categories.forEach(category => {
            category.addEventListener('click', (e) =>{
                console.log(e.target.textContent);
            })
        })

        productContainer.innerHTML = ''; 

        if (filterCategory = 'all') {

        }

        const filteredProducts = products.filter(p => 
            filterCategory === 'all' || p.category === filterCategory
        );

        if (filteredProducts.length === 0) {
            productContainer.innerHTML = '<p style="grid-column: 1 / -1; text-align: center; color: #777;">Bu kateqoriyada məhsul tapılmadı.</p>';
            return;
        }

        filteredProducts.forEach(product => {
            const productCard = document.createElement('div');
            productCard.className = 'product-card';
            productCard.innerHTML = `
                <div class="product-image-box">
                    <img src="${product.image || 'https://via.placeholder.com/200x200?text=No+Image'}" alt="${product.model}">
                </div>
                <div class="product-details">
                    <p class="product-model">${product.model}</p>
                    <div class="product-price">${product.price} AZN</div>
                    <button class="add-to-cart-btn">Səbətə At</button>
                </div>
            `;
            productContainer.appendChild(productCard);
        });
    }
    
    displayProducts('all');
});
