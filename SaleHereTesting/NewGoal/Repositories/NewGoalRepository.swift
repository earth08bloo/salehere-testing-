//
//  NewGoalRepository.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import Foundation

protocol INewGoalRepository {
    typealias GetTypeGoalResult = Result<[GoalType], Error>
    func getTypeGoal(completion: @escaping (GetTypeGoalResult) -> Void)
  
}

class NewGoalRepository: INewGoalRepository {
    
    init() {
    }
    
    func getTypeGoal(completion: @escaping (GetTypeGoalResult) -> Void) {
        let data = [
            GoalType(iconName: "travel", typeName: "Travel"),
            GoalType(iconName: "education", typeName: "Education"),
            GoalType(iconName: "invest", typeName: "Invest"),
            GoalType(iconName: "clothing", typeName: "Clothing"),
            GoalType(iconName: "education", typeName: "Education")
            ]
        completion(.success(data))
    }


}
