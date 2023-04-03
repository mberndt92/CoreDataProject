//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Maximilian Berndt on 2023/04/03.
//

import CoreData
import SwiftUI

enum FilterPredicates: String {
    case beginsWith = "BEGINSWITH"
    case equals = "=="
    case contains = "CONTAINS"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }

    init(
        filterKey: String,
        filterPredicate: FilterPredicates = .beginsWith,
        filterValue: String,
        sortDescriptors: [SortDescriptor<T>] = [],
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        let predicate = NSPredicate(format: "%K \(filterPredicate.rawValue) %@", filterKey, filterValue)
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: predicate)
        self.content = content
    }
}
