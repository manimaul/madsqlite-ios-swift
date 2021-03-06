//
//  ViewController.swift
//  Example
//
//  Created by William Kamp on 12/13/16.
//  Copyright © 2016 William Kamp. All rights reserved.
//

import UIKit
import MadSqliteSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        pathDb()
        namedDb()
    }
    
    func pathDb() {
        let directory = NSSearchPathForDirectoriesInDomains(.applicationDirectory, .userDomainMask, true).first!
        if !FileManager.default.fileExists(atPath: directory) {
            try? FileManager.default.createDirectory(at: URL(fileURLWithPath: directory), withIntermediateDirectories: true, attributes: nil)
        }
        print(directory)
        if let md = MadDatabase(path: directory + "/mydb.s3db") {
            checkDb(md)
        }
    }
    
    func namedDb() {
        // Open / create database
        let md = MadDatabase(name: "mydb")
        checkDb(md)
    }
    
    func checkDb(_ md: MadDatabase) {
        // Execute sql statement
        md.exec(sql: "CREATE TABLE location_table(name TEXT, " +
            "latitude REAL, " +
            "longitude REAL, " +
            "image BLOB);")
        
        // Insert in database
        let cv = MadContentValues()
        cv.putString(key: "name", value: "Cheshire Cat")
        cv.putReal(key: "latitude", value: 51.2414945)
        cv.putReal(key: "longitude", value: -0.6354629)
        let result = md.insert(table: "location_table", values: cv)
        print("Insert result: \(result)")
        
        // Query database
        let query = md.query(sql: "SELECT name, latitude, longitude FROM location_table WHERE name=?", args: ["Cheshire Cat"])
        if (query.moveToFirst()) {
            while !(query.isAfterLast()) {
                let name = query.getString(column: 0)
                let latitude = query.getReal(column: 1)
                let longitude = query.getReal(column: 2)
                print("Name: \(name) Latitude: \(latitude) Longitude: \(longitude)")
                _ = query.moveToNext()
            }
        }
    }

}

