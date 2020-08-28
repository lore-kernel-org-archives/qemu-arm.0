Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1702869lfc;
        Fri, 28 Aug 2020 11:58:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrWydET++ITmVUdFNv85xOkAe1Pbpj6MsgDbAcBqoeBNKpwDsoE4r0dL0gcj3uicNiLh6z
X-Received: by 2002:a25:b854:: with SMTP id b20mr4273644ybm.500.1598641111320;
        Fri, 28 Aug 2020 11:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598641111; cv=none;
        d=google.com; s=arc-20160816;
        b=pdwIasFUFFVBZ+FGH9QO2q0tFRdkHQQXOuOV0KW81rALMAnVw4mmtV9vlta3/TAGu2
         /F6CUX7FbIjOCJXhVHj7Tfus8zQGXYqDJXXEgbmaaNGaBdCrKZZm6UKhLJSODeBvfmhR
         iwD5EVpfOA/VAQLZkzUGbmdD/uzfdu8hfKkVEQdXSLZNgpY5VTPYUuQkT8lMEyjDP6Xg
         8O8nSn2CIVVVw34KwL7xFQfegIQV7bPSf6M5GQIROWhwAt4YPBINK2YuRoFZuLAjGWKy
         haZmzzIuXBETvWz3DALiTRGHCH26nZKjZMRQoKEBgq7njJSBWP16YRgpwuarPca7FpXF
         YYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xy+ZubFcXYrLF856j9b+3uusVXUFpAlU1KC0lHWaBwE=;
        b=VKYcstQhklgrvTYR7Po/fNW8LZ7qAEbhICePVs8HgIuuk7W1qOonCeii04X3PLsg0F
         t5s8AogINPLLWmIsoBJIopoeFc9MSYC+H5G6g4c36lWL0HDre1riiWigBsn8sLGUBmAH
         OhyevDklOBqQ2hWr9j6yWqMtgDJgMDWix7KWYB8nCCI0E60l7WCwuYKIP0EJjxDUYwLw
         +rXWE45ffZYkSsWi8BgqkErmQVMJUujOIrJ28d3IEv0IZGydfAbu94APTbW33CYPGdQd
         BeUQk5JVTWrjT1mHMXWi2FwtT30vqCqaKaJ6bwc3TtmRb+UzzoFjutizgkY/fjTBBwlC
         OnlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pua7zVpN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y196si114725ybe.322.2020.08.28.11.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pua7zVpN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBja2-00085Q-Mr
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCw-00035a-C4
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:38 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCt-00063s-3T
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:37 -0400
Received: by mail-wm1-x341.google.com with SMTP id z9so124789wmk.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xy+ZubFcXYrLF856j9b+3uusVXUFpAlU1KC0lHWaBwE=;
 b=pua7zVpNWlV0iUY2dpD8xs7MB4FPlriCsqvW0yf1Fj77iskCur3NX++XpRjX+tgMkD
 36RYgU2o/qkHU18uRBqdl3idPaPzSS4+Vta/g85qSP9lW8ILdMBkSFVXZowpiKEXbzqd
 tBj+4hmpTw9uEp/SHrNAy0J4V/qa8g4aKU3/40rl9P+AZMD4lxwwRdHa6mXgDl2tsVPe
 /fPXwnC/CmWWCEU+yYB4Oyt5+AzJtB3Zg8UrrSrL7bs71V9fKdtJwmN4vUwPWdYGlMcV
 SaoXFElSEoTJnpfpuus/JzVtk4mTlKUYKpj9LVqR/SLgzwXiTxc4+k7wnzRKv+tOMosr
 es0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xy+ZubFcXYrLF856j9b+3uusVXUFpAlU1KC0lHWaBwE=;
 b=kvBk7LpQwxf78TgIhp/Qity6pitpDtKIlAenICusKNPIPEUNBEP4QMYdclZYPGNB7/
 qQv09kjKZk8wSRrgPmAL+CPgf0KxOSE/X/NWbDJJscEpNMR5rZlmojyJ16beZ9hwspUY
 XNrGhkGUrNBUltvHKYZ1CjScSBqNjrbJPVE2TY1Sk+nfyKoJN4ttbNgWWgcvlm1B+Jvs
 fe07w7Qhum5WLfdHHtXRJjrXop/uUc85pR39pbCGUSlpcRapVxqIYE09XTnyNUJEcDm8
 fcBHT+Ccmi0SFDYL3Z7ervDjb4yEvJf5pnUAC8O3It0hdwujLxOFAHVk47bJHw6CF06D
 FC3A==
X-Gm-Message-State: AOAM531DkwNQ0QOCvpqwkfdjbwY+2pdg9NsgG8WQA5Vwm43kOp93r27P
 aubebnGMsQi1Mx4AV44qA7p5vsnhj58ieVuO
X-Received: by 2002:a1c:ed15:: with SMTP id l21mr22962wmh.37.1598639672968;
 Fri, 28 Aug 2020 11:34:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 30/45] target/arm: Implement fp16 for Neon VMLA,
 VMLS operations
Date: Fri, 28 Aug 2020 19:33:39 +0100
Message-Id: <20200828183354.27913-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: QNZ6faF6wA4S

