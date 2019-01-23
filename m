Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1190430wrt;
        Wed, 23 Jan 2019 13:52:54 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4ctvNodFtQBWsues6jnlaPgCHmlYO3oyhsj51uw47OM7TAUZ+c/+qBm4vqKxWHKIPCRvzY
X-Received: by 2002:adf:8b83:: with SMTP id o3mr4607222wra.81.1548280374696;
        Wed, 23 Jan 2019 13:52:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548280374; cv=none;
        d=google.com; s=arc-20160816;
        b=YTjikv8Ezlh04hWbWEAIkwUa/95WNp2OSJSWoBT6kOM65dqEPfJTsk0q6TYxyIGV0l
         y5H67KAyHGL14+uAg3EqaG2lYfiFz2jLoraqb4rui9b2ymKEbCS9OR3gFxVopTiluxNl
         4fD5yghSAxQk3y/T5tsbiEa0gkKk6YMg6C1sjm3Z1lkftpvH4q91pE/gZVc01ktXuXkC
         VSYIi9PyE8J8PZk+9RvMjUQuV0ECEYoOY6jESMyUik/wsvErxPQlw2QW/EjoAALYZKPI
         LrDFMoB4CWH2vcolGC/V7xwYHVoQbqXk4DaSgN2E3BJzO7YfzhlptNZlkXSylcJ0iuvC
         yZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:dkim-signature;
        bh=ySzXLXDYBfTCHgr4DN+CK+z2ilzj31VdmkW3L9/wmow=;
        b=tHkRgZUG+QEwEm0GWRbKyOA76HiJlI7pcbLanRDnSH1Kx3Cm7GQ913P6X0APettujn
         zkd4xKIpLZDH22iNPb8HP1qWFluYiJfAf0j5r5XuEzr+aIMqpWZfo3HgYgkcHLOtry0y
         tN550k2cRRn1cLCTqqrGshUHD6Ofkx9XuahzJLEDgNclb0L9sGbcjnsVyd/aQnf8gJyv
         zyaB4KgsW1wGQyKk16iAElDWC11YJ0nohcXK7XZso9bMsokx2Jp0R96q/G89ZApbBCoT
         AvkcAYwMYUAu1YnJBzdrKdhd3y08y/wJPM1B4jz9nYM8JhzQVvCmfkkSLSKKsRALv+96
         jJMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=CbZup8Eo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si61873122wrx.165.2019.01.23.13.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 13:52:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=CbZup8Eo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:42451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmQS5-0005p8-Or
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 16:52:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmQOC-0002o2-JJ
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 16:48:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmQ8w-0005AR-Kz
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 16:33:08 -0500
Received: from mail-co1nam04on071f.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::71f]:57720
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gmQ8m-0004Y5-LC; Wed, 23 Jan 2019 16:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ySzXLXDYBfTCHgr4DN+CK+z2ilzj31VdmkW3L9/wmow=;
	b=CbZup8Eo+zonjZjNlAjEABN+uKpNRfTO+FW9xiK6C28/HuISPG/LhSP8vNlKmVtnTnQ7vo6HP+4XJiPF35UwV6XjLpFshCq/zC+pGMK8eetCw4AmXFaMF4TjSDu5Uya2dOCMI28bHCC8jVUmKGhgXpL+28c6VUvXUxez08CPCqA=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5067.prod.exchangelabs.com (20.176.120.223) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.31; Wed, 23 Jan 2019 21:32:50 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1558.016;
	Wed, 23 Jan 2019 21:32:48 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v11 1/2] target/arm: Send interrupts on PMU counter
	overflow
