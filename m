Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp714548wrt;
        Tue, 11 Dec 2018 07:26:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WfLfqQ6KcwVbW68BIAI4qsKVnvobMUI9yyVfY4DIZN7pAgjsyWeNgtXyGg1yZjG/+2KWQ6
X-Received: by 2002:ac8:2614:: with SMTP id u20mr16811703qtu.28.1544542013396;
        Tue, 11 Dec 2018 07:26:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544542013; cv=none;
        d=google.com; s=arc-20160816;
        b=tWziO0PRTTLp0nf7+ph1qpCM50qMjGc7xcm1oLhNHuy+Vam3mCTu6rd2JH/DMmvGK2
         PQoytgBFnOI3EgcRrINVCJ08F0EE1SrlNDuFsDYKnGoNJkjqDutApOBjl0TfWMLQXEna
         Xtgfr68JTzYUfW90+jan7nMPCxxCBtldZyBAc4TtYngd0KB+c7HHsinZWz469LUMoXTi
         qthkOGms9mPwIi9Jn2suGGhI/G2ksLpDaCT6YdzAmuIT5Lev/Ug9JOR7PyHG6urvlH5b
         ydTasSOuc+C2pSeVeNYxOQFAMFTR69mDdE3YX2PdyhbHRRpS/gRh4ObxRjdnz7nZEO40
         3jrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=E3mDJz4klxTprbdEqOOdzMzRv0qGjpQpUwCpFv+THg4=;
        b=YrATddBNW9IE98Ewax6QVK9TB5IrmpfkMpYsv274xgTPE0eXV/QyBJVnCNZFNBrKvX
         u7gO34veu2EfwOhvCaGA37Ykum0/3CDR+2fPFcrUbe9U7JSmipYpvxRdIQNsnY4cYZPY
         5KAUulGWoZsmP/MrhH60ZszYNONw+BejAegg+NBliXhhA+6RzSkpDV7xqWcSetMj0SBx
         avjWGZ3qLTp/6aLuH1ip0YT0c7iT8Mtck7p9jKUVaXm13YFMElz6WF4N/R3OJej6YA1d
         qNymjef2Z9SQAr1JDd2zGHDvBEOhvKATCZtBU7DqmuwE6CyhSKrPFmVjiBiqK+TaX96W
         OfUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=iMAb54Dv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d32si511548qtd.307.2018.12.11.07.26.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:26:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=iMAb54Dv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjvw-0000RA-Qn
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:26:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpx-00042K-CU
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 10:20:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpw-0001Xp-Jh
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 10:20:41 -0500
Received: from mail-eopbgr780119.outbound.protection.outlook.com
	([40.107.78.119]:26470
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjpn-0001Re-E2; Tue, 11 Dec 2018 10:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=E3mDJz4klxTprbdEqOOdzMzRv0qGjpQpUwCpFv+THg4=;
	b=iMAb54DvUlVEWNHEB7cYUeoNtRn5372jy32Q/iZNsUOUeVy4Uc/jpnRoxKXlmpszO1Ju0hRuPFUKD/Nk84Adj9QJ1r0OD8YJPoL5CeODHYVQwXaZwQtdmYBKWhXLJ93rSTttNnRiC5B/8X7z5gEyQv5yyZ7VoNy0hKgOdqVh8mE=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4379.prod.exchangelabs.com (20.177.221.214) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.18; Tue, 11 Dec 2018 15:20:29 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:29 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 06/14] target/arm: Implement PMOVSSET
Thread-Index: AQHUkWUMd4J047cgj0e5fjUN9PtgDg==
Date: Tue, 11 Dec 2018 15:20:29 +0000
Message-ID: <20181211151945.29137-7-aaron@os.amperecomputing.com>
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181211151945.29137-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0041.namprd11.prod.outlook.com
	(2603:10b6:a03:80::18) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [65.190.6.212]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4379;
	6:NbtaALEySPjnuvvOIL/t/Cr5u91wVzz61lKKWQ/iXBVydA4aQ6jINnXUkqCeW7YNVvsZinMcbLInXhTgUTNT9wwxV5ZIkVPspACaM7jx2eDDc1PtcJvoF2c7H6/aNqNB3mmExFloFtFzB2lsUVoexyH9D0rnGvaj2SBp/BSdiQ15P2ZshjZ97uGqWNDrPV/bgKCBGGu0mkJMbRc3y8xdwxDAxVGQZ1fYs0PUko16jjOy9GpGQVkull/FRxNJtpx/DX/d1jAAwzZbv5JafBO9aKTr8Wx794phNJdNBra73cIpXOGb+kVYdlO6UuyfdckKgacoNvPSW4EBYwE3Jwz0khxmcPvVnFU9hkVjzEVfFm8og8O0iFfMfY4Xg693j5IB4DPDhXmAPWjopqX2CFUozflsRcirN04m7M0BdfINWShyJkgqRC/aYxbBmDbQCqMI4gExoYtqfMJdrp3Kmx5COA==;
	5:haeprSWYd1gwNw+2CQ8QM93QaRrHuJ+u5O/oODL/Agw3nWYm7Oj3qcdehWsIrbXbIgPZTA/k7EslISYGs6BcDj+5P16N1i2EZu5WWmcg7iSzvdbER0cbVi/X8dOzW00oU3fiXG19ZYDR5yytCKeDxUdWHz7sf1bMjICgtQDo+oE=;
	7:8Cqi14UcJl3vCMSIdA1e+Lmpm6E8myon1hgcwY9ayApzC5UnEYE5kyewgUIlAnPgzC+Z4SzxMbSRRktJpU3U6K+6b5GW72eFEJTA8VoZx9bS2AB87PHp4XkO1bHUb/jS2IgYZMDAPnj/qOPwByl2xQ==
