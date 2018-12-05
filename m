Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9395675wrt;
        Wed, 5 Dec 2018 05:44:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VUjH86orioyA+aDlgJFVjduf03Djias6/xpLB3IR6aE0EA/4xvQdJTdlvrLOzpXWWVxqhW
X-Received: by 2002:ac8:26c3:: with SMTP id 3mr23825905qtp.179.1544017494619;
        Wed, 05 Dec 2018 05:44:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017494; cv=none;
        d=google.com; s=arc-20160816;
        b=KRYDF6Ng75bx83gRpz6Ela8Q+31QR2sC/ebwqdPIuw0k1qPeIeBNMnT6QqdpZgQcfH
         y1Y3RRBeS4isgb6/qd7lG1U/pwJmj5NIQIyexZFetTfsjDtgNvAuIdcusHCbGiqiEFHS
         Nrwfv1VMBKBIhT4nzWwG3pd25jkDK3N42CoslAezlSuNwX+cyi3KAnS0T3OFf3QIPqT1
         1RAWK7Ttid2GRLnN0B51q5EIrtOqdd9RiYO3roLnBBJx4eGs5VyvsNSE37O312rTDyiY
         Bker9yOmOCf0XwbMiNyPw+WHMc4sJF4igInqheue63ZX6bOFOLgdlAW2LxLd9VVd0Bh+
         cbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=H+4A+wFBmuvVssaHZTtbIypoPXD7UJkxaa5EwTasED0=;
        b=g+Z/SipX90saUkpfqSVA1KleWcgjhfkbja9hg/8kT0TZWGBMtxq4TfY7Ak+EmCVJ0d
         +rus8/o8nEK0Wz/CNpSK5YzyUN45x3OBCqfkSOzW6UuytiXBPD7PdWDw3NmO1NTaWPUK
         HKTi9dEWdm0wie5vTCrR9Q71uMceYRQdm2Kj56hpYyuK7gA/4WuFRaeCg4gSsMJZmJws
         buVlYYey6NxFP2Dixu4m61qlyPKPNnyMaNG5gVITXUmQUZVg7zZ4VoEXiJfx0/wDuo5D
         b09i2tip/TLyC/pjBdPtaQqb9oc9TNlYJ0NkV9jaFmMJLtdoE0+3w5lx+XmbM6Bs9w+J
         ewog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=obtcDdKR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2si1262318qtq.4.2018.12.05.05.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:44:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=obtcDdKR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXTx-0000Dg-Iy
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:44:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSZ-0007Xd-Ot
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSW-0004f0-78
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:27 -0500
Received: from mail-eopbgr700125.outbound.protection.outlook.com
	([40.107.70.125]:10909
	helo=NAM04-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXSV-0004aK-VA; Wed, 05 Dec 2018 08:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=H+4A+wFBmuvVssaHZTtbIypoPXD7UJkxaa5EwTasED0=;
	b=obtcDdKRJgNJ9tpbWing1h5qpXo5YA+Tvy/rDViWOok8t9xzrbzpCw4JQZaFnqkzdBORQ8RggwbdAXGCQG4gS3p4MIidjNrGqPB9hXo0nTYFTBaakJmzdiUEsVn8j0ihtOm6F7Rxd4oa2wDSL8mSInXL3UOLRwcT4RGGM5y1Tq0=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4700.prod.exchangelabs.com (20.177.217.81) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.22; Wed, 5 Dec 2018 13:43:20 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:20 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 04/14] target/arm: Filter cycle counter based on
	PMCCFILTR_EL0
