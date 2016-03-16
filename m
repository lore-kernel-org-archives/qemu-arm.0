Received: by 10.25.208.211 with SMTP id h202csp116422lfg;
        Wed, 16 Mar 2016 16:01:22 -0700 (PDT)
X-Received: by 10.140.105.198 with SMTP id c64mr9758719qgf.94.1458169282543;
        Wed, 16 Mar 2016 16:01:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b186si5189546qhb.28.2016.03.16.16.01.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 16:01:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:59191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agKRO-0005cc-4l
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 19:01:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1agKRJ-0005YI-NK
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 19:01:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1agKRI-0002pF-76
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 19:01:17 -0400
Received: from mail-bl2on0130.outbound.protection.outlook.com
	([65.55.169.130]:18916
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1agKRC-0002lP-AE; Wed, 16 Mar 2016 19:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/4K3drbIbEeId/nivbsWLMojk2SuOEgSA0X5G2qZwAU=;
	b=BRfvhAd3UUAVM2DBBNZ2pBZ4l9rGUIb0HVVhvbZIssuN6DQ2MsWuKa/9xUra5w8grH4w/eJ25O4nSjOCGC3hRW8L8J3NuQmwGWVufMZvEltVVimWj3YFjUoZJbWS/AhxoOm4dZC9zmxI+VxDS9fDd1dKQK/QFdS056Cvczs/GdY=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with Microsoft
	SMTP Server (TLS) id 15.1.434.16; Wed, 16 Mar 2016 23:01:08 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0443.012; Wed, 16 Mar 2016 23:01:08 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v3 0/5] Raspberry Pi framebuffer, DMA and Windows support
Thread-Index: AQHReXXkSPsimtl+v0OUqFIMMQ0Gm59cVhAAgABhu7A=
Date: Wed, 16 Mar 2016 23:01:07 +0000
Message-ID: <BLUPR0301MB2034B9E6F037E31B3AC6E3619E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA_6NvDW4LYHTmcuH3j07zQds6gH=J2FC4zV9JDg13JWwA@mail.gmail.com>
In-Reply-To: <CAFEAcA_6NvDW4LYHTmcuH3j07zQds6gH=J2FC4zV9JDg13JWwA@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:d::724]
x-ms-office365-filtering-correlation-id: e610371e-ad3f-4147-dae5-08d34deedc23
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2033;
	5:N62wJK5XMndq2OAsBtCyN3zqBDfBBn4fIGaZIv0ITYLETiaRPwkUGvAyqNRdvdgJYYwnL7abWeK0iuZhdazbKL++WNenTzlZbbUHzKPX8XjTrOCCK7Kzs11TrIIKYvLpR1EfMSxP5NGtZKBA/uJJGA==;
	24:D1/xjZ3TX1dAe22lUyD7xWVAg858ZmluTnbi/+QTcXn12Nv+r5peiumX9IxV6S8BKghP0Vpj94bOoVtzr5IiFxGMtMYiC5CNfU112nPqOMk=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
