//
//  MainViewController.swift
//  TransitionAnimation
//
//  Created by boco on 2017/12/19.
//  Copyright © 2017年 ZhangLe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Main"
        
        self.tableView = UITableView.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.frame = self.view.bounds
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.tableView.tableFooterView = UIView()
        self.view.addSubview(self.tableView)
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let firstVC = FirstViewController()
            self.navigationController?.pushViewController(firstVC, animated: true)
        } else if indexPath.row == 1 {
            let thirdVC = ThirdViewController()
            self.navigationController?.pushViewController(thirdVC, animated: true)
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        if indexPath.row == 0 {
            cell?.textLabel?.text = "Push&Pop"
        } else if indexPath.row == 1 {
            cell?.textLabel?.text = "Present&Dismiss"
        }
        return cell!
    }

}
