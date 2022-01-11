//
//  MapKitController.swift
//  VT6002CEM_217109054
//
//  Created by User on 10/1/2022.
//

import UIKit
import MapKit
import CoreLocation
import Firebase

class MapKitController: UIViewController,CLLocationManagerDelegate{

    //connect map view
    @IBOutlet weak var mapView: MKMapView!
    var locationManager : CLLocationManager?
    
    //add the location lat and lon
        var annotations = [MKPointAnnotation]();
    override func viewDidLoad() {
     super.viewDidLoad()
     if CLLocationManager.locationServicesEnabled() {
     self.locationManager = CLLocationManager();
     self.locationManager?.delegate = self;
     if CLLocationManager.authorizationStatus() != .authorizedAlways {
     self.locationManager?.requestAlwaysAuthorization();
         
         let Annotation = MKPointAnnotation();
         Annotation.coordinate = CLLocationCoordinate2D(latitude: 22.33110107335519, longitude: 114.15992503948696);
         Annotation.title = "Leung So Kee Umbrella";
         self.annotations.append(Annotation);

            let Annotation2 = MKPointAnnotation();
            Annotation2.coordinate = CLLocationCoordinate2D(latitude: 22.330852878125494, longitude: 114.1634119511545);
            Annotation2.title = "Hop Hing Umbrella";
            self.annotations.append(Annotation2);

            let Annotation3 = MKPointAnnotation();
            Annotation3.coordinate = CLLocationCoordinate2D(latitude: 22.314161950770153, longitude: 114.2255042884162);
            Annotation3.title = "Sam Hung Hong";
            self.annotations.append(Annotation3);

            let Annotation4 = MKPointAnnotation();
            Annotation4.coordinate = CLLocationCoordinate2D(latitude: 22.329833713037363, longitude: 114.16403198546008);
            Annotation4.title = "sunrise1842";
            self.annotations.append(Annotation4);

            let Annotation5 = MKPointAnnotation();
            Annotation5.coordinate = CLLocationCoordinate2D(latitude: 22.312661234240014, longitude: 114.22197836934485);
            Annotation5.title = "Tung Sing Umbrella (Hong Kong) Enterprise Company";
            self.annotations.append(Annotation5);
         //show umbrella location here

         self.mapView?.addAnnotations(self.annotations);
     }
     else {
     self.setupAndStartLocationManager();
     }
     }
     }

     //for in-app authorization event
     func locationManager(_ manager: CLLocationManager,
     didChangeAuthorization status: CLAuthorizationStatus) {
     if status == .authorizedAlways {
     self.setupAndStartLocationManager();
     }
     }

     func setupAndStartLocationManager(){
     self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest;
     self.locationManager?.distanceFilter = kCLDistanceFilterNone;
     self.locationManager?.startUpdatingLocation();
     }
    
    func locationManager(_ manager: CLLocationManager,
     didUpdateLocations locations: [CLLocation]) {
     if let location = locations.last {
     
     let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01);
     let coord = location.coordinate;
     let region = MKCoordinateRegion(center: coord, span: span)
     self.mapView?.setRegion(region, animated: false);
     }
     }
        
    }

