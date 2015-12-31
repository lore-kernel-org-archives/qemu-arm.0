Received: by 10.182.158.201 with SMTP id ww9csp8685332obb;
        Thu, 31 Dec 2015 10:43:31 -0800 (PST)
X-Received: by 10.140.81.227 with SMTP id f90mr95907258qgd.54.1451587411355;
        Thu, 31 Dec 2015 10:43:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s95si22521236qgs.25.2015.12.31.10.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 10:43:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:56536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEiCB-0005xX-3M
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 13:43:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEiC2-0005gy-3A
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 13:43:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEiC0-0007yx-UT
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 13:43:22 -0500
Received: from mail-bl2on0109.outbound.protection.outlook.com
	([65.55.169.109]:12306
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEiBv-0007xj-RX; Thu, 31 Dec 2015 13:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Qd3ORq6B0U0E1HJspYh0owfZGnAYrmdx6n7w8M46PYM=;
	b=ReZdnFxA1kA7BvBuar9NOwtJ0ejx5ZYWCHu33HhOc3yozGY9P3uEYr6QfxTrEE8kfyiUlV5K789qeNyJrDIeZ1g4oD7AJatggHvTUEHLVpJURK9hbjhor+LIdjOu5nl4Z6FerTzSyJLluCpha/q7SBzHTAelXRHJ1Dm4dUeGquU=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 31 Dec 2015 18:43:14 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0361.006; Thu, 31 Dec 2015 18:43:14 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v2 5/7] bcm2836_control: add bcm2836 ARM control logic
Thread-Index: AQHRPeGpJY9Xci4daEejWsOaW2rCop7keLyAgAD8TlA=
Date: Thu, 31 Dec 2015 18:43:13 +0000
Message-ID: <BLUPR0301MB2034B2B4A3469C9822B6FC5B9EFE0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1450916731-5968-6-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=qbYVaQN=6RxJmfDWVnEwOPjr370sMr77R-dTh5obEV4w@mail.gmail.com>
In-Reply-To: <CAPokK=qbYVaQN=6RxJmfDWVnEwOPjr370sMr77R-dTh5obEV4w@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:5::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2033;
	5:ly5TxhRlab8isNVKjT6FLLnHXy2rpBqqcPQYP9IX6v6sEA7sE27KUUzttPQzud9ZAG+YbDhnex+j3pcPS6N7C2/hh/Bg6UUvtuQjsVuUsEbkbEvjy3n+1TXNv1m8sbU3o6pzeBLNSyz26nU4FM4UeQ==;
	24:V+Fjd0igwI8Z1M00EITWvupkE048QKt8i5TLvHSpIrZmJE4M6XT2yoae5H0Vr8h3KuRYWVlsFzz/epYm8grPCDMK4iMnSxISFPwJ9AzyIGM=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
