//
//  TodayError.swift
//  Today
//
//  Created by neuli on 2022/04/06.
//

import Foundation

enum TodayError: LocalizedError {
    
    case failedReadingReminders
    
    var errorDescription: String? {
        switch self {
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders.", comment: "failed reading reminders error description")
        }
    }
}