Thread-Index: AQHUjKB6UrXtXqjnS0mon7f8aIsO3w==
Date: Wed, 5 Dec 2018 13:43:18 +0000
Message-ID: <20181205134243.4791-5-aaron@os.amperecomputing.com>
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
	6:F+JCOJyAyjSaiGYgEQ81XvRa2D8Ic6CtDlxQp6fkZ+1EUSSxjMABmUzXk99qF9doXFRlBwfbDCotcsAKA6zGapm+hcLvNxhfg61Vk2hgaS0X3cLhR9fUtAm++9D7rgq1hvZuPjDvzFmnq6g1serWufoehZPAodN7P2YCUEeRwJ046+XjuhgDVQRooxuhNZBT7vpXVbK7ZIqIBFbVt1VqlPTB8ilMEeWf9zT0qeMQ2sX7o1y2lWpB+27is2KfUKpn9wn69nIc7z4i+WAz37vVFFv7sXDqSU79jWSk2zmuSnEgkUwOZzRcCKM6h9d4Ornb0YsDyR8+6LluUflwiBKx4k1/aDx0gCOVgXS81JDGU7Yn+QCR5IF/VHfWnp7AgonW5rnzALSI4ezfJx5n4jD4zB6yht1LU8cKhyEyLT2oL3SuHPKmzwgOrqzr/TNQMFcxxa1mNMc4EKYveMffQH1gvw==;
	5:WJGUNCK9/PAyhQ7wCIMFJqH/LN1gjL+6OOvN7Mx2+MRp2PsqeEc+WaDw+Na0+8AXOmN8gCJTdmEfUuPki3ROdM+e2rCsqvZZ6oyHr/MbO8FDKUWWMZamu/vWq53MAXE3i+aePyphhWNxyeQkQwIapuF/FsYHkjtvllrXtyBhWwg=;
	7:8fngC6YvX5uUvgVEz/q3gbsLU6rX+nxZyZ+cgIVRM2FiUvJqpiMKkvW6DtrIOOuWdBohFhdd97b0TGtE/e0ryFTOmmDYTue0RcqlmUr/U+AqTfP7J9+2HWKbz4WOGHY+81kcao3X5qA2uf0Z69LGfA==
x-ms-office365-filtering-correlation-id: 7e706ad5-ff2a-465f-ce69-08d65ab79d1e
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4700; 
x-ms-traffictypediagnostic: DM6PR01MB4700:
x-microsoft-antispam-prvs: <DM6PR01MB4700AEC0962CA7DADE48678F8AA80@DM6PR01MB4700.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4700; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4700; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39850400004)(189003)(199004)(386003)(2906002)(6506007)(2616005)(476003)(97736004)(446003)(11346002)(486006)(102836004)(14454004)(26005)(99286004)(106356001)(3846002)(186003)(6116002)(1076002)(6436002)(81166006)(81156014)(8936002)(54906003)(316002)(575784001)(86362001)(68736007)(6486002)(25786009)(8676002)(7736002)(7416002)(110136005)(305945005)(2501003)(71190400001)(71200400001)(4326008)(39060400002)(76176011)(66066001)(52116002)(53936002)(5660300001)(256004)(14444005)(478600001)(6512007)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4700;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 3Dcz9YuejQNLldcu/zX8dXw/18YawFVcDA2PQMquvzNz433bg0FwNvfOLFUgJnW4lulJ2wpEZfjpbFPh+QHSc+aZEPwZ2VAodlzGP+4INId9SuH4VJ5gqAFlLievL6NGVBrH1uthY1eTsWN+Ob0nGkCrgYbN6v+BmDYUS/uaPt0Dpgd8K2XaKauz2QxCSzXQ0+bfSGSHFh1l9chCCKuYhs/EA1Ht3LCdTkzz1Vj6pJd7Cf4Q8jNECwc+ArwSGrB3aj618IBY25euhVmoVrOMU1fbqol4xrIm6pur7DDkrVGIy4zmaMDLie/ULmusndxoVv9DriLJni3LoneqmzsdPFnBKoUbG+Tc/7QtbMG2XAA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e706ad5-ff2a-465f-ce69-08d65ab79d1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:18.3091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4700
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.125
Subject: [Qemu-arm] [PATCH v9 04/14] target/arm: Filter cycle counter based
 on PMCCFILTR_EL0
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
X-TUID: dVLidRXnaFNn