x-microsoft-antispam-prvs: <BLUPR0301MB2033CFB871223785AB3430C99E8A0@BLUPR0301MB2033.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377424004)(377454003)(24454002)(87936001)(76576001)(586003)(76176999)(10090500001)(50986999)(54356999)(10290500002)(1096002)(1220700001)(6116002)(10400500002)(74316001)(86362001)(575784001)(102836003)(5005710100001)(106116001)(99286002)(8990500004)(19580395003)(19580405001)(5004730100002)(15975445007)(5003600100002)(2906002)(77096005)(92566002)(5002640100001)(2900100001)(110136002)(81166005)(2950100001)(189998001)(11100500001)(122556002)(5008740100001)(33656002)(4326007)(3660700001)(3280700002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2016 23:01:07.6983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.130
Cc: =?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 0/5] Raspberry Pi framebuffer,
	DMA and Windows support
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
X-TUID: Z1q3izxFh7oA

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBXZWRuZXNkYXksIDE2IE1hcmNoIDIwMTYgOTo1NCBBTQ0KPiANCj4gT24gOCBNYXJj
aCAyMDE2IGF0IDIwOjA1LCBBbmRyZXcgQmF1bWFubg0KPiA8QW5kcmV3LkJhdW1hbm5AbWljcm9z
b2Z0LmNvbT4gd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0
aGUgQVVYIChzZWNvbmQgVUFSVCksIGZyYW1lYnVmZmVyDQo+ID4gYW5kIERNQSBjb250cm9sbGVy
IG9uIFJhc3BiZXJyeSBQaSAyLCBhbmQgZW5hYmxlcyBib290aW5nIFdpbmRvd3Mgb24NCj4gPiB0
aGlzIGRldmljZS4gQXMgd2l0aCB0aGUgcHJldmlvdXMgc2VyaWVzLCBpdCBpcyBoZWF2aWx5IGJh
c2VkIG9uIHRoZQ0KPiA+IG9yaWdpbmFsIChvdXQgb2YgdHJlZSkgd29yayBvZiBHcmVnb3J5IEVz
dHJhZGUsIFN0ZWZhbiBXZWlsIGFuZCBvdGhlcnMNCj4gPiB0byBzdXBwb3J0IFJhc3BiZXJyeSBQ
aSAxLg0KPiA+DQo+ID4gQWZ0ZXIgdGhpcyBzZXJpZXMsIGl0IGlzIHBvc3NpYmxlIHRvIGJvb3Qg
V2luZG93cyBieSBmb2xsb3dpbmcgdGhlDQo+ID4gaW5zdHJ1Y3Rpb25zIGF0IGh0dHBzOi8vZ2l0
aHViLmNvbS8weGFidS9xZW11L3dpa2kuIFlvdSBhbHNvIGJvb3QNCj4gPiBSYXNwYmlhbiB0byB0
aGUgR1VJIHVzaW5nIGEgY29tbWFuZCBzdWNoIGFzOg0KPiA+DQo+ID4gICBxZW11LXN5c3RlbS1h
cm0gLU0gcmFzcGkyIC1rZXJuZWwgcmFzcGJpYW4tYm9vdC9rZXJuZWw3LmltZyAtc2QNCj4gPiAg
IDIwMTUtMDktMjQtcmFzcGJpYW4tamVzc2llLmltZyAtYXBwZW5kICJydyBlYXJseXByaW50ayBs
b2dsZXZlbD04DQo+ID4gICBjb25zb2xlPXR0eUFNQTAgZHdjX290Zy5scG1fZW5hYmxlPTAgcm9v
dD0vZGV2L21tY2JsazBwMg0KPiByb290d2FpdCINCj4gPiAgIC1kdGIgcmFzcGJpYW4tYm9vdC9i
Y20yNzA5LXJwaS0yLWIuZHRiIC1zZXJpYWwgc3RkaW8NCj4gDQo+IFNvIEkgdHJpZWQgc29tZXRo
aW5nIGxpa2UgdGhpcywgYW5kIHRoZSBrZXJuZWwgZ2l2ZXMgYSBXQVJOSU5HIHdpdGgNCj4gYSBi
YWNrdHJhY2UsIGFuZCB0aGVuIGhhbmdzOg0KPiANCj4gWyAgICA1LjQxMzk0M10gVkZQIHN1cHBv
cnQgdjAuMzogaW1wbGVtZW50b3IgNDEgYXJjaGl0ZWN0dXJlIDQgcGFydCAzMA0KPiB2YXJpYW50
IGYgcmV2IDANCj4gWyAgICA1Ljk3Njg4OF0gcGluY3RybCBjb3JlOiBpbml0aWFsaXplZCBwaW5j
dHJsIHN1YnN5c3RlbQ0KPiBbICAgIDYuMTcxMTk3XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wg
ZmFtaWx5IDE2DQo+IFsgICAgNi4yODY3OTldIERNQTogcHJlYWxsb2NhdGVkIDQwOTYgS2lCIHBv
b2wgZm9yIGF0b21pYyBjb2hlcmVudCBhbGxvY2F0aW9ucw0KPiBbICAgIDYuMzY2ODg5XSBjcHVp
ZGxlOiB1c2luZyBnb3Zlcm5vciBsYWRkZXINCj4gWyAgICA2LjM5MTY2NV0gY3B1aWRsZTogdXNp
bmcgZ292ZXJub3IgbWVudQ0KPiBbICAgIDYuNDAxNjA0XSBiY20yNzA5LnVhcnRfY2xvY2sgPSAz
MDAwMDAwDQo+IFsgICAgNi40NzgwNjNdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0t
LS0tLQ0KPiBbICAgIDYuNDgxMDUyXSBXQVJOSU5HOiBDUFU6IDAgUElEOiAxIGF0DQo+IC9idWls
ZC9idWlsZGQvbGludXgtMy4xOC4wL2FyY2gvYXJtL21hY2gtYmNtMjcwOS9hcm1jdHJsLmM6MTQ4
DQo+IGFybWN0cmxfeGxhdGUrMHgxODgvMHgyNzQoKQ0KPiBbICAgIDYuNDg0NDc0XSBNb2R1bGVz
IGxpbmtlZCBpbjoNCj4gWyAgICA2LjQ4OTc4M10gQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVy
LzAgTm90IHRhaW50ZWQNCj4gMy4xOC4wLTIwLXJwaTIgIzIxLVVidW50dQ0KPiBbICAgIDYuNTAy
NzgxXSBbPDgwMDE2YWIwPl0gKHVud2luZF9iYWNrdHJhY2UpIGZyb20gWzw4MDAxMjlkMD5dDQo+
IChzaG93X3N0YWNrKzB4MTAvMHgxNCkNCj4gWyAgICA2LjUwNjM1NV0gWzw4MDAxMjlkMD5dIChz
aG93X3N0YWNrKSBmcm9tIFs8ODA1ZmVlMTA+XQ0KPiAoZHVtcF9zdGFjaysweDljLzB4ZDQpDQo+
IFsgICAgNi41MDg5NDZdIFs8ODA1ZmVlMTA+XSAoZHVtcF9zdGFjaykgZnJvbSBbPDgwMDI2ZWQ4
Pl0NCj4gKHdhcm5fc2xvd3BhdGhfY29tbW9uKzB4NzAvMHg4YykNCj4gWyAgICA2LjUxMTI1MV0g
Wzw4MDAyNmVkOD5dICh3YXJuX3Nsb3dwYXRoX2NvbW1vbikgZnJvbSBbPDgwMDI2ZjkwPl0NCj4g
KHdhcm5fc2xvd3BhdGhfbnVsbCsweDFjLzB4MjQpDQo+IFsgICAgNi41MTI3OTddIFs8ODAwMjZm
OTA+XSAod2Fybl9zbG93cGF0aF9udWxsKSBmcm9tIFs8ODAwMjIwNDQ+XQ0KPiAoYXJtY3RybF94
bGF0ZSsweDE4OC8weDI3NCkNCj4gWyAgICA2LjUxNDU1OF0gWzw4MDAyMjA0ND5dIChhcm1jdHJs
X3hsYXRlKSBmcm9tIFs8ODAwNzM5OWM+XQ0KPiAoaXJxX2NyZWF0ZV9vZl9tYXBwaW5nKzB4NjQv
MHgxMTApDQo+IFsgICAgNi41MTcxNzNdIFs8ODAwNzM5OWM+XSAoaXJxX2NyZWF0ZV9vZl9tYXBw
aW5nKSBmcm9tIFs8ODA0YzRlZjQ+XQ0KPiAoaXJxX29mX3BhcnNlX2FuZF9tYXArMHgyNC8weDJj
KQ0KPiBbICAgIDYuNTE4NzQxXSBbPDgwNGM0ZWY0Pl0gKGlycV9vZl9wYXJzZV9hbmRfbWFwKSBm
cm9tIFs8ODA0YzRmMTQ+XQ0KPiAob2ZfaXJxX3RvX3Jlc291cmNlKzB4MTgvMHhiOCkNCj4gWyAg
ICA2LjUyMDIwOV0gWzw4MDRjNGYxND5dIChvZl9pcnFfdG9fcmVzb3VyY2UpIGZyb20gWzw4MDRj
NGZmMD5dDQo+IChvZl9pcnFfdG9fcmVzb3VyY2VfdGFibGUrMHgzYy8weDU0KQ0KPiBbICAgIDYu
NTIzNTk4XSBbPDgwNGM0ZmYwPl0gKG9mX2lycV90b19yZXNvdXJjZV90YWJsZSkgZnJvbQ0KPiBb
PDgwNGMyNWI4Pl0gKG9mX2RldmljZV9hbGxvYysweGQ4LzB4MTgwKQ0KPiBbICAgIDYuNTI4ODM4
XSBbPDgwNGMyNWI4Pl0gKG9mX2RldmljZV9hbGxvYykgZnJvbSBbPDgwNGMyNmE4Pl0NCj4gKG9m
X3BsYXRmb3JtX2RldmljZV9jcmVhdGVfcGRhdGErMHg0OC8weDk4KQ0KPiBbICAgIDYuNTM1MzUy
XSBbPDgwNGMyNmE4Pl0gKG9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGVfcGRhdGEpIGZyb20NCj4g
Wzw4MDRjMjdmMD5dIChvZl9wbGF0Zm9ybV9idXNfY3JlYXRlKzB4ZWMvMHgzYWMpDQo+IFsgICAg
Ni41Mzk0NDBdIFs8ODA0YzI3ZjA+XSAob2ZfcGxhdGZvcm1fYnVzX2NyZWF0ZSkgZnJvbSBbPDgw
NGMyODYwPl0NCj4gKG9mX3BsYXRmb3JtX2J1c19jcmVhdGUrMHgxNWMvMHgzYWMpDQo+IFsgICAg
Ni41NDEyMTddIFs8ODA0YzI4NjA+XSAob2ZfcGxhdGZvcm1fYnVzX2NyZWF0ZSkgZnJvbSBbPDgw
NGMyYzI4Pl0NCj4gKG9mX3BsYXRmb3JtX3BvcHVsYXRlKzB4NWMvMHhhMCkNCj4gWyAgICA2LjU0
Mjc3MF0gWzw4MDRjMmMyOD5dIChvZl9wbGF0Zm9ybV9wb3B1bGF0ZSkgZnJvbSBbPDgwODhjYWQ4
Pl0NCj4gKGJjbTI3MDlfaW5pdCsweDY0LzB4M2ZjKQ0KPiBbICAgIDYuNTQ2MjExXSBbPDgwODhj
YWQ4Pl0gKGJjbTI3MDlfaW5pdCkgZnJvbSBbPDgwODg4ODcwPl0NCj4gKGN1c3RvbWl6ZV9tYWNo
aW5lKzB4MjAvMHg0MCkNCj4gWyAgICA2LjU0NzcxMV0gWzw4MDg4ODg3MD5dIChjdXN0b21pemVf
bWFjaGluZSkgZnJvbSBbPDgwMDA4OGJjPl0NCj4gKGRvX29uZV9pbml0Y2FsbCsweGQ4LzB4MjA4
KQ0KPiBbICAgIDYuNTQ5MjAwXSBbPDgwMDA4OGJjPl0gKGRvX29uZV9pbml0Y2FsbCkgZnJvbSBb
PDgwODg1ZWY0Pl0NCj4gKGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MWZjLzB4MjljKQ0KPiBbICAg
IDYuNTUxNzcxXSBbPDgwODg1ZWY0Pl0gKGtlcm5lbF9pbml0X2ZyZWVhYmxlKSBmcm9tIFs8ODA1
ZjkyOTg+XQ0KPiAoa2VybmVsX2luaXQrMHg4LzB4ZjApDQo+IFsgICAgNi41NTMzMTldIFs8ODA1
ZjkyOTg+XSAoa2VybmVsX2luaXQpIGZyb20gWzw4MDAwZWZlOD5dDQo+IChyZXRfZnJvbV9mb3Jr
KzB4MTQvMHgyYykNCj4gWyAgICA2LjU1NjY3MF0gLS0tWyBlbmQgdHJhY2UgMDg4YmE1ODdmMGEw
MDljYyBdLS0tDQo+IFsgICAgNi42NDk5NDhdIE5vIEFUQUdzPw0KPiBbICAgIDYuNjU4MDI5XSBo
dy1icmVha3BvaW50OiBmb3VuZCA1ICgrMSByZXNlcnZlZCkgYnJlYWtwb2ludCBhbmQgNA0KPiB3
YXRjaHBvaW50IHJlZ2lzdGVycy4NCj4gWyAgICA2LjY2MDM5M10gaHctYnJlYWtwb2ludDogbWF4
aW11bSB3YXRjaHBvaW50IHNpemUgaXMgOCBieXRlcy4NCj4gWyAgICA2LjY2NDIwNl0gbWFpbGJv
eDogQnJvYWRjb20gVmlkZW9Db3JlIE1haWxib3ggZHJpdmVyDQo+IFsgICAgNi42OTM5MTJdIGJj
bTI3MDhfdmNpbzogbWFpbGJveCBhdCBmMzAwYjg4MA0KPiBbICAgIDYuNzAzNzQ1XSBiY21fcG93
ZXI6IEJyb2FkY29tIHBvd2VyIGRyaXZlcg0KPiBbICAgIDYuNzA3NjQyXSBiY21fcG93ZXJfb3Bl
bigpIC0+IDANCj4gWyAgICA2LjcwODY3MV0gYmNtX3Bvd2VyX3JlcXVlc3QoMCwgOCkNCj4gDQo+
IERvZXMgdGhhdCBsb29rIGZhbWlsaWFyPyAoTXkgZmlyc3QgZ3Vlc3MgaXMganVzdCB0aGF0IGl0
IHdhbnRzIHNvbWUNCj4gYml0IG9mIGhhcmR3YXJlIHdlIGhhdmVuJ3QgZ290IGEgZGV2aWNlIG1v
ZGVsIGZvciB5ZXQuIEkgaGF2ZW4ndA0KPiB0cmllZCB0byBpbnZlc3RpZ2F0ZSBhdCBhbGwgeWV0
LikNCg0KSSBoYXZlbid0IHNlZW4gdGhhdCwgcHJvYmFibHkgYmVjYXVzZSBJIHdhcyBkb2luZyBh
bGwgbXkgdGVzdGluZyB3aXRoIGFuIG9sZGVyIHJlbGVhc2UgKDIwMTUtMDktMjQpLiBUaGVyZSBh
cHBlYXIgdG8gYmUgdHdvIHByb2JsZW1zLiBUaGUgd2FybmluZyBpcyBzb21ldGhpbmcgcmVsYXRl
ZCB0byB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIsIGJ1dCBpdCdzIGhhcmQgdG8gdGVsbCBleGFj
dGx5IHdoYXQncyB3cm9uZyB0aGVyZSBiZWNhdXNlIHRoZSBmdW5jdGlvbiBpbiBxdWVzdGlvbiAo
YXJtY3RsX3hsYXRlKSBkb2Vzbid0IGFwcGVhciB0byBkbyBhbnkgaGFyZHdhcmUgYWNjZXNzLiBU
aGUgYmNtX3Bvd2VyX3JlcXVlc3Qgd2VkZ2Ugc2hvdWxkIGJlIGV4cGVjdGVkIGZvciBhbnl0aGlu
ZyB0aGF0IHRyaWVzIHRvIGludGVyYWN0IHdpdGggcG93ZXIgbWFuYWdlbWVudCwgYmVjYXVzZSB3
ZSBkb24ndCBtb2RlbCB0aGF0IGRldmljZSB5ZXQgKHRoZSBvbGRlciBQaTIga2VybmVscyBkaWRu
J3QgdG91Y2ggaXQpLg0KDQpIb3dldmVyLCBJIGRvbid0IHNlZW0gdG8gYmUgYWJsZSB0byByZXBy
byB0aGlzLiBXaGF0IGV4YWN0bHkgd2VyZSB5b3UgYm9vdGluZz8gT24gdGhlIGN1cnJlbnQgUmFz
cGJpYW4gKDIwMTYtMDItMjYtcmFzcGJpYW4tamVzc2llLWxpdGUpLCBJIHJ1biBpbnRvIGEgZGlm
ZmVyZW50IGJ1Zywgd2l0aCBzdGFsbGVkIE1NQyBjb21tYW5kczoNCg0KWyAgICA5LjE2NzY4M10g
bW1jMDogY29tbWFuZCBuZXZlciBjb21wbGV0ZWQuDQpbICAgIDkuMTcyMTMzXSBtbWMwOj5jbWQg
b3AgNTIgYXJnIDB4YzAwIGZsYWdzIDB4MTk1IC0gcmVzcCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAw
MDAwMCAwMDAwMDAwMCwgZXJyIDANClsgICAgOS4xODAzNzldIG1tYzA6ID09PT09PT09PT09IFJF
R0lTVEVSIERVTVAgPT09PT09PT09PT0NClsgICAgOS4xODcxOTNdIG1tYzA6IFNEQ01EICAweDAw
MDA4MDM0DQpbICAgIDkuMTkwMTEzXSBtbWMwOiBTREFSRyAgMHgwMDAwMGMwMA0KWyAgICA5LjE5
Mjk1Ml0gbW1jMDogU0RUT1VUIDB4MDBmMDAwMDANClsgICAgOS4xOTYwNjRdIG1tYzA6IFNEQ0RJ
ViAweDAwMDAwMjZmDQpbICAgIDkuMTk5MDkxXSBtbWMwOiBTRFJTUDAgMHgwMDAwMDAwMA0KWyAg
ICA5LjIwMTkxNV0gbW1jMDogU0RSU1AxIDB4MDAwMDAwMDANClsgICAgOS4yMDQ5MTVdIG1tYzA6
IFNEUlNQMiAweDAwMDAwMDAwDQpbICAgIDkuMjA3NjcyXSBtbWMwOiBTRFJTUDMgMHgwMDAwMDAw
MA0KWyAgICA5LjIxMDQ1M10gbW1jMDogU0RIU1RTIDB4MDAwMDA3ZjgNClsgICAgOS4yMTM2MTJd
IG1tYzA6IFNEVkREICAweDAwMDAwMDAxDQpbICAgIDkuMjE2OTc3XSBtbWMwOiBTREVETSAgMHgw
MDAxMDgwMA0KWyAgICA5LjIxOTcyOF0gbW1jMDogU0RIQ0ZHIDB4MDAwMDA0MGENClsgICAgOS4y
MjI2NjZdIG1tYzA6IFNESEJDVCAweDAwMDAwMDAwDQpbICAgIDkuMjI4MTE2XSBtbWMwOiBTREhC
TEMgMHgwMDAwMDAwMA0KWyAgICA5LjIzMDg2Nl0gbW1jMDogPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KDQpDaGVlcnMsDQpBbmRyZXcNCg==
