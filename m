Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9397390wrt;
        Wed, 5 Dec 2018 05:46:33 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UqdwWNboCbNms8ll+oSTSgnZ7fpa/BI52BnkTtkWshVOX9oZuW2/Kl6NfyL7SigJt4IpLo
X-Received: by 2002:a0c:b9ae:: with SMTP id v46mr23217547qvf.110.1544017593626;
        Wed, 05 Dec 2018 05:46:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017593; cv=none;
        d=google.com; s=arc-20160816;
        b=VaH7dFWy+M8uQ0kk0BpT73LHGHLYt+SybbkcW+0PCLzeOuDQd2V0Ujf/8DTLf1NMBI
         efe38ceeS0HXC9YooXICHj+r2exOGu5Nf0fw09DhN4DxXvDNo5RigxyfNM25sFVBd54C
         A3qfGEk0UVc/2WTJR6A01MUXabmfWhW2Y4pz9FJvMFaplROzPtxm5H5vDCt8foRZehhr
         I98ECw/8n7sHrBoAmgpFzYv0o5UiTRD0cNp1LUYrSj8CrVsidfc5k0BbDsgISNs/l/Na
         Xod+eT0SbVhuRjXEFRWG+g4olI03lfrz9aaMbjKop2B/QzA74zRRShyFY0LGLM0PFhXD
         CvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=MHE/7kApJ+xdUwTYLWERGW21KDFIyFntP5sv/j9135s=;
        b=xNAQ7OeE96J3YtzrYksjajZ7aY5HsolLn0sh4MnaNKfaD2tosBmSrfIrZwUnvNPsF7
         phE+VzXVX9E9VsKUk/RSw25iLiTBhRl69aqMtUVoDMnzKwmJ9ikek6hsrpKBW4H3jets
         vcRbF20Cq9osTaWYv/K1TbK4AMeT7UmB6Da7Up0kakfqSsN963F7CgtVmmzo8xuRXz3O
         N2UGVlEF/8C/XggPBTUScvo92OsD5LfPM4DduqO9AZcCbKD15z9AhjLJJgYbzObh0DPa
         wE0eDmZyxZAwLJtPCpa3hKHULNfIEINrqixZw48mCwL5mUiQRn7wey5n6k43G73JnT6f
         xo3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=b2sOXAVw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q8si5683617qvr.202.2018.12.05.05.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:46:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=b2sOXAVw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXVZ-0001eG-65
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:46:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXTE-00089F-1I
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:44:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXTC-0005d9-JG
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:44:07 -0500
Received: from mail-co1nam04on0716.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::716]:64512
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXTC-0005F5-B4; Wed, 05 Dec 2018 08:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MHE/7kApJ+xdUwTYLWERGW21KDFIyFntP5sv/j9135s=;
	b=b2sOXAVwJwQ8a/hwt8oiZvDMMNz59CAtoNKSaiRfHcvba+6QZZtTwt7qyC4HA3EZS3ZB7xQmuo2Lv+LPh+h6+xT1fcigZLeALGCgPK2Yff2SjZ0Khhu5OR/hW7K/AC2d6HQWd1QMcRW52/oZlQIYfQs4jijHiHYRXQApFCgO/Zc=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4204.prod.exchangelabs.com (20.176.106.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 5 Dec 2018 13:43:46 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:46 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 11/14] target/arm: PMU: Add instruction and cycle
	events
