Received: by 10.25.21.156 with SMTP id 28csp2199708lfv;
        Tue, 23 Aug 2016 03:00:26 -0700 (PDT)
X-Received: by 10.55.212.89 with SMTP id l86mr28964130qki.253.1471946426077;
        Tue, 23 Aug 2016 03:00:26 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k123si1682203qkf.49.2016.08.23.03.00.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 03:00:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bc8VN-0002eB-JI
	for alex.bennee@linaro.org; Tue, 23 Aug 2016 06:00:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bc8UV-0002J1-Ax
	for qemu-devel@nongnu.org; Tue, 23 Aug 2016 05:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bc8UR-0000DY-3M
	for qemu-devel@nongnu.org; Tue, 23 Aug 2016 05:59:30 -0400
Received: from 4.mo6.mail-out.ovh.net ([87.98.184.159]:37539)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bc8UQ-0000DA-QP
	for qemu-devel@nongnu.org; Tue, 23 Aug 2016 05:59:27 -0400
Received: from player776.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 5B2F2FF8A19
	for <qemu-devel@nongnu.org>; Tue, 23 Aug 2016 11:59:22 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player776.ha.ovh.net (Postfix) with ESMTPSA id 23BF7400077;
	Tue, 23 Aug 2016 11:59:18 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Aug 2016 11:59:12 +0200
Message-Id: <1471946352-20779-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2196067769577212689
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrfeeggddvvdculddtuddrfeeltddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.184.159
Subject: [Qemu-devel] [PATCH] target-arm: Add VBAR support to ARM1176 CPUs
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4KWLJHGz5+GF

ARM1176 CPUs support the Vector Base Address Register but currently,
qemu only supports VBAR on ARMv7 CPUs. Fix this by adding a new
feature ARM_FEATURE_VBAR which is used for ARMv7 and ARM1176 CPUs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target-arm/cpu.c    |    2 ++
 target-arm/cpu.h    |    1 +
 target-arm/helper.c |   18 ++++++++++++------
 3 files changed, 15 insertions(+), 6 deletions(-)

Index: qemu-aspeed.git/target-arm/helper.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-aspeed.git.orig/target-arm/helper.c
+++ qemu-aspeed.git/target-arm/helper.c
@@ -1251,12 +1251,6 @@ static const ARMCPRegInfo v7_cp_reginfo[
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
@@ -1410,6 +1404,15 @@ static const ARMCPRegInfo v6k_cp_reginfo
       .resetvalue =3D 0 },
     REGINFO_SENTINEL
 };
+static const ARMCPRegInfo vbar_cp_reginfo[] =3D {
+    { .name =3D "VBAR", .state =3D ARM_CP_STATE_BOTH,
+      .opc0 =3D 3, .crn =3D 12, .crm =3D 0, .opc1 =3D 0, .opc2 =3D 0,
+      .access =3D PL1_RW, .writefn =3D vbar_write,
+      .bank_fieldoffsets =3D { offsetof(CPUARMState, cp15.vbar_s),
+                             offsetof(CPUARMState, cp15.vbar_ns) },
+      .resetvalue =3D 0 },
+    REGINFO_SENTINEL
+};
=20
 #ifndef CONFIG_USER_ONLY
=20
@@ -4486,6 +4489,9 @@ void register_cp_regs_for_features(ARMCP
     if (arm_feature(env, ARM_FEATURE_V6K)) {
         define_arm_cp_regs(cpu, v6k_cp_reginfo);
     }
+    if (arm_feature(env, ARM_FEATURE_VBAR)) {
+        define_arm_cp_regs(cpu, vbar_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_V7MP) &&
         !arm_feature(env, ARM_FEATURE_MPU)) {
         define_arm_cp_regs(cpu, v7mp_cp_reginfo);
Index: qemu-aspeed.git/target-arm/cpu.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-aspeed.git.orig/target-arm/cpu.h
+++ qemu-aspeed.git/target-arm/cpu.h
@@ -1129,6 +1129,7 @@ enum arm_features {
     ARM_FEATURE_V8_SHA256, /* implements SHA256 part of v8 Crypto Extens=
ions */
     ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Extensio=
ns */
     ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings=
 */
+    ARM_FEATURE_VBAR, /* has cp15 VBAR (ARM1176) */
 };
=20
 static inline int arm_feature(CPUARMState *env, int feature)
Index: qemu-aspeed.git/target-arm/cpu.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-aspeed.git.orig/target-arm/cpu.c
+++ qemu-aspeed.git/target-arm/cpu.c
@@ -584,6 +584,7 @@ static void arm_cpu_realizefn(DeviceStat
         set_feature(env, ARM_FEATURE_LPAE);
     }
     if (arm_feature(env, ARM_FEATURE_V7)) {
+        set_feature(env, ARM_FEATURE_VBAR);
         set_feature(env, ARM_FEATURE_VAPA);
         set_feature(env, ARM_FEATURE_THUMB2);
         set_feature(env, ARM_FEATURE_MPIDR);
@@ -867,6 +868,7 @@ static void arm1176_initfn(Object *obj)
=20
     cpu->dtb_compatible =3D "arm,arm1176";
     set_feature(&cpu->env, ARM_FEATURE_V6K);
+    set_feature(&cpu->env, ARM_FEATURE_VBAR);
     set_feature(&cpu->env, ARM_FEATURE_VFP);
     set_feature(&cpu->env, ARM_FEATURE_VAPA);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
