Received: by 10.182.158.201 with SMTP id ww9csp834718obb;
        Wed, 9 Dec 2015 11:01:44 -0800 (PST)
X-Received: by 10.55.82.193 with SMTP id g184mr9576518qkb.65.1449687704399;
        Wed, 09 Dec 2015 11:01:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 138si10197845qhq.66.2015.12.09.11.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 11:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:37435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6jzk-0005l1-6v
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 14:01:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a6jzi-0005ic-FU
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 14:01:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a6jzh-0003My-Eu
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 14:01:42 -0500
Received: from mail-bl2on0110.outbound.protection.outlook.com
	([65.55.169.110]:1376
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a6jzY-0003HY-A3; Wed, 09 Dec 2015 14:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0KjqbvxMQEIbq+0KGIthAR0dS0FnS0YgPRmPU9lv9JY=;
	b=MKa1ebFUEqO5RG3A95nQV6N9seYQOqgDNZComWZVyOcaRCryKqphDxaye3ALiDIZ/B/G2d4pFjXT7UXWraRCL6qScH2wkHnAAMwmGRBIA1FuQPSr5QxM5Uhsq/MWFfbAinQoQ62L6GZ5TqEEyuPI1pOBy5Trk4VSAKTltiqgqps=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Wed, 9 Dec 2015 19:01:17 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0337.015; Wed, 9 Dec 2015 19:01:17 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, Peter Maydell
	<peter.maydell@linaro.org>, Kevin OConnor <kevin@koconnor.net>
Thread-Topic: [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD controller
Thread-Index: AQHRLll1HRRnDohiT0GC4gj9UCGaxJ69cGeAgARdtiCAAH7lAIAAnAgggAAgXgCAAADQcA==
Date: Wed, 9 Dec 2015 19:01:17 +0000
Message-ID: <BLUPR0301MB2034EDE912E9F6BED40D12A49EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
	<BLUPR0301MB2034314DC44EA275D6FC79FA9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=poJ66bAJDx18WAtvuMCi-_fA=zBUAZAmzxP9Ke3BAzAw@mail.gmail.com>
	<BLUPR0301MB203408E90349BF451ED484B79EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=od-urxW-0nkwoxhaip_EqDMnu93v5KF5G58tcrX6G0Xw@mail.gmail.com>
In-Reply-To: <CAPokK=od-urxW-0nkwoxhaip_EqDMnu93v5KF5G58tcrX6G0Xw@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:c::761]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:7gOgODqZcuyOUmhloNJRnX6i3DdtYwCftKjIp1TgGSPpj6bO6bOInWOglIK0sNiG0rGV3I+271yOzbHHgjA5i2hXqXJeaOjQNESXwh4jIXEAivvRHgk1TJFHGr/ySCi8Ck2mqCz0/6rXo+/IGuz3vA==;
	24:JQBhhitZzyXg9IxgE9lxwDT1sRvbyahp64ZKvl44Nb77txBPc9RVQwEqkcCBGrnL7tWKgmyVToWOhE840pKgBLveaeelhaGi5IKVV6PfJ14=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-microsoft-antispam-prvs: <BLUPR0301MB20361F1060AD3A95EC2CA11E9EE80@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(520078)(8121501046)(5005006)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 0785459C39
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(97736004)(76576001)(10400500002)(5008740100001)(189998001)(5001770100001)(92566002)(50986999)(8990500004)(33656002)(102836003)(10290500002)(1096002)(5001960100002)(586003)(2950100001)(2900100001)(77096005)(81156007)(6116002)(11100500001)(19580395003)(122556002)(40100003)(5005710100001)(5004730100002)(87936001)(74316001)(5002640100001)(93886004)(106356001)(86612001)(76176999)(54356999)(86362001)(1220700001)(101416001)(10090500001)(19580405001)(99286002)(106116001)(5003600100002)(105586002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2015 19:01:17.2857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.110
Cc: =?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Stefan Weil <sw@weilnetz.de>,
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
X-TUID: Jce+AcTr2W7Z

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIDkgRGVjZW1iZXIgMjAxNSAxMDo1NQ0KPiA+IFllcywg
dGhhdCdzIHRoZSBzYW1lIGNoYW5nZSBJIG1hZGUuIElzIGl0IGdvaW5nIHRvIGJlIGFwcGxpZWQ/
DQo+ID4NCj4gDQo+IEl0IG1pc3NlZCB0aGUgYm9hdCBmb3IgMi41LCBidXQgeW91IGNvdWxkIGhl
bHAgYnkgcHV0dGluZyBhIHRlc3RlZC1ieQ0KPiBvciByZXZpZXdlZC1ieSB0byB0aGUgcGF0Y2gu
DQoNCk9rLg0KDQo+ID4gVGhlIGNvbXBsZXRlIGRpZmYgbmVlZGVkIHRvIGJvb3QgV2luZG93cyBh
cHBlYXJzIGJlbG93LiBUaGUgZmlyc3QgaHVuaw0KPiBhdm9pZHMgcmUtdHJpZ2dlcmluZyB0aGUg
aW5zZXJ0IGludGVycnVwdCBvbiBjYXJkIHJlc2V0LA0KPiANCj4gSXMgdGhpcyBhIHJ1bnRpbWUg
cmVzZXQgb3IgYW4gaW5pdGlhbCByZXNldCB0aGF0IGlzIGNhdXNpbmcgeW91IGdyaWVmPw0KPiBZ
b3UgcGF0Y2ggaXMgYWxzbyBwYXRjaGluZyB0aGUgY29udHJvbGxlciByZXNldCBzbyBpcyBpdCBt
b3JlIGEgY2FzZQ0KPiBvZiB0aGUgaW50ZXJydXB0IHRyaWdnZXIgb24gY29udHJvbGxlciByZXNl
dCB0aGF0IGlzIGNhdXNpbmcgeW91DQo+IGlzc3Vlcz8NCg0KSXQncyB0aGUgc29mdHdhcmUtaXNz
dWVkIGNvbnRyb2xsZXIgcmVzZXQuLi4gYXQgYm9hcmQgcG93ZXIgb24sIHRoZSBpbnNlcnQgaW50
ZXJydXB0IGJpdCBpcyBzZXQgKGFuZCBVRUZJIGRlcGVuZHMgb24gc2VlaW5nIGl0IHNldCksIGJ1
dCB3aGVuIHRoZSBXaW5kb3dzIGRyaXZlciBzdGFydHMsIGl0IGlzc3VlcyBhIHJlc2V0IGNvbW1h
bmQgd2hpY2ggY2xlYXJzIHRoZSBpbnRlcnJ1cHQgc3RhdHVzLiBJdCBhbHNvIGhhcyBhIGJ1ZyB3
aGljaCBsaXZlbG9ja3MgdGhlIHN5c3RlbSBpZiBhbiBpbnNlcnQgaW50ZXJydXB0IGlzIHNlZW4g
YWZ0ZXIgdGhhdCByZXNldCAod2hpY2ggbmV2ZXIgaGFwcGVucyBvbiBoYXJkd2FyZSwgb2J2aW91
c2x5KS4NCg0KQW5kcmV3DQo=
