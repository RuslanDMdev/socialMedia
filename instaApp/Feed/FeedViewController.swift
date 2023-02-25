//
//  FeedViewController.swift
//  instaApp
//
//  Created by Ruslan Dalgatov on 18.01.2023.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {

    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize ()

    }
    
    // MARK: - Feed properties

    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "hasbikmain")!, userName: "hasbulla_hushetskiy", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "hasbik")!, userName: "hasbulla_hushet", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "hasbik")!, userName: "hasbulla_hushet", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "hasbik")!, userName: "hasbulla_hushet", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "hasbik")!, userName: "hasbulla_hushet", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "hasbik")!, userName: "hasbulla_hushet", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "hasbik")!, userName: "hasbulla_hushet", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "hasbik")!, userName: "hasbulla_hushet", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "hasbik")!, userName: "hasbulla_hushet", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "hasbik")!, userName: "hasbulla_hushet", isAddButtonVisible: false, isNewStory: true)
            ]),
        
        .post(FeedPostItemInfo(userImage: UIImage(named: "hasbikmain")!, userName: "hasbulla_hushetskiy", postSubTitile: "makhachkala", postImage: UIImage(named: "hasbikPost1")!, numberOfLikes: 3452, comment: CommentShortInfo(userName: "hasbulla_hushetskiy", commentText: "А когда не эта жи"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "hasbikmain")!, userName: "hasbulla_hushetskiy", postSubTitile: "makhachkala", postImage: UIImage(named: "hasbikPost2")!, numberOfLikes: 2324, comment: CommentShortInfo(userName: "hasbulla_hushetskiy", commentText: "Каньон без туристов прекрасен"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "hasbikmain")!, userName: "hasbulla_hushetskiy", postSubTitile: "makhachkala", postImage: UIImage(named: "hasbikPost3")!, numberOfLikes: 4543, comment: CommentShortInfo(userName: "hasbulla_hushetskiy", commentText: "Братия"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "hasbikmain")!, userName: "hasbulla_hushetskiy", postSubTitile: "makhachkala", postImage: UIImage(named: "hasbikPost4")!, numberOfLikes: 3894, comment: CommentShortInfo(userName: "hasbulla_hushetskiy", commentText: "Жду еду"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "hasbikmain")!, userName: "hasbulla_hushetskiy", postSubTitile: "makhachkala", postImage: UIImage(named: "hasbikPost2")!, numberOfLikes: 2324, comment: CommentShortInfo(userName: "hasbulla_hushetskiy", commentText: "Каньон без туристов прекрасен"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "hasbikmain")!, userName: "hasbulla_hushetskiy", postSubTitile: "makhachkala", postImage: UIImage(named: "hasbikPost3")!, numberOfLikes: 4543, comment: CommentShortInfo(userName: "hasbulla_hushetskiy", commentText: "Братия"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "hasbikmain")!, userName: "hasbulla_hushetskiy", postSubTitile: "makhachkala", postImage: UIImage(named: "hasbikPost1")!, numberOfLikes: 3452, comment: CommentShortInfo(userName: "hasbulla_hushetskiy", commentText: "А когда не эта жи")))
    ]
}

// MARK: - Private methods

private extension FeedViewController {
    func initialize(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        view.addSubview(tableView)
        tableView.separatorColor = .clear
        tableView.register(FeedStoriesSetSell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetSell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem]{
        let addBarButtunItem = UIBarButtonItem(title: "nil", image: UIImage(systemName: "plus"), target: self, action: #selector(didTapPlusButton))
        let directBarButtunItem = UIBarButtonItem(title: "nil", image: UIImage(systemName: "paperplane"), target: self, action: #selector(didTapDirectButton))
        return[directBarButtunItem, addBarButtunItem]
    }
    
    @objc func didTapPlusButton(){
        print("Add button tapped")
    }
    
    @objc func didTapDirectButton(){
        print("Direct button tapped")
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtunItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtomItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDrowDownMenu())
    return [logoBarButtunItem, dropDownButtomItem]
    }
    
    func makeDrowDownMenu() -> UIMenu{
        let subItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("Faforite")
        }
        return UIMenu(title: "", children: [subItem, favsItem])
    }
}

// MARK: - UITableViewDataSource

extension FeedViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetSell.self), for: indexPath) as! FeedStoriesSetSell; cell.configure(with: info)
            return cell
            
            
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell;
            cell.configure(with: post)
            return cell
            
        }
    }
}
