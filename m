Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1070027wrt;
        Tue, 20 Nov 2018 13:32:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XNsL+DqvyBZfht+aOls7JkCGuADpXRazbC0m9qvfwf0I71rvwU4HwO6+4mM94UYHvdG8v4
X-Received: by 2002:a25:3f03:: with SMTP id m3-v6mr3647755yba.442.1542749532054;
        Tue, 20 Nov 2018 13:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749532; cv=none;
        d=google.com; s=arc-20160816;
        b=WaJQn5F4zRZQ/N2uKcRWrE4dxNIdMBy4x8XN9a0vYCpX6R9b7e/soGMbib2kcEFTzO
         iTv8ZObswQp05lN5jfCams2AZiRZws2QMxvG62FWOWU5m5XkROFAraV+eptfD6biHSiC
         t9wDFBq+7TJKH6/c6oB868CDnNtqlpZMj69XkFFGOzbSopghFS7QFDb2W+83ivwQi81p
         uESijQK0Y56G7XfjilLKT1a9rZ9wdxXn7z3oTaB8WpBST8nVpVJ/0+633AyWFlYAzL2D
         fSyRdEUkaGHQPngcHP2SVKZRW4tthl5vYwx6NEpwh+AgDmiEZEsfEK7sadt0vmjY02H0
         Q2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=cpz5MXcggalYbvUtg4QWUIgFz3W1WXdHXinXU8bSmc0=;
        b=ZqYH2O65fexLztmSzetuB/hau645aU1s3hYvXAi3dH/HVnjf4RQPJLZajDZY0gXFrV
         BrT2l9Z2sfmH756VBWqoh3/gqDtToh1ZSwawU5enMWswgRNVlmn5Y8K4Ogs6oVMd5L2J
         nG1iq3GH95wOFmc8yvzZEOyDPtdrrJVncj840kWmKEgAyGMi54akR/5XPV9xKMG1HxoC
         jVtIGV/XW4OwMH9aXIVpHffnrJm4P3eceW1Q91443RponXd3A12lTqL5N35whMfn3RPw
         DZ2JEqY5zPE7fp+3B5/Nlp9ZN7+teuNMf5I8gx67yhHRwiPyrNkYFDFO3IP7EXATM3lJ
         RhvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=i4rT3gSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x67si16392714ywd.103.2018.11.20.13.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=i4rT3gSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDcx-00052O-Ce
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:32:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXq-0000CY-4j
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXm-0005sU-Ru
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:53 -0500
Received: from mail-eopbgr760129.outbound.protection.outlook.com
	([40.107.76.129]:22624
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXm-0005lc-49; Tue, 20 Nov 2018 16:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cpz5MXcggalYbvUtg4QWUIgFz3W1WXdHXinXU8bSmc0=;
	b=i4rT3gSjk+d1QJ27y1lrx9RUYFBTe2GfLflEIR4TRgFPoca1gCSlikbrqg6o0NzJxd1sI5NCCZWuSfmYWRno1Gv9ouRKUhgS8nNJLfl7y7h2wJLU1tw5yCZSJ80b2VEsOj1aDBP/VhJpLyLWYW5zOm+SyXje+dpKZCKykC2eZDk=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4651.prod.exchangelabs.com (20.177.216.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:47 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:47 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 12/13] target/arm: Implement PMSWINC
Thread-Index: AQHUgRe+CP0PVOSvMkm6koUnLdVtnQ==
Date: Tue, 20 Nov 2018 21:26:47 +0000
Message-ID: <20181120212553.8480-13-aaron@os.amperecomputing.com>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181120212553.8480-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR04CA0037.namprd04.prod.outlook.com
	(2603:10b6:903:c6::23) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4651;
	6:uHH4Q++qU82Q4Drjn/FLo3PtixQZd2XjKS61a0Fba9maBkAbjwTdaOBU8b9Dwexgf0WLyfV3VPjVHxgqGnn5pKEA0t3NllELaOq9PLE7ISzGKB2IP1Qa0Pk4sjZriHpyvxynmu7byiGEnQgiHGfVrr/quFrDR1Cdq4QlJAZrOnckQUpzc3JcrkqtZqBrE2Y6EYU+//HtxhVC/TqXveKRAvceCe48+uCPwvgDEQTwFH7nSEdhCriGGx4kkI4zLOVRK+USgV6vIO8ixKesFGdSJ1L5LmD+y9saS9DDRjxX6WwF0YMzTxAaabqHklX38lE4aTjr5Ez0aeWk8K0aNfGpc8xTTVf3EwRsBJzIdggkgomCiOqUHEZuh6CuR9m/Nvou2dCjyoQFiZoEh653QCW6/Fw5PQo/fQe27+ckbjGSAiMf5IzN/lvx0JgXZ5tzXeOY9acAJhMfVAi0QnVgV2V2wA==;
	5:M6jS8QNfa7z7Z72PGBtoMwIkfAAKwSq6Aubw374s6GnZDCBN1x2KS+VstQx/J8Wl7lZQWlfaEklekLJqc8E/oaLrmxywAcxB2VPpqOpEzJyP9oRpeU3E48+DvNoVfFp7DeHYcQbZMgx6JDnrOvNRess5rTuwVoD74ZmAFPK4M80=;
	7:E3tCkKV1Fw4gcizKTWvwG11QkQzbd/wvmIk6Wj7pIe7GxN77IHPJzhTsopQEE3cK6jQTeBc2Y7CrP3735yPtN/6Jbs6I2Is1l4nX8bRsGf2raY5cKdtyDkIPgLuUFMSOKwF/ivmtEB1YExrivT4r3w==
x-ms-office365-filtering-correlation-id: 6ec550a1-4d97-4418-ef02-08d64f2ee09b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4651; 
x-ms-traffictypediagnostic: DM6PR01MB4651:
x-microsoft-antispam-prvs: <DM6PR01MB46517EB04DED009E0DF435608AD90@DM6PR01MB4651.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231442)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4651; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4651; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(136003)(366004)(396003)(39840400004)(189003)(199004)(476003)(305945005)(39060400002)(71200400001)(7736002)(71190400001)(4326008)(2906002)(3846002)(14444005)(6116002)(6436002)(1076002)(7416002)(14454004)(256004)(316002)(2616005)(5660300001)(486006)(11346002)(6512007)(53936002)(86362001)(446003)(110136005)(54906003)(6486002)(186003)(478600001)(2501003)(66066001)(26005)(102836004)(97736004)(99286004)(25786009)(81166006)(68736007)(105586002)(6506007)(8936002)(386003)(81156014)(52116002)(76176011)(106356001)(2900100001)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4651;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: W8IocTXLbkNwvoQU2mHZwg1dfbQmsrDp0ARMy1I0s0nCrRMHqXb7hUea0SS49+ik1VDSWNN7bTp5VTt71eyU7Wzgj61xIdM0JtgutzMdqVc58rItWP1JewIkFA2uncgAaBWLF45LMKKe7e23IPrHrfx9p+7awMwzajhTtoEMF92/YxX7DWTlyv1l1d4DDWKfndKMYX7s3GsOYcs2C95wmt06NkerrR+fO6mHFu+qRAC/p1O+lgqoQo0XTr/o/hUe08LqatDhj4ivLHBzojt2eAchR62Ier5OXTZItEzQhUA0HuByBkFM5Iez1dF63mnswlZwv1wnQv3vEpKPlY6wGnTGeVRZO/EAwjWWsAH3ntY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec550a1-4d97-4418-ef02-08d64f2ee09b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:47.6940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4651
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.76.129
Subject: [Qemu-arm] [PATCH v8 12/13] target/arm: Implement PMSWINC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Aaron Lindsay <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rW+vTt0aP2b8

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b8462d429a..99bce8a526 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1027,6 +1027,15 @@ static bool event_always_supported(CPUARMState *env)
     return true;
 }
