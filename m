Received: by 10.25.208.211 with SMTP id h202csp2387899lfg;
        Wed, 24 Feb 2016 10:05:02 -0800 (PST)
X-Received: by 10.140.35.115 with SMTP id m106mr49945101qgm.13.1456337102066;
        Wed, 24 Feb 2016 10:05:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si3789867qge.94.2016.02.24.10.05.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Feb 2016 10:05:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:37491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYdo5-0002AX-Et
	for alex.bennee@linaro.org; Wed, 24 Feb 2016 13:05:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aYdo3-00029y-O1
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 13:05:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aYdnz-0003BA-7f
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 13:04:59 -0500
Received: from mail-by2on0119.outbound.protection.outlook.com
	([207.46.100.119]:27072
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aYdny-0003B0-LU; Wed, 24 Feb 2016 13:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=5NBUhntZOSQY+LY6esPGWPKS0JAjPlgCnPBaw+J+/h4=;
	b=Fxj2YCCtvzrV2VGhg27samBk3oC8Knr34T+Wrpcj9hqQ6Vqr3bSVfnmGi1dAn5ujYbLBClho+VpOTMvMMkAjTjloMhDLeMBzjO4WQVd6Tv7qdhqNMq8aP6oCV9CCBZalDl/fWtvQFLjADKMDRnsRkEOqh0Izb2etmsmD04DApZg=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2035.namprd03.prod.outlook.com (10.164.22.25) with Microsoft
	SMTP Server (TLS) id 15.1.409.15; Wed, 24 Feb 2016 18:04:51 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0409.024; Wed, 24 Feb 2016 18:04:51 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Maydell <peter.maydell@linaro.org>, Mats Malmberg
	<mats.malmberg@tritech.se>
Thread-Topic: [Qemu-arm] help on how to emulate rasbperry pi 2
Thread-Index: AQHRbyuhTtcp6DFdR0aZb1Ld0rYnj587fCNg
Date: Wed, 24 Feb 2016 18:04:51 +0000
Message-ID: <BLUPR0301MB2034905DFE5B0135A1BE897A9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <605392182193B84A99A143D9DA347B52FB8AA7@post>
	<CAFEAcA9xvDiHAc6Tu-PLbjd=RruX1c+vpfZg+ZvtH5t3DSyUOw@mail.gmail.com>
In-Reply-To: <CAFEAcA9xvDiHAc6Tu-PLbjd=RruX1c+vpfZg+ZvtH5t3DSyUOw@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:7::724]
x-ms-office365-filtering-correlation-id: afc4d5af-4817-4e3f-439f-08d33d44fde0
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2035;
	5:WMvobYqNx0ihB5UqhOQ9/Gs0GIjZmbj700nWGTWgRJJfOdiDgbqhNQea2ZyyEip1Zg77PaQI64sR+jOtebv+qbmRSJnB38kvMpKKLh8Pi9fFPz63JlW1NNOifSa6gpsKRQ88uENwuXnoQc3u5w0u2w==;
	24:iZX/XbjkpfcvOHQkj1xloE6nS8zW8HWkW3uiD7AbjZKAA/x92Abj57Sk4vvmhjBw4U6WnXp7pdsgp/Lfcs8FGbhHv6OuX6Ziqk68Fwq/7pA=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2035;
