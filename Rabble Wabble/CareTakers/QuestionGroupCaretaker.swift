//
//  QuestionGroupCaretaker.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/10/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import Foundation

public final class QuestionGroupCaretaker {
	private let fileName = "QuestionGroupData"
	public var questionGroups: [QuestionGroup] = []
	public var selectedQuestionGroup: QuestionGroup!
	init() {
		loadQuestionGroups()
	}
	public func loadQuestionGroups() {
		//try load by file name
		if let questionGroups = try? DiskCaretaker.retrieve([QuestionGroup].self, from: fileName) {
			self.questionGroups = questionGroups
		} else {
			//try load by url
			let url = Bundle.main.url(forResource: fileName, withExtension: "json")!
			self.questionGroups = try! DiskCaretaker.retrieve([QuestionGroup].self, from: url)
			try! save()
		}
	}
	public func save() throws {
		try DiskCaretaker.save(questionGroups, to: fileName)
	}
}
