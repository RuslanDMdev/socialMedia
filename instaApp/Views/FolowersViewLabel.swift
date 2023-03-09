//
//  FolowersViewLabel.swift
//  SocialNetwork
//
//  Created by Ruslan Dalgatov on 08.03.2023.
//

import UIKit
import SnapKit


class FolowersViewLabel: UIView{
    //MARK: - init
    
    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Private properties
    private let number: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()

private let text: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    return label
}()

// MARK: - Private methods

private extension FolowersViewLabel{
    func initialize(){
        addSubview(number)
        addSubview(text)
        number.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(0)
        }
        text.snp.makeConstraints { make in
            make.top.equalTo(number.snp.bottom).inset(5)
        }
    }
}
