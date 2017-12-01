Received: by 10.223.159.82 with SMTP id f18csp1519262wrg;
        Fri, 1 Dec 2017 10:44:44 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbcEAcNUXf03K0iKpV7XT2RC4iDy1025JWhUL1GLJ+QqXl5TrNBCRCVmTde3Jeg6ZNayjhc
X-Received: by 10.223.130.17 with SMTP id 17mr6019744wrb.131.1512153884807;
        Fri, 01 Dec 2017 10:44:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512153884; cv=none;
        d=google.com; s=arc-20160816;
        b=lu6/iAgwKbCoiXOpNfmRkTCK+GynmkCzV+y8jNRinUKJe7Du3TxA6dQtCZnmiqBx7T
         E8LmqdY8WcFWMp07n3t2WynbnkKTlTvuSRakcasbu92VYCwfHIPdnj6ZPbajYz/Pjfbr
         BpLUDdAM2HP73mRY7JCmbP2HPV/CqZKLa6DXQtZRY4QcMaTo12F0EeTOVJlkEh5sye/s
         bWKBJjx3RndvSugBA9NteixHEX3pmOS/nWOGWA548IB1eEk36pU2buVG2Eu3FRK840q/
         RxMAtXhwF9A/z132fTH91ls7386IpNhGr+8YC1dLnRL9KU1MMxbhU6HeR/6kd9gd2j3X
         lOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=kV+KaV5PBStGMTGjgxltFPrcnkj3bOyP5W2H7elwpgg=;
        b=Jc6aO4Goo1zEhZqEdkAIPbaGaeTWrbCDs1aybdJGzxGUDFT5kWns1f21LSlC6vybwF
         k4MxFYVhofLDZ1rF/Y0HfW4P96SqQbkXytk177igX1MWcYsVlAGifvMN/R4bK4lUuyAl
         xlFQCdQSaAXMMZVDPl3tS5GbIKhzW0tjpHPeOIcsSbLO5h9KPAe8pt9q8YGIspv68w/r
         rCOLuVv+r8SiejgiFVUwhmUlQaQnjgTJjazwwbwH5RCjXYZ5SsNl8qD5gB+xD9IX1WDC
         rC/e4kFji743zrBNEazaOXdXK1vnEoBSVRhHtuKd690csVHIZTa8g2oRbm8OKn7T9TYL
         F+lA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id r48si5488071wrb.399.2017.12.01.10.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:44:44 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqIm-00078x-BD; Fri, 01 Dec 2017 18:44:44 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 6/7] target/arm: Factor MPU lookup code out of get_phys_addr_pmsav8()
Date: Fri,  1 Dec 2017 18:44:38 +0000
Message-Id: <1512153879-5291-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
X-TUID: rku8XkDxzw6M

For the TT instruction we're going to need to do an MPU lookup that
also tells us which MPU region the access hit. This requires us
to do the MPU lookup without first doing the SAU security access
check, so pull the MPU lookup parts of get_phys_addr_pmsav8()
out into their own function.

The TT instruction also needs to know the MPU region number which
the lookup hit, so provide this information to the caller of the
MPU lookup code, even though get_phys_addr_pmsav8() doesn't
need to know it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 130 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 79 insertions(+), 51 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 14ab1f4..be8d797 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9351,67 +9351,28 @@ static void v8m_security_lookup(CPUARMState *env, uint32_t address,
     }
 }
 
