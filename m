Received: by 10.223.159.82 with SMTP id f18csp1519287wrg;
        Fri, 1 Dec 2017 10:44:46 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYf4uotB4NAYK3A/93Zg1kYRIfqFt9+GZ6ZCw1Umu3fu5hb0THD8iu8eE3mRHb7z/rJXSnm
X-Received: by 10.46.84.86 with SMTP id y22mr2788913ljd.89.1512153886213;
        Fri, 01 Dec 2017 10:44:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512153886; cv=none;
        d=google.com; s=arc-20160816;
        b=h20ARhySJKXnQ4n/FSNMo7CRljRjY7FNUWPnSJUePcKc2rOUDkp84vpHLN8/6UvlwN
         cvIU1yytgWiGf4JYqbn9GOR9oBU0xVHEnh7s4DsK0EBGrKSCjgsth2PMM20HXMntd711
         0sXDUKw7Zt6Mq4ej+eu5abZnsMW2ulQVDjV9UZkkbVFJEJ29gKl0o8IAMx+k9cAiioOG
         IEwAtB9YSIm+SmOCUg+VkM/duNXzU1dFSQhBJGfNedra3RvlyZ3lvRcxvdsho2XvpHW0
         wn1Bv+PYvK32mCyfM2VFfd4bq4SX0LnzfKN6OeJlcxIeehpSA+f6o0Y/vdGB9IFwLaYf
         2IrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=k84yj9AW/IerWv/+fsD1RRu4q/P7qb0846wEicqGKhg=;
        b=LOk/5fxXHdKtXUZ/0LCF+wi+VitcsClTLVnTnBzGqh+tgfYV5oD1rurUd0Yl9zGPJl
         VNoKkjl2NAKDaTW/qmG8AFrmogJBTHP29xOLP4SKwdD1NQsxU+fZYalRNthcJbWXEDei
         gBXXNXjbvClIPG2sCt3/YiCiQyKin8vionTAvLpiwvGr5Ca/+pvANASXCROaSAwfOGhF
         m295uFDPOuZY4pvZcmxxNgiZhM6kC4vKdVZeZFADCt2cYcRWmJC13TXQvugXMQw/KaGI
         v+LOVIouxuBeRJAuBU61qj2+0rq9j0NQ2L4BkCbrB/FJbVuaJBeKcX6RPfx74IWb8DmM
         tUsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id e25si2943355ljb.340.2017.12.01.10.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:44:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqIn-00079Q-3Q; Fri, 01 Dec 2017 18:44:45 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 7/7] target/arm: Implement TT instruction
Date: Fri,  1 Dec 2017 18:44:39 +0000
Message-Id: <1512153879-5291-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
X-TUID: o9gNIHZpptHR

Implement the TT instruction which queries the security
state and access permissions of a memory location.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h    |   2 +
 target/arm/helper.c    | 108 +++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate.c |  29 ++++++++++++-
 3 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 439d228..066729e 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -66,6 +66,8 @@ DEF_HELPER_2(v7m_mrs, i32, env, i32)
 DEF_HELPER_2(v7m_bxns, void, env, i32)
 DEF_HELPER_2(v7m_blxns, void, env, i32)
 
+DEF_HELPER_3(v7m_tt, i32, env, i32, i32)
+
 DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
 DEF_HELPER_3(set_cp_reg, void, env, ptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, ptr)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index be8d797..5368ad8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5947,6 +5947,28 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     g_assert_not_reached();
 }
 
+uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
+{
+    /* The TT instructions can be used by unprivileged code, but in
+     * user-only emulation we don't have the MPU.
+     * Luckily since we know we are NonSecure unprivileged (and that in
+     * turn means that the A flag wasn't specified), all the bits in the
+     * register must be zero:
+     *  IREGION: 0 because IRVALID is 0
+     *  IRVALID: 0 because NS
+     *  S: 0 because NS
+     *  NSRW: 0 because NS
+     *  NSR: 0 because NS
+     *  RW: 0 because unpriv and A flag not set
+     *  R: 0 because unpriv and A flag not set
+     *  SRVALID: 0 because NS
+     *  MRVALID: 0 because unpriv and A flag not set
+     *  SREGION: 0 becaus SRVALID is 0
+     *  MREGION: 0 because MRVALID is 0
+     */
+    return 0;
+}
+
 void switch_mode(CPUARMState *env, int mode)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -10143,6 +10165,92 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
     }
 }
 
+uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
+{
+    /* Implement the TT instruction. op is bits [7:6] of the insn. */
+    bool forceunpriv = op & 1;
+    bool alt = op & 2;
+    V8M_SAttributes sattrs = {};
+    uint32_t tt_resp;
+    bool r, rw, nsr, nsrw, mrvalid;
+    int prot;
+    MemTxAttrs attrs = {};
+    hwaddr phys_addr;
+    uint32_t fsr;
+    ARMMMUIdx mmu_idx;
+    uint32_t mregion;
+    bool targetpriv;
+    bool targetsec = env->v7m.secure;
+
+    /* Work out what the security state and privilege level we're
+     * interested in is...
+     */
+    if (alt) {
+        targetsec = !targetsec;
+    }
+
+    if (forceunpriv) {
+        targetpriv = false;
+    } else {
+        targetpriv = arm_v7m_is_handler_mode(env) ||
+            !(env->v7m.control[targetsec] & R_V7M_CONTROL_NPRIV_MASK);
+    }
+
+    /* ...and then figure out which MMU index this is */
+    mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, targetsec, targetpriv);
+
+    /* We know that the MPU and SAU don't care about the access type
+     * for our purposes beyond that we don't want to claim to be
+     * an insn fetch, so we arbitrarily call this a read.
+     */
+
+    /* MPU region info only available for privileged or if
+     * inspecting the other MPU state.
+     */
+    if (arm_current_el(env) != 0 || alt) {
+        /* We can ignore the return value as prot is always set */
+        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
+                          &phys_addr, &attrs, &prot, &fsr, &mregion);
+        if (mregion == -1) {
+            mrvalid = false;
+            mregion = 0;
+        } else {
+            mrvalid = true;
+        }
+        r = prot & PAGE_READ;
+        rw = prot & PAGE_WRITE;
+    } else {
+        r = false;
+        rw = false;
+        mrvalid = false;
+        mregion = 0;
+    }
+
+    if (env->v7m.secure) {
+        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, &sattrs);
+        nsr = sattrs.ns && r;
+        nsrw = sattrs.ns && rw;
+    } else {
+        sattrs.ns = true;
+        nsr = false;
+        nsrw = false;
+    }
+
+    tt_resp = (sattrs.iregion << 24) |
+        (sattrs.irvalid << 23) |
+        ((!sattrs.ns) << 22) |
+        (nsrw << 21) |
+        (nsr << 20) |
+        (rw << 19) |
+        (r << 18) |
+        (sattrs.srvalid << 17) |
+        (mrvalid << 16) |
+        (sattrs.sregion << 8) |
+        mregion;
+
+    return tt_resp;
+}
+
 #endif
 
 void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6df4d90..002055b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9810,7 +9810,7 @@ static int disas_thumb2_insn(DisasContext *s, uint32_t insn)
         if (insn & (1 << 22)) {
             /* 0b1110_100x_x1xx_xxxx_xxxx_xxxx_xxxx_xxxx
              * - load/store doubleword, load/store exclusive, ldacq/strel,
-             *   table branch.
+             *   table branch, TT.
              */
             if (insn == 0xe97fe97f && arm_dc_feature(s, ARM_FEATURE_M) &&
                 arm_dc_feature(s, ARM_FEATURE_V8)) {
@@ -9887,8 +9887,35 @@ static int disas_thumb2_insn(DisasContext *s, uint32_t insn)
             } else if ((insn & (1 << 23)) == 0) {
                 /* 0b1110_1000_010x_xxxx_xxxx_xxxx_xxxx_xxxx
                  * - load/store exclusive word
+                 * - TT (v8M only)
                  */
                 if (rs == 15) {
+                    if (!(insn & (1 << 20)) &&
+                        arm_dc_feature(s, ARM_FEATURE_M) &&
+                        arm_dc_feature(s, ARM_FEATURE_V8)) {
+                        /* 0b1110_1000_0100_xxxx_1111_xxxx_xxxx_xxxx
+                         *  - TT (v8M only)
+                         */
+                        bool alt = insn & (1 << 7);
+                        TCGv_i32 addr, op, ttresp;
+
+                        if ((insn & 0x3f) || rd == 13 || rd == 15 || rn == 15) {
+                            /* we UNDEF for these UNPREDICTABLE cases */
+                            goto illegal_op;
+                        }
+
+                        if (alt && !s->v8m_secure) {
+                            goto illegal_op;
+                        }
+
+                        addr = load_reg(s, rn);
+                        op = tcg_const_i32(extract32(insn, 6, 2));
+                        ttresp = tcg_temp_new_i32();
+                        gen_helper_v7m_tt(ttresp, cpu_env, addr, op);
+                        tcg_temp_free_i32(addr);
+                        tcg_temp_free_i32(op);
+                        store_reg(s, rd, ttresp);
+                    }
                     goto illegal_op;
                 }
                 addr = tcg_temp_local_new_i32();
-- 
2.7.4
