Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp547844lfb;
        Fri, 15 May 2020 07:21:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeh/2jQb29Ks21etHAEW6s4gzlZCdMNyJEiD8f5zsZtk0OfFS60U/KznHIrXAoDM5NsPgA
X-Received: by 2002:a37:670d:: with SMTP id b13mr3702524qkc.206.1589552509985;
        Fri, 15 May 2020 07:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589552509; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNCDLolEqmchx7GeAZmm/XSQ5rVKZi6nPZjz0YzlWJMvn7NKBncvsmxBhLMm5GJ1TR
         V8SLMQz/iJhkNU4AfGR+k4KgGo45GgDums/m+TI5oxPxjgQGIgSWVk9tMUEak0Glb2Ia
         Al7CF9yDV9L17RkBN/VPZXebez++RywIaneQcXjUr/yXlijnRbBkEsdLVWEnYZBbLWKA
         F26hXCGk8TJYxABhbxuBOduNbB5XF1cSn/eJ8q66ZmKsrEIxqNgWw6tOj1j/s2Ngu2d1
         Kd4+4GRw//d6UoVhMd6jHKRywbeC6QDNPZq4tAc/OC/iax0d8B2k4UxsdjvNV8rNBPgn
         kTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x52pOoMber5KmhMhzO3xI4c0KAd3lEJy8+iCRYC1x2A=;
        b=OwKxP3imiWOz1aIU1DOOZEtJgiUTNxs/TSQXW4Ku93wed+gCplXNy2S2WOmHmdZna8
         y+lkTjTjR3Y80DtvMDnjtRMnpMSbMrgLjOYeSX7gY0Ch+QLRd+C2RyqIh0iJZC1dCqdb
         S+l6gW7PaGXUlUCVqQQMpnr/gpsBOc1nLcqP/dxCU1Rv7Qx4eTum2e5qqFJnZ91I7mFp
         lZn1LpNGTrB9KoQ4zOKjBfUjcjIAuV1yrcZs44uX221WtiYddwrCWgmV5sjR3R0JJPP7
         SevYy/m6zWXtnP3gBAgoJkc9kQxomhjKpR6c5jvrs5BHT+/W343nZ8lPjoKZSjzeLUvq
         13hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VtlPPzAi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15si1202698qko.24.2020.05.15.07.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 07:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VtlPPzAi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZbDh-00027U-CL
	for alex.bennee@linaro.org; Fri, 15 May 2020 10:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbD2-0000pL-9F
 for qemu-arm@nongnu.org; Fri, 15 May 2020 10:21:08 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbD0-0003sg-Kc
 for qemu-arm@nongnu.org; Fri, 15 May 2020 10:21:07 -0400
Received: by mail-wm1-x341.google.com with SMTP id k12so2507147wmj.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x52pOoMber5KmhMhzO3xI4c0KAd3lEJy8+iCRYC1x2A=;
 b=VtlPPzAih767yq3Y8RV70qVVoeaymVRKbvQOBxcT+/q79vdBjL7kaQcl7H49Yd4q7o
 Z7ESJ4meGeaNdu60JFYrydg/VKQClAFZJCu0RDf0vVAdJK2UVXsGIh1ZuSabtQMgAV8N
 qYCzL7a+U+S+ZINtHM2ZX2G/5YV2evDoj22lgG1nEfAjTKpP1Lg/adt4KQnYwS1mj6O6
 Kq1A9ru1vDBgeHYN4n88i67ybaeEn9i787cjdP1k0TdGO5plB9hRQ+uVn8UbupfGZ72O
 gUsuVskH7jpcw4gHDZWiMI9g8w7lcHfrQ7bJOu7yOFBXczjDaoL0WKB6YLRWfaeM6RWD
 H5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x52pOoMber5KmhMhzO3xI4c0KAd3lEJy8+iCRYC1x2A=;
 b=ZaHjW55CnDPVrOgzsPi4HsqCnvw3TiQk8LKQijY5wu39vSiVwlfVyvUFo6oHH2D8Rk
 Of/4dgtrXLrUqYxtQwo3euTw3iALDYRXdyYz0vVFDLNunjsnkYWEAxp1XmCRu1vHtJg7
 4qHLh1Nq8XN8rqgwr8kWVv26buXN3DAkTfaKEDj2q1F/Pevfv8pEdt67yq28EhpvdD6u
 GuZoLC6/F/kQruW2XMHwBux8dn1KOgO1yqGvkV0QGKUkkWsmZIUahbxc7VkGLJNwcS/f
 XQc8OmEZNKsI8Jm+eCyQvyeA2IipPRyeJFbuWT6OUwtPcIR7oNfGevFzxB0FeSfasaV9
 pcgg==
