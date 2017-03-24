//
//  ViewController.swift
//  LSLocalized
//
//  Created by sevli on 2017/3/24.
//  Copyright © 2017年 李文博. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var rightBarBtn: UIBarButtonItem = {
        let barBtn = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(changeLanguage(sender:)))
        return barBtn
    }()

    let cellIdentifier = "cellIdentifier"

    lazy var tableView: UITableView = {
        $0.delegate = self
        $0.dataSource = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        return $0
    }(UITableView())

    let dataArr: [String] = [

        NSLocalizedString("苹果", tableName: "", bundle: Utils.bundle(), value: "", comment: ""),
        NSLocalizedString("香蕉", tableName: "", bundle: Utils.bundle(), value: "", comment: ""),
        NSLocalizedString("菠萝", tableName: "", bundle: Utils.bundle(), value: "", comment: ""),
        NSLocalizedString("汽车", tableName: "", bundle: Utils.bundle(), value: "", comment: ""),
        NSLocalizedString("男人", tableName: "", bundle: Utils.bundle(), value: "", comment: ""),
        NSLocalizedString("女人", tableName: "", bundle: Utils.bundle(), value: "", comment: ""),
        NSLocalizedString("小孩", tableName: "", bundle: Utils.bundle(), value: "", comment: ""),
    ]


    let chinese = NSLocalizedString("中文", tableName: "", bundle: Utils.bundle(), value: "", comment: "")
    let english = NSLocalizedString("英文", tableName: "", bundle: Utils.bundle(), value: "", comment: "")

    override func viewDidLoad() {

        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.tableView.frame = self.view.frame
        self.view.addSubview(self.tableView)
        self.navigationItem.rightBarButtonItem = self.rightBarBtn
        self.setBarBtnTitle()
    }

    private func setBarBtnTitle() {

        let language = Utils.language()
        switch language {
        case Utils.CHINESE:
            self.rightBarBtn.title = english
            break
        case Utils.ENGLISH:
            self.rightBarBtn.title = chinese
            break
        default:
            break
        }
    }


    @objc private func changeLanguage(sender: UIBarButtonItem) {

        switch sender.title! {
        case english:
            UserDefaults.standard.set([Utils.ENGLISH], forKey: "AppleLanguages")
            break
        case chinese:
            UserDefaults.standard.set([Utils.CHINESE], forKey: "AppleLanguages")
            break
        default:
            break
        }

        self.setBarBtnTitle()

        if let window =  UIApplication.shared.delegate?.window {

            window?.rootViewController = UINavigationController(rootViewController: ViewController())
            window?.makeKeyAndVisible()
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        cell.textLabel?.text = self.dataArr[indexPath.row]
        return cell;
    }


}
