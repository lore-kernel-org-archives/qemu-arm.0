Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2879259ejt;
        Mon, 19 Jun 2023 08:46:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5+vNNdwot3I+rSLbTC1SNRuj8R8JwfGgokIpqqPS2bDEmL3EPfbqkm+frKIPUlHbI4smuR
X-Received: by 2002:a19:5e16:0:b0:4f4:b28d:73eb with SMTP id s22-20020a195e16000000b004f4b28d73ebmr5240345lfb.12.1687189583010;
        Mon, 19 Jun 2023 08:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687189582; cv=none;
        d=google.com; s=arc-20160816;
        b=cQ901R1zJrdPet8TdGCVcPRLxAU7NMWawwedFgnK1oWqIBSw26sDREAauFZKcylhn2
         kM/oYSSRsbgYqIfgRHGEQkH6KLKBoKBHyKPEjK/hGRKVyfOxiCoypxziYkzD7btEwM4v
         kp8W0tbVsFmHhDIbNK7T1eu7uNyfVsfv+fGc4ebQQ6b4IWgfIUzlOd+rGIW5Xg52Xapj
         TKYuzOC4WDIg7KmDzEHspXrxJfQIWRC6ZnNhlZyXEBSAXcP/fRsbytQu+hH9ONrYl4qC
         +9yfUz/fELvVRqegRzuzGnsjoF90ihRQTY0FTxyaso5gg8VzetkAXL5u7X9QnUkb5sDA
         UBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QJlkFGEL6RfrhNZjrerQLlrb1SfygyFO83NewYAdusE=;
        b=JGaoGqcCTM/1swUJTNebi2tI3tBjLvLlKFEziskFX2eETSIChS/jgum4/I9jMFToKz
         /MWrJNZIVZg3ILbjQfjDFP2ueEz4uqpblc6+3FPgxxtREayBq7XzZPwfIYHeHUOtje7W
         7R2tJD6SphgH27zsPU4Ao7GWN6YLrnaAjRGL8OcAp+F+mNRjEEULKGFLWNN8FOHcB8NK
         qLR9AkF6EoBGbI6OQKCJnjfxDkfge1cJ2APFXCUnejOiT1L6v6tXWRIxbkdgw3ihqSFj
         a7l3thNvZ+6aZLWn6tZgo/q5tqNUlyQnc0QM/JfH7NWkQYpyGjAnbAx8M7vPPDiw4Qds
         fMJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dG9Z/yU2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1-20020a1cf701000000b003f7e6609f90si4706485wmh.59.2023.06.19.08.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dG9Z/yU2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBH4l-0001Br-Gx; Mon, 19 Jun 2023 11:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH4i-0000xN-RI
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:45:53 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH4g-00020V-IO
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:45:52 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso4637149e87.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687189549; x=1689781549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJlkFGEL6RfrhNZjrerQLlrb1SfygyFO83NewYAdusE=;
 b=dG9Z/yU2e4/4bxI2ADoeRNEpNRIuzQBhDf5iCFKoNA92TfjgV3QuGLQjwKochpZTkR
 cSMEBeRdAYzmyWZO9x68NCYmJnrdkuU9xyQ347Jk33tYVmfEK1IDzP7JBHvcsu2LLjof
 t0A+n9tphxwVSs5FSNUGYMoy9WZfpalj4jfvieW8M16Etcnt386z6v/uxWpvCbHL5FXn
 n6p1/nHTrpd/Ix+0MMDh0/d3uf9mWRGRBltq5DJkSIPOxPdSU9DiHQI4sPprZEzdPf3o
 sY1NzyflG/1epWh7H3M3RwWKkM+43T82Dl/EtUZFTmkebqcRZfUdGIR+BBCjxv3cZXfT
 wIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687189549; x=1689781549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJlkFGEL6RfrhNZjrerQLlrb1SfygyFO83NewYAdusE=;
 b=Vgkxx1fn/8996KFEM8QoSdp2gvk6UB6QVNE/DnXwIdlrMKR+DgBn8qdCdr1BaAYPwS
 OEPCR7ENEB/LRRJsro6QqOQiqx5mVMf0Oj3rOBHdHgdZElJOrwaLiSB9W0QaBo2Vg2fo
 22jO4ZnOBGAJ7+HRi80/zBYrSOHCdAxzP6Mq4kNdLJJZeHA0AjAP78MzLDO7F6o5y8BM
 6meD6qkZZpV158TBSnyeq+TtC1p66IKloAPKIy4yMn0L7QDvEM8y5hRoJ/WrzNxrZyr3
 Tb5O+PVyR45zZe38UaMt1UHj4inDz7EifSwce+Z7iI/+bjdRaWpqC+Z/A3OOWI1rwUx1
 xnrg==
X-Gm-Message-State: AC+VfDzmS2aNmuOGtSp9Qnovix9ukRT0+x77eU6HitULQ/Z/dfgCN0s8
 AcM3hMpOvZg4ZW086AdAebxChA==
