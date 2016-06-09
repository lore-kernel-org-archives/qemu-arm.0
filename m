Received: by 10.25.27.66 with SMTP id b63csp455043lfb;
        Thu, 9 Jun 2016 11:16:34 -0700 (PDT)
X-Received: by 10.237.49.66 with SMTP id 60mr11390220qtg.103.1465496193916;
        Thu, 09 Jun 2016 11:16:33 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w49si4065938qtc.82.2016.06.09.11.16.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 11:16:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB4VN-0007I7-6r
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 14:16:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bB3Y7-0004bJ-Au
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 13:15:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bB3Y6-0008PW-9R
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 13:15:19 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bB3Y3-0008NW-LW; Thu, 09 Jun 2016 13:15:15 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bB3Y0-0001fQ-Nc; Thu, 09 Jun 2016 18:15:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Jun 2016 18:15:11 +0100
Message-Id: <1465492511-9333-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH] target-arm: Don't permit ARMv8-only Neon insns
 on ARMv7
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pAq4/bfGvJr/

The Neon instructions VCVTA, VCVTM, VCVTN, VCVTP, VRINTA, VRINTM,
VRINTN, VRINTP, VRINTX, and VRINTZ were only introduced with ARMv8,
so they need a guard to make them UNDEF if the CPU only supports ARMv7.
(We got this right for all the other new-in-v8 insns, but forgot
it for these Neon 2-reg-misc ops.)

Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Christophe: I'd appreciate it if you could give this a quick test
and confirm that it fixes the bug for you.

 target-arm/translate.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 6815bc1..3e71467 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -5311,6 +5311,30 @@ static int neon_2rm_is_float_op(int op)
             op >= NEON_2RM_VRECPE_F);
 }
 
+static bool neon_2rm_is_v8_op(int op)
+{
+    /* Return true if this neon 2reg-misc op is ARMv8 and up */
+    switch (op) {
+    case NEON_2RM_VRINTN:
+    case NEON_2RM_VRINTA:
+    case NEON_2RM_VRINTM:
+    case NEON_2RM_VRINTP:
+    case NEON_2RM_VRINTZ:
+    case NEON_2RM_VRINTX:
+    case NEON_2RM_VCVTAU:
+    case NEON_2RM_VCVTAS:
+    case NEON_2RM_VCVTNU:
+    case NEON_2RM_VCVTNS:
+    case NEON_2RM_VCVTPU:
+    case NEON_2RM_VCVTPS:
+    case NEON_2RM_VCVTMU:
+    case NEON_2RM_VCVTMS:
+        return true;
+    default:
+        return false;
+    }
+}
+
 /* Each entry in this array has bit n set if the insn allows
  * size value n (otherwise it will UNDEF). Since unallocated
  * op values will have no bits set they always UNDEF.
@@ -6798,6 +6822,10 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 if ((neon_2rm_sizes[op] & (1 << size)) == 0) {
                     return 1;
                 }
+                if (neon_2rm_is_v8_op(op) &&
+                    !arm_dc_feature(s, ARM_FEATURE_V8)) {
+                    return 1;
+                }
                 if ((op != NEON_2RM_VMOVN && op != NEON_2RM_VQMOVN) &&
                     q && ((rm | rd) & 1)) {
                     return 1;
-- 
1.9.1

