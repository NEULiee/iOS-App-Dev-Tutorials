//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by 하늘이 on 2022/03/08.
//

import UIKit

extension ReminderListViewController {
    
    // @objc attribute makes this method available to Objective-C code.
    
    // Target-action은 이벤트가 발생했을 때 다른 객체에게 메시지를 보내는 데 필요한 정보를 객체에 보관하는 디자인 패턴입니다.
    // Today 앱에서 touchUpInside 이벤트는 사용자가 완료 버튼을 탭할 때 발생하며, 이 이벤트는 didPressDoneButton:sender 메시지를 뷰 컨트롤러로 보냅니다.
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