Thread-Index: AQHUjKB/IPUdo9q60kejsudApNxsYA==
Date: Wed, 5 Dec 2018 13:43:26 +0000
Message-ID: <20181205134243.4791-12-aaron@os.amperecomputing.com>
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
	6:fH9rDj4gf1lOpiy4SfP9Pw/NCJ6BwmYvZLFgAOHPB7UE6iMHKx5anZ0jv9SwTecrX/alrT3xtA7xGDtmCSizUWAIdFgGzwH/h/vdErGQXcP8E/hhDoY3yYRnek+lpAbqoPENOVTsz9tfoymYRWePHSqLmNOHqFz55E/SzsPhxkAqetzyXlkmWxd1FErLM8z2FAEVzc91bKNd57a3dUjIOqDd8uZ/h2Tanax/0KbOX4iC+k8qmimDPyCYCK9PdrvKXX8E9SyhwF/rFVHmjSHWtnlGIn6gFpKe4wyAp5qKy4eI3i3T1qmzo2fFsL9RQr8LDgfCoHidJPMtZ0FQ57WGrmmEuFqfwqk3hY4EOG5emm5rPoBKxoPE8yQ/FoqvBSAv13uK6/aMheLHLqIpqz8c4YhRcRwgN3K5ROg6C1b7L5F1XMjbNfVcEryGDaiTPUq0JaS6nNfAJqX4NY81MCCRZw==;
	5:5CVKYz/k+hLuMh5vpPeyJV4tKzb+PxJkXkWScTcQgi4dKkKiKSHwU47KStfObnArWfKKKzUr6f6pSkwRr5y4v6ZEJJkZO6L+tfZPeWrdPeoEQocDW0fiSCiI4brXXU7Ywab3ug4MoXricIH3OHW0MYy98Jc0xXiCZMf16Ah2Jdc=;
	7:l0ydt8eZPsiLFqN9mAA8K1c9D+a7DIIEFIP+jDhsW3DF+LA3pO3a+xYfQ1utgmXKOSSn4l+tC0iKWbNH9gHANv/8CC+RFsmDjeVVFsyL8eoGohn/IVoe7EPbf0dnt2t+7at65EaJhUZGdnQXkzEGlg==
x-ms-office365-filtering-correlation-id: 75402772-f9e9-44f0-96ac-08d65ab7a1d7
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4204; 
x-ms-traffictypediagnostic: DM6PR01MB4204:
x-microsoft-antispam-prvs: <DM6PR01MB42044772B94CFEDC9B7CE39B8AA80@DM6PR01MB4204.prod.exchangelabs.com>
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
x-microsoft-antispam-message-info: tfuOivDAgBYUUyp923FEgPFwXL0TexAS2oGMod3AWaP1aScAzP8I6d0BBaH+3cDzAygT9L5RYJAWb2fpzriHQ8Qr/HhFBxyV9Jf09zCWZMSDxX4RRqzc/ekxzKqv34WxK2q2m5oDj/dXMjqAUKIH+DVRUs7d7HqkPvaGlSl4ihKafdttCFVGO4E3iGggiqAi//mMAFneLPnx24IhaV0mBQxEEZXkmYpH2cGyrkSbsbTMIGRW6imueA2JunxJF9uuwiMidi259K5RlFZtpoU2sY9dThoNikiHIzYkqyFso1MuDfxo37tZgNyECWUXpZ81vD5amxz5phto7RZ93d50lpOil6MHldxlzo22GavjLN4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75402772-f9e9-44f0-96ac-08d65ab7a1d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:26.4185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4204
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::716
Subject: [Qemu-arm] [PATCH v9 11/14] target/arm: PMU: Add instruction and
 cycle events
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
X-TUID: j0r5IDVKPvq7

The instruction event is only enabled when icount is used, cycles are
always supported. Always defining get_cycle_count (but altering its
behavior depending on CONFIG_USER_ONLY) allows us to remove some
CONFIG_USER_ONLY #defines throughout the rest of the code.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 90 ++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 46 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c51031d262..a45ab5d9da 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -15,6 +15,7 @@
 #include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
+#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
 #include "qemu/range.h"
@@ -1021,7 +1022,48 @@ typedef struct pm_event {
     uint64_t (*get_count)(CPUARMState *);
 } pm_event;
=20
+static bool event_always_supported(CPUARMState *env)
+{
+    return true;
+}
+
+/*
+ * Return the underlying cycle count for the PMU cycle counters. If we're =
in
+ * usermode, simply return 0.
+ */
+static uint64_t cycles_get_count(CPUARMState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+#else
+    return cpu_get_host_ticks();
+#endif
+}
+
+#ifndef CONFIG_USER_ONLY
+static bool instructions_supported(CPUARMState *env)
+{
+    return use_icount =3D=3D 1 /* Precise instruction counting */;
+}
+
+static uint64_t instructions_get_count(CPUARMState *env)
+{
+    return (uint64_t)cpu_get_icount_raw();
+}
+#endif
+
 static const pm_event pm_events[] =3D {
+#ifndef CONFIG_USER_ONLY
+    { .number =3D 0x008, /* INST_RETIRED, Instruction architecturally exec=
uted */
+      .supported =3D instructions_supported,
+      .get_count =3D instructions_get_count,
+    },
+    { .number =3D 0x011, /* CPU_CYCLES, Cycle */
+      .supported =3D event_always_supported,
+      .get_count =3D cycles_get_count,
+    }
+#endif
 };
