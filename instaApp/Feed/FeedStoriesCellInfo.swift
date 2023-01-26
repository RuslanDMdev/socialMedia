//
//  FeedStoriesCellInfo.swift
//  instaApp
//
//  Created by Ruslan Dalgatov on 26.01.2023.
//

import UIKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let userName: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool
    
    
}
typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]
