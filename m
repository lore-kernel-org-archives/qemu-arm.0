Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2944132wro;
        Mon, 5 Nov 2018 10:53:35 -0800 (PST)
X-Google-Smtp-Source: AJdET5che2VZ8Cho9AaCRr6YuUmvW9aZyAPBCxdSLDF8Dcb0r2CLqeJ7ppXrCtAGojfTbr/wDluA
X-Received: by 2002:ac8:3fc9:: with SMTP id v9mr22211744qtk.108.1541444015282;
        Mon, 05 Nov 2018 10:53:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541444015; cv=none;
        d=google.com; s=arc-20160816;
        b=u0M5G1E8ZhazGROWVIQv37gONGzNXTwiPLPg28WjRERaUevi4k9lKbsaVIANv7FyL8
         ICwRj7YdbyMnRa+2YjCTMHL0SHfNnRdw0q57oAYUVOiB0k8Bu3gGLUu3/ycMkOTRtKRL
         zxqIVHx3dIQ7NUR8absNhIeEjRanGiATeBtLeUiHegLQk4bzExaIGzNnuwCnjFTp1ldy
         Y1RNj01uSyxGQm3CLKJ7I/ycVy63Z0t3NSUmUyFYb+SK1HBdZQKBJgAZJPgSBwo4OS4Y
         FaWEdYhxdPmafZFRG/ish6QNi56FlhA8T4t+0DEggqF9VYoep+187jaEqjLyxeTem6A9
         ZFWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=jsbB/4XqCLScggS3LvMlNAztUBRjTnuKSmmi7DK7Zi8=;
        b=YUGbiYdj79LMIJ+otKZejjk0ZKZbWwrA67PMUcmcPJnXXBxyWm1gbQGKdlGaZqnRuV
         YpmdUIxtT3ehOd05Vfi74jqxSbxFVFsYNBSBAI389yST/z/FZ4fB9ImgRx9jenb6Kp8z
         CL37g/JrI/+XyHrqwv0yX6sLOSAP6ZFTK0S6cCBYhgSIVAzOHXcSCAqhq2HtOqpRLnD3
         Dnh8464n8VNGR4ZQncnoyq78s9gD+ahzZbdLHSidkwQZ1Tel2uVHrD+rvoavb3DYyFyw
         t/JHtopTQNzznVoLkT/PVMXjBlaZPApOScXV/uOISk8ruQP9y9jZa//8x0d7qZx3pWZe
         6oMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=O7fDY29l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d186si968714qke.78.2018.11.05.10.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:53:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=O7fDY29l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJk0E-0005Fd-Na
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:53:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyo-0004c6-WA
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 13:52:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyn-0000YK-B8
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 13:52:06 -0500
Received: from mail-eopbgr740130.outbound.protection.outlook.com
	([40.107.74.130]:9824
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjye-0000P9-HQ; Mon, 05 Nov 2018 13:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jsbB/4XqCLScggS3LvMlNAztUBRjTnuKSmmi7DK7Zi8=;
	b=O7fDY29llQsBcY5MYzkV3UbXQC0lq7kI+R48AEOwTMZVtTaJbz7kDo0H2iMGs6sNgOHOLkFpl/oyEb2/wfTFwX10a4/qN3gaeP7fTY7uvQjIJ6XDy0T51qMm5U7l7r2qkHLgrPyGBWVUApo+icYJBCFojZZZw/5w/z/fWpB1ito=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB3673.prod.exchangelabs.com (20.176.64.150) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Mon, 5 Nov 2018 18:51:54 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:51:54 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 04/12] target/arm: Filter cycle counter based on
	PMCCFILTR_EL0
