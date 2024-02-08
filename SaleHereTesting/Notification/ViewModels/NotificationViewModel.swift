//
//  NotificationViewModel.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

class NotificationViewModel {
    private let notificationsUseCase: NotificationUseCase
    
    init(notificationsUseCase: NotificationUseCase) {
        self.notificationsUseCase = notificationsUseCase
    }
    
    // Call this method to start listening for notifications
    func startListeningForNotifications(notificationHandler: @escaping (Int) -> Void) {
        self.notificationsUseCase.execute(notificationHandler: notificationHandler)
    }
}
