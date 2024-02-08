//
//  ProfileUseCase.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import Foundation

class NotificationUseCase {
    private let notificationRepository: NotificationRepository
    
    init(notificationRepository: NotificationRepository) {
        self.notificationRepository = notificationRepository
    }
    
    // Execute the use case to start listening for notifications
    func execute(notificationHandler: @escaping (Int) -> Void) {
        notificationRepository.listenForNotifications(callback: notificationHandler)
    }
}
