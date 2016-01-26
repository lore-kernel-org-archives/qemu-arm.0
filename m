Received: by 10.25.159.19 with SMTP id i19csp2001399lfe;
        Tue, 26 Jan 2016 11:12:17 -0800 (PST)
X-Received: by 10.140.227.199 with SMTP id x190mr32013133qhb.46.1453835537924;
        Tue, 26 Jan 2016 11:12:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t9si2743264qhb.67.2016.01.26.11.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jan 2016 11:12:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:46281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aO92H-00026N-Bx
	for alex.bennee@linaro.org; Tue, 26 Jan 2016 14:12:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aO92F-000244-2Z
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 14:12:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aO92E-00048I-5p
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 14:12:14 -0500
Received: from mail-bn1on0116.outbound.protection.outlook.com
	([157.56.110.116]:4329
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aO928-00047e-LS; Tue, 26 Jan 2016 14:12:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=59sY3YlwzQzCW3qp96BD1i35xqk6mkXtaECs9F3So2M=;
	b=gPF9VRBQv2f+TQAzbqelajiNpj4qVKLLF19JsHbPiGJpds3/x9279r+TdI0SFiHdazcpjhlR8ugf3Nn9hbQjoRZUiFgwTpAw90umqnB14n0hvNg7nuHgj1eDI5cH4hIkkN0N33zcQzkUyeD+WzlA1zpJDHKNWRbSyx6+C8jMJYg=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.390.13; Tue, 26 Jan 2016 19:12:07 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0390.013; Tue, 26 Jan 2016 19:12:07 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v4 4/8] bcm2835_peripherals: add rollup device for
	bcm2835 peripherals
Thread-Index: AQHRT/DDSa0Q9/bDa0ydsyPaRKMGkp8NYbWAgAABHxCAAB1GAIAAuMxw
Date: Tue, 26 Jan 2016 19:12:06 +0000
Message-ID: <BLUPR0301MB20347E506B5172A98D5377229ED80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-5-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=qp6vgfLPD+iai2-quyXD3ODPtNQgZLS1Kfwgn-ZCYMRw@mail.gmail.com>
	<BLUPR0301MB2034FAE99E63647A00D388E79ED80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=rXwURCOc=-W1v+2=Br2kZ4fDXdPUR6gc=UdyoVisY_Bw@mail.gmail.com>
In-Reply-To: <CAPokK=rXwURCOc=-W1v+2=Br2kZ4fDXdPUR6gc=UdyoVisY_Bw@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:d::724]
x-ms-office365-filtering-correlation-id: 472dd74a-8b18-4624-08e0-08d32684954a
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:1eg1tNAexBSe6cGuEE+dHnY0TYHYUnqn3oEe7z+OflN9RLawTPMS4/J8AZ+AEwS3daFgbR5fqqee35jurTr0Vyq4K4WSxCV9+o/9IqR3ZjEO0tkRbbc70Yt+eTVESQUtfkSwhC7zofbIPzxv+ZAgXQ==;
	24:UHOpSiVPffKqwQ/+Xd334qdQzCi1DFyjnAYD/CTkxGRp78zjJMVZPOuWvKgdapH+8P2dJJoEDSFI2j9t4+Cz4dWX3Z5OuSu5UyIzbjP9dT4=
