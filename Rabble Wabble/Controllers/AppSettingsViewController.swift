//
//  AppSettingsViewController.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/8/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import UIKit

public class AppSettingsViewController: UITableViewController {
	//MARK:- Properties
	public let appSetting = AppSettings.shared
	private let cellIdentifier = "basicCell"
	//Life Cycle
	public override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
	}
}

extension AppSettingsViewController {
	public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return QuestionStrategyType.allCases.count
	}
	public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
		cell.textLabel?.text = questionStrategyType.title()
		if questionStrategyType == appSetting.questionStrategyType {
			cell.accessoryType = .checkmark
		} else {
			cell.accessoryType = .none
		}
		return cell
	}
}

extension AppSettingsViewController {
	public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
		appSetting.questionStrategyType = questionStrategyType
		tableView.reloadData()
	}
}
