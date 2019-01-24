Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2125471wrt;
        Thu, 24 Jan 2019 08:31:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5MlT1t5m2o3562r6LScVWfWN8y6bsP+5355MYayoJ6Waixiu9qZYWbzqdXxmnlZId+aD5Y
X-Received: by 2002:a1c:b14:: with SMTP id 20mr3442192wml.103.1548347465971;
        Thu, 24 Jan 2019 08:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548347465; cv=none;
        d=google.com; s=arc-20160816;
        b=P3H/FCvNjgVpnmfhiwJzMjgIusm///FTzQfvHVg+YgKONE4OHTpet7Uk7EUz0Yfcwg
         l/OKVnb50jptV0oF7Em9TiQQFpR6pYza04mrjvVXwZ4DWIUwhrYZEB5IT46/oV5Ttk1O
         QeyBUuDhDvUjU0uGk5hbuabi9zyaeRfRNVSYWLHsMU7wpsoH5AQ/XBcahztfiqCj6qP/
         fj8u/LQ8QIFOfzbA37JAS8wvsCC3kVIKXKMir8jAcwQZATHGghd58ytIaXv/+/CnkdOZ
         F7lv3zu1Q08QSkeC9fAy6L2eghBzt/gPpDbeoFxgmqNe50zoJkULWsuw8TNTtbk2iaAV
         hFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:dkim-signature;
        bh=x5VWl3ecMUXbAhmmeinl9aXmA5s7rwvIrHoWsfKiEV8=;
        b=PPRXAYhPCfCBcxMXv1P+3279/rkK9azhG8sFrl08yLzZc29uKRlREyV1HPDFe1L1tZ
         XKOpvUiGsC38StSOApOs93ui4TaDMgz3SLTK69JDYjTbTPS6DOUBNZzuPTxFzJTzm7d5
         z+PIewdWryFw2peEzrh3cmmeoz2A6mXPLFBTZJMlMZiyeLKEo2qXltNp2kq9jmRL0L9K
         brO0pFGMX5VFShfQqWOR96dvEHDe4HUIUllSZEj04Js9F8NZo6CteVJ93LrYGlPxQ6nm
         vUvZVJw0KSrRRvOoiL9D404dYsxzDUSOALWuqJqCuIDpzu+C7K5IitIOa0EQ2fuskWj2
         aOkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=nGW1y8pl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si37056555wrm.46.2019.01.24.08.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 08:31:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=nGW1y8pl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:56537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmhuC-0008US-TI
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 11:31:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmhoE-0003p2-Ih
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 11:24:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmho4-0005p7-GW
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 11:24:52 -0500
Received: from mail-eopbgr780110.outbound.protection.outlook.com
	([40.107.78.110]:34663
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gmho4-0005HJ-23; Thu, 24 Jan 2019 11:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=x5VWl3ecMUXbAhmmeinl9aXmA5s7rwvIrHoWsfKiEV8=;
	b=nGW1y8plDEESlJe5pxvNHe0SRw0OE7yZ150yZI5QNAtooKfILzJ8hoIyT6TQen6x4GpkkwbIfbUGe7ZFb47j1kZbh5J2nEuYFo3+H1GzVMdeXnd7HBns2GSUAAsltQpmOnMYmAZlkeOAAD1HHxEBdbW2DIkIR7+tjlLIfbVTEKU=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4442.prod.exchangelabs.com (20.177.222.13) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.16; Thu, 24 Jan 2019 16:24:16 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1558.016;
	Thu, 24 Jan 2019 16:24:16 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v12 2/2] target/arm: Add a timer to predict PMU counter
	overflow