x-exchange-antispam-report-test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; UriScan:; 
x-microsoft-antispam-prvs: <BLUPR0301MB2034DC4405811A0B22061EF69ED80@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 08331F819E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(377454003)(52314003)(24454002)(199003)(4326007)(10400500002)(1411001)(8990500004)(2906002)(122556002)(19580405001)(87936001)(5005710100001)(10290500002)(86362001)(92566002)(40100003)(93886004)(5004730100002)(97736004)(81156007)(3280700002)(86612001)(110136002)(77096005)(1096002)(1220700001)(76576001)(50986999)(11100500001)(2900100001)(10090500001)(74316001)(54356999)(5001960100002)(2950100001)(101416001)(5008740100001)(33656002)(6116002)(99286002)(189998001)(19580395003)(5003600100002)(105586002)(586003)(106356001)(106116001)(5002640100001)(76176999)(102836003)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2016 19:12:06.7817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.116
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 4/8] bcm2835_peripherals: add rollup
 device for bcm2835 peripherals
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
X-TUID: vLW2UzZH0+zS

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBUdWVzZGF5LCAyNiBKYW51YXJ5IDIwMTYgMDA6MDMNCj4gDQo+IE9uIE1v
biwgSmFuIDI1LCAyMDE2IGF0IDEwOjIzIFBNLCBBbmRyZXcgQmF1bWFubg0KPiA8QW5kcmV3LkJh
dW1hbm5AbWljcm9zb2Z0LmNvbT4gd3JvdGU6DQo+ID4+IEZyb206IFBldGVyIENyb3N0aHdhaXRl
IFttYWlsdG86Y3Jvc3Rod2FpdGVwZXRlckBnbWFpbC5jb21dDQo+ID4+IFNlbnQ6IE1vbmRheSwg
MjUgSmFudWFyeSAyMDE2IDIyOjE0DQo+ID4+DQo+ID4+IE9uIEZyaSwgSmFuIDE1LCAyMDE2IGF0
IDM6NTggUE0sIEFuZHJldyBCYXVtYW5uDQo+ID4+IDxBbmRyZXcuQmF1bWFubkBtaWNyb3NvZnQu
Y29tPiB3cm90ZToNCj4gPiBbLi4uXQ0KPiA+PiA+ICtzdGF0aWMgdm9pZCBiY20yODM1X3Blcmlw
aGVyYWxzX2luaXQoT2JqZWN0ICpvYmopDQo+ID4+ID4gK3sNCj4gPj4gPiArICAgIEJDTTI4MzVQ
ZXJpcGhlcmFsU3RhdGUgKnMgPSBCQ00yODM1X1BFUklQSEVSQUxTKG9iaik7DQo+ID4+ID4gKw0K
PiA+PiA+ICsgICAgLyogTWVtb3J5IHJlZ2lvbiBmb3IgcGVyaXBoZXJhbCBkZXZpY2VzLCB3aGlj
aCB3ZSBleHBvcnQgdG8gb3VyDQo+ID4+IHBhcmVudCAqLw0KPiA+PiA+ICsgICAgbWVtb3J5X3Jl
Z2lvbl9pbml0X2lvKCZzLT5wZXJpX21yLCBvYmosIE5VTEwsIHMsICJiY20yODM1LQ0KPiA+PiBw
ZXJpcGhlcmFscyIsDQo+ID4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxMDAwMDAw
KTsNCj4gPj4NCj4gPj4gU2hvdWxkIHRoaXMganVzdCBiZSBub3JtYWwgbWVtb3J5X3JlZ2lvbl9p
bml0Pw0KPiA+DQo+ID4gSSB0aGluayBzbyAtLSBpdCdzIGp1c3QgYSBjb250YWluZXIgcmVnaW9u
LCBhbmQgSSBwcm9iYWJseSBjb3B5IGFuZCBwYXN0ZWQgdGhlDQo+IEFQSSBoZXJlLiBUaGUgdHdv
IE1SIGluaXQgQVBJcyBzZWVtIGFsbW9zdCBidXQgbm90LXF1aXRlIGlkZW50aWNhbCB3aGVuDQo+
IE5VTEwgY2FsbGJhY2tzIGFyZSB1c2VkLiBDYW4geW91IGJyaWVmbHkgZXhwbGFpbiB0aGUgZGlm
ZmVyZW5jZT8NCj4gPg0KPiANCj4gaG1tIEkgZ3Vlc3MgdGhlIGRlZmF1bHRpbmcgdG8gJnVuYXNz
aWduZWRfbWVtX29wcy4gbWVtb3J5X3JlZ2lvbl9pbml0DQo+IGxvb2tzIHRvIGFzc3VtZSB5b3Ug
d2lsbCBwb3B1bGF0ZSB0aGUgdXNhYmxlIHN1YnJlZ2lvbnMuIEFyZSB5b3UNCj4gcmVseWluZyBv
biB1bmFzc2lnbmVkIG9wcz8NCg0KQWN0dWFsbHksIG1lbW9yeV9yZWdpb25faW5pdGZuIGFsc28g
c2V0cyB0aGUgdW5hc3NpZ25lZF9vcHMsIHNvIHRoZSBvbmx5IGRpZmZlcmVuY2UgYXBwZWFycyB0
byBiZSBtci0+dGVybWluYXRlcywgd2hpY2ggaXMgc2V0IHRvIHRydWUgZm9yIGluaXRfaW8uIFRo
aXMgZmxhZyBhZmZlY3RzIHRoZSBiZWhhdmlvdXIgb2YgcmVuZGVyX21lbW9yeV9yZWdpb24oKSwg
d2hpY2ggdGVybWluYXRlcyBlYXJseSBpZiAhbXItPnRlcm1pbmF0ZXMuIFNvIHRoZSBkaWZmZXJl
bmNlIGlzIHRoYXQgdGhlIGdhcHMgYmV0d2VlbiB0aGUgc3VicmVnaW9ucyAoaS5lLiwgdGhlIGFj
dHVhbCBkZXZpY2VzKSB3b3VsZG4ndCBiZSByZW5kZXJlZC4gQnV0IHdoYXQgZGlmZmVyZW5jZSB0
aGlzIG1ha2VzIGluIHByYWN0aWNlIGlzIHVuY2xlYXIgdG8gbWUuIEl0IGNhbiBvbmx5IG1hdHRl
ciBpZiB0aGUgQ1BVIGFjY2Vzc2VzIGFuIHVuZGVmaW5lZCAvIHVuaW1wbGVtZW50ZWQgZGV2aWNl
LCBidXQgZXZlbiB0aGVuIGl0IGxvb2tzIHRvIG1lIGxpa2UgaXQgd291bGQgZW5kIHVwIGF0IHRo
ZSBzYW1lIHVuYXNzaWduZWQgb3BzIGNvZGUgYW55d2F5LCBzbyBJIHN1c3BlY3QgaXQncyBpcnJl
bGV2YW50Lg0KDQpJZiBtZW1vcnlfcmVnaW9uX2luaXQgd29ya3MsIEknbGwgZ28gd2l0aCB0aGF0
Lg0KDQpBbmRyZXcNCg==
