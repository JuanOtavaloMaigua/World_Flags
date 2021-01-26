//
//  Modelo.swift
//  project4
//
//  Created by Juan Otavalo on 21/10/18.
//  Copyright © 2018 Juan Otavalo. All rights reserved.
//

import Foundation

class Modelo{
    
    //atributos
     private var paisesContinentes = [String:[String]]()
    
    //funciones
    
    init(){
            let paths = Bundle.main.paths(forResourcesOfType: "png", inDirectory: nil) as![NSString]
            var allInformation: [String] = []
        
        var paisesAfricanos:[Any]! = []
            var paisesAsiaticos:[String] = []
            var paisesEuropeos:[String] = []
            var paisesNorteamericanos:[String] = []
            var paisesOceania:[String] = []
            var paisesSurAmerica:[String] = []
        
        for path in paths {
            if !path.lastPathComponent.hasPrefix("AppIcon") {
                allInformation.append(path.lastPathComponent)
            }
        }
        
        for filename in allInformation{
            var region = filename.components(separatedBy: "-")[0]
            //region.removeLast(4)
            //region = region.components(separatedBy: ".")[0]
            //region.replacingOccurrences(of: " ", with: "-")
            var pais = filename.components(separatedBy: "-")[1]
            //pais.removeLast(4)
            
            //pais = pais.components(separatedBy: ".")[0]
            switch(region){
                case "Africa":
                    paisesAfricanos.append(pais.components(separatedBy: ".")[0])
                case "Asia":
                    paisesAsiaticos.append(pais.components(separatedBy: ".")[0])
                case "Europe":
                        paisesEuropeos.append(pais.components(separatedBy: ".")[0])
                case "North_America":
                            paisesNorteamericanos.append(pais.components(separatedBy: ".")[0])
                case "Oceania":
                    paisesOceania.append(pais.components(separatedBy: ".")[0])
                default:
                    paisesSurAmerica.append(pais.components(separatedBy: ".")[0])
            }
            
        }
            paisesContinentes.updateValue(paisesAfricanos as! [String] , forKey: "Africa")
            paisesContinentes.updateValue(paisesAsiaticos as! [String], forKey: "Asia")
            paisesContinentes.updateValue(paisesEuropeos as [String], forKey: "Europe")
            paisesContinentes.updateValue(paisesNorteamericanos as! [String], forKey: "North_America")
            paisesContinentes.updateValue(paisesOceania as [String], forKey: "Oceania")
            paisesContinentes.updateValue(paisesSurAmerica as [String], forKey: "South_America")
        
    }
    
    func tamañoSeccion()->Int{
        return paisesContinentes.count
    }
    
    func getArrays(key:String)->Array<String>{
        var resp = paisesContinentes[key] as! [String]
        resp.sort()
        
        return resp
    }
    
    private var pathImage = ""
    private var IndiceG = IndexPath.init()
    func getName(data:IndexPath){
        
        var continentes = ["Africa","Asia","Europe","North_America","Oceania","South_America"]

        var count = 0
        var count2 = 0
        for contine in 0...continentes.count-1{
            
                for sim in 0...getArrays(key:continentes[count2]).count{
                    if(data == [count2,count]){
                        pathImage = continentes[count2]+"-"+getArrays(key: continentes[count2])[count] + ".png"
                        IndiceG = data
                        break
                    }
                    count += 1
                }
        
        count = 0
            count2 += 1
        }
    }
    
    func changeImage()->String{
        return pathImage
    }
    
    func continentCountry()->String{
        var res = pathImage
        res.replacingOccurrences(of: " ", with: "-")
        res.removeLast(4)
        return res
    }
}
