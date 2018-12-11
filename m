Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp713006wrt;
        Tue, 11 Dec 2018 07:25:21 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vk+RfjNqn7oKpkHpbxRg3UOJZzWdRNftL2eD2VTCAVt8z5T0tEPC1T8ur0U2Y2Y3KPuSF6
X-Received: by 2002:a0c:ade7:: with SMTP id x36mr15285135qvc.66.1544541921629;
        Tue, 11 Dec 2018 07:25:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544541921; cv=none;
        d=google.com; s=arc-20160816;
        b=igtDPcwHMsC7CtHXnKu68vLW5UdntwJ/NFTWj8fnZW+PxkSScm+t2hJeDnN8D+H5mu
         5+wm0Yd/F5jSZtKHCXf5QYI459jnXE++v4MvgskpEMDQsTnZJ+h7YNnGMLWSix8BLiZE
         FEVsUM+KYF6nnQQHwkZgOnaJIa5HUIjZAH9CyYA4R/MBJE7E0SWy9rMNd96CaAEySGfa
         KMzSqGtMOUBdi98zOK4b9I5Ku/jTyqwIzf2d5He69HndtcVvW5HzWy4kuZqIA9P/mw41
         KMyn4v+Rn1gvlU+M+2PME3SD9KOsyzOmF7aDEBmV6oWo/7Y8H26MpvN4peJDJHRZW4q3
         DY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=9DBAAPSjAn6Er2LcibKA9rFBcFa2WxWdo67iFgCi4x8=;
        b=pWboFqaRTc1HIaftQO8nVWN82VqAa/vvK3CuYGvdooC9/9QOKYdoxWr7zGP4orCHA9
         yci74JqErUdyKbVJUoUELveEtBzqxME7iLY5X78/EHz9fYS5h6rEQjzGCDHIHIiKliGr
         0UY+jnGSR5x7xg6GM/rb3h4ZYmjkr+4zfmYF0jycqRi3uRcTzcEhkgZ6/PNn1Hoa5lNm
         PBbRozxX10udSIfDmSIleS/MOIxk7XZKG4f43vgngsnOFyqOV2t8ReCcBIvFWpjw61kd
         6I7+Q2JC2ZTCOAcfxyk2WlqU1qu0JV9XeJ/da7s/3xOFQ8NwDqtJn1i5NUycz1q9TFSw
         clOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=cC75B+ww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si3530608qtj.167.2018.12.11.07.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:25:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=cC75B+ww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjuT-00085b-1u
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:25:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjq0-00046B-VG
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpx-0001Y9-9K
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:44 -0500
Received: from mail-eopbgr810091.outbound.protection.outlook.com
	([40.107.81.91]:4512
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjpw-0001Us-Nj; Tue, 11 Dec 2018 10:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9DBAAPSjAn6Er2LcibKA9rFBcFa2WxWdo67iFgCi4x8=;
	b=cC75B+wwmmeB855t/GM4YYhvmgqTMICvXUoiYS4yG7cFoHestEqdnZ6EomHJlHU7LjJ/KWK1uqjTFMdRlQBpWRoccmL9MQN6/lxwjvbKRHtGySXUniJFKI5pefxkbQDqjJFQniLyEkp0Iel6lPOIZqSDkTFByLQKA3e0g9j6VQ8=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4601.prod.exchangelabs.com (20.177.216.78) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Tue, 11 Dec 2018 15:20:38 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:38 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 09/14] target/arm: Add array for supported PMU
	events, generate PMCEID[01]_EL0
