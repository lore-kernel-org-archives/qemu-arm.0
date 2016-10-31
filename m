Received: by 10.80.166.35 with SMTP id d32csp33977edc;
        Mon, 31 Oct 2016 02:11:58 -0700 (PDT)
X-Received: by 10.233.220.131 with SMTP id q125mr23250936qkf.43.1477905118516;
        Mon, 31 Oct 2016 02:11:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t8si8040750qke.295.2016.10.31.02.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Oct 2016 02:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:34104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c18dJ-0004jH-Ra
	for alex.bennee@linaro.org; Mon, 31 Oct 2016 05:11:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1c18dE-0004fV-Ss
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 05:11:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1c18dD-0005e4-OE
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 05:11:52 -0400
Received: from mail-db5eur01on0117.outbound.protection.outlook.com
	([104.47.2.117]:11392
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1c18d8-0005dR-30; Mon, 31 Oct 2016 05:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0grM83J6QlS2bKNq5u3bJfrl7K/SBQHX4oJaJVHZAMQ=;
	b=QL2bdo6J6oUTf5peUSUfII52IDFzl1ou0iUZX6XPqS3d+Ts0V4BC1TZDqTXQvjK4APhNySLRawIsEh8I3jRJD003w+LrhF45a+8AC7KqzijkmAKhg7SD+dv7Hk6lQoshwEBID08+IOLbxBrDmbFNrTujfWiQO0uViZddA/47eME=
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.707.1;
	Mon, 31 Oct 2016 09:11:42 +0000
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) with
	mapi id 15.01.0707.000; Mon, 31 Oct 2016 09:11:42 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [v2] nvic: set pending status for not active interrupts
Thread-Index: AQHSKQcPMca6KGcJQEyYkNkKFinBj6C3w7AAgAqWSGA=
Date: Mon, 31 Oct 2016 09:11:42 +0000
Message-ID: <AM4PR0701MB213042F89412D6561736F11FFEAE0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1476771285-3680-1-git-send-email-marcin.krzeminski@nokia.com>
	<CAFEAcA-QTUvqJvHwd11-UhGGiatH4PKkupthGh9Xzw3C1vHRGw@mail.gmail.com>
In-Reply-To: <CAFEAcA-QTUvqJvHwd11-UhGGiatH4PKkupthGh9Xzw3C1vHRGw@mail.gmail.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=marcin.krzeminski@nokia.com; 
x-originating-ip: [131.228.2.7]
x-ms-office365-filtering-correlation-id: 2276f747-1299-4d72-b864-08d4016dee3a
x-microsoft-exchange-diagnostics: 1; AM4PR0701MB2130;
	7:pK9M6lBjQjDZPsmCRcVx0EmSWb83JFlY1JWnWzkf9zwCFT8xpnfpm3jx/xTQE7Os2H7eo9enFUrKcadas//ZfggnpdQ56P6/0KZEU3/MwtfY2YHJE6SGmNGmuJmNCW+lv9HmcVqGwlbzBbs5K0vcaaGJReW8BcIojGoreRj99TAUSeyNTmX/h/KN9qOBg20CIrrj2zJceWLxuUBHo5Fyi/uINgi1Qi5EPixd/TlEBoQEY3HSU2AYc1EG/FzP7a01KJ5ZvsTNN3mEfxRTDLXfDrKo4JghkIu1h63zFNi8cj5+Uxjd8IXvtqqZmVsc3jfjJr9oMc0HjASVkgSYRbdRLz7PVoQcEf5QGxX80joXA74=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR0701MB2130;
