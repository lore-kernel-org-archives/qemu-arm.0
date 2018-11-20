Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1070434wrt;
        Tue, 20 Nov 2018 13:32:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W8yLzBcJ3gXCxuMhslE+Egaggi9ahGgvVUwdoTEMQoa1Xh7vlIMrF5anKXMj1HfhhWZO3+
X-Received: by 2002:a25:c089:: with SMTP id c131-v6mr3771919ybf.463.1542749554918;
        Tue, 20 Nov 2018 13:32:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749554; cv=none;
        d=google.com; s=arc-20160816;
        b=0o8HR6/stlAiH83kHqsx+EjhJcWY2rKQ8RA7SZ/74jXixdup1TVn6IGwSxaUZ2zFK/
         N92q+E1nv/j2fGcgZGMqCM42WrwTlxjgrPWvG9WEUZHu260lZJCLhS1Cr0KHJ3A6oqdM
         OtTNvthrs1uzlrK5JDlgQFkBWc6AcIuUMkZqSSARi4tb0ALiTqK1aKZ+u8imlN7dYOzt
         dbOeb9TVrAtzRvvp7vYamzo7pUboDnmxljiyl0tO7PDFisPdm8lsK7U3oOr0u3lY4K3v
         gd5lnQlOMPPtKHTBNrC3stNLYbb6DMS5nupTpbe9fQ3/pihjCC9MGFVMBGxV3zyMCGPS
         IotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=qMdXZ8GHbjT8s3EHwsKsJZWuIpznQYQo05Km3xD6a5M=;
        b=1IRqos0KKeyCVESUtmgRoEcaIl0MOv/ROEXlzzef6iNxpdu6+AKTC/zza+sPV58LOL
         Jr5S0iCuRJxQQZDydEVkhP8HdYzYKVvGeKIp/KCAxVvd/mrO2i0n1XsdPz5ss2BuuuvP
         htD6Bz40fdwy9qhlA4A64bZ+oG3F1pEegK3cm0ZMR6ZtZMZL+4MjZJk2Jds8DjUx2afA
         mK9B8zAwLblTTUxpLvCGbIAaSIIs3p5QSRjKDJgF8Vn3UvSFNfa4dSy4I2NNWhiqK8ph
         aliqWQ8JHWQYdsdRWcBgSwoOlkznDRTj+Zzt8AC3wXp+H8kK9eiKNitKF94t1+zyrBJS
         me2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=drxtX+Ce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2-v6si27801768ybi.420.2018.11.20.13.32.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:32:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=drxtX+Ce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDdK-0005Hb-7X
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:32:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXz-0000Ma-65
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:27:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXo-0005vP-5q
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:59 -0500
Received: from mail-eopbgr760129.outbound.protection.outlook.com
	([40.107.76.129]:22624
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXn-0005lc-77; Tue, 20 Nov 2018 16:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qMdXZ8GHbjT8s3EHwsKsJZWuIpznQYQo05Km3xD6a5M=;
	b=drxtX+Ce6xSS2VMZbcEUYPJft2fdJs9F6SdkSePPiICzm7V/unG7PHU8FLiSbeYgXNY/kSBQ5XrhQ0CYv7UKpQKqvk3uDikrNr4uoyLt3n8UfBfk4oGNCWpD1aG95w9m7ra0NyAcWz+etoHa7fFvt+bqAVtXrFKMCbIiiPE5RdA=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4651.prod.exchangelabs.com (20.177.216.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:49 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:49 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 13/13] target/arm: Send interrupts on PMU counter
	overflow
Thread-Index: AQHUgRe/RrVDSDGCp06ElHLXrFt0RA==
Date: Tue, 20 Nov 2018 21:26:49 +0000
Message-ID: <20181120212553.8480-14-aaron@os.amperecomputing.com>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181120212553.8480-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR04CA0037.namprd04.prod.outlook.com
	(2603:10b6:903:c6::23) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4651;
	6:7fRmn10dYwM4BVwdQtnhdoen4gKGlBd82qa3/UGrL49KX/R4rjXvkkZ5XQhYd7v/yY6FSVwgG6Roq4F1pEblNKOvPttufNYcPYHYsUuBTGx7BaN78rdUqW/SeT5KRlIiqRgvW6ZwdZNtu/zOevBEH6r/N3ESeEODoG55CLa0RhQbUusijtcHXRmQVrTAd1yyMDxDPkjNPMBQGikCHS11RWS8xMXQIV1uylwSBwA6W19D0EIeXTQWldpqp1fxRv9Xh+cTBOLpj/gpuL1+LmgCziOpuS14YZbsEs1/7iDPyFg40lAQeDiLBYp1nqc2O2sVA6o006O8Yaay+qzYOIU7QcLnehWvl2K3deRSfvpsSZkh8cZV7A/+hlwPQkagCXkAXA4nTl2aYeWsXXWPH8F+0Osdhcsmbw6qvHOc3vvmyUVwRbQUALs3e5K1muWtNzm9fxRcOMxQ4Bp/1cwYYchIaw==;
	5:GliSf+e+sLVMbZoTNCtBnDsEPmSuVweEPd7zC36Xt6QYxic3xDPnZmRAGVoXly6zNE7Ajls3avDn2c10Tt8RllGkOYXQ8pM1xh1yiBCxecjXoilHD3UehRDkrjmd0di4YyGb++c4+r1/BAzbkjVdDvIvistQcnsVmaGGJDDmqlg=;
	7:2mljKyp2Ml9AI5N2v3tC0jNrggIX2wMCzP6qY4HsIEkYgHs27fMjp0hFiK6oUkydk+3HJc9+iM96S60Zln504InL2eUr5BIcKEG8ESyflYuFEU8IsuhPR9WANPR/qBNPi+eZAZEEeRFe6kgjF3p2Ig==
x-ms-office365-filtering-correlation-id: 79feead1-74a0-46c6-82d5-08d64f2ee172
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4651; 
x-ms-traffictypediagnostic: DM6PR01MB4651:
x-microsoft-antispam-prvs: <DM6PR01MB4651A46BC2D04C8ED63CCF648AD90@DM6PR01MB4651.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231442)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4651; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4651; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(136003)(366004)(396003)(39840400004)(189003)(199004)(476003)(305945005)(39060400002)(71200400001)(7736002)(71190400001)(4326008)(2906002)(3846002)(14444005)(6116002)(6436002)(1076002)(7416002)(14454004)(256004)(316002)(2616005)(5660300001)(486006)(107886003)(11346002)(6512007)(53936002)(86362001)(446003)(4744004)(110136005)(54906003)(6486002)(186003)(478600001)(2501003)(66066001)(26005)(102836004)(97736004)(99286004)(25786009)(81166006)(68736007)(105586002)(6506007)(8936002)(386003)(81156014)(52116002)(76176011)(106356001)(2900100001)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4651;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: UVdCcM6uUgQ6YNmef3A0KAcvikuSr/HTFMSwnskssx7gT4aNvkxNqjQmYzeu5oDM+NtRRTp4M7kntcuc0vPVN6uVjpvlNKtXj5kBaB4CKM2OkhAB0oKTPPg/K5/ljxrINRkURP8I32ZAFNUHhwGJfRnI+yld/Nx5cGwY78nlgs2PbV22+QMn7/Dh56erzUF1ouQxccxvpyFy5CiDckXekzrrf7f8BHhPQ/EB0xVf3sNq880wKNXx+wuU3xuT/MmIRFxcUGH48IgdchP+5GqAptQLB796jO/9/TyOUnEw9g2XlViDeXlFvcA8pVQgtH5h6F0TsQxbgTMhj7VuTKYxv50V05jadZ0R4joRgb+3Ecw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79feead1-74a0-46c6-82d5-08d64f2ee172
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:49.1940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4651
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.76.129
Subject: [Qemu-arm] [PATCH v8 13/13] target/arm: Send interrupts on PMU
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
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Aaron Lindsay <aaron@os.amperecomputing.com>,
	SM-Aaron Lindsay <alindsay@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JSWVuDks4ejY

