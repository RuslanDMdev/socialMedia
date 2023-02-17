//
//  FeedStoriesSetSell.swift
//  instaApp
//
//  Created by Ruslan Dalgatov on 26.01.2023.
//

import UIKit
import SnapKit

class FeedStoriesSetSell: UITableViewCell {
    //MARK: - Public
    func configure(with info: FeedStoriesCellInfo){
        self.items = info
        collectionView.reloadData()
    }
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - private properties
    
    private var collectionView: UICollectionView!
    private var items: FeedStoriesCellInfo = []
    
}

//MARK: - Private methods

private extension FeedStoriesSetSell{
    func initialize(){
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(StoriesItemCell.self, forCellWithReuseIdentifier: String(describing: StoriesItemCell.self))
        collectionView.dataSource = self
    }
    
}

//MARK: - UICollectionViewDataSource
extension FeedStoriesSetSell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoriesItemCell.self), for: indexPath) as! StoriesItemCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}
