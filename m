Received: by 10.25.208.194 with SMTP id h185csp1434780lfg;
        Mon, 18 Apr 2016 09:04:19 -0700 (PDT)
X-Received: by 10.55.197.203 with SMTP id k72mr37524307qkl.15.1460995459041;
        Mon, 18 Apr 2016 09:04:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b18si19233062qka.112.2016.04.18.09.04.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Apr 2016 09:04:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asBes-0005d9-Cz
	for alex.bennee@linaro.org; Mon, 18 Apr 2016 12:04:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBeo-0005Xj-Qu
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBem-0005XU-1D
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:14 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:54421 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1asBel-0005UJ-Nk; Mon, 18 Apr 2016 12:04:11 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id C93CA1A467A;
	Mon, 18 Apr 2016 18:03:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 901861A4600;
	Mon, 18 Apr 2016 18:03:46 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Apr 2016 18:03:37 +0200
Message-Id: <1460995422-14373-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v5 4/9] target-mips: Amend processor definitions
 in relation to FCR31
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
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com,
	afaerber@suse.de, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GOGztB/yjZCh

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Amend definitions of some Mips processors related to FCR31
(float status control register). Most significantly, FCR31 of
processors mips32r6-generic, mips64r6-generic, and P5600 will
be set so that its FCR31_ABS2008 and FCR31_NAN2008 bits are set
to 1.

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/translate_init.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
index e81a831..1094baa 100644
--- a/target-mips/translate_init.c
+++ b/target-mips/translate_init.c
@@ -273,6 +273,7 @@ static const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x3678FF1F,
         .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x93 << FCR0_PRID),
+        .CP1_fcr31 = 0,
         .SEGBITS = 32,
         .PABITS = 32,
         .insn_flags = CPU_MIPS32R2 | ASE_MIPS16,
@@ -303,6 +304,7 @@ static const mips_def_t mips_defs[] =
                     (0xff << CP0TCSt_TASID),
         .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PRID),
+        .CP1_fcr31 = 0,
         .CP0_SRSCtl = (0xf << CP0SRSCtl_HSS),
         .CP0_SRSConf0_rw_bitmask = 0x3fffffff,
         .CP0_SRSConf0 = (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) |
@@ -343,6 +345,7 @@ static const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x3778FF1F,
         .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x93 << FCR0_PRID),
+        .CP1_fcr31 = 0,
         .SEGBITS = 32,
         .PABITS = 32,
         .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_DSPR2,
@@ -434,7 +437,7 @@ static const mips_def_t mips_defs[] =
     },
     {
         /* A generic CPU supporting MIPS32 Release 6 ISA.
-           FIXME: Support IEEE 754-2008 FP.
+           FIXME: Complete support for IEEE 754-2008 FP.
                   Eventually this should be replaced by a real CPU model. */
         .name = "mips32r6-generic",
         .CP0_PRid = 0x00010000,
@@ -485,6 +488,7 @@ static const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x3678FFFF,
         /* The R4000 has a full 64bit FPU but doesn't use the fcr0 bits. */
         .CP1_fcr0 = (0x5 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
         .SEGBITS = 40,
         .PABITS = 36,
         .insn_flags = CPU_MIPS3,
@@ -503,6 +507,7 @@ static const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x3678FFFF,
         /* The VR5432 has a full 64bit FPU but doesn't use the fcr0 bits. */
         .CP1_fcr0 = (0x54 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
         .SEGBITS = 40,
         .PABITS = 32,
         .insn_flags = CPU_VR54XX,
@@ -548,6 +553,7 @@ static const mips_def_t mips_defs[] =
         /* The 5Kf has F64 / L / W but doesn't use the fcr0 bits. */
         .CP1_fcr0 = (1 << FCR0_D) | (1 << FCR0_S) |
                     (0x81 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
         .SEGBITS = 42,
         .PABITS = 36,
         .insn_flags = CPU_MIPS64,
@@ -575,6 +581,7 @@ static const mips_def_t mips_defs[] =
         .CP1_fcr0 = (1 << FCR0_3D) | (1 << FCR0_PS) |
                     (1 << FCR0_D) | (1 << FCR0_S) |
                     (0x82 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
         .SEGBITS = 40,
         .PABITS = 36,
         .insn_flags = CPU_MIPS64 | ASE_MIPS3D,
@@ -601,6 +608,7 @@ static const mips_def_t mips_defs[] =
         .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_3D) | (1 << FCR0_PS) |
                     (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
                     (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
         .SEGBITS = 42,
         .PABITS = 36,
         .insn_flags = CPU_MIPS64R2 | ASE_MIPS3D,
@@ -653,7 +661,7 @@ static const mips_def_t mips_defs[] =
     },
     {
         /* A generic CPU supporting MIPS64 Release 6 ISA.
-           FIXME: Support IEEE 754-2008 FP.
+           FIXME: Complete support for IEEE 754-2008 FP.
                   Eventually this should be replaced by a real CPU model. */
         .name = "MIPS64R6-generic",
         .CP0_PRid = 0x00010000,
@@ -704,6 +712,7 @@ static const mips_def_t mips_defs[] =
         .CCRes = 2,
         .CP0_Status_rw_bitmask = 0x35D0FFFF,
         .CP1_fcr0 = (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
+        .CP1_fcr31 = 0,
         .SEGBITS = 40,
         .PABITS = 40,
         .insn_flags = CPU_LOONGSON2E,
@@ -722,6 +731,7 @@ static const mips_def_t mips_defs[] =
         .CCRes = 2,
         .CP0_Status_rw_bitmask = 0xF5D0FF1F,   /* Bits 7:5 not writable.  */
         .CP1_fcr0 = (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
+        .CP1_fcr31 = 0,
         .SEGBITS = 40,
         .PABITS = 40,
         .insn_flags = CPU_LOONGSON2F,
@@ -749,6 +759,7 @@ static const mips_def_t mips_defs[] =
         .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_3D) | (1 << FCR0_PS) |
                     (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
                     (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
         .SEGBITS = 42,
         .PABITS = 36,
         .insn_flags = CPU_MIPS64R2 | ASE_DSP | ASE_DSPR2,
-- 
1.9.1

