Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9400146wrt;
        Wed, 5 Dec 2018 05:49:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XhWmNJSgJ+JvfxjGTW35Du3tsuByl884UzMYcMP/2gONHqCAm5fFNayJiX/m0IXZINLsma
X-Received: by 2002:aed:25f2:: with SMTP id y47mr23099207qtc.217.1544017753399;
        Wed, 05 Dec 2018 05:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017753; cv=none;
        d=google.com; s=arc-20160816;
        b=R3vpem7fcUHhHSlf2NerXYyOGC/b73vSs2t1/oKmfiowUtoRmZhfnF+tGEZXzpAZ7U
         4xhQz/1ZQTDJXFmqM8vtmd8/14jY38jI9F4bCLglA0OUvE1qGzX/MN/5xd5trvGpKubW
         Wr4d1pd/7J1iE3HGLFo8oPF8UeHSMt3Vu2Arefgbs4LZG8cxPyrCu/QutZkBcMKyTc2r
         k3Gq+Zfiuaic9FNRyQJAcL4YC4FvRbw8SChJbBA5+bF5k0YxHHfo//hVN4B3AdSZ0wwZ
         0ea5HFJBIk6fAO1FEM1B6XftPrKxm5SpssIRk3hRjKq6c1Q+cLlTsctE3NxpvdQxbNgQ
         ReuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=fxqKC8KL4RL4MGxhXZ2DC/LaIw+vXJl+mXtxgoOX4hU=;
        b=GNFd5c6KNkteB35uGYfL02/G2Z6PAI5Xlc1HjBHGIsQkstodBpzkBO98A2kEzdUZs5
         cJMnUMFpGa0ajvuEFTIR96d11XwcqvcTa5vvu2IPONkS17ch4LXvBipNVWPiC9MzLRmK
         yguiAwPKfZMxmahisXOShM5zhSIqjgFWna3fQBuCi/5vqgMHdlftrPIaeXGZV44K5om6
         fBuvZMQFXuoC067BtfXlQfMnAOzmSTvoVTmUvKxfPL1tgi3VIdBafvBANLKsPPbyP7I4
         YsCtYQUmL4DXURAVPx+MP6ByMiGczJfnN5rndK0+ThXRqjQ5nBsuarlSEJSoGIxCRf51
         AwBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=OzDT8DJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68si2165440qkg.121.2018.12.05.05.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:49:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=OzDT8DJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXY7-0003c5-AI
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:49:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXT4-00080W-BC
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXT2-0005LR-DD
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:58 -0500
Received: from mail-co1nam04on0716.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::716]:64512
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXSz-0005F5-1I; Wed, 05 Dec 2018 08:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fxqKC8KL4RL4MGxhXZ2DC/LaIw+vXJl+mXtxgoOX4hU=;
	b=OzDT8DJ32YH5Xcn6LP/IMRMDXi2xqyEhEo8GewUtTO1aIm96qsIHEvuM5xKR9iGytDtdA6vfmwqJU/50TMb5kJPX6CWhrP9QyVEYtDEeJkOjFauyaHtV8SX3TAUVWZjZXcn3ZrgXrfKSqYchHDTdG8utkPem7FdI5zMWGc9vL5k=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4204.prod.exchangelabs.com (20.176.106.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 5 Dec 2018 13:43:45 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:45 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 09/14] target/arm: Add array for supported PMU events, 
	generate PMCEID[01]_EL0
