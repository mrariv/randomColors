//
//  colorDetailsVC.swift
//  randomColors
//
//  Created by Иван Мрасов on 27.12.2023.
//

import UIKit

class colorDetailsVC: UIViewController {

    var color: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = color ?? .blue

    }
}
