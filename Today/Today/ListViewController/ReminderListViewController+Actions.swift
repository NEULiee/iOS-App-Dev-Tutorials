//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by 하늘이 on 2022/03/08.
//

import UIKit

extension ReminderListViewController {
    
    // @objc attribute makes this method available to Objective-C code.
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
