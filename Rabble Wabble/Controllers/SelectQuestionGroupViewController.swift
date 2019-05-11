//
//  SelectQuestionGroupViewController.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/5/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {
	
	//MARK;- Life cycle
	public override func viewDidLoad() {
		super.viewDidLoad()
		questionGroups.forEach {
			print("\($0.title). correct count: \($0.score.correctCount). incorrect count: \($0.score.incorrectCount)")
		}
	}
	private let appSettings = AppSettings.shared
	@IBOutlet internal weak var tableView: UITableView! {
		didSet {
			tableView.tableFooterView = UIView()
		}
	}
	private let questionGroupCaretaker = QuestionGroupCaretaker()
	private var questionGroups: [QuestionGroup] {
		get {
			return questionGroupCaretaker.questionGroups
		}
	}
	private var selectedQuestionGroup: QuestionGroup! {
		get {
			return questionGroupCaretaker.selectedQuestionGroup
		}
		set {
			questionGroupCaretaker.selectedQuestionGroup = newValue
		}
	}
}

extension SelectQuestionGroupViewController: UITableViewDataSource {
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return questionGroups.count
	}
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
		let questionGroup = questionGroups[indexPath.row]
		cell.titleLabel.text = questionGroup.title
		return cell
	}
}

extension SelectQuestionGroupViewController: UITableViewDelegate {
	public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		selectedQuestionGroup = questionGroups[indexPath.row]
		return indexPath
	}
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let controller = segue.destination as? QuestionViewController else { return }
		controller.questionStrategy = appSettings.questionStrategy(for: questionGroupCaretaker)
		controller.delegate = self
	}
}

extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
	public func questionViewController(_ controller: QuestionViewController, didCancel questionStrategy: QuestionStrategy, at questionIndex: Int) {
		navigationController?.popToViewController(self, animated: true)
	}
	
	public func questionViewController(_ controller: QuestionViewController, didComplete questionStrategy: QuestionStrategy) {
		navigationController?.popToViewController(self, animated: true)
	}
}
