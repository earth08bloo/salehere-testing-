//
//  HomeRepositories.swift
//  SaleHereTesting
//
//  Created by admin on 7/2/2567 BE.
//

import Foundation

protocol IHomeRepository {
    typealias GetGoalResult = Result<[Goal], Error>
    func getGoal(completion: @escaping (GetGoalResult) -> Void)
  
}

class HomeRepository: IHomeRepository {
//    private let httpService: HttpServiceProtocol

    init() {
    }

    func getGoal(completion: @escaping (GetGoalResult) -> Void) {
        // Simulate fetching an array of users
           let goals = [
              Goal(GoalName: "ไปเที่ยวญี่ปุ่น", savingBath: 16500, goalBath: 20000, dueDate: "2024-04-07", savingStatus: true),
              Goal(GoalName: "ซื้อกองทุนรวม", savingBath: 500, goalBath: 6000, dueDate: "2024-04-10", savingStatus: false),
              Goal(GoalName: "ไปทะเล", savingBath: 1000, goalBath: 6000, dueDate: "2024-04-10", savingStatus: true)
           ]
           completion(.success(goals))
    }

}
