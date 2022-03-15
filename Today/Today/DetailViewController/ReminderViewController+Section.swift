//
//  ReminderViewController+Section.swift
//  Today
//
//  Created by 하늘이 on 2022/03/15.
//

import Foundation

extension ReminderViewController {

    // MARK: collection view 의 다른 section 들을 나타내는 enum
    /// data source 가 hash 값을 사용하여 데이터의 변화를 알 수 있기 때문에 Section과 item의 identifier는 Hashable 을 따라야한다.
    enum Section: Int, Hashable {
        case view
        case title
        case date
        case notes
        
        var name: String {
            switch self {
            case .view:
                return ""
            case .title:
                return NSLocalizedString("Title", comment: "Title section name")
            case .date:
                return NSLocalizedString("Date", comment: "Date section name")
            case .notes:
                return NSLocalizedString("Notes", comment: "Notes section name")
            }
        }
    }
}
