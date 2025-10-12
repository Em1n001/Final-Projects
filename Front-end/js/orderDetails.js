
document.addEventListener('DOMContentLoaded', () => {
    // checkout.html-də saxladığımız məlumatı oxuyuruq
    const orderDetailsJSON = localStorage.getItem('displayOrderDetails');
    const displayDiv = document.getElementById('order-details-display');

    if (!orderDetailsJSON) {
        displayDiv.innerHTML = '<p class="error-message">Sifariş təsdiqlənməsi üçün məlumat tapılmadı.</p>';
        document.querySelector('.order-main-title').textContent = 'Məlumat Xətası';
        document.querySelector('.success-message').textContent = 'Sifariş məlumatları tapılmadığı üçün göstərilə bilmədi.';
        return;
    }

    const orderData = JSON.parse(orderDetailsJSON);
    
    // Məlumatları xüsusi dizaynlı HTML struktura yerləşdiririk
    displayDiv.innerHTML = `
        <div class="info-section">
            <h2>Şəxsi Məlumatlar</h2>
            <div class="detail-row"><span>Ad, Soyad:</span><strong>${orderData.name} ${orderData.surname}</strong></div>
            <div class="detail-row"><span>Telefon:</span><strong>${orderData.phone}</strong></div>
            <div class="detail-row"><span>Email:</span><strong>${orderData.email}</strong></div>
        </div>

        <div class="info-section">
            <h2>Çatdırılma Ünvanı</h2>
            <div class="detail-row"><span>Ölkə:</span><strong>${orderData.country}</strong></div>
            <div class="detail-row"><span>Şəhər:</span><strong>${orderData.city}</strong></div>
            <div class="detail-row"><span>Ünvan:</span><strong>${orderData.address}</strong></div>
            <div class="detail-row"><span>Poçt İndeksi:</span><strong>${orderData.zipCode}</strong></div>
        </div>

        <div class="info-section">
            <h2>Ödəniş Məlumatı</h2>
            <div class="detail-row total-row"><span>Ümumi Məbləğ:</span><strong>${orderData.totalAmount}</strong></div>
        </div>
    `;

    // Məlumatı bir dəfə göstərdikdən sonra LocalStorage-dən silmək məsləhətdir
    // localStorage.removeItem('displayOrderDetails'); 
});
