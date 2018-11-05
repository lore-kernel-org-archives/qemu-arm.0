Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2944522wro;
        Mon, 5 Nov 2018 10:54:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5endgEPP2x7+ke9e+zUjqW9EMV4HIC7UO2UTqmA6kAdEc4O2dp8PP/98KTtBrzBQaEoonFF
X-Received: by 2002:ac8:12cc:: with SMTP id b12mr22169731qtj.90.1541444041646;
        Mon, 05 Nov 2018 10:54:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541444041; cv=none;
        d=google.com; s=arc-20160816;
        b=zWK8EPNWpJ/9HrFq66xzyH0T4fGfxDr3mMT+o+F20dknYyBm+84S6+fnM3Ipti0jRy
         WPPNNqfLeFEYxZUI0HeuwWCgN0HiJh0yJ14saWwAi/XD0DiNHqdX5pIMZD7tOa21lksJ
         7a/us0HhHtF+qM6yrWmM09UyVuqxbzAvLYcqGucuI7QKUVm8HU3wKDeKg70Rs9yGgl7+
         p+UZO6X1aJ9qRT99lxMatTbM+kTp8q9CnW6XfbTeHCte56nvlyz8Z+newfA/Jp0ajxAw
         /fY47BT7boSI5mo60EyXED/gdChMQIgD7+K53H7ilTsPJc2edJDU1Qkqt54kdyOOHGHJ
         alIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=/CNyYYKQ2zHBGozh5/XI9kTs4hsJztEG8bskxDqUVUI=;
        b=bXOK88RmYhAHeYrIxBK3c+hAbMSkN6k4HMYpKjfjnhQhCc/T5RFFPavDRrCI6K3flB
         7tW4R1cfCxIAb7EieM8d9oIZGumNjsrg1iBBVNIjXWV2+4uv1N5OFgctz/v7S6GbtmNl
         De7g7fd9XEqsTbKIpp2t+k+r/xzJ4s7o8tFNACKXG0JktAtRt+juJN8HGHFa94RpVM7C
         DohgEwTDNK9Ned656qg2tO4lzUrLqqj1Wsdtgo4n/VlHcrJ9CGQzIp9QLZltIWnWq+RX
         4ATqlUrQARZaj9EzCr9aynKjAU6g+t8jLnJ3LmnFygKodJp0J+11hmYJmQm+SCzgJbGE
         x9AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=RGKtrspS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w5-v6si951839qkc.37.2018.11.05.10.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:54:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=RGKtrspS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37115 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJk0f-0008HC-58
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:54:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjzS-0005Uq-20
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjzQ-0001Dw-2V
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:45 -0500
Received: from mail-cys01nam02on0099.outbound.protection.outlook.com
	([104.47.37.99]:43926
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjzP-0000UT-F8; Mon, 05 Nov 2018 13:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/CNyYYKQ2zHBGozh5/XI9kTs4hsJztEG8bskxDqUVUI=;
	b=RGKtrspSkmHm3ALbmFz9OQLrF5isoXmPPQhgQsKnskgdG+KuCcKrKwy/xInDwdUz8TeCdRCV2+WqVM8rOTXXFdvglxAKThDKZzgygCy8RZ5oRGUoWfUBJQoNYP1HhOK+hI7+sYzZWJ8nVJY419J76cLd+OZBi7hwGKL4sNjAUoo=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5194.prod.exchangelabs.com (20.176.122.31) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.21; Mon, 5 Nov 2018 18:52:03 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:52:03 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 12/12] target/arm: Send interrupts on PMU counter
	overflow