x-ms-office365-filtering-correlation-id: 3eadcc68-bd4d-4fe4-189e-08d65f7c2ef3
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4379; 
x-ms-traffictypediagnostic: DM6PR01MB4379:
x-microsoft-antispam-prvs: <DM6PR01MB437940323703396094219D298AA60@DM6PR01MB4379.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4379; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4379; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39850400004)(396003)(346002)(376002)(189003)(199004)(4326008)(26005)(81166006)(81156014)(71200400001)(71190400001)(106356001)(6436002)(66066001)(14454004)(68736007)(3846002)(2501003)(102836004)(8936002)(6486002)(8676002)(97736004)(6116002)(186003)(446003)(99286004)(476003)(11346002)(2616005)(25786009)(7416002)(486006)(7736002)(54906003)(305945005)(39060400002)(478600001)(14444005)(256004)(52116002)(2906002)(386003)(1076002)(6506007)(105586002)(76176011)(6512007)(86362001)(53936002)(5660300001)(316002)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4379;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: ZUWg66uqsq0WeRrZfHdTQKvJ5hAdfb1t+HN7NoRTf83ZfFFmJa6UNWiI0hQK8HtytzNOXoWBIlzoDUmcC7ssOBPO+GbTS0klacKhRCyHEfY7lB+eH8f/RmkuspOH017aKM89ab8uYaNBzfBGyItA5rQ2hERkA86yPisAIYCeTqQrlmaOmTt121S4nxCjOMlyuK6jmbyaszcBkoPwMoCGa6XWAkGKbCn6pAuGMnxtz0dJ64ugOjQjawotRK2T+CP5Dph5XW/xQMRGvw8KHN7eswL2PmMgxp9FXUoBsYBoVd2l4kQGkRQDaCz+Nwkgx2nm
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eadcc68-bd4d-4fe4-189e-08d65f7c2ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:29.0583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4379
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.78.119
Subject: [Qemu-devel] [PATCH v10 06/14] target/arm: Implement PMOVSSET
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
X-TUID: 3vyoqKmz1VI7

Add an array for PMOVSSET so we only define it for v7ve+ platforms

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0aff261528..71be6fb578 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1342,6 +1342,13 @@ static void pmovsr_write(CPUARMState *env, const ARM=
CPRegInfo *ri,
     env->cp15.c9_pmovsr &=3D ~value;
 }
=20
+static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    value &=3D pmu_counter_mask(env);
+    env->cp15.c9_pmovsr |=3D value;
+}
+
 static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
@@ -1709,6 +1716,24 @@ static const ARMCPRegInfo v7mp_cp_reginfo[] =3D {
     REGINFO_SENTINEL
 };
=20
+static const ARMCPRegInfo pmovsset_cp_reginfo[] =3D {
+    /* PMOVSSET is not implemented in v7 before v7ve */
+    { .name =3D "PMOVSSET", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D =
14, .opc2 =3D 3,
+      .access =3D PL0_RW, .accessfn =3D pmreg_access,
+      .type =3D ARM_CP_ALIAS,
+      .fieldoffset =3D offsetoflow32(CPUARMState, cp15.c9_pmovsr),
+      .writefn =3D pmovsset_write,
+      .raw_writefn =3D raw_write },
+    { .name =3D "PMOVSSET_EL0", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 14, .opc2 =3D 3,
+      .access =3D PL0_RW, .accessfn =3D pmreg_access,
+      .type =3D ARM_CP_ALIAS,
+      .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmovsr),
+      .writefn =3D pmovsset_write,
+      .raw_writefn =3D raw_write },
+    REGINFO_SENTINEL
+};
+
 static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -5191,6 +5216,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         !arm_feature(env, ARM_FEATURE_PMSA)) {
         define_arm_cp_regs(cpu, v7mp_cp_reginfo);
     }
+    if (arm_feature(env, ARM_FEATURE_V7VE)) {
+        define_arm_cp_regs(cpu, pmovsset_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_V7)) {
         /* v7 performance monitor control register: same implementor
          * field as main ID register, and we implement only the cycle
--=20
2.19.2