Thread-Index: AQHUkWUSVo2ezY7070adgb7QGuE1Vg==
Date: Tue, 11 Dec 2018 15:20:38 +0000
Message-ID: <20181211151945.29137-10-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4601;
	6:fN1B3F7kIxYLC4+2uF4cjWMQ/Q5KOBnb5aL6ShXSzWOK0CCZalXTnVMIUwX40X4Ivl1Zg4vucO0JP+9r3brxKLO8vl7nFYOuN7LGXMVwa5afU9VWqRECxPM+7uRXYau8u+wWy7u/U3hl1Jy6HsjZPshMM00dRbdtjxKOPitNpDghzwKUV/FQWlX95JjWJ63fxQrQKz6kwSDg1OGhOFFPP4Z08/Dundf9ptEeCCML6R32ADOZUqrNnrKoSiYk8sWjQKk3udiXu4Przv59gtw63nEsrPFOoG+2QAUV0qlDop9S9ixHIQK+JMe9ClfEvjqk6rqf7mNZJ3INHh2oHLM5a+m6qhL9igygJfTODDbawxzpCFEWoag9z3nhXBr3df6uMMrJv24PZhdobiLAMsGr4K/YuJcXCxFjoJ6fgPel0tz+W+5ld+DCR+2r5B8fHsagcu6NzZlTRaOmcnLVxHAS0g==;
	5:ngXGXZdJvR7/iD1WYEIDNuBgIL9FFi3zmeZokkhWADWYhQwXBc0yvfNn97r5Qg0gLLBxdCtIOjycVtMfol69uCdlQn49Pvj73GCaLCIyNr+vbCMwzCMUM/Q9QgNdfFc9t2XNen2Q3ikyN4XkdtxJEwNJph3nZehVUBXTCSR6Coo=;
	7:mphzFJ2JsmdevMC0DwP9japwvXu1/Hpa8JiG16xK4y9kLQJ4f21R+lfSV6mKTAFf1TbDO0LB7Oo96AgWhaWVdL7vFHWTyHVnGbecacLgdu+Rd1B4fWuqsBDtu8cFrl97TdfTljzoaAoZ+Jc1u9LerA==
x-ms-office365-filtering-correlation-id: 567fa8f4-8ef4-4eb5-a172-08d65f7c346a
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4601; 
x-ms-traffictypediagnostic: DM6PR01MB4601:
x-microsoft-antispam-prvs: <DM6PR01MB4601D70A02B2461F481C1B628AA60@DM6PR01MB4601.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231455)(999002)(944501520)(52105112)(10201501046)(3002001)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4601; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4601; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39840400004)(366004)(346002)(376002)(136003)(199004)(189003)(66066001)(7416002)(54906003)(106356001)(2906002)(97736004)(110136005)(305945005)(105586002)(316002)(5660300001)(3846002)(256004)(39060400002)(68736007)(14454004)(1076002)(7736002)(76176011)(11346002)(2501003)(99286004)(52116002)(6116002)(4326008)(6512007)(53936002)(81166006)(81156014)(8936002)(102836004)(26005)(8676002)(186003)(14444005)(71190400001)(446003)(486006)(6436002)(86362001)(25786009)(6486002)(2616005)(386003)(476003)(478600001)(6506007)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4601;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: p86ss50hxRY1W1PYkLUJ3NVZqzbIrclJWp8ydjRq3zOwqw3AyUCojLxW77sbCyAlaCDPi7nF8ENg7iYZXcDCu8y6pAsU98lxpa0C+7QNw+chdhuW5/ZU+XU/oSAbl2I7/tlNvkuqgxMpe2SgL3Is6eIQLBKq4L7bckPpF7GwEgvuuGTmGZ+AgEBMTplh6tnUfVWq0J94OdiaGI/fwMW5Ol1xwpcyvWTzsP3wmsPbgRK4u4+JxaTUAYEL0LUmCCHhNh/Uw2u+3W0dxfjJ2f3MV0EbnxILw05gMuR5TwgGrbQhlYGa5RqZ1irKp1MbTZQI
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567fa8f4-8ef4-4eb5-a172-08d65f7c346a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:38.2146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4601
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.81.91
Subject: [Qemu-arm] [PATCH v10 09/14] target/arm: Add array for supported
 PMU events, generate PMCEID[01]_EL0
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
X-TUID: wgXsuh4xWnqz

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
index ed3ec81d16..b15d0383b2 100644
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
index cbbd56858c..fd2923f033 100644
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
2.19.2

