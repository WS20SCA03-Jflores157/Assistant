//
//  HomeViewController.swift
//  Assistant
//
//  Created by Jeffrey  on 10/17/20.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Controller Properties
    
    var data: AssistantParameters?//Property that holds mock data used to populate UI
    
    @IBOutlet weak var recentCommandsCollectionView: UICollectionView!
    
    @IBOutlet weak var mockUserDataTableView: UITableView!
    
    // MARK: - ViewCycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fill data property to populate UI with(database fetch simulation)
        data = AssistantParameters(recentCommands: [["Tag some Charges": "tag"],["Track a new Charge": "track"],["Track a new Payment": "track"], ["Tag some Payments": "tag"]], userDataTableSectionTitles: ["UPCOMING CHARGES", "KEEP TRACK OF THINGS"], recentCompaniesPaid: [["Amazon": "Refund \n$30 • By 17th July"]], upcomingCompaniesToPay: [["Spotify": "$30 to $50"], ["Netflix": "$20"], ["Verizon": "$60"]])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recentCommandsCollectionView.reloadData()
    }
    
    // MARK: - CollectionView DataDelegate Functions
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data?.recentCommands.count ?? 4 //Return number of commands saved in database
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.layer.cornerRadius = 35
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00).cgColor
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commandCell", for: indexPath as IndexPath) as! RecentCommandsCollectionViewCell
        
        //Set image and text for label and uiimageview inside cell with data from database fetch
        cell.commandIcon.image = UIImage(named: data?.recentCommands[indexPath.row].first?.value ?? "tag")
        cell.commandTitle.text = data?.recentCommands[indexPath.row].keys.first ?? ""
        
        return cell
    }
    
    
    
    // MARK: - TableView DataDelegate Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data?.userDataTableSectionTitles.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00).cgColor
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath as IndexPath) as! MockUserDataTableViewCell
        
        cell.subTitleImageView.image = UIImage(named: "subTitle" + "\(indexPath.section)")//Set section titles from data
        
        //Configure each section of the cell using storyboards template and programatically setting constraints
        if indexPath.section == 0{
            cell.dataTypeIcon[indexPath.row].image = UIImage(systemName: "circle.fill")
            cell.seeAllBtn.image = UIImage(named: "seeAllBtn")
            cell.companyTitle[indexPath.row].frame = CGRect(x: 26, y: 63, width: 90, height: 20)
            cell.dataTypeIcon[indexPath.row].frame = CGRect(x: 32, y: 95, width: 10, height: 10)
            cell.amountDue[indexPath.row].frame = CGRect(x: 55, y: 87, width: 109, height: 32)
            
            for index in 0...2{
                cell.companyTitle[index].text = data?.upcomingCompaniesToPay[index].keys.first ?? ""
                cell.amountDue[index].text = data?.upcomingCompaniesToPay[index].first?.value ?? ""
                
            }
        }
        else if indexPath.section == 1{
            cell.getInfoBtn.isHidden = false
            
            cell.companyTitle[indexPath.row].frame = CGRect(x: 103, y: 73, width: 90, height: 20)
            cell.companyTitle[indexPath.row].text = data?.recentCompaniesPaid[indexPath.row].keys.first ?? ""
            
            cell.amountDue[indexPath.row].frame = CGRect(x: 103, y: 97, width: 109, height: 32)
            cell.amountDue[indexPath.row].text = data?.recentCompaniesPaid[indexPath.row].first?.value ?? ""
            
            
            cell.dataTypeIcon[indexPath.row].frame = CGRect(x: 26, y: 77, width: 60, height: 60)
            cell.dataTypeIcon[indexPath.row].image = UIImage(named: "shoppingIcon")
            
            cell.dataTypeIcon[1].isHidden = true
            cell.dataTypeIcon[2].isHidden = true
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data?.userDataTableSectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = .white
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            return 300.0
        }
        return 175
    }
}