-static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
-                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                                 int *prot, uint32_t *fsr)
+static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                              hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                              int *prot, uint32_t *fsr, uint32_t *mregion)
 {
+    /* Perform a PMSAv8 MPU lookup (without also doing the SAU check
+     * that a full phys-to-virt translation does).
+     * mregion is (if not NULL) set to the region number which matched,
+     * or -1 if no region number is returned (MPU off, address did not
+     * hit a region, address hit in multiple regions).
+     */
     ARMCPU *cpu = arm_env_get_cpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
     uint32_t secure = regime_is_secure(env, mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
-    V8M_SAttributes sattrs = {};
 
     *phys_ptr = address;
     *prot = 0;
-
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
-        if (access_type == MMU_INST_FETCH) {
-            /* Instruction fetches always use the MMU bank and the
-             * transaction attribute determined by the fetch address,
-             * regardless of CPU state. This is painful for QEMU
-             * to handle, because it would mean we need to encode
-             * into the mmu_idx not just the (user, negpri) information
-             * for the current security state but also that for the
-             * other security state, which would balloon the number
-             * of mmu_idx values needed alarmingly.
-             * Fortunately we can avoid this because it's not actually
-             * possible to arbitrarily execute code from memory with
-             * the wrong security attribute: it will always generate
-             * an exception of some kind or another, apart from the
-             * special case of an NS CPU executing an SG instruction
-             * in S&NSC memory. So we always just fail the translation
-             * here and sort things out in the exception handler
-             * (including possibly emulating an SG instruction).
-             */
-            if (sattrs.ns != !secure) {
-                *fsr = sattrs.nsc ? M_FAKE_FSR_NSC_EXEC : M_FAKE_FSR_SFAULT;
-                return true;
-            }
-        } else {
-            /* For data accesses we always use the MMU bank indicated
-             * by the current CPU state, but the security attributes
-             * might downgrade a secure access to nonsecure.
-             */
-            if (sattrs.ns) {
-                txattrs->secure = false;
-            } else if (!secure) {
-                /* NS access to S memory must fault.
-                 * Architecturally we should first check whether the
-                 * MPU information for this address indicates that we
-                 * are doing an unaligned access to Device memory, which
-                 * should generate a UsageFault instead. QEMU does not
-                 * currently check for that kind of unaligned access though.
-                 * If we added it we would need to do so as a special case
-                 * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
-                 */
-                *fsr = M_FAKE_FSR_SFAULT;
-                return true;
-            }
-        }
+    if (mregion) {
+        *mregion = -1;
     }
 
     /* Unlike the ARM ARM pseudocode, we don't need to check whether this
@@ -9500,12 +9461,79 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
         /* We don't need to look the attribute up in the MAIR0/MAIR1
          * registers because that only tells us about cacheability.
          */
+        if (mregion) {
+            *mregion = matchregion;
+        }
     }
 
     *fsr = 0x00d; /* Permission fault */
     return !(*prot & (1 << access_type));
 }
 
+
+static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
+                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                                 int *prot, uint32_t *fsr)
+{
+    uint32_t secure = regime_is_secure(env, mmu_idx);
+    V8M_SAttributes sattrs = {};
+
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
+        if (access_type == MMU_INST_FETCH) {
+            /* Instruction fetches always use the MMU bank and the
+             * transaction attribute determined by the fetch address,
+             * regardless of CPU state. This is painful for QEMU
+             * to handle, because it would mean we need to encode
+             * into the mmu_idx not just the (user, negpri) information
+             * for the current security state but also that for the
+             * other security state, which would balloon the number
+             * of mmu_idx values needed alarmingly.
+             * Fortunately we can avoid this because it's not actually
+             * possible to arbitrarily execute code from memory with
+             * the wrong security attribute: it will always generate
+             * an exception of some kind or another, apart from the
+             * special case of an NS CPU executing an SG instruction
+             * in S&NSC memory. So we always just fail the translation
+             * here and sort things out in the exception handler
+             * (including possibly emulating an SG instruction).
+             */
+            if (sattrs.ns != !secure) {
+                *fsr = sattrs.nsc ? M_FAKE_FSR_NSC_EXEC : M_FAKE_FSR_SFAULT;
+                *phys_ptr = address;
+                *prot = 0;
+                return true;
+            }
+        } else {
+            /* For data accesses we always use the MMU bank indicated
+             * by the current CPU state, but the security attributes
+             * might downgrade a secure access to nonsecure.
+             */
+            if (sattrs.ns) {
+                txattrs->secure = false;
+            } else if (!secure) {
+                /* NS access to S memory must fault.
+                 * Architecturally we should first check whether the
+                 * MPU information for this address indicates that we
+                 * are doing an unaligned access to Device memory, which
+                 * should generate a UsageFault instead. QEMU does not
+                 * currently check for that kind of unaligned access though.
+                 * If we added it we would need to do so as a special case
+                 * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
+                 */
+                *fsr = M_FAKE_FSR_SFAULT;
+                *phys_ptr = address;
+                *prot = 0;
+                return true;
+            }
+        }
+    }
+
+    return pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
+                             txattrs, prot, fsr, NULL);
+}
+
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, int *prot, uint32_t *fsr)
-- 
2.7.4
