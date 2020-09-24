[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/jorgifumi/OpenWeatherMapAPI">

  <h3 align="center">OpenWeatherMapAPI</h3>

  <p align="center">
    <br />
    <br />
    <a href="https://github.com/jorgifumi/OpenWeatherMapAPI/issues">Report Bug</a>
    ·
    <a href="https://github.com/jorgifumi/OpenWeatherMapAPI/issues">Request Feature</a>
  </p>
</p>



<!-- ABOUT THE PROJECT -->
## OpenWeatherMapAPI


OpenWeatherMapAPI is an API Client to deal with the free version of the API in your iOS Apps in a reactive way using Combine.


### Built With

* [Swift 5.3](https://swift.org)
* [XCode 12](https://developer.apple.com/xcode/)
* [Swift Package Manager](https://swift.org/package-manager/)



<!-- GETTING STARTED -->
## Installation


## Requirements

- iOS 13
- Xcode 12+
- Swift 5.3+


### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code.

Select File > Swift Packages > Add Package Dependency. Enter `https://github.com/jorgifumi/OpenWeatherMapAPI.git` in the "Choose Package Repository" dialog.


<!-- USAGE EXAMPLES -->
## Usage

First:
```swift
import OpenWeatherMapAPI
```

Then you can create an instance and make requests:
```swift
let apiClient = OpenWeatherMapAPI.initialize(apiKey: "YOUR_API_KEY")

apiClient.load(Resource<CurrentWeatherResponse>.current(latitude: 1.546, longitude: 5.454))
```


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the [MIT](https://choosealicense.com/licenses/mit/) License.



<!-- CONTACT -->
## Contact

Jorge Lucena - [@jorgifumi](https://twitter.com/jorgifumi) - jorgifumi@gmail.com

Project Link: [https://github.com/jorgifumi/OpenWeatherMapAPI](https://github.com/jorgifumi/OpenWeatherMapAPI)



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/jorgifumi/repo.svg?style=flat-square
[contributors-url]: https://github.com/jorgifumi/repo/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/jorgifumi/repo.svg?style=flat-square
[forks-url]: https://github.com/jorgifumi/repo/network/members
[stars-shield]: https://img.shields.io/github/stars/jorgifumi/repo.svg?style=flat-square
[stars-url]: https://github.com/jorgifumi/repo/stargazers
[issues-shield]: https://img.shields.io/github/issues/jorgifumi/repo.svg?style=flat-square
[issues-url]: https://github.com/jorgifumi/repo/issues
[license-shield]: https://img.shields.io/github/license/jorgifumi/repo.svg?style=flat-square
[license-url]: https://github.com/jorgifumi/repo/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/jorgifumi
[product-screenshot]: images/screenshot.png
