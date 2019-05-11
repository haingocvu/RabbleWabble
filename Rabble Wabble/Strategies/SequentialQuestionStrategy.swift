//
//  SequentialQuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/7/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

public class SequentialQuestionStrategy: BaseQuestionStrategy {
	public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
		let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
		let questions = questionGroup.questions
		self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
	}
}
