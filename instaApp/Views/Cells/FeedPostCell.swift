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
        userImageView.image = info.userImage
        userNameLabel.text = info.userName
        postSubTitile.text = info.postSubTitile
        postImageView.image = info.postImage
        likesLabel.text = "Нравится: " + "\(info.numberOfLikes)"
        if let comment = info.comment {
                configureCommentLabel(with: comment)
        }
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
        static let userNameStackToPrifilieImageOffset: CGFloat = 12
        static let postImageToUserImageOffset: CGFloat = 6
        static let actionStackHeight: CGFloat = 24
        static let actionStackWidth: CGFloat = 96
        static let actionStackToPostImageOffset: CGFloat = 6
        static let actionStackSpacing: CGFloat = 8
        static let likesToActionStackOffset: CGFloat = 12
        static let commentToLikeOffset: CGFloat = 10
        
        //MARK: - Fonts
        static let userPostNameFontSize: CGFloat = 14
        static let subtitleFontSize: CGFloat = 11
        static let likesLabelFontSize: CGFloat = 14
        static let commentUserLabelFontSize: CGFloat = 14
        static let commentTextLabelFontSize: CGFloat = 14

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

    private let buttonImage: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleDoubleTap), for: .touchDownRepeat)
        return button
    }()
    
    
    private let likesButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        button.setImage(UIImage(named: "likeheart"), for: .normal)
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(named: "Union"), for: .normal)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(named: "share"), for: .normal)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.addTarget(self, action: #selector(savePostButtonPressed), for: .touchUpInside)
        button.setImage(UIImage(named: "bookmark"), for: .normal)
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.likesLabelFontSize,  weight: .bold)
        return label
    }()
    
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.commentUserLabelFontSize)
        return label
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
        contentView.addSubview(buttonImage)
        buttonImage.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(UIConstants.postImageToUserImageOffset)
            make.height.equalTo(contentView.snp.width)
        }
        
        let actionsStack = UIStackView()
        actionsStack.axis = .horizontal
        actionsStack.addArrangedSubview(likesButton)
        likesButton.snp.makeConstraints { make in
                make.height.equalTo(24)
                make.width.equalTo(24)
            }
        actionsStack.addArrangedSubview(commentButton)
        commentButton.snp.makeConstraints { make in
                make.height.equalTo(24)
                make.width.equalTo(24)
            }
        actionsStack.addArrangedSubview(shareButton)
        shareButton.snp.makeConstraints { make in
                make.height.equalTo(24)
                make.width.equalTo(24)
            }
        actionsStack.spacing = UIConstants.actionStackSpacing
        contentView.addSubview(actionsStack)
        actionsStack.snp.makeConstraints { make in
            make.width.equalTo(UIConstants.actionStackWidth)
            make.height.equalTo(UIConstants.actionStackHeight)
            make.left.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstants.actionStackToPostImageOffset)
        }
        
        contentView.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(24)
            make.right.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstants.actionStackToPostImageOffset)
        }
        
        contentView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(actionsStack.snp.bottom).offset(UIConstants.likesToActionStackOffset)
        }
        
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(likesLabel.snp.bottom).offset(UIConstants.commentToLikeOffset)
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.bottom.equalToSuperview().inset(UIConstants.contentInset)
        }
    }
    
    func configureCommentLabel(with comment: CommentShortInfo){
        let string = comment.userName + " " + comment.commentText
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: comment.userName.count)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstants.commentUserLabelFontSize), range: range)
        commentLabel.attributedText = attributedString
    }
    
    @objc func likeButtonPressed(){
        if likesButton.currentImage == UIImage(named: "likeheart") {
            likesButton.setImage(UIImage(named: "redLikeheart"), for: .normal)
            
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                feedbackGenerator.impactOccurred(intensity: 1)
        }else {
            likesButton.setImage(UIImage(named: "likeheart"), for: .normal)
        }
    }
    
    @objc func savePostButtonPressed(){
        if saveButton.currentImage == UIImage(named: "bookmark") {
            saveButton.setImage(UIImage(named: "blackbookmark"), for: .normal)
            
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                feedbackGenerator.impactOccurred(intensity: 1)
        }else {
            saveButton.setImage(UIImage(named: "bookmark"), for: .normal)
        }
    }
    
    @objc func handleDoubleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        if likesButton.currentImage == UIImage(named: "likeheart") {
            likesButton.setImage(UIImage(named: "redLikeheart"), for: .normal)
            
        let heartImageView = UIImageView(image: UIImage(named: "whiteLikeHeart"))
        contentView.addSubview(heartImageView)
            heartImageView.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(70)
                make.centerX.equalTo(buttonImage)
                make.centerY.equalTo(buttonImage)
                
            }

        UIView.animate(withDuration: 0.9, delay: 0, options: [.curveEaseOut], animations: {
            heartImageView.transform = CGAffineTransform(scaleX: 1.5 , y: 1.5)
            heartImageView.alpha = 0
        }, completion: { _ in
            heartImageView.removeFromSuperview()
        })
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                feedbackGenerator.impactOccurred(intensity: 1)
        }else {
            likesButton.setImage(UIImage(named: "likeheart"), for: .normal)
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                feedbackGenerator.impactOccurred(intensity: 1)
        }
    }
}
