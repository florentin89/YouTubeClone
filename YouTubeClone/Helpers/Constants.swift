//
//  Constants.swift
//  YouTubeClone
//
//  Created by Florentin on 23/02/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

enum Constants {
    static let baseUrlJSON = "https://raw.githubusercontent.com/tygruletz/YouTubeClone/master"
    static let failedDecode = "Failed to decode: "
    static let homeJSON = "/home.json"
    static let trendingJSON = "/trending.json"
    static let subscriptionsJSON = "/subscriptions.json"
    static let fatalErrorInit = "init(coder:) has not been implemented"
    static let defaultArtistName = "Katy Perry - Roar"
    static let defaultVideoViews = "Katy Perry • 2,755,418,109 views • 5 years ago"
    static let cellID = "cellID"
    static let home = "home"
    static let trending = "trending"
    static let subscriptions = "subscriptions"
    static let account = "account"
    static let settings = "settings"
    static let trendingCellId = "trendingCellId"
    static let subscriptionsCellId = "subscriptionsCellId"
    static let homeTitle = "  Home"
    static let searchIcon = "search_icon"
    static let moreIcon = "nav_more_icon"
    static let privacy = "privacy"
    static let feedback = "feedback"
    static let help = "help"
    static let switchAccount = "switch_account"
    static let cancel = "cancel"
    static let urlVideoAPI = "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726"
    static let urlVideoAPIGoogleCloud = "https://00e9e64bace725475877e4f40828d5bddea7d47c81401dd66a-apidata.googleusercontent.com/download/storage/v1/b/youtubeclone-bucket/o/BigBuckBunny_320x180.mp4?qk=AD5uMEt94W8M1DSXMwsrZuu1EhnUsxdzM8TnnkLkW6r41oAEfsnxyfqA_3m8CyRHuPTodhclymeyH7YTUzCloqZw2d4189yx8UXQn3hk5vFfW5oZ2B08KQHmhMRTcaXXeL2urNgVS5jdzfteHrH6DK1ERkKDNzsEH055LtQ8S-k8H-ax0nmbVv5ZALQ1DFTa3znOh2VmRiaBe1loEFtuAnUmj625maJQEOpD-Gegrtts6DTcRZspJMC_3zwxLnQSxIcUWJVONw7yXbw9h2jnj3BQzqRBEqRnxS-JPyUqsc512wqeHGE_uSBC8lrWvxzw1vjXVtEA3RnQ3t4yYN2zL_s6CHMxLgGM9xgg1tGp8EHs9x9VFktC1D7CIVqcYrAgXMZbC7KiyMXl569RQITPBMXA2XfgKU8KQXg51_2grhR4TnaFJ8-VwEb2BtHcxIlDYiQYQYuR7ugkLWhLtciN6vyZVigoZatjhecJoj812AXtqpQTARpsdtkaprc6Vb2qNfFfnlhNz8_cZ4VpftXCT1TIIJmb4g-3wx617l5okuNKa5gtNzVuYYZUcD6HZCzJbmB288Bgdr89AspF_3okepM5qDGBZBo1G0S4ccKVNRgs0Q_V5EeNFub-4sOfK92c521YBq8cECQLCRyFaFFdRfctkZmzH2rjQCLTdycT3vyWIPli9mnln0c9WY8sb8v4ZlpfOjI-OTwIcSAE_sG7CJxTmc8scoUI88f2PgJ8WFnuqpGrj6tATUivIe8h9kOeRlNkIDmqRu8ED18AM2nZxrJ_RUaLQh5XwWr15LV7CsCGYePEda09YfI"
    static let loadedTimeRanges = "currentItem.loadedTimeRanges"
    static let selectAnIcon = "Select an icon for the app."
    static let darkIconName = "ytcDarkIcon"
    static let darkIconTitle = "Dark \nIcon"
    static let lightIconName = "ytcLightIcon"
    static let lightIconTitle = "Light \nIcon"
    static let originalIconName = "ytcDefaultIcon"
    static let originalIconTitle = "Default \nIcon"
    static let termsAndPrivacyText = "TERMS AND PRIVACY\n @Florentin 2019\n\n Text text text Text text text Text text text Text text text Text text text Text text text qk=AD5uMEt94W8M1DSXMwsrZuu1EhnUsxdzM8TnnkLkW6r41oAEfsnxyfqA_3m8CyRHuPTodhclymeyH7YTUzCloqZw2d4189yx8UXQn3hk5vFfW5oZ2B08KQHmhMRTcaXXeL2urNgVS5jdzfteHrH6DK1ERkKDNzsEH055LtQ8S-k8H-ax0nmbVv5ZALQ1DFTa3znOh2VmRiaBe1loEFtuAnUmj625maJQEOpD-Gegrtts6DTcRZspJMC_3zwxLnQSxIcUWJVONw7yXbw9h2jnj3BQzqRBEqRnxS-JPyUqsc512wqeHGE_uSBC8lrWvxzw1vjXVtEA3RnQ3t4yYN2zL_s6CHMxLgGM9xgg1tGp8EHs9x9VFktC1D7CIVqcYrAgXMZbC7KiyMXl569RQITPBMXA2XfgKU8KQXg51_2grhR4TnaFJ8-VwEb2BtHcxIlDYiQYQYuR7ugkLWhLtciN6vyZVigoZatjhecJoj812AXtqpQTARpsdtkaprc6Vb2qNfFfnlhNz8_cZ4VpftXCT1TIIJmb4g-3wx617l5okuNKa5gtNzVuYYZUcD6HZCzJbmB288Bgdr89AspF_3okepM5qDGBZBo1G0S4ccKVNRgs0Q_V5EeNFub-4sOfK92c521YBq8cECQLCRyFaFFdRfctkZmzH2rjQCLTdycT3vyWIPli9mnln0c9WY8sb8v4ZlpfOjI-OTwIcSAE_sG7CJxTmc8scoUI88f2PgJ8WFnuqpGrj6tATUivIe8h9kOeRlNkIDmqRu8ED18AM2nZxrJ_RUaLQh5XwWr15LV7CsCGYePEda09YfI"
}
