Received: by 10.25.159.19 with SMTP id i19csp109360lfe;
        Thu, 14 Jan 2016 15:05:09 -0800 (PST)
X-Received: by 10.140.223.148 with SMTP id t142mr9589406qhb.65.1452812709202;
        Thu, 14 Jan 2016 15:05:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 107si9797391qgx.12.2016.01.14.15.05.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 15:05:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:44832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJqx2-0004zC-JD
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 18:05:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aJqx0-0004vM-9M
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 18:05:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aJqwy-0000Mk-SL
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 18:05:06 -0500
Received: from mail-bn1on0133.outbound.protection.outlook.com
	([157.56.110.133]:54201
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aJqwr-0000AT-Ni; Thu, 14 Jan 2016 18:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=NZDQOeychNQAbDa0i5o8SPvTqxAwmOXBtrrBixTtyUU=;
	b=Jod0U66/8cFK551dgzXdkaseS32E3yD7KMAbVJO9a+xh9VYVLRi6IkiMSzcSqnwJ84XeaTaUNNC2EMyH0jcp0NKdnmFkooa5Ffeq0Rj/DQUZmb82BQIjj/ISBilnLa/K2eqTp4wbLwbNhWgW/6LhI88u+pFmUKsao+DjeiSCf0Y=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.365.19; Thu, 14 Jan 2016 23:04:55 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0365.023; Thu, 14 Jan 2016 23:04:55 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v3 7/7] raspi: add raspberry pi 2 machine
Thread-Index: AQHRRCvQrdqc5QRVI0SWrS1zLOHRB573UnuAgAFA88CAABsYgIADB7pA
Date: Thu, 14 Jan 2016 23:04:55 +0000
Message-ID: <BLUPR0301MB20344588F72A1870A14A673A9ECC0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-8-git-send-email-Andrew.Baumann@microsoft.com>
	<20160112035753.GD3308@pcrost-box>
	<BLUPR0301MB2034BFDBF9CE361133F26B8E9ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=o8x9fRw7K-nfdhSVB=8De9bMi9tZiUq54cevvjNSDP2A@mail.gmail.com>
In-Reply-To: <CAPokK=o8x9fRw7K-nfdhSVB=8De9bMi9tZiUq54cevvjNSDP2A@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:7::494]
x-ms-office365-filtering-correlation-id: bcd6b101-4452-489f-43f8-08d31d371e42
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:amX7kgB3dbJZYob5xUfodSg02kBgLs5B0XANS2WvWYsvIuKVxAjI5Ek+eYr3nFqm4n6pfF+LoKjKmy1I66dykNUCF0MwPKU3RyTl4FJDP0eSsJ9fh6wjdU9S0+HGyYUpClVk9T8v9XWnwB5orWRmiw==;
	24:1icJs07+pHrlJEeZpTEHmrT0zho+NXbdO+41f/pp7mAkO7rudPDn4VySIoc7Op225xS2imc8AiKlGG1ZyJ0sqXWcjG/g+fY/jOfHKwO8OyE=
x-exchange-antispam-report-test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; UriScan:; 
x-microsoft-antispam-prvs: <BLUPR0301MB20347CE62A21947089A80C4E9ECC0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(520078)(5005006)(8121501046)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 08213D42D3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(24454002)(164054003)(199003)(189002)(1411001)(87936001)(105586002)(5005710100001)(40100003)(76576001)(97736004)(74316001)(50986999)(99286002)(5002640100001)(106116001)(93886004)(106356001)(189998001)(1096002)(110136002)(1220700001)(19580405001)(8990500004)(122556002)(5001960100002)(4326007)(10290500002)(10400500002)(81156007)(586003)(2906002)(6116002)(19580395003)(102836003)(10090500001)(5004730100002)(54356999)(2900100001)(11100500001)(77096005)(86362001)(2950100001)(86612001)(101416001)(33656002)(5003600100002)(92566002)(76176999)(5008740100001)(3826002);
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2016 23:04:55.4781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.133
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 7/7] raspi: add raspberry pi 2 machine
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
X-TUID: FXVY6sC54/r9

