//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Peter Muniz on 8/27/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let searchField = UITextField()
    let searchButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        searchField.backgroundColor = .white
        
        searchButton.setTitle("Search", for: .normal)
        
        view.addSubview(searchField)
        view.addSubview(searchButton)
        
        searchField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(80)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(searchField.snp.bottom).offset(20)
        }
        
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func searchButtonTapped() {
        guard let text = searchField.text else { return }
        API.searchTracks(text, onCompleted: { tracks in
            let tracksViewController = TracksViewController(tracks: tracks)
            self.navigationController?.pushViewController(tracksViewController, animated: true)
        }, onError: { error in
            print(error)
        })
    }
}

