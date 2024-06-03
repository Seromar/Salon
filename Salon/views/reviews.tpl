<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static\css\styles.css">
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <title>Оставить отзыв</title>
</head>
<body>
    <div class="content">
        <div class="about-us">
            <p>Оставьте свой отзыв</p>
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
            <form class="review-form">
                <label for="name">Имя:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="phone">Телефон:</label>
                <input type="tel" id="phone" name="phone" required>
                
                <label for="rating">Оценка:</label>
                <input type="number" id="rating" name="rating" min="1" max="5" step="1" required>
                
                <label for="review">Текст отзыва:</label>
                <textarea id="review" name="review" rows="4" required></textarea>
                
                <button type="submit">Отправить</button>
            </form>
        </div>
        
        <!-- Карточки отзывов -->
        <div class="review-cards-container">
            <div class="review-card">
                <h3>Имя</h3>
                <p>Телефон: +7 (000) 000-00-00</p>
                <p>Оценка: 5</p>
                <p>Текст отзыва: Очень хороший салон!</p>
            </div>
            <div class="review-card">
                <h3>Имя</h3>
                <p>Телефон: +7 (000) 000-00-00</p>
                <p>Оценка: 4</p>
                <p>Текст отзыва: Доволен услугами!</p>
            </div>
        </div>
    </div>
    
    <div class="footer_logo"></div>
    <div class="footer_links">
        <a href="" class="icofont-facebook"></a>
        <a href="" class="icofont-twitter"></a>
        <a href="" class="icofont-skype"></a>
        <a href="" class="icofont-linkedin"></a>
    </div>
</body>
</html>
