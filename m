Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9395937wrt;
        Wed, 5 Dec 2018 05:45:11 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XAoo5i/VPDoF52DHtTh5uVjNtcsci8e9UEN+liEhBNRXZHTRbQa/7dbbUnOlGdFW5nfS/A
X-Received: by 2002:ad4:5004:: with SMTP id s4mr23793087qvo.109.1544017511295;
        Wed, 05 Dec 2018 05:45:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017511; cv=none;
        d=google.com; s=arc-20160816;
        b=KmtxlMJ0Ka2XH6PaFdk46XeKwd1RlosEJhYjtMqX+/OmpeAQeurj/bSv2ALCEvdAw/
         huWsFCIQOn5CyKChmhfrLFzU3spHAmQ9c9lleBH6PprCcwKmUh7SKH8vzNWrCCRiOmK3
         HxA+1UVfOJmmnrWCFfkOIqA3tqeVExTjTvmxsYhpXiw8PYOa+Io4pcFYLZ80E+K0A6wC
         oTW77Xdh/r8NvlehyrqC6MA9oUtYaYyoWxaxhWTIbxwZM949WsP1LD6kHkPh3obDcyh0
         udX6GTJIGknVmffIdrsE6oP3EZO1cU9UfNSzA2S3pzNvC991GU/K2LGNUOclORBdfKr9
         CxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=S0bKc7YFDFMvux8SAvgL1W3IUxXyEof1Ht5DF6kfXDM=;
        b=O4/vUz9o/hZq3qmA6MqguFG+CIJGUpsH0I/PsWwSqYU6RiFT6yh9RyE/a35oi5xjwR
         tiKetOy/21WYPrkVc+Tku4kIZJ5NgwKhtRvKDcoYtZJwPordusJLFp0I/6J1ZiLoOLPp
         BW91D3aCNm57a7CIzn4l50Pmr34TdvNYoMFsBTg6JACAv1Hut10XL0xOKPiRiTzZT/Ch
         LvD8ssjCxIChYQKKdUAGaZHn3n2TqgshnQjcnN9HCW+HX9EeSAVugMZ4gb/So/3Orx0i
         t9p7kfzRFoSB/RrTzF/tg14UKv7EvHCQndtP3rnjCiVRnQp3hhGhASdeFWt12DWwKbID
         QUwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=cwJg2d7S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y17si1210329qvr.23.2018.12.05.05.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:45:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=cwJg2d7S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXUE-0000U7-Cu
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:45:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSZ-0007Xc-Ob
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSV-0004da-2u
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:27 -0500
Received: from mail-eopbgr700125.outbound.protection.outlook.com
	([40.107.70.125]:10909
	helo=NAM04-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXSU-0004aK-PP; Wed, 05 Dec 2018 08:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=S0bKc7YFDFMvux8SAvgL1W3IUxXyEof1Ht5DF6kfXDM=;
	b=cwJg2d7ScbHmfNSKgQv8d10Xh3DKrctNLTzHUMv5QwosSLDl6+/yjCSwcOH1mCWlZ7cu+iYjDyo9eGWQlFNrwH7NR/e2i9l8Zn1mSVnHSS3m2MDhLrm4gk2AC9ThYdboX1swSw9dXYIbzur0nrYHsqJ5Np7xES6/gJRfUu/sqtI=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4700.prod.exchangelabs.com (20.177.217.81) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.22; Wed, 5 Dec 2018 13:43:19 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:19 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 02/14] target/arm: Reorganize PMCCNTR accesses