Thread-Index: AQHUdTikL9h6qRBa00SUiul/aHxLzg==
Date: Mon, 5 Nov 2018 18:52:03 +0000
Message-ID: <20181105185046.2802-13-aaron@os.amperecomputing.com>
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
	6:rxqLLKjaNa4u+i+6K/zs4/gYzqkGk/Atha2YnxI6+5u+YHM7FpDjyckdr9ked7UiNvgm+3+M8K12zlSfawXJpqqWAjeVI7/9ACeiAltiS9LV+gHmeVPnrj1E9oQUV3DhzPYbPiYIMmQugvsJklfhGeL5Ol9HnXaVMIpTm0Qy63RGslKy30i115zEX4jBYa1LEKgLE7mYh6lweVKqv8O2vknvTXrBIV3L8ID4bei9lUSK77ZIdCsVBnjNm3OfPbI1yJngiIfTp9WUfqWWsjbgKDUOu/2RCvPWW1dDTFVJS9ASFlXw9GMG/AT5jxhPDuCXsiM7KQbneRFuIiPvLFXLeMA/KXzS9YjyYQFhfKnDiQiOBbfRxElBFn3snyKh5/Z7UrSAWF1sRxpzLQ3Durz+7bjnN2zp/T2eYsaCOkVfpV1o9xhSDMQBn5FcHaTMXR3JnmR1xFRbvo/kloCKRhu6tg==;
	5:FIxBpkCN/0BBC5/2kyqg9KDp8PUUrYYh1p6FubeLvxwlh+w2N+VBeBjAbkbUaiex7T2Z4Blf07EGgNmzzyE6reVYXhw9epnTCD3L8+M+DghmE5aUROJIkSlRb9Ap9ylF8z0cYh9ADmbJzMUUNrAtwBHmfbhjI/jIkKhIGurI2hU=;
	7:Kp5eAGqfQXQMTiillTKKRmRF2S6P9G0OMBNZ8SXOjGn8/J29LJEnFIDTvr1k5Raoq79T8Omjq0QMObGHTL42TuePS9Xo4QPlb1AXUnE+1pMNMKLIGgsvmhdnNhQFMy0wi6EI4quNjE4/k77X6sSsNQ==
x-ms-office365-filtering-correlation-id: 65b52f08-e488-4b4f-11e4-08d6434fc6a7
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5194; 
x-ms-traffictypediagnostic: DM6PR01MB5194:
x-microsoft-antispam-prvs: <DM6PR01MB5194376F24F79D3C8FFC31988ACA0@DM6PR01MB5194.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5194; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5194; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(136003)(39840400004)(376002)(366004)(189003)(199004)(81166006)(81156014)(53936002)(66066001)(6436002)(486006)(6486002)(6116002)(14444005)(110136005)(256004)(25786009)(4326008)(54906003)(14454004)(7736002)(305945005)(106356001)(26005)(105586002)(186003)(97736004)(39060400002)(102836004)(8936002)(2900100001)(2501003)(386003)(6506007)(8676002)(7416002)(476003)(316002)(52116002)(6512007)(2616005)(99286004)(76176011)(5660300001)(2906002)(86362001)(68736007)(71200400001)(71190400001)(575784001)(3846002)(478600001)(4744004)(446003)(1076002)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5194;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: U2IjCjKRgN9zqJMko/JJli+lQjqbc0AiTXkn7NQCRvNckpgS3QM3xPDZNBH5qDK5LRmbAe8vc+c2ekIf/SFJUJ92yuP/hPphKlXKkl/CmifIEi8EHGU5Wtdu75KBF4EMPwT72h3vdHYJGyBhUbe9UvS0Tcsyl4NZGBY+g16u6s5RkfIGCqlA9y8fNES2X4BKuLAgsJsq/27wO7l0BZV0hRbWcIPNhblSjs0aHwuOMeR9r/Jb9jiEVXRIryxfvBOB7ugcq4XZVRGKmbWMBxYiUv++q3yjRglJpq1EQRDEExofwKlwzbyPS9GYs/0Q7YagmsA6IkDC1W9DRrhCiSwT1lexcLH+VFAAu3TOuDxeE6M=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b52f08-e488-4b4f-11e4-08d6434fc6a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:52:03.5250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5194
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.99
Subject: [Qemu-arm] [PATCH v7 12/12] target/arm: Send interrupts on PMU
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Aaron Lindsay <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TUxTvPlXgSGr

Setup a QEMUTimer to get a callback when we expect counters to next
overflow and trigger an interrupt at that time.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c    |  11 ++++
 target/arm/cpu.h    |   7 +++
 target/arm/helper.c | 126 +++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 138 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d1c766d180..7cb6a76afb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -764,6 +764,12 @@ static void arm_cpu_finalizefn(Object *obj)
         QLIST_REMOVE(hook, node);
         g_free(hook);
     }
+#ifndef CONFIG_USER_ONLY
+    if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
+        timer_deinit(cpu->pmu_timer);
+        timer_free(cpu->pmu_timer);
+    }
+#endif
 }