=20
+static uint64_t swinc_get_count(CPUARMState *env)
+{
+    /*
+     * SW_INCR events are written directly to the pmevcntr's by writes to
+     * PMSWINC, so there is no underlying count maintained by the PMU itse=
lf
+     */
+    return 0;
+}
+
 /*
  * Return the underlying cycle count for the PMU cycle counters. If we're =
in
  * usermode, simply return 0.
@@ -1054,6 +1063,10 @@ static uint64_t instructions_get_count(CPUARMState *=
env)
 #endif
=20
 static const pm_event pm_events[] =3D {
+    { .number =3D 0x000, /* SW_INCR */
+      .supported =3D event_always_supported,
+      .get_count =3D swinc_get_count,
+    },
 #ifndef CONFIG_USER_ONLY
     { .number =3D 0x008, /* INST_RETIRED, Instruction architecturally exec=
uted */
       .supported =3D instructions_supported,
@@ -1393,6 +1406,24 @@ static void pmcr_write(CPUARMState *env, const ARMCP=
RegInfo *ri,
     pmu_op_finish(env);
 }
=20
+static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    unsigned int i;
+    for (i =3D 0; i < pmu_num_counters(env); i++) {
+        /* Increment a counter's count iff: */
+        if ((value & (1 << i)) && /* counter's bit is set */
+                /* counter is enabled and not filtered */
+                pmu_counter_enabled(env, i) &&
+                /* counter is SW_INCR */
+                (env->cp15.c14_pmevtyper[i] & PMXEVTYPER_EVTCOUNT) =3D=3D =
0x0) {
+            pmevcntr_op_start(env, i);
+            env->cp15.c14_pmevcntr[i]++;
+            pmevcntr_op_finish(env, i);
+        }
+    }
+}
+
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     uint64_t ret;
@@ -1813,9 +1844,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn =3D pmovsr_write,
       .raw_writefn =3D raw_write },
-    /* Unimplemented so WI. */
     { .name =3D "PMSWINC", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D =
0, .opc2 =3D 4,
-      .access =3D PL0_W, .accessfn =3D pmreg_access_swinc, .type =3D ARM_C=
P_NOP },
+      .access =3D PL0_W, .accessfn =3D pmreg_access_swinc, .type =3D ARM_C=
P_NO_RAW,
+      .writefn =3D pmswinc_write },
+    { .name =3D "PMSWINC_EL0", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2 =3D 4,
+      .access =3D PL0_W, .accessfn =3D pmreg_access_swinc, .type =3D ARM_C=
P_NO_RAW,
+      .writefn =3D pmswinc_write },
     { .name =3D "PMSELR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D 0=
, .opc2 =3D 5,
       .access =3D PL0_RW, .type =3D ARM_CP_ALIAS,
       .fieldoffset =3D offsetoflow32(CPUARMState, cp15.c9_pmselr),
--=20
2.19.1

