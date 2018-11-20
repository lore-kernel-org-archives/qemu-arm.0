Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1066407wrt;
        Tue, 20 Nov 2018 13:28:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5eebpkKa2Rqqmqlajmaw+SE9YsABMxmmkwVRfkjBgAtQ2G7KDnXYFt0nHtSA3EBo4u/0vaF
X-Received: by 2002:a81:9ad5:: with SMTP id r204mr3718460ywg.215.1542749313349;
        Tue, 20 Nov 2018 13:28:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749313; cv=none;
        d=google.com; s=arc-20160816;
        b=RuOBcEq6V1Vvq7wqB/pPdswF8GLeizHOXwVyC43tBJzdDPE9VP/m39H11yYnDLYEWQ
         i2yLeSJ8kfU0rrIT0POfD+/ASJWmMwKWquzKsIpt6EjLc+24ydhSXrI8qPBpSAEQluHP
         yEhdCdyOqtj/F2Cd9febZ0YLJoFqnMi731DKLoCLZ/4cwrzRNm5gO/H1mIvyyz2UZsRo
         ntz9FTLVNtC56jUYfO0bEM5RLmzWN9RSHH31HmVASS2O4of6arkqiHW0wZFM2sOBGHPF
         2Ii+g9lFC1RTsFG2aGuDbR3FiaATh0NnNhuwpd6GClJRa8GqHL68QKw4ZaQiGfOewsTY
         e+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=S0bKc7YFDFMvux8SAvgL1W3IUxXyEof1Ht5DF6kfXDM=;
        b=EKbUnbrFVM+aHlfG7lQfjPtklG6wh8tkrr2+UgFwoMWbdm3Tg8E77sSerYXMEOqxSc
         h9jNLlYz6rqpk1/NwDO/dTW9EnqucpI8oDCXAJnLRten8fvDNL8PYsuRWQuXp0nro26p
         O1pphfZ8N8zwr2LUk/QNZMaTTLOzj/wfDheqgfiKb4oDtLiRvgbE1jyUuKfmLYL9+I/D
         Lw23w1IpIMq7upkHv9rehM0lPP6EBeAgtrvyOjYOfsK+YNSIk6pzjZE0H5erqEIUI8FZ
         mbboJpFHPp5ma+Yx8M08WTYsPd9VmNSxkTA7DKFF1d1m/avp93MjG7ilbhKyMMF9sRYV
         O0OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=f3v8o3cn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11-v6si28314117ybp.37.2018.11.20.13.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:28:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=f3v8o3cn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDZQ-00026b-N9
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:28:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXe-0008TR-09
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXY-0005F6-Ko
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:41 -0500
Received: from mail-eopbgr800101.outbound.protection.outlook.com
	([40.107.80.101]:32800
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXY-00057j-1A; Tue, 20 Nov 2018 16:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=S0bKc7YFDFMvux8SAvgL1W3IUxXyEof1Ht5DF6kfXDM=;
	b=f3v8o3cnEJ+HU5GKjsjnF/2pU14ip8V/8ThGWdEEBJmFYskqu9K6XnVw55VohCviC7ahze/8Z2Umr0XIYhdZOSII/s20pjS4WKYY9XRW0IYx5QT/1YNzAGCkJHPopybN4oePid61NNJVaFvi7jJFHH4HgMpVrZP0MaeOrWeEN4o=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5228.prod.exchangelabs.com (20.177.219.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:33 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:33 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 02/13] target/arm: Reorganize PMCCNTR accesses
Thread-Index: AQHUgRe1dMtycWA0JUWosLXdki39Fg==
Date: Tue, 20 Nov 2018 21:26:33 +0000
Message-ID: <20181120212553.8480-3-aaron@os.amperecomputing.com>
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
	6:yNaHUJi4I1CBWS3igGGHJY9MRfpW51qa7cbp6AEgeZ8so+N+lreNIN7c/D7heyG6FfGKfbwI0yOLugRUqN4RhpiopSRTu2vWsbHwA+uHFtUL0MCHOTMhSKJYdBF9Lmk8IVRnLXocero/QcBnhYjNlc0o6eirr+dTgReSd+3kcuZOcjpaBDqfUnzpcUdRa818gXOSzsw8Lo5cbKOnkMDGCmhaeS8vAL4gfRA5nZerk1hvURF0SRXJwemX9pU5UOBEq9lVSIlm2PqoNNOw6/JBDopY6dUOfaskvt9gqW1I+WSkKAT2xeO5Dil+P007AVzJ8WwTFwBZPo2usWGsZ8NN1ydh4GDqjIlCEfaHqH7Q3eIfkAeQC0m+dBOgbAuEDqBdAx9g8PB9ZYVWOd7TG5SVNS5vX4Ue4XTpapn6o8Vx49WuEgBUG3AEw3n/8lhnXXcqJii9GPycqr3CbyiS5x8Z2Q==;
	5:OJ/2zoCgGcNV5/0oQuMJIqfuwqCo5AFFfZiVUNlf/3OHQcQgrIGUlaSVJEaLVC7jOzAnhlucL4V+rW37OM0lSk75bAAla25ShNgzJm2C64rYaSelnv4hHlpvxDOT352amDnTtC871Gh5vM3mImUZPkFfaX7rUBJml1xV4jI5zdE=;
	7:HSVnAFL+Une/m+mPVr9ipiIp8NlmCVuDFVZVzjB4OnTTQq77vj6IfYs+ORLJeT044NXl3QfQ7qE3SFTjOdve5gVxxtPf2cHIx1Mj0RQTeYaLDYWhJdI68yrm/wVl4Kh+fzBJl3arC3XLHHgoteIV4w==
x-ms-office365-filtering-correlation-id: 4e320c33-9a13-4e53-d9a6-08d64f2ed82b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5228; 
x-ms-traffictypediagnostic: DM6PR01MB5228:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-microsoft-antispam-prvs: <DM6PR01MB5228D073D253621F1E341B908AD90@DM6PR01MB5228.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5228; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5228; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39840400004)(366004)(396003)(136003)(189003)(199004)(305945005)(4326008)(39060400002)(71200400001)(7736002)(71190400001)(2906002)(6436002)(7416002)(14454004)(3846002)(6116002)(14444005)(256004)(1076002)(86362001)(316002)(11346002)(6486002)(446003)(2616005)(53936002)(5660300001)(486006)(110136005)(6512007)(54906003)(476003)(478600001)(186003)(2501003)(66066001)(26005)(97736004)(25786009)(76176011)(68736007)(6506007)(106356001)(99286004)(105586002)(8936002)(386003)(81166006)(102836004)(81156014)(52116002)(8676002)(2900100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5228;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: a65jcsrZz7y24AklceCwBGbED1DUmTDArOCMb69CbMY+iybgsDhm9kudc8SApyk4MzYP/9ETcd9cmoSvgu5cYUUTOOy11AbAq7PjmEnBHf1mhh1bFDlxREenDrvdyzKN5pg9JFhgYDydRJHj67dxDr+yU7Lfz0aAzX3DJ03W/t0HlQfJVbGQ69jsdM9GNo933gLrJfBxeflS6mNLaGRZAs1x0XZ3J2l0Sgpk/hvj9xYy5+omFTkeXFxb75Soral1SARssuXOMuJmZIaM4JC+1p2vxcbmsQZw+X2vMFLPCl8Q7rBaOSGn4eusEOdmoNQNh30fCLhhVm8bKXVdUg/Rr1oKn3jPz/1LL2VuoHQMLIA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e320c33-9a13-4e53-d9a6-08d64f2ed82b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:33.7878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5228
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.80.101
Subject: [Qemu-arm] [PATCH v8 02/13] target/arm: Reorganize PMCCNTR accesses
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
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Aaron Lindsay <aaron@os.amperecomputing.com>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V3QY4b2+Uo5s

pmccntr_read and pmccntr_write contained duplicate code that was already
being handled by pmccntr_sync. Consolidate the duplicated code into two
functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
c15_ccnt in CPUARMState so that we can simultaneously save both the
architectural register value and the last underlying cycle count - this
ensures time isn't lost and will also allow us to access the 'old'
architectural register value in order to detect overflows in later
patches.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  37 ++++++++++----
 target/arm/helper.c | 114 +++++++++++++++++++++++++++-----------------
 2 files changed, 98 insertions(+), 53 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2a73fed9a0..61ac458627 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -468,10 +468,20 @@ typedef struct CPUARMState {
         uint64_t oslsr_el1; /* OS Lock Status */
         uint64_t mdcr_el2;
         uint64_t mdcr_el3;
-        /* If the counter is enabled, this stores the last time the counte=
r
-         * was reset. Otherwise it stores the counter value
+        /* Stores the architectural value of the counter *the last time it=
 was
+         * updated* by pmccntr_op_start. Accesses should always be surroun=
ded
+         * by pmccntr_op_start/pmccntr_op_finish to guarantee the latest
+         * architecturally-correct value is being read/set.
          */
         uint64_t c15_ccnt;
+        /* Stores the delta between the architectural value and the underl=
ying
+         * cycle count during normal operation. It is used to update c15_c=
cnt
+         * to be the correct architectural value before accesses. During
+         * accesses, c15_ccnt_delta contains the underlying count being us=
ed
+         * for the access, after which it reverts to the delta value in
+         * pmccntr_op_finish.
+         */
+        uint64_t c15_ccnt_delta;
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register =
*/
@@ -956,15 +966,26 @@ int cpu_arm_signal_handler(int host_signum, void *pin=
fo,
                            void *puc);
=20
 /**
- * pmccntr_sync
+ * pmccntr_op_start/finish
+ * @env: CPUARMState
+ *
+ * Convert the counter in the PMCCNTR between its delta form (the typical =
mode
+ * when it's enabled) and the guest-visible value. These two calls must al=
ways
+ * surround any action which might affect the counter.
+ */
+void pmccntr_op_start(CPUARMState *env);
+void pmccntr_op_finish(CPUARMState *env);
+
+/**
+ * pmu_op_start/finish
  * @env: CPUARMState
  *
- * Synchronises the counter in the PMCCNTR. This must always be called twi=
ce,
- * once before any action that might affect the timer and again afterwards=
.
- * The function is used to swap the state of the register if required.
- * This only happens when not in user mode (!CONFIG_USER_ONLY)
+ * Convert all PMU counters between their delta form (the typical mode whe=
n
+ * they are enabled) and the guest-visible values. These two calls must
+ * surround any action which might affect the counters.
  */
-void pmccntr_sync(CPUARMState *env);
+void pmu_op_start(CPUARMState *env);
+void pmu_op_finish(CPUARMState *env);
=20
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0da1424f72..497907fc79 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1085,28 +1085,63 @@ static inline bool arm_ccnt_enabled(CPUARMState *en=
v)
=20
     return true;
 }
-
-void pmccntr_sync(CPUARMState *env)
+/*
+ * Ensure c15_ccnt is the guest-visible count so that operations such as
+ * enabling/disabling the counter or filtering, modifying the count itself=
,
+ * etc. can be done logically. This is essentially a no-op if the counter =
is
+ * not enabled at the time of the call.
+ */
+void pmccntr_op_start(CPUARMState *env)
 {
-    uint64_t temp_ticks;
-
-    temp_ticks =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+    uint64_t cycles =3D 0;
+    cycles =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
=20
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        temp_ticks /=3D 64;
+    if (arm_ccnt_enabled(env)) {
+        uint64_t eff_cycles =3D cycles;
+        if (env->cp15.c9_pmcr & PMCRD) {
+            /* Increment once every 64 processor clock cycles */
+            eff_cycles /=3D 64;
+        }
+
+        env->cp15.c15_ccnt =3D eff_cycles - env->cp15.c15_ccnt_delta;
     }
+    env->cp15.c15_ccnt_delta =3D cycles;
+}
=20
+/*
+ * If PMCCNTR is enabled, recalculate the delta between the clock and the
+ * guest-visible count. A call to pmccntr_op_finish should follow every ca=
ll to
+ * pmccntr_op_start.
+ */
+void pmccntr_op_finish(CPUARMState *env)
+{
     if (arm_ccnt_enabled(env)) {
-        env->cp15.c15_ccnt =3D temp_ticks - env->cp15.c15_ccnt;
+        uint64_t prev_cycles =3D env->cp15.c15_ccnt_delta;
+
+        if (env->cp15.c9_pmcr & PMCRD) {
+            /* Increment once every 64 processor clock cycles */
+            prev_cycles /=3D 64;
+        }
+
+        env->cp15.c15_ccnt_delta =3D prev_cycles - env->cp15.c15_ccnt;
     }
 }
=20
+void pmu_op_start(CPUARMState *env)
+{
+    pmccntr_op_start(env);
+}
+
+void pmu_op_finish(CPUARMState *env)
+{
+    pmccntr_op_finish(env);
+}
+
 static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    pmccntr_sync(env);
+    pmu_op_start(env);
=20
     if (value & PMCRC) {
         /* The counter has been reset */
@@ -1117,26 +1152,16 @@ static void pmcr_write(CPUARMState *env, const ARMC=
PRegInfo *ri,
     env->cp15.c9_pmcr &=3D ~0x39;
     env->cp15.c9_pmcr |=3D (value & 0x39);
=20
-    pmccntr_sync(env);
+    pmu_op_finish(env);
 }
=20
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    uint64_t total_ticks;
-
-    if (!arm_ccnt_enabled(env)) {
-        /* Counter is disabled, do not change value */
-        return env->cp15.c15_ccnt;
-    }
-
-    total_ticks =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        total_ticks /=3D 64;
-    }
-    return total_ticks - env->cp15.c15_ccnt;
+    uint64_t ret;
+    pmccntr_op_start(env);
+    ret =3D env->cp15.c15_ccnt;
+    pmccntr_op_finish(env);
+    return ret;
 }
