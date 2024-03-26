<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static\css\styles.css">
    <title>Document</title>
</head>
<body>
    <div class="content">
        <div class="about-us">
            <p>Свяжитесь с нами</p>
        </div>
        <!-- Ссылки на социальные сети -->
        <div class="social-links-container">
            <div class="links-container">
                <div class="link-box" onclick="redirect1">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/Pinterest-logo.png" 
                    loading="lazy" width="150" height="150">
                    <p>Pinterest</p>
                </div>
                <script>
                    function redirect1(){
                        window.location.href='https://ru.pinterest.com/search/pins/?q=Id%C3%A9es%20manucure&rs=trending&b_id=BGy5PZCJ8wNlAAAAAAAAAAC9CV9b6PGjcvku4Qv5NF0bB9NRwu9MJaGnZAeJzKwJel05ovqdVP5mL6SGv5Qygt0&source_id=u4QfHZ6e&top_pin_id=68744693679'
                    }
                </script>
                <div class="link-box" onclick="redirect2">
                    <img src="https://cdn.worldvectorlogo.com/logos/x-2.svg" 
                    loading="lazy" width="150" height="150">
                    <p>X (Twitter)</p>
                </div>
                <script>
                    function redirect2(){
                        window.location.href='https://twitter.com/?lang=ru'
                    }
                </script>
                <div class="link-box" onclick="redirect3">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Telegram_logo.svg/1200px-Telegram_logo.svg.png" 
                    loading="lazy" width="150" height="150">
                    <p>Telegram</p>
                </div>
                <script>
                    function redirect3(){
                        window.location.href="https://t.me/zhidkovskiy_beauty"
                    }
                </script>
            </div>
            <div class="contact-info-container">
                <img src='https://cdn2.iconfinder.com/data/icons/phone-call-functions/154/phone-function-call-telephone-512.png'
                loading="lazy" width="45" height="45">
                <p>+88888888888</p>
            </div>
        </div>
    </div>
    
    <footer>
        <!-- Футер -->
        <p>Footer</p>
    </footer>
    
    </body>
    
</html>