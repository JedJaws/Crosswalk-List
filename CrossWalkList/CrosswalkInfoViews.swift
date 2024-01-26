//
//  CrosswalkInfoView.swift
//  CrossWalkList
//
//  Created by Paul Inventado on 3/21/22.
//

import SwiftUI

struct CrossWalkInfo: View {
    var body: some View {
        VStack {
            List {
                Section(header: Text("Crosswalk")) {
                    Text("Crosswalk name")
                    Text("Crosswalk address")
                }
                Section(header: Text("Volunteer")) {
                    Text("Volunteer")
                    DisclosureGroup(content: {
                        Text("Minors")
                        Text("Adults")
                        Text("Seniors")
                    }) {
                        Text("Maximum hours")
                    }
                }
            }
            Spacer()
        }
    }
}

struct CrossWalkInfoWithLinks: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Crosswalk")) {
                        NavigationLink(destination: Text("Name of the crosswalk")) {
                            Text("Crosswalk name")
                        }
                        NavigationLink(destination: Text("Address of the crosswalk")) {
                            Text("Crosswalk address")
                        }
                    }
                    Section(header: Text("Volunteer")) {
                        NavigationLink(destination: Text("Name of the volunteer")) {
                            Text("Volunteer")
                        }
                        DisclosureGroup(content: {
                            NavigationLink(destination: Text("Minors can only volunteer for 1 hour and accompanied by an adult.")) {
                                Text("Minors")
                            }
                            NavigationLink(destination: Text("Adults can volunteer for a maximum of 3 hours.")) {
                                Text("Adults")
                            }
                            NavigationLink(destination: Text("Seniors can volunteer for a maximum of 2 hours.")) {
                                Text("Seniors")
                            }
                        }) {
                            Text("Maximum hours")
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct Element: Identifiable {
    var id = UUID()
    var name: String
    var description: String?
    var childNodes: [Element]?
}

struct CrossWalkInfoOutlineGroup: View {
    @State var info = [
        Element(name: "Crosswalk name", description: "Name of the crosswalk"),
        Element(name: "Crosswalk address", description: "Address of the crosswalk"),
        Element(name: "Volunteer", description: "Name of the volunteer"),
        Element(name: "Maximum hours", childNodes: [
            Element(name: "Minors", description: "Minors can only volunteer for 1 hour and accompanied by an adult"),
            Element(name: "Adults", description: "Adults can volunteer for a maximum of 3 hours."),
            Element(name: "Seniors", description: "Seniors can volunteer for a maximum of 2 hours.")
        ])
    ]
    var body: some View {
        NavigationView {
            VStack {
                List(info, children: \.childNodes) {
                    element in
                    if let description = element.description {
                        NavigationLink(destination: Text(description)) {
                            Text("\(element.name)")
                        }
                    } else {
                        Text("\(element.name)")
                    }
                }
                Spacer()
            }
        }
    }
}
