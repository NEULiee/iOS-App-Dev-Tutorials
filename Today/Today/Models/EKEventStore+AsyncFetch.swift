//
//  EKEventStore+AsyncFetch.swift
//  Today
//
//  Created by neuli on 2022/04/06.
//

import Foundation
import EventKit

// EKEventStore object 는 유저의 캘린더 이벤트와 미리알림에 접근할 수 있다.
extension EKEventStore {
    
    // async : 이 함수가 비동기적으로 실행될 수 있다.
    func fetchReminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders = reminders {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        }
    }
}
