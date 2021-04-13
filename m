Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5025589lfr;
        Tue, 13 Apr 2021 09:27:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypMB2+v5Ffxy3sS9cR7vULxQBfnErh641+fDEs2qCdmanQEXLiXzkMIrXvOjpHy3dkchq6
X-Received: by 2002:a02:cba7:: with SMTP id v7mr31629379jap.123.1618331220342;
        Tue, 13 Apr 2021 09:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618331220; cv=none;
        d=google.com; s=arc-20160816;
        b=wYPfELL+GBjGM5q671rzl4hXsi0Z7SrFweLk8mOqLpaG5TJ4AN+CE2nlTuUTXIGeU5
         FLpaccTF2yyTVtHRcpNTsfV7GlsEMkesJfF9qj13gKztJgNMInqSzYC1xieAa8B/AF1c
         t8ottBQd06ntWZ+gvvvdT+humlUVWjag3egA8QU7V/JMdXZ+9UXyoLKYF5ZksI2jZGNh
         5uwg5lQ8RlwUvsmupKFjvi9AtA7MkculIceiUh4pj/gwZ7GUP3ainwUAYZSOYHAqXBZa
         2bVRprXRiwSmFmVLRUFmNOoezIKUla+YpgxcSvDBXD5yB8YtyNEiNhIPiZJU2ThLXtdx
         BxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hFxyqdN3PGH9RXzOqInms9vg7ldTQheA2gq3tDt8Grk=;
        b=JacTDY5E8nPzYY/o9QX794zncpAGXhrjzwvGsKXjk0vvhtIqolSZCn3C40wj/vC7Zq
         875k/gVRiw7x4eTcE++dulhUCcfaB/p2HD34qApKQCDcC3P9igAMOI7dUXx9pPZgCs2c
         r1X3yTQR3CEyMcf4HvJwe/cG55yqGSkv59ZwmiBsPzEIcScES+PY7jHQyfXvOOWgs903
         T9VE9opNmycIZLAd67xOdUptCxkgq6j5115kvD2+6XVKeyX5CZVeDQyMsdNYdzimChLl
         nJ/Zv1UWzcR95Wdh7Y0cTPLF66b7y1NCIHXWIl4Ml+D9i48brczmwBuhTPMo8kRQ9IVy
         pAMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CxeLtJwY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si17581569ioo.99.2021.04.13.09.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CxeLtJwY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLsR-0003db-Id
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaV-0006Jb-Qo
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:28 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaR-0006uF-1V
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id k26so589445wrc.8
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hFxyqdN3PGH9RXzOqInms9vg7ldTQheA2gq3tDt8Grk=;
 b=CxeLtJwY39QaRYzhP4NBF47bPB9HQl1mTaapEOUzFSAxPRY9pRWGn0vntuCiDad5x7
 bvR+0yyxRQpPoKOr/35dDafh+UzE1YPIgcO8NruLWdABpoOUtA1qUxqYtadYW4U3CTHy
 lsvAHfkupD5GK0I5rTjRDJ3IJ2tMNCfArv1v75QQ3U8zj9FWXGSFJwIqvkECAoovmDbs
 YKs5zlFQnW/A7CJt2viiqJqm/dXP/+c9qZpEDehvaExZNHfdXdF0cTcDd6NRZDp4LDSm
 Mr8QVN2ePZhHEZ6wjVj2v5Du8J5mw1rYKWO/zZAcyErmf7HCkNy13hRmF2xiCMlQRr9v
 AyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hFxyqdN3PGH9RXzOqInms9vg7ldTQheA2gq3tDt8Grk=;
 b=g9brJbltT+tHChfpNhn3ilJmJFDtaeZ1rR0vTO9i3qIMFFYrVwMalehENp89wT/vGz
 xtH5rHVKWeC8c2FMNgjy4sHJ+Xd93XGMvCeK1xFxESveIS7o8hFHMqEcD2F3AzwNCG1y
 YqkGeCWtBNTAHictrI1RNvXDMjXkHtsKRWHYELS9H4mPjme8ukuPFBp7G/EJjZvby2gn
 U8KLs4y7y2KOvwSsyfSgP2hSZqBxVz3gCkRW5g/BBt/MHBqV90t62PisYf8gxKXa5q9Z
 RGWk5SKj1l0xmUuU1w3DdBo6sAdET3IN1TQubWs8iXddYN1NOKJq8XA+O4RnULFKZ6W3
 8//A==
X-Gm-Message-State: AOAM5309NS26ZW7TQR4wlgtbLHuvEU7bZgLYBxk14ulIPfsh/yMN9eai
 u4zSk5PtZdidDY8Lay9uYQtiB3Bwm1WUjdgA
X-Received: by 2002:adf:e6c7:: with SMTP id y7mr5782222wrm.405.1618330098101; 
 Tue, 13 Apr 2021 09:08:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/13] target/arm: Make functions used by translate-vfp global
Date: Tue, 13 Apr 2021 17:07:53 +0100
Message-Id: <20210413160759.5917-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CHXXzTnrwLYr

