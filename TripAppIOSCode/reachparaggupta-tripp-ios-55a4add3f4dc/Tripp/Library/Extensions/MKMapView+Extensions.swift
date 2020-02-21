//
//  MKMapView+Extensions.swift
//  Tripp
//
//  Created by MOHAVE on 22/02/20.
//  Copyright © 2020 Appster. All rights reserved.
//

import Foundation
import UIKit
import MapKit


extension MKMapView {

    func moveMapTolocation(_ location: CLLocation) {
        var region = MKCoordinateRegion()
        region.center = location.coordinate
        var span = MKCoordinateSpan()
        span.latitudeDelta = 0.05
        span.longitudeDelta = 0.05
        region.span = span
        self.setRegion(region, animated: true)
    }
    
    func clear() {
        self.clear_annotations()
        self.clear_overlays()
    }
    
    func clear_annotations() {
        self.removeAnnotations(self.annotations)
    }
    
    func clear_overlays() {
        self.removeOverlays(self.overlays)
    }
    
    func addWishLocationMarker(_ wish: LocationWish) {
        /*let marker = LocationWishMarker(position: wish.coordinate())
        marker.locationWish = wish
        marker.icon = wish.isCompleted == 0 ? UIImage(named: starMarkerBlue) : UIImage(named: starMarkerGreen)
        //marker.map = self
        */
        
        /*let annotationView = MKAnnotationView.init()
        annotationView.image = wish.isCompleted == 0 ? UIImage(named: starMarkerBlue) : UIImage(named: starMarkerGreen)
        annotationView.annotation = MKAnnotation.
        self.addAnnotation(annotationView)*/
       }
    
    func drawRoute(route: Route){
        
        /*if route.drivingMode == TripType.Aerial.rawValue{
            self.drawAerialTrip(route, shouldClear: false)
        }else if route.drivingMode == TripType.Sea.rawValue{
            self.drawSeaTripWithoutClearMap(route)
        }else if route.drivingMode == TripType.Road.rawValue{
            if route.role == UserRole.Admin.rawValue{
                self.drawTrip(route: route, color: route.routeColor())
            }else if route.role == UserRole.Biker.rawValue{
                self.drawTrip(route: route, color: UIColor.tripColor())
            }
        }*/
        self.removeOverlays(self.overlays)
        crumbPathRenderer = nil
        self.addOverlay(self.crumbs!, level: .aboveRoads)
        
        let r = self.crumbs!.boundingMapRect
        var pts: [MKMapPoint] = [
            MKMapPoint(x: r.minX, y: r.minY),
            MKMapPoint(x: r.minX, y: r.maxY),
            MKMapPoint(x: r.maxX, y: r.maxY),
            MKMapPoint(x: r.maxX, y: r.minY),
        ]
        let count = pts.count
        let boundingMapRectOverlay = MKPolygon(points: &pts, count: count)
        self.map.addOverlay(boundingMapRectOverlay, level: .aboveRoads)
    }
}

