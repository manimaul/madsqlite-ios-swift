# MadSqlite iOS Swift Framework

[![Build Status](https://travis-ci.org/manimaul/madsqlite-ios-swift.svg?branch=master)](https://travis-ci.org/manimaul/madsqlite-ios-swift)

 * A simple [Sqlite](https://sqlite.org) abstraction
 * [FTS5](https://sqlite.org/fts5.html) and [RTree](https://www.sqlite.org/rtree.html) extension modules enabled
 * [BSD License](LICENSE.md)


MadSqlite is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MadSqliteSwift', '~> 0.2.3'
```
or bleeding edge:
```ruby
pod 'MadSqliteSwift', :git => 'https://github.com/manimaul/madsqlite.git'
```

####Example

```swift
import MadSqliteSwift

// ...

// Open / create database
let md = MadDatabase(name: "mydb.s3db")

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
NSLog("Insert result: \(result)")

// Query database
let query = md.query(sql: "SELECT name, latitude, longitude FROM location_table WHERE name=?", args: ["Cheshire Cat"])
if (query.moveToFirst()) {
    while !(query.isAfterLast()) {
        let name = query.getString(column: 0)
        let latitude = query.getReal(column: 1)
        let longitude = query.getReal(column: 2)
        NSLog("Name: \(name) Latitude: \(latitude) Longitude: \(longitude)")
        _ = query.moveToNext()
    }
}
```
