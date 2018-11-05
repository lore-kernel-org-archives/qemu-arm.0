Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2942871wro;
        Mon, 5 Nov 2018 10:52:19 -0800 (PST)
X-Google-Smtp-Source: AJdET5ds/5XmH7u/mi8Sk0UE4NQg6g+0UoOBu9RjwWAW35DG3UaqkwDtMs6bk3R2DFtE4Yec2/Hx
X-Received: by 2002:a0c:d033:: with SMTP id u48mr2773039qvg.146.1541443939416;
        Mon, 05 Nov 2018 10:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541443939; cv=none;
        d=google.com; s=arc-20160816;
        b=sXk+ah1Ly4oaYZulKdvBPAhV6MY+DDuyKNyNFWMXT49kV4GA9eb8Qi3kYMMGnXlKii
         MXLFGaYONgwb0MTJLWkMcxFsEnp4VTuuc074LWHzCTsn4UsDFaJsuIyULdvDJsDhzqDM
         nbfiJ6u12/EmguFmgkqAOBfCEAza2h8ZVED89w0AoPxB8/jQ6+vECZS7E/Z8cYvMCl/p
         wkiqXiIq4WcHAk1autNdqtdaKQ41XKfXV3totcQLSoZ8Z2VOWClr1jYeSnPc5bnsUTyO
         r1e9pttFstJL1AXbQoAOgqf547uW5e13sKEoNZJE3KbrtBRzawJH9Og5Xaf99eNS1t1X
         t5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=5poua1UspXXeWQReAcmE7tmrWbde4Rdxrut2OkYJt9g=;
        b=o22xEr8jIBHHlqMvLcIcZSRqBJDya9YL/oY+WmcRqvjP4SVCpqxUBsjx734VBmVdEx
         LPIw4qQIbJU+8nXT24XgYHpIPdz79vsX0Q6t1Rz25I1OYLte4OXCZ30U9emFDGcXIOwR
         mz8V/2V0QadM5Qjn5Vzp7luZ5CZoXgiuPYuG+pKH3HnApuE1bYr4iTnPS0LJ90EPHcP4
         Ocmh4uEYESITrncwGiJ+QZnWXnR/vkhq8/Qiwj/8MkHbFD2bm+qpkqm0HiHAQrxSSyEd
         7XA1leGmsW+Z4OfehPBZcAsXgOhlhCX3HABW7aHm1k3CZlccJKhbJ9KSWehPdyFpbND2
         hKAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=RAkXWDb+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o57si1066363qtk.150.2018.11.05.10.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:52:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=RAkXWDb+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJjz0-0004bM-Su
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:52:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyl-0004YK-FM
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyg-0000Si-Bh
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:03 -0500
Received: from mail-eopbgr810103.outbound.protection.outlook.com
	([40.107.81.103]:6323
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjye-0000MQ-EQ; Mon, 05 Nov 2018 13:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5poua1UspXXeWQReAcmE7tmrWbde4Rdxrut2OkYJt9g=;
	b=RAkXWDb+eTSGzsfmGe/0UwlI+TmDcm2AeM9FgR5rfrn3uSGP97Fe0VuqPW4Tx1G63kOjTjw+Fike0u/RFYpAVHkQ3geN2AZTCM9/WvVjGKl00vywF1ekeBrhuu1SR2RS/5L+zuP7DWCcy2fPXutMOMeMnCndtN/IYV1JqDF8J90=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5034.prod.exchangelabs.com (20.176.120.218) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.25; Mon, 5 Nov 2018 18:51:52 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:51:52 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 02/12] target/arm: Reorganize PMCCNTR accesses
