import Foundation

struct Video {
    let title: String
    let views: Int
    let url: String
}

func generateSampleVideos() -> [Video] {
    var videos: [Video] = []
    for i in 1...10 {
        videos.append(Video(title: "Video Title \(i)", views: Int.random(in: 1000...5000), url: "https://example.com/video\(i)"))
    }
    return videos
}

func printVideos(_ videos: [Video]) {
    for (index, video) in videos.enumerated() {
        print("\(index + 1). Назва: \(video.title), Перегляди: \(video.views)")
    }
}

func searchVideos(by title: String, in videos: [Video]) -> [Video] {
    let foundVideos = videos.filter { $0.title.lowercased().contains(title.lowercased()) }
    printVideos(foundVideos)
    return foundVideos
}

func sortVideosByViews(_ videos: [Video]) -> [Video] {
    return videos.sorted { $0.views > $1.views }
}

func printVideoDetails(_ video: Video) {
    print("\nДетальна інформація про відео:")
    print("Назва: \(video.title)")
    print("Перегляди: \(video.views)")
    print("Посилання: \(video.url)\n")
}

func main() {
    let videos = generateSampleVideos()
    var shouldExit = false

    while !shouldExit {
        print("\nВітаємо! Оберіть дію:")
        print("0. Вийти")
        print("1. Показати всі відео")
        print("2. Знайти відео за назвою")
        print("3. Показати відео за кількістю переглядів")
        print("4. Переглянути детальну інформацію про відео")

        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 0:
                shouldExit = true
                print("Вихід з програми.")
            case 1:
                print("\nСписок відео:")
                printVideos(videos)
            case 2:
                print("\nВведіть назву для пошуку:")
                if let query = readLine() {
                    let results = searchVideos(by: query, in: videos)
                    print("\nРезультати пошуку:")
                    if results.isEmpty {
                        print("Нічого не знайдено.")
                    } else {
                        printVideos(results)
                    }
                }
            case 3:
                print("\nВідео за кількістю переглядів (спадання):")
                let sortedVideos = sortVideosByViews(videos)
                printVideos(sortedVideos)
            case 4:
                print("\nВведіть номер відео для перегляду деталей:")
                if let numberString = readLine(), let number = Int(numberString), number > 0, number <= videos.count {
                    let selectedVideo = videos[number - 1]
                    printVideoDetails(selectedVideo)
                } else {
                    print("Неправильний номер відео.")
                }
            default:
                print("Невідома дія. Спробуйте ще раз.")
            }
        } else {
            print("Неправильне введення. Спробуйте ще раз.")
        }
    }
}

main()
