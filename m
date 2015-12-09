Received: by 10.182.158.201 with SMTP id ww9csp810951obb;
        Wed, 9 Dec 2015 10:17:44 -0800 (PST)
X-Received: by 10.140.238.137 with SMTP id j131mr242440qhc.88.1449685064525;
        Wed, 09 Dec 2015 10:17:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y65si9996209qhy.43.2015.12.09.10.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 10:17:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:37293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6jJA-0004Lr-3i
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 13:17:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a6jJ4-0004Ev-MD
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 13:17:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a6jJ2-0000xW-Vy
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 13:17:38 -0500
Received: from mail-by2on0143.outbound.protection.outlook.com
	([207.46.100.143]:27412
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a6jIw-0000wo-0c; Wed, 09 Dec 2015 13:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=oHy07uQpWnsM2GOtBxUaHHf2gXq0JA6Q4Df0gzrRocI=;
	b=NiPWFcD8WDt2DJp+7u+L4UKGaaa+/aKNdisx1j3eMn6sWD83yBlW+glk+1yvGrcBgPyJFQ0mtBrjKxO1V1kQuUSPAWfL5asbpPWKfIZhPILSJilEn/AGtUBnAlieS0Npxt0Gapr/rzmeCpnrH5EAaRm4GikDMZ9tTGznQAduwvE=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Wed, 9 Dec 2015 18:17:27 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0337.015; Wed, 9 Dec 2015 18:17:27 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, Igor Mitsyanko
	<i.mitsyanko@gmail.com>
Thread-Topic: [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD controller
Thread-Index: AQHRLll1HRRnDohiT0GC4gj9UCGaxJ69cGeAgARdtiCAAH7lAIAAnAgg
Date: Wed, 9 Dec 2015 18:17:27 +0000
Message-ID: <BLUPR0301MB203408E90349BF451ED484B79EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
	<BLUPR0301MB2034314DC44EA275D6FC79FA9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=poJ66bAJDx18WAtvuMCi-_fA=zBUAZAmzxP9Ke3BAzAw@mail.gmail.com>
In-Reply-To: <CAPokK=poJ66bAJDx18WAtvuMCi-_fA=zBUAZAmzxP9Ke3BAzAw@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:e::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:JOeYpaXYXoeM1KedxNI5DcUPGvZbFhnhxSGvilEshuPkfgKDWDBwd6IbF55QnMZZKvCfwoqc+EHfw76th/rskqbSJuGV2Z6BfXxyG5Xo0S+PR0pbIX+98h9vPvtH2dY+WYA5+tM89N5YWl4tKNpf7g==;
	24:yUPtk4YF6lLBBgOrerKLHxtv7zUqyVQKoUxrsOk8F/6lVQ3z3Wm6aoKfxu0ZsnujUoc3ggRMJRdI6uHrFiMeQVvqHaLw4BwZIQyzW1PXISY=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB203486A94326248E2D2E61279EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(520078)(8121501046)(5005006)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 0785459C39
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(199003)(377454003)(189002)(19580395003)(189998001)(76576001)(93886004)(77096005)(101416001)(11100500001)(5002640100001)(6116002)(33656002)(2900100001)(5008740100001)(19580405001)(5003600100002)(586003)(122556002)(86612001)(40100003)(5005710100001)(5004730100002)(105586002)(1096002)(102836003)(50986999)(86362001)(87936001)(2950100001)(10400500002)(99286002)(106116001)(97736004)(106356001)(5001770100001)(92566002)(81156007)(8990500004)(15975445007)(10290500002)(1220700001)(74316001)(10090500001)(76176999)(54356999)(5001960100002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2015 18:17:27.5342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.143
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD
	controller
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
X-TUID: DDRUQnDPK0do

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBUdWVzZGF5LCA4IERlY2VtYmVyIDIwMTUgMjM6NDANCj4gT24gVHVlLCBE
ZWMgOCwgMjAxNSBhdCAxMDoxOSBQTSwgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVtYW5u
QG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KPiA+PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFp
bHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwuY29tXQ0KPiA+PiBTZW50OiBTYXR1cmRheSwgNSBE
ZWNlbWJlciAyMDE1IDIxOjI2DQo+ID4+IElzIHRoaXMgSVAganVzdCBTREhDST8gV2UgYWxyZWFk
eSBtb2RlbCBTREhDSSBpbiBRRU1VLCBzZWUNCj4gPj4gaHcvc2Qvc2RoY2kuYy4gSWYgdGhlcmUg
YXJlIFJQaSBzcGVjaWZpYyBmZWF0dXJlcyB0byB0aGUgU0RIQ0kNCj4gPj4gaW1wbGVtZW50YXRp
b24gdGhleSBzaG91bGQgYmUgYWRkZWQgYXMgb3B0aW9uYWwgZXh0ZW5zaW9ucyAocHJvYmFiYWJs
eQ0KPiA+PiB2aWEgc3ViY2xhc3NpbmcpIHRvIHRoZSBleGlzdGluZyBTREhDSSBtb2RlbC4NCj4g
Pg0KPiA+IFNvIHllcywgaXQgdHVybnMgb3V0IHRoaXMgaXMgZmFpcmx5IHNpbWlsYXIgdG8gU0RI
Q0kgKC0+IGxvdHMgb2Ygd2FzdGVkIHdvcmsgYnkNCj4gR3JlZ29yeSBhbmQgbWUsIHNpZ2gpLCBh
bmQgaW5kZWVkIExpbnV4IGJvb3RzIHdpdGggdGhlIGV4aXN0aW5nIHNkaGNpDQo+IGVtdWxhdGlv
bi4gSG93ZXZlciwgdGhlcmUgYXJlIHNvbWUgcXVpcmtzLCBhbmQgVUVGSS9XaW5kb3dzIGRlcGVu
ZCBvbg0KPiB0aGVtLiBOYW1lbHk6DQo+ID4gICogVGhlIGhvc3QgY29udHJvbCByZWdpc3RlcnMg
KG9mZnNldCAweDI4IGFuZCBhYm92ZSkgc2VlbSB0byBkaWZmZXINCj4gc2lnbmlmaWNhbnRseS4g
TWF5YmUgdGhpcyBpcyBkdWUgdG8gdGhlIFNESEMgdmVyc2lvbiAtLSBhY2NvcmRpbmcgdG8gdGhl
DQo+IEJDTTI4MzUgcGVyaXBoZXJhbHMgc3BlYywgdGhlIGNvbnRyb2xsZXIgaW1wbGVtZW50cyAi
VmVyc2lvbiAzLjAgRHJhZnQgMS4wIg0KPiBvZiB0aGUgU0RIQyBzcGVjLCBidXQgb2YgY291cnNl
IEkgY2FuJ3QgZmluZCB0aGF0IHNwZWMgb25saW5lIGFueXdoZXJlLiBMdWNraWx5DQo+IG5vdGhp
bmcgc2VlbXMgdG8gZGVwZW5kIG9uIHRoaXMsIGJlc2lkZXMgYSBmZXcgc3B1cmlvdXMgd2Fybmlu
Z3MgYWJvdXQNCj4gaW52YWxpZCB3cml0ZXMuDQo+IA0KPiBMb29rcyByZWFzb25hYmx5IGNvbnNp
c3RlbnQgZnJvbSBhIHF1aWNrIHNjYW4/IDB4MjggaW4gc2hkY2kuYyBpcyBvbmx5DQo+IGRvaW5n
IHRoZSBBRE1BIHN0dWZmIHdoaWxlIHRoZXJlIGFyZSBvdGhlciBmaWVsZHMgb24gdGhlIEJDTSBt
b2RlbC4NCg0KWW91J3JlIHJpZ2h0LCB1cG9uIGNsb3NlciBleGFtaW5hdGlvbiwgaXQncyBub3Qg
YXMgYmFkIGFzIEkgdGhvdWdodCAoanVzdCByZXNlcnZlZCAvIHVuaW1wbGVtZW50ZWQgYml0cyku
IFRoZSBvbmUgc2lnbmlmaWNhbnQgZGlmZmVyZW5jZSB0aGF0IHNlZW1zIGxpa2VseSB0byBjYXVz
ZSBhIHByb2JsZW0gaXMgdGhlIGZpcnN0IHJlZ2lzdGVyIChvZmZzZXQgMHgwLTB4Mykgd2hpY2gg
aXMgQVJHMiBvbiBQaSAodXNlZCBmb3IgYXV0byBDTUQgMjMgc3VwcG9ydCkgYnV0IHRoZSBTRE1B
IHN5c3RlbSBhZGRyZXNzIG9uIFNESENJIChQaSBkb2Vzbid0IHN1cHBvcnQgRE1BIGluIHRoZSBj
b250cm9sbGVyKS4gVGhpcyB3aWxsIGJyZWFrIGlmIGEgZ3Vlc3Qgd2FudHMgdG8gdXNlIGF1dG8g
Y21kIDIzIC0tIEkndmUgeWV0IHRvIHNlZSBvbmUgdGhhdCBkb2VzLCBidXQgR3JlZ29yeSdzIG1v
ZGVsIGltcGxlbWVudHMgaXQsIHNvIHBlcmhhcHMgaGUgZGlkLg0KDQo+ID4gICogUG93ZXIgaXMg
YXNzdW1lZCB0byBiZSBhbHdheXMgb24gLS0gdGhlIHNkaGNpIG1vZGVsIHJlcXVpcmVzIHRoZSBn
dWVzdA0KPiB0byB0dXJuIGl0IG9uIGJ5IGEgd3JpdGUgYXQgb2Zmc2V0IDB4MjkgYmVmb3JlIGlz
c3VpbmcgYW55IGNvbW1hbmRzLCBidXQgb24gcGkNCj4gdGhpcyBiaXQgaXMgbWFya2VkIHJlc2Vy
dmVkLCBhbmQgY29tbWFuZHMgYXJlIGlzc3VlZCBpbW1lZGlhdGVseSBhZnRlcg0KPiByZXNldC4N
Cj4gDQo+IERvZXMgdGhpcyBoZWxwPzoNCj4gDQo+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNo
aXZlL2h0bWwvcWVtdS1kZXZlbC8yMDE1LTExL21zZzA2MjcxLmh0bWwNCg0KWWVzLCB0aGF0J3Mg
dGhlIHNhbWUgY2hhbmdlIEkgbWFkZS4gSXMgaXQgZ29pbmcgdG8gYmUgYXBwbGllZD8NCg0KPiA+
ICAqIFRoZSBjYXJkIGluc2VydGVkIGludGVycnVwdCBpcyByYXRoZXIgYnJva2VuIG9uIHBpOiBp
dCBpcyBzZXQgYXQgdGhlIHN0YXJ0IG9mDQo+IGRheSwgYnV0IGEgcmVzZXQgY29tbWFuZCBjbGVh
cnMgaXQgYW5kIGl0IHN0YXlzIGNsZWFyIHRoZXJlYWZ0ZXIgKGFuZCBuZXZlcg0KPiBnZW5lcmF0
ZXMgaW50ZXJydXB0cykuDQo+ID4NCj4gDQo+IElzIHRoYXQgbW9yZSBsaWtlbHkgdG8gYmUgYW4g
SVAgY29ubmVjdGl2aXR5IHByb2JsZW0gKHdpZXJkIGlucHV0IHRvDQo+IHRoZSBjYXJkLWRldGVj
dCBwaW4gaW4gdGhlIFNvQyk/DQoNClRoYXQgbWlnaHQgYmUgaXQsIGJ1dCBpbiBhbnkgY2FzZSBJ
IHN0aWxsIG5lZWQgdG8gbW9kZWwgaXQgc29tZWhvdy4NCg0KPiA+IFRoZXJlJ3MgYW4gaW5jb25z
aXN0ZW5jeSB3aXRoIHJlc3BvbnNlIGhhbmRsaW5nLCB0b28sIGFsdGhvdWdoIEknbSBub3Qgc3Vy
ZQ0KPiBpZiBpdCdzIGEgcXVpcmsgb2YgdGhlIFBpIG9yIGEgZ2VuZXJhbCBidWcgaW4gc2RoY2ku
IFBpIFVFRkkgc2VuZHMgYSBDTUQyMw0KPiB3aXRob3V0IHNldHRpbmcgYW55IG9mIHRoZSByZXNw
b25zZSBiaXRzLCBidXQgdGhpcyBjb21tYW5kIGRvZXMgaW4gZmFjdA0KPiBnZW5lcmF0ZSBhIDQt
Ynl0ZSBSMSByZXNwb25zZS4gVGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhpcyBzaG91bGQgYmUN
Cj4gdHJlYXRlZCBhcyBhbiBlcnJvciwgb3Igd2hldGhlciBpdCBzaW1wbHkgbWVhbnMgdGhhdCB0
aGUgaG9zdCB3YW50cyB0byBpZ25vcmUNCj4gdGhlIHJlc3BvbnNlLiBJbiBzZGhjaSwgdGhlIGZv
bGxvd2luZyBjb2RlIHBhdGggKGFyb3VuZCBsaW5lIDI0NikgcmFpc2VzIGENCj4gImNvbW1hbmQg
aW5kZXgiIGVycm9yIGluIHRoZSBjYXNlIHRoYXQgYSBub24temVybyByZXNwb25zZSBpcyByZXR1
cm5lZCBidXQNCj4gbm8gcmVzcG9uc2UgYml0cyB3ZXJlIHNldCBpbiB0aGUgY29tbWFuZCByZWdp
c3RlcjoNCj4gPg0KPiA+ICAgICB9IGVsc2UgaWYgKHJsZW4gIT0gMCAmJiAocy0+ZXJyaW50c3Rz
ZW4gJiBTREhDX0VJU0VOX0NNRElEWCkpIHsNCj4gPiAgICAgICAgIHMtPmVycmludHN0cyB8PSBT
REhDX0VJU19DTURJRFg7DQo+ID4gICAgICAgICBzLT5ub3JpbnRzdHMgfD0gU0RIQ19OSVNfRVJS
Ow0KPiA+ICAgICB9DQo+ID4NCj4gPiBJIGRvIG5vdCBvYnNlcnZlIHRoaXMgYmVoYXZpb3VyIG9u
IHRoZSByZWFsIFBpMiAoYW5kIGl0IGJyZWFrcyBVRUZJKS4gVGhlDQo+IGhhcmR3YXJlIHNlbWFu
dGljcyBhcHBlYXIgdG8gYmUgImlmIHRoZSBjb21tYW5kIGdlbmVyYXRlcyBhIHJlc3BvbnNlLA0K
PiBidXQgeW91IGRpZG4ndCB3YW50IHRvIHNlZSBpdCwgd2UnbGwgc3VjY2Vzc2Z1bGx5IGNvbXBs
ZXRlIHRoZSBjb21tYW5kIGFuZA0KPiBpZ25vcmUgdGhlIHJlc3BvbnNlIiwgd2hlcmVhcyB0aGUg
c2RoY2kgaW1wbGVtZW50YXRpb24gcmFpc2VzIGFuIGVycm9yIGZvcg0KPiB0aGlzIGFzIHdlbGwg
YXMgc2lnbmFsbGluZyBjb21wbGV0aW9uLiBJIGhhdmUgcmVhZCB0aGUgIlNEIFNwZWNpZmljYXRp
b25zIFBhcnQgQTINCj4gU0QgSG9zdCBDb250cm9sbGVyIFNpbXBsaWZpZWQgU3BlY2lmaWNhdGlv
biBWZXJzaW9uIDIuMDAiLCBidXQgZGlkIG5vdCBmaW5kDQo+IGFueXRoaW5nIGRlc2NyaWJpbmcg
dGhpcyBjYXNlLCBzbyBpdCBjb3VsZCBiZSB0aGF0IHRoaXMgaXMgb3BlbiB0byBpbnRlcnByZXRh
dGlvbi4NCj4gKEl0IGNvdWxkIGFsc28gYmUgc3BlY2lmaWVkIGluIFNESEMgdjMuKSBUaGUgc3Bl
Y2lmaWMgZXJyb3IgYWxzbyBzZWVtcyBvZGQgLS0gbXkNCj4gdW5kZXJzdGFuZGluZyBpcyB0aGF0
IGEgImNvbW1hbmQgaW5kZXgiIGVycm9yIG1lYW5zIHRoYXQgdGhlIGluZGV4IGluIHRoZQ0KPiBy
ZXNwb25zZSBkaWRuJ3QgbWF0Y2ggdGhlIGluZGV4IG9mIHRoZSBpc3N1ZWQgY29tbWFuZCwgYnV0
IHRoYXQncyBoYXJkbHkNCj4gd2hhdCBpcyBoYXBwZW5pbmcgaGVyZS4NCj4gPg0KPiANCj4gU3Rh
cnRpbmcgdG8gc291bmQgbGlrZSBhIGJ1Zy4NCg0KSSB0aGluayBzbywgeWVzLiBJdCB3YXMgd3Jp
dHRlbiB0aGlzIHdheSBpbiB0aGUgb3JpZ2luYWwgY29tbWl0IC0tIEknbSBhZGRpbmcgdGhlIG9y
aWdpbmFsIGF1dGhvciAoSWdvciBNaXRzeWFua28pIHRvIHRoZSB0aHJlYWQsIGluIGNhc2UgaGUg
aGFzIGFueSBpbnNpZ2h0Lg0KDQo+ID4gQXNzdW1pbmcgdGhpcyBsYXR0ZXIgYnVnIGNhbiBiZSBm
aXhlZCBnZW5lcmljYWxseSwgaG93IGRvIHlvdSBwcm9wb3NlDQo+IGhhbmRsaW5nIHRoZSBQaSBx
dWlya3M/IEkgY291bGQgYWRkIGEgYm9vbCBwcm9wZXJ0eSBmb3IgImJjbTI4MzUtcXVpcmtzIiBv
cg0KPiBzaW1pbGFyIGFuZCBqdXN0IHNwZWNpYWwtY2FzZSB0aGUgcmVsZXZhbnQgY29kZSAobXkg
cHJlZmVycmVkIGFwcHJvYWNoKS4gSSdtDQo+IGFsc28gb3BlbiB0byBzdWJjbGFzc2luZywgYnV0
IG5vIGlkZWEgaG93IHRoYXQgd291bGQgd29yayBpbiBwcmFjdGljZSwgc28NCj4gd291bGQgbmVl
ZCBzb21lIHBvaW50ZXJzLg0KPiA+DQo+IA0KPiBJIHRoaW5rIHdlIG5lZWQgYSBtb3JlIGRlZmlu
aXRpdmUgbGlzdCBvZiB0aGUgcmVnaXN0ZXIgbGV2ZWwgZmVhdHVyZXMNCj4gdGhhdCBhcmUgZGlm
ZmVyZW50IG9yIGFkZGVkLCBJIGFtIG5vdCBzZWVpbmcgd2hhdCBpcyBCQ00gc3BlY2lmaWMganVz
dA0KPiB5ZXQuDQoNClRoZSBjb21wbGV0ZSBkaWZmIG5lZWRlZCB0byBib290IFdpbmRvd3MgYXBw
ZWFycyBiZWxvdy4gVGhlIGZpcnN0IGh1bmsgYXZvaWRzIHJlLXRyaWdnZXJpbmcgdGhlIGluc2Vy
dCBpbnRlcnJ1cHQgb24gY2FyZCByZXNldCwgdGhlIHNlY29uZCBmaXhlcyB0aGUgYnVnIGRlc2Ny
aWJlZCBhYm92ZSwgYW5kIHRoZSBsYXN0IGh1bmsgaXMgZXF1aXZhbGVudCB0byB5b3VyIHBhdGNo
IGxpbmtlZCBhYm92ZS4gSSBwcm9wb3NlIHRoYXQgd2UgbWFrZSB0aGUgZmlyc3QgY29uZGl0aW9u
YWwgdW5kZXIgYSBzdWl0YWJseS1uYW1lZCBib29sIHByb3BlcnR5IHRvIGVuYWJsZSB0aGUgcXVp
cmssIGFuZCBhcHBseSB0aGUgc2Vjb25kIHR3byBmaXhlcyBkaXJlY3RseS4NCg0KVGhvdWdodHM/
DQoNCkFuZHJldw0KDQpkaWZmIC0tZ2l0IGEvaHcvc2Qvc2RoY2kuYyBiL2h3L3NkL3NkaGNpLmMN
CmluZGV4IGQ3MGQxYTYuLjg3N2RkNTEgMTAwNjQ0DQotLS0gYS9ody9zZC9zZGhjaS5jDQorKysg
Yi9ody9zZC9zZGhjaS5jDQpAQCAtMTkzLDcgKzE5Myw3IEBAIHN0YXRpYyB2b2lkIHNkaGNpX3Jl
c2V0KFNESENJU3RhdGUgKnMpDQogICAgICAqIGluaXRpYWxpemF0aW9uICovDQogICAgIG1lbXNl
dCgmcy0+c2RtYXN5c2FkLCAwLCAodWludHB0cl90KSZzLT5jYXBhcmVnIC0gKHVpbnRwdHJfdCkm
cy0+c2RtYXN5c2FkKTsNCg0KLSAgICBzZF9zZXRfY2Iocy0+Y2FyZCwgcy0+cm9fY2IsIHMtPmVq
ZWN0X2NiKTsNCisgICAgLy9zZF9zZXRfY2Iocy0+Y2FyZCwgcy0+cm9fY2IsIHMtPmVqZWN0X2Ni
KTsNCiAgICAgcy0+ZGF0YV9jb3VudCA9IDA7DQogICAgIHMtPnN0b3BwZWRfc3RhdGUgPSBzZGhj
X25vdF9zdG9wcGVkOw0KIH0NCkBAIC0yNDMsOSArMjQzLDExIEBAIHN0YXRpYyB2b2lkIHNkaGNp
X3NlbmRfY29tbWFuZChTREhDSVN0YXRlICpzKQ0KICAgICAgICAgICAgIChzLT5jbWRyZWcgJiBT
REhDX0NNRF9SRVNQT05TRSkgPT0gU0RIQ19DTURfUlNQX1dJVEhfQlVTWSkgew0KICAgICAgICAg
ICAgIHMtPm5vcmludHN0cyB8PSBTREhDX05JU19UUlNDTVA7DQogICAgICAgICB9DQorI2lmIDAN
CiAgICAgfSBlbHNlIGlmIChybGVuICE9IDAgJiYgKHMtPmVycmludHN0c2VuICYgU0RIQ19FSVNF
Tl9DTURJRFgpKSB7DQogICAgICAgICBzLT5lcnJpbnRzdHMgfD0gU0RIQ19FSVNfQ01ESURYOw0K
ICAgICAgICAgcy0+bm9yaW50c3RzIHw9IFNESENfTklTX0VSUjsNCisjZW5kaWYNCiAgICAgfQ0K
DQogICAgIGlmIChzLT5ub3JpbnRzdHNlbiAmIFNESENfTklTRU5fQ01EQ01QKSB7DQpAQCAtODMx
LDcgKzgzMyw3IEBAIHN0YXRpYyB2b2lkIHNkaGNpX2RhdGFfdHJhbnNmZXIodm9pZCAqb3BhcXVl
KQ0KDQogc3RhdGljIGJvb2wgc2RoY2lfY2FuX2lzc3VlX2NvbW1hbmQoU0RIQ0lTdGF0ZSAqcykN
CiB7DQotICAgIGlmICghU0RIQ19DTE9DS19JU19PTihzLT5jbGtjb24pIHx8ICEocy0+cHdyY29u
ICYgU0RIQ19QT1dFUl9PTikgfHwNCisgICAgaWYgKCFTREhDX0NMT0NLX0lTX09OKHMtPmNsa2Nv
bikgfHwgLyogIShzLT5wd3Jjb24gJiBTREhDX1BPV0VSX09OKSB8fCAqLw0KICAgICAgICAgKCgo
cy0+cHJuc3RzICYgU0RIQ19EQVRBX0lOSElCSVQpIHx8IHMtPnN0b3BwZWRfc3RhdGUpICYmDQog
ICAgICAgICAoKHMtPmNtZHJlZyAmIFNESENfQ01EX0RBVEFfUFJFU0VOVCkgfHwNCiAgICAgICAg
ICgocy0+Y21kcmVnICYgU0RIQ19DTURfUkVTUE9OU0UpID09IFNESENfQ01EX1JTUF9XSVRIX0JV
U1kgJiYNCg==
