Received: by 10.182.158.201 with SMTP id ww9csp3091215obb;
        Mon, 21 Dec 2015 15:59:20 -0800 (PST)
X-Received: by 10.140.23.163 with SMTP id 32mr28965676qgp.60.1450742360393;
        Mon, 21 Dec 2015 15:59:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 97si31749089qkt.81.2015.12.21.15.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Dec 2015 15:59:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:47866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBAMK-0002WA-7J
	for alex.bennee@linaro.org; Mon, 21 Dec 2015 18:59:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBAMH-0002Ta-UD
	for qemu-arm@nongnu.org; Mon, 21 Dec 2015 18:59:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBAMG-0003dS-Ut
	for qemu-arm@nongnu.org; Mon, 21 Dec 2015 18:59:17 -0500
Received: from mail-bn1bon0115.outbound.protection.outlook.com
	([157.56.111.115]:24032
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aBAMB-0003d6-J4; Mon, 21 Dec 2015 18:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=1Ih9uNFEPDmtqVZoTsRmcPaMrwF8zZQ/ckqYzV15UnU=;
	b=c2uDNHDAbq91hizVxIc3Ig/3lAEwSZ4lDURIAQ4MTVmTAM23OevUpj9YRiG7QyVY9O3kVsaeXaP/GqVDusgQo01EdldnvmkgdFCdstFyI7bCxtny7CFiXhEfOpxpTsy+SKEne+qmVO4kVCFRKIcSmD16+PbO90kh//mkNqPau5s=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Mon, 21 Dec 2015 23:59:09 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0361.006; Mon, 21 Dec 2015 23:59:09 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
Thread-Index: AQHRLllz7K4EEY2RuUSr8mGMJ47UG57WJvIAgAAByCCAAAqKgIAAA7pg
Date: Mon, 21 Dec 2015 23:59:08 +0000
Message-ID: <BLUPR0301MB20346F742566A4E726E0135B9EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=rGg5pG_XFL0c6C-i-Mkobzd+D-KgrUE1bdt1RBsD3bGg@mail.gmail.com>
	<BLUPR0301MB20345C0D49B62FE27C9BB9439EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=owo1JtwWzDneGm9b+xe708eRDLXDQGgvVm1kkSLMo-hg@mail.gmail.com>
In-Reply-To: <CAPokK=owo1JtwWzDneGm9b+xe708eRDLXDQGgvVm1kkSLMo-hg@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:b::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2033;
	5:1Vs757h/jYz5Yoqyau/0jj1j1lHo6iYyZjEA8oKPgAaFXYZ4qc/xLRaiNTZwnSfWAKycgyHhn7ANQba9brvOPoDc0Ylw/eXwqFPAYTUCNoqI3/CekDkzHyTXiFD346A0w1ISDHpisrsJIqCKK3EVrg==;
	24:fSrxsF69/VEVGqI5l1Bw0HxSd35bWtR4e70R7YjzjsUihQbK5jPJ/xg5dtGSnvcJkACiV+NMTHfIAamLla3iKIMfjcvUdG5jVmR0MsetrEI=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
x-microsoft-antispam-prvs: <BLUPR0301MB20339F4D271F4BA4414F16D79EE40@BLUPR0301MB2033.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(520078)(5005006)(8121501046)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
x-forefront-prvs: 079756C6B9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(377454003)(199003)(24454002)(5002640100001)(5001960100002)(10090500001)(1220700001)(10290500002)(10710500006)(74316001)(77096005)(5004730100002)(76576001)(122556002)(54356999)(102836003)(5005710100001)(5008740100001)(93886004)(11100500001)(101416001)(10400500002)(586003)(6116002)(15975445007)(76176999)(5003600100002)(99286002)(2950100001)(7110500001)(1096002)(189998001)(50986999)(19625735002)(97736004)(33656002)(40100003)(19580405001)(86612001)(86362001)(8990500004)(1411001)(19580395003)(106116001)(106356001)(110136002)(87936001)(105586002)(81156007)(2900100001)(2420400006)(92566002)(3826002);
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2015 23:59:08.7177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.115
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
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
X-TUID: I7nI1sNtIipb

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBNb25kYXksIDIxIERlY2VtYmVyIDIwMTUgMTU6MzMNCj4gT24gTW9uLCBE
ZWMgMjEsIDIwMTUgYXQgMzoxNSBQTSwgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVtYW5u
QG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KPiA+PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFp
bHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwuY29tXQ0KPiA+PiBTZW50OiBNb25kYXksIDIxIERl
Y2VtYmVyIDIwMTUgMTQ6NDkNCj4gPj4gT24gVGh1LCBEZWMgMywgMjAxNSBhdCAxMDowMSBQTSwg
QW5kcmV3IEJhdW1hbm4NCj4gPj4gPEFuZHJldy5CYXVtYW5uQG1pY3Jvc29mdC5jb20+IHdyb3Rl
Og0KPiA+PiA+ICsNCj4gPj4gPiArICAgIHN3aXRjaCAob2Zmc2V0KSB7DQo+ID4+ID4gKyAgICBj
YXNlIDB4ODA6ICAvKiBNQUlMMF9SRUFEICovDQo+ID4+ID4gKyAgICBjYXNlIDB4ODQ6DQo+ID4+
ID4gKyAgICBjYXNlIDB4ODg6DQo+ID4+ID4gKyAgICBjYXNlIDB4OGM6DQo+ID4+DQo+ID4+IGNh
c2UgMHg4MC4uMHg4Yw0KPiA+DQo+ID4gV29haCEgSXMgdGhhdCBzdGFuZGFyZCBDPw0KPiA+DQo+
IA0KPiBZZXMsIGl0cyBwcm9iYWJseSBvbmUgb2YgdGhlIG1vcmUgcmVjZW50IGxhbmd1YWdlIHN0
YW5kYXJkcyB0aG91Z2guDQo+IFFFTVUgZG9lcyB1c2UgdG8gbW9yZSBtb2Rlcm4gZmVhdHVyZXMg
bGliZXJhbGx5Lg0KDQpOb3R3aXRoc3RhbmRpbmcgdGhhdCBpdCdzIHdpZGVseSB1c2VkIGluIFFF
TVUgKGFuZCBhIG5pY2UgZmVhdHVyZSB0b28pLCBhbmQgbm90IHRoYXQgSSBoYXZlIGEgcHJvYmxl
bSB3aXRoIGFkb3B0aW5nIGl0LCBidXQganVzdCBiZWNhdXNlIEknbSBhIHBlZGFudDogdGhpcyBp
cyBkZWZpbml0ZWx5IG5vdCBpbiBDOTkgKHBlciBxZW11L0hBQ0tJTkcpLiBJdCBkb2Vzbid0IGFw
cGVhcnMgaW4gQzExIGVpdGhlciAoYXQgbGVhc3Qgbm90IHRoZSBmaW5hbCBkcmFmdCkuIEl0J3Mg
YSBnY2MgZXh0ZW5zaW9uOg0KaHR0cDovL2djYy5nbnUub3JnL29ubGluZWRvY3MvZ2NjL0Nhc2Ut
UmFuZ2VzLmh0bWwNCg0KPiA+IFsuLi5dDQo+ID4+ID4gLS0tIC9kZXYvbnVsbA0KPiA+PiA+ICsr
KyBiL2luY2x1ZGUvaHcvYXJtL2JjbTI4MzVfYXJtX2NvbnRyb2wuaA0KPiA+PiA+IEBAIC0wLDAg
KzEsNDgxIEBADQo+ID4+ID4gKy8qDQo+ID4+ID4gKyAqICBsaW51eC9hcmNoL2FybS9tYWNoLWJj
bTI3MDgvYXJtX2NvbnRyb2wuaA0KPiA+IFsuLi5dDQo+ID4+IFdoZW4geW91IGhhdmUgYSByZWd1
bGFyIHN0cnVjdHVyZSBsaWtlIHRoaXMsIHlvdSBzaG91bGQgY29sbGFwc2UgaXQNCj4gPj4gZG93
biB1c2luZyBzb21lIGFyaXRobWF0aWM6DQo+ID4NCj4gPiBOb3RpY2UgdGhhdCB0aGlzIGZpbGUg
Y29tZXMgZnJvbSBMaW51eC4gSSBrbm93IGl0J3Mgbm90IHByZXR0eSwgYnV0IGNhbiB3ZQ0KPiBw
bGVhc2Uga2VlcCBpdCBhcy1pcywgZm9yIGNvbXBhcmlzb24gcHVycG9zZXM/IEknbSBub3Qgc3Vy
ZSB0aGVyZSdzIG11Y2gNCj4gdmFsdWUgaW4gY2xlYW5pbmcgaXQgdXAgbG9jYWxseS4uLg0KPiA+
DQo+IA0KPiBJdCBsb29rcyB2ZXJ5IGF1dG9nZW5lcmF0ZWQgYW5kIHNlZW1zIHByZXR0eSBuYXN0
eSBvbiB0aGUgcmVwZXRpdGlvbi4NCj4gDQo+IEFzIGltcGxlbWVudGVycyBvZiB0aGUgaGFyZHdh
cmUsIGl0IGlzIG11Y2ggcmFyZXIgdG8gbmVlZCB0aGVzZQ0KPiByZXBldGl0aW91cyBkZWZzIHRo
YW4gdGhlIHNvZnR3YXJlIHVzZXJzIG9uIHRoZSBvdGhlciBzaWRlLiAiRG8NCj4gc29tZXRoaW5n
IHNwZWNpZmljIHdpdGggQ1BVIzMncyBNYm94IzUiIGlzIGdvaW5nIHRvIGFwcGVhciBpbg0KPiBz
b2Z0d2FyZSwgYnV0IGhhcmR3YXJlIGltcGxlbWVudGVycyBnZW5lcmFsbHkgZG9uJ3QgaGF2ZSBh
IGNob2ljZSB0bw0KPiBpbXBsZW1lbnQgdGhpbmdzIHNwZWNpZmljYWxseSBhbmQgaXQgdXN1YWxs
eSBlbmRzIHVwIGJlaW5nIGxvb3BlZCBhbmQNCj4gdGhlIGV4cGxvZGVkIGRlZnMgYXJlIG5ldmVy
IHVzZWQuIElmIHRoZXJlIGFyZSBvbmx5IGEgaGFuZGZ1bCBvZg0KPiBnZW51aW5lbHkgc2luZ2xl
IGRlZnMgbmVlZGVkLCBjYW4gdGhleSBiZSBmaXNoZWQgb3V0Pw0KDQpJIHRoaW5rIHNvLiBJJ2xs
IGRvIHRoYXQgdGhlbi4NCg0KQW5kcmV3DQo=
