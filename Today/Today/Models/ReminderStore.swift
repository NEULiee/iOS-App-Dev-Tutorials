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
    
    private let skStore = EKEventStore()
    
    // reminder 권한 부여 상태가 .authorized 이면 true를 반환한다.
    // 사용자가 reminder 데이터에 대한 접근권한을 부여했는지 확인
    var isAvailabel: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }
}
