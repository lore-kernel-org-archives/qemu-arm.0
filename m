Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp815701wrd;
        Mon, 20 Aug 2018 08:30:45 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZNrdlJABRC+L/kyuRd39BmZRm/sSWbjuop4rEHhiuPtNEK9ZCju4+YH9iIEvL8XrEsCYNc
X-Received: by 2002:a37:168e:: with SMTP id 14-v6mr6058596qkw.168.1534779045622;
        Mon, 20 Aug 2018 08:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534779045; cv=none;
        d=google.com; s=arc-20160816;
        b=QSviY+3rWC+Y8fFxWI6WVR1eq2SMk/cLO3KPZrlj25JlydUraOy2/OeF8C5ga2SySA
         PTgyTt3IUdN+BHJecfxqhTcT+Nvj60TiZK/qSOAWikGQUDOHtOk1ysaShNaIunib1rgu
         w6IfzUE7loMYvSZFkREtt1gw8XQRgmzw/jG/TxwQakQ2Ei4aBkyl/abHgTFK4+XWtZTR
         JRTm6mWWh0ukwiHzknzqutRtq6W6jmbGi4SiEtQj0gOKJl+wJcU6eHhLSwoJEIU8mCZZ
         E+KwNeRMGFw0fQJGRMAUi33da/HEDJvpZ+OZe0OF2uo8nUkvNh275Irgf6EfGUvz6ud3
         yXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=SUGT7mumlDGE6lqhJB0ajh3L3i4OF0bHkRQyuUU0S7E=;
        b=upVOmxeptDrJcf8rBvhGECFh4Jr6z49uE4EeB1wpfLHtsqZ3YtUhhB5/g2kFrDLpZo
         qDjjonj51TLY8sPRlTFO12MpYq+CK1/XwwKgU1Iljym1ohnK1qW3lVTWVJpj4xcl9E6/
         iaUu3MHOOJLcIu6MuuACzJtZXPYpTsNKABBo2VhbJ3gy0zxbErSFTMd9dGwhP61JPT+7
         co2VzpvPS3oj4AdgWwqu3QCQVjWdJVw0duzi0q+KB6EPk5qCxMLBQXFf0v94LOOmtv5S
         ZCZg0ZBji93+XcQ8AUTCwV4taNa1eYwewJMcgpY2Th8dcfRS+s0ZuEEZx9mYl0emRJ5r
         1x2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8-v6si1184837qvj.165.2018.08.20.08.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 08:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47744 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frm8j-0005Yz-4T
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 11:30:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8R-0005TK-NG
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8Q-00043p-Sp
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:27 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44704)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frm8Q-00042m-K9; Mon, 20 Aug 2018 11:30:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frm8P-0003Yj-LK; Mon, 20 Aug 2018 16:30:25 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 16:30:17 +0100
Message-Id: <20180820153020.21478-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153020.21478-1-peter.maydell@linaro.org>
References: <20180820153020.21478-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 3/6] target/arm: Factor out code for taking an
 AArch32 exception
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NTNBi/kdk9MV

Factor out the code which changes the CPU state so as to
actually take an exception to AArch32. We're going to want
to use this for handling exception entry to Hyp mode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 64 +++++++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9ff6778b3ae..a4ddda5a1bd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8033,6 +8033,46 @@ void aarch64_sync_64_to_32(CPUARMState *env)
     env->regs[15] = env->pc;
 }
 
+static void take_aarch32_exception(CPUARMState *env, int new_mode,
+                                   uint32_t mask, uint32_t offset,
+                                   uint32_t newpc)
+{
+    /* Change the CPU state so as to actually take the exception. */
+    switch_mode(env, new_mode);
+    /*
+     * For exceptions taken to AArch32 we must clear the SS bit in both
+     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
+     */
+    env->uncached_cpsr &= ~PSTATE_SS;
+    env->spsr = cpsr_read(env);
+    /* Clear IT bits.  */
+    env->condexec_bits = 0;
+    /* Switch to the new mode, and to the correct instruction set.  */
+    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
+    /* Set new mode endianness */
+    env->uncached_cpsr &= ~CPSR_E;
+    if (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE) {
+        env->uncached_cpsr |= CPSR_E;
+    }
+    env->daif |= mask;
+
+    if (new_mode == ARM_CPU_MODE_HYP) {
+        env->thumb = (env->cp15.sctlr_el[2] & SCTLR_TE) != 0;
+        env->elr_el[2] = env->regs[15];
+    } else {
+        /*
+         * this is a lie, as there was no c1_sys on V4T/V5, but who cares
+         * and we should just guard the thumb mode on V4
+         */
+        if (arm_feature(env, ARM_FEATURE_V4T)) {
+            env->thumb =
+                (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_TE) != 0;
+        }
+        env->regs[14] = env->regs[15] + offset;
+    }
+    env->regs[15] = newpc;
+}
+
 static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -8175,29 +8215,7 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         env->cp15.scr_el3 &= ~SCR_NS;
     }
 
-    switch_mode (env, new_mode);
-    /* For exceptions taken to AArch32 we must clear the SS bit in both
-     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
-     */
-    env->uncached_cpsr &= ~PSTATE_SS;
-    env->spsr = cpsr_read(env);
-    /* Clear IT bits.  */
-    env->condexec_bits = 0;
-    /* Switch to the new mode, and to the correct instruction set.  */
-    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
-    /* Set new mode endianness */
-    env->uncached_cpsr &= ~CPSR_E;
-    if (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE) {
-        env->uncached_cpsr |= CPSR_E;
-    }
-    env->daif |= mask;
-    /* this is a lie, as the was no c1_sys on V4T/V5, but who cares
-     * and we should just guard the thumb mode on V4 */
-    if (arm_feature(env, ARM_FEATURE_V4T)) {
-        env->thumb = (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_TE) != 0;
-    }
-    env->regs[14] = env->regs[15] + offset;
-    env->regs[15] = addr;
+    take_aarch32_exception(env, new_mode, mask, offset, addr);
 }
 
 /* Handle exception entry to a target EL which is using AArch64 */
-- 
2.18.0