SGkgUGV0ZXIsDQoNCj4gRnJvbTogUGV0ZXIgQ3Jvc3Rod2FpdGUgW21haWx0bzpjcm9zdGh3YWl0
ZXBldGVyQGdtYWlsLmNvbV0NCj4gU2VudDogVHVlc2RheSwgMTIgSmFudWFyeSAyMDE2IDE2OjQ0
DQo+IE9uIFR1ZSwgSmFuIDEyLCAyMDE2IGF0IDM6NTMgUE0sIEFuZHJldyBCYXVtYW5uDQo+IDxB
bmRyZXcuQmF1bWFubkBtaWNyb3NvZnQuY29tPiB3cm90ZToNCj4gPj4gRnJvbTogUGV0ZXIgQ3Jv
c3Rod2FpdGUgW21haWx0bzpjcm9zdGh3YWl0ZXBldGVyQGdtYWlsLmNvbV0NCj4gPj4gU2VudDog
TW9uZGF5LCAxMSBKYW51YXJ5IDIwMTYgMTk6NTgNCj4gPj4gPiArICAgIC8qIEFsbG9jYXRlIGFu
ZCBtYXAgUkFNICovDQo+ID4+ID4gKyAgICBtZW1vcnlfcmVnaW9uX2FsbG9jYXRlX3N5c3RlbV9t
ZW1vcnkoJnMtPnJhbSwNCj4gPj4gT0JKRUNUKG1hY2hpbmUpLCAicmFtIiwNCj4gPj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYWNoaW5lLT5yYW1fc2l6ZSk7
DQo+ID4+ID4gKyAgICBtZW1vcnlfcmVnaW9uX2FkZF9zdWJyZWdpb25fb3ZlcmxhcChnZXRfc3lz
dGVtX21lbW9yeSgpLCAwLA0KPiA+PiAmcy0+cmFtLCAwKTsNCj4gPj4NCj4gPj4gSSB0aG91Z2h0
IHRoZSBTb0MgaGFuZGxlZCB0aGlzIG5vdz8gV2h5IGRvIHlvdSBuZWVkIHRvIGFkZCB0bw0KPiA+
PiBzeXN0ZW1fbWVtb3J5Pw0KPiA+DQo+ID4gSWYgSSBkb24ndCBtYXAgaXQgaGVyZSwgaG93IGRv
IFJBTSBhY2Nlc3NlcyBmcm9tIHRoZSBDUFVzIHdvcms/DQo+ID4NCj4gDQo+IERvIHRoZSBDUFVz
IG5vdCBoYXZlIHRoZWlyIEFTJ2VzIGNvbm5lY3RlZCB0byB5b3VyIGN1c3RvbSBBU2VzIGJ5IHRo
ZSBTb0MNCj4gbGF5ZXI/DQo+IA0KPiA+IE9yIGFyZSB5b3Ugc2F5aW5nIHRoYXQgSSBzaG91bGQg
c3RpbGwgZG8gdGhpcywgYnV0IGRvIGl0IGluIHRoZSBTb0Mgbm90IHRoZQ0KPiBib2FyZCBsZXZl
bD8NCj4gPg0KPiANCj4gSSB3YXMgaG9waW5nIHdlIGNvdWxkIGdldCBhd2F5IHdpdGggMCB1c2Ug
b2Ygc3lzdGVtX21lbW9yeS4NCg0KT24gZnVydGhlciBpbnZlc3RpZ2F0aW9uLCBJIGRvbid0IHRo
aW5rIGl0J3MgcG9zc2libGUgdG8gd2lyZSB1cCBDUFUgQVNlcyBleHBsaWNpdGx5LiBUaGVyZSdz
IG5vIG9idmlvdXMgcHJvcGVydHkgdG8gc2V0LiBFYWNoIGNwdS0+YXMgaXMgaW5pdGlhbGlzZWQg
dG8gcG9pbnQgdG8gYWRkcmVzc19zcGFjZV9tZW1vcnkgYXQgdGhlIHRvcCBvZiBjcHVfZXhlY19p
bml0KCksIGFuZCB0aGVyZSBpcyBubyB3YXkgSSBjb3VsZCBzZWUgdG8gb3ZlcnJpZGUgdGhhdC4N
Cg0KSSB0aGluayB3aGF0IEkgaGF2ZSBub3cgaXMgcHJldHR5IGNsZWFuLCBidXQgaWYgeW91J2Qg
cHJlZmVyIHRvIGRvIHRoZSBtYXBwaW5nIGF0IGludG8gdGhlIGdsb2JhbCBBUyBhdCBTb0MgbGV2
ZWwgdGhhdCdzIGZpbmUgd2l0aCBtZSB0b28uDQoNClRoYW5rcywNCkFuZHJldw0K
