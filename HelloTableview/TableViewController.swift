//
//  TableViewController.swift
//  HelloTableview
//
//  Created by Екатерина Зимина on 25.01.16.
//  Copyright © 2016 Екатерина Зимина. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var items:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
            }
    
    func setupData() {
        
        //семейства шрифтов в виде массива строк с их названиями
       let familyNames = UIFont.familyNames()
        
        // для названия каждого семейства шрифтов
        for afamilyName in familyNames {
            
            // найдем все
            let allFontsOfThisfamily:[String] = UIFont.fontNamesForFamilyName(afamilyName)
            
            items += allFontsOfThisfamily
        }
    }
}
//поддерживаем протокол UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    
}
extension TableViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //убедимся, что у нас есть какие-то элементs для отображения
      
                    return items.count
}
    // indexPath - это адрес ячейки в таблице
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //запросить прототип ячейки у TaleView
        let cell = tableView.dequeueReusableCellWithIdentifier("JustACellID", forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
        
    }
}