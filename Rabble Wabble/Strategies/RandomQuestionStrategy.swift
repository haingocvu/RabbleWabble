//
//  RandomQuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/7/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//
import GameplayKit.GKRandomSource

public class randomQuestionStrategy: BaseQuestionStrategy {
	public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
		let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
		let randomSource = GKRandomSource.sharedRandom()
		let questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
		self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
	}
}
