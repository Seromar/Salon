<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/styles.css">
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <title>Отзывы</title>
   
</head>
<body>
    <div class="content">
        <div class="about-us">
            <p>Отзывы</p>
        </div>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="/index" class="navbar-brand">LA'DOM' Салон красоты</a>
                </div>
            </div>
        </div>
        <!-- Форма для отзыва -->
        <div class="review-form-container">
            <form class="review-form" id="reviewForm">
                <label for="name">Имя:</label>
                <input type="text" id="name" name="name" required>
            
                <label for="phone">Телефон:</label>
                <input type="tel" id="phone" name="phone" required>
                <p class="error" id="phone-error"></p>
            
                <label for="rating">Оценка:</label>
                <input type="number" id="rating" name="rating" min="1" max="5" step="1" required>
            
                <label for="review">Текст отзыва:</label>
                <textarea id="review" name="review" rows="4" required></textarea>
            
                <button type="submit" class="submit-button">Отправить</button>
            </form>
        </div>

        <!-- Надпись "Спасибо за честное мнение!" -->
        <div class="thank-you-message" id="thankYouMessage" style="display: none;">
            Спасибо за честное мнение!
        </div>

        <!-- Карточки отзывов -->
        <div class="review-cards-container" id="reviewCardsContainer">
            % for card in review_cards:
                <div class="review-card">
                    <h3>{{ card['name'] }}</h3>
                    <p>Оценка: {{ card['rating'] }}</p>
                    <p>{{ card['text'] }}</p>
                </div>
            % end
        </div>

        <div class="footer-text">
            <p>&copy; Сеть салонов красоты LA'DOM', 2012 - 2024. Все права защищены.</p>
            <p>Имеются противопоказания. Проконсультируйтесь с нашим специалистом. Все предложения и цены, указанные на сайте, носят информационный характер и не являются публичной офертой.</p>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('reviewForm');
            const phoneErrorElement = document.getElementById('phone-error');
            const thankYouMessage = document.getElementById('thankYouMessage');
            const reviewCardsContainer = document.getElementById('reviewCardsContainer');

            form.addEventListener('submit', function(event) {
                event.preventDefault();

                const formData = new FormData(form);
                const data = {};
                formData.forEach((value, key) => data[key] = value);

                fetch('/reviews', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(data)
                })
                .then(response => response.json())
                .then(result => {
                    if (result.error) {
                        phoneErrorElement.textContent = result.error;
                        phoneErrorElement.style.color = 'red';
                    } else {
                        phoneErrorElement.textContent = '';
                        form.reset();
                        thankYouMessage.style.display = 'block';
                        reviewCardsContainer.innerHTML = '';
                        result.review_cards.forEach(card => {
                            const cardElement = document.createElement('div');
                            cardElement.classList.add('review-card');
                            cardElement.innerHTML = `
                                <h3>${card.name}</h3>
                                <p>Оценка: ${card.rating}</p>
                                <p>${card.text}</p>
                            `;
                            reviewCardsContainer.appendChild(cardElement);
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>
