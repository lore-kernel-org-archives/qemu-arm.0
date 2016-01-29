Received: by 10.25.159.19 with SMTP id i19csp1181813lfe;
        Fri, 29 Jan 2016 13:50:41 -0800 (PST)
X-Received: by 10.141.2.68 with SMTP id e65mr14541587qhd.64.1454104241846;
        Fri, 29 Jan 2016 13:50:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7si15893863qhc.107.2016.01.29.13.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 13:50:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPGwD-00061l-Eu
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 16:50:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPGwB-0005zk-DI
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 16:50:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPGwA-00040q-GN
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 16:50:39 -0500
Received: from mail-by2on0140.outbound.protection.outlook.com
	([207.46.100.140]:16146
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPGw5-0003xz-5D; Fri, 29 Jan 2016 16:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jL+7hPBCMhppBvM3wtD7uYicOBhimDTkRjsjMdfV59s=;
	b=CW57WoIVw86ZE9jlpZn6945xN/MU0Xf0rVhl5ykhY/aOFalXrgdIh0uojCTYbZdhanPeUWhsqmn0dKOhvBIwo0F6tzaITyGaAXWumKIy0LGCbqQeHbyJ+sadzvG4YSQPIDYk6M2Kq4N5ITHc2DRDJ2c0OGuYDAnGYWgNd0AVdPg=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 21:50:29 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0390.017; Fri, 29 Jan 2016 21:50:29 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v4 8/8] raspi: add raspberry pi 2 machine
Thread-Index: AQHRT/DG10Xdqk9Vq0G0qXu0O32qRp8SLiwAgADtG8A=
Date: Fri, 29 Jan 2016 21:50:28 +0000
Message-ID: <BLUPR0301MB2034170EF1FBCB3856E044FB9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-9-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=ory3pnNPsBgde12BqGGW_L3QOG0OVdtLNJomK0QhxxYQ@mail.gmail.com>
In-Reply-To: <CAPokK=ory3pnNPsBgde12BqGGW_L3QOG0OVdtLNJomK0QhxxYQ@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:2::2e3]
x-ms-office365-filtering-correlation-id: 582a1f11-3695-4239-0475-08d328f63486
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:cgoLUX/fDto4efrox6W2X88kIAEzZw2viKH0dqj8lP5ZS4ljeI1xiYCIGfC5aDGROAgLQLje04He3hcK0sx43be4Mc0n6O/btvECFdoHoT5CDh8zQuuhBayrNWTVwET0enoWYPXrn8c75wVshtCxSQ==;
	24:NJaP7zkFzj19ag766Y70L49eZB8UEKu69yzhcIPsyKAjEjfeCN8lalOdosEzhdvDa/gFFzCMMIJiChRY4ATg5XH3ejK7iScCbBHbIU30BA4=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-microsoft-antispam-prvs: <BLUPR0301MB2036990E4D85D6FA7943E6309EDB0@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 083691450C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(377454003)(24454002)(33656002)(4326007)(87936001)(74316001)(5008740100001)(5002640100001)(3660700001)(10290500002)(92566002)(19580395003)(77096005)(2906002)(19580405001)(10400500002)(11100500001)(10090500001)(5004730100002)(8990500004)(5005710100001)(106116001)(122556002)(3470700001)(110136002)(40100003)(1411001)(5001960100002)(3280700002)(2950100001)(1096002)(1220700001)(99286002)(102836003)(6116002)(76576001)(5003600100002)(586003)(2900100001)(86612001)(189998001)(86362001)(54356999)(76176999)(50986999)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2016 21:50:28.2322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.140
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 8/8] raspi: add raspberry pi 2 machine
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
X-TUID: E9UurwbHM+Qz

SGkgUGV0ZXIsDQoNClRoYW5rcyBmb3IgYWxsIHRoZSByZXZpZXdzLiBJIHNob3VsZCBoYXZlIGEg
cmVzcHVuIHZlcnNpb24gb24gdGhlIGxpc3Qgc2hvcnRseS4gVGhlcmUncyBvbmUgbWlub3IgY2hh
bmdlIHRvIHRoaXMgbGFzdCBwYXRjaDoNCg0KPiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFp
bHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwuY29tXQ0KPiBTZW50OiBUaHVyc2RheSwgMjggSmFu
dWFyeSAyMDE2IDIzOjMxDQo+ID4gT24gRnJpLCBKYW4gMTUsIDIwMTYgYXQgMzo1OCBQTSwgQW5k
cmV3IEJhdW1hbm4gPEFuZHJldy5CYXVtYW5uQG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KIFsuLi5d
DQo+ID4gK3R5cGVkZWYgc3RydWN0IFJhc3BpU3RhdGUgew0KPiANCj4gQSBxdWljayBnb29nbGUg
c2VhcmNoLCBJIHNlZSB0aGUgY2FtZWwgY2FzZSBmb3JtIGZvciBycGkgaXMgdXN1YWxseQ0KPiAi
UmFzUGkiLiBTaG91bGQgd2UgZm9sbG93Pw0KDQpPay4NCg0KPiA+ICsgICAgdW5pb24gew0KPiAN
Cj4gdW5pb24gbm90IG5lZWRlZC4NCg0KSSBrbm93IGl0J3Mgbm90IG5lZWRlZCBub3csIGJ1dCBp
dCB3aWxsIGJlIGFzIHNvb24gYXMgd2UgYWRkIHBpMSwgd2hpY2ggSSBob3BlIHRvIGFkZHJlc3Mg
aW4gdGhlIG5leHQgcGF0Y2ggc2VyaWVzLiBJdCB3aWxsIG1ha2UgdGhhdCBkaWZmIGNsZWFuZXIg
aWYgd2Uga2VlcCB0aGlzIGhlcmUgbm93LCBzbyBJJ20gZ29pbmcgdG8gbGVhdmUgaXQgYXMtaXMu
IEkgaG9wZSB0aGF0J3Mgb2sgd2l0aCB5b3UuDQoNClRoYW5rcywNCkFuZHJldw0K
