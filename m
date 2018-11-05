Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2950002wro;
        Mon, 5 Nov 2018 10:59:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5fHl01CnbrguAsqctEPgd7OYwoFYG/23wO8HB++GJxJamMY3i6PwByU4nUwqTGG88fPN+Lv
X-Received: by 2002:a37:27d2:: with SMTP id n201mr22302741qkn.18.1541444397382;
        Mon, 05 Nov 2018 10:59:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541444397; cv=none;
        d=google.com; s=arc-20160816;
        b=grPY6STc7B8geliJ3COFKvHd52L1MQLkFbTFAwesnobtf3AgXQVTTB0zZ+4fyzeAfi
         H/l0Edz8RaJl6Xp8IJrBX3EhUNzmfyFpGzjUqHqaxYoNsVik0wtE2rgBLxNs3Aqi48hq
         YcxZiIZdACiY2oT6GIftp1K+330lBtHCMy5Fm9zGte5MC2bqSZr+eStXR3ru7UAOdeNh
         hdV0K1c0syUxASsgWq8bHrJaUDQR6keqxsWnKkbofoRupoLY9XC9wjywA4QuFozwFaJW
         TsmcI+jiEokiNMUziMcnOsorBDzjY2+ewoA9GGXWrCitOsTMHQiNNc2YhFrVMWfEEKon
         2XMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=uLo29C5WwSfe5W+XJjUr82RwxgmDF4IKUMpCpSDkvQM=;
        b=tVQezkEMpT2/Q3HeNi8Fd3Wr3S6Y2ct96PnDvIQZwoZJGqJHqtfX4TwhjlheSdry9K
         I/MZPjArKex2U40Lhg+uzfwL9Vjp9kgUBFYhOLtgf2JR6PgVC4IjRpPNCL/bpQDjpVsg
         aI/UAQBRgGr72pKTKc7+dSic2mF0AYQOL1m3M/H55myNUMNy/Qw2/5bJDa+6s63ARDaS
         /+2P3WtUoGutZT6OjB5ux1TSUIr/O07Muj0xKTzuO6qPrgpiuD24XoyG51NjjZYS/fmQ
         G2gLYu1y3pR0NJsJ9YoseeTkf1YGVP4cKfLjjJotXHW91jSI+sbqjiTeleWUGJ2blq5f
         WYNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=bW1Tl8Yr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p11si2606212qtn.50.2018.11.05.10.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:59:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=bW1Tl8Yr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJk6O-0006BZ-UD
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:59:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjz7-0004tv-K0
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjys-0000c6-KW
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:17 -0500
Received: from mail-cys01nam02on0099.outbound.protection.outlook.com
	([104.47.37.99]:43926
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjyp-0000UT-5O; Mon, 05 Nov 2018 13:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uLo29C5WwSfe5W+XJjUr82RwxgmDF4IKUMpCpSDkvQM=;
	b=bW1Tl8YrumtO3XmLb5UYZoOPipCliddjYepMY7QU9o7oq0MmIzqYqp7UI1RUbOBrVqw/wZH/Rs9JWWnWEHmaUsQaYkwdasL5c0E9oWFKIrxgdFQ/jy+ycRZqlCI4kv60ZzUFoRtkHjRc55qPRQ5bmeXKcmwIWRzl2dA0zeAmGVw=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5194.prod.exchangelabs.com (20.176.122.31) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.21; Mon, 5 Nov 2018 18:52:00 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:52:00 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 09/12] target/arm: PMU: Add instruction and cycle
	events
Thread-Index: AQHUdTiilPHLhD3lJUue9zfAQ/5ukw==
Date: Mon, 5 Nov 2018 18:52:00 +0000
Message-ID: <20181105185046.2802-10-aaron@os.amperecomputing.com>
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
	6:XJtv5j+Qd4ArWyL6p/8kRja4fLMkfGfoYTGncHfGtEh8AznX3F1WW4bUTe9ZaET91G31aaXIcPcYsVAykUZsUb95C7wv0ax7Zryj6ou0OI5kjhHTcWSMgSg4g/Ejpp4P+DDYaTMfRqflAbiOj4mE1bBogRXiDSIW+MQ12oPtdFp/yr9fXvII9A16aFurdLgvHufCIzbAqbNzJMEhwK1nsgk/M2deaRz+p62T81Fcg765XGDdFnrrHa5P0R7Z5x7wwSCcomUvVCLusj/YiSdhm21XELpPSTO0zacbqdXpn8/c+ueeMG5wDoQ+tOBUlMGHSv4n2GAcLjzXk2z55Kc0ZmVTfx27gyGABMnvbnOXsRs5hp9bwHHldS25RbmvSJwN0fKNFgOFdYP5Gy8LvY7YwNXyJZKffFWc8V2rtbh2MDraW6osUK1LBsOybuzmcfYjQq+S5RZEhZ+fK0+fFwYJ/g==;
	5:iLFDn3J0RFOINtXNP1Z5/c0vM2PY9j9vyShIixi3D/wIf4Gz7AsSrwmQwMztST/UfmUfUkduKwnxHpgnMIEnicRbeGaA9Y/ERarI1XtN7+z7xALXZATPjE4UvfzU34USRZX454pKMbgX5gNvsTD5/e9uuI42IS2grSZW2kKdiu4=;
	7:xyfQxCnI61leQdiomjimsxdw6H0uAv1QxjPIoNrT9fIIZPvt3RB3VO8cbMVMKyg8Vt1DNSwzZOloc7nIx9RXyi5BJ7pV0fH/yFVIgqz1qnhSfRs2zGB7cIQz1CLVmSq5GYVidQQk4Br1vxfCtKNbgw==
