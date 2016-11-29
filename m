Received: by 10.25.150.194 with SMTP id y185csp2412743lfd;
        Tue, 29 Nov 2016 07:47:07 -0800 (PST)
X-Received: by 10.200.40.204 with SMTP id j12mr25073013qtj.284.1480434426960;
        Tue, 29 Nov 2016 07:47:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o1si27830649qta.5.2016.11.29.07.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:47:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37693 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkcb-0007Dt-IP
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:47:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkah-0006DM-3U
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:45:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkag-0004AE-3M
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:45:07 -0500
Received: from 3.mo1.mail-out.ovh.net ([46.105.60.232]:32890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkaf-00049b-T1
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:45:06 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id AF7981EA9F
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 16:45:04 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 30BC712008F;
	Tue, 29 Nov 2016 16:44:57 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:39 +0100
Message-Id: <1480434248-27138-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11709359034148621073
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.60.232
Subject: [Qemu-devel] [PATCH for-2.9 01/30] target-arm: Add VBAR support to
 ARM1176 CPUs
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vixrxx+JCCvw

ARM1176 CPUs support the Vector Base Address Register but currently,
qemu only supports VBAR on ARMv7 CPUs. Fix this by adding a new
feature ARM_FEATURE_VBAR which can used for ARMv7 and ARM1176 CPUs.

The VBAR feature is always set for ARMv7 because some legacy boards
require it even if this is not architecturally correct. However, to
support arm1176 CPUs without TrustZone, which doesn't exist in real
hardware but which is used in old qemu boards, we need to disable the
feature when 'has_el3' is not set.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target-arm/cpu.c    |  6 ++++++
 target-arm/cpu.h    |  1 +
 target-arm/helper.c | 24 ++++++++++++++++++------
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 99f0dbebb9f6..1007e504248a 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -685,6 +685,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
          */
         cpu->id_pfr1 &=3D ~0xf0;
         cpu->id_aa64pfr0 &=3D ~0xf000;
+
+        /* Also disable VBAR support for boards using a arm1176 CPU
+         * without EL3.
+         */
+        unset_feature(env, ARM_FEATURE_VBAR);
     }
=20
     if (!cpu->has_pmu || !kvm_enabled()) {
@@ -911,6 +916,7 @@ static void arm1176_initfn(Object *obj)
=20
     cpu->dtb_compatible =3D "arm,arm1176";
     set_feature(&cpu->env, ARM_FEATURE_V6K);
+    set_feature(&cpu->env, ARM_FEATURE_VBAR);
     set_feature(&cpu->env, ARM_FEATURE_VFP);
     set_feature(&cpu->env, ARM_FEATURE_VAPA);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index ca5c849ed65e..ab119e62ab0f 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1125,6 +1125,7 @@ enum arm_features {
     ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Extensio=
ns */
     ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings=
 */
     ARM_FEATURE_PMU, /* has PMU support */
+    ARM_FEATURE_VBAR, /* has cp15 VBAR */
 };
=20
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target-arm/helper.c b/target-arm/helper.c
index b5b65caadf8a..d417c8ba802f 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -1252,12 +1252,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .access =3D PL1_RW, .accessfn =3D access_tpm, .type =3D ARM_CP_ALI=
AS,
       .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pminten),
       .writefn =3D pmintenclr_write },
-    { .name =3D "VBAR", .state =3D ARM_CP_STATE_BOTH,
-      .opc0 =3D 3, .crn =3D 12, .crm =3D 0, .opc1 =3D 0, .opc2 =3D 0,
-      .access =3D PL1_RW, .writefn =3D vbar_write,
-      .bank_fieldoffsets =3D { offsetof(CPUARMState, cp15.vbar_s),
-                             offsetof(CPUARMState, cp15.vbar_ns) },
-      .resetvalue =3D 0 },
     { .name =3D "CCSIDR", .state =3D ARM_CP_STATE_BOTH,
       .opc0 =3D 3, .crn =3D 0, .crm =3D 0, .opc1 =3D 1, .opc2 =3D 0,
       .access =3D PL1_R, .readfn =3D ccsidr_read, .type =3D ARM_CP_NO_RA=
W },
@@ -1412,6 +1406,16 @@ static const ARMCPRegInfo v6k_cp_reginfo[] =3D {
     REGINFO_SENTINEL
 };
=20
+static const ARMCPRegInfo vbar_cp_reginfo[] =3D {
+    { .name =3D "VBAR", .state =3D ARM_CP_STATE_BOTH,
+      .opc0 =3D 3, .crn =3D 12, .crm =3D 0, .opc1 =3D 0, .opc2 =3D 0,
+      .access =3D PL1_RW, .writefn =3D vbar_write,
+      .bank_fieldoffsets =3D { offsetof(CPUARMState, cp15.vbar_s),
+                             offsetof(CPUARMState, cp15.vbar_ns) },
+      .resetvalue =3D 0 },
+    REGINFO_SENTINEL
+};
+
 #ifndef CONFIG_USER_ONLY
=20
 static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegI=
nfo *ri,
@@ -4506,6 +4510,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (arm_feature(env, ARM_FEATURE_V6K)) {
         define_arm_cp_regs(cpu, v6k_cp_reginfo);
     }
+    if (arm_feature(env, ARM_FEATURE_VBAR)) {
+        define_arm_cp_regs(cpu, vbar_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_V7MP) &&
         !arm_feature(env, ARM_FEATURE_MPU)) {
         define_arm_cp_regs(cpu, v7mp_cp_reginfo);
@@ -4543,6 +4550,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         };
         define_one_arm_cp_reg(cpu, &clidr);
         define_arm_cp_regs(cpu, v7_cp_reginfo);
+
+        /* Always define VBAR even if it doesn't exist in non-EL3
+         * configs. This is needed by some legacy boards.
+         */
+        define_arm_cp_regs(cpu, vbar_cp_reginfo);
         define_debug_regs(cpu);
     } else {
         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
--=20
2.7.4

