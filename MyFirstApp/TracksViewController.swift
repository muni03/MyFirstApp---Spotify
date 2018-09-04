//
//  TracksViewController.swift
//  MyFirstApp
//
//  Created by Peter Muniz on 8/28/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import UIKit

class TracksViewController: UIViewController {
    let tracks: [SpotifyTrack]
    let tableView = UITableView()
    
    init(tracks: [SpotifyTrack]) {
        self.tracks = tracks
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
    }
}

extension TracksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let track = tracks[indexPath.row]
        
        guard let name = track.name else {
            return cell
        }
        
        var labelText = name
        if let artist = track.artist {
            labelText += " - \(artist)"
        }
        if let album = track.albumName {
            labelText += " (\(album))"
        }
        
        cell.textLabel?.text = labelText
        
        return cell
    }
}