x-ms-office365-filtering-correlation-id: 2ae41178-56f2-4b70-6d40-08d6434fc498
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5194; 
x-ms-traffictypediagnostic: DM6PR01MB5194:
x-microsoft-antispam-prvs: <DM6PR01MB5194BB92839B7AD9EB05E2DC8ACA0@DM6PR01MB5194.prod.exchangelabs.com>
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
x-microsoft-antispam-message-info: HStrIneimGZ78737SBxIKgJ5VtaCa0MD+RzRdytbsmQUjA0r5kwoIGEwHx8AP++alB/T/wyD3p0p8/bhnADgvZp70wc6tp24dpXT74H40g2mJ4LxVHIeRNmLiltAk9ZaqxAsS4293WxiQhvL0Egi7rhWWAd5L2EevRi6/efrd83LeA6339/0mTvhe6wa6WZP+Nffieorurhkq4VMa18AzMRDq8VzsoIODoDfbRwVRR+KuDLdse2wLhfLYZejMmVXQ0U2qWSPf8t6oubyttEK/kPCXG6XIqb0Xh1RNBUpvGJCxHG0xnagalFr4Z+L2hBPcjuLl03R3G41xdhmztdm33N86u7YuEmufxe9AsjQUFo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae41178-56f2-4b70-6d40-08d6434fc498
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:52:00.0625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5194
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.99
Subject: [Qemu-arm] [PATCH v7 09/12] target/arm: PMU: Add instruction and
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
X-TUID: 4i/mgm76sdQV

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
index b7297d72a8..e3ec36490c 100644
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
@@ -1021,9 +1022,50 @@ typedef struct pm_event {
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
-#define MAX_EVENT_ID 0x0
+#define MAX_EVENT_ID 0x11
 #define UNSUPPORTED_EVENT UINT16_MAX
 static uint16_t supported_event_map[MAX_EVENT_ID + 1];
=20
@@ -1116,8 +1158,6 @@ static CPAccessResult pmreg_access_swinc(CPUARMState =
*env,
     return pmreg_access(env, ri, isread);
 }
=20
-#ifndef CONFIG_USER_ONLY
-
 static CPAccessResult pmreg_access_selr(CPUARMState *env,
                                         const ARMCPRegInfo *ri,
                                         bool isread)
@@ -1228,9 +1268,7 @@ static bool pmu_counter_enabled(CPUARMState *env, uin=
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
@@ -1376,42 +1414,6 @@ static void pmccntr_write32(CPUARMState *env, const =
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
@@ -1799,7 +1801,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
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
@@ -1821,7 +1822,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .fieldoffset =3D offsetof(CPUARMState, cp15.c15_ccnt),
       .readfn =3D pmccntr_read, .writefn =3D pmccntr_write,
       .raw_readfn =3D raw_read, .raw_writefn =3D raw_write, },
-#endif
     { .name =3D "PMCCFILTR", .cp =3D 15, .opc1 =3D 0, .crn =3D 14, .crm =
=3D 15, .opc2 =3D 7,
       .writefn =3D pmccfiltr_write_a32, .readfn =3D pmccfiltr_read_a32,
       .access =3D PL0_RW, .accessfn =3D pmreg_access,
@@ -5512,7 +5512,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * count register.
          */
         unsigned int i, pmcrn =3D 0;
-#ifndef CONFIG_USER_ONLY
         ARMCPRegInfo pmcr =3D {
             .name =3D "PMCR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =
=3D 0, .opc2 =3D 0,
             .access =3D PL0_RW,
@@ -5569,7 +5568,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             g_free(pmevtyper_name);
             g_free(pmevtyper_el0_name);
         }
-#endif
         ARMCPRegInfo clidr =3D {
             .name =3D "CLIDR", .state =3D ARM_CP_STATE_BOTH,
             .opc0 =3D 3, .crn =3D 0, .crm =3D 0, .opc1 =3D 1, .opc2 =3D 1,
--=20
2.19.1

