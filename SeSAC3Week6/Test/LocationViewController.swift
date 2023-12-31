//
//  LocationViewController.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/22.
//

import UIKit
import CoreLocation // 1. 위치 임포트
import MapKit
import SnapKit

class LocationViewController: UIViewController {

    // 2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    
    let mapView = MKMapView()
    let bhcButton = UIButton()
    let obabButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        [mapView, bhcButton, obabButton].forEach {
            view.addSubview($0)
        }
        
        view.backgroundColor = .white
        
        mapView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        bhcButton.backgroundColor = .red
        bhcButton.addTarget(self, action: #selector(cafeButtonClicked), for: .touchUpInside)
        bhcButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(50)
            make.leading.equalTo(view).offset(100)
        }
        
        obabButton.backgroundColor = .blue
        obabButton.addTarget(self, action: #selector(foodButtonClicked), for: .touchUpInside)
        obabButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(50)
            make.trailing.equalTo(view).offset(-100)
        }
        
        // 3. 위치 프로토콜 연결
        locationManager.delegate = self
        
        // 어떤 계층에 따라 무조건 적으로 실행되는 것이 아니기 때문에
        // 항상 viewDidLoad 안에서 호출할 수 있도록 하자.
        checkDeviceLocationAuthorization()
        
        // 새싹 영캠 위치 (center)
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        setRegionAndAnnotation(center: center)
        
        setAnnotation(type: 0)
        
    }
    
    @objc func cafeButtonClicked() {
        setAnnotation(type: 1) // 1
        print(#function)
    }
    
    @objc func foodButtonClicked() {
        print(#function)
    }
    
    func setAnnotation(type: Int) {
//        37.517746, 126.887131 // 오밥
//        37.518968, 126.886214 // BHC
        
        // 좌표가 여러개라면 반복문으로 좀 더 간결하게 작성 가능할 것이다.
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 37.517746, longitude: 126.887131)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.518968, longitude: 126.886214)
        
        if type == 0 { //viewDidLoad
            mapView.addAnnotations([annotation1, annotation2])
        } else if type == 1 {
            // 지역과 전역에 대한 변수 및 상수의 범위에 따라 기능이 실행이되고 그렇지 않을 수 있다.
            // mapView.removeAnnotation(annotation1)
            
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation2])
        }
    }
    
    // 중심 선언 함수
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        // 지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)
        
        // 지도에 어노테이션 추가
        let annotation = MKPointAnnotation()
        annotation.title = "영캠이예요."
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
        
    }
    
    // 위치 권한 알림 
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정 > 개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            
            // 설정에서 직접적으로 앱 설정 화면에 들어간적이 없다면
            // 한 번도 설정 앱에 들어가지 않았거나, 막 다운받은 앱이라서
            // 설정 페이지로 넘어갈지, 설정 상세 페이지 결정 X
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    //iOS 위치 서비스 활성화 체크
    func checkDeviceLocationAuthorization() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                
                // 현재 사용자의 위치 권한 상태를 가지고 옴
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
                
            } else {
                print("위치 서비스가 꺼져있어 위치 권한 요청이 불가하다.")
            }
        }
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print("check", status)
        
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization() // 얼럿, info.plist
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showLocationSettingAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            //didUpdateLocation 메서드 실행
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        // 위치 권한 종류가 더 생길 가능성에 대한 대비
        @unknown default:
            print("default")
        }
    }
}

// 4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
    
    // 5. 사용자의 위치를 성공적으로 가지고 온 경우
    // 한 번만 실행되지 않고, iOS 위치 업데이트가 필요한 시점에 알아서 여러번 호출된다.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setRegionAndAnnotation(center: coordinate)
            // 날씨 API 호출
            
        }
        locationManager.stopUpdatingLocation()
        
    }
    
    // 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    // 사용자의 권한 상태가 바뀔 때를 알려준다.
    // 거부했다가 설정에서 변경을 했거나, 혹은 notDetermined 상태에서 허용을 했거나
    // 허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    // iOS14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }
    
    // 사용자의 권한 상태가 바뀔 때를 알려준다.
    // iOS 14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
}

extension LocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print(#function)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        print(#function)
//    }
    
}
