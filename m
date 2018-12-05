Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9402591wrt;
        Wed, 5 Dec 2018 05:51:51 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wq1+DFycmorYOd8HelJfEhOFE4uZsynPHxaCCNsbIlFP5qG93rWR6XaVk7SauHHXvNFvxy
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr23931222qtk.253.1544017911513;
        Wed, 05 Dec 2018 05:51:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017911; cv=none;
        d=google.com; s=arc-20160816;
        b=oAnqhnkLGbvfU0YjaW2XcmZNPpxVWS/YtO2bQNe7J/El1S5E6lwAXmORy/zbAKdaKC
         UF4mnsLMaPMx2uo2bQ8NLfOgm2Ey0HOMZIkv6X1IlvkqRfsVB4ghKm/IzHQ1/deDzV6S
         /BU66B3ARw1hc0tXaRDeq4pqCTLNGUzxDBmiMNNpH1j8kfQcMY9m74iXpKm6ntiSNaHW
         eKtTQJE7P2Ex3C1pUWTaufkBmJPOlH2jC8OLnX8DMO0RXq1ERYYdhTpIn8A1bvmGCZRP
         fteGuqwPv/3KWq8bPshuJWMRbBJU3y9zUpYFaLlMBv2l8ExDkNmK+GJWth07TcrbvspO
         AM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=cD0dXLk6Nx3D5kve1foUdU7MZ+yNQubSqdHCEbdKesY=;
        b=a949bZnHdueokkYXJ/p3MwhdEU1iUYQkr+HeWro1/36O8CXB0+gzqQ5gORr/1TXMvZ
         IlwVPf102EVQ9P52Io6BA1CSx5BzKV7uSERGjo4JULKBC8zB5ELkKbjk2/p6z20DGz/l
         3eS4ld4GeqiZGFAT8CN9ID+BS27Tqr9aetHEnyHO6nQ2SByCR4w+zZP55SZFBWb6hMIA
         ikLIfuXRPYXbI0OIHJxOH4/X6DlqxbidXDxs8+9damu3DFP+kSIqOBSpEHob5Mcfb9BB
         RxuZ6ydHjD34xOxOrPpHYcVGM5mmKRNCuwGJ2ukFaxGffsmZVUA7l2r2InXYxEBvehPN
         oMJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=WrQ9lOZS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si1402712qvi.108.2018.12.05.05.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:51:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=WrQ9lOZS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXag-0005Ra-7L
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:51:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXTE-0008A7-Ux
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 08:44:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXTD-0005eZ-NS
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 08:44:08 -0500
Received: from mail-co1nam04on0716.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::716]:64512
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXT8-0005F5-7m; Wed, 05 Dec 2018 08:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cD0dXLk6Nx3D5kve1foUdU7MZ+yNQubSqdHCEbdKesY=;
	b=WrQ9lOZSnAlfkwkgGORTU9RkSYZ9mwaU/RRbwOPanv6oC5/xGYXIm6XkGPolAu1Atcg/BICKLjHp6h6uEH6RHQfarD6deVliSkHVNQthglCdVA6VTgjAWwd0HcZx8vrPpWN2EHpkyOVPY+iNw83xLJvoT9/vepFKRlOnanfrD8M=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4204.prod.exchangelabs.com (20.176.106.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 5 Dec 2018 13:43:48 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:48 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 12/14] target/arm: PMU: Set PMCR.N to 4
Thread-Index: AQHUjKCAKJwfbGi/q0KMNC79KyPw0A==
Date: Wed, 5 Dec 2018 13:43:27 +0000
Message-ID: <20181205134243.4791-13-aaron@os.amperecomputing.com>
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181205134243.4791-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR12CA0032.namprd12.prod.outlook.com
	(2603:10b6:405:70::18) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4204;
	6:DtYAhePYfYMIdir+uBpIGCoSY2LWybh/Z+tq4tJQ5sKao/TPttdRs6ZYkPlndRfnXa41R+MS/Hb2H5Mzyjz6LY5zlmzuxeHyZfkHYRmbJnRGtuoRkXyihwneZRW+CKoiBB75qxDRnU68gjGk0srjuIfwQmpNdMRqssSbEfP4Axhh8rXtCM89RqBwD6jSAbF+Z4+E34UAtV+grrA1WbpJGNLWXTDeWsGfB6DrigXya1ljF9YY5BClcIGFAzTiTEnXHJwyxEyTnUDhjvSPP9mS2PDOF+nuFycWMh2zo15Z96dbL/Zj7O3J2ptOqB1QXdNwnfU6c0G7NDULVnrhWFg/G844aIwyW6Tloa3qz7cv3gjNzcB9vcAxsD1WAnBu2wmJdMP9OdyrxQKNuhdCfkeiJJtQ7Py/+HeQJ5WtuVCE8KzBygWCX/IWpdKF8vr56XdcRZmCcLJtCxMY71Veli1h5A==;
	5:bgJ5etwFnQgPqfckrdEM2EvmQ1XR1scWmInOna5dxR5tS8BFCqPFKy71yBUxJOjW1gF70W2JCvlFvC0b1JI0oojEMIhPakXNMd4dYR4oXTgipds9WlzZ8xGTakB7iFsLzTzMgo7y38TxORz2QuT0L7eZO5x8qG08PaSI6tzHezs=;
	7:o1EsIguKdpuwEdl8gN1m0s7Inija3DG2F3ga6zSHgoo7Wev1/ZJ15bpNdgCvNR/E4/MskBA/n4eqQPwPANzjn6B9wmfokNX7lE8Jl/jfVOo26ZAOOMJW7Hmkq33XAiLHoD2Ea9JjPRBEAEAiYaFlPw==
