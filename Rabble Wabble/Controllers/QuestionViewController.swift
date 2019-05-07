//
//  ViewController.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 4/16/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import UIKit

//QuestionViewController is controller
public class QuestionViewController: UIViewController {
	
	public weak var delegate: QuestionViewControllerDelegate?
	
	private lazy var questionIndexItem: UIBarButtonItem = {
		let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		item.tintColor = .black
		navigationItem.rightBarButtonItem = item
		return item
	}()
	public var questionIndex = 0
	public var correctCount = 0
	public var incorrectCount = 0
	
	//questionView is view
	//questionview này là local trong controller này.
	//nghĩa là ở 1 controller khác ta vẫn có thể sử dụng lại QuestionView ...
	//đây là định nghĩa về việc tái sử dụng của View trong
	//getter dưới đây đơn giản chỉ là nó lấy thằng view ra thôi
	//việc nó ép kiểu sang QuestionView nhằm để có thể thực hiện việc (questionView.answerLabel.text = question.answer) ở hàm showQuestion.
	//như vậy ta suy ra mỗi controller chỉ phục vụ cho 1 view (ở đây là question view)
	//như vậy ở những màn hình phức tạp, ta sẽ xây dựng view như thế nào?
	//rồi logic nằm hoàn toàn ở controller, sẽ làm controller ngày càng rối hơn.
	//đây là nhược điểm của
	public var questionView: QuestionView! {
		guard isViewLoaded else { return nil }
		return (view as! QuestionView)
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		setupCancelButton()
		showQuestion()
	}
	
	func setupCancelButton() {
		let action = #selector(handleCancelPress(sender:))
		let image = UIImage(named: "ic_menu")
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, landscapeImagePhone: nil, style: .plain, target: self, action: action)
	}
	
	@objc private func handleCancelPress(sender: UIBarButtonItem) {
		delegate?.questionViewController(self, didCancel: questionStrategy, at: questionIndex)
	}
	
	private func showQuestion() {
		let question = questionStrategy.currentQuestion()
		questionIndexItem.title = questionStrategy.questionIndexTitle()
		questionView.answerLabel.text = question.answer
		questionView.hintLabel.text = question.hint
		questionView.prompLabel.text = question.prompt
		
		questionView.answerLabel.isHidden = true
		questionView.hintLabel.isHidden = true
	}
	
	private func showNextQuestion() {
		guard questionStrategy.advancedToNextQuestion() else {
			delegate?.questionViewController(self, didComplete: questionStrategy)
			return
		}
		showQuestion()
	}
	
	//MARK- IBAction
	@IBAction func toggleAnswerLabels(_ sender: AnyObject) {
		questionView.answerLabel.isHidden = !questionView.answerLabel.isHidden
		questionView.hintLabel.isHidden = !questionView.hintLabel.isHidden
	}
	
	@IBAction func handleCorrect(_ sender: Any) {
		let question = questionStrategy.currentQuestion()
		questionStrategy.markQuestionCorrect(question)
		questionView.correctCountLabel.text = String(questionStrategy.correctCount)
		showNextQuestion()
	}
	
	@IBAction func handleIncorrect(_ sender: Any) {
		let question = questionStrategy.currentQuestion()
		questionStrategy.markQuestionIncorrect(question)
		questionView.incorrectCountLabel.text =  String(questionStrategy.incorrectCount)
		showNextQuestion()
	}
	
	//MARK- Question Strategy
	public var questionStrategy: QuestionStrategy! {
		didSet {
			navigationItem.title = questionStrategy.title
		}
	}
}
