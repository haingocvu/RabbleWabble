//
//  SelectQuestionGroupViewController.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/5/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {
	@IBOutlet internal weak var tableView: UITableView! {
		didSet {
			tableView.tableFooterView = UIView()
		}
	}
	public var questionGroups = QuestionGroup.allGroups()
	private var selectedQuestionGroup: QuestionGroup!
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
		controller.questionGroup = selectedQuestionGroup
		controller.delegate = self
	}
}

extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
	public func questionViewController(_ controller: QuestionViewController, didCancel questionGroup: QuestionGroup, at questionIndex: Int) {
		//todo
		navigationController?.popViewController(animated: true)
	}
	public func questionViewController(_ controller: QuestionViewController, didComplete questionGroup: QuestionGroup) {
		//todo
		navigationController?.popViewController(animated: true)
	}
}
