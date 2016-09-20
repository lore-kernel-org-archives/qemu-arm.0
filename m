Received: by 10.80.163.71 with SMTP id 65csp1072390edn;
        Tue, 20 Sep 2016 07:23:20 -0700 (PDT)
X-Received: by 10.200.48.243 with SMTP id w48mr36681886qta.71.1474381400450;
        Tue, 20 Sep 2016 07:23:20 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v38si21678492qta.21.2016.09.20.07.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Sep 2016 07:23:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmLx9-0004cp-OS
	for alex.bennee@linaro.org; Tue, 20 Sep 2016 10:23:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bmLqC-0007mx-3A
	for qemu-devel@nongnu.org; Tue, 20 Sep 2016 10:16:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bmLq6-000846-4m
	for qemu-devel@nongnu.org; Tue, 20 Sep 2016 10:16:06 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bmLpt-0007m1-Vy; Tue, 20 Sep 2016 10:15:50 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bmLpm-0005tW-KD; Tue, 20 Sep 2016 15:15:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Sep 2016 15:15:41 +0100
Message-Id: <1474380941-4730-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH] target-arm: Correctly handle 'sub pc, pc,
 1' for ARMv6
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
Cc: stu.axon@gmail.com, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: htGkWxBkMsSI

In the ARM v6 architecture, 'sub pc, pc, 1' is not an interworking
branch, so the computed new value is written to r15 as a normal
value. The architecture says that in this case, bits [1:0] of
the value written must be ignored if we are in ARM mode (or
bit [0] ignored if in Thumb mode); this is a change from the
ARMv4/v5 specification that behaviour is UNPREDICTABLE.
Use the correct mask on the PC value when doing a non-interworking
store to PC.

A popular library used on RaspberryPi uses this instruction
as part of a trick to determine whether it is running on
ARMv6 or ARMv7, and we were mishandling the sequence.

Fixes bug: https://bugs.launchpad.net/bugs/1625295

Reported-by: <stu.axon@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/translate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 693d4bc..8df24bf 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -180,7 +180,12 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
 static void store_reg(DisasContext *s, int reg, TCGv_i32 var)
 {
     if (reg == 15) {
-        tcg_gen_andi_i32(var, var, ~1);
+        /* In Thumb mode, we must ignore bit 0.
+         * In ARM mode, for ARMv4 and ARMv5, it is UNPREDICTABLE if bits [1:0]
+         * are not 0b00, but for ARMv6 and above, we must ignore bits [1:0].
+         * We choose to ignore [1:0] in ARM mode for all architecture versions.
+         */
+        tcg_gen_andi_i32(var, var, s->thumb ? ~1 : ~3);
         s->is_jmp = DISAS_JUMP;
     }
     tcg_gen_mov_i32(cpu_R[reg], var);
-- 
2.7.4

