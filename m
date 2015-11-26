Received: by 10.182.158.201 with SMTP id ww9csp856912obb;
        Thu, 26 Nov 2015 12:49:32 -0800 (PST)
X-Received: by 10.55.217.147 with SMTP id q19mr50074599qkl.109.1448570972670;
        Thu, 26 Nov 2015 12:49:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c137si27960558qhc.4.2015.11.26.12.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Nov 2015 12:49:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:53118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a23Tw-0006LJ-Dd
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 15:49:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a23Tb-00062s-33
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 15:49:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a23TX-00067s-2u
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 15:49:11 -0500
Received: from mail-bl2on0106.outbound.protection.outlook.com
	([65.55.169.106]:51520
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a23TW-00067o-Sg; Thu, 26 Nov 2015 15:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RSCSN6Lev7MA2xvA27hDc1XVKYohG1FVmaT+UvzicAM=;
	b=hv9UGoKsqS5vMjQkQnbVYNa5uaNvE2JTTd9Rc2YJPsayHT2HsnX7dvmyb2/IeFRXeSXlN5rylZbmcLa12Msdop5fvBFUKPrtDMy2llZmnuA4pT+Qh8JZxUcq8VyP3vJ1XycCwKHt0BM2hWoJYwUzGdb9tt4fKNBqg/vRbuR+GEs=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Thu, 26 Nov 2015 20:49:04 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0331.023; Thu, 26 Nov 2015 20:49:04 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
Thread-Index: AdEem9sZHjs9/bX/Q4+JMP7QmdOAYQDOg3SAABS0aqABllVcgAACX9EQ
Date: Thu, 26 Nov 2015 20:49:04 +0000
Message-ID: <BLUPR0301MB2034ED0BA94F53043E553E729E040@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
	<BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=p61hGYhB0rMxsuJdfbhB1bgciC-w0Fg=m4Bwa-J2Am9Q@mail.gmail.com>
In-Reply-To: <CAPokK=p61hGYhB0rMxsuJdfbhB1bgciC-w0Fg=m4Bwa-J2Am9Q@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [50.46.154.109]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2033;
	5:8COWlISvMzjP3YdxAuqGrwyI9T4ub3ItRfJg2dLunBrmEGzAz1i9MXK5k+X/Ettq5YXMiI/8MXoNGmV2MJeoy11lnvTfVwA2veQtn03Catmbr5S85WJPtRmxK7HfOV5xY69MMkiw36L1Kjz6TZgCpA==;
	24:paxoVXHwfADS/qPqCkj3bDumFZ5qH+E2bAzbDI10VZvb/tx0RkSziVg6RRqo/r4IbS5M5ZLbzyz4UGoU3pH2fCyY9S1OGhgSKgEgHGgemcE=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
x-microsoft-antispam-prvs: <BLUPR0301MB203372251D565519C9830D399E040@BLUPR0301MB2033.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425024)(601004)(2401047)(5005006)(8121501046)(520078)(3002001)(10201501046)(61426024)(61427024);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
x-forefront-prvs: 0772E5DAD5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(40100003)(87936001)(54356999)(122556002)(5002640100001)(76176999)(101416001)(86362001)(33656002)(3846002)(586003)(1096002)(50986999)(74316001)(19580395003)(92566002)(6116002)(102836003)(1411001)(5004730100002)(19580405001)(11100500001)(5005710100001)(10290500002)(2900100001)(5003600100002)(10090500001)(2950100001)(66066001)(77096005)(10400500002)(86612001)(8990500004)(105586002)(93886004)(230783001)(99286002)(189998001)(106356001)(5001960100002)(110136002)(1220700001)(5008740100001)(76576001)(81156007)(97736004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2015 20:49:04.3911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.106
Cc: =?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?utf-8?B?SmFuIFBldHJvdcWh?= <jan.petrous@tieto.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
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
X-TUID: Vrn836LrG7qN

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBUaHVyc2RheSwgMjYgTm92ZW1iZXIgMjAxNSAxMTozOQ0KPiBTbyBJIGFt
IGxvb2tpbmcgYXQgc29tZSByZWNlbnQgbmV3cywgYW5kIHRoZXJlIGlzIHRoZSBSUGkgWmVybyB3
aGljaCByZXVzZXMNCj4gdGhlIGJjbTI4MzUgYXMgYSBkaWZmZXJlbnQgYm9hcmQuIENhbid0IGZp
bmQgdGhlIHNjaGVtYXRpYyB5ZXQsIGJ1dCBmcm9tDQo+IHdoYXQgSSBjYW4gc2VlLCB0aGlzIGlz
IGEgcmF3IFNvQyAobm8gVVNCIGV0aGVybmV0KS4gV2l0aCB5b3VyIFNvQy9ib2FyZCBzcGxpdA0K
PiB3ZSBzaG91bGQgYmUgYWJsZSBwaWNrdXAgdGhlIFplcm8gYm9hcmQgcXVpdGUgY2hlYXBseSBh
cyBmb2xsb3cgdXAgd29yay4NCg0KWWVzLCBpbiBmYWN0IGZyb20gd2hhdCBJJ3ZlIHNlZW4gdGhl
IFBpIHplcm8gaXMgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQgdG8gb3VyIGN1cnJlbnQgZW11bGF0
aW9uIG9mIHRoZSBQaTEgLS0gd2UgZG9uJ3QgZW11bGF0ZSB0aGUgUGkncyBVU0ItRXRoZXJuZXQg
YWRhcHRlciBlaXRoZXIuDQoNCkFuZHJldw0K
