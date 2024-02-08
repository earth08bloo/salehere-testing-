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
    var totalCount = 0
    
    init() {
        connectToWebSocket()
    }
    
    private func connectToWebSocket() {
        socket = socketManager.defaultSocket
        socket?.connect()
    }
    
    func listenForNotifications(callback: @escaping (Int) -> Void) {
        socket?.on("new-notification") { data, ack in
            if let count = data[0] as? Int {
                self.totalCount += 1 // Increment the total count
                callback(self.totalCount)
            }
        }
    }
    func resetTotalCount() {
         totalCount = 0
     }
}
