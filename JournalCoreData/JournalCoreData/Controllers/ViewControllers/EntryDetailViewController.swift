//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Kyle Warren on 7/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - PROPERTIES
    var entry: Entry?
    
    //MARK: - LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    //MARK: - ACTIONS
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, bodyText: bodyTextView.text, timestamp: Date())
        } else {
            EntryController.shared.createEntry(title: title, bodyText: bodyTextView.text)
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    //MARK: - HELPER FUNCTIONS
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
} // End of Class
