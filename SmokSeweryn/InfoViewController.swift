//
//  InfoViewController.swift
//  SmokSeweryn
//
//  Created by Sebastian on 14.02.2017.
//  Copyright © 2017 skaletka. All rights reserved.
//

import UIKit

enum Smog {
	case pm10
	case pm25
	case no2
}

class InfoViewController: UIViewController {
	
	var smogType: Smog!
    
	@IBOutlet weak var infoTextView: UITextView!
	
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		switch smogType! {
		case Smog.pm10:
			infoTextView.text = "Drobny pył zawieszony PM10 (particulate matter) jest mieszaniną substancji organicznych i nieorganicznych zawierającą substancje toksyczne, takie jak wielopierścieniowe węglowodory aromatyczne (m.in. benzo(a)piren, metale ciężkie oraz dioksyny i furany). \n\nPoziom dopuszczalny stężenia średniodobowego dla pyłu PM10 wynosi 50 µg/m3 i może być przekraczany nie więcej niż 35 razy w ciągu roku. \nPoziom dopuszczalny stężenia średniorocznego wynosi 40 µg/m3.\n200 µg/m3 to poziom informowania dla stężenia 24-godzinnego.\n300 µg/m3 to poziom alarmowy dla stężenia 24-godzinnego.\n\nPył przedostaje się do organizmu przede wszystkim przez drogi oddechowe lub pośrednio przez układ pokarmowy, kiedy spożywana jest skażona żywność (szczególnie dotyczy to metali ciężkich). Stwierdzono, że cząstki o średnicach większych od 10 μm zatrzymują się w górnych odcinkach dróg oddechowych, skąd są wydalane. Pył zawieszony PM10 przenika do płuc, ale się tam nie akumuluje, może akumulować się w górnych odcinkach dróg oddechowych."
		case Smog.pm25:
			infoTextView.text = "Pył zawieszony PM2,5 (particulate matter) jest mieszaniną substancji organicznych i nieorganicznych. Do atmosfery emitowany jest jako zanieczyszczenie pierwotne powstające w wyniku procesów antropogenicznych i naturalnych oraz jako zanieczyszczenie wtórne, powstające w wyniku przemian dwutlenku siarki, dwutlenku azotu, amoniaku, lotnych związków organicznych i trwałych związków organicznych.\n\nPył PM2,5 jest również zanieczyszczeniem transgranicznym, transportowanym na odległość do 2500 km. W powietrzu może pozostawać przez wiele dni lub tygodni, a sedymentacja i opady nie usuwają go z atmosfery.\n\nPył zawieszony PM2,5 przenika do najgłębszych partii płuc, gdzie jest akumulowany, stanowiąc poważny czynnik chorobotwórczy, osiada na ściankach pęcherzyków płucnych utrudniając wymianę gazową, powodują podrażnienie naskórka i śluzówki, zapalenie górnych dróg oddechowych oraz wywołując choroby alergiczne, astmę, nowotwory płuc, gardła i krtani."
		case Smog.no2:
			infoTextView.text = "Dwutlenek azotu – (NO2) to brunatny, silnie toksyczny gaz o ostrym zapachu. Jest to substancja oddziaływująca w sposób szkodliwy na roślinność i zdrowie ludzkie. Tlenki azotu są również odpowiedzialne za tworzenie się dziury ozonowej powodując powstawanie efektu cieplarnianego. W połączeniu z gazowymi węglowodorami tworzą w określonych warunkach atmosferycznych zjawisko smogu fotochemicznego charakterystycznego dla miast o bardzo dużym ruchu samochodowym w warunkach wysokich temperatur i ciśnienia.\n\nDwutlenek azotu może podrażniać płuca i powodować mniejszą odporność na infekcje dróg oddechowych, takich jak grypa. Przedłużające lub częste narażenie na stężenia, które są znacznie wyższe niż zwykle w powietrzu, mogą powodować zwiększoną częstość występowania ostrej choroby układu oddechowego u dzieci."
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	@IBAction func closeButtonTapped(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}

}
