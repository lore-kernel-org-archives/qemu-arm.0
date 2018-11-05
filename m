Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2954375wro;
        Mon, 5 Nov 2018 11:03:34 -0800 (PST)
X-Google-Smtp-Source: AJdET5cdyBSZ0YByDLa1x0G8F75jG21r4m83cv7oR3LC2QKleXtr3RTvzdKMusYbKwbBRobIzaec
X-Received: by 2002:a37:a614:: with SMTP id p20mr21306815qke.266.1541444613997;
        Mon, 05 Nov 2018 11:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541444613; cv=none;
        d=google.com; s=arc-20160816;
        b=pNleroMuunqQwzbwhPvFeZYmoSRC8FIgoi+py0S4yFtHofepNYJp/IyfNZjsoctBvx
         V/WDrzK5WKsRXQ7z8CGAXUpFvE8Y+ljTLRIK5p4Cm8KKmSABohWn9Hmv9+yKug7dW3zi
         Ho6cy9ox4WBCBCCvsXXKEX9I68aB/Nzz5qHh+FaIodFhiagSPKcuaI8jUrm1nEzPRKBa
         /B2vqN8wrkzs+JkK+1LXBo3LHlLOaorSAfcMdBLNK2gN+X8IhQZf+KL4leWOQhUmocjN
         RcXcZDwI88igoihEzp/aJWCGmHU0eHKrcXpTxPC0FZ3nbAUpDX5sxqLyJbd/KK0PogGH
         yGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=63+xw/snbdhXxz2vaAWq6N4vc16BfG5qpDn4AjyIE+Q=;
        b=p6Md7rEkvh03HgZTc5AbPrvVdB2qzL4GGtdjuivag92qBDBXTLrCg3Hbl4QkatTAyT
         zZX7f9NMuKTMeH7oVZJNTZBj+18mmi/yW8r8tuIl1ffihKrhjtyGlZsHEmGYPipOugNU
         Wdvps8olYFDuu13saxAG3ZPvaWk2xfnFVGEPJdKwPjbyn+waL5iGq1xp62jAhvlElqho
         DwfdAtqGtGDkrvwNeCSaASwq6MWRxygYVPZSDUKPLfDk1dOrNf2f+gL9U5+0o0/UYHOT
         rr4fiySh5IIrZrNTp+I9ZaFpwJlcxmfpFBZ2hQ/WmApURgWaj2nvRV+TtGOFjS1U1PXJ
         /kow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=ktcOP0SC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19si5073842qvd.218.2018.11.05.11.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 11:03:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=ktcOP0SC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJk9t-0001wh-ET
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 14:03:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjzP-0005OR-Ie
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjzO-0001B4-3a
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:43 -0500
Received: from mail-cys01nam02on0099.outbound.protection.outlook.com
	([104.47.37.99]:43926
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjzK-0000UT-Jl; Mon, 05 Nov 2018 13:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=63+xw/snbdhXxz2vaAWq6N4vc16BfG5qpDn4AjyIE+Q=;
	b=ktcOP0SC+xNC1Tce8zQCp1qFam9QBrzz+KvP1MGHaL5GDhGjRNAFwRs5f0QBpLvj9s1qQu6kP/XbsmOVaioG44WAuLZc8R58JGU0JK+A3CT9X4KptapMZjA+OG9AFAXY22VSdzza7MClz2PLDd4Po+l+Jz2GyzP7yyw3Toqf2Bg=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5194.prod.exchangelabs.com (20.176.122.31) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.21; Mon, 5 Nov 2018 18:52:02 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:52:02 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 11/12] target/arm: Implement PMSWINC