X-Gm-Message-State: AOAM531q22deqfIlCz+l2BhBc5SQkv3p3QAlcp1CQ5s2c24E53fCqcqu
 zYiJD8vC/tsWgUQTqUfGgiAS9TH1jH8r+g==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr4417191wmc.34.1589552464513; 
 Fri, 15 May 2020 07:21:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s14sm3738327wmh.18.2020.05.15.07.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:21:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/10] target/arm: Convert VQSHLU,
 VQSHL 2-reg-shift insns to decodetree
Date: Fri, 15 May 2020 15:20:51 +0100
Message-Id: <20200515142056.21346-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515142056.21346-1-peter.maydell@linaro.org>
References: <20200515142056.21346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SeGJdzPlqfFr

Convert the VQSHLU and QVSHL 2-reg-shift insns to decodetree.
These are the last of the simple shift-by-immediate insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       |  27 ++++++++
 target/arm/translate-neon.inc.c | 108 +++++++++++++++++++++++++++++++
 target/arm/translate.c          | 110 +-------------------------------
 3 files changed, 138 insertions(+), 107 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 3ed10d1524e..6456b53a690 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -313,3 +313,30 @@ VSLI_2sh         1111 001 1 1 . 01 shift:4  .... 0101 0 . . 1 .... \
                  @2reg_shift size=1
 VSLI_2sh         1111 001 1 1 . 001 shift:3 .... 0101 0 . . 1 .... \
                  @2reg_shift size=0
+
+VQSHLU_64_2sh    1111 001 1 1 . shift:6     .... 0110 1 . . 1 .... \
+                 @2reg_shift size=3
+VQSHLU_2sh       1111 001 1 1 . 1 shift:5   .... 0110 0 . . 1 .... \
+                 @2reg_shift size=2
+VQSHLU_2sh       1111 001 1 1 . 01 shift:4  .... 0110 0 . . 1 .... \
+                 @2reg_shift size=1
+VQSHLU_2sh       1111 001 1 1 . 001 shift:3 .... 0110 0 . . 1 .... \
+                 @2reg_shift size=0
+
+VQSHL_S_64_2sh   1111 001 0 1 . shift:6     .... 0111 1 . . 1 .... \
+                 @2reg_shift size=3
+VQSHL_S_2sh      1111 001 0 1 . 1 shift:5   .... 0111 0 . . 1 .... \
+                 @2reg_shift size=2
+VQSHL_S_2sh      1111 001 0 1 . 01 shift:4  .... 0111 0 . . 1 .... \
+                 @2reg_shift size=1
+VQSHL_S_2sh      1111 001 0 1 . 001 shift:3 .... 0111 0 . . 1 .... \
+                 @2reg_shift size=0
+
+VQSHL_U_64_2sh   1111 001 1 1 . shift:6     .... 0111 1 . . 1 .... \
+                 @2reg_shift size=3
+VQSHL_U_2sh      1111 001 1 1 . 1 shift:5   .... 0111 0 . . 1 .... \
+                 @2reg_shift size=2
+VQSHL_U_2sh      1111 001 1 1 . 01 shift:4  .... 0111 0 . . 1 .... \
+                 @2reg_shift size=1
+VQSHL_U_2sh      1111 001 1 1 . 001 shift:3 .... 0111 0 . . 1 .... \
+                 @2reg_shift size=0
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index f4d42683aea..396db55565f 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1396,3 +1396,111 @@ static bool trans_VSHR_U_2sh(DisasContext *s, arg_2reg_shift *a)
         return do_vector_2sh(s, a, tcg_gen_gvec_shri);
     }
 }
