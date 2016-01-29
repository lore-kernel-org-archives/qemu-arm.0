Received: by 10.25.159.19 with SMTP id i19csp1200621lfe;
        Fri, 29 Jan 2016 14:44:23 -0800 (PST)
X-Received: by 10.55.18.36 with SMTP id c36mr13610827qkh.54.1454107463809;
        Fri, 29 Jan 2016 14:44:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g131si17353350qkb.102.2016.01.29.14.44.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:44:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHmB-0007LK-AY
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:44:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHlt-0006sC-F3
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:44:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHls-0007Hc-5g
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:44:05 -0500
Received: from mail-bn1bbn0108.outbound.protection.outlook.com
	([157.56.111.108]:62174
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPHln-0007Ey-H9; Fri, 29 Jan 2016 17:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DedBBm2HW93/micu2rj9KBe1WDILkobs8n6vx4dVg8o=;
	b=GaM4/UQYqPDGvH3XqaTX59Tp1eUPioNXmQpdHzp8CGn7eGmeW8s0cE8O4nur/1mqyG5NAqCPTD+AlMD0bcYYGItEY089z7UUNxkvwGu0zGtzFqSUz28iPIloAd0JufwoCRCRr0TD8uvi35L3I9k1ibIj/5kqAU24ZboCPGHSkC8=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 22:43:57 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0390.017; Fri, 29 Jan 2016 22:43:57 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	=?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Thread-Topic: [PATCH v4 8/8] raspi: add raspberry pi 2 machine
Thread-Index: AQHRT/DG10Xdqk9Vq0G0qXu0O32qRp8SLiwAgADtG8CAAAv3gIAAAGJQgAAEugCAAABoMA==
Date: Fri, 29 Jan 2016 22:43:56 +0000
Message-ID: <BLUPR0301MB203455098ADBFD2229A6E32C9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-9-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=ory3pnNPsBgde12BqGGW_L3QOG0OVdtLNJomK0QhxxYQ@mail.gmail.com>
	<BLUPR0301MB2034170EF1FBCB3856E044FB9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=pLw9OVv3_FHedk12byTu0gjGFy80UT1T1TUFTewi5kpg@mail.gmail.com>
	<BLUPR0301MB2034C0FA82D60BAF82916E779EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=qsgcxVkuU9yRTDV+NXkyqQpUT8mMhZmk_QN4yE_PEg=w@mail.gmail.com>
In-Reply-To: <CAPokK=qsgcxVkuU9yRTDV+NXkyqQpUT8mMhZmk_QN4yE_PEg=w@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:2::2e3]
x-ms-office365-filtering-correlation-id: e9a9225f-361d-4370-a3cf-08d328fdac96
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:9ZFCNDEn5RbE5J+dU2SINxbUi63jPnDZWicacgqj4dBRd69fzd8cEmkQhoMLdpiFn6Q33A+1S4ypNOPYGb0K93WIo2kr38jas4iugsqYe3aRz0k2ejGknotAcyN+21o6i+yWfEdI20S6TGvVUm1JAQ==;
	24:bI+6t47zb02vEjwSDiz00jDLRXEy1e4iKuJi8KKbJBFCGwqicAgKBd66CQFIVTFkhuobNftSlPup3sW3QjcnJabOyu15HVHI+3vIc77CnLw=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-microsoft-antispam-prvs: <BLUPR0301MB20367D6D9612D916F35EAAA99EDB0@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 083691450C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(24454002)(33656002)(4326007)(87936001)(74316001)(5008740100001)(5002640100001)(3660700001)(10290500002)(92566002)(19580395003)(77096005)(2906002)(19580405001)(10400500002)(11100500001)(10090500001)(5004730100002)(8990500004)(5005710100001)(106116001)(122556002)(3470700001)(40100003)(5001960100002)(3280700002)(2950100001)(1096002)(1220700001)(99286002)(102836003)(6116002)(5003600100002)(76576001)(93886004)(5001770100001)(586003)(2900100001)(86612001)(189998001)(86362001)(54356999)(76176999)(50986999)(15975445007)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2016 22:43:56.9574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.108
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 8/8] raspi: add raspberry pi 2 machine
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
X-TUID: L3kEVyrYbhur

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBGcmlkYXksIDI5IEphbnVhcnkgMjAxNiAxNDo0MQ0KPiANCj4gT24gRnJp
LCBKYW4gMjksIDIwMTYgYXQgMjoyOCBQTSwgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVt
YW5uQG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KPiA+PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBb
bWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwuY29tXQ0KPiA+PiBTZW50OiBGcmlkYXksIDI5
IEphbnVhcnkgMjAxNiAxNDoyMw0KPiA+Pg0KPiA+PiBPbiBGcmksIEphbiAyOSwgMjAxNiBhdCAx
OjUwIFBNLCBBbmRyZXcgQmF1bWFubg0KPiA+PiA8QW5kcmV3LkJhdW1hbm5AbWljcm9zb2Z0LmNv
bT4gd3JvdGU6DQo+ID4+ID4gSGkgUGV0ZXIsDQo+ID4+ID4NCj4gPj4gPiBUaGFua3MgZm9yIGFs
bCB0aGUgcmV2aWV3cy4gSSBzaG91bGQgaGF2ZSBhIHJlc3B1biB2ZXJzaW9uIG9uIHRoZSBsaXN0
DQo+IHNob3J0bHkuDQo+ID4+IFRoZXJlJ3Mgb25lIG1pbm9yIGNoYW5nZSB0byB0aGlzIGxhc3Qg
cGF0Y2g6DQo+ID4+ID4NCj4gPj4gPj4gRnJvbTogUGV0ZXIgQ3Jvc3Rod2FpdGUgW21haWx0bzpj
cm9zdGh3YWl0ZXBldGVyQGdtYWlsLmNvbV0NCj4gPj4gPj4gU2VudDogVGh1cnNkYXksIDI4IEph
bnVhcnkgMjAxNiAyMzozMQ0KPiA+PiA+PiA+IE9uIEZyaSwgSmFuIDE1LCAyMDE2IGF0IDM6NTgg
UE0sIEFuZHJldyBCYXVtYW5uDQo+ID4+IDxBbmRyZXcuQmF1bWFubkBtaWNyb3NvZnQuY29tPiB3
cm90ZToNCj4gPj4gPiAgWy4uLl0NCj4gPj4gPj4gPiArdHlwZWRlZiBzdHJ1Y3QgUmFzcGlTdGF0
ZSB7DQo+ID4+ID4+DQo+ID4+ID4+IEEgcXVpY2sgZ29vZ2xlIHNlYXJjaCwgSSBzZWUgdGhlIGNh
bWVsIGNhc2UgZm9ybSBmb3IgcnBpIGlzIHVzdWFsbHkNCj4gPj4gPj4gIlJhc1BpIi4gU2hvdWxk
IHdlIGZvbGxvdz8NCj4gPj4gPg0KPiA+PiA+IE9rLg0KPiA+PiA+DQo+ID4+ID4+ID4gKyAgICB1
bmlvbiB7DQo+ID4+ID4+DQo+ID4+ID4+IHVuaW9uIG5vdCBuZWVkZWQuDQo+ID4+ID4NCj4gPj4g
PiBJIGtub3cgaXQncyBub3QgbmVlZGVkIG5vdywgYnV0IGl0IHdpbGwgYmUgYXMgc29vbiBhcyB3
ZSBhZGQgcGkxLCB3aGljaCBJDQo+ID4+IGhvcGUgdG8gYWRkcmVzcyBpbiB0aGUgbmV4dCBwYXRj
aCBzZXJpZXMuIEl0IHdpbGwgbWFrZSB0aGF0IGRpZmYgY2xlYW5lciBpZg0KPiB3ZQ0KPiA+PiBr
ZWVwIHRoaXMgaGVyZSBub3csIHNvIEknbSBnb2luZyB0byBsZWF2ZSBpdCBhcy1pcy4gSSBob3Bl
IHRoYXQncyBvayB3aXRoIHlvdS4NCj4gPj4gPg0KPiA+Pg0KPiA+PiBJdCBzb3VuZHMgbGlrZSB5
b3UgYXJlIGltcGxlbWVudGluZyBhbiBpbmhlcml0YW5jZSBvdXRzaWRlIFFPTS4gSSdtDQo+ID4+
IG5vdCBzdXJlIGFib3V0IHRoaXMsIGNhbiB3ZSBqdXN0IGRyb3AgdGhlIHVuaW9uIGFuZCBmaWd1
cmUgaXQgb3V0IG9uDQo+ID4+IHRoZSBuZXh0IHNlcmllcz8NCj4gPg0KPiA+IEl0J3Mgbm90aGlu
ZyBuZWFybHkgdGhhdCBjbGV2ZXIvY29tcGxpY2F0ZWQuIFNlZQ0KPiBodHRwczovL2dpdGh1Yi5j
b20vMHhhYnUvcWVtdS9ibG9iL3Jhc3BpL2h3L2FybS9yYXNwaS5jI0wxMTYNCj4gPg0KPiA+ICAg
ICBzd2l0Y2ggKHZlcnNpb24pIHsNCj4gPiAgICAgY2FzZSAxOg0KPiA+ICAgICAgICAgb2JqZWN0
X2luaXRpYWxpemUoJnMtPnNvYy5waTEsIHNpemVvZihzLT5zb2MucGkxKSwgVFlQRV9CQ00yODM1
KTsNCj4gPiAgICAgICAgIGJyZWFrOw0KPiA+ICAgICBjYXNlIDI6DQo+ID4gICAgICAgICBvYmpl
Y3RfaW5pdGlhbGl6ZSgmcy0+c29jLnBpMiwgc2l6ZW9mKHMtPnNvYy5waTIpLCBUWVBFX0JDTTI4
MzYpOw0KPiA+ICAgICAgICAgYnJlYWs7DQo+ID4gICAgIH0NCj4gPg0KPiA+IEFuZCB0aGVuIGxh
dGVyLCB3ZSBhbHdheXMgcmVmZXIgc2ltcGx5IHRvIE9CSkVDVCgmcy0+c29jKS4gSSBzdXBwb3Nl
IEkNCj4gY291bGQgdXNlIGEgZ2VuZXJpYyBPYmplY3QgcG9pbnRlciBpbnN0ZWFkLCBhbmQgYWxs
b2NhdGUgdGhlIHNvYy1zcGVjaWZpYyB0eXBlDQo+IGVsc2V3aGVyZSwgYnV0IGl0IHNlZW1lZCBz
aW1wbGVyIHdpdGggdGhlIHVuaW9uLg0KPiA+DQo+IA0KPiBCdXQgdGhpcyBpcyBlZmZlY3RpdmVs
eSBhbiB1cGNhc3QgdG8gYW4gYWJzdHJhY3QgdHlwZSwgaGVyZToNCj4gDQo+ICsNCj4gKyAgICAv
KiBTZXR1cCB0aGUgU09DICovDQo+ICsgICAgb2JqZWN0X3Byb3BlcnR5X2FkZF9jb25zdF9saW5r
KE9CSkVDVCgmcy0+c29jKSwgInJhbSIsIE9CSkVDVCgmcy0NCj4gPnJhbSksDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZlcnJvcl9hYm9ydCk7DQo+ICsgICAgb2JqZWN0
X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZzLT5zb2MpLCBzbXBfY3B1cywgImVuYWJsZWQtY3B1
cyIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmVycm9yX2Fib3J0KTsNCj4gDQo+
IFdoZXJlIHRoYXQgY29uY3JldGUgdHlwZSBtdXN0cyBpbXBsZW1lbnQgInJhbSIgYW5kICJlbmFi
bGVkLWNwdXMiLiBTbw0KPiBJIGFtIHVuc3VyZSBvZiBoYXZpbmcgYSBzcGxpdCBpbXBsZW1lbnRh
dGlvbiBvZiAicmFtIiwgImVuYWJsZWQtY3B1cyINCj4gZXRjIGZyb20gb25lIFNvQyB0byB0aGUg
b3RoZXIgYXMgeW91IGFyZSB1c2luZyBhIFFPTSBwcm9wZXJ0eSBuYW1lIGFzDQo+IGFuIGFic3Ry
YWN0IGludGVyZmFjZSBkZWZpbml0aW9uLg0KDQpPaywgZmFpciBlbm91Z2guIEluZGVlZCwgImVu
YWJsZWQtY3B1cyIgaXMgYWN0dWFsbHkgYSBidWcgdGhlcmUgZm9yIHBpMS4gSSdsbCBkcm9wIHRo
ZSB1bmlvbiBmb3Igbm93LCBhbmQgcmV3b3JrIGl0IGZvciBwaTEuDQoNCkFuZHJldw0K