Make the remaining functions which are needed by translate-vfp.c.inc
global.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h | 32 ++++++++++++++++++++++++++++++++
 target/arm/translate.c     | 37 ++++++-------------------------------
 2 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index e0e03245f6f..a874253321d 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -30,6 +30,11 @@ void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop);
 void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop);
 void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop);
 void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop);
+TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs);
+void gen_set_pc_im(DisasContext *s, target_ulong val);
+void gen_lookup_tb(DisasContext *s);
+long vfp_reg_offset(bool dp, unsigned reg);
+long neon_full_reg_offset(unsigned reg);
 
 static inline TCGv_i32 load_cpu_offset(int offset)
 {
@@ -57,6 +62,8 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
     return tmp;
 }
 
+void store_reg(DisasContext *s, int reg, TCGv_i32 var);
+
 void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
                      int index, MemOp opc);
 void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
@@ -101,4 +108,29 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
     gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
 }
 
+#if defined(CONFIG_USER_ONLY)
+#define IS_USER(s) 1
+#else
+#define IS_USER(s) (s->user)
+#endif
+
+static inline void gen_set_condexec(DisasContext *s)
+{
+    if (s->condexec_mask) {
+        uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
+        TCGv_i32 tmp = tcg_temp_new_i32();
+        tcg_gen_movi_i32(tmp, val);
+        store_cpu_field(tmp, condexec_bits);
+    }
+}
+
+static inline void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
+{
+    TCGv_i32 tmp_mask = tcg_const_i32(mask);
+    gen_helper_cpsr_write(cpu_env, var, tmp_mask);
+    tcg_temp_free_i32(tmp_mask);
+}
+/* Set NZCV flags from the high 4 bits of var.  */
+#define gen_set_nzcv(var) gen_set_cpsr(var, CPSR_NZCV)
+
 #endif
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2daabb5fb6f..9522002d34e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -52,12 +52,6 @@
 #include "translate.h"
 #include "translate-a32.h"
 
-#if defined(CONFIG_USER_ONLY)
-#define IS_USER(s) 1
-#else
-#define IS_USER(s) (s->user)
-#endif
-
 /* These are TCG temporaries used only by the legacy iwMMXt decoder */
 static TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
 /* These are TCG globals which alias CPUARMState fields */
@@ -209,7 +203,7 @@ void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
  * This is used for load/store for which use of PC implies (literal),
  * or ADD that implies ADR.
  */
-static TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
+TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
 
@@ -223,7 +217,7 @@ static TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
 
 /* Set a CPU register.  The source must be a temporary and will be
    marked as dead.  */
-static void store_reg(DisasContext *s, int reg, TCGv_i32 var)
+void store_reg(DisasContext *s, int reg, TCGv_i32 var)
 {
     if (reg == 15) {
         /* In Thumb mode, we must ignore bit 0.
@@ -265,15 +259,6 @@ static void store_sp_checked(DisasContext *s, TCGv_i32 var)
 #define gen_uxtb16(var) gen_helper_uxtb16(var, var)
 
 
-static inline void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
-{
-    TCGv_i32 tmp_mask = tcg_const_i32(mask);
-    gen_helper_cpsr_write(cpu_env, var, tmp_mask);
-    tcg_temp_free_i32(tmp_mask);
-}
-/* Set NZCV flags from the high 4 bits of var.  */
-#define gen_set_nzcv(var) gen_set_cpsr(var, CPSR_NZCV)
-
 static void gen_exception_internal(int excp)
 {
     TCGv_i32 tcg_excp = tcg_const_i32(excp);
@@ -697,17 +682,7 @@ void arm_gen_test_cc(int cc, TCGLabel *label)
     arm_free_cc(&cmp);
 }
 
-static inline void gen_set_condexec(DisasContext *s)
-{
-    if (s->condexec_mask) {
-        uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, val);
-        store_cpu_field(tmp, condexec_bits);
-    }
-}
-
-static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
+void gen_set_pc_im(DisasContext *s, target_ulong val)
 {
     tcg_gen_movi_i32(cpu_R[15], val);
 }
@@ -1033,7 +1008,7 @@ static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
-static inline void gen_lookup_tb(DisasContext *s)
+void gen_lookup_tb(DisasContext *s)
 {
     tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
     s->base.is_jmp = DISAS_EXIT;
@@ -1068,7 +1043,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
 /*
  * Return the offset of a "full" NEON Dreg.
  */
-static long neon_full_reg_offset(unsigned reg)
+long neon_full_reg_offset(unsigned reg)
 {
     return offsetof(CPUARMState, vfp.zregs[reg >> 1].d[reg & 1]);
 }
@@ -1094,7 +1069,7 @@ static long neon_element_offset(int reg, int element, MemOp memop)
 }
 
 /* Return the offset of a VFP Dreg (dp = true) or VFP Sreg (dp = false). */
-static long vfp_reg_offset(bool dp, unsigned reg)
+long vfp_reg_offset(bool dp, unsigned reg)
 {
     if (dp) {
         return neon_element_offset(reg, 0, MO_64);
-- 
2.20.1