Thread-Index: AQHUjKB+9aIw+OwvOEqgfYV21PT1Sg==
Date: Wed, 5 Dec 2018 13:43:23 +0000
Message-ID: <20181205134243.4791-10-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4204;
	6:zj23aPmbjx2tgVFVq0F5YNOKpsw8mb5EIrAGMtExHubSTQHgqMpnxZIgM6fdTquY9i84A6sq+0CUzK5G8TikTeDGfNHWY+eRhkZp4IwpCMRNjcXHAB6uqJZ/FEhtPu7T5yPOzC9v2SKaM1YPde1KFE3H+pavT65YhfCTN4tgPwL2TnIlOat0x3cvvtmFpxLzvyYkDKoehleExvaaeyElKDEmkIjCiOE3AU1FOfsS0JQ2PP5+S4xOkld8sSLPKB7T+Q/SL82+wKf4i7w/bib7seZAZyRQlcn4j6YfNe27/t3zuN7VK325YRFjrJemyEmDKvxen2ZO8oacgvKlO/dR1N0WheRHLp22W0uDLnFKM2rC5AUZD6kr6qqanjZ0D95i1XiAc/bJMV3G/c8zky/UeayX82TZyj1kv1q9s6Gloi65Ewdmfy3Jzs8B9913cpQkDcXV8fLXb2WjvcfuK35B0g==;
	5:1ye49GE1RBpDu+Dips5eA9b5nARkKm9y4NNZzb0CYV87VKlLUKNpmPTSsg0C5Qnnzm9yrj4hxbqWg8SbFkeGerLwTGz1B6i0/TVwc531eWUn0Vn4pcJ61BjlZUyVC8DKHysL4u4IOoNsJ42R2vATZT7zWMi5n7kHqVTExr0h9XU=;
	7:4qE/L5AmK+Nv5wp7s+TRhmWWIM3dW4MiBNTK+BTWsmP1/qP68AUoWzMrF3BWno1NmGSSRVIg7yGwjdHBrPaeCnmpG4gDdmfCNX0Hx9OrirTmXCqbbMPE8UGTLJZZiSkpUqTiPr1/O3Hqi7pziMbGOQ==
x-ms-office365-filtering-correlation-id: da0997cb-8939-4be0-9393-08d65ab7a06f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4204; 
x-ms-traffictypediagnostic: DM6PR01MB4204:
x-microsoft-antispam-prvs: <DM6PR01MB4204928CCDB0C208A887146F8AA80@DM6PR01MB4204.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4204; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4204; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(106356001)(54906003)(110136005)(6436002)(4326008)(68736007)(7416002)(14454004)(14444005)(256004)(316002)(97736004)(6666004)(105586002)(2906002)(8936002)(486006)(1076002)(53936002)(6116002)(3846002)(8676002)(446003)(11346002)(2616005)(81166006)(86362001)(5660300001)(81156014)(6506007)(25786009)(386003)(476003)(71200400001)(26005)(478600001)(76176011)(102836004)(71190400001)(99286004)(52116002)(6486002)(7736002)(305945005)(66066001)(39060400002)(2501003)(6512007)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4204;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: mz8G+tgoWPnNsZzZJZWTawbH0BVmT5pTHkWU2est0f9zJr8YlZLJ7p/MAEDT6cWhnpb/EqmjZZwocQFzbfur4QcSRiSAE7R/uV22A/Y1g8vLSmr887iJ1xGLr7+AUDGy7+Gz7aPYStLzY/MSOjrYJdELZrSCejKrmWjTS2uAgdjDHhPcs2DXu2tlyAEYWz1Wv0E+b55E96hzGdkzXad75AanStoCvinhUW62fc63JWgLRiFZq6U+QLAtJKpGOFP4tywVUlx+O11pA+SJXz7ah9CS73xJX+Qa+dLdOWRCHD3riG+CS1nn2c84QdzSve3Gx55t6Y4gVFcKyy9zkYmqnmI+tl4s5JtPqTRV61LwT3I=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da0997cb-8939-4be0-9393-08d65ab7a06f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:23.8716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4204
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::716
Subject: [Qemu-arm] [PATCH v9 09/14] target/arm: Add array for supported PMU
 events, generate PMCEID[01]_EL0
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
X-TUID: Ny25vbwL54+9

This commit doesn't add any supported events, but provides the framework
for adding them. We store the pm_event structs in a simple array, and
provide the mapping from the event numbers to array indexes in the
supported_event_map array. Because the value of PMCEID[01] depends upon
which events are supported at runtime, generate it dynamically.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c    | 19 +++++++++------
 target/arm/cpu.h    | 10 ++++++++
 target/arm/cpu64.c  |  4 ----
 target/arm/helper.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 79 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f7bad04f60..208a08e867 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1019,10 +1019,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
