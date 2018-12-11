Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp715355wrt;
        Tue, 11 Dec 2018 07:27:39 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wz36BnW4ta9jhuL3f5hXF5jG74JlHWcM57RVgMh7MuNkzOqXHU0uXlXZhqqjAE2m8KRMJ2
X-Received: by 2002:ac8:6b50:: with SMTP id x16mr16726247qts.368.1544542059622;
        Tue, 11 Dec 2018 07:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544542059; cv=none;
        d=google.com; s=arc-20160816;
        b=rE71/KZnCYzKuFZASheuPomMjMgtl8V3mTBMxj/lUuirMneT4DND9bmMSQL9uK0SmL
         ORcbH0cbyERlK/YQHuuvf+qF14iqHaT82GUq2T4W3NKOmsYmTc0TKld7nDSzdFcnXxjD
         LZmTPmt759Bu8SQcExKsu2UZsv9WfkmnuYUHoaUhurvpJ7zMFk1qw6TFR0EdqssyOCsc
         LSlQFnYwrrhXWkgFTx8rtoppifw7+gCCXINe+pbmtaCRZND1MBSJSr8SX7RhoLwYVCcv
         f3H8O19KdFeLxiCljM4+PVy9gsc+QA3chAdKFVZCPGdeI2E8nnDzdPCNIrYUF4dosDwz
         aprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=jWqWtsktTX9IhchzZqBHMmdgHzpjTsFC5QPuV+va0nY=;
        b=kMTun9E0JHOepi46q/+32qxceFdw0N3j1lQSrlFsIVaMBKj27aAU1P3fbDWoW34udE
         QgKJTnUM5mU2hLgoqZwFzd3KaH9qcupyeDxOAs4MzP67gb8Ivfkf+IQxl20UWL1jYX+s
         uET9RdNOyMSjNpvy0ZsC2IJhkkjS5s2Aj+J5S0Bv1uYDXAStCCHqEQf6TQ2t1zKhNagR
         fMg4hPqH8wyGT+FEz+qPTW5VQ928Q3psMiX31GnfT4aMpQFeRTUKhAB0NPSw1ei1/B2w
         wP8KxKTBaEbU1JK2giADf0MIBw2BKOaXpsb0A52U8pd4yECGboKcCVS6AjfFQWvbnJ56
         pVtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=WIrelWc0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j187si6463634qkf.235.2018.12.11.07.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:27:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=WIrelWc0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjwh-0001cw-2k
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:27:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjq8-0004Bq-PQ
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjq4-0001bs-Od
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:51 -0500
Received: from mail-eopbgr800111.outbound.protection.outlook.com
	([40.107.80.111]:37108
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjq3-0001ZN-3C; Tue, 11 Dec 2018 10:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jWqWtsktTX9IhchzZqBHMmdgHzpjTsFC5QPuV+va0nY=;
	b=WIrelWc0aP5b2LbOFVFwKQiQ6uGQsMFjLZvsnpwpXQZw0aeDU92ulAP/QRsb1iv3s0PrhpHrCl5m5tH3tDmxovgRC+wpCCAbCBfT6wUSaW0EMq3CD7VaA2W45OTNdnYE7AaH+otxbuiGEUn+Q2CCwqTvNrWMyV8IxhKDeRJOsZU=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4601.prod.exchangelabs.com (20.177.216.78) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Tue, 11 Dec 2018 15:20:45 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:45 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 11/14] target/arm: PMU: Add instruction and cycle
	events
