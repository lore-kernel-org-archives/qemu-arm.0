Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2123715wrt;
        Thu, 24 Jan 2019 08:29:28 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6xFWGU0Pnae1bGhWYGBOUUz9S6YWCqm4/Vw2g4tBpoTMPEX0vRceEhWT5NpeKe8t3KLASA
X-Received: by 2002:a1c:f518:: with SMTP id t24mr3384135wmh.26.1548347368010;
        Thu, 24 Jan 2019 08:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548347368; cv=none;
        d=google.com; s=arc-20160816;
        b=DgBqdumosORTfd5sPvRaGvuhStfxDbbHIn47XzEYGPFgMv2ofEskLc1pFVcj1qT1AX
         hjYZQdNrOH6atZTfu6JdbedGjxju36dyLgBLWRaSpDLMHvmbZmt4i8Uvv5v/jlyYbz78
         PXpRDfb5AlZ5aLbU6Gp5Qgivw3wkaJ7Qn22B/zyMBgK0rDritaRNO/0BmjkybZ/UzHOY
         H9AtJWacW2dyGRLG01Vk3UAEUh89p17YI2LYjYAbMZJJJ3BZ8rmvnsyTGYrFs2floaia
         Xm5mo10NTS+FEff9CbsZ2zPStF4mcJYQRJbFu8mYwWtBM6oJlqUvn7cPu379M0Ci7kZe
         FKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:dkim-signature;
        bh=TTWWewec/uFcF/wTqM7a5Wp8aTnItReBn34p5o0ij5g=;
        b=b7Ftg7QJG3SwcZKxB5Lni3CIcIOQOTAP7gUTHTKkVYNO8UWfx3TyThKuKQGM0JWuI4
         UzcHVSl3w5X1JSiTTjgrP7H9T31KPN0PFpt8XM3qdBPlghgIMfCoL78KAKy0nXz/xgRh
         JHadF8tER5YMiNKlnX8jiDHhKOSoep1miWIttjRoG3eD36qaKF0DqZeGy8SrWfTg9aqT
         THCztDZM5HaTNzRY+VVDz/m9AVbH0tqxKNDQAld65rSLH5iKMbB+wpRsLCY0pzoY1oEU
         yyFty/q2zsU6G5jv1hQ2CLX7+xgMXG3tLN4rXXqu+JzMVjTGU05bsSGGonwFN1H25XxG
         jMXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=hBx85fzl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si39590473wmf.86.2019.01.24.08.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 08:29:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=hBx85fzl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:56485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmhsc-00076l-Uz
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 11:29:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmhnz-0003dr-C6
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 11:24:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmhnv-0005dY-QO
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 11:24:37 -0500
Received: from mail-eopbgr780110.outbound.protection.outlook.com
	([40.107.78.110]:34663
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gmhnu-0005HJ-2m; Thu, 24 Jan 2019 11:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TTWWewec/uFcF/wTqM7a5Wp8aTnItReBn34p5o0ij5g=;
	b=hBx85fzlFwFpVxmcAb0A7JylEg1hVaTw2cGI4ap4fqEnqLj6yc1MXqyszOiCKa3cBCuAKvDX0k2vhDnOnAhGSqEJMBsmy8JIBRecvI/iUBoFOLho2gOIcC1CXm/eeuwNVdcLDXAVDsMTZ2xFr8vsZs9cp/C/M4hGYuz5jkdOvro=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4442.prod.exchangelabs.com (20.177.222.13) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.16; Thu, 24 Jan 2019 16:24:14 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1558.016;
	Thu, 24 Jan 2019 16:24:14 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v12 1/2] target/arm: Send interrupts on PMU counter
	overflow
Thread-Index: AQHUtAE/itqVmv0j1EODz/g42k16HA==
Date: Thu, 24 Jan 2019 16:24:14 +0000
Message-ID: <20190124162401.5111-2-aaron@os.amperecomputing.com>
References: <20190124162401.5111-1-aaron@os.amperecomputing.com>
In-Reply-To: <20190124162401.5111-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR18CA0050.namprd18.prod.outlook.com
	(2603:10b6:903:13f::12) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4442;
	6:7Vk2m+uLdVrkekbC38hkhVz3JTErJ+Q9dV5o9dL4YKnXiYCysmLN9mqrarSA3ftM2rqIydQDcr8d1Yr1s3oth0bpPrqM+SzgJDj8goC0gGFX/2eN3zfpAGkh2F2ziV4KycuZEWt6T58UQhtnhjPVbpIwM/5OcqprrKvwRIgMdw0aBYGS6pfBrHhipzZyNB+sDPVA4s9Z8J4fBSb0VbMUhJ1Q7U8TECjbpBdd0Tadrv02mDiZZgWxe3ZrFPMvl0/xR8EYWR+tq1sGfahDKjcE1tEyE/bevcbfaFVzh5JhET0/9mV4mxdg4sjEIU563m9bacdQI9JcKEeUFHqNu+kxNfqkzPC4SZyUZF6X3rXPQr8R32MggaBRozCURZ5+Me4cBDZFs5+15VGbAwGAGbkxnKTvNRoFiroBLcVSsELw3/rXOosSRnsUPOcQHLJWnN5iwevs5Z/IJCoPK7L1XZyPbg==;
	5:7rO7iF4VQQ1ff30E1s3imAT1nl+pHDVHfW0Ct8o2C4FyoGk1Xizh7TTHo7yfqcmXfMurq3jn/3kyu/sGnYyvEtxOgHPXkIffl7ukSje3/UACe6eMaD1uFCebNXyOjaY63VyNQHoYoIGIkMSfDJCapDOR+cFVF1irA3SX9lQKjApNx3c34o6g3Xd6y80gOQ2xrY/pnRcEIqZ2RUOvLhltYw==;
	7:ts8slrgYzkZF3k7T7JKzdgDJzTLGGPgOGkEvK6LjmrVg78AkZpjugWClJqpPAN1xRdwXLZtz13LmouTWxNftQXIGGO029NDph7mqFs1greVJAsRaV/Oydr7tHloH+hUZ7stTH6uNlloxLGxIm+QrtQ==
