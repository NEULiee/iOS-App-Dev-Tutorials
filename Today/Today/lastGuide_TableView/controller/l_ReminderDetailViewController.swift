////
////  DetailViewController.swift
////  Today
////
////  Created by 하늘이 on 2022/02/26.
////
//
//import UIKit
//
//class ReminderDetailViewController: UITableViewController {
//    
//    /// CaseIterable
//    /// enum 열거형의 값들을 배열과 같이 순회할 수 있도록 해주는 프로토콜
//    /// case 의 값들을 for in loop 나 forEach 등으로 순회할 수 있습니다.
//    /// 그 외 배열에서 사용하던 다양한 메서드 또한 사용 가능합니다.
//    /// allCases 타입 프로퍼티를 통해 map / compactMap / reduce / joined 등 다양한 고차함수와
//    /// count / isEmpty 등의 프로퍼티도 사용이 가능합니다.
//    
//    enum ReminderRow: Int, CaseIterable {
//        
//        // Because the Enumeration stores raw values,
//        // each case has a sequentially increasing integer raw value starting at 0.
//        case title
//        case date
//        case time
//        case notes
//        
//        // This method returns the appropriate text to display
//        // based on the current enumeration case
//        func displayText(for reminder: Reminder?) -> String? {
//            switch self {
//            case .title:
//                return reminder?.title
//            case .date:
//                return reminder?.dueDate.description
//            case .time:
//                return reminder?.dueDate.description
//            case .notes:
//                return reminder?.notes
//            }
//        }
//        
//        // This method returns the appropriate image to display
//        // based on the current enumeration case
//        var cellImage: UIImage? {
//            switch self {
//            case .title:
//                return nil
//            case .date:
//                return UIImage(systemName: "calendar.circle")
//            case .time:
//                return UIImage(systemName: "clock")
//            case .notes:
//                return UIImage(systemName: "square.and.pencil")
//            }
//        }
//    }
//    
//    var reminder: Reminder?
//    
//    func configure(with reminder: Reminder) {
//        self.reminder = reminder
//    }
//    
//    // When initializing a new controller from a storyboard,
//    // iOS calls the init(coder:) initializer.
//    // This configure method approach is useful for configuring after initiallzing,
//    // such as injecting dependencies.
//}
//
//// for data source
//extension ReminderDetailViewController {
//    
//    // Tip: Always codify identifier strings to ensure your app doesn't crash
//    // because of a mistyped identifier.
//    static let reminderDetailCellIdentifier = "ReminderDetailCell"
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ReminderRow.allCases.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderDetailCellIdentifier, for: indexPath)
//        
//        
//        /// 이해가 안감!
//        let row = ReminderRow(rawValue: indexPath.row)
//        cell.textLabel?.text = row?.displayText(for: reminder)
//        cell.imageView?.image = row?.cellImage
//        return cell
//    }
//}