x-microsoft-antispam-prvs: <BLUPR0301MB2033606AE28F49F72F1E9B5D9EFE0@BLUPR0301MB2033.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
x-forefront-prvs: 08076ABC99
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(189002)(199003)(24454002)(81156007)(102836003)(1096002)(97736004)(50986999)(40100003)(8990500004)(5001960100002)(189998001)(19580395003)(10290500002)(586003)(76176999)(5008740100001)(4326007)(87936001)(10400500002)(19580405001)(110136002)(122556002)(86612001)(5005710100001)(1411001)(2950100001)(105586002)(77096005)(10090500001)(99286002)(106356001)(15975445007)(106116001)(5004730100002)(54356999)(2900100001)(86362001)(33656002)(76576001)(92566002)(11100500001)(1220700001)(5003600100002)(5002640100001)(101416001)(74316001)(6116002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2015 18:43:13.6409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.109
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 5/7] bcm2836_control: add bcm2836 ARM
	control logic
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ljA9xics6w5d

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIDMwIERlY2VtYmVyIDIwMTUgMTk6MjENCj4gT24gV2Vk
LCBEZWMgMjMsIDIwMTUgYXQgNDoyNSBQTSwgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVt
YW5uQG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KPiA+IFRoaXMgbW9kdWxlIGlzIHNwZWNpZmljIHRv
IHRoZSBiY20yODM2IChQaTIpLiBJdCBpbXBsZW1lbnRzIHRoZSB0b3ANCj4gPiBsZXZlbCBpbnRl
cnJ1cHQgY29udHJvbGxlciwgYW5kIG1haWxib3hlcyB1c2VkIGZvciBpbnRlci1wcm9jZXNzb3IN
Cj4gPiBzeW5jaHJvbmlzYXRpb24uDQpbLi4uXQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9ody9pbnRjL2JjbTI4MzZfY29udHJvbC5jDQo+ID4gQEAgLTAsMCArMSwzMzggQEANCj4gPiAr
LyoNCj4gPiArICogUmFzcGVycnkgUGkgMiBlbXVsYXRpb24gQVJNIGNvbnRyb2wgbG9naWMgbW9k
dWxlLg0KPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTUsIE1pY3Jvc29mdA0KPiA+ICsgKiBXcml0
dGVuIGJ5IEFuZHJldyBCYXVtYW5uDQo+ID4gKyAqDQo+ID4gKyAqIEF0IHByZXNlbnQsIG9ubHkg
aW1wbGVtZW50cyBpbnRlcnJ1cHQgcm91dGluZywgYW5kIG1haWxib3hlcyAoaS5lLiwNCj4gPiAr
ICogbm90IGxvY2FsIHRpbWVyLCBQTVUgaW50ZXJydXB0LCBvciBBWEkgY291bnRlcnMpLg0KPiA+
ICsgKg0KPiA+ICsgKiBSZWY6DQo+ID4gKyAqDQo+IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLm9y
Zy9kb2N1bWVudGF0aW9uL2hhcmR3YXJlL3Jhc3BiZXJyeXBpL2JjbTI4DQo+IDM2L1FBN19yZXYz
LjQucGRmDQo+IA0KPiBUaGlzIGxvb2tzIGxpa2UgYW4gbXBjb3JlLiBDaGVjayBody9jcHUvYTlt
cGNvcmUgYW5kIGZyaWVuZHMgdG8gc2VlDQo+IGhvdyB0aG9zZSBhcmUgaW1wbGVtZW50ZWQuIEkg
dGhpbmsgdGhpcyBpcyBhcmNoaXRlY3R1cmFsbHkgT0sgZm9yIHRoZQ0KPiBtb21lbnQsIGFsdGhv
dWdoIGlmIHlvdSBpbnRlbmQgdG8gZXhwYW5kIHRoaXMgd2l0aCBUaW1lcnMgZXRjLiBpdA0KPiBz
aG91bGQgYmUgaW4gaHcvY3B1LyBhbmQgY29udGFpbmVyaXNlZC4gSSB0aGluayB0aGUgY29udGFp
bmVyaXNhdGlvbg0KPiBjYW4gaGFwcGVuIGxhdGVyIGJ1dCBzaG91bGQgYmUgcHV0IGl0IGluIGh3
L2NwdS8gc3RyYWlnaHQgdXA/DQoNCklmIG9ubHkhIEkgKGFuZCBwcm9iYWJseSBldmVyeW9uZSB0
aGF0IGhhcyBwb3J0ZWQgYW4gT1MgdG8gaXQpIHdpc2ggaXQgd2FzIGFuIG1wY29yZSBhbmQgbm90
IGFub3RoZXIgY3VzdG9tIFBpLXNwZWNpZmljIHRoaW5nIDopDQoNCllvdSBtaWdodCBoYXZlIGFu
IGFyZ3VtZW50IGZvciBtb3ZpbmcgdGhlIHdob2xlIGZpbGUgZnJvbSBody9pbnRjIHRvIGh3L2Nw
dSwgYnV0IEkgZG9uJ3QgdGhpbmsgc3BsaXR0aW5nIHRoZXNlIGZ1bmN0aW9ucyB1cCAoZXZlbiBp
ZiB3ZSBpbXBsZW1lbnRlZCB0aGVtIGFsbCBpbiB0aGUgZnV0dXJlLCB3aGljaCBJIGRvbid0IHBs
YW4gdG8gZG8gdW5sZXNzIHNvbWUgZ3Vlc3QgT1MgdHVybnMgb3V0IHRvIHVzZSB0aGVtKSBtYWtl
cyBtdWNoIHNlbnNlLiBUaGUgc3BlYyBpcyB3cml0dGVuIGFzIGlmIGl0IHdhcyBvbmUgZGV2aWNl
LCBhbmQgdGhlIHJlZ2lzdGVycyBhcmUgYWxsIGludGVybGVhdmVkIChlLmcuIHRoZSBpbnRlcnJ1
cHQgcm91dGluZyBjb25maWcgcmVnaXN0ZXJzIGFyZSBzYW5kd2ljaGVkIGluIGJldHdlZW4gdGhl
IHRpbWVyIGNvbnRyb2wvcHJlc2NhbGVyIGFuZCBzdGF0dXMgcmVnaXN0ZXJzKS4NCg0KSSByZWFs
bHkgZG9uJ3QgY2FyZSB3aGljaCBkaXJlY3RvcnkgaXQgbGl2ZXMgaW4sIGhvd2V2ZXIgLS0geW91
IGNhbiB0ZWxsIG1lIHdoYXQncyBiZXN0LiBBcyBwcmVzZW50bHkgaW1wbGVtZW50ZWQgKGFuZCBh
cyBpdCBpcyB1c2VkIGJ5IExpbnV4IGFuZCBXaW5kb3dzKSwgdGhpcyB0aGluZyBpcyBjbG9zZXN0
IHRvIGFuIGludGVycnVwdCBjb250cm9sbGVyLg0KDQpbLi4uXQ0KPiA+ICsgICAgZm9yIChpID0g
MDsgaSA8IEJDTTI4MzZfTkNPUkVTOyBpKyspIHsNCj4gPiArICAgICAgICAvKiBoYW5kbGUgbG9j
YWwgaW50ZXJydXB0cyBmb3IgdGhpcyBjb3JlICovDQo+ID4gKyAgICAgICAgaWYgKHMtPmxvY2Fs
aXJxc1tpXSkgew0KPiA+ICsgICAgICAgICAgICBhc3NlcnQocy0+bG9jYWxpcnFzW2ldIDwgKDEg
PDwgSVJRX01BSUxCT1gwKSk7DQo+IA0KPiBDdXJpb3VzLCB3aGF0IGlzIHRoZSBzb3VyY2Ugb2Yg
dGhpcyBsaW1pdGF0aW9uPw0KDQpUaGF0J3MganVzdCBzYW5pdHktY2hlY2tpbmcgYW4gaW52YXJp
YW50IG9mIG15IGltcGxlbWVudGF0aW9uLiBUaGUgbG9jYWwgaW50ZXJydXB0cyBmb3IgZWFjaCBj
b3JlIGFyZSB0aGUgZm91ciB0aW1lcnMsIHRoZSBQTVUgaW50ZXJydXB0IChOWUkpLCBhbmQgdGhl
IGZvdXIgbWFpbGJveGVzLiBIb3dldmVyLCB0aGUgbWFpbGJveGVzIHVzZSBhIHNlcGFyYXRlIHNl
dCBvZiByZWdpc3RlcnMgKGFuZCBhcmUgaGFuZGxlZCBpbiBsb2dpYyBiZWxvdyB0aGlzKSwgc28g
aXQncyBhbiBpbnRlcm5hbCBlcnJvciBpZiB3ZSBldmVyIHNlZSB0aG9zZSBiaXRzIHNldC4gVGhp
cyBjb3VsZCBiZSBiZXR0ZXIgY29tbWVudGVkLCBhbmQgdGhlIHVpbnQzMl90IGZvciBsb2NhbGly
cXMgY291bGQgYmUgYSB1aW50OC4NCg0KPiA+ICsgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwg
SVJRX01BSUxCT1gwOyBqKyspIHsNCj4gPiArICAgICAgICAgICAgICAgIGlmICgocy0+bG9jYWxp
cnFzW2ldICYgKDEgPDwgaikpICE9IDApIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAvKiBs
b2NhbCBpbnRlcnJ1cHQgaiBpcyBzZXQgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICBpZiAo
RklRX0JJVChzLT50aW1lcmNvbnRyb2xbaV0sIGopKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIGRlbGl2ZXIgYSBGSVEgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
cy0+Zmlxc3JjW2ldIHw9ICh1aW50MzJfdCkxIDw8IGo7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgfSBlbHNlIGlmIChJUlFfQklUKHMtPnRpbWVyY29udHJvbFtpXSwgaikpIHsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgLyogZGVsaXZlciBhbiBJUlEgKi8NCj4gDQo+IE92ZXJjb21t
ZW50ZWQuDQoNCk1heWJlIEknbSBtb3JlIGRlZmVuc2l2ZSBiZWNhdXNlIHRoaXMgaXMgbXkgY29k
ZSwgYnV0IEknbSByZXNwZWN0ZnVsbHkgZ29pbmcgdG8gZGlzYWdyZWUgYW5kIGlnbm9yZSB5b3Ug
b24gdGhpcyBvbmUsIGF0IGxlYXN0IHVudGlsIHRoZSBuZXh0IHBhdGNoIHNlcmllcyA6KSBJJ20g
bm90IGEgZmFuIG9mIGRlbGV0aW5nIGNvbW1lbnRzIHRoYXQgYXJlIGFjY3VyYXRlLCBjb25jaXNl
LCBhbmQgKElNSE8pIGhlbHAgdGhlIHJlYWRlciBvZiB0aGUgY29kZSBpbW1lZGlhdGVseSB1bmRl
cnN0YW5kIGl0cyBsb2dpYy4gV2UgY2FuIGRpc2N1c3MgaXQgYWdhaW4gaW4gdjMgaWYgeW91IGZl
ZWwgc3Ryb25nbHkgYWJvdXQgaXQuDQoNCkFuZHJldw0K
