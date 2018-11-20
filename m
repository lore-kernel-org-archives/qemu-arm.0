Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1074907wrt;
        Tue, 20 Nov 2018 13:37:48 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Xmj8OicuoJE1/0NuT6bkSKPGarM8DzqzNMwCEfUkhLpulrz0JwitgxdE4g+sDbzISqxhve
X-Received: by 2002:a25:238c:: with SMTP id j134-v6mr3641110ybj.197.1542749868250;
        Tue, 20 Nov 2018 13:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749868; cv=none;
        d=google.com; s=arc-20160816;
        b=JRbvSJXSJnXGwdcEGG5Ez2ZAd67t1S4WmsHmbM2gd1p6SrHYEOyM7MGkovmfzA8N+h
         2q41mpF9tZSOxJkqn/DLVVFppNktNZzcN+9b2Pjpg3hGUepOhiCEz8iwTKV5hHsHyx+V
         X22ZIOz/XH66xFgrRsLTmh9He9MwFZtnGw4zl1bCRwkC9+kCAyepvOzdCbR2ZEy8yspy
         v0QekUKQ3mPelmavBTdGft0g2woxxMO3ge24F9bOE4WLm/Wysie3sPeQTjB0uPfEfaZ/
         sTRnq0O7WOz+q+Th8V2qbB9TDtGHZkUoJl4FpPTmBfx7YaqvLfWY/2xHVmM4wkvGAqwB
         vadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=RO8VPOT0j8myQNx683WkyLFxGmWPrVBiugzOnzodw5g=;
        b=HfiptSHTjO3HexjcWIw71J7iLoEH0jv6dhNojOA9MkHF1qeUQYS6WHbLgWqw5L9Ww5
         aWLvOkosmFc6Ij96d3NZm/4S+f8dKfy3xpIJfpaz6QL5MRPzHVrm53MkjC8Tb8Kzm3JD
         +KzjuS1HAwxg/D3TaqZq1NlVsmORgb1INGUZ/oXdc4fsiUAREVrwYVEFXi79uyRYugAb
         DOQ6ehCbIrmT3luvNa9wLW0zXfthnym6Ja1Ean9Sl7f3uWicHdQRvhNluP3ug7rvpgNS
         a50hcgOBHAkHTYZM9Sy9RoI66UfS5Wybj2sBCLSCVmwxxW7kHShs+T+Cu9pM+N4vuf3d
         1L+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=XWtkVmpv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2-v6si1232946ybx.439.2018.11.20.13.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:37:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=XWtkVmpv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDiN-0000mQ-He
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:37:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXz-0000Mh-7S
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:27:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXr-00061r-An
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:59 -0500
Received: from mail-eopbgr740125.outbound.protection.outlook.com
	([40.107.74.125]:18539
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXq-0005b1-Dn; Tue, 20 Nov 2018 16:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RO8VPOT0j8myQNx683WkyLFxGmWPrVBiugzOnzodw5g=;
	b=XWtkVmpvXSyS5G2YouOM7DnpP0B6yYFZGbc04SFI5NAxXlQmIR4ClQL3RPdls1V6tkkxD2P6MGsqNjdZoJxSMWX0KYF6JxeAHSt5Gz+bs5wxkMVFTNgYoZxzkPVz4wrIcP3XblDEJveAkBSEbNr0uwnMLK+yrvY8eCV6u9VMuMQ=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5228.prod.exchangelabs.com (20.177.219.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:45 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:45 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 10/13] target/arm: PMU: Add instruction and cycle
	events
Thread-Index: AQHUgRe8UK9u5O7RB0mtvJqhQx2Vhw==
Date: Tue, 20 Nov 2018 21:26:44 +0000
Message-ID: <20181120212553.8480-11-aaron@os.amperecomputing.com>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181120212553.8480-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR04CA0037.namprd04.prod.outlook.com
	(2603:10b6:903:c6::23) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5228;
	6:NszX51UMQUztAB1m0B4Mq13JWEZqf90AEdA6wIsAykEBf7FxYzLmapqBbi0mjQTX7fK8LDGbf6F3jO9BvDsAJCdzFK1jatT2b/VwtUSB2U0+QeV5QpipJAizL9R1om3NcLfRuvb7CXXhNKuln3Ri0hdUMfzLBpM1IsNyesnsjsYyviyatHdJrXxT8W2vnqeqPeZ8+xaHDM8q2v0zJ5Zr8RCxzm3poMHcy/umC5dlE8eeIOvIjeV8/oLFthDZcTLCT5ifLjRIEeLkNz5RtMj++BOhACtryFpGWsQGQ7mjHZILePxD+SLx17eAc25V+N43wd5lMsmqC6KgSbkjs03dzaYHXixTu5OXSvhtPHvpMXhA1I1pXqfuVks00vzQD66cvlGz5VY68ugC9UlZKYgPcMLWSStw8OcUwsqDvvAzv0sm7AFrZOFG/mczalwGqYEQ8GTuBI6YHEOxhrumhfI7MA==;
	5:NegzBKsf0fMiQzQF2LuE/QDsid9LVuG6/TU7iEcjal8iRMmWOJzV2TAD1PE9oq1TJYXkVr5inw2blYL18BHgLSS69+gQHT7lgKeLJ7/rjIo/TeP5xlaUHUzzWnHFkaKZREBQg1DUoJ89AGb1QTHL8KUy94p583V6tTE/lHRzTqs=;
	7:A8K/50tGO29NlYapsCy0uOJkUyXfr8000ycYtlNjFxnPuroLs+s1bxrqlIYold5npXFfsq+1X8WEg6WfaPQcKpEe5bdMU9Bv9W7Pn7UvZtHlLWScsApQAZtPLdJKoV8AaqE+WI2V+z7FL0hAzGdFEA==
x-ms-office365-filtering-correlation-id: 97b2589b-1c2f-4650-ee3c-08d64f2edef5
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5228; 
x-ms-traffictypediagnostic: DM6PR01MB5228:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-microsoft-antispam-prvs: <DM6PR01MB52287E8901D2736272551CD48AD90@DM6PR01MB5228.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5228; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5228; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39840400004)(366004)(396003)(136003)(189003)(199004)(305945005)(4326008)(39060400002)(71200400001)(7736002)(71190400001)(2906002)(6436002)(7416002)(14454004)(3846002)(6116002)(14444005)(256004)(1076002)(86362001)(316002)(575784001)(11346002)(6486002)(446003)(2616005)(53936002)(5660300001)(486006)(110136005)(6512007)(54906003)(476003)(478600001)(186003)(2501003)(66066001)(26005)(97736004)(25786009)(76176011)(68736007)(6506007)(106356001)(99286004)(105586002)(8936002)(386003)(81166006)(102836004)(81156014)(52116002)(8676002)(2900100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5228;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: K8Rs48BBx2nMHsEwOVVElek9alZJXlAx4FV8MFzZpGodUSPe/54ibFOz0f7syU+t9wG15/b7Rm+lQHW3k93xPpEqh9uRn7Ih/ACUgFG8GKpVXYdG0oECRQxq1Hv5DiiHpD0VGoIKpG+Khyy4hkqXRFWOc+B7M96kvNcFp+2h9kB5vFhd6paIsZRgUAuJxhuBfBpOZXTI6/hKt1GIL8uVqBVNTsD0fjuiFPCjfNX7Gn7u5XEYqexsTJAFaxpEZ1eZhHzzh6yMA80Euh7DKzyT0tMdozVRsq6pgzwgnN+OTTYjyNjgOTDQdxRFlmXQwkOGxXFyC51JBPsqY2INbNxwv4vfJ6a0RTSHWrWTwaq7dBg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b2589b-1c2f-4650-ee3c-08d64f2edef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:44.9753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5228
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.125
Subject: [Qemu-arm] [PATCH v8 10/13] target/arm: PMU: Add instruction and
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
X-TUID: d0YyvbfzeQC+

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
index 02d12c078e..6e5f00c0d5 100644
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

