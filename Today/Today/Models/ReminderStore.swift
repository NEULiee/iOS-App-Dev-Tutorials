//
//  ReminderStore.swift
//  Today
//
//  Created by neuli on 2022/04/08.
//

import Foundation
import EventKit

class ReminderStore {
    
    static let shared = ReminderStore()
    
    private let ekStore = EKEventStore()
    
    // reminder 권한 부여 상태가 .authorized 이면 true를 반환한다.
    // 사용자가 reminder 데이터에 대한 접근권한을 부여했는지 확인
    var isAvailabel: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }
    
    func requestAccess() async throws {
        // reminder 권한 부여 상태
        let status = EKEventStore.authorizationStatus(for: .reminder)
        
        switch status {
        case .authorized:
            return
        case .restricted:
            throw TodayError.accessRestricted
        case .notDetermined:
            let accessGranted = try await ekStore.requestAccess(to: .reminder)
            guard accessGranted else {
                throw TodayError.accessDenied
            }
        case .denied:
            throw TodayError.accessDenied
        @unknown default:
            throw TodayError.unknown
        }
    }
    
    private func read(with id: Reminder.ID) throws -> EKReminder {
        guard let ekReminder = ekStore.calendarItem(withIdentifier: id) as? EKReminder else {
            throw TodayError.failedReadingCalendarItem
        }
        return ekReminder
    }
    
    func readAll() async throws -> [Reminder] {
        guard isAvailabel else {
            throw TodayError.accessDenied
        }
        
        // reminder 항목으로만 좁힐 수 있다.
        let predicate = ekStore.predicateForReminders(in: nil)
        let ekReminders = try await ekStore.fetchReminders(matching: predicate)
        // [EKReminder] -> [Reminder]
        let reminders: [Reminder] = try ekReminders.compactMap { ekReminder in
            do {
                return try Reminder(with: ekReminder)
            } catch TodayError.reminderHasNoDueDate {
                // nil을 반환하면 대상 컬렉션에서 이 reminder를 삭제
                return nil
            }
        }
        return reminders
    }
    
    func remove(with id: Reminder.ID) throws {
        guard isAvailabel else {
            throw TodayError.accessDenied
        }
        let ekReminder = try read(with: id)
        try ekStore.remove(ekReminder, commit: true)
    }
    
    @discardableResult
    func save(_ reminder: Reminder) throws -> Reminder.ID {
        guard isAvailabel else {
            throw TodayError.accessDenied
        }
        let ekReminder: EKReminder
        do {
            ekReminder = try read(with: reminder.id)
        } catch {
            ekReminder = EKReminder(eventStore: ekStore)
        }
        ekReminder.update(using: reminder, in: ekStore)
        try ekStore.save(ekReminder, commit: true)
        return ekReminder.calendarItemIdentifier
    }
}
