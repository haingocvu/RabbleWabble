//
//  AppSettings.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/8/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import Foundation

public class AppSettings {
	private struct Keys {
		static let questionStrategy = "questionStrategy"
	}
	public static let shared = AppSettings()
	private init() {}
	private let userDefault = UserDefaults.standard
	public var questionStrategyType: QuestionStrategyType {
		get {
			let rawValue = userDefault.integer(forKey: Keys.questionStrategy)
			return QuestionStrategyType(rawValue: rawValue)!
		}
		set {
			userDefault.set(newValue.rawValue, forKey: Keys.questionStrategy)
		}
	}
	public func questionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
		return questionStrategyType.questionStrategy(for: questionGroupCaretaker)
	}
}


public enum QuestionStrategyType: Int, CaseIterable {
	case random
	case sequential
	public func title() -> String {
		switch self {
		case .random:
			return "Random"
		case .sequential:
			return "Sequential"
		}
	}
	public func questionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
		switch self {
		case .random:
			return randomQuestionStrategy(questionGroupCaretaker: questionGroupCaretaker)
		case .sequential:
			return SequentialQuestionStrategy(questionGroupCaretaker: questionGroupCaretaker)
		}
	}
}
