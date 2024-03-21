//
//  FamilyTableViewController.swift
//  introduceYourFamily
//
//  Created by Derek Stengel on 3/21/24.
//

import UIKit

class FamilyTableViewController: UITableViewController {

    var cellDisplays: [FamilyMember] = [
        FamilyMember(symbol: "👫", familyName: "Stengel Family", who: "This is my parents and my siblings."),
        FamilyMember(symbol: "👰🏽‍♀️", familyName: "Married Family", who: "This is my wife and I.")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelectionDuringEditing = true // this allows us to move things during editing mode
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    } // this sets up our editing button
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FamilyCell", for: indexPath)
        let family = cellDisplays[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "\(family.symbol) - \(family.familyName)"
        content.secondaryText = "\(family.who)"
        cell.contentConfiguration = content
        
        return cell
    } // this changes what the text says and what gets displayed in the default cells
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return cellDisplays.count
        } else {
            return 0
        }
    } // this sets how many rows you can have
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let family = cellDisplays[indexPath.row]
        print("\(family.symbol) \(indexPath)")
        
        // this allows you to select a row
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedFamily = cellDisplays.remove(at: sourceIndexPath.row)
        cellDisplays.insert(movedFamily, at: destinationIndexPath.row)
        
        // this allows rows to move
        
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    } // this removes the delete button in our editing mode
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail", let indexPath = tableView.indexPathForSelectedRow {
            let selectedFamilyMember = cellDisplays[indexPath.row]
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.selectedFamilyMember = selectedFamilyMember
            } // this is the segue that allows us to choose one cell and it go to the corresponding stack view.
        }
    }
}

