//
//  CinemaViewController.swift
//  SeSAC3Week6
//
//  Created by 백래훈 on 2023/08/23.
//

import UIKit
import CoreLocation // 1. 위치 임포트
import MapKit
import SnapKit

enum Cinemas: String {
    case megabox = "메가박스"
    case cgv = "CGV"
    case lotteCinema = "롯데시네마"
    case all = "전체보기"
}

class CinemaViewController: UIViewController {
    
    var cinemaList: [CinemaLocation] = [
        //MARK: - 메가박스
        // 메가박스 동대문 - 37.566741, 127.007481
        CinemaLocation(title: "메가박스 동대문", latitude: 37.566741, longitude: 127.007481),
        // 메가박스 홍대 - 37.555991, 126.922044
        CinemaLocation(title: "메가박스 홍대", latitude: 37.555991, longitude: 126.922044),
        // 메가박스 성수 - 37.541994, 127.044672
        CinemaLocation(title: "메가박스 성수", latitude: 37.541994, longitude: 127.044672),
        // 메가박스 신촌 - 37.559769, 126.941903
        CinemaLocation(title: "메가박스 신촌", latitude: 37.559769, longitude: 126.941903),
        
        //MARK: - CGV
        // CGV 명동 - 37.563368, 126.982872
        CinemaLocation(title: "CGV 명동", latitude: 37.563368, longitude: 126.982872),
        // CGV 구로 - 37.501136, 126.882770
        CinemaLocation(title: "CGV 구로", latitude: 37.501136, longitude: 126.882770),
        // CGV 여의도 - 37.525623, 126.925505
        CinemaLocation(title: "CGV 여의도", latitude: 37.525623, longitude: 126.925505),
        // CGV 신촌아트레온 - 37.556575, 126.940292
        CinemaLocation(title: "CGV 신촌아트레온", latitude: 37.556575, longitude: 126.940292),
        
        //MARK: - 롯데시네마
        // 롯데시네마 에비뉴엘 - 37.564191, 126.981633
        CinemaLocation(title: "롯데시네마 에비뉴엘", latitude: 37.564191, longitude: 126.981633),
        // 롯데시네마 가산디지털 - 37.477611, 126.888992
        CinemaLocation(title: "롯데시네마 가산디지털", latitude: 37.477611, longitude: 126.888992),
        // 롯데시네마 영등포 - 37.516190, 126.908323
        CinemaLocation(title: "롯데시네마 영등포", latitude: 37.516190, longitude: 126.908323),
        // 롯데시네마 용산 - 37.532800, 126.959707
        CinemaLocation(title: "롯데시네마 용산", latitude: 37.532800, longitude: 126.959707)
    ]
    
    // 2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    
    let mapView = MKMapView()
    
    let sortedButton = {
        var configuration = UIButton.Configuration.plain()
        var titleContainer = AttributeContainer()
        titleContainer.font = .systemFont(ofSize: 17, weight: .bold)
        configuration.attributedTitle = AttributedString("정렬", attributes: titleContainer)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        let button = UIButton(configuration: configuration)
        button.tintColor = .black
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        return button
    }()
    
