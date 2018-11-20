Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1071484wrt;
        Tue, 20 Nov 2018 13:33:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5cAgVeDd3h0TLVfpxM87jLKMRHIp+f38SV4FBGI0fTQNHBIyTUeWSuZ+OC2kETZSt8CQwny
X-Received: by 2002:a25:8809:: with SMTP id c9-v6mr3834351ybl.322.1542749628311;
        Tue, 20 Nov 2018 13:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749628; cv=none;
        d=google.com; s=arc-20160816;
        b=MMN9G1lNwIV+mQmHpelNcXg8HJjP2igieWnHVHGyVqLHVi2y0q16dNVNUWP9RVtgmU
         Qh8ns/BU9BtkF/LnR78J6abFBWatIahCIlMzH+vSC9xE4ZjXjIwNY1vS80CtlUyeNhIi
         QONRkf92DzSK/bx9VMuvay2o5c+9GAuV3PYz+0aJITKgcRDEK6SFsENHsDHx6Duj+53m
         xlF1xE480g5s8nhztpfuz+QcXqJtxhRXJxCCxx21ENDGkGcgQJjFha2zqsFM1/HOjfuv
         Krv0Yr2SBZ0cF7zH1VojP4veTzBongmz4QN5i0LqFIf2XUVmmcffJDC2QEOBjfYLyWtF
         PA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=H+4A+wFBmuvVssaHZTtbIypoPXD7UJkxaa5EwTasED0=;
        b=QNpXQSWCrFwwgdx4Sgz4RCA3WiiK1UaBaxWHMph5ueTcStrQ8RDerKOh9gcl9I6xut
         bdv700ajQMoBPBeM0fDeQ8HnC8nIspHSUbSl6KO6dl/t4QRAHY+0cyU0XtUAWekztYOn
         zQXJKLqVJa9v8Yk5suuVnff6KmUecLgHoEI6qrdlR+aKR49BNAl9vc+X79oue1xGHVVh
         QeRoq1Io9DuSOS7kw4SJHWDAFIM+q7f/g6cL1OnNFEbPLj15c22Dyx6bHtN/DOUa7mk9
         bSe+lknMOm5oQdvytPPsD+mGoHjYP6taPjwmzF475lxUisl+yHYkVZlw8gm8txKk4cD+
         FRvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="Kahl/3CJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si7307838ywa.13.2018.11.20.13.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:33:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="Kahl/3CJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDeV-0006CB-LT
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:33:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXk-00005v-8L
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXc-0005SL-O0
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:48 -0500
Received: from mail-eopbgr740133.outbound.protection.outlook.com
	([40.107.74.133]:63072
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXc-0005JL-9I; Tue, 20 Nov 2018 16:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=H+4A+wFBmuvVssaHZTtbIypoPXD7UJkxaa5EwTasED0=;
	b=Kahl/3CJ/h5gj+wyQ2pzsf79DVuAovr8mQkxfo3/zzYMqPRMiroAuKdodXEeRDzJHZ05Jmaajdnom0ZS5AlwR+EyUvSDDduwsNEAfa9J7BqRn3+lGUIMh0G0iksmCh0v1087Y2ZMXDqve5c2WSqu6lBlfYW22kqVm4tXOccwFPw=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5228.prod.exchangelabs.com (20.177.219.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:37 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:37 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 04/13] target/arm: Filter cycle counter based on
	PMCCFILTR_EL0
Thread-Index: AQHUgRe3bO5pzrnUoka8VOSyEOi3nA==
Date: Tue, 20 Nov 2018 21:26:36 +0000
Message-ID: <20181120212553.8480-5-aaron@os.amperecomputing.com>
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
	6:l/BwRNxX8fEDRUHd1+JrNWGKH8Vs8zAO6AcvCW1TpDaJo71o+bX/H+t2PQXlUp8GENwYDZDE5mc5q1Mq0V/S1Hgq6kQZl2MetZaSh+uIRorgujmgoZ/qseNy9ctS7OzunHBKYn6I7baD323P8rsyCSQPrLQnHnc+FIXDTCYe0YA3kA8nWklC4xAvK995Z1FLfmBfDUvk/R+h5GGfHQrgeMIh1+M/HVLB1BnyA8P822MTIb+yo9ZYyZBU1UQ1No20SnPo9jnvU/BQ3yEYWiHZb4EyAEelIWyRpbYo2FlmOOiJzcZdEa0V3a4Ny+jsDgCIhlRVZ0VoMfBWirjTAHw6zDSyZAES/Dvgl/9qxI5w6ssF/iq/M7SAwjwhHo0sOYEv1kV+iUJXbn736+9OPac3rQ6V4yPSriv1hvKqi4eyyiSwySC6GSUjS1P8bi6G6BA+Lo4m0IfdG4yf6ODX2eWUng==;
	5:kch9Ss+g44xsL2/hILRiE3vOtMWhscQu82nyjNuMmI22gpkBlg23mDPwn6UGQoclvPClk7ORA+P87bB5Mv7GyzO9s4RWpTMC4OIxVRP0ScZJXGSnKDdJ9EmKB0wfz49wwX4ltknPnnEWoeLTa/1IuMcj9qQKKrU9DQCJBV3KO5s=;
	7:XmS9mutKYgCUW1aht7h/kzup74U36OyuAkctknNTC9b3qA4ZcFhPLZ9jvOCUPvAmfrvN/YcjMlayH6fFyYKvP+FI1ZGHXFnPVI/OcCXVQzfIExdSnRm532wX4vJ+4ulArSziBTMrZx48ng2agOoXbA==
x-ms-office365-filtering-correlation-id: 0f8c6c3b-4c98-429c-2715-08d64f2ed9ff
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5228; 
x-ms-traffictypediagnostic: DM6PR01MB5228:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-microsoft-antispam-prvs: <DM6PR01MB522890DA9824C140F11DCF568AD90@DM6PR01MB5228.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5228; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5228; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39840400004)(366004)(396003)(136003)(189003)(199004)(305945005)(4326008)(39060400002)(71200400001)(7736002)(71190400001)(2906002)(6436002)(7416002)(14454004)(3846002)(6116002)(14444005)(256004)(1076002)(86362001)(316002)(575784001)(11346002)(6486002)(446003)(2616005)(53936002)(5660300001)(486006)(110136005)(6512007)(54906003)(476003)(478600001)(186003)(2501003)(66066001)(26005)(97736004)(25786009)(76176011)(68736007)(6506007)(106356001)(99286004)(105586002)(8936002)(386003)(81166006)(102836004)(81156014)(52116002)(8676002)(2900100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5228;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: V1NASTeD8AJcywIOUbGKNO/k4k2kaMUepANkiS80CXFOXNLgzpGJ682k2LeZPGW0SWggOswzmfTnqUl8vf4sKRJBXHgUB8GfZcsHw0Ivw0/V5mewwiUqnpub0dU+nJfAvTwdwAL7vBKWqCZV/SZMo41Qrc1j4tUIbWSh2n2lKHkphqmqvBI0tUn5UswSXjbsjuquXPJDt3jKsRhI8reyott1vUip2POOXB0cd/DwLftyt1xN4nhwFBbADzVlL7GI01KDp7N45jawb4x08q0LRsBfpvZ4UyEL/AvZ7nankZAY1eN9qQl6rDc9rO5LDKr6hQjhTQkqKLhKeyGfE7tv/mM3N0UAm6OidSMpjd1lro0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8c6c3b-4c98-429c-2715-08d64f2ed9ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:36.6158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5228
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.133
Subject: [Qemu-arm] [PATCH v8 04/13] target/arm: Filter cycle counter based
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
X-TUID: vb+CyVJk7JOn

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

