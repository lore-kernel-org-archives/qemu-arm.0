Received: by 10.182.158.201 with SMTP id ww9csp2439900obb;
        Mon, 7 Dec 2015 09:25:07 -0800 (PST)
X-Received: by 10.55.207.73 with SMTP id e70mr29328160qkj.77.1449509107800;
        Mon, 07 Dec 2015 09:25:07 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z50si28319864qge.38.2015.12.07.09.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Dec 2015 09:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:55714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5zX7-000575-9f
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 12:25:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a5zWh-0004mf-76
	for qemu-devel@nongnu.org; Mon, 07 Dec 2015 12:24:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a5zWe-0004Vk-J9
	for qemu-devel@nongnu.org; Mon, 07 Dec 2015 12:24:39 -0500
Received: from mail-bn1bon0137.outbound.protection.outlook.com
	([157.56.111.137]:15712
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a5zWe-0004VP-Ao
	for qemu-devel@nongnu.org; Mon, 07 Dec 2015 12:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=nLUyQSTy2jWQR0mViMsqIq8JAI1RS7/9WA/1vRRarj0=;
	b=mcWkEsjy3h32wPBxbTh8kFoYtWEf0jf/StQ2RHz8z4wtr18t/06Mtb5d5TRW2AKhWYreoVc8RqkMgisniMz8SwgQgZp9D61uFiLOF/N8mFAnkbgJYQVMwY3WdY08ZpVfQT7JQPTB58XeUbKSPuD+6xe0nIzh5xm0G4QBc1IRWxw=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2035.namprd03.prod.outlook.com (10.164.22.25) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Mon, 7 Dec 2015 17:24:34 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0337.015; Mon, 7 Dec 2015 17:24:34 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
Thread-Index: AQHRLllz7K4EEY2RuUSr8mGMJ47UG56/FoaAgAC0zJA=
Date: Mon, 7 Dec 2015 17:24:33 +0000
Message-ID: <BLUPR0301MB2034E0CCAEE63ACFD63568159E090@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=rSRXiGdZK-J+-1wvP9in+WC7pGcPTfEe5p1VzbhYj58g@mail.gmail.com>
In-Reply-To: <CAPokK=rSRXiGdZK-J+-1wvP9in+WC7pGcPTfEe5p1VzbhYj58g@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:5::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2035;
	5:iBnpf1AmWWrtXHAWEBA2r7a+qJowKu4rRnvm5D70zC/TMo/I52MFeRj+idwKORkljmdNRoL+CdvQEuWoJfmXxdfGYbNKU/Dycc8tsE5nXgfZ2ww33caYXKnuCDkRHRHzehRgvnUMyJYjqnFll5DnhQ==;
	24://OEnWhaJL2uhfbT0s7qfDRrc9cVfIa+HUmLnmV2qyTv8pFQlONrcCas/K+in5GdFiy+uxNjjeA1pSIeVkT7ygKpzPFV+3qUTeEQaQeq0cs=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2035;
x-microsoft-antispam-prvs: <BLUPR0301MB20351CE7236273D413F188279E090@BLUPR0301MB2035.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2035; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2035; 
x-forefront-prvs: 078310077C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(377454003)(24454002)(86362001)(8990500004)(77096005)(74316001)(5004730100002)(19580405001)(1096002)(106356001)(99286002)(33656002)(189998001)(40100003)(10090500001)(10290500002)(6116002)(105586002)(92566002)(106116001)(102836003)(1220700001)(5002640100001)(5003600100002)(50986999)(101416001)(15975445007)(11100500001)(86612001)(76576001)(110136002)(122556002)(5008740100001)(87936001)(81156007)(1411001)(10400500002)(5005710100001)(2900100001)(2950100001)(5001960100002)(19580395003)(76176999)(97736004)(54356999)(586003)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2035;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2015 17:24:33.8492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2035
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.137
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
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
X-TUID: bMf27G/RNC4r

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBTdW5kYXksIDYgRGVjZW1iZXIgMjAxNSAyMjozNw0KPiBPbiBUaHUsIERl
YyAzLCAyMDE1IGF0IDEwOjAxIFBNLCBBbmRyZXcgQmF1bWFubg0KPiA8QW5kcmV3LkJhdW1hbm5A
bWljcm9zb2Z0LmNvbT4gd3JvdGU6DQo+ID4gVGhpcyBhZGRzIHRoZSBzeXN0ZW0gbWFpbGJveGVz
IHdoaWNoIGFyZSB1c2VkIHRvIGNvbW11bmljYXRlIHdpdGggYQ0KPiA+IG51bWJlciBvZiBHUFUg
cGVyaXBoZXJhbHMgb24gUGkvUGkyLg0KPiA+DQo+IA0KPiBBcmUgdGhlcmUgYW55IHB1YmxpY2Fs
bHkgYXZhaWxhYmxlIHNwZWNzIGZvciB0aGlzPyBJIGZvdW5kIHRoZQ0KPiBwZXJpcGhlcmFsIG1h
bnVhbCB3aGljaCBkb2N1bWVudHMgdGhlIGludGVycnVwdHMgY29udHJvbGxlciBidXQgSQ0KPiBj
b3VsZG50IGVhc2lseSBmaW5kIGEgZG9jIHRvIGNvdmVyIHRoaXMuIEkgY2FuIHJldmlldyB3aXRo
b3V0IGRvY3MsDQo+IGJ1dCBpdCBpcyBhIGxpdHRsZSBoYXJkZXIuIEEgZmV3IHRvcCBsZXZlbCBz
ZW50YW5jZXMgYWJvdXQgaG93IGl0DQo+IHdvcmtzIGFuZCB3aGF0IGl0IGRvZXMgd291bGQgaGVs
cCBpbiBjb21taXQgbWVzc2FnZSBpZiB3ZSBjYW4ndCBnZXQgYQ0KPiBkb2MuDQoNClRoZSBvbmx5
IGRvY3MgSSBjb3VsZCBmaW5kIGFyZToNCmh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9m
aXJtd2FyZS93aWtpL01haWxib3hlcw0KaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2Zp
cm13YXJlL3dpa2kvQWNjZXNzaW5nLW1haWxib3hlcw0KDQpJdCBwcm9iYWJseSBkb2Vzbid0IGh1
cnQgdG8gYWRkIHRoZXNlIGxpbmtzIHRvIGVpdGhlciBhIGhlYWRlciBjb21tZW50IG9yIGNvbW1p
dCBtZXNzYWdlLiBJJ2xsIGRvIHRoYXQgaW4gdjIuDQoNCkFuZHJldw0K