Thread-Index: AQHUjKB5mKwm963mKkGHrg8dNLNrHw==
Date: Wed, 5 Dec 2018 13:43:15 +0000
Message-ID: <20181205134243.4791-3-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4700;
	6:tHaFzpuaGg6D/JPfS8pSKJxpj5yeLVXDQUySQTSndzlDSO+TLWYXwCi0f7ALqeH5cC7CcR/cQrlInPhtdXtuQOUL+aMY6GJOBOrWEAVH2x5zZscE/lxf0UydmqAdaDGDuDus1HUQkFRTloMarsH9MAYCSM74ZADSsO4nEuUXCW5dFoPo5V/6emT9fZkVZ9sXI0T4dT/10VcMUcB/y5Zix8lY6SEH5Xh2mgHpgHF7jvFFWfifPfLX/n5vcXYVrdPWzfriKiXN5S436ir+w3cfR4TbGcMvLaSqztCKOdK9cfexS43nfyq3WCW+BkNsHxmw9fCxyxgkVnxQVALbYSPTxpG7MG6gLVFz2BgWR3yMNIyEhDvhBiMtJUy0p2PZAiJW58kakyxcBh2+adgWxzJEu4p1oxZcGzkYU7L2elhDyfMPykEcIWU4hUr3thKlz+j1rdCh110ltBsQcQEyisrtaw==;
	5:W6mkXeZdeeskJ8mBgdogKqJlpPhgP+JS1iDsZ7tG4Z99IRq7sq4iBzz0k3t2uzohQ6j6h3HFHSbxptrI5Fg33gqL9WBL3OnUFm8gHOMUn5pWDQAS5AXTMtOKtmQV3xuY1zn0XQ4DycmJxJGXtYob/otuA8KjTYWlVY/RmD409lc=;
	7:3oqyPSWkl8xsvyKdLA4kw7i8whABLrryz8PjM4l0+yenxC8YUQY2E+iAFc5ahOwntJWs0ZACUmctjjpzzjfXmkeX2CL/j9VBa9i/SJG9+uA5gGoLkpjj5uLs99CfyCy86ax7kMccRyCckRt24Hi0cA==
x-ms-office365-filtering-correlation-id: 256a8a18-d01b-4a9f-1aea-08d65ab79ba6
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4700; 
x-ms-traffictypediagnostic: DM6PR01MB4700:
x-microsoft-antispam-prvs: <DM6PR01MB4700C10D79403D24BDA444678AA80@DM6PR01MB4700.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4700; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4700; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39850400004)(189003)(199004)(386003)(2906002)(6506007)(2616005)(476003)(97736004)(446003)(11346002)(486006)(102836004)(14454004)(26005)(99286004)(106356001)(3846002)(186003)(6116002)(1076002)(6436002)(81166006)(81156014)(8936002)(54906003)(316002)(86362001)(68736007)(6486002)(25786009)(8676002)(7736002)(7416002)(110136005)(305945005)(2501003)(6666004)(71190400001)(71200400001)(4326008)(39060400002)(76176011)(66066001)(52116002)(53936002)(5660300001)(256004)(14444005)(478600001)(6512007)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4700;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: ZBdtMO/zj8CazPMCYGi8dPWOWrE/vpxm/C/reI1DcRlbOxQY6h1aCsIvZzfNBPW5fvCKUcikgUDqITQ9SlXva+k8b+i6SUeSk8LygMs4eAC2Sx55Qlsf2YggCvdXIWOzkAUQyyLlIXIVdOc7k8Hp7DBDONIvo7817LSiDAGrdoyHS0YZBIAad6wdrD5xs0NVbYla2LcXijjOA0Ktw5SxvmPXJWNzJkord8AMcmMsSeeOLDXGmA9uhV1mdRKTKCV/YQztsMALRY5BfC7u+4Ovcy+DZhDRJpjqtmt949zv2nd5NNbHcOntGLH4abqT0PNW8gS3LFZxg8IhPleiyhwOZuEjHOyhrpqw4A+kycNSbQs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256a8a18-d01b-4a9f-1aea-08d65ab79ba6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:15.8404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4700
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.125
Subject: [Qemu-arm] [PATCH v9 02/14] target/arm: Reorganize PMCCNTR accesses
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
X-TUID: PyqlQGwdysB4

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

