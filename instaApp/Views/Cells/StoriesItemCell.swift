//
//  File.swift
//  instaApp
//
//  Created by Ruslan Dalgatov on 17.02.2023.
//

import SnapKit
import UIKit

class StoriesItemCell: UICollectionViewCell{
    //MARK: - Public
    func configure(with info: FeedStoriesItemCellInfo){
        print(info)
        imageView.image = info.image
        userNameLabel.text = info.userName
        plusButton.isHidden = !info.isAddButtonVisible
        circleImageView.isHidden = !info.isNewStory
    }
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private constants
    
    private enum UIConstants{
        static let imageSize: CGFloat = 60
        static let imageToCellInset: CGFloat = 6
        static let labelToCellInset: CGFloat = 6
        static let imageToLabelOffset: CGFloat = 6
        static let userNameFont: CGFloat = 12
        static let plusButtonSize: CGFloat = 20
        static let circleImageSize: CGFloat = 72
    }
    
    
    //MARK: - Private properties
    private let imageView: UIImageView = {
       let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: UIConstants.userNameFont)

        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "addstoryButton"), for: .normal)
        return button
    }()
    
    private let circleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Story ring")
        return view
    }()
}
//MARK: - Private methods

private extension StoriesItemCell{
    func initialize(){
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstants.imageToCellInset)
        }
        contentView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstants.imageToCellInset)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstants.imageToLabelOffset)
        }
        
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(UIConstants.plusButtonSize)
        }
        
        contentView.addSubview(circleImageView)
        circleImageView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(UIConstants.circleImageSize)
        }
    }
}
