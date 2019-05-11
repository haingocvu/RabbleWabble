//
//  BaseQuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/11/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

public class BaseQuestionStrategy: QuestionStrategy {
	
	//MARK:- Properties
	public var title: String {
		return questionGroup.title
	}
	public var correctCount: Int {
		get {
			return questionGroup.score.correctCount
		}
		set {
			questionGroup.score.correctCount = newValue
		}
	}
	public var incorrectCount: Int {
		get {
			return questionGroup.score.incorrectCount
		}
		set {
			questionGroup.score.incorrectCount = newValue
		}
	}
	private var questionGroup: QuestionGroup {
		return questionGroupCaretaker.selectedQuestionGroup
	}
	private var questionGroupCaretaker: QuestionGroupCaretaker
	private var questionIndex = 0
	private let questions: [Question]
	
	//MARK:- Life cycle
	public init(questionGroupCaretaker: QuestionGroupCaretaker, questions: [Question]) {
		self.questionGroupCaretaker = questionGroupCaretaker
		self.questions = questions
		self.questionGroupCaretaker.selectedQuestionGroup.score = QuestionGroup.Score()
	}
	
	//MARK:- Strategy
	public func advancedToNextQuestion() -> Bool {
		try? questionGroupCaretaker.save()
		guard questionIndex + 1 < questions.count else { return false }
		questionIndex += 1
		return true
	}
	
	public func currentQuestion() -> Question {
		return questions[questionIndex]
	}
	
	public func markQuestionCorrect(_ question: Question) {
		correctCount += 1
	}
	
	public func markQuestionIncorrect(_ question: Question) {
		incorrectCount += 1
	}
	
	public func questionIndexTitle() -> String {
		return "\(questionIndex + 1)/\(questions.count)"
	}
}