Setup a QEMUTimer to get a callback when we expect counters to next
overflow and trigger an interrupt at that time.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <alindsay@os.amperecomputing.com>
---
 target/arm/cpu.c    |  12 +++++
 target/arm/cpu.h    |   7 +++
 target/arm/helper.c | 126 +++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 139 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 208a08e867..7311a48e3c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -827,6 +827,13 @@ static void arm_cpu_finalizefn(Object *obj)
         QLIST_REMOVE(hook, node);
         g_free(hook);
     }
+#ifndef CONFIG_USER_ONLY
+    if (arm_feature(&cpu->env, ARM_FEATURE_PMU) && cpu->pmu_timer) {
+        timer_del(cpu->pmu_timer);
+        timer_deinit(cpu->pmu_timer);
+        timer_free(cpu->pmu_timer);
+    }
+#endif
 }
=20
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
@@ -1028,6 +1035,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Erro=
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
index 1539aa5a2f..24354dba3b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -733,6 +733,8 @@ struct ARMCPU {
=20
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
+    /* Timer used by the PMU */
+    QEMUTimer *pmu_timer;
     /* GPIO outputs for generic timer */
     qemu_irq gt_timer_outputs[NUM_GTIMERS];
     /* GPIO output for GICv3 maintenance interrupt signal */
@@ -990,6 +992,11 @@ void pmccntr_op_finish(CPUARMState *env);
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
index 99bce8a526..d44c5852b5 100644
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
@@ -1288,6 +1314,13 @@ static bool pmu_counter_enabled(CPUARMState *env, ui=
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
@@ -1305,7 +1338,18 @@ void pmccntr_op_start(CPUARMState *env)
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
@@ -1318,13 +1362,28 @@ void pmccntr_op_start(CPUARMState *env)
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
@@ -1340,8 +1399,15 @@ static void pmevcntr_op_start(CPUARMState *env, uint=
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
@@ -1349,6 +1415,21 @@ static void pmevcntr_op_start(CPUARMState *env, uint=
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
@@ -1382,6 +1463,19 @@ void pmu_post_el_change(ARMCPU *cpu, void *ignored)
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
@@ -1418,7 +1512,21 @@ static void pmswinc_write(CPUARMState *env, const AR=
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
@@ -1489,6 +1597,7 @@ static void pmcntenset_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pmcnten |=3D value;
+    pmu_update_irq(env);
 }
=20
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1496,6 +1605,7 @@ static void pmcntenclr_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pmcnten &=3D ~value;
+    pmu_update_irq(env);
 }
=20
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1503,6 +1613,7 @@ static void pmovsr_write(CPUARMState *env, const ARMC=
PRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pmovsr &=3D ~value;
+    pmu_update_irq(env);
 }
=20
 static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1510,6 +1621,7 @@ static void pmovsset_write(CPUARMState *env, const AR=
MCPRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pmovsr |=3D value;
+    pmu_update_irq(env);
 }
=20
 static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1696,6 +1808,7 @@ static void pmintenset_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
     /* We have no event counters so only the C bit can be changed */
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pminten |=3D value;
+    pmu_update_irq(env);
 }
=20
 static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1703,6 +1816,7 @@ static void pmintenclr_write(CPUARMState *env, const =
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

