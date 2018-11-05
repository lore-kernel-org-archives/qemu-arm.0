Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2949711wro;
        Mon, 5 Nov 2018 10:59:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5cQzR4yc3LxTpwqw410W76w+h3X5+ML4uwtDjJochYb8d1xFxRyOteySaL3Ggy9bvBSbs3n
X-Received: by 2002:ad4:5282:: with SMTP id v2mr21014167qvr.195.1541444378996;
        Mon, 05 Nov 2018 10:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541444378; cv=none;
        d=google.com; s=arc-20160816;
        b=eUHwNIxj7Z02hxGVJ8UV6hNU/2RsIYfB44yWQTyVk5Y1ec1z7kYOpqWhqGpmvxsKuR
         C5Gr0Efa3vIn9GayqW1AKZ0etM5iUOIkaUL4R+moHmnU0vmcvbyCewIV2htc4SVI2rIh
         GduIRsW35MpnxPo/WZuhNzRlmUk+Skd1lxITPJ3RGwenbyqeNudf5smkD6DEsxaTUQLU
         CWQvt3Fp+eI1qKlTHmuIyz6eqZzAZFAn3yRK0KhinRHToY2m2+w1x2TOH7mALmytmoCk
         vz1oTQ4Nsju1oDprqemEJC3ZeCDU2aSqAC/BMg1DxQZ29uO/X8hc7v5VfbO/ckmz+gFr
         qi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=GkhnMjGrnkzszgC1O/yxKoBwoGluH73nLUlE9srhCwc=;
        b=hhty/lm6tc3VqnfKjihbCCt/VCNWStXDjEDt7l7ZX/WInB4p1z1ulnUCf32x/Fjdwn
         3gG4ZJ4j13vUbfWKkiwc6tXQd0yBCREiZ52w0lACp6YUdjl3EEC2kSVZihTDztJdZQBl
         6jUZnLCyZHvlXFExg2RjP4sw4gII8YCdC2UxkgzFC++wZXYgykM7Njs3AjJkmrvb66Hc
         rwowHK+ZS62v8oDUW5vdrJhRDWHU0K/LlvMGa/KTShfHSNPui1W1qq1BnvbKyDv9iciJ
         bn+6el6etI1e7IZBiORa67LMVojox5m/MCSdN02RGb23ztvxrv3PuUbHFwmKAbKcEzah
         8/hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=ev2dju0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 190si32513qkk.28.2018.11.05.10.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=ev2dju0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJk66-0005x3-FP
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:59:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyu-0004hl-Oc
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyn-0000Y9-6e
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:10 -0500
Received: from mail-cys01nam02on0099.outbound.protection.outlook.com
	([104.47.37.99]:43926
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjyl-0000UT-Db; Mon, 05 Nov 2018 13:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GkhnMjGrnkzszgC1O/yxKoBwoGluH73nLUlE9srhCwc=;
	b=ev2dju0QE36a33K2Qx/BOziUTjBvafKzOptIyeYxFZWVL7MDzHppcdrG6DJppTQRRqEUFCJCrLKiD74oUAnzQ4EQdJhgeRH+kD6kTfikyXSf/Yeqcfg+91c5/kADyN2pFHNfnJTxLBNMbEOOYolVdQzFB0e4hVajv0V7jksJXII=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5194.prod.exchangelabs.com (20.176.122.31) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.21; Mon, 5 Nov 2018 18:51:57 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:51:57 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 07/12] target/arm: Add array for supported PMU events, 
	generate PMCEID[01]
