Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp440019wrx;
        Wed, 3 Apr 2019 09:27:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtoFi29hhLeM3j/YNcNJPGuReKDnxoHI4+RcaQe6cBTx6dNyo8dm251EgCc75YfEYvnmwt
X-Received: by 2002:a81:7489:: with SMTP id p131mr226326ywc.175.1554308821157;
        Wed, 03 Apr 2019 09:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554308821; cv=none;
        d=google.com; s=arc-20160816;
        b=0zg2GdrYzQnc4X7CCr5E1quRmUNz6JRWFEkr+EhE936NBayYIZF5X3c5blcdwVuPTf
         zsd461/Jb9uJABEvx0uv+c4EkQuHVIZk9sK/TcbfuRlsskujabTo5eiyZ0BeXfQHAQWW
         ELtsZFL0ebRjbi0QyEMX3+6EH0qqiDh3clk+t10UM16YcT5AxXvgnT3XVPzSbaQFG8z6
         6mV3vZ0ojqlCeGR27+eqRZE2T0KDw1Ovo137ylXqlXtL4uDBwReBU8SYUkSIHEhS/oH9
         pQPQwtJYBRQEay6POOA6o8bKLW9smpcA/m3g6JIgaAdq0BAjmskMJ0Lf/b42aSJ5m0o9
         RPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=uNDPPv02G+yw6jQePgkau/aXaioPapn7nbGePFp1T3M=;
        b=hqktFCiTwNpVThVUEzkxeE8WpUYCPEn9CheinQJxqui4XxxmlA1kPkR0XV3jKa96xx
         5Ftcc9fKU1KitZaKyN+tfnJigFCHwRArAOSETXc6/9NLpRAJ6ERa15C1C6xHO6yehDBR
         CgE6d/U4gyeNTPq4+fNvdGggFveJY/t1y3bnIkR7asY9uRwtDs71mZ0RWeTe6NTYY/OZ
         Rx45cXBEPAA4EVd8+Q0aBMsvB41m6/6M9SeZss08kFvXobQWkkImlCvDQDVx6aWq0VTt
         VeY5m2fCkhqlEqTXIy/pgUfDPNysN/z8lvgP4i1Pz8D8eQ3hI48oBspDk15eBusM7/jB
         OkOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si10473465ywb.246.2019.04.03.09.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Apr 2019 09:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBij2-0004oP-IL
	for alex.bennee@linaro.org; Wed, 03 Apr 2019 12:26:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hBiip-0004kU-7I
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 12:26:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hBiio-0006py-0X
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 12:26:43 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45387 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hBiin-000580-Ne; Wed, 03 Apr 2019 12:26:41 -0400
Received: from lhreml707-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 8F6C2B77C1AF2C33DFA8;
	Wed,  3 Apr 2019 17:25:55 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.229]) by
	lhreml707-cah.china.huawei.com ([10.201.108.48]) with mapi id
	14.03.0415.000; Wed, 3 Apr 2019 17:25:50 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
	feature "fdt"
Thread-Index: AQHU39PgLS6qaIxo3EqaH9uSQe0Wh6YiZMSAgAAFAfCAADi+gIAAAGKAgAALywCABJiAgIABuf+AgAACnwCAATC0gIAAM+4AgAAJpICAAD95YA==
Date: Wed, 3 Apr 2019 16:25:49 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8393564E2@lhreml524-mbs.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
	<0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
	<CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
	<a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
	<459862f9-18f7-0a37-dfb9-b8ca9aa6a2d2@redhat.com>
	<3de6adf3-30c7-5908-e153-2195bc6879c5@redhat.com>
	<9e939ea4-4be2-a165-dce4-47d8196020b0@redhat.com>
	<20190403114901.6e4ea653@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839353082@lhreml524-mbs.china.huawei.com>
	<ebf745ce-f5bc-be0c-c0ce-3ce25bd7afa9@redhat.com>
In-Reply-To: <ebf745ce-f5bc-be0c-c0ce-3ce25bd7afa9@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce
 opt-in feature "fdt"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>, Auger Eric <eric.auger@redhat.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h7KbYcqTdtn9

SGkgTGFzemxvLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhc3ps
byBFcnNlayBbbWFpbHRvOmxlcnNla0ByZWRoYXQuY29tXQ0KPiBTZW50OiAwMyBBcHJpbCAyMDE5
IDE0OjI5DQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtvbG90
aHVtLnRob2RpQGh1YXdlaS5jb20+Ow0KPiBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQu
Y29tPg0KPiBDYzogQXVnZXIgRXJpYyA8ZXJpYy5hdWdlckByZWRoYXQuY29tPjsgQXJkIEJpZXNo
ZXV2ZWwNCj4gPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+OyBwZXRlci5tYXlkZWxsQGxpbmFy
by5vcmc7DQo+IHNhbWVvQGxpbnV4LmludGVsLmNvbTsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBM
aW51eGFybQ0KPiA8bGludXhhcm1AaHVhd2VpLmNvbT47IHNoYW5ub24uemhhb3NsQGdtYWlsLmNv
bTsNCj4gcWVtdS1hcm1Abm9uZ251Lm9yZzsgeHV3ZWkgKE8pIDx4dXdlaTVAaHVhd2VpLmNvbT47
DQo+IHNlYmFzdGllbi5ib2V1ZkBpbnRlbC5jb207IExlaWYgTGluZGhvbG0gPExlaWYuTGluZGhv
bG1AYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtRZW11LWRldmVsXSBbUEFUQ0ggdjMgMDcvMTBd
IGh3L2FybS92aXJ0OiBJbnRyb2R1Y2Ugb3B0LWluDQo+IGZlYXR1cmUgImZkdCINCj4gDQo+IE9u
IDA0LzAzLzE5IDE0OjEwLCBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIHdyb3RlOg0KPiANCj4g
Pj4+Pj4gU28sIHRoZSBjb25kaXRpb24gZm9yIGhpZGluZyB0aGUgaG90cGx1Z2dhYmxlIG1lbW9y
eSBub2RlcyBpbiBxdWVzdGlvbg0KPiA+Pj4+PiBmcm9tIHRoZSBEVCBpczoNCj4gPj4+Pg0KPiA+
Pj4+Pg0KPiA+Pj4+PiAgIChhYXJjaDY0ICYmIGZpcm13YXJlX2xvYWRlZCAmJiBhY3BpX2VuYWJs
ZWQpDQo+IA0KPiA+Pj4gV2hpbGUgVUVGSSBoYXMgYmluZGluZ3MgZm9yIGJvdGggMzItYml0IGFu
ZCA2NC1iaXQgQVJNLCBBQ1BJIGhhcyBhDQo+ID4+PiA2NC1iaXQtb25seSBiaW5kaW5nIGZvciBB
Uk0uIChBbmQgeW91IGNhbiBoYXZlIFVFRkkgd2l0aG91dCBBQ1BJLCBidXQNCj4gPj4+IG5vdCB0
aGUgcmV2ZXJzZSwgb24gQVJNLikgU28gaWYgeW91IHJ1biB0aGUgMzItYml0IGJ1aWxkIG9mIHRo
ZQ0KPiA+Pj4gQXJtVmlydFFlbXUgZmlybXdhcmUsIHlvdSBnZXQgbm8gQUNQSSBhdCBhbGw7IGFs
bCB5b3UgY2FuIHJlbHkgb24gd2l0aA0KPiA+Pj4gdGhlIE9TIGlzIHRoZSBEVC4NCj4gPg0KPiA+
IEp1c3QgdG8gY29uZmlybSwgZG9lcyB0aGF0IG1lYW4gd2l0aCAzMi1iaXQgYnVpbGQgb2YgdGhl
IFVFRkksIHRoZSBPUyBjYW5ub3QNCj4gPiBib290IHdpdGggQUNQSSBhbmQgdXNlcyBEVCBvbmx5
Lg0KPiANCj4gSW5kZWVkLg0KPiANCj4gPiBTbywNCj4gPg0KPiA+IElmICgoYWFyY2g2NCAmJiBm
aXJtd2FyZV9sb2FkZWQgJiYgYWNwaV9lbmFibGVkKSB7DQo+ID4gICAgSGlkZV9ob3RwbHVnZ2Fi
bGVfbWVtb3J5X25vZGVzKCkNCj4gPiB9IGVsc2Ugew0KPiA+ICAgIEFkZF8gaG90cGx1Z2dhYmxl
X21lbW9yeV9ub2RlcygpDQo+ID4gfQ0KPiA+DQo+ID4gc2hvdWxkIHdvcmsgZm9yIGFsbCBjYXNl
cz8NCj4gDQo+IFllcy4NCj4gDQo+IEhlcmUncyB3aGF0IGhhcHBlbnMgd2hlbiBhbnkgb25lIG9m
IHRoZSBzdWJjb25kaXRpb25zIGV2YWx1YXRlcyB0byBmYWxzZToNCj4gDQo+IC0gQVJNMzIgaGFz
IG5vIEFDUEkgYmluZGluZ3MsIHNvIHRoZSBndWVzdCBrZXJuZWwgY2FuIG9ubHkgdXNlIERULg0K
PiANCj4gLSBPbiBBQVJDSDY0LCBpZiB5b3UgZG9uJ3QgImxvYWQgdGhlIGZpcm13YXJlIiAoPSBk
b24ndCB1c2UgVUVGSSksIHRoZW4NCj4gICB0aGVyZSB3b24ndCBiZSBhbiBBQ1BJIGVudHJ5IHBv
aW50IGZvciB0aGUgT1MgdG8gbG9jYXRlICh0aGUgUlNEIFBUUg0KPiAgIGlzIGRlZmluZWQgYnkg
dGhlIEFDUEkgc3BlYyBpbiBVRUZJIHRlcm1zLCBmb3IgQUFSQ0g2NCkuIFNvIHRoZSBndWVzdA0K
PiAgIGtlcm5lbCBjYW4gb25seSB1c2UgRFQuDQo+IA0KPiAtIFdoZW4gb24gQUFSQ0g2NCBhbmQg
dXNpbmcgVUVGSSwgYnV0IGFza2luZyBRRU1VIG5vdCB0byBnZW5lcmF0ZSBBQ1BJDQo+ICAgY29u
dGVudCwgdGhlIGZpcm13YXJlIHdpbGwgbm90IGluc3RhbGwgYW55IEFDUEkgdGFibGVzLCBzbyB0
aGUgZ3Vlc3QNCj4gICBrZXJuZWwgY2FuIG9ubHkgdXNlIERULg0KPiANCg0KVGhhbmtzLiBUaGF0
IG1ha2VzIGl0IHZlcnkgY2xlYXIuIE11Y2ggYXBwcmVjaWF0ZWQuDQoNCj4gPj4+IFRoaXMgImJp
dG5lc3MgZGlzdGluY3Rpb24iIGlzIGltcGxlbWVudGVkIGluIHRoZSBmaXJtd2FyZSBhbHJlYWR5
LiBJZg0KPiA+Pj4geW91IGhpZCB0aGUgbWVtb3J5IG5vZGVzIGZyb20gdGhlIERUIHVuZGVyIHRo
ZSBjb25kaXRpb24NCj4gPj4+DQo+ID4+PiAgICghYWFyY2g2NCAmJiBmaXJtd2FyZV9sb2FkZWQg
JiYgYWNwaV9lbmFibGVkKQ0KPiA+Pj4NCj4gPj4+IHRoZW4gdGhlIG5vZGVzIHdvdWxkIG5vdCBi
ZSBzZWVuIGJ5IHRoZSBPUyBhdCBhbGwgKGJlY2F1c2UNCj4gPj4+ICJhY3BpX2VuYWJsZWQiIGlz
IGlycmVsZXZhbnQgZm9yIHRoZSAzMi1iaXQgYnVpbGQgb2YgQXJtVmlydFFlbXUsIGFuZA0KPiA+
Pj4gYWxsIHRoZSBPUyBjYW4gZXZlciBnZXQgaXMgRFQpLg0KPiA+Pg0KPiA+PiBJdCdzIGdldHRp
bmcgdHJpY2t5IGFuZCBJIGRvbid0IGxpa2UgYSBiaXQgdGhhdCB3ZSBhcmUgdHJ5aW5nIHRvIGNh
cnRlcg0KPiA+PiA2NCBiaXQgb25seSBVRUZJIGJ1aWxkIChvciBhbnkgb3RoZXIgYnVpbGQpIG9u
IFFFTVUgc2lkZS4gQWxzbyBQZXRlciBoYXMNCj4gPj4gYSB2YWxpZCBhYm91dCBndWVzc2luZyBv
biBRRU1VIHNpZGUgKHRoYXQncyB1c3VhbGx5IGEgc291cmNlIG9mIHByb2JsZW0NCj4gPj4gaW4g
dGhlIGZ1dHVyZSkuDQo+ID4NCj4gPiBJZiB0aGUgYWJvdmUgaXMgY29ycmVjdCh3aXRoIDMyLWJp
dCB2YXJpYW50IG9mIFVFRkksIE9TIGNhbm5vdCBoYXZlIEFDUEkgYm9vdCksDQo+ID4gdGhlbiBk
byB3ZSByZWFsbHkgaGF2ZSB0aGUgaXNzdWUgb2YgbWVtb3J5IGJlY29taW5nIG5vbg0KPiBob3Qt
dW4tdW5wbHVnZ2FibGU/DQo+ID4gTWF5IGJlIEkgYW0gbWlzc2luZyBzb21ldGhpbmcuDQo+IA0K
PiBJIHRoaW5rIElnb3IgYW5kIFBldGVyIGRpc2xpa2UgYWRkaW5nIGNvbXBsZXggbG9naWMgdG8g
UUVNVSB0aGF0DQo+IHJlZmxlY3RzIHRoZSBiZWhhdmlvciBvZiBhIHNwZWNpZmljIGZpcm13YXJl
LiBBSVVJIHRoZWlyIG9iamVjdGlvbiBpc24ndA0KPiB0aGF0IGl0IHdvdWxkbid0IHdvcmssIGJ1
dCB0aGF0IGl0J3Mgbm90IHRoZSByaWdodCB0aGluZyB0byBkbywgZnJvbSBhDQo+IGRlc2lnbiBw
ZXJzcGVjdGl2ZS4NCg0KVW5kZXJzdG9vZC4gSG9wZSB3ZSBjYW4gY29udmVyZ2Ugb24gc29tZXRo
aW5nIHNvb24uDQoNCkNoZWVycywNClNoYW1lZXINCg==
