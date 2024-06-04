from bottle import route, request, view, template
import json
import os

def is_valid_phone_number(phone):
    return phone.startswith('+7') and len(phone) == 12 and phone[1:].isdigit()

def load_reviews_from_file(file_path):
    if not os.path.exists(file_path) or os.path.getsize(file_path) == 0:
        return []
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            return json.load(file)
    except json.JSONDecodeError:
        return []

def save_review_to_file(file_path, review):
    reviews = load_reviews_from_file(file_path)
    reviews.append(review)
    with open(file_path, 'w', encoding='utf-8') as file:
        json.dump(reviews, file, ensure_ascii=False, indent=4)

@route('/reviews', method=['GET', 'POST'])
@view('reviews')
def reviews():
    error = None
    review_cards = load_reviews_from_file('reviews.json')

    if request.method == 'POST':
        name = request.forms.getunicode('name')
        phone = request.forms.getunicode('phone')
        rating = request.forms.getunicode('rating')
        review = request.forms.getunicode('review')

        if not is_valid_phone_number(phone):
            error = 'Некорректный номер телефона. Он должен начинаться с +7 и содержать 11 цифр.'
        else:
            review_entry = {
                'name': name,
                'phone': phone,
                'rating': rating,
                'text': review
            }
            save_review_to_file('reviews.json', review_entry)
            review_cards = load_reviews_from_file('reviews.json')
            return template('reviews', error=None, review_cards=review_cards)

    return dict(error=error, review_cards=review_cards)
