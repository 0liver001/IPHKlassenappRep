//
//  ViewController.swift
//  GameLibrary
//
//  Created by Just Lenz on 29.11.21.
// Seien wir mal ehrlich, auch ohne das hier würdest du wissen, dass es von dir abstammt XD
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    //MARK: - Data
    //Unsere Daten
    //var games = ["Far Cry 6", "Battlefield 2042", "Fifa 22", "Back4Blood", "Hot Wheels Unleashed", "Forza Horizon 5", "Call of Duty Vanguard", "Riders Republic"]
    var allGames = gameData
    var selectedGame: GameModel?
    var filteredGames = gameData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Zugriff auf unsere Datensätze
        myTableView.dataSource = self
        myTableView.delegate = self
        mySearchBar.delegate = self
        
        //Design
        myTableView.rowHeight = 100
        myTableView.keyboardDismissMode = .onDrag
    }
    
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField();
        let alert = UIAlertController(title: "Neue Einstellung hinzufügen", message: "Geben Sie die Einstellungsart ein", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Hinzufügen", style: .default, handler: {(action) in
                                    //print("Hinzufügen gedrückt")
            if textField.text == "" || textField.text == nil {
                return
            }
            else
            {
                //test.gameName = textField.text!;
                //self.filteredGames.insert(test, at: 00);
                
                //indexpath anlegen
                let indpa = IndexPath(row: 0, section: 0);
                
                //self.filteredGames.insertRows(at: [indpa], with: .automatic)
            }
        })
        
        alert.addAction(action);
        alert.addTextField(configurationHandler: {(alertTextField) in
                            alertTextField.placeholder = "Einstellung"
                            textField = alertTextField
        })
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - Segues
    //Den nächsten VC "vorbereiten" anhand des Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBeschreibung" {
            //Zugriff auf den "Ziel VC"
            let zielTableVC = segue.destination as! BeschreibungTableViewController
            zielTableVC.game = selectedGame
        }
    }
}

//MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Design - nach click auf die TableViewCell, soll diese nicht mehr "markiert" sein
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        selectedGame = filteredGames[indexPath.row]
        //Segue soll an dem bestimmten indexPath der TableView ausgeführt werden
        performSegue(withIdentifier: "showBeschreibung", sender: nil)
    }
}

//MARK: - TableView DataSource
extension ViewController: UITableViewDataSource {
    
    //Die Anzahl der TableViewCells, basierend auf unser Daten-Array(-Objekt)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGames.count
    }
    
    //Was soll in der TableViewCell angezeigt werden -> CustomCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Setzen der Cell auf unser CustomCell mit Identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomGameTableViewCell
        
        //Bild und Text werden gesetzt, basierend auf unser Game-Objekt
        cell.gameLabel.text = filteredGames[indexPath.row].gameName
        
        return cell
    }
}

//MARK: - Searchbar Delegate
extension ViewController: UISearchBarDelegate {
    
    //Funktion wird ausgeführt bei jeder Eingabe in der SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        //Die Eingabe des Users soll in Klein-Schreibung umgewandelt werden
        let searchText = searchText.lowercased()
        
        //Wird ausgeführt wenn die Eingabe nicht leer ist:
        if searchText != "" {
            //Unser Filter
            filteredGames = allGames.filter({ game in
                //Die Datensätze sollen in Klein-Schreibung umgewandelt und überprüft werden
                if game.gameName.lowercased().contains(searchText) {
                    return true
                }
                return false
            })
            //Wird ausgeführt wenn die Eingabe leer ist:
        } else {
            //Hier sollen alle Games angezeigt werden, wenn keine Eingabe getätigt wurde
            filteredGames = allGames
        }
        print(filteredGames)
        //Die TableView soll während jeder Eingabe neugeladen werden
        self.myTableView.reloadData()
    }
}
