//
//  TodayError.swift
//  Today
//
//  Created by neuli on 2022/04/06.
//

import Foundation

enum TodayError: LocalizedError {
    
    case failedReadingReminders
    case reminderHasNoDueDate
    
    var errorDescription: String? {
        switch self {
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders.", comment: "failed reading reminders error description")
        case .reminderHasNoDueDate:
            return NSLocalizedString("A reminder has no due date.", commnet: "reminder has no due date error description")
        }
    }
}
