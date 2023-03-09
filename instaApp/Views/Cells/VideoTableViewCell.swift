//
//  VideoTableViewCell.swift
//  SocialNetwork
//
//  Created by Ruslan Dalgatov on 08.03.2023.
//

import UIKit
import SnapKit
import BMPlayer

class VideoTableViewCell: UITableViewCell {
    
    //MARK: - Private constants
    private var link: String
    private var player = BMPlayer()

    // MARK: - Init
    init(link: String){
        self.link = link
        super.init(style: .default, reuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
// MARK: - Private methods
private extension VideoTableViewCell{
    private func initialize(){
        player.isUserInteractionEnabled = false
        BMPlayerConf.enableVolumeGestures = false
        BMPlayerConf.enableBrightnessGestures = false
        BMPlayerConf.enablePlaytimeGestures = false
        BMPlayerConf.shouldAutoPlay = true
        
        let resource = BMPlayerResource(url: URL(string: link)!)
        player.setVideo(resource: resource)
        self.contentView.addSubview(player)
        player.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
