Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1187907wrt;
        Wed, 23 Jan 2019 13:49:13 -0800 (PST)
X-Google-Smtp-Source: ALg8bN602fXXWmoPfTJU8Tc6fV8Qyq2Vn+VrW9tD761r8oa89T69Z2sIaAg+jx0GQQ7Be+X/tsza
X-Received: by 2002:adf:a743:: with SMTP id e3mr4315709wrd.56.1548280153359;
        Wed, 23 Jan 2019 13:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548280153; cv=none;
        d=google.com; s=arc-20160816;
        b=X6JoI8nIHq2taTTiwgZf8ciEngt+7/o/ZhZYPrxeUbxMo5mPavXNaPB02U0V/W0O+V
         j2qol/iohso+sDBnbv/OvuS6lUZeRtXHQRp/QYeG8YGbZH8C7p+krL/1YlmH6+vnPM+T
         luYVlD3eiz/ZIjdjqb+UKUrLi7VhGd9qexAjqVZMtSs0ZjotpxxZqXxzG4CFM3LGPtYD
         gpB9QHrlrlUDvx7ieA07e1VZG66Q5XW/HEcQEsU9Ec26vM/GMjxRK9ZusP7rJLhpDoI5
         AjJZhRmgFepbPavdymqwGSHFeTXDEy59+s3Z8pd+pfliLvNsNPS25gRb05dECW8UPpUF
         e2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=GeF8A2gFpATThH8TFT5bOBtgBwNfIc4qkYT1RPHu4PY=;
        b=dw6xkgUKPnQJ++Or6SAthSmW4Am2Pi++WAnv4csp9ilDEKeelIEnAduI/h9TtlAXN5
         ojZsEAqYtOUPNaeAxXF9MoJPCQIM6S87Get6yrKL2vbWpB4QOBbJ7KchsVo9QQSwJfQ5
         kbWu0rTccgE2G5miV/JHNA8k60GOrI6p09eyGWXItZGcEZUqCPIarXpzV2+/c98/rGBK
         ZfNiHrm6qOXq7enR3/cT2SkF5qiQBzeW0supAWm98oY60GBx9tMqFEiqBWqYqoVusmIg
         Iuc3xLqrlLFlV08LQvyl1F5cODQIjvJlQEXSLz+0fzeTg8uNZBB72JkbhR59aGCjmaPX
         3hRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=aLHC6lud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si36540480wmi.103.2019.01.23.13.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 13:49:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=aLHC6lud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:42354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmQOW-000383-8A
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 16:49:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmQOC-0002rZ-OU
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 16:48:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmQ8q-000530-W3
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 16:33:04 -0500
Received: from mail-eopbgr680120.outbound.protection.outlook.com
	([40.107.68.120]:55520
	helo=NAM04-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gmQ8l-0004nO-Dm; Wed, 23 Jan 2019 16:32:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GeF8A2gFpATThH8TFT5bOBtgBwNfIc4qkYT1RPHu4PY=;
	b=aLHC6ludATVxh8ykfsHV2Ee/oHIhEQDOqEcEdUOppzbqUTgg8QgD4xOmDqGRP9EfckC5L94iGFWjzaWOZxrUjMZnhPcV54fLr5i42s24riZOn9zFPwKOk4mmAyfG+DrOrJ06Hw+6MBvAajm9+5xmz88iPgIEZ1nNUf0giWXW2ek=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5083.prod.exchangelabs.com (20.176.121.27) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.30; Wed, 23 Jan 2019 21:32:51 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1558.016;
	Wed, 23 Jan 2019 21:32:51 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v11 2/2] target/arm: Add a timer to predict PMU counter
	overflow