Rename arm_ccnt_enabled to pmu_counter_enabled, and add logic to only
return 'true' if the specified counter is enabled and neither prohibited
or filtered.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c    |  3 ++
 target/arm/cpu.h    | 10 ++++-
 target/arm/helper.c | 96 +++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 101 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 60411f6bfe..f7bad04f60 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1020,6 +1020,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error=
 **errp)
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
         cpu->id_aa64dfr0 &=3D ~0xf00;
+    } else if (!kvm_enabled()) {
+        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
+        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
     }
=20
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 61ac458627..627e5c1995 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -987,6 +987,12 @@ void pmccntr_op_finish(CPUARMState *env);
 void pmu_op_start(CPUARMState *env);
 void pmu_op_finish(CPUARMState *env);
=20
+/**
+ * Functions to register as EL change hooks for PMU mode filtering
+ */
+void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
+void pmu_post_el_change(ARMCPU *cpu, void *ignored);
+
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
  * for both old and new bit meanings. Code which tests against those
@@ -1048,7 +1054,8 @@ void pmu_op_finish(CPUARMState *env);
=20
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
-#define MDCR_SPME     (1U << 17)
+#define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
+#define MDCR_HPMD     (1U << 17)  /* MDCR_EL2 */
 #define MDCR_SDD      (1U << 16)
 #define MDCR_SPD      (3U << 14)
 #define MDCR_TDRA     (1U << 11)
@@ -1058,6 +1065,7 @@ void pmu_op_finish(CPUARMState *env);
 #define MDCR_HPME     (1U << 7)
 #define MDCR_TPM      (1U << 6)
 #define MDCR_TPMCR    (1U << 5)
+#define MDCR_HPMN     (0x1fU)
=20
 /* Not all of the MDCR_EL3 bits are present in the 32-bit SDCR */
 #define SDCR_VALID_MASK (MDCR_EPMAD | MDCR_EDAD | MDCR_SPME | MDCR_SPD)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 71a5c71e0a..ddb47813d2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -976,10 +976,24 @@ static const ARMCPRegInfo v6_cp_reginfo[] =3D {
 /* Definitions for the PMU registers */
 #define PMCRN_MASK  0xf800
 #define PMCRN_SHIFT 11
+#define PMCRDP  0x10
 #define PMCRD   0x8
 #define PMCRC   0x4
 #define PMCRE   0x1
=20
+#define PMXEVTYPER_P          0x80000000
+#define PMXEVTYPER_U          0x40000000
+#define PMXEVTYPER_NSK        0x20000000
+#define PMXEVTYPER_NSU        0x10000000
+#define PMXEVTYPER_NSH        0x08000000
+#define PMXEVTYPER_M          0x04000000
+#define PMXEVTYPER_MT         0x02000000
+#define PMXEVTYPER_EVTCOUNT   0x0000ffff
+#define PMXEVTYPER_MASK       (PMXEVTYPER_P | PMXEVTYPER_U | PMXEVTYPER_NS=
K | \
+                               PMXEVTYPER_NSU | PMXEVTYPER_NSH | \
+                               PMXEVTYPER_M | PMXEVTYPER_MT | \
+                               PMXEVTYPER_EVTCOUNT)
+
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
   return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
@@ -1075,16 +1089,66 @@ static CPAccessResult pmreg_access_ccntr(CPUARMStat=
e *env,
     return pmreg_access(env, ri, isread);
 }