Thread-Index: AQHUkWUWW5eQ5Fo1Y0W6t7BPF+uWKg==
Date: Tue, 11 Dec 2018 15:20:45 +0000
Message-ID: <20181211151945.29137-12-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4601;
	6:8SRIHQk5RFnAjKTC6oLJXpYiIkj8garvUh26BKwcEXC/w6r1ql4VSI0skBpZj98w6jQ3IOBHDPti7nz6BCYW7qG8eUUSZIDqoEYV2dxcVZsB7qzS6hJw5eKWbTKToU0gRTcWI8ng1fhqeAWnUs805B6TkPb6wSiL+T4x/oySx6Yh2vItMQFs89qpNZZ2rgG4MoNGgmvE+qc5BUwNfv9ziHeXLHJgRK7vDKRu1ErbsiKHLUwL1qcjVucMPBYYHLeEi+ZY04dGMHBAf8otFP4z49oBFyd/nRoBlq+e2vxWhKDebHktDd1baQb1NmImesF39tXx8utqVKyf0La+QDl1FJPqbTIiFtRTCTOFKJ8gnytAGeDRazV5lJsbPiyUWPOtS4JvvSpH86+9jWAak2sGaCUplmKqjy6flFKc8B2GQWiz+y3bMSFdzOfNrII0XI+T53AdiO1EDCsNO38utgKqJw==;
	5:p1vxf557/bIVMIZSUMVfiRY0fhEdgV5UK8yw1EL2wJjQ7y7PtsBZxWX7I/+GN1RuZKTnuqY0xzGEKVxFyFaWq6doPfLKjH5D5le5GwsjD7zGlIHkP+Pr+9Ko+vwl70J30hq4O8/OdM/ndordSLo9hLxfBFpRlmNif1wK19P4MhA=;
	7:DKCmKMl8L0SCN+ld+x/LejDujLRT+hgE3Y/pa+OHEw0mUoBEpczqXLpeih7KkPJJk6PMPIRtT8HwT9n1xX8frlQbFtj3yCQPh2i22rWUHeChFzfm0gLHjVo8rD8eRGPhHiSEH85v7Yj0uo4+aYp+zg==
x-ms-office365-filtering-correlation-id: 833c9bec-1ba5-484e-e6cc-08d65f7c38db
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4601; 
x-ms-traffictypediagnostic: DM6PR01MB4601:
x-microsoft-antispam-prvs: <DM6PR01MB4601D4EB1CBE2268267B9F9D8AA60@DM6PR01MB4601.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231455)(999002)(944501520)(52105112)(10201501046)(3002001)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4601; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4601; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39850400004)(366004)(346002)(376002)(136003)(199004)(189003)(66066001)(7416002)(54906003)(106356001)(2906002)(97736004)(110136005)(305945005)(105586002)(316002)(5660300001)(3846002)(256004)(39060400002)(68736007)(14454004)(1076002)(7736002)(76176011)(11346002)(2501003)(99286004)(52116002)(6116002)(4326008)(6512007)(53936002)(81166006)(81156014)(8936002)(102836004)(26005)(8676002)(186003)(14444005)(71190400001)(446003)(486006)(6436002)(86362001)(25786009)(6486002)(2616005)(386003)(476003)(478600001)(6506007)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4601;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: UzKRiQ6eFJWKSMgrkh95xY52yFBaEwvG5/ItqtDhKCjjITeH1PGyWXDaBKjPpHY/DEyQNAWWILqZyVFb5xVah1RmmkKopdwxFpKnEqXjFP93MfGe/8V0Nja72PhzozP5/HRo15zm+Ue6Hu8HBrGTxTu9jtPQzOSg0SLDJxkWbXF4zC8fUqtSVY/3zUQ8Zfu016KaX1L3rTNRgLLeD2VHR6MahEnNVECCfx5r0DuAk8GDi0F+HBTYn72tOLoEdx6/G+jwELvFP5OtrOTdczVGQz3qVPQHkRU0RwRDjchs1kkjamoq+1Bjz1ifzqUbk0Wv
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833c9bec-1ba5-484e-e6cc-08d65f7c38db
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:45.6679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4601
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.80.111
Subject: [Qemu-arm] [PATCH v10 11/14] target/arm: PMU: Add instruction and
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
X-TUID: sKdPX7XYleyG

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
index 1b851d1689..7e81473405 100644
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
2.19.2