    let currentLocationButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .default)
        let image = UIImage(systemName: "scope", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        //clipsToBounds가 먹질 않는다 이유가 뭘까?
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = button.frame.height / 2
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3. 위치 프로토콜 연결
        locationManager.delegate = self
        mapView.delegate = self
        
        [mapView, sortedButton, currentLocationButton].forEach {
            view.addSubview($0)
        }
        
        view.backgroundColor = .white
        
        mapView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        currentLocationButton.snp.makeConstraints {
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.width.height.equalTo(30)
        }
        
        sortedButton.snp.makeConstraints {
            $0.centerY.equalTo(currentLocationButton.snp.centerY)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        // 어떤 계층에 따라 무조건 적으로 실행되는 것이 아니기 때문에
        // 항상 viewDidLoad 안에서 호출할 수 있도록 하자.
        checkDeviceLocationAuthorization()
        
        // 새싹 영캠 위치 (center)
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        //        setRegionAndAnnotation(center: center)
        
        // 서울 시청
        let seoul = CLLocationCoordinate2D(latitude: 37.566713, longitude: 126.978428)
        setStationRegionAndAnnotation(center: seoul)
        
        filterAnnotation(keyword: Cinemas.all.rawValue)
        
        // scope 버튼 클릭 시
        currentLocationButton.addTarget(self, action: #selector(checkCurrentLocationAuthorization), for: .touchUpInside)
        
        sortedButton.addTarget(self, action: #selector(sortedAlert), for: .touchUpInside)
        
    }
    
    @objc func sortedAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let megabox = UIAlertAction(title: Cinemas.megabox.rawValue, style: .default) { _ in
            self.filterAnnotation(keyword: Cinemas.megabox.rawValue)
        }
        let cgv = UIAlertAction(title: Cinemas.cgv.rawValue, style: .default) { _ in
            self.filterAnnotation(keyword: Cinemas.cgv.rawValue)
        }
        let lotteCinema = UIAlertAction(title: Cinemas.lotteCinema.rawValue, style: .default) { _ in
            self.filterAnnotation(keyword: Cinemas.lotteCinema.rawValue)
        }
        let all = UIAlertAction(title: Cinemas.all.rawValue, style: .default) { _ in
            self.filterAnnotation(keyword: Cinemas.all.rawValue)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(megabox)
        alert.addAction(cgv)
        alert.addAction(lotteCinema)
        alert.addAction(all)
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
    }
    
    // 셋에서는 셋만 해주는 것으로 수정
    func setAnnotation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 30000, longitudinalMeters: 30000)
        
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    // 필터에서는 필터만 해주는 것으로 수정
    func filterAnnotation(keyword: String) {
        
        mapView.removeAnnotations(mapView.annotations)
        
        let value = keyword == Cinemas.all.rawValue ? cinemaList : cinemaList.filter {
            $0.title.contains(keyword)
        }
        
        value.forEach { item in
            setAnnotation(latitude: item.latitude, longitude: item.longitude, title: item.title)
        }
    }
    
    // 중심 선언 함수
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        // 지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)
        
        // 지도에 어노테이션 추가
        let annotation = MKPointAnnotation()
        annotation.title = "영캠입니당"
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
        
    }
    
    // 서울시청 중심 선언 함수
    func setStationRegionAndAnnotation(center: CLLocationCoordinate2D) {
        // 지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 30000, longitudinalMeters: 30000)
        mapView.setRegion(region, animated: true)
        
        // 지도에 어노테이션 추가
        let annotation = MKPointAnnotation()
        annotation.title = "서울의 중심입니다."
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
        
    }
    
    // 위치 권한 알림
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정 > 개인정보 보호'에서 위치 서비스를 활성화 해주세요.", preferredStyle: .alert)
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            // 설정에서 직접적으로 앱 설정 화면에 들어간적잉 없다면
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
                
                // 현재 사용자의 위치 권한 상태를 가지고 온다.
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
                print("위치 서비스가 꺼져있어 위치 권한 요청이 불가합니다.")
            }
        }
    }
    
    
    @objc func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print("check:", status)
        
        switch status {
        case .notDetermined:
            print("notDetermined")
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
            // scope 버튼을 클릭하면
            // @unknown default case로 접근되기 때문에
            // 이 부분에서 디바이스의 위치 체크 함수를 불러준다.
        @unknown default:
            print("default")
            checkDeviceLocationAuthorization()
        }
        
    }
    
}

// 4. 프로토콜 선언
extension CinemaViewController: CLLocationManagerDelegate {
    
    // 5. 사용자의 위치를 성공적으로 가지고 온 경우
    // 한 번만 실행되지 않고, iOS 위치 업데이트가 필요한 시점에 '알아서' 여러번 호출된다.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setRegionAndAnnotation(center: coordinate)
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

extension CinemaViewController: MKMapViewDelegate {
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