x-microsoft-antispam-prvs: <BLUPR0301MB2035A954472CAC9BABD74AF09EA50@BLUPR0301MB2035.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2035; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2035; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(53754006)(377454003)(24454002)(92566002)(102836003)(6116002)(1096002)(33656002)(586003)(1220700001)(5005710100001)(10290500002)(2906002)(10400500002)(5004730100002)(5008740100001)(3280700002)(5002640100001)(2900100001)(2950100001)(8990500004)(5003600100002)(15975445007)(74316001)(4326007)(19580395003)(5001770100001)(77096005)(19580405001)(5001960100002)(106116001)(76576001)(87936001)(40100003)(10090500001)(122556002)(11100500001)(99286002)(76176999)(86362001)(50986999)(54356999)(189998001)(3660700001)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2035;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2016 18:04:51.3119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2035
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.119
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] help on how to emulate rasbperry pi 2
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
X-TUID: ui9lf4K5A8gu

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBXZWRuZXNkYXksIDI0IEZlYnJ1YXJ5IDIwMTYgOTo0OSBBTQ0KPiANCj4gT24gMjQg
RmVicnVhcnkgMjAxNiBhdCAxNTo0MCwgTWF0cyBNYWxtYmVyZyA8bWF0cy5tYWxtYmVyZ0B0cml0
ZWNoLnNlPg0KPiB3cm90ZToNCj4gPg0KPiA+IEhlbGxvIGFsbCENCj4gPg0KPiA+IFRMO0RSIDog
SXMgdGhlIHJhc3BpMiBtYWNoaW5lIHJlYWR5IHRvIHVzZT8gSWYgeWVzLCBob3cgZG8gSSB1c2Ug
aXQgd2l0aA0KPiA+IG9yZGluYXJ5IHJwaSBkaXN0cm9zPyBJZiBub3QsIHdoYXQgaXMgdGhlIGJl
c3Qgd2F5IHRvIGVtdWxhdGUgcmFzcGJlcnJ5DQo+ID4gcGkgMiB2aWEgUWVtdT8NCj4gDQo+IEhp
OyBJJ3ZlIGNjJ2QgdGhlIG1haW4gcWVtdS1kZXZlbCBsaXN0IGFuZCBBbmRyZXcgQmF1bWFubiB3
aG8gY29udHJpYnV0ZWQNCj4gdGhlIHJwaTIgc3VwcG9ydC4gSSBrbm93IHRoZXJlIGFyZSBzdGls
bCBzb21lIG1pc3NpbmcgcGllY2VzIHRvIGJlDQo+IGFkZGVkIGxhdGVyIGJ1dCBJIGZvcmdldCB0
aGUgZGV0YWlscy4NCg0KVGhlcmUgYXJlIHN0aWxsIGEgbnVtYmVyIG9mIG1pc3NpbmcgcGllY2Vz
IChpbmNsdWRpbmcgZGlzcGxheSBhbmQgVVNCKSB3aGljaCBJIGhvcGUgdG8gc3VibWl0IHNvb24s
IGJ1dCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gYm9vdCBMaW51eCB3aXRoIGEgc2VyaWFsIGNvbnNv
bGUuIEJyaWVmIGluc3RydWN0aW9ucyBhcmUgYXQgdGhlIGVuZCBvZiB0aGlzIHBhZ2U6IGh0dHBz
Oi8vZ2l0aHViLmNvbS8weGFidS9xZW11L3dpa2kNCg0KQlRXLCBpbnN0ZWFkIG9mIC1oZGEgeW91
IG5lZWQgdG8gcGFzcyAtc2QgZm9yIHRoZSBpbWFnZSBmaWxlLg0KDQpDaGVlcnMsDQpBbmRyZXcN
Cg0KPiANCj4gPiBIb3N0ICd1bmFtZSAtYScgb3V0cHV0Og0KPiA+IExpbnV4IHVzZXItUHJlY2lz
aW9uLU00NzAwIDMuMTkuMC00OS1nZW5lcmljICM1NX4xNC4wNC4xLVVidW50dSBTTVAgRnJpDQo+
IEphbiAyMiAxMToyNDozMSBVVEMgMjAxNiB4ODZfNjQgeDg2XzY0IHg4Nl82NCBHTlUvTGludXgN
Cj4gPg0KPiA+IFFlbXUgdmVyc2lvbiAodmlhIGFwdC1nZXQpIDIuNS41MA0KPiA+DQo+ID4NCj4g
Pg0KPiA+IEkgaGF2ZSBiZWVuIHRyeWluZyBsYXRlbHkgdG8gZ2V0IGFuIGVtdWxhdGlvbiBnb2lu
ZyB3aXRoIHRoZSByYXNwaTIgbWFjaGluZS4NCj4gSSBhZG1pdCB0aGF0IHRoaXMgaXMgbXkgZmly
c3QgZW5jb3VudGVyIHdpdGggdHJ5aW5nIHRvIHVzZSBxZW11LCBzbyBwZXJoYXBzDQo+IHNvbWUg
b2YgbXkgYXR0ZW1wdHMgaGF2ZSBiZWVuIG5haXZlIGluIHRoZWlyIGFwcHJvYWNoLiBTdGlsbCwg
SSd2ZSBzcGVudCBhIGxvdA0KPiBvZiB0aW1lIGdvb2dsaW5nIGd1aWRlcywgcWVtdSB1c2VyIGRv
Y3VtZW50YXRpb24sIGJsb2cgcG9zdHMsIGdpdA0KPiByZXBvc2l0b3JpZXMgZXRjLCBidXQgd2l0
aCBubyBzdWNjZXNzLiBOb3cgSSdtIGFsbCBvdXQgb2YgaWRlYXMuLi4NCj4gPg0KPiA+IEkndmUg
dHJpZWQgbW9yZSB3YXlzIHRoYW4gc3VpdGFibGUgdG8gZGVzY3JpYmUgaGVyZSwgYnV0IGluIHNo
b3J0IEkgdHlwaWNhbGx5Og0KPiA+IDEuIHRha2UgYSBvZmZpY2lhbCBsaW51eCBkaXN0cm8gZm9y
IHJhc3BiZXJyeSBwaSAoYWxwaW5lLCByYXNwYmlhbi1qZXNzaWUsIEh5cHJpb3QNCj4gZXRjKSAo
YWxsIG9mIHRoZW0gdmVyaWZpZWQgdG8gd29yayBvbiBhY3R1YWwgdGFyZ2V0KQ0KPiA+IDIuIGZp
bmQgYSAod2hhdCBJIHRoaW5rIGlzKSBhIGNvbXBhdGlibGUga2VybmVsLCBlaXRoZXIgYnkgY29w
eWluZyBmcm9tDQo+IGRpc3RybydzIHJvb3RmcyBib290LyBkaXJlY3Rvcnkgb3IgYnkgYnVpbGRp
bmcgYSBxZW11IGtlcm5lbCBmcm9tIHNvdXJjZQ0KPiAoaHR0cHM6Ly9naXRodWIuY29tL2RocnV2
dnlhczkwL3FlbXUtcnBpLWtlcm5lbCkNCj4gPiAzLiB0cnkgYW5kIHN0YXJ0IHRoZSBlbXVsYXRp
b24gd2l0aA0KPiA+IHFlbXUtc3lzdGVtLWFybSAta2VybmVsIGtlcm5lbF9maWxlIC1NIHJhc3Bp
MiAtaGRhIGxpbnV4X2ltYWdlX2ZpbGUuaW1nDQo+ID4NCj4gPiBhdCB0aGlzIHBvaW50LCB0aGUg
dGVybWluYWwgc2F5cyAiVk5DIHNlcnZlciBydW5uaW5nIG9uICcxMjcuMC4wLjE7NTkwMCcNCj4g
PiA0LiB1c2luZyB2aW5hZ3JlIGNsaWVudCBpIGNvbm5lY3QgdG8gdGhlIGdpdmVuIGFkZHJlc3Ms
IGJ1dCBpdCBvbmx5IGdpdmVzIG1lIGENCj4gY29tcGF0X21vbml0b3IwIGNvbnNvbGUNCj4gPg0K
PiA+IFRodXMgSSB3b25kZXIsIGlzIHRoZSByYXNwaTIgbWFjaGluZSBhIGZlYXR1cmUgdGhhdCBp
cyByZWFkeSB0byB1c2U/DQo+ID4gSWYgc28sIHdoZXJlIGRvIEkgZmFpbCBpbiBteSBhdHRlbXB0
cz8gSWYgbm90LCB3aGF0IGlzIGEgcmVjb21tZW5kZWQNCj4gYWx0ZXJuYXRpdmU/DQo+ID4NCj4g
PiBBbnkgaGVscCBvciBwb2ludGVycyBvbiBob3cgdG8gYmUgYWJsZSB0byBlbXVsYXRlIG15IHRh
cmdldCAocmFzcGJlcnJ5IHBpDQo+IDIpIHdvdWxkIGJlIHZlcnkgYXBwcmVjaWF0ZWQuDQo+IA0K
PiB0aGFua3MNCj4gLS0gUE1NDQo=
