Received: by 10.25.0.147 with SMTP id 141csp139820lfa;
        Mon, 20 Feb 2017 10:41:16 -0800 (PST)
X-Received: by 10.46.84.78 with SMTP id y14mr5707998ljd.63.1487616076700;
        Mon, 20 Feb 2017 10:41:16 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id p21si9942937lfd.184.2017.02.20.10.41.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 10:41:16 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfstf-0005r4-T5; Mon, 20 Feb 2017 18:41:15 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 4/4] arm: Fix APSR writes via M profile MSR
Date: Mon, 20 Feb 2017 18:41:12 +0000
Message-Id: <1487616072-9226-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
References: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
X-TUID: t0TTlBS1iwzZ

Our implementation of writes to the APSR for M-profile via the MSR
instruction was badly broken.

First and worst, we had the sense wrong on the test of bit 2 of the
SYSm field -- this is supposed to request an APSR write if bit 2 is 0
but we were doing it if bit 2 was 1.  This bug was introduced in
commit 58117c9bb429cd, so hasn't been in a QEMU release.

Secondly, the choice of exactly which parts of APSR should be written
is defined by bits in the 'mask' field.  We were not passing these
through from instruction decode, making it impossible to check them
in the helper.

Pass the mask bits through from the instruction decode to the helper
function and process them appropriately; fix the wrong sense of the
SYSm bit 2 check.

Invalid mask values and invalid combinations of mask and register
number are UNPREDICTABLE; we choose to treat them as if the mask
values were valid.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c    | 26 ++++++++++++++++++++++----
 target/arm/translate.c |  3 ++-
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 948aba2..8349e1f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8478,8 +8478,18 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     }
 }
 
-void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
-{
+void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
+{
+    /* We're passed bits [11..0] of the instruction; extract
+     * SYSm and the mask bits.
+     * Invalid combinations of SYSm and mask are UNPREDICTABLE;
+     * we choose to treat them as if the mask bits were valid.
+     * NB that the pseudocode 'mask' variable is bits [11..10],
+     * whereas ours is [11..8].
+     */
+    uint32_t mask = extract32(maskreg, 8, 4);
+    uint32_t reg = extract32(maskreg, 0, 8);
+
     if (arm_current_el(env) == 0 && reg > 7) {
         /* only xPSR sub-fields may be written by unprivileged */
         return;
@@ -8488,8 +8498,16 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
     switch (reg) {
     case 0 ... 7: /* xPSR sub-fields */
         /* only APSR is actually writable */
-        if (reg & 4) {
-            xpsr_write(env, val, 0xf8000000); /* APSR */
+        if (!(reg & 4)) {
+            uint32_t apsrmask = 0;
+
+            if (mask & 8) {
+                apsrmask |= 0xf8000000; /* APSR NZCVQ */
+            }
+            if ((mask & 4) && arm_feature(env, ARM_FEATURE_THUMB_DSP)) {
+                apsrmask |= 0x000f0000; /* APSR GE[3:0] */
+            }
+            xpsr_write(env, val, apsrmask);
         }
         break;
     case 8: /* MSP */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9090356..ce7f19f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10391,7 +10391,8 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                     case 0: /* msr cpsr.  */
                         if (arm_dc_feature(s, ARM_FEATURE_M)) {
                             tmp = load_reg(s, rn);
-                            addr = tcg_const_i32(insn & 0xff);
+                            /* the constant is the mask and SYSm fields */
+                            addr = tcg_const_i32(insn & 0xfff);
                             gen_helper_v7m_msr(cpu_env, addr, tmp);
                             tcg_temp_free_i32(addr);
                             tcg_temp_free_i32(tmp);
-- 
2.7.4
