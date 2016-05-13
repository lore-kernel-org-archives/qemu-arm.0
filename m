Received: by 10.25.208.137 with SMTP id h131csp258162lfg;
        Fri, 13 May 2016 09:41:52 -0700 (PDT)
X-Received: by 10.140.239.137 with SMTP id k131mr17451313qhc.11.1463157712259;
        Fri, 13 May 2016 09:41:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w21si6730124qkb.113.2016.05.13.09.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 09:41:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:35265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1G9v-0005IM-Oe
	for alex.bennee@linaro.org; Fri, 13 May 2016 12:41:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1b1G9K-0004bM-9v
	for qemu-devel@nongnu.org; Fri, 13 May 2016 12:41:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1b1G9I-0008HB-Py
	for qemu-devel@nongnu.org; Fri, 13 May 2016 12:41:13 -0400
Received: from mail-bl2on0111.outbound.protection.outlook.com
	([65.55.169.111]:18064
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1b1G9D-0008Fp-1w; Fri, 13 May 2016 12:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/PWf1WRkqt8vqETlQ9nWyTz+8nBwyemelkP2PXfQ6ZU=;
	b=nFF2DASHymGi1iAmUuNPkQjV6m2ob4XBzhzDdxbmDWsGVhnFwVnEEYg4+lostuAbfK4Woqwu2kAXaOC9BZ+ieDnOHRyuCZt0EkIzknfBJZjzxV8eYd7boIGYNQKUxloZ1hnf5fDISoQ5SWGJKXEz89JgXAaqCheiwLlL2R9glxQ=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Fri, 13 May 2016 16:41:04 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0492.019; Fri, 13 May 2016 16:41:04 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: Shouldn't cortex-a15 enable ARM_FEATURE_EL2?
Thread-Index: AdGtM5hhHKTDP39VRCm+lEhZVDkFVA==
Date: Fri, 13 May 2016 16:41:04 +0000
Message-ID: <BLUPR0301MB203455969C9F25DB4CCD43849E740@BLUPR0301MB2034.namprd03.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:5::3ea]
x-ms-office365-filtering-correlation-id: 69a8a979-b513-45c9-6ce9-08d37b4d6018
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:p+suN0FtDAQQZSMbxcFpYT9kSAJDPK+DWqQgCN1xGpBWFxSixTjlNY23pHlj5J1Q1KUX+vek+Cuu4MPoMAKNcDag6k4pFkHAfq1uSjhqy7vJUHMrUDj2JbeQ5LnL7epxksy62HTqzKfiobmQ01ansA==;
	24:kCLtCFxrAxPuVX2K+AatAsfF4MPtXKEeiOIX/QJbfdKwUpmqcvQdkFu23fY9KYZ0LGANyRrOasdaB+zW7xTwiI3QylA2e65pe+3gfAKw4mQ=;
	7:Ut3ueDOO5xfB1sPZ2fH5moiyKMO68VdUTxHeLTtgv5jvI0y2Pp6XEL0udp2hnFUaEx4l1BeBV2ACf/enhgzAkso4XF+YBe7soHCbkJKKNhhFe04ONkGyAgHI3SDy+1T9zRZI9E2bcwyRhG40W3Ui9CcJIw6WEBhuyvUTH1I3SR24ABasKo7Csen8tCzQUwSis0pHuV55mMLyy1t5qNNIZw==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-microsoft-antispam-prvs: <BLUPR0301MB2036ADA58FC646D55D4D0E909E740@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026)(61426038)(61427038);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 0941B96580
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(2906002)(86612001)(76576001)(229853001)(77096005)(586003)(5003600100002)(3660700001)(1220700001)(10090500001)(11100500001)(110136002)(189998001)(6116002)(102836003)(99286002)(122556002)(5005710100001)(10290500002)(575784001)(86362001)(2900100001)(5004730100002)(8936002)(33656002)(5002640100001)(50986999)(92566002)(4326007)(81166006)(8676002)(5008740100001)(54356999)(3280700002)(9686002)(87936001)(74316001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2016 16:41:04.2877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.111
Subject: [Qemu-devel] Shouldn't cortex-a15 enable ARM_FEATURE_EL2?
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qnDO1KpIbKRC

Hi Peter,

I'm trying to use the MRS/MSR banked register instructions you recently imp=
lemented, but found that they raised an undefined instruction exception on =
the cortex-a15 CPU model. This seems to be caused by the check in msr_banke=
d_access_decode(), which looks for ARM_FEATURE_V8 or ARM_FEATURE_EL2.

The quick kludge below worked for me, but I don't have high confidence in i=
ts correctness -- the CPU supports the virtualisation extensions, but I've =
no idea whether the rest of qemu is consistent with enabling that feature. =
I guess you have a better idea?

--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1132,6 +1132,7 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_LPAE);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A15;
     cpu->midr =3D 0x412fc0f1;

Cheers,
Andrew
