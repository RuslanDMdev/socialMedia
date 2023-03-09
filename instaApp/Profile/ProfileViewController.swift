//
//  ProfileViewController.swift
//  SocialNetwork 
//
//  Created by Ruslan Dalgatov on 08.03.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    
// MARK: - Private properties
    var imageWidth = ""
    var imageHight = ""
    
    private var userImageView: UIImageView = {
       var view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.userPostNameFontSize, weight: .bold)
        return label
    }()
    
    private let numberOfPostsLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: UIConstants.userPostNameFontSize, weight: .bold)
        return label
    }()
    
    private let textOfPostsLabel: UILabel = {
        let label = UILabel()
        label.text = "Публикации"
        label.font = .systemFont(ofSize: UIConstants.userInfoStackViewFontSize, weight: .light)
        return label
    }()
    
    private let numberOfFollowersLabel: UILabel = {
        let label = UILabel()
        label.text = "5,932"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: UIConstants.userPostNameFontSize, weight: .bold)
        return label
    }()
    
    private let textOfFollowersLabel: UILabel = {
        let label = UILabel()
        label.text = "Подписчики"
        label.font = .systemFont(ofSize: UIConstants.userInfoStackViewFontSize, weight: .light)
        return label
    }()
    
    private let numberOfFollowingLabel: UILabel = {
        let label = UILabel()
        label.text = "678"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: UIConstants.userPostNameFontSize, weight: .bold)
        return label
    }()
    
    private let textOfFollowingLabel: UILabel = {
        let label = UILabel()
        label.text = "Подписки"
        label.font = .systemFont(ofSize: UIConstants.userInfoStackViewFontSize, weight: .light)
        return label
    }()
    
    private let userSecondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ruslan Dalgatov"
        label.font = .systemFont(ofSize: UIConstants.userPostNameFontSize, weight: .bold)
        return label
    }()
    
    private let userText: UILabel = {
        let label = UILabel()
        label.text = "Личный блог"
        label.textColor = .gray
        label.font = .systemFont(ofSize: UIConstants.userPostNameFontSize, weight: .light)
        return label
    }()
    
    //MARK: - Private constants
    
    private enum UIConstants{
        static let userImageSize: CGFloat = 90
    //MARK: - Fonts
        static let userPostNameFontSize: CGFloat = 14
        static let userInfoStackViewFontSize: CGFloat = 12


    }
    
    
//MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

}
// MARK: - Private methods

private extension ProfileViewController {
    func initialize(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        view.addSubview(userImageView)
        view.addSubview(userNameLabel)
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        
        userImageView.image = UIImage(named: "hasbik")
        changeAvatar()
        changeAvatar()
        userImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.equalToSuperview().inset(20)
            make.size.equalTo(UIConstants.userImageSize)
        }
        
        view.addSubview(userSecondNameLabel)
        view.addSubview(userText)
        userSecondNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(7)
            make.left.equalToSuperview().inset(20)
        }
        
        userText.snp.makeConstraints { make in
            make.top.equalTo(userSecondNameLabel.snp.bottom).offset(3)
            make.left.equalToSuperview().inset(20)
        }
        
        let userInfoStackView1 = UIStackView()
        userInfoStackView1.axis = .vertical
        userInfoStackView1.addArrangedSubview(numberOfFollowingLabel)
        userInfoStackView1.addArrangedSubview(textOfFollowingLabel)
        userInfoStackView1.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(40)
        }

        let userInfoStackView2 = UIStackView()
        userInfoStackView2.axis = .vertical
        userInfoStackView2.addArrangedSubview(numberOfFollowersLabel)
        userInfoStackView2.addArrangedSubview(textOfFollowersLabel)
        userInfoStackView2.snp.makeConstraints { make in
            make.width.equalTo(75)
            make.height.equalTo(40)

        }

        let userInfoStackView3 = UIStackView()
        userInfoStackView3.axis = .vertical
        userInfoStackView3.addArrangedSubview(numberOfPostsLabel)
        userInfoStackView3.addArrangedSubview(textOfPostsLabel)
        userInfoStackView3.snp.makeConstraints { make in
            make.width.equalTo(75)
            make.height.equalTo(40)
        }
        
        let stackOFAllStacks = UIStackView()
        stackOFAllStacks.axis = .horizontal
        stackOFAllStacks.addArrangedSubview(userInfoStackView3)
        stackOFAllStacks.addArrangedSubview(userInfoStackView2)
        stackOFAllStacks.addArrangedSubview(userInfoStackView1)
        view.addSubview(stackOFAllStacks)
        stackOFAllStacks.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.centerY.equalTo(userImageView)
        }
        
        let button = UIButton()
        view.addSubview(button)
        button.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("Редактировать профиль", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .selected)

        button.snp.makeConstraints { make in
            make.top.equalTo(userText.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        button.addTarget(self, action: #selector(changeAvatar), for: .touchUpInside)
        
    }
    
    @objc private func changeAvatar(){
        let API = "https://picsum.photos/" + imageWidth + "/" + imageHight
        guard let apiUrl = URL(string: API) else {
            fatalError("some Eror")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiUrl) { (data, response, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.userImageView.image = UIImage(data: data)
            }
        }
        let height = userImageView.bounds.height
        self.imageHight = String(format: "%.0f", Double(height))
        
        let width = userImageView.bounds.width
        self.imageWidth = String(format: "%.0f", Double(width))
        task.resume()
    }
    
    private func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let titleBarButtunItem = UIBarButtonItem(customView: ProfileLabel())
        return [titleBarButtunItem]
    }
    private func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let addBarButtunItem = UIBarButtonItem(title: "nil", image: UIImage(systemName: "plus.app"), target: self, action: #selector(didTapPlusButton))
        let menuBarButtunItem = UIBarButtonItem(title: "nil", image: UIImage(systemName: "line.3.horizontal"), target: self, action: #selector(didTapMenuButton))
        return[menuBarButtunItem, addBarButtunItem]
    }

    @objc func didTapPlusButton(){
        print("Add button tapped")
    }

    @objc func didTapMenuButton(){
        print("Menu button tapped")
    }

}
