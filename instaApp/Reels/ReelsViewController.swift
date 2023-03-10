//
//  ReelsViewController.swift
//  SocialNetwork 
//
//  Created by Ruslan Dalgatov on 07.03.2023.
//

import UIKit

class ReelsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    // MARK: - Private properties

    private var tableView = UITableView()
    private var videoLinks: [String] = ["https://www.youtube.com/shorts/0KY6SIUrVLY", "https://www.youtube.com/shorts/dM_qFIl_vZU","https://www.youtube.com/shorts/xnwvNjglEUk" ]
        
    //MARK: - View lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            initialize()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoLinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return VideoTableViewCell(link: videoLinks[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
}




    // MARK: - Private methods

    private extension ReelsViewController {
        func initialize(){
            view.backgroundColor = .black
            navigationItem.title = "Reels"
            navigationController?.navigationBar.backgroundColor = .black
            navigationController?.navigationBar.tintColor = .black
            navigationController?.navigationBar.barTintColor = .black
            let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = attributes
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.isPagingEnabled = true
            tableView.showsVerticalScrollIndicator = false
            
            view.addSubview(tableView)
            tableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
