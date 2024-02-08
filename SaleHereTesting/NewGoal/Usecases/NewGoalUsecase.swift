//
//  NewGoalUsecase.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import Foundation

protocol INewGoalUseCase {
    func getTypeGoal(completion: @escaping (NewGoalRepository.GetTypeGoalResult) -> Void)
}

class NewGoalUseCase: INewGoalUseCase {
   
    private let newGoalRepository: NewGoalRepository

    init(newGoalRepository: NewGoalRepository) {
        self.newGoalRepository = newGoalRepository
    }

    func getTypeGoal(completion: @escaping (NewGoalRepository.GetTypeGoalResult) -> Void) {
        self.newGoalRepository.getTypeGoal(completion: completion)
    }


}