Thread-Index: AQHUtAFA38rbRwCf7Um6xII8PvADBw==
Date: Thu, 24 Jan 2019 16:24:16 +0000
Message-ID: <20190124162401.5111-3-aaron@os.amperecomputing.com>
References: <20190124162401.5111-1-aaron@os.amperecomputing.com>
In-Reply-To: <20190124162401.5111-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR18CA0050.namprd18.prod.outlook.com
	(2603:10b6:903:13f::12) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4442;
	6:2jtAx9Lt30jAdc0f6HwadOXGiZOBdEJiRgpK1lXrUprwsz/NxhygRHdDOn26bHcrFg2f0DOJ1bRougRGkhYaQIkING+wd/wv5unIoSKmfxd0ZD6rqr2skHE1+fQuNLNxiQCf7UmjBTp8jSek2dqg+ky97fC1iA2RMntgRdKmFGCZTzxxHu6niemPcrnvW/NPqNG5fsWzx5UIoM1UyvsRD8ovRR3ez1HwujUny7Msmr3VYdkmvVI90EPHhoU24Fm+S+FzFRZjLfqebDmExzicXhNISL5kfeJ6SBkCI5ktYSdyJmzc6Lm5W2mijdOgqm6sTTdSDAv8OugMcW1Q6nk3BokHfhG/IoeZzCOXyvspzt6K8L4R4I9gHVxeUOEK8awNKmCZS7pkynNuoXw+bRieu64gANOqbU0GSwVaBtPeiF0VCLoFN98P8AGemELYXnEvGne26Ze6M7LR+G+3uX2LFg==;
	5:i2JbHUmracNPHEwoeAHRm6XaRzXXN+v+9v8i/oJGyeCTY5qUJqSqxXcCAFya6HUF30IFFJ7friseApfZ9slLkocdfQT3Fe6IK8QIgRmP1B8oyBLoGg0Pr+Yed7a3LDjnhIs9FoPBoHji2WB3aO/xr/OTPc3tefxh7MHtZGI1GwF1MuxR9fnAI3QYYovqy2o90mCP0bWp2CTDA+IE0AtKsA==;
	7:9wXBlrPUTOsMA79X+gUUk1oQRBZxTfoDXiUSTYWQ+ycXZom8MbmOE1HN38TZ8jUZBy18hYJf8OgXB/oSChRAWtGu0n7yVOzszsNF25galTEmSP9EexpBsaqAaTJDvXaENKRPJ7om8YXf6ebtg7kEGQ==
x-ms-office365-filtering-correlation-id: 715bc803-0697-453a-a218-08d682186299
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4442; 
x-ms-traffictypediagnostic: DM6PR01MB4442:
x-microsoft-antispam-prvs: <DM6PR01MB4442F173DF9F5FEA4B25D9598A9A0@DM6PR01MB4442.prod.exchangelabs.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(346002)(376002)(396003)(39840400004)(136003)(199004)(189003)(476003)(26005)(86362001)(305945005)(76176011)(71200400001)(71190400001)(8936002)(386003)(6506007)(2616005)(25786009)(2906002)(6116002)(2501003)(3846002)(11346002)(66066001)(186003)(446003)(6486002)(7736002)(14444005)(14454004)(256004)(8676002)(478600001)(6436002)(54906003)(110136005)(39060400002)(52116002)(6512007)(4326008)(99286004)(81156014)(81166006)(486006)(107886003)(97736004)(102836004)(68736007)(316002)(106356001)(105586002)(1076003)(50226002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4442;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SVL8pfPPiH8GF++ON4XJ/v/3TljEbwtt9Frl719qD81QnshpV2wkAFHkmVcmLdf3vIzuaURFpWy7giDjS7wxuTkUedcGlbvYX6dZf9wcVsOCwqQM+lth6SnXK3BrgYTCfhHD5uo1NavPh8jZkNQQVRQJukNoUPxJYc9+41XCWUrqh25mNbgnxksjSeyXv4d6dpa1fC5uEbMG1gdIx9oSspf7He7dqM6/BfbSeVCUtp2UGmx16ypn4FRESETG3IcJ5sHz3XUATemeZdRNxUe0kN/8oExgTLEysHZuWSEKdmA0O1HAho1BeqMMBLwzHpftUQTF1SpaudwF1FI8Mn5rxLly4G9DZY92xMH4g5+fUaRPof53oyCi3Yd1eF3+zAqShk2gIEEGTNlXNPWZjeONiG29u9/ci/1vhzbUsal/cHI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715bc803-0697-453a-a218-08d682186299
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 16:24:15.5198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4442
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.78.110
Subject: [Qemu-arm] [PATCH v12 2/2] target/arm: Add a timer to predict PMU
 counter overflow
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
Cc: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QUtNKOFlj4xO

Make PMU overflow interrupts more accurate by using a timer to predict
when they will overflow rather than waiting for an event to occur which
allows us to otherwise check them.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c    | 12 ++++++++
 target/arm/cpu.h    | 10 +++++++
 target/arm/helper.c | 72 +++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d6da3f4fed..8a9cd0900d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -836,6 +836,13 @@ static void arm_cpu_finalizefn(Object *obj)
         QLIST_REMOVE(hook, node);
         g_free(hook);
     }