Convert the Neon floating-point VMLA and VMLS insns over to using a
gvec helper, and use this to implement the fp16 case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h             |  6 +++++
 target/arm/vec_helper.c         | 42 +++++++++++++++++++++++++++++++++
 target/arm/translate-neon.c.inc | 33 ++------------------------
 3 files changed, 50 insertions(+), 31 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index f621940e69d..6f6c96711b7 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -659,6 +659,12 @@ DEF_HELPER_FLAGS_5(gvec_fmaxnum_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i3
 DEF_HELPER_FLAGS_5(gvec_fminnum_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fminnum_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fmla_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmla_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmls_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmls_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(gvec_ftsmul_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_ftsmul_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index f551f86d5a5..5da5969c1c0 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -842,6 +842,48 @@ DO_3OP(gvec_rsqrts_d, helper_rsqrtsf_f64, float64)
 #endif
 #undef DO_3OP
 
+/* Non-fused multiply-add (unlike float16_muladd etc, which are fused) */
+static float16 float16_muladd_nf(float16 dest, float16 op1, float16 op2,
+                                 float_status *stat)
+{
+    return float16_add(dest, float16_mul(op1, op2, stat), stat);
+}
+
+static float32 float32_muladd_nf(float32 dest, float32 op1, float32 op2,
+                                 float_status *stat)
+{
+    return float32_add(dest, float32_mul(op1, op2, stat), stat);
+}
+
+static float16 float16_mulsub_nf(float16 dest, float16 op1, float16 op2,
+                                 float_status *stat)
+{
+    return float16_sub(dest, float16_mul(op1, op2, stat), stat);
+}
+
+static float32 float32_mulsub_nf(float32 dest, float32 op1, float32 op2,
+                                 float_status *stat)
+{
+    return float32_sub(dest, float32_mul(op1, op2, stat), stat);
+}
+
+#define DO_MULADD(NAME, FUNC, TYPE) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
+{                                                                          \
+    intptr_t i, oprsz = simd_oprsz(desc);                                  \
+    TYPE *d = vd, *n = vn, *m = vm;                                        \
+    for (i = 0; i < oprsz / sizeof(TYPE); i++) {                           \
+        d[i] = FUNC(d[i], n[i], m[i], stat);                               \
+    }                                                                      \
+    clear_tail(d, oprsz, simd_maxsz(desc));                                \
+}
+
+DO_MULADD(gvec_fmla_h, float16_muladd_nf, float16)
+DO_MULADD(gvec_fmla_s, float32_muladd_nf, float32)
+
+DO_MULADD(gvec_fmls_h, float16_mulsub_nf, float16)
+DO_MULADD(gvec_fmls_s, float32_mulsub_nf, float32)
+
 /* For the indexed ops, SVE applies the index per 128-bit vector segment.
  * For AdvSIMD, there is of course only one such vector segment.
  */
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 13858aaa08b..1f2522f120a 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -1119,37 +1119,8 @@ DO_3S_FP_GVEC(VACGE, gen_helper_gvec_facge_s, gen_helper_gvec_facge_h)
 DO_3S_FP_GVEC(VACGT, gen_helper_gvec_facgt_s, gen_helper_gvec_facgt_h)
 DO_3S_FP_GVEC(VMAX, gen_helper_gvec_fmax_s, gen_helper_gvec_fmax_h)
 DO_3S_FP_GVEC(VMIN, gen_helper_gvec_fmin_s, gen_helper_gvec_fmin_h)
-
-/*
- * For all the functions using this macro, size == 1 means fp16,
- * which is an architecture extension we don't implement yet.
- */
-#define DO_3S_FP(INSN,FUNC,READS_VD)                                \
-    static bool trans_##INSN##_fp_3s(DisasContext *s, arg_3same *a) \
-    {                                                               \
-        if (a->size != 0) {                                         \
-            /* TODO fp16 support */                                 \
-            return false;                                           \
-        }                                                           \
-        return do_3same_fp(s, a, FUNC, READS_VD);                   \
-    }
-
-static void gen_VMLA_fp_3s(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm,
-                            TCGv_ptr fpstatus)
-{
-    gen_helper_vfp_muls(vn, vn, vm, fpstatus);
-    gen_helper_vfp_adds(vd, vd, vn, fpstatus);
-}
-
-static void gen_VMLS_fp_3s(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm,
-                            TCGv_ptr fpstatus)
-{
-    gen_helper_vfp_muls(vn, vn, vm, fpstatus);
-    gen_helper_vfp_subs(vd, vd, vn, fpstatus);
-}
-
-DO_3S_FP(VMLA, gen_VMLA_fp_3s, true)
-DO_3S_FP(VMLS, gen_VMLS_fp_3s, true)
+DO_3S_FP_GVEC(VMLA, gen_helper_gvec_fmla_s, gen_helper_gvec_fmla_h)
+DO_3S_FP_GVEC(VMLS, gen_helper_gvec_fmls_s, gen_helper_gvec_fmls_h)
 
 WRAP_FP_GVEC(gen_VMAXNM_fp32_3s, FPST_STD, gen_helper_gvec_fmaxnum_s)
 WRAP_FP_GVEC(gen_VMAXNM_fp16_3s, FPST_STD_F16, gen_helper_gvec_fmaxnum_h)
-- 
2.20.1

