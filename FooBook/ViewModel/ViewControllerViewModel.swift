//
//  ViewControllerViewModel.swift
//  FooBook
//
//  Created by Shankar B S on 09/02/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation
class ViewControllerViewModel {
    private var feedModels: [FeedModel] = []
    private let dataProvider: DataProvider =  DataProvider()
    
    func populateFeedModels() {
      feedModels = dataProvider.populateData()
    }
    
    func getNumberOfRows() -> Int {
        return feedModels.count
    }
    
    func getFeedAt(index: Int) -> FeedModel {
        return feedModels[index]
    }
}