+#ifndef CONFIG_USER_ONLY
+    if (cpu->pmu_timer) {
+        timer_del(cpu->pmu_timer);
+        timer_deinit(cpu->pmu_timer);
+        timer_free(cpu->pmu_timer);
+    }
+#endif
 }
=20
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
@@ -1045,6 +1052,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
             arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
             arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
         }
+
+#ifndef CONFIG_USER_ONLY
+        cpu->pmu_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_=
cb,
+                cpu);
+#endif
     } else {
         cpu->id_aa64dfr0 &=3D ~0xf00;
         cpu->pmceid0 =3D 0;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b8161cb6d7..63934a200a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -746,6 +746,11 @@ struct ARMCPU {
=20
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
+    /*
+     * Timer used by the PMU. Its state is restored after migration by
+     * pmu_op_finish() - it does not need other handling during migration
+     */
+    QEMUTimer *pmu_timer;
     /* GPIO outputs for generic timer */
     qemu_irq gt_timer_outputs[NUM_GTIMERS];
     /* GPIO output for GICv3 maintenance interrupt signal */
@@ -1005,6 +1010,11 @@ void pmccntr_op_finish(CPUARMState *env);
 void pmu_op_start(CPUARMState *env);
 void pmu_op_finish(CPUARMState *env);
=20
+/*
+ * Called when a PMU counter is due to overflow
+ */
+void arm_pmu_timer_cb(void *opaque);
+
 /**
  * Functions to register as EL change hooks for PMU mode filtering
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fc33c45441..3598db114d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1021,6 +1021,13 @@ typedef struct pm_event {
      * counters hold a difference from the return value from this function
      */
     uint64_t (*get_count)(CPUARMState *);
+    /*
+     * Return how many nanoseconds it will take (at a minimum) for count e=
vents
+     * to occur. A negative value indicates the counter will never overflo=
w, or
+     * that the counter has otherwise arranged for the overflow bit to be =
set
+     * and the PMU interrupt to be raised on overflow.
+     */
+    int64_t (*ns_per_count)(uint64_t);
 } pm_event;
=20
 static bool event_always_supported(CPUARMState *env)
@@ -1037,6 +1044,11 @@ static uint64_t swinc_get_count(CPUARMState *env)
     return 0;
 }
=20
+static int64_t swinc_ns_per(uint64_t ignored)
+{
+    return -1;
+}
+
 /*
  * Return the underlying cycle count for the PMU cycle counters. If we're =
in
  * usermode, simply return 0.
@@ -1052,6 +1064,11 @@ static uint64_t cycles_get_count(CPUARMState *env)
 }
=20
 #ifndef CONFIG_USER_ONLY
+static int64_t cycles_ns_per(uint64_t cycles)
+{
+    return (ARM_CPU_FREQ / NANOSECONDS_PER_SECOND) * cycles;
+}
+
 static bool instructions_supported(CPUARMState *env)
 {
     return use_icount =3D=3D 1 /* Precise instruction counting */;
@@ -1061,21 +1078,29 @@ static uint64_t instructions_get_count(CPUARMState =
*env)
 {
     return (uint64_t)cpu_get_icount_raw();
 }
