//
//  colorsTableVC.swift
//  randomColors
//
//  Created by Иван Мрасов on 27.12.2023.
//

import UIKit

class colorsTableVC: UIViewController {
    
    var colors: [UIColor] = []
    
    enum Cells {
       static let ColorCell = "colorCell"
    }
    
    enum Segues {
        static let toColorDetailVC = "ToColorDetailVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    
    
    func addRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! colorDetailsVC
        destVC.color = sender as? UIColor
    }
}


extension colorsTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.ColorCell) else {
            return UITableViewCell()
        }
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        
        performSegue(withIdentifier: Segues.toColorDetailVC, sender: color)
    }
}