Thread-Index: AQHUs2MwiB+WgftIBkuPWgSMfT0qOw==
Date: Wed, 23 Jan 2019 21:32:50 +0000
Message-ID: <20190123213227.17077-3-aaron@os.amperecomputing.com>
References: <20190123213227.17077-1-aaron@os.amperecomputing.com>
In-Reply-To: <20190123213227.17077-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR18CA0051.namprd18.prod.outlook.com
	(2603:10b6:903:13f::13) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5083;
	6:CsLpN3UmqyO//70S/M0/g/hgoQHwCVVA3ZDRkJq2hs1VqekDcvtr/0pWI4+aG6gFNPW1aDTAAo3ECPpFAgJFgev3COa+MBsEXP5YSPjzBpanA5VulYc25QGQAyf+QkZ6C04H5prpj9ujE8Kx4ipbMnnNRfUPm3LH70rXpPGhLppe3YMktd55/P75972CdueP/Uadzb0Sl19D2LUlW1dTTGtGsM5htWmFPWkSAgP+ra5s84Ka4N5Npxgln4aYZnxwPP98cagZ/BYxY/qmvkQvzPVUw0Wkke86Y+hHGAQw+EAJGIWwUs8QZb9Tq71bOxqR4fQ2fTSqH3b2G1ccIhcyt4p2Np+aHVpmWodow1sp11yNMo2SpAOKz/4X+2J0a7odmqpVc7qNIAlplOpzm4lsyZwRYWu/XVBKnrgZB4TPnrjUYgZfAGIBZqhMrC0bToZMOH0Bu3xzT1VMPkQGOzEj0w==;
	5:a+tytRFjY/jP7kr6/KJAgXXK9ra/c3xNHIKjn0rIWIWT7L+JjWCcx4AYfz49vig7QAIing0vT9ffGxGaO0TBjyrdHtyWeHPCwoXZyXn6v/sJZI24bU3y9mkbL8CyGCJ/iKfntHzm74TMUlzwUcRh6m/pAO2v0JnLjJmKF4f44S680z6BQMmwdHJWo8yhoIfBP8mcvzW9yJRPpqgbElMJug==;
	7:uT+mHA3POk90tIBozqIToZPAqvvc/BXprj0LRrWtv5MAsukWhGtOM5ADOGaqfVofbeLaSkSR/xPj1WLg5GYJi+YzkEfYA0k+uwvFt8tApjWv3T10jfhHm8KY3574LD8OPQGUoc31nF57ldE+iG6ynQ==
x-ms-office365-filtering-correlation-id: d4abd385-5b36-4504-8823-08d6817a5330
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5083; 
x-ms-traffictypediagnostic: DM6PR01MB5083:
x-microsoft-antispam-prvs: <DM6PR01MB5083581FB7AB258823A6206D8A990@DM6PR01MB5083.prod.exchangelabs.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(376002)(396003)(346002)(39840400004)(366004)(199004)(189003)(6512007)(97736004)(106356001)(446003)(14454004)(478600001)(14444005)(256004)(486006)(11346002)(6486002)(105586002)(2616005)(26005)(102836004)(476003)(52116002)(99286004)(2906002)(76176011)(6116002)(186003)(3846002)(6436002)(66066001)(54906003)(7736002)(53936002)(110136005)(305945005)(81156014)(8936002)(50226002)(107886003)(86362001)(81166006)(8676002)(6506007)(71190400001)(71200400001)(386003)(68736007)(4326008)(25786009)(1076003)(2501003)(39060400002)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5083;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fVYh0RLjOH/ckF8vPEkHDg6GCDKyj+WOlV52zVYlBAlkNQtvCQ53ALuGawmYa8Hj638iA24yr/t3yopvfUTjdWhEaFsy+oV4D9bZFhOPpAowYGbSdkla2Q1PlOlU4aDJ92kyjVYO5ANS24X6fkj3NA4dKv7a1awSXUVL683gSVgZcPiYTGVuM+1nO+XzGbop7kpgkA+tbD28ekU9/PWTznFuatcYlIiUT1pRe4+P+dAe2UoKobh2vgy+34APkfTmM40mecYFvysk37uWwQZpReWWivlViYT7apcR3lmsb+zT4Xt2Eb22x3hIYtByadKUOhFq+GStClPjhfhq5KJiJuCofZ5LRy+uDkS0Ku0ZXWiJyNdtxTyzWETbH1DkRgDxIwQOmCqdrJ039OUmi+xqHoVPgOoeArMCpNXinouMz5c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4abd385-5b36-4504-8823-08d6817a5330
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 21:32:49.1819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5083
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.68.120
Subject: [Qemu-arm] [PATCH v11 2/2] target/arm: Add a timer to predict PMU
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
X-TUID: 2yBfB075MJNG

Make PMU overflow interrupts more accurate by using a timer to predict
when they will overflow rather than waiting for an event to occur which
allows us to otherwise check them.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
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
index df2f3dd42a..9417b85130 100644
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

