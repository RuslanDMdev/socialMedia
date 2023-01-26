//
//  FeedPostItemInfo.swift
//  instaApp
//
//  Created by Ruslan Dalgatov on 26.01.2023.
//

import UIKit

struct FeedPostItemInfo {
    let postImage: UIImage
    let userImage: UIImage
    let userName: String
    let postSubTitile: String
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo{
    let userName: String
    let commentText: String
}
