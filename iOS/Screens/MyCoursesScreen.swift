//
//  MisCursosScreen.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import SwiftUI

private let cursos = ["Proyecto final", "Proyecto final", "Proyecto final"]

struct MyCoursesScreen: View {
    private let padding: CGFloat = 20
    private let widthForHeader = UIScreen.main.bounds.width - (16 * 2)
    private let coursesViewModel = CoursesViewModel()
    
    init(){
        coursesViewModel.getCourses { courses, error in
            if (error != nil) {
                print("Error \(error!)")
                return
            }
            print("Courses \(courses!)")
        }
        UITableView.appearance().backgroundColor = UIColor(Colors.darkBackground)
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(alignment: .leading){
                    Text(Strings.mycourses).foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(width: abs(geometry.size.width - (padding * 2)),
                               alignment: .leading)
                    
                    List {
                        ForEach(cursos, id:\.self) { course in
                            VStack(alignment: .leading, spacing: 0){
                                CourseCell(title: "\(course)")
                                NavigationLink(destination: PlayerScreen()) {
                                    EmptyView().frame(height: 0)
                                }
                            }
                        }.listRowBackground(Colors.darkBackground)
                    }
                }.frame(height: geometry.size.height, alignment: .top)
                .background(Colors.darkBackground)
            }
        }.background(Colors.darkBackground)
    }
    
    func getCourses() {
//        coursesViewModel.onFetchCoursesFailure
    }
}

struct MyCoursesScreen_Previews: PreviewProvider {
    static var previews: some View {
        MyCoursesScreen()
    }
}