x-ms-office365-filtering-correlation-id: 08e89904-f30d-4a9f-915f-08d682186150
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4442; 
x-ms-traffictypediagnostic: DM6PR01MB4442:
x-microsoft-antispam-prvs: <DM6PR01MB444289B34A42C648562B3E318A9A0@DM6PR01MB4442.prod.exchangelabs.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(346002)(376002)(396003)(39840400004)(136003)(199004)(189003)(476003)(26005)(86362001)(305945005)(76176011)(71200400001)(71190400001)(8936002)(386003)(6506007)(2616005)(25786009)(2906002)(6116002)(2501003)(3846002)(11346002)(66066001)(186003)(446003)(6486002)(7736002)(14444005)(14454004)(256004)(8676002)(478600001)(6436002)(54906003)(110136005)(39060400002)(52116002)(6512007)(4326008)(99286004)(81156014)(81166006)(486006)(107886003)(97736004)(102836004)(68736007)(316002)(106356001)(105586002)(1076003)(50226002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4442;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HDAv02YpyFilNNGwPX1gKE3yz4plzRvm6NiGyYhZy86kWV9fuBCO16KkiRX1hhDP/xio8yJBjBFMOgdwQFjTcNRvzVczBaSgcT+cfge4r9HbbZgpNHuz9vNasPIYU4jEtK8b0WtlYf35+lODbHM/FsOpgIYr+V7s56Sn/sSCtZJqXjzjTgPhCJALTDEpIrpZKXrjs2FHLjqsvq1htd0gsWr6AFGAobSNIs/rjkqBDYHRIZvi+Tg9m4RNKPzLNi5YL5YnDEJrXJnEiLuqG0LGThkd3RqnW59q1qC2tzrBJT7Ib/yZd+90PFksEqyTb9CacANW+spcA53yazyAA+octoiZG0RtwAol7vHq5AsxeKmNeflULInYFJkbOCI43QbV4cr2SDZudtzN+TWkM6w2SBtQrrI9wj48beiB4w3lk1c=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e89904-f30d-4a9f-915f-08d682186150
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 16:24:13.3843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4442
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.78.110
Subject: [Qemu-arm] [PATCH v12 1/2] target/arm: Send interrupts on PMU
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
Cc: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZWEtwlkDALkW

Whenever we notice that a counter overflow has occurred, send an
interrupt. This is made more reliable with the addition of a timer in a
follow-on commit.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 61 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 31273fb8de..fc33c45441 100644
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
@@ -1293,6 +1294,13 @@ static bool pmu_counter_enabled(CPUARMState *env, ui=
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
@@ -1310,7 +1318,16 @@ void pmccntr_op_start(CPUARMState *env)
             eff_cycles /=3D 64;
         }
=20
-        env->cp15.c15_ccnt =3D eff_cycles - env->cp15.c15_ccnt_delta;
+        uint64_t new_pmccntr =3D eff_cycles - env->cp15.c15_ccnt_delta;
+
+        uint64_t overflow_mask =3D env->cp15.c9_pmcr & PMCRLC ? \
+                                 1ull << 63 : 1ull << 31;
+        if (env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask) {
+            env->cp15.c9_pmovsr |=3D (1 << 31);
+            pmu_update_irq(env);
+        }
+
+        env->cp15.c15_ccnt =3D new_pmccntr;
     }
     env->cp15.c15_ccnt_delta =3D cycles;
 }
@@ -1345,8 +1362,13 @@ static void pmevcntr_op_start(CPUARMState *env, uint=
8_t counter)
     }
