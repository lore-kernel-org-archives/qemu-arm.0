Received: by 10.25.208.211 with SMTP id h202csp1894050lfg;
        Tue, 1 Mar 2016 16:19:26 -0800 (PST)
X-Received: by 10.55.73.199 with SMTP id w190mr29738099qka.77.1456877956176;
        Tue, 01 Mar 2016 16:19:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y20si6505230qka.117.2016.03.01.16.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 16:19:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:53252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aauVX-000607-Kt
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 19:19:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aauVV-0005xp-KV
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 19:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aauVU-0003za-FP
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 19:19:13 -0500
Received: from mail-bl2on0114.outbound.protection.outlook.com
	([65.55.169.114]:3356
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aauVP-0003y3-Q9; Tue, 01 Mar 2016 19:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=xt3jw4IQ+e4j/sZmHFjFJj2ghtoXz34I5Avsp3Ir1HM=;
	b=WP5n9BLyKhtZdalqRslGF7X80R/CC5xXnjR9JId6LEhT7A7D6mPEedQnjw0AQOK7YoGPAwMNjc4hnh4QXMIwmR+KtGAZyMhR8IWPHk3EunkKBY2cFahgJpH5FgEeTUOP4+2a8wWzLY6GQJ9hMipVGgSmhi0bJfLugM5pUn7J+y4=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.415.20; Wed, 2 Mar 2016 00:19:06 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0415.022; Wed, 2 Mar 2016 00:19:06 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH 3/4] bcm2835_fb: add framebuffer device for Raspberry Pi
