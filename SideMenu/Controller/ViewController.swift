//
//  ViewController.swift
//  SideMenu
//
//  Created by Luis Domingues on 18/03/20.
//  Copyright © 2020 Luis Domingues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isHidden = true
    
    private var fakeItems = ["Mussum Ipsum", "cacilds vidis litro abertis.", "Pra lá , depois divoltis porris", "Aenean aliquam molestie leo, vitae iaculis nisl. Praesent malesuada urna nisi, quis volutpat erat hendrerit non"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    let bg: UIView = {
        let bg = UIView()
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()
    
    let menuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.00, green:0.23, blue:0.60, alpha:1.00);
        view.alpha = 0
        view.layer.cornerRadius = 10
        return view
    }()
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.separatorStyle = .singleLine
        tv.estimatedRowHeight = 1000
        tv.rowHeight = UITableView.automaticDimension
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private func config() {
        self.title = "Side menu"
        configNavBar()
        setupTableView()
        setupBG()
        setupMenuView()
    }
    
    private func configNavBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(testing))
    }

    @objc private func testing () {
        self.isHidden == true ? self.showMenu() : self.hideMenu()
    }
    
    private func setupTableView() {
        self.view.addSubview(self.tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    private func setupBG() {
        self.view.addSubview(self.bg)
        bg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideMenu)))
        NSLayoutConstraint.activate([
            self.bg.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.bg.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.bg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.bg.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    private func setupMenuView() {
        self.view.addSubview(menuView)
        NSLayoutConstraint.activate([
            self.menuView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.menuView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.menuView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: -300),
            self.menuView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func showMenu() {
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.bg.backgroundColor = UIColor(red:0.75, green:0.83, blue:0.95, alpha: 0.30);
            self.menuView.alpha = 1
            self.menuView.transform = CGAffineTransform(translationX: 250, y: 0)
            self.isHidden = false
        }) { (_) in

        }
    }
    
    @objc private func hideMenu() {
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.bg.backgroundColor = UIColor(red:0.75, green:0.83, blue:0.95, alpha: 0.00);
            self.menuView.alpha = 0
            self.menuView.transform = CGAffineTransform(translationX: -250, y: 0)
            self.isHidden = true
        }) { (_) in
    
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fakeItems.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.bind(txt: self.fakeItems[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
}
