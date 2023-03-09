//
//  ProfileLabel.swift
//  SocialNetwork
//
//  Created by Ruslan Dalgatov on 08.03.2023.
//

import UIKit
import SnapKit


class ProfileLabel: UIView{
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
    private let label: UILabel = {
        let label = UILabel()
        label.text = "rdalgatovm"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()

// MARK: - Private methods

private extension ProfileLabel{
    func initialize(){
        addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
