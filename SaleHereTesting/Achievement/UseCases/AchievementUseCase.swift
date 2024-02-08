//
//  AchievementUseCase.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import Foundation

protocol IAchievementUseCase {
    func getAchievementList(completion: @escaping (AchievementRepository.GetAchievementListResult) -> Void)
}

class AchievementUseCase: IAchievementUseCase {
   
    private let achievementRepository: AchievementRepository

    init(achievementRepository: AchievementRepository) {
        self.achievementRepository = achievementRepository
    }
    
    func getAchievementList(completion: @escaping (AchievementRepository.GetAchievementListResult) -> Void) {
        self.achievementRepository.getAchievementList(completion: completion)
    }


}