+
+static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
+                             NeonGenTwo64OpEnvFn *fn)
+{
+    /*
+     * 2-reg-and-shift operations, size == 3 case, where the
+     * function needs to be passed cpu_env.
+     */
+    TCGv_i64 constimm;
+    int pass;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * To avoid excessive duplication of ops we implement shift
+     * by immediate using the variable shift operations.
+     */
+    constimm = tcg_const_i64(dup_const(a->size, a->shift));
+
+    for (pass = 0; pass < a->q + 1; pass++) {
+        TCGv_i64 tmp = tcg_temp_new_i64();
+
+        neon_load_reg64(tmp, a->vm + pass);
+        fn(tmp, cpu_env, tmp, constimm);
+        neon_store_reg64(tmp, a->vd + pass);
+    }
+    tcg_temp_free_i64(constimm);
+    return true;
+}
+
+static bool do_2shift_env_32(DisasContext *s, arg_2reg_shift *a,
+                             NeonGenTwoOpEnvFn *fn)
+{
+    /*
+     * 2-reg-and-shift operations, size < 3 case, where the
+     * helper needs to be passed cpu_env.
+     */
+    TCGv_i32 constimm;
+    int pass;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * To avoid excessive duplication of ops we implement shift
+     * by immediate using the variable shift operations.
+     */
+    constimm = tcg_const_i32(dup_const(a->size, a->shift));
+
+    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
+        TCGv_i32 tmp = neon_load_reg(a->vm, pass);
+        fn(tmp, cpu_env, tmp, constimm);
+        neon_store_reg(a->vd, pass, tmp);
+    }
+    tcg_temp_free_i32(constimm);
+    return true;
+}
+
+#define DO_2SHIFT_ENV(INSN, FUNC)                                       \
+    static bool trans_##INSN##_64_2sh(DisasContext *s, arg_2reg_shift *a) \
+    {                                                                   \
+        return do_2shift_env_64(s, a, gen_helper_neon_##FUNC##64);      \
+    }                                                                   \
+    static bool trans_##INSN##_2sh(DisasContext *s, arg_2reg_shift *a)  \
+    {                                                                   \
+        static NeonGenTwoOpEnvFn * const fns[] = {                      \
+            gen_helper_neon_##FUNC##8,                                  \
+            gen_helper_neon_##FUNC##16,                                 \
+            gen_helper_neon_##FUNC##32,                                 \
+        };                                                              \
+        assert(a->size < ARRAY_SIZE(fns));                              \
+        return do_2shift_env_32(s, a, fns[a->size]);                    \
+    }
+
+DO_2SHIFT_ENV(VQSHLU, qshlu_s)
+DO_2SHIFT_ENV(VQSHL_U, qshl_u)
+DO_2SHIFT_ENV(VQSHL_S, qshl_s)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4a55986aad9..d711d39eb9d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3011,29 +3011,6 @@ static inline void gen_neon_rsb(int size, TCGv_i32 t0, TCGv_i32 t1)
     }
 }
 
-#define GEN_NEON_INTEGER_OP_ENV(name) do { \
-    switch ((size << 1) | u) { \
-    case 0: \
-        gen_helper_neon_##name##_s8(tmp, cpu_env, tmp, tmp2); \
-        break; \
-    case 1: \
-        gen_helper_neon_##name##_u8(tmp, cpu_env, tmp, tmp2); \
-        break; \
-    case 2: \
-        gen_helper_neon_##name##_s16(tmp, cpu_env, tmp, tmp2); \
-        break; \
-    case 3: \
-        gen_helper_neon_##name##_u16(tmp, cpu_env, tmp, tmp2); \
-        break; \
-    case 4: \
-        gen_helper_neon_##name##_s32(tmp, cpu_env, tmp, tmp2); \
-        break; \
-    case 5: \
-        gen_helper_neon_##name##_u32(tmp, cpu_env, tmp, tmp2); \
-        break; \
-    default: return 1; \
-    }} while (0)
-
 static TCGv_i32 neon_load_scratch(int scratch)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
