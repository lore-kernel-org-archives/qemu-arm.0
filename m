Received: by 10.25.159.19 with SMTP id i19csp38749lfe;
        Fri, 5 Feb 2016 08:54:39 -0800 (PST)
X-Received: by 10.140.148.83 with SMTP id 80mr13721686qhu.49.1454691279749;
        Fri, 05 Feb 2016 08:54:39 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 65si16560364qhj.112.2016.02.05.08.54.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 08:54:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRjeZ-0004tu-Ao
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 11:54:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjcy-0002SD-5J
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 11:53:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjcx-00076b-1p
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 11:53:00 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjcw-00076J-RG; Fri, 05 Feb 2016 11:52:58 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjVI-0004Ek-C6; Fri, 05 Feb 2016 16:45:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 16:45:04 +0000
Message-Id: <1454690704-16233-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 6/6] target-arm: Report correct syndrome for
	FPEXC32_EL2 traps
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JnsR/u0MXol0

If access to FPEXC32_EL2 is trapped by CPTR_EL2.TFP or CPTR_EL3.TFP,
this should be reported with a syndrome register indicating an
FP access trap, not one indicating a system register access trap.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h       |  5 +++++
 target-arm/helper.c    |  4 ++--
 target-arm/op_helper.c | 13 +++++++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index d1d6886..a959ad6 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1322,6 +1322,11 @@ typedef enum CPAccessResult {
     /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 */
     CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = 5,
     CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = 6,
+    /* Access fails and results in an exception syndrome for an FP access,
+     * trapped directly to EL2 or EL3
+     */
+    CP_ACCESS_TRAP_FP_EL2 = 7,
+    CP_ACCESS_TRAP_FP_EL3 = 8,
 } CPAccessResult;
 
 /* Access functions for coprocessor registers. These cannot fail and
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 064b415..163a72a 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3012,10 +3012,10 @@ static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
 {
     if ((env->cp15.cptr_el[2] & CPTR_TFP) && arm_current_el(env) == 2) {
-        return CP_ACCESS_TRAP_EL2;
+        return CP_ACCESS_TRAP_FP_EL2;
     }
     if (env->cp15.cptr_el[3] & CPTR_TFP) {
-        return CP_ACCESS_TRAP_EL3;
+        return CP_ACCESS_TRAP_FP_EL3;
     }
     return CP_ACCESS_OK;
 }
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 4fedae5..754f080 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -500,6 +500,19 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
         target_el = 3;
         syndrome = syn_uncategorized();
         break;
+    case CP_ACCESS_TRAP_FP_EL2:
+        target_el = 2;
+        /* Since we are an implementation that takes exceptions on a trapped
+         * conditional insn only if the insn has passed its condition code
+         * check, we take the IMPDEF choice to always report CV=1 COND=0xe
+         * (which is also the required value for AArch64 traps).
+         */
+        syndrome = syn_fp_access_trap(1, 0xe, false);
+        break;
+    case CP_ACCESS_TRAP_FP_EL3:
+        target_el = 3;
+        syndrome = syn_fp_access_trap(1, 0xe, false);
+        break;
     default:
         g_assert_not_reached();
     }
-- 
1.9.1