Thread-Index: AQHUdTidRQePjAMjaEK31x4b2nO99Q==
Date: Mon, 5 Nov 2018 18:51:51 +0000
Message-ID: <20181105185046.2802-3-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5034;
	6:2ctoNbnCSyAuimZpr2RSHMBNRvac8y5J+vgO/XaDmxNTk1udWafLGRm61ZHIjuJArzaEhuxYF+lrU/wpH3f+RSRojLzA9BbVoEEJ/Z+HwW1kTwIyx7O/x1lrBvsH9NdGgVmKBe45V+VOsb0MYyivSzuKk9Unw7j1aUS8+FxHDAw/yvI+hXASA73WQmbbxND7DSo6tAIvCD6oEShlILn2MGicf3Qt+gNLhS3/ybDD18XZk7EwzNkE652vvok2F0iA+4MfBKJy8+Y3mYflp3SJ6CQ4ztQUiNARhiQRxykRslLCxXC/9zD8tygFROg4OesgLt1JiE5DZlxfHmanbAFG4rrvOIkxncM2BNufiKD0Ti1cEhs+TnE14xMr1nK0z5kRrQ3zfWk1MGYKJm4JFyhoehBtGnTdwv4LAuX/2FDkVpt+6yC04R8G4FtsPzzusOHHkbnXh8DCGLBOyMiNBr87vQ==;
	5:vW5Ohjc2X19MkmJcp0J0KGAmsSQlln6VUcIk98pRtkoYVh5v5EbcZKrPqUdrJ8gOfFYrGJztxy9WLucxNoS44ogwZ08fLf3xtCQvAQquP8pRzoGMNW0NWq+LX+yi+tsaIwelKXBsmVxSCIuOEIKqm6e9+4GCOqSqRQyRwGl5tog=;
	7:uYsVi+j2IF8yZfSRmfxwqvzI7efE4auL49odhl2v1cO5e32vVsZvMyJVmLrlgfqcV9bVIExpGM+BwlANo/m5ScHh5+QT+jp52HYSU+NaSxWBefXoJoDajbzULtbe3+HeKjIlhT1+V0mbdiXt85l+4Q==
x-ms-office365-filtering-correlation-id: 796c0a26-60d0-4dc5-f477-08d6434fbf9e
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5034; 
x-ms-traffictypediagnostic: DM6PR01MB5034:
x-microsoft-antispam-prvs: <DM6PR01MB50346CD5539BE1A3209735D28ACA0@DM6PR01MB5034.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5034; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5034; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(39840400004)(396003)(376002)(346002)(189003)(199004)(81166006)(52116002)(110136005)(105586002)(76176011)(1076002)(86362001)(8936002)(54906003)(68736007)(8676002)(81156014)(66066001)(102836004)(6512007)(14454004)(2900100001)(2906002)(53936002)(3846002)(6116002)(6506007)(386003)(7416002)(71200400001)(478600001)(14444005)(71190400001)(26005)(5660300001)(316002)(446003)(11346002)(6486002)(256004)(25786009)(106356001)(305945005)(99286004)(7736002)(39060400002)(476003)(2616005)(486006)(6436002)(97736004)(4326008)(2501003)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5034;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 9d5g9d7NnVaxxEV/SBGxtg6Z01rcqVAjW/p4/0DHHEoLhXzhlFCkZFDkY4aJ0CEP2ldtYj5SVL0lLyqxIQwkh5i1oi9CIJyK7ADf1isKXmHNkUn0cxY1cTykJKUlM3YM15JLew2VRY9iF0/PXueAhEkVyyIiO6PNYkKMr9UlsuaW5OT2LNznj7vU8GCv6SDsDJSIlURd3VFy37iyBZRqLRHW3dVb0rYZhdRb/xaGF4BWRQtHW0OQ3npfNDESPl5FGIHh/3zrmyljRZPDG2Z8wkB+HoMkSWgHY6URzPsluUpkPoUBLkZmr64wxhE3u1IGuybEUDreUTYIwrumy2hIBPRF+fEtdzNO4H4l18rGD/0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796c0a26-60d0-4dc5-f477-08d6434fbf9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:51:51.9639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.81.103
Subject: [Qemu-arm] [PATCH v7 02/12] target/arm: Reorganize PMCCNTR accesses
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
X-TUID: OzCHUYyDeeOC

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
---
 target/arm/cpu.h    |  38 +++++++++++----
 target/arm/helper.c | 114 +++++++++++++++++++++++++++-----------------
 2 files changed, 99 insertions(+), 53 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b5eff79f73..50a0862c84 100644
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
@@ -953,15 +963,27 @@ int cpu_arm_signal_handler(int host_signum, void *pin=
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
+ * surround any action which might affect the counters, and the return val=
ue
+ * from pmu_op_start must be supplied as the second argument to pmu_op_fin=
ish.
  */
-void pmccntr_sync(CPUARMState *env);
+void pmu_op_start(CPUARMState *env);
+void pmu_op_finish(CPUARMState *env);
=20
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0ea95b0815..281bcff1da 100644
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

