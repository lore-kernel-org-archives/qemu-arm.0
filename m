Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1073269wrt;
        Tue, 20 Nov 2018 13:35:51 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V9p6ckt0+DsmAOIsfm03OBHdEq4oHKKhxtshA/jnvx3I1s7q7xJACgT7IncifEjfVqWMa9
X-Received: by 2002:a25:b687:: with SMTP id s7-v6mr3826956ybj.31.1542749751729;
        Tue, 20 Nov 2018 13:35:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749751; cv=none;
        d=google.com; s=arc-20160816;
        b=uJye4cr2tsLNsvsoRcLiBJDjx0lMEfVfDsWHOBlUfd9JfOw5eUqzJjt9uba7ktu73x
         zKhtb0Ch9ulFHDs+RGiZ1K+TnLYSS1RFHNhKlTCfjgV9FfrKFmKRTxukYHjaDIZ9euVg
         aZwTbWUko82HAPeVCyJ5q2WUofaj+F46T/ZGh9TmeDQJTqmwlhmmZwTfLpWOwd2APyG4
         xxf7I4DamlNsZEaoqyPYIHhh/U2ajJU6x0aYC7C/Z/z8GjAmbnr5o5NO3PmIb5fBNw18
         SsPcOJrXeimi1EqxiIwFHdscplzqm+rnChZqc1ifqkcBp77N9mvbYYFz2XweWxIEdkB+
         CxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=oFbXIDlIPeBnUS31JTxdGCFQjBdwTe/r/bjaAugp16g=;
        b=zMaAW3A47lKOmCtjaDyt5M/gX0hq4qnqAoYhnA/GuaSwO5ZBLcmrFa2TgT0D/LdueP
         xVqoKtjo5eUiTF85BqVntCeeJm2HcrkP8Su71EUvG4fNQilb/NBjXmNcpOdl+LoJMhIM
         Z41j1X8/84mmOuhR+0Aqh2cf44C2BP5VShzteUPubuB9c/JWQq1Eh8jXubeiqVAFvulR
         vDY38JsJTsOufUrTDIeY2O203EKRtWV0JYWPPbMg6x6y55Y6FsqYTe4DDvUEtkXIhdmJ
         YGg88o02hNOfWsDE8zxpa4fm4umhKNQru7Fq6VpQlBXpChkm092Jjh2WXjtnMIApWbbR
         MmUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=XhXGuNjZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i123-v6si26974404ywf.185.2018.11.20.13.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:35:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=XhXGuNjZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDgV-0007oO-4t
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:35:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXq-0000DW-VB
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXm-0005rM-DZ
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:54 -0500
Received: from mail-eopbgr740125.outbound.protection.outlook.com
	([40.107.74.125]:18539
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXl-0005b1-Em; Tue, 20 Nov 2018 16:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=oFbXIDlIPeBnUS31JTxdGCFQjBdwTe/r/bjaAugp16g=;
	b=XhXGuNjZijxyzXkVOqW0BbwCq7sRZebLW5j8WLhPsiQuzewxmq0Ck3/18B60vV5yjxDmUniO0c5+rGVtGrq5d0n7z7WNm1ZQHFxC+LAefjP+2HtFeTpvhKVSG477GIlGvZ+W0fLkAxSwXp83P/rV5Jo7gAa5vYUCz1EafMugORg=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5228.prod.exchangelabs.com (20.177.219.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:43 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:43 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 08/13] target/arm: Add array for supported PMU events, 
	generate PMCEID[01]_EL0
Thread-Index: AQHUgRe6oR9puOKSUEmZsRsmRpV0PA==
Date: Tue, 20 Nov 2018 21:26:42 +0000
Message-ID: <20181120212553.8480-9-aaron@os.amperecomputing.com>
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
	6:mi318B9LHxzl3seXS/KeNEcX9ouog2ImDwT9h99V8IFnyDMH4Dzpz37mSuNhQ6AhJv3v96exckHMJMZ9kq5ykhbWVcaRH3Aq4ddDUDwieu/5Wl8GYIj0+OLCxA5Ws0z2oZg3LTJ4+fUUlF4YbYn/K6Dj8FyNcOfs0C0BaTYNs4IulRKc96730mylrft/L5SRFe0ST+2V0LzDYaWYNqnvhbAc7vADeemj3tFswLW5CPFOWnikvSKJn7p1jtlDOz+mSM0qXZfQ179nSXeqi9K4WmyYbVRD4XlFqp0w5rif/54GkqUnJykzQGtWtaVHaGD+sNbvEv/+22YwzkP5ua5tv8yGEJ7/Jizp7MUISRl6/RUpqXajIggpr75lONr0/rXhUgAuvHrbecMNJ3O5dB3fPQFAHIjgQLS4cQmSggsd7qKVPHtuviiWa4+m1qauvkTfB43hwzXmFNr1ui4KspJHnw==;
	5:dw3MhBtP62EDeVvjWTYwswavzYXznireCed0KlEAo3HYXupm+Xx9WQQ5DCNIMPloU1z/qE1YaMfvjnMGcdVIrwHdpz2g34fu5EjY0/ZXWogU/lQTVdX+AHBvxNTFyDDrCw2q97c0d7e4sBLgpeQd71nWcS/Q1RZM7V8Kxm1n3vg=;
	7:fw1ihM30PUzKolAm0rfuXRwlcMfGSPDk4uGsY5stWWmhZjgX/G/ee2L03GUY4Y6Spe+oBEDcj6xX6IBTad/pdc7fkCTvAfk3Uv/7MFC1//rj1DIAp0K3y6klogLulCPml8ioCOfIuy+VlZyPZCqnXQ==
x-ms-office365-filtering-correlation-id: 079feaba-fb88-47ea-7836-08d64f2edd3a
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5228; 
x-ms-traffictypediagnostic: DM6PR01MB5228:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-microsoft-antispam-prvs: <DM6PR01MB52285CED7CD1D727BCB6A4ED8AD90@DM6PR01MB5228.prod.exchangelabs.com>
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
x-microsoft-antispam-message-info: 1+wo7m/mwM0MlQyLjKqsufMgrNAd5au119+YEiaGHNzMHLSpGrT8Gj5O9+1mGwUFbNLUafuiQE+LNxNZUhNfL17F8wtr/P23XJzuLKNrRreeZh/lMZIG5EQGudveqEu6ocu1EOQ/RQWMaipof9lCUPmB/238ioqIJ9xPKYL4YcdvZ1uozPCBrMsLLcL+EBLGpDmul+vJ4qR5deii7EF7ywws3Hx91jIbMIgAubekKV1JNidF1z0kc9ZbSbyJx1m+sWGuioD2+ckDQ/GcChZzotIgHQT5OqkUHN2k++guwDx+edVZ/DrL1Td5zUuwzQ7ivDpiIc5VlxtYtWRKfUMZqCyMzRhfjNVnwa+y7zk6eZ0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079feaba-fb88-47ea-7836-08d64f2edd3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:42.0221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5228
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.125
Subject: [Qemu-arm] [PATCH v8 08/13] target/arm: Add array for supported PMU
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
X-TUID: AaGi5Z2Vz9Hd

This commit doesn't add any supported events, but provides the framework
for adding them. We store the pm_event structs in a simple array, and
provide the mapping from the event numbers to array indexes in the
supported_event_map array. Because the value of PMCEID[01] depends upon
which events are supported at runtime, generate it dynamically.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
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
index 50de58e4a2..32c3397948 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -993,6 +993,16 @@ void pmu_op_finish(CPUARMState *env);
 void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
 void pmu_post_el_change(ARMCPU *cpu, void *ignored);
=20
+/*
+ * get_pmceid
+ * @env: CPUARMState
+ *
+ * Return the PMCEID[01]_EL0 register values corresponding to the counters
+ * which are supported given the current configuration (`which` is 0 or 1 =
to
+ * indicate which PMCEID should be returned)
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
index 75f054fe79..68e9743606 100644
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

