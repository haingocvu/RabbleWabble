//
//  SequentialQuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/7/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

public class SequentialQuestionStrategy: QuestionStrategy {
	
	//MARK:- Properties
	public var correctCount: Int = 0
	public var incorrectCount: Int = 0
	private let questionGroup: QuestionGroup
	private var questionIndex: Int = 0
	
	//MARK:- Life Cycle
	init(questionGroup: QuestionGroup) {
		self.questionGroup = questionGroup
	}
	
	//MARK:- Question Strategy
	public var title: String {
		get {
			return questionGroup.title
		}
	}
	
	public func advancedToNextQuestion() -> Bool {
		guard questionIndex + 1 < questionGroup.questions.count else { return false }
		questionIndex += 1
		return true
	}
	
	public func currentQuestion() -> Question {
		return questionGroup.questions[questionIndex]
	}
	
	public func markQuestionCorrect(_ question: Question) {
		correctCount += 1
	}
	
	public func markQuestionIncorrect(_ question: Question) {
		incorrectCount += 1
	}
	
	public func questionIndexTitle() -> String {
		return "\(questionIndex + 1)/\(questionGroup.questions.count)"
	}
}
