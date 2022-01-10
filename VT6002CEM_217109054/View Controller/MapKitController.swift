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

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
            super.viewDidLoad()
    }
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(animated)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location = locations.first {
            locationManager.stopUpdatingLocation()
            
            render(location)
        }
    }
    func render(_ location:CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
    
    @IBAction func logoutButton_Tapped(_ sender: Any) {
        let auth = Auth.auth()

        do{
           try auth.signOut()
           let defaults = UserDefaults.standard
           defaults.set(false, forKey: "isUserSignedIn")
           self.dismiss(animated: true, completion: nil)
           }catch let signOutError {
           self.present(Service.createAlertController(title: "Error", message: signOutError.localizedDescription), animated:true ,completion: nil)
            }
            }

}