x-ms-office365-filtering-correlation-id: 7b606cd8-61b5-48d1-dc36-08d65ab7a29f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4204; 
x-ms-traffictypediagnostic: DM6PR01MB4204:
x-microsoft-antispam-prvs: <DM6PR01MB4204622081900152A3E103AE8AA80@DM6PR01MB4204.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4204; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4204; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(106356001)(54906003)(110136005)(6436002)(4326008)(68736007)(7416002)(14454004)(14444005)(256004)(316002)(97736004)(6666004)(105586002)(2906002)(8936002)(486006)(1076002)(53936002)(6116002)(3846002)(8676002)(446003)(11346002)(2616005)(81166006)(86362001)(5660300001)(81156014)(6506007)(25786009)(386003)(476003)(71200400001)(26005)(478600001)(76176011)(102836004)(71190400001)(99286004)(52116002)(6486002)(7736002)(305945005)(66066001)(39060400002)(2501003)(6512007)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4204;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 0OgwITlHhBT1IgzNEfDW+3efuIAyxeOhDZTMd/S/osnqgS0Xt6vvdfqHlA6Jh3+GaRbuEJAWSuSBt3bJquItpCM3SiUeVw05nyHIRFlsRCYOG3yJgFY4w8DigCyI7EVqMmkC1/8z8A5EJyJqr75yibsyAHSlIZcMPpv8OTi9jYQXT7v6QebfCIJjMoEgIaRogaUR2X3gWTczrVxHkPfXKlpzeb2Iry8diY+IuU558/gcpx8hJiHsW/duJ2tUJO/UTtmJ9p2DsJX1/TfW6cpTjuDakvUQ42Pn2fiDIA/MPpEZQk2ksG9qa6wsOyWDNdfpsRvqvgNRM+oDX5nKelukyNFPaNdHeXPSIJ3tbUrHZQY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b606cd8-61b5-48d1-dc36-08d65ab7a29f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:27.8248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4204
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::716
Subject: [Qemu-devel] [PATCH v9 12/14] target/arm: PMU: Set PMCR.N to 4
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EdnBqGsdV0eM

This both advertises that we support four counters and enables them
because the pmu_num_counters() reads this value from PMCR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a45ab5d9da..724c2f1d69 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1768,7 +1768,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .access =3D PL1_W, .type =3D ARM_CP_NOP },
     /* Performance monitors are implementation defined in v7,
      * but with an ARM recommended set of registers, which we
-     * follow (although we don't actually implement any counters)
+     * follow.
      *
      * Performance registers fall into three categories:
      *  (a) always UNDEF in PL0, RW in PL1 (PMINTENSET, PMINTENCLR)
@@ -5502,10 +5502,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
     if (arm_feature(env, ARM_FEATURE_V7)) {
         /* v7 performance monitor control register: same implementor
-         * field as main ID register, and we implement only the cycle
-         * count register.
+         * field as main ID register, and we implement four counters in
+         * addition to the cycle count register.
          */
-        unsigned int i, pmcrn =3D 0;
+        unsigned int i, pmcrn =3D 4;
         ARMCPRegInfo pmcr =3D {
             .name =3D "PMCR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =
=3D 0, .opc2 =3D 0,
             .access =3D PL0_RW,
@@ -5520,7 +5520,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .access =3D PL0_RW, .accessfn =3D pmreg_access,
             .type =3D ARM_CP_IO,
             .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmcr),
-            .resetvalue =3D cpu->midr & 0xff000000,
+            .resetvalue =3D (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHI=
FT),
             .writefn =3D pmcr_write, .raw_writefn =3D raw_write,
         };
         define_one_arm_cp_reg(cpu, &pmcr);
--=20
2.19.1