=20
     if (pmu_counter_enabled(env, counter)) {
-        env->cp15.c14_pmevcntr[counter] =3D
-            count - env->cp15.c14_pmevcntr_delta[counter];
+        uint32_t new_pmevcntr =3D count - env->cp15.c14_pmevcntr_delta[cou=
nter];
+
+        if (env->cp15.c14_pmevcntr[counter] & ~new_pmevcntr & INT32_MIN) {
+            env->cp15.c9_pmovsr |=3D (1 << counter);
+            pmu_update_irq(env);
+        }
+        env->cp15.c14_pmevcntr[counter] =3D new_pmevcntr;
     }
     env->cp15.c14_pmevcntr_delta[counter] =3D count;
 }
@@ -1423,7 +1445,20 @@ static void pmswinc_write(CPUARMState *env, const AR=
MCPRegInfo *ri,
                 /* counter is SW_INCR */
                 (env->cp15.c14_pmevtyper[i] & PMXEVTYPER_EVTCOUNT) =3D=3D =
0x0) {
             pmevcntr_op_start(env, i);
-            env->cp15.c14_pmevcntr[i]++;
+
+            /*
+             * Detect if this write causes an overflow since we can't pred=
ict
+             * PMSWINC overflows like we can for other events
+             */
+            uint32_t new_pmswinc =3D env->cp15.c14_pmevcntr[i] + 1;
+
+            if (env->cp15.c14_pmevcntr[i] & ~new_pmswinc & INT32_MIN) {
+                env->cp15.c9_pmovsr |=3D (1 << i);
+                pmu_update_irq(env);
+            }
+
+            env->cp15.c14_pmevcntr[i] =3D new_pmswinc;
+
             pmevcntr_op_finish(env, i);
         }
     }
@@ -1508,6 +1543,7 @@ static void pmovsr_write(CPUARMState *env, const ARMC=
PRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pmovsr &=3D ~value;
+    pmu_update_irq(env);
 }
=20
 static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1515,6 +1551,7 @@ static void pmovsset_write(CPUARMState *env, const AR=
MCPRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pmovsr |=3D value;
+    pmu_update_irq(env);
 }
=20
 static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1701,6 +1738,7 @@ static void pmintenset_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
     /* We have no event counters so only the C bit can be changed */
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pminten |=3D value;
+    pmu_update_irq(env);
 }
=20
 static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1708,6 +1746,7 @@ static void pmintenclr_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
 {
     value &=3D pmu_counter_mask(env);
     env->cp15.c9_pminten &=3D ~value;
+    pmu_update_irq(env);
 }
=20
 static void vbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1846,7 +1885,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmcnten),
       .writefn =3D pmcntenclr_write },
     { .name =3D "PMOVSR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D 0=
, .opc2 =3D 3,
-      .access =3D PL0_RW,
+      .access =3D PL0_RW, .type =3D ARM_CP_IO,
       .fieldoffset =3D offsetoflow32(CPUARMState, cp15.c9_pmovsr),
       .accessfn =3D pmreg_access,
       .writefn =3D pmovsr_write,
@@ -1854,16 +1893,18 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
     { .name =3D "PMOVSCLR_EL0", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2 =3D 3,
       .access =3D PL0_RW, .accessfn =3D pmreg_access,
-      .type =3D ARM_CP_ALIAS,
+      .type =3D ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn =3D pmovsr_write,
       .raw_writefn =3D raw_write },
     { .name =3D "PMSWINC", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D =
0, .opc2 =3D 4,
-      .access =3D PL0_W, .accessfn =3D pmreg_access_swinc, .type =3D ARM_C=
P_NO_RAW,
+      .access =3D PL0_W, .accessfn =3D pmreg_access_swinc,
+      .type =3D ARM_CP_NO_RAW | ARM_CP_IO,
       .writefn =3D pmswinc_write },
     { .name =3D "PMSWINC_EL0", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2 =3D 4,
-      .access =3D PL0_W, .accessfn =3D pmreg_access_swinc, .type =3D ARM_C=
P_NO_RAW,
+      .access =3D PL0_W, .accessfn =3D pmreg_access_swinc,
+      .type =3D ARM_CP_NO_RAW | ARM_CP_IO,
       .writefn =3D pmswinc_write },
     { .name =3D "PMSELR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D 0=
, .opc2 =3D 5,
       .access =3D PL0_RW, .type =3D ARM_CP_ALIAS,
@@ -2050,14 +2091,14 @@ static const ARMCPRegInfo pmovsset_cp_reginfo[] =3D=
 {
     /* PMOVSSET is not implemented in v7 before v7ve */
     { .name =3D "PMOVSSET", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D =
14, .opc2 =3D 3,
       .access =3D PL0_RW, .accessfn =3D pmreg_access,
-      .type =3D ARM_CP_ALIAS,
+      .type =3D ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset =3D offsetoflow32(CPUARMState, cp15.c9_pmovsr),
       .writefn =3D pmovsset_write,
       .raw_writefn =3D raw_write },
     { .name =3D "PMOVSSET_EL0", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 14, .opc2 =3D 3,
       .access =3D PL0_RW, .accessfn =3D pmreg_access,
-      .type =3D ARM_CP_ALIAS,
+      .type =3D ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn =3D pmovsset_write,
       .raw_writefn =3D raw_write },
--=20
2.20.1