Thread-Index: AQHRcPSfOj75uHNqUkyWiHoTi1nL859E/ayAgABQoQA=
Date: Wed, 2 Mar 2016 00:19:06 +0000
Message-ID: <BLUPR0301MB20348F5E58AD95D26649F04C9EBC0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1456532174-17432-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA9qA_xDy52wVF8wzxxdVVg2MgLbHPcJh4z9de-3Dh-r2g@mail.gmail.com>
In-Reply-To: <CAFEAcA9qA_xDy52wVF8wzxxdVVg2MgLbHPcJh4z9de-3Dh-r2g@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:6::724]
x-ms-office365-filtering-correlation-id: 7f598ac5-67bb-4b5d-26f4-08d342304475
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:qoxiv06K/N7idesfqKAo0O+hcfHsNzVjaWtMV/Zdjz9PaSDyS+wbXCmb8PjhjvVIHZsE5kmWyZYK2DhZmmWYGhmvWPXAQoyRaMeJh+8x39g8Fc85TRnpah+X3iqMQ8cNccZPHTs2V7v0+Dtfs6JgIA==;
	24:jcpKUexibIVYnoJvIhx4l9VcejYC4BR7BZ3lDbRPlx9pB2aw0JodVasKQpFBNX60uac98yvfaRxGNY4AzOpLukDy4nc7VXuzOtjLnOk4lF4=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB2034FAF89B3A1FBC93EA6A909EBC0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(52604005)(377454003)(24454002)(86362001)(1096002)(92566002)(19580395003)(11100500001)(76576001)(5002640100001)(19580405001)(74316001)(1220700001)(586003)(102836003)(86612001)(110136002)(81156009)(5001960100004)(6116002)(50986999)(5004730100002)(122556002)(106116001)(54356999)(99286002)(76176999)(2900100001)(3280700002)(77096005)(3660700001)(87936001)(10090500001)(10400500002)(10290500002)(5003600100002)(5005710100001)(5008740100001)(40100003)(4326007)(189998001)(33656002)(2950100001)(2906002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2016 00:19:06.1263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.114
Cc: =?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 3/4] bcm2835_fb: add framebuffer device for
	Raspberry Pi
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
X-TUID: ctPud0Cr6AKM

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBUdWVzZGF5LCAxIE1hcmNoIDIwMTYgMTE6MjMgQU0NCj4gDQo+IE9uIDI3IEZlYnJ1
YXJ5IDIwMTYgYXQgMDA6MTYsIEFuZHJldyBCYXVtYW5uDQo+IDxBbmRyZXcuQmF1bWFubkBtaWNy
b3NvZnQuY29tPiB3cm90ZToNCj4gPiBUaGUgZnJhbWVidWZmZXIgb2NjdXBpZXMgdGhlIHVwcGVy
IHBvcnRpb24gb2YgbWVtb3J5ICg2NE1pQiBieQ0KPiA+IGRlZmF1bHQpLCBidXQgaXQgY2FuIG9u
bHkgYmUgY29udHJvbGxlZC9jb25maWd1cmVkIHZpYSBhIHN5c3RlbQ0KPiA+IG1haWxib3ggb3Ig
cHJvcGVydHkgY2hhbm5lbCAodG8gYmUgYWRkZWQgYnkgYSBzdWJzZXF1ZW50IHBhdGNoKS4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBCYXVtYW5uIDxBbmRyZXcuQmF1bWFubkBtaWNy
b3NvZnQuY29tPg0KPiANCj4gTW9zdGx5IGxvb2tzIG9rLCBidXQgYSBjb3VwbGUgb2YgcG9pbnRz
Og0KPiANCj4gPiArc3RhdGljIHZvaWQgZHJhd19saW5lX3NyYzE2KHZvaWQgKm9wYXF1ZSwgdWlu
dDhfdCAqZHN0LCBjb25zdCB1aW50OF90DQo+ICpzcmMsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgd2lkdGgsIGludCBkZXN0c3RlcCkNCj4gPiArew0KPiA+ICsgICAgQkNN
MjgzNUZCU3RhdGUgKnMgPSBvcGFxdWU7DQo+ID4gKyAgICB1aW50MTZfdCByZ2I1NjU7DQo+ID4g
KyAgICB1aW50MzJfdCByZ2I4ODg7DQo+ID4gKyAgICB1aW50OF90IHIsIGcsIGI7DQo+ID4gKyAg
ICBEaXNwbGF5U3VyZmFjZSAqc3VyZmFjZSA9IHFlbXVfY29uc29sZV9zdXJmYWNlKHMtPmNvbik7
DQo+ID4gKyAgICBpbnQgYnBwID0gc3VyZmFjZV9iaXRzX3Blcl9waXhlbChzdXJmYWNlKTsNCj4g
PiArDQo+ID4gKyAgICB3aGlsZSAod2lkdGgtLSkgew0KPiA+ICsgICAgICAgIHN3aXRjaCAocy0+
YnBwKSB7DQo+ID4gKyAgICAgICAgY2FzZSA4Og0KPiA+ICsgICAgICAgICAgICByZ2I4ODggPSBs
ZGxfcGh5cygmcy0+ZG1hX2FzLCBzLT52Y3JhbV9iYXNlICsgKCpzcmMgPDwgMikpOw0KPiANCj4g
RG9uJ3QgdXNlIGxkbF9waHlzKCkgaW4gZGV2aWNlIG1vZGVsIGNvZGUsIHBsZWFzZS4gSXQgbWVh
bnMgImRvDQo+IGEgbG9hZCB3aXRoIHRoZSBlbmRpYW5uZXNzIG9mIHRoZSBDUFUncyBidXMiLCBh
bmQgZ2VuZXJhbGx5DQo+IGRldmljZSBiZWhhdmlvdXIgZG9lc24ndCBkZXBlbmQgb24gdGhlIHdo
YXQgdGhlIENQVSBoYXBwZW5zIHRvDQo+IGJlIGRvaW5nLiBJZiB5b3UgZG8gYSBncmVwIGZvciAn
bGRbYS16XSpfcGh5cycgaW4gaHcvIHlvdSdsbCBmaW5kDQo+IHRoYXQgKGFwYXJ0IGZyb20gYSBm
ZXcgc3B1cmlvdXMgbWF0Y2hlcykgdGhlIG9ubHkgdGhpbmdzIGRvaW5nIHRoaXMNCj4gYXJlIHNv
bWUgYmNtMjgzNSBjb2RlIHRoYXQgeW91IHNob3VsZCBmaXggYW5kIHRoZSBzcGFwciBoeXBlcmNh
bGwNCj4gZGV2aWNlICh3aGljaCByZWFsbHkgaXMgbGVnaXRpbWF0ZWx5IGNwdS1iZWhhdmlvdXIt
ZGVwZW5kZW50KS4NCj4NCj4gWW91IG5lZWQgdG8gZGV0ZXJtaW5lIHdoYXQgZW5kaWFubmVzcyB0
aGUgZGV2aWNlIHVzZXMgdG8gZG8NCj4gaXRzIERNQSBhY2Nlc3NlcywgYW5kIHVzZSBlaXRoZXIg
bGRsX2xlX3BoeXMoKSBvciBsZGxfYmVfcGh5cygpDQo+IGFzIGFwcHJvcHJpYXRlLiAoT3IgYWRk
cmVzc19zcGFjZV9sZGxfbGUvYmUgaWYgeW91IGNhcmUgYWJvdXQNCj4gbWVtb3J5IGF0dHJpYnV0
ZXMuKQ0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJJ2xsIGdldCB0aGUgb3RoZXIg
aW5zdGFuY2VzIGZpeGVkICh0aGV5IGFyZSBhbGwgbGUpLg0KDQo+IE1vcmUgaW50ZXJlc3Rpbmds
eSwgd2h5IGNhbid0IHlvdSBqdXN0IHJlYWQgZnJvbSB0aGUgc291cmNlDQo+IHBvaW50ZXIgeW91
J3JlIHBhc3NlZCBpbiBoZXJlPyBUaGUgZnJhbWVidWZmZXJfdXBkYXRlX2Rpc3BsYXkoKQ0KPiBj
b2RlIHNob3VsZCBoYXZlIG9idGFpbmVkIGl0IGJ5IGxvb2tpbmcgdXAgdGhlIGxvY2F0aW9uIG9m
IHRoZQ0KPiBob3N0IFJBTSB3aGVyZSB0aGUgZ3Vlc3QgdmlkZW8gUkFNIGlzLCBzbyBpZiB5b3Ug
aWdub3JlIGl0IGFuZA0KPiBkbyBhIGNvbXBsZXRlIHBoeXNpY2FsLWFkZHJlc3MtdG8tbWVtb3J5
LXJlZ2lvbiBsb29rdXAgZm9yIGV2ZXJ5DQo+IHBpeGVsIGl0J3MgZ29pbmcgdG8gbWFrZSByZWRy
YXdzIHVubmVjZXNzYXJpbHkgc2xvdy4NCg0KVGhhdCBpcyB3aGF0J3MgaGFwcGVuaW5nIGZvciB0
aGUgMTYtLCAyNC0gYW5kIDMyLWJpdCBtb2Rlcy4gRm9yIDgtYml0LCBpdCBhcHBlYXJzIHRvIGJl
IGRvaW5nIGEgcGFsZXR0ZSBsb29rdXAgKHVzaW5nIHRoZSA4LWJpdCB2YWx1ZSBhdCB0aGUgcG9p
bnRlciBhcyBhbiBpbmRleCBpbnRvIHRoZSAyNTYtY29sb3VyIHBhbGV0dGUgc3RhcnRpbmcgYXQg
dmNyYW1fYmFzZSkuIFlvdXIgcG9pbnQgdGhhdCB0aGlzIGlzIGluZWZmaWNpZW50IHN0YW5kcywg
YnV0IHRoZSB0cmFuc2xhdGlvbiBhZmZvcmRlZCBieSB0aGUgZXhpc3RpbmcgZnJhbWVidWZmZXIg
Y29kZSBkb2Vzbid0IGhlbHAuIEknbSB0ZW1wdGVkIHRvIHJlcGxhY2UgaXQgd2l0aCBsZGxfbGVf
cGh5cyBhcyBhIHF1aWNrIGZpeC4NCg0KUmVnYXJkcywNCkFuZHJldw0K
