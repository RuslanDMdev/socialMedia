//
//  FeedPostCell.swift
//  instaApp
//
//  Created by Ruslan Dalgatov on 26.01.2023.
//

import UIKit
import SnapKit


class FeedPostCell: UITableViewCell {
    // MARK: - Public
    func configure(with info: FeedPostItemInfo){
        print(info)
        userImageView.image = info.userImage
        userNameLabel.text = info.userName
        postSubTitile.text = info.postSubTitile
        postImageView.image = info.postImage
    }
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private constants
    
    private enum UIConstants{
        static let userImageSize: CGFloat = 30
        static let contentInset: CGFloat = 12
        static let userImageTopInset: CGFloat = 6
        static let userPostNameFontSize: CGFloat = 14
        static let subtitleFontSize: CGFloat = 11
        static let userNameStackToPrifilieImageOffset: CGFloat = 12
        static let postImageToUserImageOffset: CGFloat = 6
        static let actionStackHeight: CGFloat = 30
        static let actionStackToPostImageOffset: CGFloat = 6
        static let actionStackSpacing: CGFloat = 8
    }
    
    
    // MARK: - Private properties
    
    private let userImageView: UIImageView = {
       let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.userPostNameFontSize, weight: .bold)
        return label
    }()
    
    private let postSubTitile: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subtitleFontSize)

        return label
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return button
    }()
    
    private let postImageView: UIImageView = {
       let view = UIImageView()
        return view
    }()
    
    private let likesButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        return button
    }()
    
    
}
// MARK: - Private methods
private extension FeedPostCell{
    func initialize(){
        selectionStyle = .none
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalToSuperview().inset(UIConstants.userImageTopInset)
            make.size.equalTo(UIConstants.userImageSize)
        }
        
        let userNameStack = UIStackView()
        userNameStack.axis = .vertical
        userNameStack.addArrangedSubview(userNameLabel)
        userNameStack.addArrangedSubview(postSubTitile)
        contentView.addSubview(userNameStack)
        userNameStack.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(UIConstants.userNameStackToPrifilieImageOffset)
        }
        
        contentView.addSubview(optionsButton)
        optionsButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(UIConstants.contentInset)
        }
        
        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(UIConstants.postImageToUserImageOffset)
            make.height.equalTo(contentView.snp.width)
        }
        
        let actionsStack = UIStackView()
        actionsStack.axis = .horizontal
        actionsStack.addArrangedSubview(likesButton)
        actionsStack.addArrangedSubview(commentButton)
        actionsStack.addArrangedSubview(shareButton)
        actionsStack.spacing = UIConstants.actionStackSpacing
        contentView.addSubview(actionsStack)
        actionsStack.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.actionStackHeight)
            make.left.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstants.actionStackToPostImageOffset)
        }
        
        contentView.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.actionStackHeight)
            make.right.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstants.actionStackToPostImageOffset)
        }
        
        private let postSubTitile: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: UIConstants.subtitleFontSize)

            return label
        }()
    }
}