=20
 static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1153,22 +1178,9 @@ static void pmselr_write(CPUARMState *env, const ARM=
CPRegInfo *ri,
 static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    uint64_t total_ticks;
-
-    if (!arm_ccnt_enabled(env)) {
-        /* Counter is disabled, set the absolute value */
-        env->cp15.c15_ccnt =3D value;
-        return;
-    }
-
-    total_ticks =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        total_ticks /=3D 64;
-    }
-    env->cp15.c15_ccnt =3D total_ticks - value;
+    pmccntr_op_start(env);
+    env->cp15.c15_ccnt =3D value;
+    pmccntr_op_finish(env);
 }
=20
 static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1181,7 +1193,19 @@ static void pmccntr_write32(CPUARMState *env, const =
ARMCPRegInfo *ri,
=20
 #else /* CONFIG_USER_ONLY */
=20
-void pmccntr_sync(CPUARMState *env)
+void pmccntr_op_start(CPUARMState *env)
+{
+}
+
+void pmccntr_op_finish(CPUARMState *env)
+{
+}
+
+void pmu_op_start(CPUARMState *env)
+{
+}
+
+void pmu_op_finish(CPUARMState *env)
 {
 }
=20
@@ -1190,9 +1214,9 @@ void pmccntr_sync(CPUARMState *env)
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    pmccntr_sync(env);
+    pmccntr_op_start(env);
     env->cp15.pmccfiltr_el0 =3D value & 0xfc000000;
-    pmccntr_sync(env);
+    pmccntr_op_finish(env);
 }
=20
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
--=20
2.19.1

