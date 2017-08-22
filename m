Received: by 10.223.188.70 with SMTP id a6csp5075743wrh;
        Tue, 22 Aug 2017 08:19:52 -0700 (PDT)
X-Received: by 10.237.57.163 with SMTP id m32mr1609024qte.37.1503415192698;
        Tue, 22 Aug 2017 08:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503415192; cv=none;
        d=google.com; s=arc-20160816;
        b=xWj88vKJq9pTizQhFzdJHWZxj72ith4YjoBu6F9JvUt07wAnwbjbC4E2pUzonRnrK5
         /ihck5fif5GBv3xAIzUR0qpJQD1531PIl5I3/k/cPs00R2dLDXiVVC8knPuHhgh0/5mx
         7ow6YwC83C/rsR6fYQK3jX4vvxu47hlwndCKbr0cCkQzREKxj+z9bk1uwjc5cu1fD5AN
         FoaFRG0xG4nWVEI1waUjqaIkYy5TUwhJMrtbrgz4h9eWWrE3VDi5h1SfqWYKXeAeU5nT
         wTgGXpohTgavetbOctgqZgau/9kHKYWxOLXK1hGAlGheCnsBs6n2qo1GivWlxHWx2cZQ
         h1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3Y4ypGZJ2YHu+je89n0kOunR4qXIJZnjZaL0J37nNvU=;
        b=Dl8di6hdxvVFCjYXMN8LaUajwPq31vG2C1FuBsBlnePES/W5+mohlUWbBJNFcv2FX7
         VsFlRLo3p8oVxwl/jEdRD5lqGbg5DkOKyC4LbHNlg80NR0MOzA0AQTOBvCPEZUppPJOL
         JKNX7QnKc7g2vQcBs6HhsvWZCiCcJ96L2Ln5bjpGzEDHPg6QSHN1YDuAowOMM2bb64+c
         koNgEEe6Zo79kvctOR9CclZKmjc0M2Kpp3aQYfFmWr3niq+MA0ZC4Z70NHCLAJd9Axjh
         cSek+9gXkcJCXJpCDXeI1WD5CSvVVRiUA7jD2lkS4xteXbZRnsTfNnK0fHEBN3P1YhRq
         I52Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13si6512894qtk.273.2017.08.22.08.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:19:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkAy6-0007Ji-8E
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:19:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnq-0006Vj-QL
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnj-00039a-P2
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:14 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnj-00037y-HK; Tue, 22 Aug 2017 11:09:07 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnf-0004h9-Q5; Tue, 22 Aug 2017 16:09:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:48 +0100
Message-Id: <1503414539-28762-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/20] target/arm: Make CONTROL register banked
 for v8M
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
X-TUID: zsrYgRFwL6So