=20
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
@@ -967,6 +973,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error =
**errp)
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
         cpu->pmceid0 =3D 0x00000000;
         cpu->pmceid1 =3D 0x00000000;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 067f6efdb6..fa49dc4c47 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -730,6 +730,8 @@ struct ARMCPU {
=20
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
+    /* Timer used by the PMU */
+    QEMUTimer *pmu_timer;
     /* GPIO outputs for generic timer */
     qemu_irq gt_timer_outputs[NUM_GTIMERS];
     /* GPIO output for GICv3 maintenance interrupt signal */
@@ -988,6 +990,11 @@ void pmccntr_op_finish(CPUARMState *env);
 void pmu_op_start(CPUARMState *env);
 void pmu_op_finish(CPUARMState *env);
=20
+/**
+ * Called when a PMU counter is due to overflow
+ */
+void arm_pmu_timer_cb(void *opaque);
+
 /**
  * Functions to register as EL change hooks for PMU mode filtering
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cff3a5a562..6c3f997b0e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -977,6 +977,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] =3D {
 /* Definitions for the PMU registers */
 #define PMCRN_MASK  0xf800
 #define PMCRN_SHIFT 11
+#define PMCRLC  0x40
 #define PMCRDP  0x10
 #define PMCRD   0x8
 #define PMCRC   0x4
@@ -996,6 +997,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] =3D {
                                PMXEVTYPER_M | PMXEVTYPER_MT | \
                                PMXEVTYPER_EVTCOUNT)
=20
+#define PMEVCNTR_OVERFLOW_MASK ((uint64_t)1 << 31)
+
 #define PMCCFILTR             0xf8000000
 #define PMCCFILTR_M           PMXEVTYPER_M
 #define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
@@ -1020,6 +1023,11 @@ typedef struct pm_event {
      * counters hold a difference from the return value from this function
      */
     uint64_t (*get_count)(CPUARMState *);
+    /* Return how many nanoseconds it will take (at a minimum) for count e=
vents
+     * to occur. A negative value indicates the counter will never overflo=
w, or
+     * that the counter has otherwise arranged for the overflow bit to be =
set
+     * and the PMU interrupt to be raised on overflow. */
+    int64_t (*ns_per_count)(uint64_t);
 } pm_event;
=20
 static bool event_always_supported(CPUARMState *env)
@@ -1036,6 +1044,11 @@ static uint64_t swinc_get_count(CPUARMState *env)
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
@@ -1051,6 +1064,11 @@ static uint64_t cycles_get_count(CPUARMState *env)
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
@@ -1060,21 +1078,29 @@ static uint64_t instructions_get_count(CPUARMState =
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
@@ -1273,6 +1299,13 @@ static bool pmu_counter_enabled(CPUARMState *env, ui=
nt8_t counter)
     return enabled && !prohibited && !filtered;
 }
