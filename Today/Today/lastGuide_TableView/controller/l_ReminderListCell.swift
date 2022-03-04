////
////  ReminderListCell.swift
////  Today
////
////  Created by 하늘이 on 2022/02/25.
////
//
//import UIKit
//
//class ReminderListCell: UITableViewCell {
//    
//    // like reference
//    typealias DoneButtonAction = () -> Void
//    
//    @IBOutlet var titleLabel: UILabel!
//    @IBOutlet var dateLabel: UILabel!
//    @IBOutlet var doneButton: UIButton!
//    
//    // private property prevents objects outside this class
//    // from executing this code
//    private var doneButtonAction: DoneButtonAction?
//    
//    @IBAction func doneButtonTriggered(_ sender: UIButton) {
//        doneButtonAction?()
//    }
//    
//    // a closure parameter needs an @escaping annotation
//    // when the closure is stored and executed after the function returns.
//    func configure(title: String, dateText: String, isDone: Bool, doneButtonAction: @escaping DoneButtonAction) {
//        titleLabel.text = title
//        dateLabel.text = dateText
//        let image = isDone ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
//        doneButton.setBackgroundImage(image, for: .normal)
//        self.doneButtonAction = doneButtonAction
//    }
//}
