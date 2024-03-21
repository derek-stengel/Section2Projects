//
//  DetailViewController.swift
//  introduceYourFamily
//
//  Created by Derek Stengel on 2/28/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var wifeStackView: UIStackView!
    @IBOutlet weak var familyStackView: UIStackView!
    
    var selectedFamilyMember: FamilyMember?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
    }
    
    func configureStackView() {
        if let selectedMember = selectedFamilyMember {
            if selectedMember.familyName == "Stengel Family" {
                wifeStackView.isHidden = true
                familyStackView.isHidden = false
            } else if selectedMember.familyName == "Married Family" {
                wifeStackView.isHidden = false
                familyStackView.isHidden = true
            }
        }
    }
    
}
