import unittest
from survey import AnonymousSurvey

class TestAnonymousSurvey(unittest.TestCase):
	
	def setUp(self):
		question = "What language did you first learn to speak?"
		self.my_survey = AnonymousSurvey(question)
		self.responses = ['English','Spanlish','Mandarin']

	def test_store_single_response(self):
		self.my_survey.store_response(self.responses[0])
		self.assertIn(self.responses[0],self.my_survey.responses)

unittest.main()