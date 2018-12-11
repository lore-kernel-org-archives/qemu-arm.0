Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp711415wrt;
        Tue, 11 Dec 2018 07:23:38 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UqRhMTt3uxe9V9u09t7CeIvMA60DfNhqtNGt5nAcM5tK2eJeu59Ka6TsD1ttb9pksM6JXT
X-Received: by 2002:ae9:e102:: with SMTP id g2mr14077378qkm.343.1544541818549;
        Tue, 11 Dec 2018 07:23:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544541818; cv=none;
        d=google.com; s=arc-20160816;
        b=vPj6lCMlOLaJwPeRm0sTu5VbT9nMqUr667yPcW2hyqfPvs4esaKE8Ljyt2ccUtoUxQ
         IylHV8ZfULfgs+x3tJ6/Y5dCQUXPper9j11pRDQm/GmIAIlFZ8mZanJXc5nKoT2AWQK8
         t2GXjLZMn8yRSq4EzXiels2hCTaCis9/ALBMH4W3nIJvbGqSDGtXvGUEUQJoV30kT9ZA
         nhAbZ9Hrw62BVRXjjXZFWVlemvUZtskXvOKTWpdrbyU7XEPfLK6vNEBqrjJPoVfyRCvn
         ApbotgC5QB6YfauPJOEfK2/v2AM2qkS1Hb0BhENxH1D8mR7Z617vspqUjo9ow2DnDOHf
         WQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=kxXQw8wF6i9b6+iGM1E8/MQMXncrQOBf5Etw+Ewwt+U=;
        b=SZjErkmUAD7aE0pUgggPkTtGmmiZJ7E0xTj/guAQPRkocqIpoVM8QpW5QgWIfCuR2v
         lQ+2Pidx15u7AJVV6HJU3j3fNwySr467uhn7ggUlSrkPunqtBToR1Pnchorgtqm8Q98X
         soaktRHQeMqOOIKb3y7Za6LenCAxjmRhUAhCpD1GH/A1ks7iOiwRZv0d2bzhyIlETEgp
         VbDv7hFPdYT08PY9f3Z3qiVwolb+z8uf8H2ZYSkds0BdIPQRmGfVr3MRo+sCqo5zIKSm
         ijNT88SXLlNMAWB9ZPBC2+Ro4XSa/RKNMv73lF1Bf9wfjs4ltWsdFWgL2t2dZSIxb7+z
         MFyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=mG14ExAK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a46si525518qtk.44.2018.12.11.07.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:23:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=mG14ExAK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjso-0006Va-0a
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:23:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpl-0003qe-0h
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpj-0001Np-MA
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:28 -0500
Received: from mail-eopbgr710107.outbound.protection.outlook.com
	([40.107.71.107]:42240
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjpj-00018w-9S; Tue, 11 Dec 2018 10:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kxXQw8wF6i9b6+iGM1E8/MQMXncrQOBf5Etw+Ewwt+U=;
	b=mG14ExAKOAa4ofGz0ONX8RSjgSve80ExspCAUpERrqvQ8Q4G2SG+X6FHRVt2eCSDq78dvN+5p/dROs/jWnfuv/6dUtpNJWekazuIUbNy+O291aeCUCUxXprrPW4SGhrmSrOfhgsMCtxxYp4g8iDW1Cl6vFeAgdy0fQp2UiEZjIg=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4379.prod.exchangelabs.com (20.177.221.214) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.18; Tue, 11 Dec 2018 15:20:14 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:14 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 02/14] target/arm: Reorganize PMCCNTR accesses
Thread-Index: AQHUkWUEc+x23XVFC0mKscNz2fRtfw==
Date: Tue, 11 Dec 2018 15:20:14 +0000
Message-ID: <20181211151945.29137-3-aaron@os.amperecomputing.com>
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
	6:zN1PRuPm2xKnvuBTrCjqS9ZHEcE0Jfs7XW6XyFlfBNBCn3R49W9WehGOHClubzdPv1/al40MZxsk65cTcDUXgImNdIMQLY4Oue3KBm0Bqi1IOPJ0gTXM8LnaoOWduie2qb5qrffu/R6r7rg9fBMgxT08J6P66onFyIR79PjDlfIYjFMmC/Ki9FA3R2hP4pXk+CXFZo0O0uYEeG+ODS/zp5ohd2WCbYkXUeAOBnSdTAjMrIkJPU0YndMZMpb4L+xn7hHJgDPGQQ+t8SHI8bwTVK+okc9sxd/M81qriebsMCkcfJoEXMc88vQQIcEXYXjSJmDpNSMpCQRVFyM4KgOyRwOSzKLjY9eD/vYGcOHhd8G4nYFPzx6rnNGJ+jKrPHldGgCdfUMA1yPso4TaEi4pbFLeGbZPatpHuZHR9IEeiPU0CGfFnl3My312t7Da+VaDB0blsDWzft3Pdup5nExs8g==;
	5:ofJYcunXHXGe3R2bwcOVq3CiZVFjCxutvyWIKRKAh8JIvb0WkmtdYWQPvAWR8Ewvge4Am54XYAC3my9469FPBaoYFfpCf8cdwZUpJV9fM7Y9D1nwAj3xkC8QXLAcFQw+4/XXT34o+lkCWM99xi1+8LVjb/6w7PHt9OAERls63A4=;
	7:MzAid31wau95a6efTTW5jgZRWyI1LaMaHvnW/11KAD8Dg9JDxmR0r3zx2LlYcq8AhPzu8iL0GJ6lqOcccT2Pq+hpRBzTXzifFBNPsFYW5Dq2upSqOcm0wVVMex178LqknX0xWoS0KK5V+V9FhI5mhg==
x-ms-office365-filtering-correlation-id: 6633f600-9002-4d55-d81e-08d65f7c267b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4379; 
x-ms-traffictypediagnostic: DM6PR01MB4379:
x-microsoft-antispam-prvs: <DM6PR01MB43796C7F620BF7EE81DD1EE08AA60@DM6PR01MB4379.prod.exchangelabs.com>
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
x-microsoft-antispam-message-info: yqAdo/GSvqw9eF2eC5AF23gaO9MxmOyyIbT85rS6fuLWMlfiRvwFC9rV7aoRr0dKDXdjFK1E7U8rdzCBlu/X8E3qj0fWs0YZSoEiCHHLILYu2ItHvf3AsCIrflr0wLlJrXj8qE14SHSZlkeMu6opzbpLrQ3KGkkNP2F/72OFFsUnigJosXZYaBldAyaq84Z/k9E+LaJTvTTD4l/DZ6lnqW3hOsilcRnY4vCBVnBI0jmFnL1QejE0ugL6pTYM05+QeKkakOcjzdlR7ZPGW4fYhm3SQzLb4RCjw2G2zt3ZgKy+zwThLmvY5V8jWBe3wZGs
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6633f600-9002-4d55-d81e-08d65f7c267b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:14.8394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4379
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.107
Subject: [Qemu-arm] [PATCH v10 02/14] target/arm: Reorganize PMCCNTR accesses
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
X-TUID: F+wVR8jkTgXr

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
2.19.2

