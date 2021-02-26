//
//  FormRowLinkView.swift
//  ToDo App
//
//  Created by AndyZett on 24/02/21.
//

import SwiftUI


struct FormRowLinkView: View {
    //MARK: Properties
    
    var icon: String
    var color: Color
    var text: String
    var link: String
    
    
    
    
    //MARK: Body
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous).fill(color)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }//MARK: ZStack
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text)
                .foregroundColor(Color(UIColor.gray))
            Spacer()
            
            Button(action: {
                //Bukalink
                guard let url = URL(string: self.link),
                      UIApplication.shared.canOpenURL(url) else {
                    return
                }
                UIApplication.shared.open(url as URL)
            }) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                
            }//MARK: Button buka link
            .accentColor(Color(.systemGray))
        }//MARK: HStack
    }
}

struct FormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowLinkView(icon: "globe", color: Color.pink, text: "Facebook", link: "www.facebook.com")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
