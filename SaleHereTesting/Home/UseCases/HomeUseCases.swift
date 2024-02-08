//
//  HomeUseCases.swift
//  SaleHereTesting
//
//  Created by admin on 7/2/2567 BE.
//

import Foundation

protocol IHomeUseCase {
    func getGoal(completion: @escaping (HomeRepository.GetGoalResult) -> Void)
}

class HomeUseCase: IHomeUseCase {
   
    private let homeRepository: HomeRepository

    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
    }
    
    func getGoal(completion: @escaping (HomeRepository.GetGoalResult) -> Void) {
        self.homeRepository.getGoal(completion: completion)
    }


}