Thread-Index: AQHUdTiecjKFylwejkm/zbVAiocjhg==
Date: Mon, 5 Nov 2018 18:51:54 +0000
Message-ID: <20181105185046.2802-5-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB3673;
	6:yHIjEKXpnypDW8cSceiWOVjZcKvWKX+eJqbwaYU8A9WGHlZvbTPFO4XOjrkxr46bC9Y1Jm+boYZXmh6Xgr8NV/jrQgEni3h9K1bpYPmU6dzcJylrT0c02H1lSH6JuwdLy6hW7lIlhKRZGK9/RZJfhUQSmyZLbuwTR6IHA1EHDmK35ppFE5XEHSkc5FvxWYCLutIrwGl9SlxgT7tRT4K/SiUvQ3IHIObeLvtHtSp+VLUQF6i6dKX0l4nAPBOTFJS2EsG6QcqIk2/d9xC5tZEwfUeQL6rLpaficKH5122fLmyMYcQjm5fJc7a2J5g60c9ezbeWTaglp46oiL5ezslwSTLMvRlOIIixEGPkRcWhOzKM6rIPGRw2MZvohjjOG7kf+QcOn3jEvvWXZdmwjk+SpuIO62qgrw8ILijlbT+ZfcVv4jLMhYj06f6Gy2nCxTaq4e/jA4AKNFJ9PoW5M4eoLg==;
	5:AevNfMBc/xuuoVHQoGioATK8Xsvs3wb3sLqz+SjlxmcqWVzr8HhqjJTZGfCqcYXkKqpMmT3olu2jhoQUwMbJ3dCxaUJNHPRHSFRM90jLbk2BopqesDelsLtdb81rLhPf+ApUUI5VjfkXzBoJpXozlzqEirIZrFd2t28B+JaTz+M=;
	7:sg2OvwgViELzIS0tAVQJ11gDB8lOGQKLwg0OBDIpmvAEb8uxyw5rdy0Rqs/LqHBEg/OXHAh8jXPUqVqnmuOezNRrcyi9gT2cJF4f3ZcwxuEBqAFBiV4dtaYngAmKN44/IyiifEk33rcU9GmmlXVg1w==
x-ms-office365-filtering-correlation-id: 410504af-8dde-4151-a19f-08d6434fc124
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB3673; 
x-ms-traffictypediagnostic: DM6PR01MB3673:
x-microsoft-antispam-prvs: <DM6PR01MB3673924439FF2596B59E6DEA8ACA0@DM6PR01MB3673.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(192374486261705)(163750095850)(85827821059158); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB3673; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB3673; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(396003)(136003)(366004)(346002)(376002)(199004)(189003)(476003)(76176011)(68736007)(446003)(14444005)(14454004)(186003)(7416002)(6436002)(3846002)(26005)(486006)(6116002)(478600001)(6486002)(2906002)(256004)(2900100001)(305945005)(7736002)(54906003)(8676002)(81166006)(66066001)(110136005)(316002)(81156014)(1076002)(6512007)(2616005)(11346002)(71190400001)(52116002)(102836004)(386003)(71200400001)(105586002)(106356001)(2501003)(8936002)(97736004)(5660300001)(39060400002)(25786009)(6506007)(4326008)(53936002)(86362001)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB3673;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: H4JzFrDksR0krVNsGPee8rqT6364dMYDVeUmm4cN7By4qT1paYRzXLmcd13hprVpyXkFe/ojbFAfEjRwQWKOMmEFlpqHu71l4bUlqKkTeGSAaWTY2v2L/WrTFSlg83vaE3tITM0h2F5flUGT98imZwq9KakKjrGRsHIKmRPK5KdMv39z/qptTDt2muwfaH4ktEAPLPf3Z2DycqN8d3O/AdupPspr/Qs6FvHlXeNfYMFvxoEGXP28HfdsUByWWzj/0ex7fhipstBpQTv3CLxzxttbyY5+NArxuegduUy+/lyBsSluZNh9lIxAvqxiPIiG8rk+QU8j2XfbjuoTYvClvZ8NdjC8IrSSoi/iHyFPXYU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410504af-8dde-4151-a19f-08d6434fc124
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:51:54.2805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3673
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.130
Subject: [Qemu-devel] [PATCH v7 04/12] target/arm: Filter cycle counter
 based on PMCCFILTR_EL0
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Aaron Lindsay <aaron@os.amperecomputing.com>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sdSAxKUFYLr9

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
index 784a4c2dfc..9e54c56379 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -957,6 +957,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error *=
*errp)
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
index 50a0862c84..92282cd976 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -985,6 +985,12 @@ void pmccntr_op_finish(CPUARMState *env);
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
@@ -1046,7 +1052,8 @@ void pmu_op_finish(CPUARMState *env);
=20
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
-#define MDCR_SPME     (1U << 17)
+#define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
+#define MDCR_HPMD     (1U << 17)  /* MDCR_EL2 */
 #define MDCR_SDD      (1U << 16)
 #define MDCR_SPD      (3U << 14)
 #define MDCR_TDRA     (1U << 11)
@@ -1056,6 +1063,7 @@ void pmu_op_finish(CPUARMState *env);
 #define MDCR_HPME     (1U << 7)
 #define MDCR_TPM      (1U << 6)
 #define MDCR_TPMCR    (1U << 5)
+#define MDCR_HPMN     (0x1fU)
=20
 /* Not all of the MDCR_EL3 bits are present in the 32-bit SDCR */
 #define SDCR_VALID_MASK (MDCR_EPMAD | MDCR_EDAD | MDCR_SPME | MDCR_SPD)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5deff3d11f..63d4e993f4 100644
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

