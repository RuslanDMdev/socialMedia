//
//  LogoView.swift
//  instaApp
//
//  Created by Ruslan Dalgatov on 24.01.2023.
//

import SnapKit
import UIKit

class LogoView: UIView{
    //MARK: - init
    
    init(){
        super.init(frame: .zero)
        inialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Ruslangram_logo")
        return view
    }()

// MARK: - Private methods

private extension LogoView{
    func inialize(){
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(104)
            make.height.equalTo(40)
        }
    }
}