Thread-Index: AQHUs2Mvgkp0W1G2TUKxeLYaqfEzjQ==
Date: Wed, 23 Jan 2019 21:32:47 +0000
Message-ID: <20190123213227.17077-2-aaron@os.amperecomputing.com>
References: <20190123213227.17077-1-aaron@os.amperecomputing.com>
In-Reply-To: <20190123213227.17077-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR18CA0051.namprd18.prod.outlook.com
	(2603:10b6:903:13f::13) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5067;
	6:9iNTT4qePzUmStpJEVeKICYDGjBd9kMKkIf+IGbFw4KLReUD9pImMlos9phkA5hF7Uo3NtGOsubPgkg5ksn+Uhd7EirhM/4H8aFlvp9hAuA9tFVewfDvBjLSy2tsIl8ApY6q8wTXlC7sMP7iuAwTq8YFTQoQasfGH9D7/oE+DeeQj7SUxbxy3MmsOUZHhx/C//CC3Yy1LGR0IlO1vWx5qTUEAqQ+T7VkOgWvEjbKJPHzB99vd7m0kyk3ltJ+GreP8F17P2Rhsp4+qgHRqrNLHApxaFmrWhxZ9XqfMUUz46v/tk7bpTf7yqDoeuVSP7igwNIGS5pRsy3nFfcgEoEQahGCiKesuQGGytzQjVVmRuhaYwDEl7XjpJEY8EtkzYXif888NrwywnzTiWJkXjs3+eDzYuzX4B5EX6FytNP9xHupDi0dDWj0f1D++9dcygKm2dHAVv7KynFG56iQpXUY1A==;
	5:GU2lWhbHb8W2G/vnm0XcA56RZxs8UZBe6LpIsbahaB+wBEfdzUvdwFSe17wxlvqvZo9aKQtJl4ZUj2ydUoUQmJOf2QmrJ34NMeoHWqW01rbnALbK2FogOwLE2RlxbMW/bCY3RzWoVbeDXBRiLDJUKBIVdvl6Hf3CGZ65l0+3ObkWAo5stCabaAg08REqv7vnjuhSlgDOcf5tK8m+EzBOTg==;
	7:iqbX5khKBg+WBe6uCHl7B44cYGRqDLPECUzJFES+6oAAsV6g9AJZmxWlBHHArnTlB5X20dkc8YLkAgAL8OBCSkDAF+lf0YkhmoyEGhy9rWZDlZDXPQDQWOchYRxvx6dYQ5RWR5K2u8p+0sHb5SsK7A==
x-ms-office365-filtering-correlation-id: 928a4119-0e22-48fb-e9c0-08d6817a51b6
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5067; 
x-ms-traffictypediagnostic: DM6PR01MB5067:
x-microsoft-antispam-prvs: <DM6PR01MB5067961FBAF47E80052DF3598A990@DM6PR01MB5067.prod.exchangelabs.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(376002)(346002)(366004)(136003)(39840400004)(189003)(199004)(102836004)(186003)(316002)(6486002)(105586002)(71200400001)(71190400001)(106356001)(110136005)(6512007)(54906003)(3846002)(6116002)(97736004)(256004)(86362001)(52116002)(26005)(6436002)(386003)(76176011)(99286004)(2501003)(6506007)(8676002)(81166006)(81156014)(8936002)(50226002)(68736007)(14444005)(7736002)(446003)(11346002)(2906002)(305945005)(53936002)(14454004)(25786009)(1076003)(107886003)(478600001)(39060400002)(66066001)(4326008)(486006)(476003)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5067;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sg2EioCCniRX/PmNvDFJkLLD/J4HzkIjjHpNsjcB2mcKJWJdozOiQ1rmyGMJES5NXOb50+A4KpWR6DSmu7ATJlGmTq35oEPYtrYBq4VTVWGJ1XWvgO1QnQ1wOysjVU/DM7WrJ+ISAP14UmBiPEJIQzGMPbg2pgICyktx5YqS9PNlzTaRvRDUTBTqQaYC2SxQVYlBIQJuShWXS4n7OhCBYMY0t/k6tDC2eMnI/jw0oaJLjmjVY1pW9ilW7R6JSuHA5RW+IUk/9LQ4aBb5doX++15fmmSB3hMHcohOG2axMl8K+Il+F8Com9vNiOoczDse5K7grrrdynCB2u1M4lsdwiWd+SuxZQ04u+PlEd+iap89IK+Q9X3aJ8fSSXt/8Es1hjXeyPMcecclNQRRq4A+X8TqmEYujXTAGgrozLRufWY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928a4119-0e22-48fb-e9c0-08d6817a51b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 21:32:46.7102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5067
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::71f
Subject: [Qemu-devel] [PATCH v11 1/2] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IFXxNo2BULMS

Whenever we notice that a counter overflow has occurred, send an
interrupt. This is made more reliable with the addition of a timer in a
follow-on commit.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/helper.c | 61 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 31273fb8de..df2f3dd42a 100644
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
+                                 INT64_MIN : INT32_MIN;
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

