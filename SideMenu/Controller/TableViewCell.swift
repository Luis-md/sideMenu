//
//  TableViewCell.swift
//  SideMenu
//
//  Created by Luis Domingues on 18/03/20.
//  Copyright © 2020 Luis Domingues. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    let txt: UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.isEditable = false
        return txt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.config()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func config() {
        configTxt()
    }
    
    func bind(txt: String) {
        self.txt.text = txt
    }
    
    private func configTxt() {
        self.addSubview(self.txt)
        NSLayoutConstraint.activate([
            self.txt.topAnchor.constraint(equalTo: self.topAnchor),
            self.txt.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.txt.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.txt.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8)
        ])
    }

}