+
+static int64_t instructions_ns_per(uint64_t icount)
+{
+    return cpu_icount_to_ns((int64_t)icount);
+}
 #endif
=20
 static const pm_event pm_events[] =3D {
     { .number =3D 0x000, /* SW_INCR */
       .supported =3D event_always_supported,
       .get_count =3D swinc_get_count,
+      .ns_per_count =3D swinc_ns_per,
     },
 #ifndef CONFIG_USER_ONLY
     { .number =3D 0x008, /* INST_RETIRED, Instruction architecturally exec=
uted */
       .supported =3D instructions_supported,
       .get_count =3D instructions_get_count,
+      .ns_per_count =3D instructions_ns_per,
     },
     { .number =3D 0x011, /* CPU_CYCLES, Cycle */
       .supported =3D event_always_supported,
       .get_count =3D cycles_get_count,
+      .ns_per_count =3D cycles_ns_per,
     }
 #endif
 };
@@ -1340,13 +1365,27 @@ void pmccntr_op_start(CPUARMState *env)
 void pmccntr_op_finish(CPUARMState *env)
 {
     if (pmu_counter_enabled(env, 31)) {
-        uint64_t prev_cycles =3D env->cp15.c15_ccnt_delta;
+#ifndef CONFIG_USER_ONLY
+        /* Calculate when the counter will next overflow */
+        uint64_t remaining_cycles =3D -env->cp15.c15_ccnt;
+        if (!(env->cp15.c9_pmcr & PMCRLC)) {
+            remaining_cycles =3D (uint32_t)remaining_cycles;
+        }
+        int64_t overflow_in =3D cycles_ns_per(remaining_cycles);
+
+        if (overflow_in > 0) {
+            int64_t overflow_at =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) =
+
+                overflow_in;
+            ARMCPU *cpu =3D arm_env_get_cpu(env);
+            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+        }
+#endif
=20
+        uint64_t prev_cycles =3D env->cp15.c15_ccnt_delta;
         if (env->cp15.c9_pmcr & PMCRD) {
             /* Increment once every 64 processor clock cycles */
             prev_cycles /=3D 64;
         }
-
         env->cp15.c15_ccnt_delta =3D prev_cycles - env->cp15.c15_ccnt;
     }
 }
@@ -1376,6 +1415,21 @@ static void pmevcntr_op_start(CPUARMState *env, uint=
8_t counter)
 static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
 {
     if (pmu_counter_enabled(env, counter)) {
+#ifndef CONFIG_USER_ONLY
+        uint16_t event =3D env->cp15.c14_pmevtyper[counter] & PMXEVTYPER_E=
VTCOUNT;
+        uint16_t event_idx =3D supported_event_map[event];
+        uint64_t delta =3D UINT32_MAX -
+            (uint32_t)env->cp15.c14_pmevcntr[counter] + 1;
+        int64_t overflow_in =3D pm_events[event_idx].ns_per_count(delta);
+
+        if (overflow_in > 0) {
+            int64_t overflow_at =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) =
+
+                overflow_in;
+            ARMCPU *cpu =3D arm_env_get_cpu(env);
+            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+        }
+#endif
+
         env->cp15.c14_pmevcntr_delta[counter] -=3D
             env->cp15.c14_pmevcntr[counter];
     }
@@ -1409,6 +1463,20 @@ void pmu_post_el_change(ARMCPU *cpu, void *ignored)
     pmu_op_finish(&cpu->env);
 }
=20
+void arm_pmu_timer_cb(void *opaque)
+{
+    ARMCPU *cpu =3D opaque;
+
+    /*
+     * Update all the counter values based on the current underlying count=
s,
+     * triggering interrupts to be raised, if necessary. pmu_op_finish() a=
lso
+     * has the effect of setting the cpu->pmu_timer to the next earliest t=
ime a
+     * counter may expire.
+     */
+    pmu_op_start(&cpu->env);
+    pmu_op_finish(&cpu->env);
+}
+
 static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
--=20
2.20.1

