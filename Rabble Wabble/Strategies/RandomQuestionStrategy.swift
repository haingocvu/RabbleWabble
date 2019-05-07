//
//  RandomQuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/7/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//
import GameplayKit.GKRandomSource

public class randomQuestionStrategy: QuestionStrategy {
	
	//MARK:- Properties
	public var correctCount: Int = 0
	public var incorrectCount: Int = 0
	private let questionGroup: QuestionGroup
	private var questionIndex: Int = 0
	private let questions: [Question]
	
	//MARK:- Life cycle
	init(questionGroup: QuestionGroup) {
		self.questionGroup = questionGroup
		let randomSource = GKRandomSource.sharedRandom()
		self.questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
	}
	
	public var title: String {
		return questionGroup.title
	}
	
	public func advancedToNextQuestion() -> Bool {
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
