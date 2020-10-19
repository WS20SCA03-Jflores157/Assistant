//
//  MockData.swift
//  Assistant
//
//  Created by Jeffrey  on 10/17/20.
//

import Foundation

struct AssistantParameters {
    
    var recentCommands: [[String:String]]//Property used to populate horizontal collectionview
    
    var userDataTableSectionTitles: [String]//Property used to populate section header titles in tableview
    
    //Properties used to populate mock user data on tableview
    var recentCompaniesPaid: [[String:String]]
    var upcomingCompaniesToPay: [[String:String]]
    
}

