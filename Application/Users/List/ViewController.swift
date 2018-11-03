//
//  ViewController.swift
//  Test
//
//  Created by profesor on 27/10/18.
//  Copyright © 2018 uninorte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var users = [
        User(name: "Jose", country: .colombia),
        User(name: "Pedro", country: .venezuela),
        User(name: "Maria", country: .mexico)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? DetailsViewController else {
            return
        }
        guard let user = sender as? User else {
            return
        }
        viewController.user = user
    }
    
    func showDetails(user: User) {
        if user.country == .colombia {
            performSegue(withIdentifier: "Details", sender: user)
        } else {
            showErrorAlert()
        }
    }
    
    func showErrorAlert() {
        let alertController = UIAlertController(title: "Error", message: "No disponible", preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(acceptAction)
        present(alertController, animated: true, completion: nil)
    }
    
}