Make the CONTROL register banked if v8M security extensions are enabled.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  5 +++--
 target/arm/helper.c    | 21 +++++++++++----------
 target/arm/machine.c   |  3 ++-
 target/arm/translate.c |  2 +-
 4 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index edd4c9e..e922d1f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -422,7 +422,7 @@ typedef struct CPUARMState {
         uint32_t other_sp;
         uint32_t vecbase;
         uint32_t basepri[2];
-        uint32_t control;
+        uint32_t control[2];
         uint32_t ccr; /* Configuration and Control */
         uint32_t cfsr; /* Configurable Fault Status */
         uint32_t hfsr; /* HardFault Status */
@@ -1682,7 +1682,8 @@ static inline bool arm_v7m_is_handler_mode(CPUARMState *env)
 static inline int arm_current_el(CPUARMState *env)
 {
     if (arm_feature(env, ARM_FEATURE_M)) {
-        return arm_v7m_is_handler_mode(env) || !(env->v7m.control & 1);
+        return arm_v7m_is_handler_mode(env) ||
+            !(env->v7m.control[env->v7m.secure] & 1);
     }
 
     if (is_a64(env)) {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b8f3b23..8e74b10 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6053,14 +6053,15 @@ static uint32_t v7m_pop(CPUARMState *env)
 static void switch_v7m_sp(CPUARMState *env, bool new_spsel)
 {
     uint32_t tmp;
-    bool old_spsel = env->v7m.control & R_V7M_CONTROL_SPSEL_MASK;
+    uint32_t old_control = env->v7m.control[env->v7m.secure];
+    bool old_spsel = old_control & R_V7M_CONTROL_SPSEL_MASK;
 
     if (old_spsel != new_spsel) {
         tmp = env->v7m.other_sp;
         env->v7m.other_sp = env->regs[13];
         env->regs[13] = tmp;
 
-        env->v7m.control = deposit32(env->v7m.control,
+        env->v7m.control[env->v7m.secure] = deposit32(old_control,
                                      R_V7M_CONTROL_SPSEL_SHIFT,
                                      R_V7M_CONTROL_SPSEL_LENGTH, new_spsel);
     }
@@ -6414,7 +6415,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     }
 
     lr = 0xfffffff1;
-    if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
+    if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) {
         lr |= 4;
     }
     if (!arm_v7m_is_handler_mode(env)) {
@@ -8832,7 +8833,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         return xpsr_read(env) & mask;
         break;
     case 20: /* CONTROL */
-        return env->v7m.control;
+        return env->v7m.control[env->v7m.secure];
     }
 
     if (el == 0) {
@@ -8841,10 +8842,10 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
 
     switch (reg) {
     case 8: /* MSP */
-        return (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) ?
+        return (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) ?
             env->v7m.other_sp : env->regs[13];
     case 9: /* PSP */
-        return (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) ?
+        return (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) ?
             env->regs[13] : env->v7m.other_sp;
     case 16: /* PRIMASK */
         return env->v7m.primask[env->v7m.secure];
@@ -8893,14 +8894,14 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         }
         break;
     case 8: /* MSP */
-        if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
+        if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) {
             env->v7m.other_sp = val;
         } else {
             env->regs[13] = val;
         }
         break;
     case 9: /* PSP */
-        if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
+        if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) {
             env->regs[13] = val;
         } else {
             env->v7m.other_sp = val;
@@ -8931,8 +8932,8 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         if (!arm_v7m_is_handler_mode(env)) {
             switch_v7m_sp(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
         }
-        env->v7m.control &= ~R_V7M_CONTROL_NPRIV_MASK;
-        env->v7m.control |= val & R_V7M_CONTROL_NPRIV_MASK;
+        env->v7m.control[env->v7m.secure] &= ~R_V7M_CONTROL_NPRIV_MASK;
+        env->v7m.control[env->v7m.secure] |= val & R_V7M_CONTROL_NPRIV_MASK;
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "Attempt to write unknown special"
diff --git a/target/arm/machine.c b/target/arm/machine.c
index bd7aba1..2cd64c5 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -116,7 +116,7 @@ static const VMStateDescription vmstate_m = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
         VMSTATE_UINT32(env.v7m.basepri[M_REG_NS], ARMCPU),
-        VMSTATE_UINT32(env.v7m.control, ARMCPU),
+        VMSTATE_UINT32(env.v7m.control[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.ccr, ARMCPU),
         VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
@@ -253,6 +253,7 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_UINT32(env.v7m.basepri[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.primask[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.faultmask[M_REG_S], ARMCPU),
+        VMSTATE_UINT32(env.v7m.control[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/target/arm/translate.c b/target/arm/translate.c
index dea0a6f..6aa2d7c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12241,7 +12241,7 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
         if (xpsr & XPSR_EXCP) {
             mode = "handler";
         } else {
-            if (env->v7m.control & R_V7M_CONTROL_NPRIV_MASK) {
+            if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_NPRIV_MASK) {
                 mode = "unpriv-thread";
             } else {
                 mode = "priv-thread";
-- 
2.7.4

