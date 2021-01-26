//
//  MasterViewController.swift
//  project4
//
//  Created by Juan Otavalo on 20/10/18.
//  Copyright © 2018 Juan Otavalo. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {


    //var model: Modelo!
    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var paisesInicial = Modelo()
    var indices:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        
        //model = Modelo()

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            //detailViewController?.model = paisesInicial
        }
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow{
                paisesInicial.getName(data: indexPath)
            }
            
        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            
            //let controller = segue.destination as! DetailViewController
            //print(controller.description)
            controller.modex = paisesInicial
            
        }
        
    }

    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        /*var names = ["Africa","Asia","Europe","North_America","Oceania","South_America"]
        var cont = 0
        var contador = 0
        //section = 3
        for m in 0...names.count-1{
            if(paisesInicial.getArrays(key: names[contador]).count>0){
                if(section == cont){
                    //print("names: \(names[contador])")
                    return names[contador]
                    cont += 1
                }
            }
            contador += 1
        }*/
        switch(section){
        case 0:
            return "Africa"
        case 1:
            return "Asia"
        case 2:
            return "Europa"
        case 3:
            return "Norteamerica"
        case 4:
            return "Oceania"
        case 5:
            return "Sudamerica"
        default:
            return nil
        }
        //return nil
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return paisesInicial.tamañoSeccion() //mio
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return paisesInicial.getArrays(key: "Africa").count
        case 1:
            return paisesInicial.getArrays(key: "Asia").count
        case 2:
            return paisesInicial.getArrays(key: "Europe").count
        case 3:
            return paisesInicial.getArrays(key: "North_America").count
        case 4:
           return paisesInicial.getArrays(key: "Oceania").count
        case 5:
            return paisesInicial.getArrays(key: "South_America").count
            default:
                return 0
        }
    }
    var verificator = 0
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        switch indexPath.section{
        case 0:
            
            cell.textLabel?.text = paisesInicial.getArrays(key: "Africa")[indexPath.row]
            cell.detailTextLabel?.text = "                                                                  Africa"
        case 1:
            cell.textLabel?.text = paisesInicial.getArrays(key: "Asia")[indexPath.row]
            cell.detailTextLabel?.text = "                                                              Asia"
        case 2:
            cell.textLabel?.text = paisesInicial.getArrays(key: "Europe")[indexPath.row]
            cell.detailTextLabel?.text = "                                                              Europa"
        case 3:
            cell.textLabel?.text = paisesInicial.getArrays(key: "North_America")[indexPath.row]
            cell.detailTextLabel?.text = "                                                      Norteamerica"
        case 4:
            cell.textLabel?.text = paisesInicial.getArrays(key: "Oceania")[indexPath.row]
            cell.detailTextLabel?.text = "                                                          Oceania"
        case 5:
            cell.textLabel?.text = paisesInicial.getArrays(key: "South_America")[indexPath.row]
            cell.detailTextLabel?.text = "                                                          Sudamerica"
        default:
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = ""

        }
        /*let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        return cell*/
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    
}