=20
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
+    }
+    if (arm_feature(env, ARM_FEATURE_PMU)) {
+        cpu->pmceid0 =3D get_pmceid(&cpu->env, 0);
+        cpu->pmceid1 =3D get_pmceid(&cpu->env, 1);
+
+        if (!kvm_enabled()) {
+            arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
+            arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
+        }
+    } else {
         cpu->id_aa64dfr0 &=3D ~0xf00;
-    } else if (!kvm_enabled()) {
-        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
-        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
+        cpu->pmceid0 =3D 0;
+        cpu->pmceid1 =3D 0;
     }
=20
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -1665,8 +1674,6 @@ static void cortex_a7_initfn(Object *obj)
     cpu->id_pfr0 =3D 0x00001131;
     cpu->id_pfr1 =3D 0x00011011;
     cpu->id_dfr0 =3D 0x02010555;
-    cpu->pmceid0 =3D 0x00000000;
-    cpu->pmceid1 =3D 0x00000000;
     cpu->id_afr0 =3D 0x00000000;
     cpu->id_mmfr0 =3D 0x10101105;
     cpu->id_mmfr1 =3D 0x40000000;
@@ -1712,8 +1719,6 @@ static void cortex_a15_initfn(Object *obj)
     cpu->id_pfr0 =3D 0x00001131;
     cpu->id_pfr1 =3D 0x00011011;
     cpu->id_dfr0 =3D 0x02010555;
-    cpu->pmceid0 =3D 0x0000000;
-    cpu->pmceid1 =3D 0x00000000;
     cpu->id_afr0 =3D 0x00000000;
     cpu->id_mmfr0 =3D 0x10201105;
     cpu->id_mmfr1 =3D 0x20000000;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4216fe22db..0255f68bd7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -993,6 +993,16 @@ void pmu_op_finish(CPUARMState *env);
 void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
 void pmu_post_el_change(ARMCPU *cpu, void *ignored);
=20
+/*
+ * get_pmceid
+ * @env: CPUARMState
+ * @which: which PMCEID register to return (0 or 1)
+ *
+ * Return the PMCEID[01]_EL0 register values corresponding to the counters
+ * which are supported given the current configuration
+ */
+uint64_t get_pmceid(CPUARMState *env, unsigned which);
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
index fb6939e99c..b7a1f4c108 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1009,6 +1009,63 @@ static inline uint64_t pmu_counter_mask(CPUARMState =
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
+
+/*
+ * Note: Before increasing MAX_EVENT_ID beyond 0x3f into the 0x40xx range =
of
+ * events (i.e. the statistical profiling extension), this implementation
+ * should first be updated to something sparse instead of the current
+ * supported_event_map[] array.
+ */
+#define MAX_EVENT_ID 0x0
+#define UNSUPPORTED_EVENT UINT16_MAX
+static uint16_t supported_event_map[MAX_EVENT_ID + 1];
+
+/*
+ * Called upon initialization to build PMCEID0_EL0 or PMCEID1_EL0 (indicat=
ed by
+ * 'which'). We also use it to build a map of ARM event numbers to indices=
 in
+ * our pm_events array.
+ *
+ * Note: Events in the 0x40XX range are not currently supported.
+ */
+uint64_t get_pmceid(CPUARMState *env, unsigned which)
+{
+    uint64_t pmceid =3D 0;
+    unsigned int i;
+
+    assert(which <=3D 1);
+
+    for (i =3D 0; i < ARRAY_SIZE(supported_event_map); i++) {
+        supported_event_map[i] =3D UNSUPPORTED_EVENT;
+    }
+
+    for (i =3D 0; i < ARRAY_SIZE(pm_events); i++) {
+        const pm_event *cnt =3D &pm_events[i];
+        assert(cnt->number <=3D MAX_EVENT_ID);
+        /* We do not currently support events in the 0x40xx range */
+        assert(cnt->number <=3D 0x3f);
+
+        if ((cnt->number & 0x20) =3D=3D (which << 6) &&
+                cnt->supported(env)) {
+            pmceid |=3D (1 << (cnt->number & 0x1f));
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