x-microsoft-antispam-prvs: <AM4PR0701MB213076B29FF6269233B9FE2CFEAE0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(82608151540597);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:AM4PR0701MB2130; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR0701MB2130; 
x-forefront-prvs: 01128BA907
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(377454003)(199003)(189002)(24454002)(13464003)(8936002)(5002640100001)(68736007)(33656002)(9686002)(92566002)(76576001)(122556002)(4001430100002)(19580405001)(86362001)(110136003)(5660300001)(7696004)(2950100002)(11100500001)(6916009)(19580395003)(66066001)(3846002)(106356001)(10400500002)(77096005)(105586002)(3280700002)(3660700001)(101416001)(4326007)(586003)(97736004)(81166006)(7736002)(2906002)(76176999)(189998001)(2900100001)(102836003)(54356999)(81156014)(107886002)(8676002)(50986999)(6116002)(87936001)(7846002)(305945005)(74316002)(106116001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR0701MB2130;
	H:AM4PR0701MB2130.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2016 09:11:42.4860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2130
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.117
Subject: Re: [Qemu-arm] [v2] nvic: set pending status for not active
 interrupts
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
Cc: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: irH4BmKNibf+

UGV0ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5
ZGVsbCBbbWFpbHRvOnBldGVyLm1heWRlbGxAbGluYXJvLm9yZ10NCj4gU2VudDogTW9uZGF5LCBP
Y3RvYmVyIDI0LCAyMDE2IDU6MjYgUE0NCj4gVG86IEtyemVtaW5za2ksIE1hcmNpbiAoTm9raWEg
LSBQTC9Xcm9jbGF3KQ0KPiA8bWFyY2luLmtyemVtaW5za2lAbm9raWEuY29tPg0KPiBDYzogUUVN
VSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBxZW11LWFybSA8cWVtdS0NCj4g
YXJtQG5vbmdudS5vcmc+OyByZnN3LXBhdGNoZXNAbWxpc3Qubm9raWEuY29tDQo+IFN1YmplY3Q6
IFJlOiBbdjJdIG52aWM6IHNldCBwZW5kaW5nIHN0YXR1cyBmb3Igbm90IGFjdGl2ZSBpbnRlcnJ1
cHRzDQo+IA0KPiBPbiAxOCBPY3RvYmVyIDIwMTYgYXQgMDc6MTQsICA8bWFyY2luLmtyemVtaW5z
a2lAbm9raWEuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBNYXJjaW4gS3J6ZW1pbnNraSA8bWFyY2lu
LmtyemVtaW5za2lAbm9raWEuY29tPg0KPiA+DQo+ID4gQWNjb3JkaW5nIHRvIEFSTSBEVUkgMDU1
MkEgNC4yLjEwLiBOVklDIHNldCBwZW5kaW5nIHN0YXR1cyBhbHNvIGZvcg0KPiA+IGRpc2FibGVk
IGludGVycnVwdHMuIFRoaXMgcGF0Y2ggYWRkcyBwb3NzaWJpbGl0eSB0byBlbXVsYXRlIHRoaXMg
aW4NCj4gPiBRZW11Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFyY2luIEtyemVtaW5za2kg
PG1hcmNpbi5rcnplbWluc2tpQG5va2lhLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3Igcm9sbGluZyBh
IHYyLiBVbmZvcnR1bmF0ZWx5IEkgdGhpbmsgd2UgZG9uJ3QgaGF2ZSB0aGUgbG9naWMgcXVpdGUN
Cj4gcmlnaHQgeWV0Li4uDQo+IA0KWWVhcCwgIEkgc2VwYXJhdGVkIGl0IGJ1dCBub3QgdXBkYXRl
IHRvIHdvcmsgb25seSB3aXRoIE5WSUMuDQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBmb3IgdjI6DQo+
ID4gICAgIC0gYWRkIGEgZGVkaWNhdGVkIHVuY3Rpb24gZm9yIG52aWMNCj4gPiAgICAgLSB1cGRh
dGUgY29tcGxldGVfaXJxDQo+ID4gIGh3L2ludGMvYXJtX2dpYy5jIHwgMjcgKysrKysrKysrKysr
KysrKysrKysrKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L2ludGMvYXJtX2dpYy5jIGIv
aHcvaW50Yy9hcm1fZ2ljLmMgaW5kZXgNCj4gPiBiMzBjYzkxLi43MmU0YzAxIDEwMDY0NA0KPiA+
IC0tLSBhL2h3L2ludGMvYXJtX2dpYy5jDQo+ID4gKysrIGIvaHcvaW50Yy9hcm1fZ2ljLmMNCj4g
PiBAQCAtMTU2LDYgKzE1NiwyMSBAQCBzdGF0aWMgdm9pZCBnaWNfc2V0X2lycV8xMW1wY29yZShH
SUNTdGF0ZSAqcywgaW50DQo+IGlycSwgaW50IGxldmVsLA0KPiA+ICAgICAgfQ0KPiA+ICB9DQo+
ID4NCj4gPiArc3RhdGljIHZvaWQgZ2ljX3NldF9pcnFfbnZpYyhHSUNTdGF0ZSAqcywgaW50IGly
cSwgaW50IGxldmVsLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
Y20sIGludCB0YXJnZXQpIHsNCj4gPiArICAgIGlmIChsZXZlbCkgew0KPiA+ICsgICAgICAgIEdJ
Q19TRVRfTEVWRUwoaXJxLCBjbSk7DQo+ID4gKyAgICAgICAgaWYgKEdJQ19URVNUX0VER0VfVFJJ
R0dFUihpcnEpIHx8IEdJQ19URVNUX0VOQUJMRUQoaXJxLCBjbSkNCj4gPiArICAgICAgICAgICAg
ICAgIHx8ICFHSUNfVEVTVF9BQ1RJVkUoaXJxLCBjbSkpIHsNCj4gPiArICAgICAgICAgICAgRFBS
SU5URigiU2V0ICVkIHBlbmRpbmcgbWFzayAleFxuIiwgaXJxLCB0YXJnZXQpOw0KPiA+ICsgICAg
ICAgICAgICBHSUNfU0VUX1BFTkRJTkcoaXJxLCB0YXJnZXQpOw0KPiA+ICsgICAgICAgIH0NCj4g
DQo+IFdoeSBpcyBHSUNfVEVTVF9FTkFCTEVEKCkgaW4gdGhpcyBjb25kaXRpb24sIHdoZW4gdGhl
IGlkZWEgaXMgdGhhdCB3ZSBkb24ndA0KPiBjYXJlIGFib3V0IHRoZSBlbmFibGVkIHN0YXR1cyBm
b3Igd2hldGhlciB3ZSBjYW4gcGVuZCB0aGUgaW50ZXJydXB0Pw0KPiANCj4gSSB0aGluayB0aGlz
IHNob3VsZCBhY3R1YWxseSBqdXN0IGFsd2F5cyBkbw0KPiAgICBHSUNfU0VUX1BFTkRJTkcoaXJx
LCB0YXJnZXQpDQo+IHdoZW5ldmVyIGxldmVsIGlzIGhpZ2gNCj4gDQo+IGJlY2F1c2U6DQo+ICAo
MSkgcGVuZGluZyBzdGF0dXMgY2FuIGJlIHNldCBmb3IgZGlzYWJsZWQgaW50ZXJydXB0cw0KPiAg
KDIpIGVkZ2UtdHJpZ2dlcmVkIElSUXMgZGVmaW5pdGVseSBhbHdheXMgcmUtcGVuZCBvbiByaXNp
bmcgZWRnZQ0KPiAgKDMpIEkgdGhpbmsgbGV2ZWwtdHJpZ2dlcmVkIElSUXMgZG8gdG9vIChpdCdz
IGEgYml0DQo+ICAgICAgbGVzcyBjbGVhciBpbiB0aGUgZG9jcywgYnV0IERVSTA1NTJBIDQuMi45
IHNheXMgd2UgcGVuZCBvbg0KPiAgICAgIGEgcmlzaW5nIGVkZ2UgYW5kIGRvZXNuJ3Qgc2F5IHRo
YXQgYXBwbGllcyBvbmx5IHRvIGVkZ2UNCj4gICAgICB0cmlnZ2VyZWQgSVJRcykNCj4gDQo+IEkg
ZG9uJ3QgaGF2ZSBhbnkgcmVhbCBoYXJkd2FyZSB0byBoYW5kIHRvIHRlc3QgYWdhaW5zdCwgdGhv
dWdoLg0KPiANClllcywgaXQgd29ya3MgZXhhY3RseSBhcyB5b3UncmUgc2F5aW5nIChjaGVja2Vk
IG9uIEhXKSwgaWYgbGV2ZWwgaXMgc3RpbGwNCmhpZ2ggYWZ0ZXIgZXhpdCBpbnRlcnJ1cHQgaGFu
ZGxlciwgaW50ZXJydXB0IGlzIHJlLXBlbmQuDQo+ID4gKyAgICB9IGVsc2Ugew0KPiA+ICsgICAg
ICAgIEdJQ19DTEVBUl9MRVZFTChpcnEsIGNtKTsNCj4gPiArICAgIH0NCj4gPiArfQ0KPiA+ICsN
Cj4gPiAgc3RhdGljIHZvaWQgZ2ljX3NldF9pcnFfZ2VuZXJpYyhHSUNTdGF0ZSAqcywgaW50IGly
cSwgaW50IGxldmVsLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBj
bSwgaW50IHRhcmdldCkgIHsgQEAgLTIwMSw4DQo+ID4gKzIxNiwxMCBAQCBzdGF0aWMgdm9pZCBn
aWNfc2V0X2lycSh2b2lkICpvcGFxdWUsIGludCBpcnEsIGludCBsZXZlbCkNCj4gPiAgICAgICAg
ICByZXR1cm47DQo+ID4gICAgICB9DQo+ID4NCj4gPiAtICAgIGlmIChzLT5yZXZpc2lvbiA9PSBS
RVZfMTFNUENPUkUgfHwgcy0+cmV2aXNpb24gPT0gUkVWX05WSUMpIHsNCj4gPiArICAgIGlmIChz
LT5yZXZpc2lvbiA9PSBSRVZfMTFNUENPUkUpIHsNCj4gPiAgICAgICAgICBnaWNfc2V0X2lycV8x
MW1wY29yZShzLCBpcnEsIGxldmVsLCBjbSwgdGFyZ2V0KTsNCj4gPiArICAgIH0gZWxzZSBpZiAo
cy0+cmV2aXNpb24gPT0gUkVWX05WSUMpIHsNCj4gPiArICAgICAgICBnaWNfc2V0X2lycV9udmlj
KHMsIGlycSwgbGV2ZWwsIGNtLCB0YXJnZXQpOw0KPiA+ICAgICAgfSBlbHNlIHsNCj4gPiAgICAg
ICAgICBnaWNfc2V0X2lycV9nZW5lcmljKHMsIGlycSwgbGV2ZWwsIGNtLCB0YXJnZXQpOw0KPiA+
ICAgICAgfQ0KPiA+IEBAIC01NjgsNyArNTg1LDcgQEAgdm9pZCBnaWNfY29tcGxldGVfaXJxKEdJ
Q1N0YXRlICpzLCBpbnQgY3B1LCBpbnQgaXJxLA0KPiBNZW1UeEF0dHJzIGF0dHJzKQ0KPiA+ICAg
ICAgICAgIHJldHVybjsgLyogTm8gYWN0aXZlIElSUS4gICovDQo+ID4gICAgICB9DQo+ID4NCj4g
PiAtICAgIGlmIChzLT5yZXZpc2lvbiA9PSBSRVZfMTFNUENPUkUgfHwgcy0+cmV2aXNpb24gPT0g
UkVWX05WSUMpIHsNCj4gPiArICAgIGlmIChzLT5yZXZpc2lvbiA9PSBSRVZfMTFNUENPUkUpIHsN
Cj4gPiAgICAgICAgICAvKiBNYXJrIGxldmVsIHRyaWdnZXJlZCBpbnRlcnJ1cHRzIGFzIHBlbmRp
bmcgaWYgdGhleSBhcmUgc3RpbGwNCj4gPiAgICAgICAgICAgICByYWlzZWQuICAqLw0KPiA+ICAg
ICAgICAgIGlmICghR0lDX1RFU1RfRURHRV9UUklHR0VSKGlycSkgJiYgR0lDX1RFU1RfRU5BQkxF
RChpcnEsIGNtKQ0KPiA+IEBAIC01NzYsNiArNTkzLDEyIEBAIHZvaWQgZ2ljX2NvbXBsZXRlX2ly
cShHSUNTdGF0ZSAqcywgaW50IGNwdSwgaW50IGlycSwNCj4gTWVtVHhBdHRycyBhdHRycykNCj4g
PiAgICAgICAgICAgICAgRFBSSU5URigiU2V0ICVkIHBlbmRpbmcgbWFzayAleFxuIiwgaXJxLCBj
bSk7DQo+ID4gICAgICAgICAgICAgIEdJQ19TRVRfUEVORElORyhpcnEsIGNtKTsNCj4gPiAgICAg
ICAgICB9DQo+ID4gKyAgICB9IGVsc2UgaWYgKHMtPnJldmlzaW9uID09IFJFVl9OVklDKSB7DQo+
ID4gKyAgICAgICAgaWYgKEdJQ19URVNUX0VOQUJMRUQoaXJxLCBjbSkgJiYgR0lDX1RFU1RfTEVW
RUwoaXJxLCBjbSkNCj4gPiArICAgICAgICAgICAgJiYgKEdJQ19UQVJHRVQoaXJxKSAmIGNtKSAh
PSAwKSB7DQo+ID4gKyAgICAgICAgICAgIERQUklOVEYoIlNldCBudmljICVkIHBlbmRpbmcgbWFz
ayAleFxuIiwgaXJxLCBjbSk7DQo+ID4gKyAgICAgICAgICAgIEdJQ19TRVRfUEVORElORyhpcnEs
IGNtKTsNCj4gPiArICAgICAgICB9DQo+IA0KPiBTaW1pbGFybHksIEkgdGhpbmsgdGhpcyBzaG91
bGQganVzdCBiZQ0KPiAgICAgaWYgKEdJQ19URVNUX0xFVkVMKGlycSwgY20pIHsNCj4gICAgICAg
ICBHSUNfU0VUX1BFTkRJTkcoaXJxLCBjbSk7DQo+ICAgICB9DQo+IA0KPiBiZWNhdXNlOg0KPiAg
KDEpIGZvciB0aGUgTlZJQyB0aGVyZSBpcyBvbmx5IG9uZSBDUFUgYW5kIEdJQ19UQVJHRVQoaXJx
KSBhbHdheXMgIGluZGljYXRlcw0KPiB0aGF0IElSUXMgdGFyZ2V0IGl0DQo+ICAoMikgd2UgZG9u
J3QgY2FyZSB3aGV0aGVyIHRoZSBpbnRlcnJ1cHQgaXMgZW5hYmxlZCB3aGVuIGRlY2lkaW5nICB3
aGV0aGVyDQo+IGl0IHNob3VsZCBiZSBwZW5kZWQNCj4gICgzKSB3ZSBkb24ndCBjYXJlIHdoZXRo
ZXIgdGhlIGludGVycnVwdCBpcyBsZXZlbC10cmlnZ2VyZWQgb3IgIGVkZ2UtdHJpZ2dlcmVkDQo+
IGZvciBkZWNpZGluZyB3aGV0aGVyIHRvIHJlLXBlbmQgaXQgIChzZWUgc3RhdGVtZW50IFJfWFZX
TSBpbiB0aGUgdjhNDQo+IEFSTSBBUk0gRERJMDU1M0EuYykNCj4gDQpTYW1lIGFzIGFib3ZlLiBJ
J2xsIHNlbmQgdjMuDQoNClRoYW5rcywNCk1hcmNpbg0KPiA+ICAgICAgfQ0KPiA+DQo+ID4gICAg
ICBncm91cCA9IGdpY19oYXNfZ3JvdXBzKHMpICYmIEdJQ19URVNUX0dST1VQKGlycSwgY20pOw0K
PiA+IC0tDQo+ID4gMi43LjQNCj4gDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg==
