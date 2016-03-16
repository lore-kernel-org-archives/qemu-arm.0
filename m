Received: by 10.25.208.211 with SMTP id h202csp130124lfg;
        Wed, 16 Mar 2016 16:41:35 -0700 (PDT)
X-Received: by 10.140.31.135 with SMTP id f7mr5971759qgf.96.1458171695112;
        Wed, 16 Mar 2016 16:41:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v202si5288837qka.128.2016.03.16.16.41.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 16:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:59313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agL4I-0000x6-KV
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 19:41:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1agL3n-0000OS-NG
	for qemu-devel@nongnu.org; Wed, 16 Mar 2016 19:41:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1agL3k-0008UM-F3
	for qemu-devel@nongnu.org; Wed, 16 Mar 2016 19:41:03 -0400
Received: from mail-bn1bon0137.outbound.protection.outlook.com
	([157.56.111.137]:20512
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1agL3j-0008UA-W2; Wed, 16 Mar 2016 19:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=I7pq38GDqVZa0HULxCIOe0AA9dGfrFyHJF7dZMqal0U=;
	b=QVMl3ro+rpYUr2KylXNhejsVmJEJvWu+qBzLtFIKJqJ/R2sPohOk9zfzAANKFmkjjykxg4D4aZ/MRdK4nxTZ80Ukgu+hyJ5k/V8HD0O/Kqp7QtihzFs7lxUDgXXewtC6JRw0Da27Yxig6UTFdiwYi3Geq+5Cg5fkpgAgFQxvhew=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.443.12; Wed, 16 Mar 2016 23:40:58 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0443.012; Wed, 16 Mar 2016 23:40:58 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: =?utf-8?B?QW50b25pbyBIdWV0ZSBKaW3DqW5leg==?= <tuxillo@quantumachine.net>
Thread-Topic: Timer interrupts for -M raspi2
Thread-Index: AQHRf9TDjL4jtN06QUC6x3suw6+UpJ9csahQgAAEYoCAAACh4A==
Date: Wed, 16 Mar 2016 23:40:58 +0000
Message-ID: <BLUPR0301MB2034E6D47DF99360913C5AA99E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <20160316223950.Horde.KwhTM79StVPD_tK29LK3XzF@www.quantumachine.net>
	<BLUPR0301MB20345CF84190AF36081E3C579E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<20160316232331.Horde.17881eG_ZrMF5c2qIT3qgCa@www.quantumachine.net>
In-Reply-To: <20160316232331.Horde.17881eG_ZrMF5c2qIT3qgCa@www.quantumachine.net>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: quantumachine.net; dkim=none (message not signed)
	header.d=none;quantumachine.net; dmarc=none action=none
	header.from=microsoft.com;
x-originating-ip: [2001:4898:80e8:d::724]
x-ms-office365-filtering-correlation-id: bf12aa15-e808-47e8-4b0f-08d34df46cee
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:iqKnEuWPDDf6CGgypzeT8QgiaGo3Wl6wFhHOasJVrPNk0XjF9qJcgykmp6bS/foT3ByM/QtvrwNMKwvI4SrN4ZpoiQc2a3JsCrR/ZcEDfGqRX0tyemt49MLqP6CMrnevkivbdYZieXtGWUnrLcZXkQ==;
	24:JzFBRGNXiVQSD5jkAdkUWlCj41XF0THSfdwlNFHU8Q+gj/DQJTcnv6Q3Qmil8zd8QInvVpBlDf+lRpn3LTd3IDw+9HY403uu9j6mN/htQVI=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB2034F4C9B44CD1207AC96EC19E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(586003)(1096002)(19580405001)(5004730100002)(6116002)(106116001)(19580395003)(1220700001)(99286002)(102836003)(33656002)(15975445007)(77096005)(5003600100002)(2950100001)(5002640100001)(2900100001)(86362001)(50986999)(92566002)(54356999)(76176999)(81166005)(87936001)(110136002)(8990500004)(74316001)(189998001)(2906002)(122556002)(4326007)(10400500002)(10090500001)(10290500002)(3660700001)(11100500001)(76576001)(5005710100001)(3280700002)(5008740100001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2016 23:40:58.2099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.137
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] Timer interrupts for -M raspi2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N5xFE9qToXkQ

SGkgQW50b25pbywNCg0KPiBGcm9tOiBBbnRvbmlvIEh1ZXRlIEppbcOpbmV6IFttYWlsdG86dHV4
aWxsb0BxdWFudHVtYWNoaW5lLm5ldF0NCj4gU2VudDogV2VkbmVzZGF5LCAxNiBNYXJjaCAyMDE2
IDQ6MjQgUE0NCj4gDQo+IEhpIEFuZHJldywNCj4gDQo+IEkgdGhvdWdodCB0aGUgdGltZXIgdGhh
dCB3YXMgbm90IGltcGxlbWVudGVkIHdhcyB0aGUgbG9jYWwgdGltZXINCj4gKGxvY2F0ZWQgYXQg
MHg0MDAwMDAzNCkgYW5kIHRoYXQgdGhlIGNvcmUgdGltZXJzIGludGVycnVwdCBjb250cm9sDQo+
IHJlZ2lzdGVycyBzdGFydGluZyBhdCAweDQwMDAwMDQwIHdlcmUgdGhlIHBlci1jb3JlIHRpbWVy
cy4NCg0KT2gsIHNvcnJ5LCB5b3UncmUgcmlnaHQ7IEkgcmVwbGllZCB0b28gcXVpY2tseS4NCg0K
WWVzLCB0aGF0IHNob3VsZCB3b3JrLiBCaXRzIDAgYW5kIDMgYXJlIHdpcmVkIHVwIHRvIHdoYXQg
cWVtdSByZWZlcnMgdG8gYXMgR1RJTUVSX1BIWVMgYW5kIEdUSU1FUl9WSVJUIHJlc3BlY3RpdmVs
eS4gKFRoZSBvdGhlciB0d28gdGltZXJzIGFyZW4ndCBjdXJyZW50bHkgY29ubmVjdGVkOyBJIGNh
bid0IHJlbWVtYmVyIGlmIHRoYXQncyBiZWNhdXNlIHRoZXkgd2VyZW4ndCBtb2RlbGxlZCBieSBj
b3JlIFFFTVUgd2hlbiBJIHdhcyBpbXBsZW1lbnRpbmcgdGhlIGRldmljZSBtb2RlbCwgb3IganVz
dCBiZWNhdXNlIEkgd2Fzbid0IHN1cmUgaG93IHRvIHJvdXRlIHRoZW0gYW5kIG5ldmVyIGNhbWUg
YmFjayB0byBmaXggaXQuKQ0KDQpJZiB5b3UgYXJlIHNlZWluZyBpbnRlcnJ1cHRzIG9uIHJlYWwg
aGFyZHdhcmUgYW5kIG5vdCBvbiBxZW11LCB0aGVuIGl0IG1heSBiZSBiZWNhdXNlIHRoZSBib2Fy
ZCBwZXJmb3JtcyBzb21lIGFkZGl0aW9uYWwgc2V0dXAgdGhhdCB5b3UgYXJlIHJlbHlpbmcgb24u
IEknbSBoYXJkbHkgYW4gZXhwZXJ0IG9uIEFSTSwgYnV0IEkgd291bGQgaW1hZ2luZSB5b3UgbmVl
ZCB0byBhbHNvIG5lZWQgdG8gc2V0dXAgdGhlIHRpbWVyJ3MgY29udHJvbCBhbmQgY291bnQgcmVn
aXN0ZXJzICh1c2luZyBtY3IvbXJjKSB0byBnZXQgaXQgdGlja2luZy4gVGhlIHdyaXRlIHRvIDB4
NDAwMDAwNDAgc2ltcGx5IGVuYWJsZXMgdGhlIGludGVycnVwdC4NCg0KPiBDYW4geW91IHBsZWFz
ZSBwb2ludCBtZSB0byB0aGUgZG9jdW1lbnRhdGlvbiBhYm91dCB0aGlzIEFSTSBwZXItY29yZQ0K
PiB0aW1lcnM/DQoNCkhlcmUncyBhIHN0YXJ0aW5nIHBvaW50IHRvIHNvbWUgZG9jcyAoanVzdCBm
cm9tIGEgcXVpY2sgc2VhcmNoKToNCmh0dHA6Ly9pbmZvY2VudGVyLmFybS5jb20vaGVscC9pbmRl
eC5qc3A/dG9waWM9L2NvbS5hcm0uZG9jLmRkaTA0MzhjL0JHQkJJSkNCLmh0bWwNCg0KQ2hlZXJz
LA0KQW5kcmV3IA0KDQo+IEFuZHJldyBCYXVtYW5uIDxBbmRyZXcuQmF1bWFubkBtaWNyb3NvZnQu
Y29tPiBlc2NyaWJpw7M6DQo+IA0KPiA+IEhpIEFudG9uaW8sDQo+ID4NCj4gPj4gRnJvbTogQW50
b25pbyBIdWV0ZSBKaW3DqW5leiBbbWFpbHRvOnR1eGlsbG9AcXVhbnR1bWFjaGluZS5uZXRdDQo+
ID4+IFNlbnQ6IFdlZG5lc2RheSwgMTYgTWFyY2ggMjAxNiAzOjQwIFBNDQo+ID4+DQo+ID4+IEhp
LA0KPiA+Pg0KPiA+PiBJIGFtIGV4cGVyaWVuY2luZyB3aGF0IEkgdGhpbmsgaXQncyBhbiBpc3N1
ZSB3aXRoIC1NIHJhc3BpMiBhbmQNCj4gPj4gaW50ZXJydXB0cyBpbiBhIGJhcmVtZXRhbCBhcHBs
aWNhdGlvbi4NCj4gPj4NCj4gPj4gQWNjb3JkaW5nIHRvIHRoaXMgZG9jdW1lbnQNCj4gPj4NCj4g
KGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLm9yZy9kb2N1bWVudGF0aW9uL2hhcmR3YXJlL3Jhc3Bi
ZXJyeXBpL2JjbTINCj4gPj4gODM2L1FBN19yZXYzLjQucGRmKSwgYW5kIGlmIEkgdW5kZXJzdG9v
ZCBpdCBjb3JyZWN0bHksIHlvdSBjYW4gZW5hYmxlDQo+IHRpbWVyDQo+ID4+IGludGVycnVwdHMg
Zm9yIGNvcmUwIGJ5IHNldHRpbmcgYml0IDAgYXQgMHg0MDAwMDA0MCBhbmQgeW91IGNhbiB0cmln
Z2VyDQo+IHRoZW0NCj4gPj4gYnkgdXNpbmcgdGhlIEFSTSBHZW5lcmljDQo+ID4+IFRpbWVyLg0K
PiA+Pg0KPiA+PiBXaXRoIHRoaXMgcHJvY2VkdXJlIEkgY2FuIHJlbGlhYmx5IHRyaWdnZXIgdGhh
dCB0aW1lciBpbnRlcnJ1cHQgaW4gdGhlDQo+ID4+IHJlYWwgaGFyZHdhcmUgYnkgc2V0dGluZyBD
TlRQX0NUTCBhbmQgQ05UUF9UVkFMIGJ1dCBvbiBxZW11IGl0DQo+IGRvZXNuJ3QNCj4gPj4gc2Vl
bSB0byBiZSB0cmlnZ2VyZWQuDQo+ID4+DQo+ID4+IENhbiBzb21lYm9keSBwbGVhc2UgdGVsbCBt
ZSB3aGF0IEkgbWlnaHQgYmUgZG9pbmcgd3Jvbmc/DQo+ID4NCj4gPiBJIGRvbid0IHRoaW5rIHlv
dSdyZSBkb2luZyBhbnl0aGluZyB3cm9uZzsgd2UganVzdCBkb24ndCBtb2RlbCB0aGlzDQo+ID4g
dGltZXIgaGFyZHdhcmUgeWV0IChuZWl0aGVyIExpbnV4IG5vciBXaW5kb3dzIG5lZWRzIGl0KS4g
SWYgeW91IHdhbnQNCj4gPiB0byB0YWtlIGEgc3RhYiBhdCBhZGRpbmcgaXQsIHRoZSByZWxldmFu
dCBoYXJkd2FyZSBlbXVsYXRpb24gaXMNCj4gPiBody9pbnRjL2JjbTI4MzZfY29udHJvbC5jLg0K
PiA+DQo+ID4gSWYgeW91J3JlIHdpbGxpbmcgdG8gdXNlIGRpZmZlcmVudCB0aW1lciBzb3VyY2Vz
LCB0aGVuIEkgc3VnZ2VzdA0KPiA+IGxvb2tpbmcgYXQgdGhlIEFSTSBwZXItY29yZSB0aW1lcnMu
IEkgYWxzbyBoYXZlIEdyZWdvcnkncyBlbXVsYXRpb24NCj4gPiBjb2RlIGZvciB0aGUgb3RoZXIg
YmNtMjgzNSB0aW1lcnMgaW4gbXkgcHJpdmF0ZSBnaXRodWIsIGFuZCBJIGhvcGUNCj4gPiB0byBz
dWJtaXQgdG8gdXBzdHJlYW0gcWVtdSBhZnRlciB0aGUgY3VycmVudCBmcmVlemUsIHNpbmNlIGl0
IGlzDQo+ID4gbmVlZGVkIGZvciBwaTEgTGludXggc3VwcG9ydC4NCj4gPg0KPiA+IENoZWVycywN
Cj4gPiBBbmRyZXcNCj4gDQoNCg==