X-Received: by 2002:a05:6512:471:b0:4f8:578f:acf1 with SMTP id
 x17-20020a056512047100b004f8578facf1mr4641484lfd.46.1687189548691; 
 Mon, 19 Jun 2023 08:45:48 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 w21-20020a1cf615000000b003f8126bcf34sm11050081wmc.48.2023.06.19.08.45.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:45:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/34] target/arm/tcg: Move NEON helpers to neon_helper.c
Date: Mon, 19 Jun 2023 17:42:40 +0200
Message-Id: <20230619154302.80350-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619154302.80350-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z6dsASQWFR4L

Move various NEON helpers to the well named neon_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/helper-a64.c  |  80 --------------------------
 target/arm/tcg/neon_helper.c | 106 +++++++++++++++++++++++++++++++++++
 target/arm/tcg/op_helper.c   |  22 --------
 3 files changed, 106 insertions(+), 102 deletions(-)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index c43f22e7d4..6312238676 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -93,25 +93,6 @@ void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
     arm_rebuild_hflags(env);
 }
 
-/* 64bit/double versions of the neon float compare functions */
-uint64_t HELPER(neon_ceq_f64)(float64 a, float64 b, void *fpstp)
-{
-    float_status *fpst = fpstp;
-    return -float64_eq_quiet(a, b, fpst);
-}
-
-uint64_t HELPER(neon_cge_f64)(float64 a, float64 b, void *fpstp)
-{
-    float_status *fpst = fpstp;
-    return -float64_le(b, a, fpst);
-}
-
-uint64_t HELPER(neon_cgt_f64)(float64 a, float64 b, void *fpstp)
-{
-    float_status *fpst = fpstp;
-    return -float64_lt(b, a, fpst);
-}
-
 /* Reciprocal step and sqrt step. Note that unlike the A32/T32
  * versions, these do a fully fused multiply-add or
  * multiply-add-and-halve.
@@ -207,67 +188,6 @@ float64 HELPER(rsqrtsf_f64)(float64 a, float64 b, void *fpstp)
     return float64_muladd(a, b, float64_three, float_muladd_halve_result, fpst);
 }
 
-/* Pairwise long add: add pairs of adjacent elements into
- * double-width elements in the result (eg _s8 is an 8x8->16 op)
- */
-uint64_t HELPER(neon_addlp_s8)(uint64_t a)
-{
-    uint64_t nsignmask = 0x0080008000800080ULL;
-    uint64_t wsignmask = 0x8000800080008000ULL;
-    uint64_t elementmask = 0x00ff00ff00ff00ffULL;
-    uint64_t tmp1, tmp2;
-    uint64_t res, signres;
-
-    /* Extract odd elements, sign extend each to a 16 bit field */
-    tmp1 = a & elementmask;
-    tmp1 ^= nsignmask;
-    tmp1 |= wsignmask;
-    tmp1 = (tmp1 - nsignmask) ^ wsignmask;
-    /* Ditto for the even elements */
-    tmp2 = (a >> 8) & elementmask;
-    tmp2 ^= nsignmask;
-    tmp2 |= wsignmask;
-    tmp2 = (tmp2 - nsignmask) ^ wsignmask;
-
-    /* calculate the result by summing bits 0..14, 16..22, etc,
-     * and then adjusting the sign bits 15, 23, etc manually.
-     * This ensures the addition can't overflow the 16 bit field.
-     */
-    signres = (tmp1 ^ tmp2) & wsignmask;
-    res = (tmp1 & ~wsignmask) + (tmp2 & ~wsignmask);
-    res ^= signres;
-
-    return res;
-}
-
-uint64_t HELPER(neon_addlp_u8)(uint64_t a)
-{
-    uint64_t tmp;
-
-    tmp = a & 0x00ff00ff00ff00ffULL;
-    tmp += (a >> 8) & 0x00ff00ff00ff00ffULL;
-    return tmp;
-}
-
-uint64_t HELPER(neon_addlp_s16)(uint64_t a)
-{
-    int32_t reslo, reshi;
-
-    reslo = (int32_t)(int16_t)a + (int32_t)(int16_t)(a >> 16);
-    reshi = (int32_t)(int16_t)(a >> 32) + (int32_t)(int16_t)(a >> 48);
-
-    return (uint32_t)reslo | (((uint64_t)reshi) << 32);
-}
-
-uint64_t HELPER(neon_addlp_u16)(uint64_t a)
-{
-    uint64_t tmp;
-
-    tmp = a & 0x0000ffff0000ffffULL;
-    tmp += (a >> 16) & 0x0000ffff0000ffffULL;
-    return tmp;
-}
-
 /* Floating-point reciprocal exponent - see FPRecpX in ARM ARM */
 uint32_t HELPER(frecpx_f16)(uint32_t a, void *fpstp)
 {
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index bc6c4a54e9..cd668eb43a 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -1738,3 +1738,109 @@ void HELPER(neon_zip16)(void *vd, void *vm)
     rm[0] = m0;
     rd[0] = d0;
 }
