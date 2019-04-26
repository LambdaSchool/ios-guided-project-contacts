//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Andrew R Madsen on 6/21/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDefinition" {
            guard let detailVC = segue.destination as? DetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            detailVC.contact = contacts[indexPath.row]
        }
    }
    
    let contacts = ["Aaron", "Anna", "Chris"]
}
