//
//  ContentView.swift
//  Course Catalog
//
//  Created by Ted Cowan on 5/4/22 and modified on 03 June 2023.
//

//
//
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var courses = Courses();
    @State private var showOnlySelected = false
    
    var body: some View {
        
        VStack {
    Text("Course Catalog")
                .accessibilityIdentifier("title")
            List {
                ForEach(courses.coursesArray.indices, id: \.self) {
                    n in
                    if showOnlySelected && courses.coursesArray[n].selected ||
                        !showOnlySelected {
                        HStack {
                            if courses.coursesArray[n].selected {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                                    .accessibilityIdentifier("ischecked")
                            } else {
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                                    .accessibilityIdentifier("unchecked")
                            }

                            VStack (alignment: .leading) {

                                Text("\(courses.coursesArray[n].id)")
                                    .font(.title3)
                                    //.accessibilityIdentifier(courses.coursesArray[n].id)
                                    .accessibilityIdentifier(courses.coursesArray[n].id)
                                    .accessibilityValue(courses.coursesArray[n].id)
                                Text("\(courses.coursesArray[n].shortDesc)")
                                    .font(.subheadline)
                            }.padding(1)
                        }
                        .accessibilityValue(courses.coursesArray[n].shortDesc)

                        .onTapGesture {
                            courses.coursesArray[n].selected.toggle()
                        }
                    }
                }
            }
            .accessibilityIdentifier("coursesTable")


            HStack {
                Toggle("Show Only Selected Courses", isOn:  $showOnlySelected)
                    .toggleStyle(.button)
                    .accessibilityIdentifier("showOnlySelectedCoursesSwitch")
            }.padding(10)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

