from bottle import route, request, response, view, template
import json
import os

import re

def is_valid_phone_number(phone):
    if not phone.startswith('+7'):
        return False
    if len(phone) != 12:
        return False
    if not phone[1:].isdigit():
        return False
    if phone[2] not in '89':
        return False
    if re.search(r'(\d)\1{5,}', phone[1:]):
        return False
    return True


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
    if request.method == 'POST':
        name = request.json.get('name')
        phone = request.json.get('phone')
        rating = request.json.get('rating')
        review = request.json.get('review')

        if not is_valid_phone_number(phone):
            response.content_type = 'application/json'
            return json.dumps({'error': 'Некорректный номер телефона. Он должен начинаться с +7 и содержать 11 цифр.'})
        else:
            review_entry = {
                'name': name,
                'phone': phone,
                'rating': rating,
                'text': review
            }
            save_review_to_file('reviews.json', review_entry)
            review_cards = load_reviews_from_file('reviews.json')
            response.content_type = 'application/json'
            return json.dumps({'error': None, 'review_cards': review_cards})

    review_cards = load_reviews_from_file('reviews.json')
    return dict(error=None, review_cards=review_cards)
