import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:jjcar/generated/locale_keys.g.dart';
import 'package:jjcar/model/model_car.dart';
import 'package:jjcar/page/page_home.dart';
import 'package:jjcar/provider/provider_car.dart';
import 'package:jjcar/style/colors.dart';
import 'package:jjcar/style/textstyles.dart';
import 'package:jjcar/util/admob_service.dart';
import 'package:jjcar/util/service_string_utils.dart';
import 'package:provider/provider.dart';

import 'package:share_plus/share_plus.dart';

class PageResult extends StatefulWidget {
  const PageResult({Key? key, required this.results}) : super(key: key);

  final List<int> results;

  @override
  _PageResultState createState() => _PageResultState();
}

class _PageResultState extends State<PageResult> {
  double visibleFlag1 = 0;
  double visibleFlag2 = 0;
  double visibleFlag3 = 0;
  double visibleFlag4 = 0;
  double visibleFlag5 = 0;
  List<ModelCar> cars = [];
  ModelCar? selectedCar;

  int assets = 0;
  int grade = 0;
  Future<bool>? _isLoading;

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  int maxFailedLoadAttempts = 3;

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('11111111');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('22222222');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdShowedFullScreenContent: (InterstitialAd ad) => print('333333333'),
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void _createInterstitialAd() {
    String adId = AdMobService().getInterstitialAdId()!;
    // String adId = 'ca-app-pub-3940256099942544/1033173712';
    InterstitialAd.load(
        adUnitId: adId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }

  @override
  void initState() {
    _createInterstitialAd();
    _isLoading = Future.delayed(Duration(seconds: 2), () {
      return false;
    });
    getResult();
    Future.delayed(Duration(milliseconds: 3000), () {
      setState(() {
        visibleFlag1 = 1;
      });
    });
    Future.delayed(Duration(milliseconds: 4000), () {
      setState(() {
        visibleFlag2 = 1;
      });
    });
    Future.delayed(Duration(milliseconds: 5000), () {
      setState(() {
        visibleFlag3 = 1;
      });
    });

    Future.delayed(Duration(milliseconds: 6000), () {
      setState(() {
        visibleFlag5 = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        // extendBody: true,

        body: SafeArea(child: _body()),
        bottomSheet: FutureBuilder<Object>(
            initialData: true,
            future: _isLoading,
            builder: (context, snapshot) {
              return snapshot.data == true
                  ? SizedBox.shrink()
                  : InkWell(
                      onTap: () {
                        _showInterstitialAd();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => PageHome()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: MColors.facebook_blue,
                          ),
                          height: 50,
                          width: double.infinity,
                          child: Center(
                            child: Text(LocaleKeys.retry.tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                        ),
                      ),
                    );
            }),
      ),
    );
  }

  Widget _body() {
    return FutureBuilder<Object>(
        initialData: true,
        future: _isLoading,
        builder: (context, snapshot) {
          return snapshot.data == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getAniText(),
                    ],
                  ),
                );
        });
  }

  Widget getAniText() {
    return Column(
      children: [
        AnimatedOpacity(
          duration: Duration(milliseconds: 1500),
          opacity: visibleFlag1,
          child:
              Text(LocaleKeys.car_message.tr(), style: MTextStyles.bold18Black),
        ),
        SizedBox(height: 24),
        AnimatedOpacity(
          duration: Duration(milliseconds: 1500),
          opacity: visibleFlag2,
          child: Text(selectedCar!.name!, style: MTextStyles.bold18Black),
        ),
        SizedBox(height: 24),
        AnimatedOpacity(
          duration: Duration(milliseconds: 1500),
          opacity: visibleFlag2,
          child: Text(LocaleKeys.price.tr(), style: MTextStyles.bold18Black),
        ),
        SizedBox(height: 24),
        AnimatedOpacity(
          duration: Duration(milliseconds: 1500),
          opacity: visibleFlag2,
          child: Text(ServiceStringUtils.won(selectedCar!.price!),
              style: MTextStyles.bold18Black),
        ),
        SizedBox(height: 24),
        AnimatedOpacity(
          duration: Duration(milliseconds: 1500),
          opacity: visibleFlag1,
          child: Image.asset('assets/images/logo/kia.png',
              width: MediaQuery.of(context).size.width * 0.3),
        ),
        SizedBox(height: 24),
        AnimatedOpacity(
          duration: Duration(milliseconds: 1500),
          opacity: visibleFlag1,
          child: Image.asset('assets/images/logo/kia.png',
              width: MediaQuery.of(context).size.width * 0.6),
        ),
        SizedBox(height: 48),
        AnimatedOpacity(
          duration: Duration(milliseconds: 1500),
          opacity: visibleFlag5,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal, // This is what you need!
            ),
            child: Text(LocaleKeys.share.tr()),
            onPressed: () {
              // Share.share();
            },
          ),
        ),
      ],
    );
  }

  void getResult() {
    cars = context.read<ProviderCar>().cars;

    // 1번 문제 필터링
    if (widget.results[0] == 0) {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].price! > 10000) {
          cars[i].selected = true;
        }
      }
    } else if (widget.results[0] == 0) {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].price! < 12000 || cars[i].price! > 4000) {
          cars[i].selected = true;
        }
      }
    } else if (widget.results[0] == 0) {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].price! < 6000) {
          cars[i].selected = true;
        }
      }
    } else {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].price! < 3000) {
          cars[i].selected = true;
        }
      }
    }

    // 2번 필터링
    if (widget.results[1] == 0) {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].price! > 10000) {
          cars[i].selected = true;
        } else {
          cars[i].selected = false;
        }
      }
    }
    if (widget.results[1] == 1) {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].price! < 10000 || cars[i].price! > 4000) {
          cars[i].selected = true;
        }
      }
    }
    if (widget.results[1] == 2) {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].price! < 6000) {
          cars[i].selected = true;
        }
      }
    } else {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].price! < 3000) {
          cars[i].selected = true;
        }
      }
    }

    //3번 필터링
    if (widget.results[2] == 0) {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].type! == 1 && cars[i].selected == true) {
          cars[i].selected = false;
        }
      }
    }

    //4번 필터링
    if (widget.results[3] == 2) {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].locale! == 1 && cars[i].selected == true) {
          cars[i].selected = false;
        }
      }
    }

    // 5번 필터링
    if (widget.results[4] == 1) {
      for (int i = 0; i < cars.length; i++) {
        if (cars[i].fuel! == 2 && cars[i].selected == true) {
          cars[i].selected = false;
        }
      }
    }
    int index = Random().nextInt(cars.length);
    selectedCar = cars[index];
  }
}