Thread-Index: AQHUdTigFzoivX0Aakiay0YA2QVOXQ==
Date: Mon, 5 Nov 2018 18:51:57 +0000
Message-ID: <20181105185046.2802-8-aaron@os.amperecomputing.com>
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
	6:HfHjPMegfGnU5ksABEirtvjuDSf1dcz49z/3jWpn7OkirVylj4JFSTBtNfkSgExLrxUQ6v9Ew0hbZBxG9yyFvubtyqPqAoTDSD06lu1CAomEw7tq6ZOy4fNUcd4ORGHdsoDkHi/K8f81Gf7BM0YMp+iUjuu5nZbYyz62Z1Z1AXj8IZFRbKkuwStneW1238bsAqseJSUXN+xTPZs3RQUXHo9CIfKLVnFO3BedwiBFEIuO5L5kp+v/pT0qe1xcMCFmKU4hrWJE8O70DumrC3xfmsDti6SEecCTfOOVN2b+fXAGCHKFuYBeuG/o1NM9OKNFrO9O+MRQv3b1/gSnZr7zievtAsvwP2ucZweItAhMMzg0J+xNgbkdsSp/RhWiZ39iAGu3BxCfkVa5CWooNVYp8kByWoCfZlx3PppkY1Or/r0AmO/3HI/i9wXCxO9v3kURctnsJLCFWJl8Ug+bs11h0A==;
	5:cRUsGoVsjeG4C6lHaPvYicMHZ/v+TeXobmAH9NdNB6KENlX5YA+NHCNA5yBAAJ0hssgtk0b0OM1rJZMax18qo3qeP76RNMZPQTz3DZi0JPlhjYYyiinDD0xtVVUIDz0JTvFOGzpH8chbTL9jV27bFOAO5NGk3Sp2PWjRQ2vt+AE=;
	7:PXLY8F1MT4Up5d6FV2laAvVkl262627bqXFZdMeVEf7BE7FUArhYIPvlIwAZFrFU+sOTwyxlihj6WmXxEtuFsI8gLcB6e4LuiwL5espb3WVtNdJZY7dlT/xekLmMQ1cyp9VHPQZOLscZ2jVWAFBDDQ==
x-ms-office365-filtering-correlation-id: c234dd27-5754-47d2-082b-08d6434fc33f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5194; 
x-ms-traffictypediagnostic: DM6PR01MB5194:
x-microsoft-antispam-prvs: <DM6PR01MB519460709E2E432F0503E8CB8ACA0@DM6PR01MB5194.prod.exchangelabs.com>
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
x-microsoft-antispam-message-info: HipKIp9xMnckmXmcGFSgKd2U58BrXwV71v3cXhv8Ewe/vS4WsfSvlFe3v2iXv3zeDK/vCKI/7LXPWX27FwCYl1ECp03DI06PP0VZs4QoMppjyZw2x9CBYCgOEuHJQZyQmtY4srk3YVAPxJpzfPy9ztIzruitjD6I17oQKAbqALA11SSWkrrnu3pp1pDz2KKAlqH0B/zmOC8J8WNuAaYBh0toWSB9465wctTw3dYVUC0pSWO/aKruXOTg04xF8w3GiYHpLJg7aCeLdbauBNQoTey1xbBhI4dxyxPvW2bxgv5VyMwFqJ7A11cznVnDbuBaxWX/JGcpCo9Lh+tC0hON9WnKJ0MPg831ZO+20W0l/Ic=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c234dd27-5754-47d2-082b-08d6434fc33f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:51:57.8390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5194
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.99
Subject: [Qemu-arm] [PATCH v7 07/12] target/arm: Add array for supported PMU
 events, generate PMCEID[01]
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
X-TUID: EYPm1nUxPOQB

This commit doesn't add any supported events, but provides the framework
for adding them. We store the pm_event structs in a simple array, and
provide the mapping from the event numbers to array indexes in the
supported_event_map array. Because the value of PMCEID[01] depends upon
which events are supported at runtime, generate it dynamically.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c    | 20 +++++++++++++-------
 target/arm/cpu.h    | 10 ++++++++++
 target/arm/cpu64.c  |  4 ----
 target/arm/helper.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9e54c56379..d1c766d180 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -957,9 +957,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error =
**errp)
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
         cpu->id_aa64dfr0 &=3D ~0xf00;
-    } else if (!kvm_enabled()) {
-        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
-        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
+    }
+    if (arm_feature(env, ARM_FEATURE_PMU)) {
+        uint64_t pmceid =3D get_pmceid(&cpu->env);
+        cpu->pmceid0 =3D extract64(pmceid, 0, 32);
+        cpu->pmceid1 =3D extract64(pmceid, 32, 32);
+
+        if (!kvm_enabled()) {
+            arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
+            arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
+        }
+    } else {
+        cpu->pmceid0 =3D 0x00000000;
+        cpu->pmceid1 =3D 0x00000000;
     }
=20
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -1601,8 +1611,6 @@ static void cortex_a7_initfn(Object *obj)
     cpu->id_pfr0 =3D 0x00001131;
     cpu->id_pfr1 =3D 0x00011011;
     cpu->id_dfr0 =3D 0x02010555;
