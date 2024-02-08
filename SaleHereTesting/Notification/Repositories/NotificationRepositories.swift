//
//  ProfileRepositories.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import Foundation
import SocketIO

class NotificationRepository {
    static let shared = NotificationRepository()
    private let socketManager = SocketManager(socketURL: URL(string: "wss://px-socket-emitter.proxumer.com")!)
    private var socket: SocketIOClient?
    
    init() {
        connectToWebSocket()
    }
    
    // Connect to WebSocket
    private func connectToWebSocket() {
        socket = socketManager.defaultSocket
        socket?.connect()
    }
    
    // Listen for notifications
    func listenForNotifications(callback: @escaping (Int) -> Void) {
        // Implement ongoing listening for notifications, if necessary.
        // For example, if you need to keep track of the total count of notifications received,
        // you can maintain a variable to store the count and update it here.
        // For demonstration purposes, we'll simply call the callback closure whenever a new notification is received.
        
        // Example of updating count if you need to maintain state
        var totalCount = 0
        
        socket?.on("new-notification") { data, ack in
            if let count = data[0] as? Int {
                totalCount += 1 // Increment the total count
                callback(totalCount)
            }
        }
    }
}