=20
+static void pmu_update_irq(CPUARMState *env)
+{
+    ARMCPU *cpu =3D arm_env_get_cpu(env);
+    qemu_set_irq(cpu->pmu_interrupt, (env->cp15.c9_pmcr & PMCRE) &&
+            (env->cp15.c9_pminten & env->cp15.c9_pmovsr));
+}
+
 /*
  * Ensure c15_ccnt is the guest-visible count so that operations such as
  * enabling/disabling the counter or filtering, modifying the count itself=
,
@@ -1290,7 +1323,18 @@ void pmccntr_op_start(CPUARMState *env)
             eff_cycles /=3D 64;
         }
=20
-        env->cp15.c15_ccnt =3D eff_cycles - env->cp15.c15_ccnt_delta;
+        uint64_t new_pmccntr =3D eff_cycles - env->cp15.c15_ccnt_delta;
+
+        unsigned int overflow_bit =3D (env->cp15.c9_pmcr & PMCRLC) ? 63 : =
31;
+        uint64_t overflow_mask =3D (uint64_t)1 << overflow_bit;
+        if (!(new_pmccntr & overflow_mask) &&
+                (env->cp15.c15_ccnt & overflow_mask)) {
+            env->cp15.c9_pmovsr |=3D (1 << 31);
+            new_pmccntr &=3D ~overflow_mask;
+            pmu_update_irq(env);
+        }
+
+        env->cp15.c15_ccnt =3D new_pmccntr;
     }
     env->cp15.c15_ccnt_delta =3D cycles;
 }
@@ -1303,13 +1347,28 @@ void pmccntr_op_start(CPUARMState *env)
 void pmccntr_op_finish(CPUARMState *env)
 {
     if (pmu_counter_enabled(env, 31)) {
-        uint64_t prev_cycles =3D env->cp15.c15_ccnt_delta;
+#ifndef CONFIG_USER_ONLY
+        uint64_t delta;
+        if (env->cp15.c9_pmcr & PMCRLC) {
+            delta =3D UINT64_MAX - env->cp15.c15_ccnt + 1;
+        } else {
+            delta =3D UINT32_MAX - (uint32_t)env->cp15.c15_ccnt + 1;
+        }
+        int64_t overflow_in =3D cycles_ns_per(delta);
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
@@ -1325,8 +1384,15 @@ static void pmevcntr_op_start(CPUARMState *env, uint=
8_t counter)
     }
=20
     if (pmu_counter_enabled(env, counter)) {
-        env->cp15.c14_pmevcntr[counter] =3D
-            count - env->cp15.c14_pmevcntr_delta[counter];
+        uint64_t new_pmevcntr =3D count - env->cp15.c14_pmevcntr_delta[cou=
nter];
+
+        if (!(new_pmevcntr & PMEVCNTR_OVERFLOW_MASK) &&
+                (env->cp15.c14_pmevcntr[counter] & PMEVCNTR_OVERFLOW_MASK)=
) {
+            env->cp15.c9_pmovsr |=3D (1 << counter);
+            new_pmevcntr &=3D ~PMEVCNTR_OVERFLOW_MASK;
+            pmu_update_irq(env);
+        }
+        env->cp15.c14_pmevcntr[counter] =3D new_pmevcntr;
     }
     env->cp15.c14_pmevcntr_delta[counter] =3D count;
 }
@@ -1334,6 +1400,21 @@ static void pmevcntr_op_start(CPUARMState *env, uint=
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
@@ -1367,6 +1448,19 @@ void pmu_post_el_change(ARMCPU *cpu, void *ignored)
     pmu_op_finish(&cpu->env);
 }
=20
+void arm_pmu_timer_cb(void *opaque)
+{
+    ARMCPU *cpu =3D opaque;
+
+    /* Update all the counter values based on the current underlying count=
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
@@ -1403,7 +1497,21 @@ static void pmswinc_write(CPUARMState *env, const AR=
MCPRegInfo *ri,
                 /* counter is SW_INCR */
                 (env->cp15.c14_pmevtyper[i] & PMXEVTYPER_EVTCOUNT) =3D=3D =
0x0) {
             pmevcntr_op_start(env, i);
-            env->cp15.c14_pmevcntr[i]++;
+
+            /* Detect if this write causes an overflow since we can't pred=
ict
+             * PMSWINC overflows like we can for other events
+             */
+            uint64_t new_pmswinc =3D env->cp15.c14_pmevcntr[i] + 1;
+
+            if (!(new_pmswinc & PMEVCNTR_OVERFLOW_MASK) &&
+                    (env->cp15.c14_pmevcntr[i] & PMEVCNTR_OVERFLOW_MASK)) =
{
+                env->cp15.c9_pmovsr |=3D (1 << i);
+                new_pmswinc &=3D ~PMEVCNTR_OVERFLOW_MASK;
+                pmu_update_irq(env);
+            }
+
+            env->cp15.c14_pmevcntr[i] =3D new_pmswinc;
+
             pmevcntr_op_finish(env, i);
         }
     }
@@ -1474,6 +1582,7 @@ static void pmcntenset_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pmcnten |=3D value;
+    pmu_update_irq(env);
 }
=20
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1481,6 +1590,7 @@ static void pmcntenclr_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pmcnten &=3D ~value;
+    pmu_update_irq(env);
 }
=20
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1488,6 +1598,7 @@ static void pmovsr_write(CPUARMState *env, const ARMC=
PRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pmovsr &=3D ~value;
+    pmu_update_irq(env);
 }
=20
 static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1495,6 +1606,7 @@ static void pmovsset_write(CPUARMState *env, const AR=
MCPRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pmovsr |=3D value;
+    pmu_update_irq(env);
 }
=20
 static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1681,6 +1793,7 @@ static void pmintenset_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
     /* We have no event counters so only the C bit can be changed */
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pminten |=3D value;
+    pmu_update_irq(env);
 }
=20
 static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1688,6 +1801,7 @@ static void pmintenclr_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pminten &=3D ~value;
+    pmu_update_irq(env);
 }
=20
 static void vbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
--=20
2.19.1

