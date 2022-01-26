//
//  AccommodationsViewController.swift
//  Xoomra
//
//  Created by Nur Rony on 22/01/2022.
//

import UIKit

class AccommodationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)

        /// Call Private function
        setupUI()
        setupTableView()
        
    }
    
    // MARK: - Private Methods.
    
    private func setupUI(){
        tableView.separatorStyle = .none
    }
    private func setupTableView(){
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Button Action.
    
    

}

extension AccommodationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select index--: ", indexPath.row)
        
        let storyboard = storyboard?.instantiateViewController(withIdentifier: "AccommodationsDetailsViewController")
        self.navigationController?.pushViewController(storyboard!, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400;//Choose your custom row height
    }
}
