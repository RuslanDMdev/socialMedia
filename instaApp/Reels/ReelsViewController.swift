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
    private var videoLinks: [String] = ["https://rr4---sn-q0c7rn76.googlevideo.com/videoplayback?expire=1678305857&ei=4ZUIZODbMMuPmLAP2NSS0Ac&ip=146.70.130.26&id=o-AJ5m5fO1z2cODpR-D3bvlXnx25QLLXWYuKDJWaHQiPOA&itag=22&source=youtube&requiressl=yes&mh=_p&mm=31%2C29&mn=sn-q0c7rn76%2Csn-q0cedn7s&ms=au%2Crdu&mv=m&mvi=4&pl=24&initcwndbps=2192500&spc=H3gIhgIvf7AsbTAwpgsyWEtt-UuOtORud02l-PM6uCC4d5-vow&vprv=1&mime=video%2Fmp4&ns=4K2WMmcNcbQT4dHSDHIGNxIL&cnr=14&ratebypass=yes&dur=22.593&lmt=1676652264742389&mt=1678284069&fvip=3&fexp=24007246&c=WEB&txp=5532434&n=FAd_ORg7EMZMdg&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgcF61VD0JhAfUAJ9rgYpklPQjsR9lG6U0J-3-tbgdfZQCIGpLb3OxiJjgszROEhLwJJB9WrzNmYwI4TzZRSKq0qCQ&sig=AOq0QJ8wRAIgEAelHkjGeOkxfv9lpS3YOyyQoh0Uhqi0s8Fof5tN8t0CIGaBXEmnu6YkbySNjki_eBrfw6AJWvN55blSw--LojZw&title=Satisfying%20Moments😌😌😌%20%23Football%20%23Satisfying",
                                        "https://tt.sf-converter.com/get?payload=tlZ1Sk9dF0fBYd9AvTUusbY1-THCQoPCJ-BW0iAS1~aToU6dHiEF3K1rnT3ywuszZ8ZZq8ZH-mz~bvbws3Pbd1Bh54OYKC~jUUPUxpZ-pMxTCfYYpG4JzxYgDl5DJcbmGHjv49F2veO2mfog4NdKCArJbKDUrMCIzSQQoa~VwZW9C4BLKMD1NohkslHb94NONk-Se1B-~FWcE1jI-AdKKypi4BEtrwo7HM4ZaVcXzL-r1mUABi5yR91eNbtf5YetWFuuZFfyEKEokoLOzvYI5qzt4mA6GcN1BAEFiIv-P~-Hg-RHyzTFynLmMtQiS-zVvJiBny6crjdvU3duXy1y9Pr0ExV-utz5MDuyO-Ggh~nz6IgDlOG3mHwVwJtsDpJigGib6rEb12P6AHJ19CvGlxfA0jlhdb~gXIGeYV~eeggp7wnHq08qw0hn1BOiN2O08WobqUOvPekVagCCXCvTKtGvFku5mSDS6g4lbKy7HlxzkvSlhflZea3bebonQFbtsuLyppWbUCrYOF2OuCN5lOkU2lkilELMC-3ChJpv2HAjO5uBKVV6DqDIsr--fEVPFhF_*f9f91e300ef8cb08*1*1678283476",
                                        "https://rr3---sn-hp57knds.googlevideo.com/videoplayback?expire=1678305795&ei=o5UIZPDVHafSzLUPv8u3kAE&ip=205.185.222.46&id=o-ADtuMYqSVn8fMqx7AL2OKQXN2Y739oduU9-UaL6XFOwE&itag=22&source=youtube&requiressl=yes&mh=hL&mm=31%2C26&mn=sn-hp57knds%2Csn-p5qddn7r&ms=au%2Conr&mv=m&mvi=3&pl=24&initcwndbps=1226250&spc=H3gIhl-WZgcqCFDcJjn_pAEnCi6Z6mw5v3e5XTOAoYGYupqI_A&vprv=1&mime=video%2Fmp4&ns=C3PCsli02PN9cozQjq9BdM4L&cnr=14&ratebypass=yes&dur=12.213&lmt=1669014029472221&mt=1678284069&fvip=2&fexp=24007246&beids=24491987&c=WEB&txp=4532434&n=EdjosWCdU2IJAA&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgHYRxV5qTjOi6mMsB6TdwqbdjvizujaZGb13fs8BmbkgCICmDStCkWKXqkS9miZusRqrQQhP2figOtrXj357R4UpQ&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgOp9kRasysNz4ZBwrLXzAgCBWFxLdgOcKMoxutIxLyh4CIB1caWU7qfGrDTMeJWBihZBnX98VYQx8z5xrecqXymZm&title=This%20Goal%20save%20😱🤯🥵%23football%20%23shorts",
                                        "https://rr1---sn-3pm7kn76.googlevideo.com/videoplayback?expire=1678290886&ei=ZlsIZPJb7Ym90g_X7IQg&ip=223.133.151.61&id=o-AOEBZTykrXMQ9i_hKXRl8xGH-tGachxuo5ECleNUrV4S&itag=22&source=youtube&requiressl=yes&mh=Ky&mm=31%2C26&mn=sn-3pm7kn76%2Csn-oguelner&ms=au%2Conr&mv=m&mvi=1&pl=22&initcwndbps=3737500&spc=H3gIhouI9HtM6HFRomexs3cfk_n3QFAUMoEDBy8MKQwKjkWMww&vprv=1&mime=video%2Fmp4&ns=mHJUcad0o4G28PwLffzYupQL&cnr=14&ratebypass=yes&dur=53.104&lmt=1669881672496957&mt=1678268967&fvip=3&fexp=24007246&c=WEB&txp=4532434&n=rH6n6B69Ro0kuQ&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRgIhALSYvVMCknTQ9qEn4J5mvbJqMdoGlfDwdkiTiF8ftfJ4AiEA_rN_wPl7BCET1Cnak0YpGaMvrr0fXaSy85y0b5hoxME%3D&sig=AOq0QJ8wRQIgWjPsopXlp1QIxokmKprpP3zKOzxvf22ySmOsi4Qqo_oCIQCkJ_-KGcpS3smnt8XdA7MpX1ZisSTuMGpxewjaE33nCg%3D%3D&title=Bai%20Big%20Mac%20%23shorts%20%20%40Bayashi%20TV" ]
        
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
            view.backgroundColor = .white
            navigationItem.title = "Reels"
            navigationController?.navigationBar.tintColor = .black
            
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