Thread-Index: AQHUdTij5yn19ob2O0CQknFPPUTjTA==
Date: Mon, 5 Nov 2018 18:52:02 +0000
Message-ID: <20181105185046.2802-12-aaron@os.amperecomputing.com>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181105185046.2802-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR20CA0070.namprd20.prod.outlook.com
	(2603:10b6:404:151::32) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5194;
	6:KdSKMYHnJgWxTgP6V7Zct5DTQxKix/exDEbXkiLGNhrPtIniPYHrXYvbmzTu87lymkzZikKmJZtr+BysgRojR89aAi8imRRx93pY7twHxSPtgMPvmw0TBdvgnOSj9AEAjhanJYAqlgpLpkDGNiCDUEjmeqzGzB5mCnhat3IqgaQlKntzggGR+oLI2wIUPs3mrMCjkkIvsoOoVszjL3z9yhazml5AqBc6VHc057ID95QFZ+qUpCNLzEHU5ULLgUyHKFf4/XYwQAFaDs8c94VszexczwZVAults+ZPEg9QNVd/VPmb9FtVNZ6NoeMNHP5zjUSulVDrttS0j6IB43WTgkRskA810ke2a6wKgBlgHbI+qSnpSnJwiJ0nDLxTg/Fl+0rWeHZdQF92e4yFZny+kF2Cmxe6IAg1Tw8t4Ao9OQ5ysTNEk38Ctr1fZk+jgP2NP5A0gS7jpg09qszFEh4abQ==;
	5:IBum3DAft8CnHifGMGwzenVco7SW2TlTk5Ry7c/fBsghM7a2T8LrNylIt8GhD5eqWuodYrgmWtEe7wEE1f3lVziN96T1Mfe0WxD1S75fc6SyymPu2uq7xyEnto8Zcxc2sKNlVB3zW1zdbsS7pb79rDWjrJ1y6nNg2uSUCLNIuME=;
	7:3qDsf5qjukDsWbm+NGypcxTOXSmh3uoYKw8kv09lZMFBlRIIdnLuAjB9mG4ccpyiqmPT7gAVOi526oseiLYSndopZJ0ymCs8sP6jYGxOkX6iTB8zWmeNGlFzR6JLi5UJEPstm8VAK0nRvDDWPSAooQ==
x-ms-office365-filtering-correlation-id: 2d0ae81b-1f10-4a4a-a147-08d6434fc5ec
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5194; 
x-ms-traffictypediagnostic: DM6PR01MB5194:
x-microsoft-antispam-prvs: <DM6PR01MB5194161C28187DE4D8501F298ACA0@DM6PR01MB5194.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5194; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5194; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(136003)(39840400004)(376002)(366004)(189003)(199004)(81166006)(81156014)(53936002)(66066001)(6436002)(486006)(6486002)(6116002)(14444005)(110136005)(256004)(25786009)(4326008)(54906003)(14454004)(7736002)(305945005)(106356001)(26005)(105586002)(186003)(97736004)(39060400002)(102836004)(8936002)(2900100001)(2501003)(386003)(6506007)(8676002)(7416002)(476003)(316002)(52116002)(6512007)(2616005)(99286004)(76176011)(5660300001)(2906002)(86362001)(68736007)(71200400001)(71190400001)(3846002)(478600001)(446003)(1076002)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5194;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: TgyVnWujVZcPKCsGMMGllH5xG232F4CUhSzdCsg12dPHTyDjXx12/7bH++DYqm6Ol/J39MfcmXetEHtGzvL10wNVvFmDVR47QV6yZXAba1OSZZRpyYg3hWVYsUY8uruGCw6LDGkHezf8bCqhUXtC+qOYOiZ74evb822NBt7yHPs/76ptSmfKSKtmEojAlXW/AbJhmu52NuyK7eqRTGN0iqLFxJUw5EbfHUBpuiNaeobbMIyIryn7eUJoaYyCqCvzJ30ku93iRmmCj37gD9HDu1FziCzInK3MG9m7SPdRlSM8V+/RQ080VtZR90bj3aQ1QqGiQWz1YJCHMXisPVu2BIVIqWA4VVc7odtrXewop5k=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0ae81b-1f10-4a4a-a147-08d6434fc5ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:52:02.3852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5194
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.99
Subject: [Qemu-arm] [PATCH v7 11/12] target/arm: Implement PMSWINC
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
X-TUID: WkwbyyIau7gW

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 11eb62bdda..cff3a5a562 100644
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
@@ -1378,6 +1391,24 @@ static void pmcr_write(CPUARMState *env, const ARMCP=
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
@@ -1798,9 +1829,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
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

