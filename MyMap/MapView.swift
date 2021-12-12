//
//  MapView.swift
//  MyMap
//
//  Created by 田中雄大 on 2021/12/11.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var searchKey : String = "東京タワー"
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(
            searchKey,
            completionHandler: { (placemarks, error) in
                
                if let unwrapPlacemarks = placemarks,
                   let firstPlacemark = unwrapPlacemarks.first,
                   let location = firstPlacemark.location {
                    
                    let targetCoordinate = location.coordinate
                    print(targetCoordinate)
                    
                }
                
            }
        )
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー")
    }
}