+
+uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
+                          uint64_t ireg, uint64_t def)
+{
+    uint64_t tmp, val = 0;
+    uint32_t maxindex = ((desc & 3) + 1) * 8;
+    uint32_t base_reg = desc >> 2;
+    uint32_t shift, index, reg;
+
+    for (shift = 0; shift < 64; shift += 8) {
+        index = (ireg >> shift) & 0xff;
+        if (index < maxindex) {
+            reg = base_reg + (index >> 3);
+            tmp = *aa32_vfp_dreg(env, reg);
+            tmp = ((tmp >> ((index & 7) << 3)) & 0xff) << shift;
+        } else {
+            tmp = def & (0xffull << shift);
+        }
+        val |= tmp;
+    }
+    return val;
+}
+
+#ifdef TARGET_AARCH64
+
+/* Pairwise long add: add pairs of adjacent elements into
+ * double-width elements in the result (eg _s8 is an 8x8->16 op)
+ */
+uint64_t HELPER(neon_addlp_s8)(uint64_t a)
+{
+    uint64_t nsignmask = 0x0080008000800080ULL;
+    uint64_t wsignmask = 0x8000800080008000ULL;
+    uint64_t elementmask = 0x00ff00ff00ff00ffULL;
+    uint64_t tmp1, tmp2;
+    uint64_t res, signres;
+
+    /* Extract odd elements, sign extend each to a 16 bit field */
+    tmp1 = a & elementmask;
+    tmp1 ^= nsignmask;
+    tmp1 |= wsignmask;
+    tmp1 = (tmp1 - nsignmask) ^ wsignmask;
+    /* Ditto for the even elements */
+    tmp2 = (a >> 8) & elementmask;
+    tmp2 ^= nsignmask;
+    tmp2 |= wsignmask;
+    tmp2 = (tmp2 - nsignmask) ^ wsignmask;
+
+    /* calculate the result by summing bits 0..14, 16..22, etc,
+     * and then adjusting the sign bits 15, 23, etc manually.
+     * This ensures the addition can't overflow the 16 bit field.
+     */
+    signres = (tmp1 ^ tmp2) & wsignmask;
+    res = (tmp1 & ~wsignmask) + (tmp2 & ~wsignmask);
+    res ^= signres;
+
+    return res;
+}
+
+uint64_t HELPER(neon_addlp_u8)(uint64_t a)
+{
+    uint64_t tmp;
+
+    tmp = a & 0x00ff00ff00ff00ffULL;
+    tmp += (a >> 8) & 0x00ff00ff00ff00ffULL;
+    return tmp;
+}
+
+uint64_t HELPER(neon_addlp_s16)(uint64_t a)
+{
+    int32_t reslo, reshi;
+
+    reslo = (int32_t)(int16_t)a + (int32_t)(int16_t)(a >> 16);
+    reshi = (int32_t)(int16_t)(a >> 32) + (int32_t)(int16_t)(a >> 48);
+
+    return (uint32_t)reslo | (((uint64_t)reshi) << 32);
+}
+
+uint64_t HELPER(neon_addlp_u16)(uint64_t a)
+{
+    uint64_t tmp;
+
+    tmp = a & 0x0000ffff0000ffffULL;
+    tmp += (a >> 16) & 0x0000ffff0000ffffULL;
+    return tmp;
+}
+
+/* 64bit/double versions of the neon float compare functions */
+uint64_t HELPER(neon_ceq_f64)(float64 a, float64 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    return -float64_eq_quiet(a, b, fpst);
+}
+
+uint64_t HELPER(neon_cge_f64)(float64 a, float64 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    return -float64_le(b, a, fpst);
+}
+
+uint64_t HELPER(neon_cgt_f64)(float64 a, float64 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    return -float64_lt(b, a, fpst);
+}
+
+#endif /* TARGET_AARCH64 */
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 3baf8004f6..70a9c37b74 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -82,28 +82,6 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
     raise_exception(env, excp, syndrome, target_el);
 }
 
-uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
-                          uint64_t ireg, uint64_t def)
-{
-    uint64_t tmp, val = 0;
-    uint32_t maxindex = ((desc & 3) + 1) * 8;
-    uint32_t base_reg = desc >> 2;
-    uint32_t shift, index, reg;
-
-    for (shift = 0; shift < 64; shift += 8) {
-        index = (ireg >> shift) & 0xff;
-        if (index < maxindex) {
-            reg = base_reg + (index >> 3);
-            tmp = *aa32_vfp_dreg(env, reg);
-            tmp = ((tmp >> ((index & 7) << 3)) & 0xff) << shift;
-        } else {
-            tmp = def & (0xffull << shift);
-        }
-        val |= tmp;
-    }
-    return val;
-}
-
 void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
 {
     /*
-- 
2.38.1

