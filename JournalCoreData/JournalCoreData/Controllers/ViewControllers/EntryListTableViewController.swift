//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by Kyle Warren on 7/26/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        EntryController.shared.fetchEntires()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EntryController.shared.entries.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        let entry = EntryController.shared.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.timestamp?.dateAsString()
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            
//            let entryToDelete = EntryController.shared.entries[indexPath.row]
//            
//            EntryController.shared.deleteEntry(entry: entryToDelete)
//            
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        
//            
//        }
//    }

//MARK: - NAVIGATION

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
              let destination = segue.destination as? EntryDetailViewController else { return }
        
        let entry = EntryController.shared.entries[indexPath.row]
        destination.entry = entry
    }
    
}
