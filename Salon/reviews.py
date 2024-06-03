from bottle import route, request, view, template

def is_valid_phone_number(phone):
    return phone.startswith('+7') and len(phone) == 12 and phone[1:].isdigit()

@route('/reviews', method=['GET', 'POST'])
@view('reviews')
def reviews():
    error = None

    if request.method == 'POST':
        name = request.forms.get('name')
        phone = request.forms.get('phone')
        rating = request.forms.get('rating')
        review = request.forms.get('review')

        if not is_valid_phone_number(phone):
            error = 'Некорректный номер телефона. Он должен начинаться с +7 и содержать 11 цифр.'
        else:
            # Логика сохранения отзыва
            return template('thank_you')  # Например, редирект на страницу благодарности

    return dict(error=error)
