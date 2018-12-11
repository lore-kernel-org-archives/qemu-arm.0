Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp708371wrt;
        Tue, 11 Dec 2018 07:20:51 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UZFuwM+gmgnmXl5nb/3oMhjvEjuT7yT/UOl0cNJ1azaRVhfdZ+2MFcDtR7ML/7i4wI4hYi
X-Received: by 2002:a0c:fa46:: with SMTP id k6mr5064374qvo.36.1544541650981;
        Tue, 11 Dec 2018 07:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544541650; cv=none;
        d=google.com; s=arc-20160816;
        b=Yk5anFQbtQ4uhYb/mf7BfS34OWiZZxXqtgBAnj9WFnnWS24SesI/AwJZAhLdHEwm9q
         9AGI3YCfqVQuD3+XME7ildRyW/1QbUw5BUmwje4l5IF1G0sOApfzZzh18Ru2HIe0OrGk
         WH/mVAvPCJ3nDzig36h4dvDH/Z/oVngr2BEcFon4W55xJrK3+xqzn7WXlnjyzPn1EO74
         E9u1/ZnX9w5QX/z7OXx269Qe9gqkKr2Nb9sjkvW17YFzkBv0m2MeGpwbXJeeXurDuiUV
         Er9PuYz8bVbWOG0Q+l+X7NebA01xvfmobBVQ687yIO1nnqgiP0kGC9mbPVcDlRE7eOx1
         xOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=roUJBi9hvYcNY8czGNrJxD4pfxhq6rTKR688R58RdI8=;
        b=se2kC0zOuRHIzM7nJCa29hD0kR9pWUyxiNHEm1ulwV4Et+w/1bFUsOqbLnaAoWnIWl
         5sTaKorA6vYNhqeo5namMn/vsvOI1ZLeWoVsSb/2UlRa3FMdM6oKH96AmMYvZO/jDrpH
         nLGnJt5Xc0xnbzZinUqcudMj4BRbdB9j85RafCvwD4+7wX/wCmPcEd8lpn+CVSce6dqQ
         M+P89RJtNRn6zZZO903/z4Jkr2MVXr5OXoab0hnStZjWoMdcP8wlSXL4vySxbDxTh+XZ
         imuKNpFid+W5gl3jSh952I2vOii74aBRlrCH4CHPgI6R8JYbNiT67zsjP30XSv0hLYk1
         gI8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=aot2IiKW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w90si6839289qvw.209.2018.12.11.07.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=aot2IiKW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjq2-0003tz-0h
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:20:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpm-0003sR-VX
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpi-0001N6-Si
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:30 -0500
Received: from mail-eopbgr740122.outbound.protection.outlook.com
	([40.107.74.122]:12256
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjpi-0001La-Ii; Tue, 11 Dec 2018 10:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=roUJBi9hvYcNY8czGNrJxD4pfxhq6rTKR688R58RdI8=;
	b=aot2IiKW1Cyl+2RfFmgPkl8CMdbRSO5ezcS77AQEHnstg3IRjCisAaNG8Ec8cKkqVP0JjY/bOgZqxajYONbI7S4+1NX+H+GxBeMTtLIqlO9XGsq2QUAfqy0p/fUwisaRBFEuCl5RJNQP2lnyB1aiR9r+zsJOF1LZmuQkdqwj2uQ=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4604.prod.exchangelabs.com (20.177.216.81) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.22; Tue, 11 Dec 2018 15:20:21 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:21 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 04/14] target/arm: Filter cycle counter based on
	PMCCFILTR_EL0
