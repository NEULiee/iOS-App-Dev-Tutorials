//
//  ReminderViewController.swift
//  Today
//
//  Created by 하늘이 on 2022/03/11.
//

import UIKit

// Reminder Detail view
class ReminderViewController: UICollectionViewController {
    
    var reminder: Reminder
    
    // Swift에서 class와 structure는 인스턴스가 생성될 때까지 저장된 모든 속성에 초기값을 할당해야한다.
    init(reminder: Reminder) {
        self.reminder = reminder
        // .insetGrouped 모양으로 list를 구성
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    // archive 란?
    
    /// 이해가 안됨!!!!!
    /// Interface Builder stores archives of the view controllers you create. A view controller requires an init(coder:) initializer so the system can initialize it using such an archive. If the view controller can’t be decoded and constructed, the initialization fails. When constructing an object using a failable initializer, the result is an optional that contains either the initialized object if it succeeds or nil if the initialization fails.
    required init?(coder: NSCoder) {
        fatalError("Always initialize ReminderViewController using init(reminder:)")
    }
}
