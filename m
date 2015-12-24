Received: by 10.182.158.201 with SMTP id ww9csp4390055obb;
        Wed, 23 Dec 2015 16:13:18 -0800 (PST)
X-Received: by 10.55.73.85 with SMTP id w82mr35264256qka.52.1450915998133;
        Wed, 23 Dec 2015 16:13:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 97si42319079qkt.81.2015.12.23.16.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 16:13:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:58359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBtWv-0005E1-Os
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 19:13:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtWt-0005Bz-75
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 19:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtWs-0002Vs-A7
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 19:13:15 -0500
Received: from mail-bn1on0112.outbound.protection.outlook.com
	([157.56.110.112]:32760
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aBtWm-0002VS-6o; Wed, 23 Dec 2015 19:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hnJOBMFA24nRLIpXSETfSQX1fk/mStiJhXzeU6slyZg=;
	b=EnIdsQT+CyUP/icvAnUToHQIsdNUlOH+rxAa0bpmYmF42/G9o4QmG7d9MrAzCITh71634QQxKSBHjaC4rMjV+s4G6/Tapx+uNSgFY2Whm5PblI9CGiJEnkFHP0aVe3KjBxg47ywUW11ykjxRSVPHo99daOTCPskR1PN+hNL+0qY=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 24 Dec 2015 00:13:06 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0361.006; Thu, 24 Dec 2015 00:13:06 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, Paolo Bonzini
	<pbonzini@redhat.com>
Thread-Topic: [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
Thread-Index: AQHRLllz7K4EEY2RuUSr8mGMJ47UG57WJvIAgAAByCCAAAqKgIAC8kEAgAA5qACAAAHIsA==
Date: Thu, 24 Dec 2015 00:13:06 +0000
Message-ID: <BLUPR0301MB2034ECB45E2A37FD057C25FA9EE70@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=rGg5pG_XFL0c6C-i-Mkobzd+D-KgrUE1bdt1RBsD3bGg@mail.gmail.com>
	<BLUPR0301MB20345C0D49B62FE27C9BB9439EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=owo1JtwWzDneGm9b+xe708eRDLXDQGgvVm1kkSLMo-hg@mail.gmail.com>
	<567B04FA.2030903@redhat.com>
	<CAPokK=rX7pxfhP7GcoZpDGpgOATYa1PHvMbh9F3_eYg6vT-Ecw@mail.gmail.com>
In-Reply-To: <CAPokK=rX7pxfhP7GcoZpDGpgOATYa1PHvMbh9F3_eYg6vT-Ecw@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:b::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:H77YIK0goSz1kmtQ/PsHJR+vKa+DsWTErilFdDH/86S1HE1RMti+AuFki4sly9m/Ts9d24hkp228iZkZ8/Bc+E3Eb4oyXzXlkU7H1yzzra0Kemp5Et8d2Tyb6ovMEU4rLzMC9hBU3A3jPJt2skSrZg==;
	24:XLavrFUKG31ec41A/Gb22qX4NQzyxXCQRBPtBENgNp/JIO/p+Ok40WXejJhxgn2xbBd6bbq5yE904xw4qW9XvMKgesa9d8p42jmfG3HhPZ0=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-microsoft-antispam-prvs: <BLUPR0301MB20360A0DCB44274BA2A2E84F9EE70@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 0800C0C167
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(5004730100002)(19580405001)(99286002)(76576001)(19580395003)(11100500001)(101416001)(586003)(74316001)(102836003)(105586002)(5008740100001)(106356001)(106116001)(1096002)(6116002)(1220700001)(77096005)(15975445007)(5002640100001)(10290500002)(86362001)(8990500004)(5003600100002)(86612001)(40100003)(2900100001)(33656002)(81156007)(93886004)(2950100001)(54356999)(92566002)(97736004)(5005710100001)(76176999)(189998001)(5001960100002)(10400500002)(50986999)(5001770100001)(10090500001)(87936001)(122556002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2015 00:13:06.1598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.112
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
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
X-TUID: oWiRP6ycAZRY

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIDIzIERlY2VtYmVyIDIwMTUgMTU6NTkNCj4gPj4+IE5v
dGljZSB0aGF0IHRoaXMgZmlsZSBjb21lcyBmcm9tIExpbnV4LiBJIGtub3cgaXQncyBub3QgcHJl
dHR5LCBidXQNCj4gDQo+IFdoZXJlIGluIExpbnV4IGV4YWN0bHk/IEkgYW0gYWN0dWFsbHkgaGF2
aW5nIHRyb3VibGUgZmluZGluZyB0aGUNCj4gb3JpZ2luYWwgc291cmNlLiBHcmVwcGluZyBhcm91
bmQgbGludXgtbmV4dCwgdGhlcmUgaXMgbm8gbWFjaA0KPiBiY20tMjcwOC4gSSBjYW4gc2VlIHRo
aXMgbWFjaCBpbiBhbiByUEkgc3BlY2lmaWMgZm9yaywgYnV0IEkgZG9uJ3Qgc2VlDQo+IGl0IGlu
IHVwc3RyZWFtIExpbnV4Lg0KDQpBZnRlciBzb21lIGdyb3ZlbGxpbmcsIEkgdGhpbmsgaXQgb3Jp
Z2luYXRlcyBmcm9tIGhlcmU6DQpodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgv
YmxvYi9ycGktNC4xLnkvYXJjaC9hcm0vbWFjaC1iY20yNzA4L2luY2x1ZGUvbWFjaC9hcm1fY29u
dHJvbC5oDQoNCkhvd2V2ZXIsIHRoZXJlIGFyZSBzb21lIGRpZmZzIGJldHdlZW4gdGhhdCBhbmQg
bXkgdmVyc2lvbiwgd2hpY2ggbG9vayBsaWtlIHRoZXkgb3JpZ2luYXRlZCBmcm9tIHNvbWVvbmUg
aGFja2luZyBpdCB0byBnZXQgZWFjaCBsaW5lIHVuZGVyIDgwIGNoYXJhY3RlcmVzICh0byBzYXRp
c2Z5IGNoZWNrcGF0Y2gucGw/KS4gVGhpcyByYXRoZXIgZGVmZWF0cyB0aGUgcHVycG9zZSBvZiBr
ZWVwaW5nIGl0IHVubW9kaWZpZWQuDQoNCkFzIGZhciBhcyBJIGNhbiB0ZWxsLCB3ZSBvbmx5IG5l
ZWQgdGhlIG1haWxib3gtcmVsYXRlZCBkZWZzLiBJJ2xsIGp1c3QgcHVsbCB0aG9zZSBvdXQgaW50
byB0aGUgcmVsZXZhbnQgZGV2aWNlIGVtdWxhdGlvbiwgYW5kIGRyb3AgdGhlIGZpbGUuDQoNCkFu
ZHJldw0K
