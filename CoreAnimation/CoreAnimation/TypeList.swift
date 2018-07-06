//
//  TypeList.swift
//  CoreAnimation
//
//  Created by boco on 2018/6/25.
//  Copyright © 2018年 zhangle. All rights reserved.
//

import UIKit

class TypeList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var datas: Array<String>?

    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "动画列表"
        self.view.backgroundColor = .white

        self.datas = ["隐式动画", "基础动画", "事物", "沿路径移动动画", "翻转动画"]
        
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        cell?.textLabel?.text = self.datas?[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.datas?.count)!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let implicitlyVC = ImplicitlyAnimation()
            self.navigationController?.pushViewController(implicitlyVC, animated: true)
        } else if indexPath.row == 1 {
            let basicVC = BasicAnimation()
            self.navigationController?.pushViewController(basicVC, animated: true)
        } else if indexPath.row == 2 {
            let transactionVC = Transaction()
            self.navigationController?.pushViewController(transactionVC, animated: true)
        } else if indexPath.row == 3 {
            let moveVC = MoveAnimation()
            self.navigationController?.pushViewController(moveVC, animated: true)
        } else if indexPath.row == 4 {
            let rotationVC = RotationAnimation()
            self.navigationController?.pushViewController(rotationVC, animated: true)
        }
    }

}
