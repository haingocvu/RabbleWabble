//
//  QuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/7/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

public protocol QuestionStrategy: class {
	var title: String { get }
	var correctCount: Int { get }
	var incorrectCount: Int { get }
	func advancedToNextQuestion() -> Bool
	func currentQuestion() -> Question
	func markQuestionCorrect(_ question: Question)
	func markQuestionIncorrect(_ question: Question)
	func questionIndexTitle() -> String
}