Thread-Index: AQHUkWUIgARRWrCVCU6Eily/oAhiFQ==
Date: Tue, 11 Dec 2018 15:20:21 +0000
Message-ID: <20181211151945.29137-5-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4604;
	6:VWt3Wm1IocwvyPz/V2wXKiVeT9zswzYye4tpQUH3ohqu6REEe0TBzEtMfqm/ZVB7fmsIMI4Xm0NnTa+q+HeSl2abElrzE1HXmZSb+y7nm9egzT/+3df8AXyDMZlOH7J8atJIYK3hVl/uno876IfY0+UqJaIksr/fucOK6caqyDQAB4SpvU8o0uskQDLW/F3Kvd39CuauZCouq2Z685EC09tR3vhlMei1Z9+OLs52+4uLJf7AggQ5IS3zPZYOVB6XlIDaSrN2tFtWsU8wYP5q4Y2/vGRs3Rzv6YqOB5VBNo+i/pGWhSPhEUgi2xmMIYfUFnVRwNBqOWXEYgM8XZA5wiGrXMehoVqYYkItOlskPbSSDr7uvmL9OD2VGW0BKyPg3S/jF3oGJc4ctgV47kdpsRNtsd1EV93OVk9wDbPrQSax5zDEisYwApGjnmiBrSP/CsYJDVQE0FdizhFDzIkFpw==;
	5:+I+N+cxarrM9+7Jzb3kFoYvqll0FpHVYTxlIUV8pZaZG2tSKhHkdp9+eiXIVl8ViVtHVkcK+s+KDUuBV8vfjN+hmSUhWJAtwbAnTqbDG/dMtSynBKx9eHJS3gNTEEGCe4/39r70uDVKmfpbuLCXJ7z3FvggrllHSuhgrsFfof+U=;
	7:lQ5hBRzrFoYP7HmVJMEhJvYvcmY1cAMpyE1wPVyZJpHsGijLNPIi8FGT/YTe5FuGnnyxkVIEAxjx0csBESGCZelSlf3PwO8Ji8JIWiVe7fReLZ82zRGq0FD/BtW9lnEWlj2kBLLv+OR1Lg8S7t9I4g==
x-ms-office365-filtering-correlation-id: 47bb8d63-27b3-4721-5cc0-08d65f7c2a8b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4604; 
x-ms-traffictypediagnostic: DM6PR01MB4604:
x-microsoft-antispam-prvs: <DM6PR01MB4604ECB10377C2A2692B465B8AA60@DM6PR01MB4604.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231455)(999002)(944501520)(52105112)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4604; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4604; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(376002)(366004)(346002)(39850400004)(199004)(189003)(97736004)(1076002)(14444005)(256004)(26005)(25786009)(7736002)(53936002)(2616005)(186003)(86362001)(4326008)(446003)(11346002)(305945005)(575784001)(105586002)(106356001)(476003)(486006)(7416002)(5660300001)(102836004)(478600001)(8936002)(316002)(81156014)(81166006)(8676002)(2501003)(6512007)(2906002)(39060400002)(54906003)(110136005)(71190400001)(71200400001)(14454004)(76176011)(6116002)(386003)(6486002)(3846002)(99286004)(6436002)(68736007)(66066001)(6506007)(52116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4604;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: AQh2+Ng5W2qlr3tjubhWfh5AY/BU/oK09rOAgQaSzYlNujj25iDZXVCkQibFDzGUdVEioGvGp/igfS0dZSmIcuAS5/66Ava7RZwn/oBqcWJUz5QXrVb06CRgg6xSdvhpo1yfzgV874qdoycK9xank/tW/8cwES3M+iuaPmv3jUE3lleTUUN3uZ4Q46qGYtrEELfeSk/UCWy0QEuVnN0NINmc2kE6kvu1E0p8ImhFIKOQ6+fHFUtrrKGTcce95rdly3LCOEQxJIh+F/YOTaCutuhf6M7rjVE9nOK0Oeby9bsyUxRL5xCR0wVZWpt1q4W/
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bb8d63-27b3-4721-5cc0-08d65f7c2a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:21.6988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4604
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.122
Subject: [Qemu-arm] [PATCH v10 04/14] target/arm: Filter cycle counter based
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
X-TUID: I3Q41LUzUy0O

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
2.19.2