=20
-static inline bool arm_ccnt_enabled(CPUARMState *env)
+/* Returns true if the counter (pass 31 for PMCCNTR) should count events u=
sing
+ * the current EL, security state, and register configuration.
+ */
+static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
 {
-    /* This does not support checking PMCCFILTR_EL0 register */
+    uint64_t filter;
+    bool e, p, u, nsk, nsu, nsh, m;
+    bool enabled, prohibited, filtered;
+    bool secure =3D arm_is_secure(env);
+    int el =3D arm_current_el(env);
+    uint8_t hpmn =3D env->cp15.mdcr_el2 & MDCR_HPMN;
=20
-    if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31)=
)) {
-        return false;
+    if (!arm_feature(env, ARM_FEATURE_EL2) ||
+            (counter < hpmn || counter =3D=3D 31)) {
+        e =3D env->cp15.c9_pmcr & PMCRE;
+    } else {
+        e =3D env->cp15.mdcr_el2 & MDCR_HPME;
     }
+    enabled =3D e && (env->cp15.c9_pmcnten & (1 << counter));
=20
-    return true;
+    if (!secure) {
+        if (el =3D=3D 2 && (counter < hpmn || counter =3D=3D 31)) {
+            prohibited =3D env->cp15.mdcr_el2 & MDCR_HPMD;
+        } else {
+            prohibited =3D false;
+        }
+    } else {
+        prohibited =3D arm_feature(env, ARM_FEATURE_EL3) &&
+           (env->cp15.mdcr_el3 & MDCR_SPME);
+    }
+
+    if (prohibited && counter =3D=3D 31) {
+        prohibited =3D env->cp15.c9_pmcr & PMCRDP;
+    }
+
+    /* TODO Remove assert, set filter to correct PMEVTYPER */
+    assert(counter =3D=3D 31);
+    filter =3D env->cp15.pmccfiltr_el0;
+
+    p   =3D filter & PMXEVTYPER_P;
+    u   =3D filter & PMXEVTYPER_U;
+    nsk =3D arm_feature(env, ARM_FEATURE_EL3) && (filter & PMXEVTYPER_NSK)=
;
+    nsu =3D arm_feature(env, ARM_FEATURE_EL3) && (filter & PMXEVTYPER_NSU)=
;
+    nsh =3D arm_feature(env, ARM_FEATURE_EL2) && (filter & PMXEVTYPER_NSH)=
;
+    m   =3D arm_el_is_aa64(env, 1) &&
+              arm_feature(env, ARM_FEATURE_EL3) && (filter & PMXEVTYPER_M)=
;
+
+    if (el =3D=3D 0) {
+        filtered =3D secure ? u : u !=3D nsu;
+    } else if (el =3D=3D 1) {
+        filtered =3D secure ? p : p !=3D nsk;
+    } else if (el =3D=3D 2) {
+        filtered =3D !nsh;
+    } else { /* EL3 */
+        filtered =3D m !=3D p;
+    }
+
+    return enabled && !prohibited && !filtered;
 }
+
 /*
  * Ensure c15_ccnt is the guest-visible count so that operations such as
  * enabling/disabling the counter or filtering, modifying the count itself=
,
@@ -1097,7 +1161,7 @@ void pmccntr_op_start(CPUARMState *env)
     cycles =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
=20
-    if (arm_ccnt_enabled(env)) {
+    if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles =3D cycles;
         if (env->cp15.c9_pmcr & PMCRD) {
             /* Increment once every 64 processor clock cycles */
@@ -1116,7 +1180,7 @@ void pmccntr_op_start(CPUARMState *env)
  */
 void pmccntr_op_finish(CPUARMState *env)
 {
-    if (arm_ccnt_enabled(env)) {
+    if (pmu_counter_enabled(env, 31)) {
         uint64_t prev_cycles =3D env->cp15.c15_ccnt_delta;
=20
         if (env->cp15.c9_pmcr & PMCRD) {
@@ -1138,6 +1202,16 @@ void pmu_op_finish(CPUARMState *env)
     pmccntr_op_finish(env);
 }
=20
+void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
+{
+    pmu_op_start(&cpu->env);
+}
+
+void pmu_post_el_change(ARMCPU *cpu, void *ignored)
+{
+    pmu_op_finish(&cpu->env);
+}
+
 static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
@@ -1209,6 +1283,14 @@ void pmu_op_finish(CPUARMState *env)
 {
 }
=20
+void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
+{
+}
+
+void pmu_post_el_change(ARMCPU *cpu, void *ignored)
+{
+}
+
 #endif
=20
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
--=20
2.19.1