@@ -5252,7 +5229,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     int size;
     int shift;
     int pass;
-    int count;
     int u;
     int vec_size;
     uint32_t imm;
@@ -5302,6 +5278,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             case 3: /* VRSRA */
             case 4: /* VSRI */
             case 5: /* VSHL, VSLI */
+            case 6: /* VQSHLU */
+            case 7: /* VQSHL */
                 return 1; /* handled by decodetree */
             default:
                 break;
@@ -5319,89 +5297,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     size--;
             }
             shift = (insn >> 16) & ((1 << (3 + size)) - 1);
-            if (op < 8) {
-                /* Shift by immediate:
-                   VSHR, VSRA, VRSHR, VRSRA, VSRI, VSHL, VQSHL, VQSHLU.  */
-                if (q && ((rd | rm) & 1)) {
-                    return 1;
-                }
-                if (!u && (op == 4 || op == 6)) {
-                    return 1;
-                }
-                /* Right shifts are encoded as N - shift, where N is the
-                   element size in bits.  */
-                if (op <= 4) {
-                    shift = shift - (1 << (size + 3));
-                }
-
-                if (size == 3) {
-                    count = q + 1;
-                } else {
-                    count = q ? 4: 2;
-                }
-
-                /* To avoid excessive duplication of ops we implement shift
-                 * by immediate using the variable shift operations.
-                  */
-                imm = dup_const(size, shift);
-
-                for (pass = 0; pass < count; pass++) {
-                    if (size == 3) {
-                        neon_load_reg64(cpu_V0, rm + pass);
-                        tcg_gen_movi_i64(cpu_V1, imm);
-                        switch (op) {
-                        case 6: /* VQSHLU */
-                            gen_helper_neon_qshlu_s64(cpu_V0, cpu_env,
-                                                      cpu_V0, cpu_V1);
-                            break;
-                        case 7: /* VQSHL */
-                            if (u) {
-                                gen_helper_neon_qshl_u64(cpu_V0, cpu_env,
-                                                         cpu_V0, cpu_V1);
-                            } else {
-                                gen_helper_neon_qshl_s64(cpu_V0, cpu_env,
-                                                         cpu_V0, cpu_V1);
-                            }
-                            break;
-                        default:
-                            g_assert_not_reached();
-                        }
-                        neon_store_reg64(cpu_V0, rd + pass);
-                    } else { /* size < 3 */
-                        /* Operands in T0 and T1.  */
-                        tmp = neon_load_reg(rm, pass);
-                        tmp2 = tcg_temp_new_i32();
-                        tcg_gen_movi_i32(tmp2, imm);
-                        switch (op) {
-                        case 6: /* VQSHLU */
-                            switch (size) {
-                            case 0:
-                                gen_helper_neon_qshlu_s8(tmp, cpu_env,
-                                                         tmp, tmp2);
-                                break;
-                            case 1:
-                                gen_helper_neon_qshlu_s16(tmp, cpu_env,
-                                                          tmp, tmp2);
-                                break;
-                            case 2:
-                                gen_helper_neon_qshlu_s32(tmp, cpu_env,
-                                                          tmp, tmp2);
-                                break;
-                            default:
-                                abort();
-                            }
-                            break;
-                        case 7: /* VQSHL */
-                            GEN_NEON_INTEGER_OP_ENV(qshl);
-                            break;
-                        default:
-                            g_assert_not_reached();
-                        }
-                        tcg_temp_free_i32(tmp2);
-                        neon_store_reg(rd, pass, tmp);
-                    }
-                } /* for pass */
-            } else if (op < 10) {
+            if (op < 10) {
                 /* Shift by immediate and narrow:
                    VSHRN, VRSHRN, VQSHRN, VQRSHRN.  */
                 int input_unsigned = (op == 8) ? !u : u;
-- 
2.20.1

