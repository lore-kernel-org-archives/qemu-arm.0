Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5267909wrt;
        Tue, 2 Oct 2018 09:39:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60cteYc6biCXpyvuEo3xfPb88QJAbhSxZAToOPBEiFAlFGQksJ4DUZSjrPLq/2u3Vg9V+6O
X-Received: by 2002:a37:dd58:: with SMTP id n85-v6mr12668328qki.175.1538498365052;
        Tue, 02 Oct 2018 09:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498365; cv=none;
        d=google.com; s=arc-20160816;
        b=wSLbhn3C8uwCgAHtdgogP2USobbX1OZGhVHlTkyNL87WjcyzG7diofNAX7l4L7mHac
         wz/V9yt8o0pl8jmXFxTASj518G9IU2kARTGLH1m5TRm3W+ZCJxGfaTdttG3wN0DBK5Xz
         D2vNnSE9/RspHWp1L63q12d91FLhtov9DVOEEt3R3D0lXmxVLnvKMWSlqj6hCfJpcuTw
         CAMHkGdy+gh0FDhOHqrskXXshRFaxbpLXmmX3dJOgxvivuYcGbc6gVfnW3TDcC1ptQy3
         cVq6oGSAt9g2aWTulbkrO8QP+xiomT/Z+VFK94hYQBPnb+QuuYVsI2ZmZSMFJW/nmRSV
         EfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=O91EmS/KQug+8B2QivklTKp4WvXfc/uIybgpQC6pHlA=;
        b=c3Q/HLEB8obAU7zIEAEZed5Lprgr4kkKiXJPNGeGC0F8HD6g3v4yGW1RJltlQMqAgE
         DUXh4rzLHOdbIUDC/RXiF/G5XltHIeGt4VnL6vAXigsC/mo0GoD2gg7P6lenIgKtpUEd
         oKxB9Vgb1mbGHNSY04UF1+qn41Ro0cCkZPdp4d4cOyUZ+s6BtWb3NzEwnZ5cZVrBxp61
         nASk7HY3yGTkYUHN6LT6kIf02kyWcIUT6SeSB2GWutKphWq4VEKkSj0VHxM7pKov8TgB
         oaTQP5lyXxaq/Yev0eWr9MEXJ1OzchGnf8e44LKr7ftDpiWGeUlW9l7HJ3iCvlZ2uz37
         V/kA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u37-v6si1588538qtj.69.2018.10.02.09.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44725 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Nhk-0001BX-H0
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:39:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Neb-0006cq-An
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nea-00054a-0G
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51546)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7NeZ-0004yW-MQ; Tue, 02 Oct 2018 12:36:07 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7NeY-0007Hr-9O; Tue, 02 Oct 2018 17:36:06 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:49 +0100
Message-Id: <20181002163556.10279-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 06/13] target/arm: Add v8M stack checks on
 exception entry
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pXxcdM2kS7+d

Add checks for breaches of the v8M stack limit when the
stack pointer is decremented to push the exception frame
for exception entry.

Note that the exception-entry case is unique in that the
stack pointer is updated to be the limit value if the limit
is hit (per rule R_ZLZG).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 54 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ef8c244fb84..a10dff01a90 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6839,6 +6839,8 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
     uint32_t frameptr;
     ARMMMUIdx mmu_idx;
     bool stacked_ok;
+    uint32_t limit;
+    bool want_psp;
 
     if (dotailchain) {
         bool mode = lr & R_V7M_EXCRET_MODE_MASK;
@@ -6848,12 +6850,34 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
         mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, M_REG_S, priv);
         frame_sp_p = get_v7m_sp_ptr(env, M_REG_S, mode,
                                     lr & R_V7M_EXCRET_SPSEL_MASK);
+        want_psp = mode && (lr & R_V7M_EXCRET_SPSEL_MASK);
+        if (want_psp) {
+            limit = env->v7m.psplim[M_REG_S];
+        } else {
+            limit = env->v7m.msplim[M_REG_S];
+        }
     } else {
         mmu_idx = core_to_arm_mmu_idx(env, cpu_mmu_index(env, false));
         frame_sp_p = &env->regs[13];
+        limit = v7m_sp_limit(env);
     }
 
     frameptr = *frame_sp_p - 0x28;
+    if (frameptr < limit) {
+        /*
+         * Stack limit failure: set SP to the limit value, and generate
+         * STKOF UsageFault. Stack pushes below the limit must not be
+         * performed. It is IMPDEF whether pushes above the limit are
+         * performed; we choose not to.
+         */
+        qemu_log_mask(CPU_LOG_INT,
+                      "...STKOF during callee-saves register stacking\n");
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_STKOF_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                env->v7m.secure);
+        *frame_sp_p = limit;
+        return true;
+    }
 
     /* Write as much of the stack frame as we can. A write failure may
      * cause us to pend a derived exception.
@@ -6877,10 +6901,7 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
         v7m_stack_write(cpu, frameptr + 0x24, env->regs[11], mmu_idx,
                         ignore_faults);
 
-    /* Update SP regardless of whether any of the stack accesses failed.
-     * When we implement v8M stack limit checking then this attempt to
-     * update SP might also fail and result in a derived exception.
-     */
+    /* Update SP regardless of whether any of the stack accesses failed. */
     *frame_sp_p = frameptr;
 
     return !stacked_ok;
@@ -7028,6 +7049,26 @@ static bool v7m_push_stack(ARMCPU *cpu)
 
     frameptr -= 0x20;
 
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        uint32_t limit = v7m_sp_limit(env);
+
+        if (frameptr < limit) {
+            /*
+             * Stack limit failure: set SP to the limit value, and generate
+             * STKOF UsageFault. Stack pushes below the limit must not be
+             * performed. It is IMPDEF whether pushes above the limit are
+             * performed; we choose not to.
+             */
+            qemu_log_mask(CPU_LOG_INT,
+                          "...STKOF during stacking\n");
+            env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_STKOF_MASK;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                    env->v7m.secure);
+            env->regs[13] = limit;
+            return true;
+        }
+    }
+
     /* Write as much of the stack frame as we can. If we fail a stack
      * write this will result in a derived exception being pended
      * (which may be taken in preference to the one we started with
@@ -7043,10 +7084,7 @@ static bool v7m_push_stack(ARMCPU *cpu)
         v7m_stack_write(cpu, frameptr + 24, env->regs[15], mmu_idx, false) &&
         v7m_stack_write(cpu, frameptr + 28, xpsr, mmu_idx, false);
 
-    /* Update SP regardless of whether any of the stack accesses failed.
-     * When we implement v8M stack limit checking then this attempt to
-     * update SP might also fail and result in a derived exception.
-     */
+    /* Update SP regardless of whether any of the stack accesses failed. */
     env->regs[13] = frameptr;
 
     return !stacked_ok;
-- 
2.19.0