=20
 /*
@@ -1030,7 +1072,7 @@ static const pm_event pm_events[] =3D {
  * should first be updated to something sparse instead of the current
  * supported_event_map[] array.
  */
-#define MAX_EVENT_ID 0x0
+#define MAX_EVENT_ID 0x11
 #define UNSUPPORTED_EVENT UINT16_MAX
 static uint16_t supported_event_map[MAX_EVENT_ID + 1];
=20
@@ -1131,8 +1173,6 @@ static CPAccessResult pmreg_access_swinc(CPUARMState =
*env,
     return pmreg_access(env, ri, isread);
 }
=20
-#ifndef CONFIG_USER_ONLY
-
 static CPAccessResult pmreg_access_selr(CPUARMState *env,
                                         const ARMCPRegInfo *ri,
                                         bool isread)
@@ -1243,9 +1283,7 @@ static bool pmu_counter_enabled(CPUARMState *env, uin=
t8_t counter)
  */
 void pmccntr_op_start(CPUARMState *env)
 {
-    uint64_t cycles =3D 0;
-    cycles =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+    uint64_t cycles =3D cycles_get_count(env);
=20
     if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles =3D cycles;
@@ -1391,42 +1429,6 @@ static void pmccntr_write32(CPUARMState *env, const =
ARMCPRegInfo *ri,
     pmccntr_write(env, ri, deposit64(cur_val, 0, 32, value));
 }
=20
-#else /* CONFIG_USER_ONLY */
-
-void pmccntr_op_start(CPUARMState *env)
-{
-}
-
-void pmccntr_op_finish(CPUARMState *env)
-{
-}
-
-void pmevcntr_op_start(CPUARMState *env, uint8_t i)
-{
-}
-
-void pmevcntr_op_finish(CPUARMState *env, uint8_t i)
-{
-}
-
-void pmu_op_start(CPUARMState *env)
-{
-}
-
-void pmu_op_finish(CPUARMState *env)
-{
-}
-
-void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
-{
-}
-
-void pmu_post_el_change(ARMCPU *cpu, void *ignored)
-{
-}
-
-#endif
-
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1814,7 +1816,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
     /* Unimplemented so WI. */
     { .name =3D "PMSWINC", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D =
0, .opc2 =3D 4,
       .access =3D PL0_W, .accessfn =3D pmreg_access_swinc, .type =3D ARM_C=
P_NOP },
-#ifndef CONFIG_USER_ONLY
     { .name =3D "PMSELR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D 0=
, .opc2 =3D 5,
       .access =3D PL0_RW, .type =3D ARM_CP_ALIAS,
       .fieldoffset =3D offsetoflow32(CPUARMState, cp15.c9_pmselr),
@@ -1836,7 +1837,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .fieldoffset =3D offsetof(CPUARMState, cp15.c15_ccnt),
       .readfn =3D pmccntr_read, .writefn =3D pmccntr_write,
       .raw_readfn =3D raw_read, .raw_writefn =3D raw_write, },
-#endif
     { .name =3D "PMCCFILTR", .cp =3D 15, .opc1 =3D 0, .crn =3D 14, .crm =
=3D 15, .opc2 =3D 7,
       .writefn =3D pmccfiltr_write_a32, .readfn =3D pmccfiltr_read_a32,
       .access =3D PL0_RW, .accessfn =3D pmreg_access,
@@ -5506,7 +5506,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * count register.
          */
         unsigned int i, pmcrn =3D 0;
-#ifndef CONFIG_USER_ONLY
         ARMCPRegInfo pmcr =3D {
             .name =3D "PMCR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =
=3D 0, .opc2 =3D 0,
             .access =3D PL0_RW,
@@ -5563,7 +5562,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             g_free(pmevtyper_name);
             g_free(pmevtyper_el0_name);
         }
-#endif
         ARMCPRegInfo clidr =3D {
             .name =3D "CLIDR", .state =3D ARM_CP_STATE_BOTH,
             .opc0 =3D 3, .crn =3D 0, .crm =3D 0, .opc1 =3D 1, .opc2 =3D 1,
--=20
2.19.1

