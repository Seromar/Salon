import unittest
from reviews import is_valid_phone_number

class TestPhoneNumberValidation(unittest.TestCase):

    def test_valid_phone_numbers(self):
        valid_numbers = [
            "+79123456789",   
            "+78987654321",   
            "+79999988888",   
            "+79528129999",   
            "+78912345678"    
        ]
        for number in valid_numbers:
            with self.subTest(number=number):
                self.assertTrue(is_valid_phone_number(number))

    def test_invalid_phone_numbers(self):
        invalid_numbers = [
            "71234567890",        
            "+71234567890",       
            "+70123456789",       
            "+79999999999",       
            "+7912568",         
            "+799125689562389",     
            "+7abcdefghij",       
            "+791234567891234",   
        ]
        for number in invalid_numbers:
            with self.subTest(number=number):
                self.assertFalse(is_valid_phone_number(number))

if __name__ == '__main__':
    unittest.main()