-    cpu->pmceid0 =3D 0x00000000;
-    cpu->pmceid1 =3D 0x00000000;
     cpu->id_afr0 =3D 0x00000000;
     cpu->id_mmfr0 =3D 0x10101105;
     cpu->id_mmfr1 =3D 0x40000000;
@@ -1647,8 +1655,6 @@ static void cortex_a15_initfn(Object *obj)
     cpu->id_pfr0 =3D 0x00001131;
     cpu->id_pfr1 =3D 0x00011011;
     cpu->id_dfr0 =3D 0x02010555;
-    cpu->pmceid0 =3D 0x0000000;
-    cpu->pmceid1 =3D 0x00000000;
     cpu->id_afr0 =3D 0x00000000;
     cpu->id_mmfr0 =3D 0x10201105;
     cpu->id_mmfr1 =3D 0x20000000;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 92282cd976..f991ff370e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -991,6 +991,16 @@ void pmu_op_finish(CPUARMState *env);
 void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
 void pmu_post_el_change(ARMCPU *cpu, void *ignored);
=20
+/*
+ * get_pmceid
+ * @env: CPUARMState
+ *
+ * Return the PMCEID[01] register values corresponding to the counters whi=
ch
+ * are supported given the current configuration (0 is low 32, 1 is high 3=
2
+ * bits)
+ */
+uint64_t get_pmceid(CPUARMState *env);
+
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
  * for both old and new bit meanings. Code which tests against those
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 873f059bf2..a1aad772fa 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -138,8 +138,6 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.id_isar6 =3D 0;
     cpu->isar.id_aa64pfr0 =3D 0x00002222;
     cpu->id_aa64dfr0 =3D 0x10305106;
-    cpu->pmceid0 =3D 0x00000000;
-    cpu->pmceid1 =3D 0x00000000;
     cpu->isar.id_aa64isar0 =3D 0x00011120;
     cpu->id_aa64mmfr0 =3D 0x00001124;
     cpu->dbgdidr =3D 0x3516d000;
@@ -246,8 +244,6 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.id_isar5 =3D 0x00011121;
     cpu->isar.id_aa64pfr0 =3D 0x00002222;
     cpu->id_aa64dfr0 =3D 0x10305106;
-    cpu->pmceid0 =3D 0x00000000;
-    cpu->pmceid1 =3D 0x00000000;
     cpu->isar.id_aa64isar0 =3D 0x00011120;
     cpu->id_aa64mmfr0 =3D 0x00001124;
     cpu->dbgdidr =3D 0x3516d000;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6724d97346..b9d8441497 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1009,6 +1009,48 @@ static inline uint64_t pmu_counter_mask(CPUARMState =
*env)
   return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
 }
=20
+typedef struct pm_event {
+    uint16_t number; /* PMEVTYPER.evtCount is 16 bits wide */
+    /* If the event is supported on this CPU (used to generate PMCEID[01])=
 */
+    bool (*supported)(CPUARMState *);
+    /*
+     * Retrieve the current count of the underlying event. The programmed
+     * counters hold a difference from the return value from this function
+     */
+    uint64_t (*get_count)(CPUARMState *);
+} pm_event;
+
+static const pm_event pm_events[] =3D {
+};
+#define MAX_EVENT_ID 0x0
+#define UNSUPPORTED_EVENT UINT16_MAX
+static uint16_t supported_event_map[MAX_EVENT_ID + 1];
+
+/*
+ * Called upon initialization to build PMCEID0 (low 32 bits) and PMCEID1 (=
high
+ * 32). We also use it to build a map of ARM event numbers to indices in
+ * our pm_events array.
+ */
+uint64_t get_pmceid(CPUARMState *env)
+{
+    uint64_t pmceid =3D 0;
+    unsigned int i;
+
+    for (i =3D 0; i < ARRAY_SIZE(supported_event_map); i++) {
+        supported_event_map[i] =3D UNSUPPORTED_EVENT;
+    }
+
+    for (i =3D 0; i < ARRAY_SIZE(pm_events); i++) {
+        const pm_event *cnt =3D &pm_events[i];
+        assert(cnt->number <=3D MAX_EVENT_ID);
+        if (cnt->supported(env)) {
+            pmceid |=3D (1 << cnt->number);
+            supported_event_map[cnt->number] =3D i;
+        }
+    }
+    return pmceid;
+}
+
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *r=
i,
                                    bool isread)
 {
--=20
2.19.1

