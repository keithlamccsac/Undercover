'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"version.json": "8ff25c982a0aa691b47d956fbe68213f",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"index.html": "d7d78cb1e1e4c424282626f3f78b4dea",
"/": "d7d78cb1e1e4c424282626f3f78b4dea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "ffa9e40d1a0e24d4002dbe848a50fea6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/NOTICES": "9ce504a59d3daca454a6c3dd0c5f8795",
"assets/AssetManifest.json": "a4765d4702a656c41ec7a86d71d7c46d",
"assets/AssetManifest.bin.json": "849ffa01854d3003dee08a05a7558b63",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/z-UC2C1207-2_Q01-1.jpeg": "74d4950e115a0cb4f3ec2e6a59918456",
"assets/assets/images/z-UC2C1301-1_G31-12.jpeg": "5b625d5fcfacbc6a60c73fb85934e6d6",
"assets/assets/images/z-UC2C8202_M31-1.jpg": "be46ae38da6863f2b1c093c5d346ea86",
"assets/assets/images/z-UC2C9813-2_Q06-1.jpeg": "05e3c1cb17d28723b69b30102ceb4fa5",
"assets/assets/images/z-UC2C9812-1_L34-1.jpeg": "e5d87126a30e12ae3dd2003b91a88186",
"assets/assets/images/z-UC2C1301-1_G31-5.jpeg": "73104ece6c748df99f3439d006096e85",
"assets/assets/images/z-UC2C4509-2_N91-1.jpg": "f322a131e7c9f90cf305008b7dbdb0b0",
"assets/assets/images/z-UC2C1207-2_N31-1.jpeg": "8b459657c05aa3bf5f5a705dfd3c30c4",
"assets/assets/images/z-UC2C1S02-1_L34-1.jpeg": "a5e8da0c83e58e742040ce22a6538f1e",
"assets/assets/images/z-UC2C1306_Q06-1.jpeg": "0aa848b0678d0fcc0b9ccbcea373cd6a",
"assets/assets/images/z-UC2C1303-2_L34-1.jpeg": "2ca29b0a9bac6e306b879e2b58ceb504",
"assets/assets/images/7fbgi_3.jpg": "92ce142675b0530773f7a175722759bf",
"assets/assets/images/z-UC2C4912_Q01-2.jpg": "1d853a98cec0bc884347b398b6bc8e75",
"assets/assets/images/5a6e9_5.jpg": "003ec53fd93a5da6851ed6699ac76bb7",
"assets/assets/images/Screenshot_2023-11-23_at_2.54.21_PM.png": "feab59a8561b3d74a63a1570e6e8c4fb",
"assets/assets/images/z-UC2C8301_G31-1.jpg": "f95d0fc230f5ecae1c67763fbe03c373",
"assets/assets/images/fragment3.jpg": "26125229f11c60acee33b48fd5f1f3c7",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/Screenshot_2023-11-23_at_2.54.44_PM.png": "0029f5e2d6d0d7c2d0fe51cade07721c",
"assets/assets/images/092302_(1).jpg": "7305fcd2b0d07b9abf6ffe977bee497d",
"assets/assets/images/images.png": "bfb83f16427cb08efcd940d2c69e5ea0",
"assets/assets/images/fragment2_(1).jpg": "1f02cdd67bb9e64522871828bd9ed942",
"assets/assets/images/z-UC2C9208_Q01-1.jpg": "3f13e56a179dc0f44d1074299478796a",
"assets/assets/images/z-UC2C9813-1_L34-1.jpeg": "4bc817b7ee4b6bb847da3ddb6df3f8c0",
"assets/assets/images/526f43456fad850a2456c4f34936bcb3.jpg": "175519652c75200b17bf95a3bb4097db",
"assets/assets/images/z-UC2C8301_N31-1.jpg": "7d9685dabee59f423937ab7ab58f81ee",
"assets/assets/images/z-UC2C8201_Q01-1.jpg": "47965aeb66f9b695efaabaad0646d07e",
"assets/assets/images/z-UC2C8501_N91-1.jpg": "cf4a8ae5c3202cdae02ab87cf815d923",
"assets/assets/images/z-UC2C4912_L31-2.jpg": "2786ca76432f3ac3b3b0958f07779113",
"assets/assets/images/Screenshot_2023-11-23_at_2.54.28_PM.png": "300ed33fd11b10e0de8a6687e5c2a0d2",
"assets/assets/images/10281.jpg": "43bf7408613e429ecf7077aaedd0eaab",
"assets/assets/images/z-UC2C1301-1_G31-9.jpeg": "04d78c3cc0f5b001e48693fc1a4cd079",
"assets/assets/images/z-UC2C8801_N31-1.jpg": "d27c4375539e12644977df8f07b31454",
"assets/assets/images/z-UC2C1302_L34-1.jpeg": "4f62dbd5e5c872b8a40261dafa3e189f",
"assets/assets/images/z-UC2C1301-1_G31-3.jpeg": "4abc171dbe82a52c2d28589170d2063b",
"assets/assets/images/0347-01_d4712a5f-2edb-47c5-aeb8-f038d905d42a_1400x.webp": "457b9beb71d8fafcb0e9e3f134f9d8b9",
"assets/assets/images/Screenshot_2023-11-23_at_2.39.23_PM.png": "03e7aee811d6003af6b6e949013eef20",
"assets/assets/images/z-UC2C1301-1_G31-4.jpeg": "0a66a11ec79eedad74575f0278999b6b",
"assets/assets/images/z-UC2C1301-1_G31-13.jpeg": "13a48cc8876c5c461c2429af7356c131",
"assets/assets/images/839e0daed81029e14e0836b7acb2ed4a-removebg-preview.png": "23006cfd4699af1cdc8ca60f6324f84e",
"assets/assets/images/10141.jpg": "4c2c699759aea4d4e1818d07da07c97c",
"assets/assets/images/z-UC2C1301-1_G31-2.jpeg": "236a7dfcd6246026e581153d214ccd19",
"assets/assets/images/z-UC2C1301-2_Q01-1.jpeg": "96392b28e3db2dfdf11325e8980baa87",
"assets/assets/images/z-UC2C4808_G31-1.jpg": "0be98b75dfe5e942d6ff35f3aaca5c92",
"assets/assets/images/z-UC2C1301-1_G31-1.jpeg": "e122bda48bac4b232964d5f33b44d73d",
"assets/assets/images/z-UC2C1207-1_G31-1.jpeg": "27ed76301b1d14a59b5f6b2e6ed678cf",
"assets/assets/images/092301.jpg": "055ba7a2a146a152d391e1680ead5bec",
"assets/assets/images/1118.jpg": "af702217940ef77d6ec2371cdc3db782",
"assets/assets/images/z-UC2C1201-2_Q06-1.jpeg": "bcc5ce920ba15025282ba850423a082e",
"assets/assets/images/3mjpg_4.jpg": "88451beb2dae584bb8a670926584f52b",
"assets/assets/images/Screenshot_2023-11-23_at_2.54.50_PM.png": "cb74d0a69b838f166d525b742b0466d7",
"assets/assets/images/23404458a4880560ac65908ee68a06ba.jpg": "9e78dcd24d0e558a0d7ec833adc3214e",
"assets/assets/images/Screenshot_2023-11-23_at_2.54.05_PM.png": "772c1e08bf65479f9433d045ab6f9c14",
"assets/assets/images/Screenshot_2023-11-23_at_2.54.38_PM.png": "c9e59f1c3e837799293703dfe30cabb4",
"assets/assets/images/z-UC2C1207-1_M31-1.jpeg": "b50fa6a57b5b6808774e54a4dc9f70df",
"assets/assets/images/fragment1.jpg": "79c7227939fe0d5572887b88e76bfb65",
"assets/assets/images/z-UC2C1S02-2_Q06-1.jpeg": "142882458ff536645f2c56e3d19da9a4",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/Lora-Regular.ttf": "cc0ab33debdec5285adb952c8fcd6bf4",
"assets/assets/fonts/Lora-Medium.ttf": "2e2d9284a6a1ce2d32c0326bb2781361",
"assets/AssetManifest.bin": "23b94bf2092b7f5f00286db10cd9bd0a",
"assets/fonts/MaterialIcons-Regular.otf": "089194a479667312dca1fdbccd7dded8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"main.dart.js": "0623a99f32b7386aacbacb08cf8402be"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
