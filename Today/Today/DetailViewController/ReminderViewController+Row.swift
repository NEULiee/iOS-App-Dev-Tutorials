//
//  ReminderViewController+Row.swift
//  Today
//
//  Created by 하늘이 on 2022/03/11.
//

import UIKit

extension ReminderViewController {
    
    // enum 으로 행을 선언하는 이유는 ?
    /// 각 행에 대한 스타일 지정 및 이미지 선택이 간단하고 깔끔해지기 때문에
    /// 또한 뷰컨트롤러가 각 행에 적절한 텍스트를 제공하는데 도움이 되기 때문에
    /// if 문 보다 깔끔하고 후에 더 많은 세부 정보를 쉽게 추가할 수 있다.
    
    // Hashable로 enum을 선언하는 이유는?
    enum Row: Hashable {
        case viewDate
        case viewNotes
        case viewTime
        case viewTitle
        
        // computed property 란?
        var imageName: String? {
            switch self {
            case .viewDate: return "calendar.circle"
            case .viewNotes: return "square.and.pencil"
            case .viewTime: return "clock"
            default: return nil
            }
        }
        
        var image: UIImage? {
            guard let imageName = self.imageName else { return nil }
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }
        
        var textStyle: UIFont.TextStyle {
            switch self {
            case .viewTitle: return .headline
            default: return .subheadline
            }
        }
    }
    
}
