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
                <div class="navbar-header">
                    <a href="/" class="navbar-brand">LA'DOM' Салон красоты</a>
                </div>
            </div>
        </div>
        <!-- Форма для отзыва -->
        <div class="review-form-container">
            <form class="review-form" action="/reviews" method="post" id="reviewForm">
                <label for="name">Имя:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="phone">Телефон:</label>
                <input type="tel" id="phone" name="phone" required>
                <p class="error" id="phone-error"></p>
                
                <label for="rating">Оценка:</label>
                <input type="number" id="rating" name="rating" min="1" max="5" step="1" required>
                
                <label for="review">Текст отзыва:</label>
                <textarea id="review" name="review" rows="4" required></textarea>
                
                <button type="submit">Отправить</button>
            </form>
        </div>
        
        <!-- Карточки отзывов -->
        <div class="review-cards-container">
            % for card in review_cards:
                <div class="review-card">
                    <h3>{{ card['name'] }}</h3>
                    <p>Телефон: {{ card['phone'] }}</p>
                    <p>Оценка: {{ card['rating'] }}</p>
                    <p>Текст отзыва: {{ card['text'] }}</p>
                </div>
            % end
        </div>
    </div>
    
    <div class="footer_logo"></div>
    <div class="footer_links">
        <a href="" class="icofont-facebook"></a>
        <a href="" class="icofont-twitter"></a>
        <a href="" class="icofont-skype"></a>
        <a href="" class="icofont-linkedin"></a>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const phoneError = "{{ error }}";
            if (phoneError) {
                alert(phoneError);
            }
        });
    </script>
</body>
</html>
