Received: by 10.182.158.201 with SMTP id ww9csp296388obb;
        Thu, 3 Dec 2015 16:30:00 -0800 (PST)
X-Received: by 10.141.3.212 with SMTP id f203mr15621879qhd.98.1449189000070;
        Thu, 03 Dec 2015 16:30:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m205si2473127qhm.111.2015.12.03.16.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 16:30:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:38091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4eG7-0008LG-O3
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 19:29:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4eG5-0008Hf-K5
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 19:29:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4eG4-0000pJ-QZ
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 19:29:57 -0500
Received: from mail-bn1bn0108.outbound.protection.outlook.com
	([157.56.110.108]:20608
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a4eG0-0000oP-JG; Thu, 03 Dec 2015 19:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=oT9RELCMdR4EQXUm+nqiOVnysU926S9JICasRibgEXs=;
	b=FzYQ0GUy7ZE+ATNaAWSi7m8njL35goKi8nojNnMZINpIB3DI+qbB96Dp89Xui4SSO0jB1PXxhsZllEDaeF+XopQo1rGiV3XrjqHbvIDNZ4fE78soTP9ANbQrg3s6OWsmwglYjBGwhrGlBoidoBj/OtbtOVAsvkockwYZDxbj9Rs=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Fri, 4 Dec 2015 00:29:50 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0337.015; Fri, 4 Dec 2015 00:29:50 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH 0/8] Raspberry Pi 2 support
Thread-Index: AQHRLibp6rBylJkECk2/p7AoRwaGoJ659EmA
Date: Fri, 4 Dec 2015 00:29:50 +0000
Message-ID: <BLUPR0301MB20343E808268BBFB90EF70829E0C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
In-Reply-To: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:e::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:aOn3KJU6L49zFO/q9xyNe1E2NT7XkklkjUQr/6FYnbA3SaHlsR6yizJI8rNbNBo2u/Lb4kfy5nKSEZuliXkq6VH2M5fp7v94vOQ2NFiK9yid0IDpZS433fJvhyqs6wD5dm7LwSvSMnuX/NKcILs+tQ==;
	24:7VW7cs8K/kTFEDB+IU2qlbndeoAGqdY7X4OXe/ktCiYsYEkBhqPjKCPxTpcvxMFfMcvJJQcXdqot2gQDmLwvwDuSnawmBbrVwT1RakpqJV4=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB2034D517256F955FC71548BB9E0C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(520078)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 07807C55DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(106116001)(5008740100001)(105586002)(189998001)(74316001)(106356001)(5003600100002)(92566002)(122556002)(2501003)(2900100001)(99286002)(76576001)(2950100001)(50986999)(101416001)(5004730100002)(5002640100001)(81156007)(77096005)(11100500001)(10290500002)(10090500001)(33656002)(8990500004)(54356999)(76176999)(10400500002)(1220700001)(5005710100001)(86612001)(86362001)(2351001)(586003)(1096002)(102836003)(6116002)(87936001)(40100003)(97736004)(110136002)(5001960100002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2015 00:29:50.5163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.108
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?Gr=E9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 0/8] Raspberry Pi 2 support
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
X-TUID: igQrhkIfzHNK

> This patch series adds initial support for Raspberry Pi 2
> (bcm2836). It is heavily based on the original (out of tree) work of
> Gregory Estrade, Stefan Weil and others to support Raspberry Pi 1.

Apologies for the silence on this thread. My outbound SMTP server seems to =
be rejecting the patch emails (maybe due to an over-zealous spam filter). P=
lease hold tight while I look for a workaround... :(

Andrew
