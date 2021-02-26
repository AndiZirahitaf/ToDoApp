//
//  EmptyListView.swift
//  ToDo App
//
//  Created by AndyZett on 19/02/21.
//

import SwiftUI

struct EmptyListView: View {
    
    //MARK: Properties
    
    let image: [String] = [
        "illustration-no3",
        "illustration-no1",
        "illustration-no2"
    ]
    
    let tips: [String] = [
        "Ayo Sekolah di IDN",
        "Sudahkah Anda Sholat?",
        "List Kegiatan-kegiatan Anda Agar Meningkatkan Tingkat Efisiensi"
    ]
    
    var body: some View {
        ZStack{
            VStack{
                Text("\(tips.randomElement() ?? self.tips[0])")
                    .layoutPriority(0.5)
                    .font(.system(.headline,design: .rounded))
                
                Image("\(image.randomElement() ?? self.image[0])")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                    
               
            }//MARK: VStack
        }//MARK: ZStack
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
