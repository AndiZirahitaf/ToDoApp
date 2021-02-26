//
//  FormRowStaticView.swift
//  ToDo App
//
//  Created by AndyZett on 24/02/21.
//

import SwiftUI

struct FormRowStaticView: View {
    //MARK: Properties
    
    var icon: String
    var firstText: String
    var secondText: String
    
    
    
    //MARK: Body
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous).fill(Color(UIColor.gray))
                Image(systemName: icon)
                    .foregroundColor(.white)
            }//MARK: ZStack
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(firstText)
                .foregroundColor(Color(UIColor.gray))
            Spacer()
            Text(secondText)
        }//MARK: HStack
        
    }
}

//MARK: Preview
struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "ToDo")
            .previewLayout(.fixed(width: 375, height: 68))
            .padding()
    }
}
