Received: by 10.25.208.211 with SMTP id h202csp547359lfg;
        Thu, 17 Mar 2016 09:43:31 -0700 (PDT)
X-Received: by 10.140.136.70 with SMTP id 67mr16692453qhi.46.1458233011502;
        Thu, 17 Mar 2016 09:43:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g72si8442920qkh.55.2016.03.17.09.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 09:43:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agb1H-0007fo-4f
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 12:43:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1agb1D-0007fK-4F
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 12:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1agb19-00008W-8D
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 12:43:27 -0400
Received: from mail-bl2on0144.outbound.protection.outlook.com
	([65.55.169.144]:38720
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1agb18-00007r-Ra; Thu, 17 Mar 2016 12:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=wXU1Hn/OVnI6DAhe+boIchYjNKecYOe2jqKjmimlWOo=;
	b=HOFFsUo8Kt99EEAbxRJf1GGE5tg/sua2xXlVz3WGAwqFmZjjpP3nEtIdOR4gEvtOmw2gOV1OPsYJwGFMPTDbbXdbjNt/G2pQwxl8c6ShGIr5UbFrmFdUcq3ZqjPQiCLG9K7idljjActeBaKC6RcZApD+VDu8O4xJMh6bEh0lmZg=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.443.12; Thu, 17 Mar 2016 16:43:21 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0443.013; Thu, 17 Mar 2016 16:43:21 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH] hw/arm/bcm2836: Wire up CPU timer interrupts correctly
Thread-Index: AQHRgDhsaE+rUc6eeE+T6y7/3S4fZp9d13+A
Date: Thu, 17 Mar 2016 16:43:21 +0000
Message-ID: <BLUPR0301MB20343925701441F866D315469E8B0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1458210790-6621-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1458210790-6621-1-git-send-email-peter.maydell@linaro.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:6::724]
x-ms-office365-filtering-correlation-id: 92286680-b136-40b2-70e8-08d34e834055
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:jEZoKygI0HvynAnvKMKyqxfVNFo0pL/UWsCx2/JKxsQ8Xi7SiEoxukKDR013A/MmwBwG4y6zKYaAWbj6dspboD4V3nMxRc8K40WAqxi6h2H/fEeXKNDXe2zNeLaIe5OWDB0WTLv5kQLycPlW+ql39Q==;
	24:B8v68kefSabyJb/vfNv7dRudd91qkIZj170zVy4QCsngZI+D6PiZ/4KB8M2c4gYnuiB4OidXgsLqFF11qPyJLxSTr1SHJF464r0rq2JxDv0=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB2034D5791B10A89BAE0590C49E8B0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(76576001)(2201001)(54356999)(19580395003)(87936001)(5004730100002)(50986999)(19580405001)(74316001)(10400500002)(10290500002)(92566002)(86362001)(189998001)(5005710100001)(77096005)(76176999)(586003)(122556002)(10090500001)(5001770100001)(6116002)(102836003)(99286002)(81166005)(106116001)(5008740100001)(1096002)(1220700001)(33656002)(5003600100002)(3660700001)(2906002)(2950100001)(4326007)(2900100001)(3280700002)(8990500004)(2501003)(11100500001)(5002640100001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2016 16:43:21.4520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.144
Cc: =?utf-8?B?QW50b25pbyBIdWV0ZSBKaW3DqW5leg==?= <tuxillo@quantumachine.net>,
	"patches@linaro.org" <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm2836: Wire up CPU timer interrupts
	correctly
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
X-TUID: tRK9NLxYbc20

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBUaHVyc2RheSwgMTcgTWFyY2ggMjAxNiAzOjMzIEFNDQo+IA0KPiBXaXJlIHVwIHRo
ZSBDUFUgdGltZXIgaW50ZXJydXB0cyBpbiB0aGUgcmlnaHQgb3JkZXIsIHdpdGggdGhlDQo+IG5v
bnNlY3VyZSBwaHlzaWNhbCB0aW1lciBvbiBjbnRwbnNpcnEsIHRoZSBoeXAgdGltZXIgb24gY250
aHBpcnEsDQo+IGFuZCB0aGUgc2VjdXJlIHBoeXNpY2FsIHRpbWVyIG9uIGNudHBzaXJxLiAoV2Ug
ZGlkIGdldCB0aGUNCj4gdmlydCB0aW1lciByaWdodCwgYXQgbGVhc3QuKQ0KPiANCj4gUmVwb3J0
ZWQtYnk6IEFudG9uaW8gSHVldGUgSmltw6luZXogPHR1eGlsbG9AcXVhbnR1bWFjaGluZS5uZXQ+
DQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9y
Zz4NCg0KUmV2aWV3ZWQtYnk6IEFuZHJldyBCYXVtYW5uIDxBbmRyZXcuQmF1bWFubkBtaWNyb3Nv
ZnQuY29tPg0KDQpUaGFua3MgUGV0ZXIhDQpBbmRyZXcNCg==
