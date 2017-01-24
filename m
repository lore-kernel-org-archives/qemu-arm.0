Received: by 10.25.77.65 with SMTP id a62csp1918329lfb;
        Tue, 24 Jan 2017 11:16:27 -0800 (PST)
X-Received: by 10.25.139.131 with SMTP id n125mr11765988lfd.20.1485285387204;
        Tue, 24 Jan 2017 11:16:27 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 28si13116173lfr.419.2017.01.24.11.16.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:16:27 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cW6Zt-0000QU-93; Tue, 24 Jan 2017 19:16:25 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 09/10] armv7m: FAULTMASK should be 0 on reset
Date: Tue, 24 Jan 2017 19:16:19 +0000
Message-Id: <1485285380-10565-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
X-TUID: XN1/K1slHrHB

From: Michael Davidsaver <mdavidsaver@gmail.com>

For M profile CPUs, FAULTMASK should be 0 on reset, like PRIMASK.
QEMU stores FAULTMASK in the PSTATE F bit, so (as with PRIMASK in the
I bit) we have to clear these to undo the A profile default of 1.

Update the comment accordingly and move it so that it's closer to the
code it's referring to.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM: rewrote commit message, moved comments]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c804f59..0814f73 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -179,15 +179,16 @@ static void arm_cpu_reset(CPUState *s)
     /* SVC mode with interrupts disabled.  */
     env->uncached_cpsr = ARM_CPU_MODE_SVC;
     env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
-    /* On ARMv7-M the CPSR_I is the value of the PRIMASK register, and is
-     * clear at reset. Initial SP and PC are loaded from ROM.
-     */
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         uint32_t initial_msp; /* Loaded from 0x0 */
         uint32_t initial_pc; /* Loaded from 0x4 */
         uint8_t *rom;
 
-        env->daif &= ~PSTATE_I;
+        /* For M profile we store FAULTMASK and PRIMASK in the
+         * PSTATE F and I bits; these are both clear at reset.
+         */
+        env->daif &= ~(PSTATE_I | PSTATE_F);
 
         /* The reset value of this bit is IMPDEF, but ARM recommends
          * that it resets to 1, so QEMU always does that rather than making
@@ -195,6 +196,7 @@ static void arm_cpu_reset(CPUState *s)
          */
         env->v7m.ccr = R_V7M_CCR_STKALIGN_MASK;
 
+        /* Load the initial SP and PC from the vector table at address 0 */
         rom = rom_ptr(0);
         if (rom) {
             /* Address zero is covered by ROM which hasn't yet been
-- 
2.7.4
