////
////  ReminderListDateSource.swift
////  Today
////
////  Created by 하늘이 on 2022/02/28.
////
//
//import UIKit
//
//class ReminderListDataSource: NSObject {
//    
//}
//
//// you'll move the data source method implementations
//// from the view controller into my new class,
//// so that the view controller can focus on managing views.
//
//// The data source object focuses on fetching, updating, and storing data.
//extension ReminderListDataSource: UITableViewDataSource {
//    
//    static let reminderListCellIdentifier = "ReminderListCell"
//    
//    // Remove the override keywords from the method declarations.
//    // Because the superclass of ReminderListDataSource doesn't conform to UITableViewDataSource
//    // no longer overring the data source methods.
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Reminder.testData.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
//            fatalError("Unable")
//        }
//        
//        let reminder = Reminder.testData[indexPath.row]
//        cell.configure(title: reminder.title,
//                       dateText: reminder.dueDate.description,
//                       isDone: reminder.isComplete) {
//            Reminder.testData[indexPath.row].isComplete.toggle()
//            tableView.reloadRows(at: [indexPath], with: .fade)
//        }
//        
//        return cell
//    }
//}
