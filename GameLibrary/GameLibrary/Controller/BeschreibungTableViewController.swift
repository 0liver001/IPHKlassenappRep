//
//  BeschreibungTableViewController.swift
//  GameLibrary
//
//  Created by Just Lenz on 29.11.21.
//

import UIKit

class BeschreibungTableViewController: UITableViewController {

    @IBOutlet weak var gameImageB: UIImageView!
    @IBOutlet weak var gameLabelB: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    //Zugriff auf das Game-Objekt
    var game: GameModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Design - leerer TableViewFooter, falls die TableView nicht genügend Cells hat
        tableView.tableFooterView = UIView()
        
        //gameImageB.image = UIImage(named: game?.imageName ?? "apex")
        gameLabelB.text = game?.gameName
        genreLabel.text = game?.genre
        publishedLabel.text = game?.published
        priceLabel.text = game?.price
    }
}
