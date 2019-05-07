//
//  QuestionViewControllerDelegate.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/6/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import UIKit

public protocol QuestionViewControllerDelegate: class {
	func questionViewController(_ controller: QuestionViewController, didCancel questionStrategy: QuestionStrategy, at questionIndex: Int)
	func questionViewController(_ controller: QuestionViewController, didComplete questionStrategy: QuestionStrategy)
}
