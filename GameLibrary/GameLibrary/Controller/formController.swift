//
//  formController.swift
//  KlassenApp
//
//  Created by Hakan Yildiz / BBS2H20A on 22.12.21.
//

import UIKit

class formController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textfieldNach: UITextField!
    @IBOutlet weak var textfieldVor: UITextField!
    var schuelerVorname: [String] = []
    var schuelerNachname: [String] = []
    var result : String = "";
    @IBAction func sendText(_ sender: Any) {
        
        var result = textfieldVor.text! + " " + textfieldNach.text!;
    
    }

    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
