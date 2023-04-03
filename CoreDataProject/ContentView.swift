//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Maximilian Berndt on 2023/04/03.
//

import SwiftUI

import CoreData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        VStack {
            FilteredList(
                filterKey: "fullName",
                filterPredicate: .contains,
                filterValue: "United",
                sortDescriptors: [
                    SortDescriptor(\Country.fullName, order: .reverse)
                ]
            ) { (country: Country) in
                Section(country.wrappedFullName) {
                    ForEach(country.candyArray, id: \.self) { (candy: Candy) in
                        Text(candy.wrappedName)
                    }
                }
            }
            
            Button("Add") {
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: moc)
                candy3.name = "Twix"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"
                
                let candy4 = Candy(context: moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"
                
                let candy5 = Candy(context: moc)
                candy5.name = "Mocclate"
                candy5.origin = Country(context: moc)
                candy5.origin?.shortName = "US"
                candy5.origin?.fullName = "United States"
                
                try? moc.save()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
