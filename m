Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1263607dyc;
        Fri, 4 Jul 2025 07:45:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRezVI5ALhwHV6kj/1P4AiLqZA+8oJc2m1km9aPWNX3+MWCSLjPBAdYR2E31LrRwEuu4PZQ0T1KHQB5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFqWo8haMc68+UFbVlIbsljLE2KQnGlZyuPeJbQ6920gFqo55m2a4DjOoctmiYilJ7EPgQ5
X-Received: by 2002:a05:6102:5cc4:b0:4ec:c548:e57b with SMTP id ada2fe7eead31-4f2f19983c9mr1760822137.0.1751640334151;
        Fri, 04 Jul 2025 07:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640334; cv=none;
        d=google.com; s=arc-20240605;
        b=CFqLxU996UIODo08c+20kBENihf4MSt/oL28bciPs2nhqUe+ECppgmj3qj6/pbD1A0
         8iKQ5HJecC9kDaiAKXPOU7VZ9QumfWcXc2FvPOCaGelCpwKD8PXMVPxk4GhtNUak3ua0
         pf6k/HtPAbb6/+Mfo/kbxGlUTH7MO9cNiEmbsK63j05A4nlRazdFXwwgphCpBoNCHx7R
         /vJVQypZwSPKShuO6WnLUwSlooLwYjUmM5tjKIRQvcRqN+K+7BuLbkzw5kqhRMThscnR
         N+WH9SIswaxpp7WkapmpbmHGTb1Ve8ZrCfaOCxAKu5CcrPnbtfBRyWh4NoSWThxpqM59
         U/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M/Z0QaESMiLPWMfgiOfCP9B9XT7+eJ9Wb4Gfz/S2ISE=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=YQKThVqqEQFkaMkEQW2ti/FmJzi6zeaswxgYL1s4JZqCIEPUqu4YutrTcoLSO6cuur
         UB8jFMJQOp1Ao4AwIZt/pxn+O0ow7maaFYZu99SCnCJlWgZYJ+S7CgmyqT2OehqLc5A2
         6Mby6EZWsfhwMA4xm68VwnY+xcCjZooSkRZMgqCHbWOg4yvKAjTgtXEqV+N4WAw9ZBp0
         Hs+aH9LHFeSVPzdBUWXuRn9+imzSq8AeQjM6f4i4Tz4KhTr3JjYW5Eh85zHHx0Lhodrp
         qnR3oiNOnWnUFd8lojgYEcuuPO1ZT0kOUhcoLi7mhogxoBdaorhTUzBIXJMzqa4VKMrc
         dArg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xU3wVrd4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea787c91si658339137.605.2025.07.04.07.45.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:45:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xU3wVrd4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhU7-0002ix-V9; Fri, 04 Jul 2025 10:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPD-0002VT-0j
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:52 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhP9-0001L0-6j
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:46 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2ef493de975so784114fac.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639321; x=1752244121; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/Z0QaESMiLPWMfgiOfCP9B9XT7+eJ9Wb4Gfz/S2ISE=;
 b=xU3wVrd4OAZXNnAHwxgiHN3vdiC4ilJpNzmT3Q8So+aJ5GyZsRtSX2N8O73dFycbKS
 cPsUhfu8NtCmwGFzh0AogftmI78yj7ej4b5EWHMf0vPJR37Ki779GjCvVNF+13qiChmE
 k6jOY2Ja303R+OndjEdPpZ7to/cuTbQZYPQn7nVqVInRo7j8cQExdn4xIwZnjw1vWk6k
 XPF9Ak6BPPdm26EA/C0vGAUZBdTW34j92mTGzVsQJHgnKZ39nMOTCmxRlgGQghy8bWNE
 FCwXQFiVfPQnKLBUdLA7y8ivUSob6oN3tGQcYsqmTO87F063L0g2HwH0aWer9DkhOF1/
 MJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639321; x=1752244121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M/Z0QaESMiLPWMfgiOfCP9B9XT7+eJ9Wb4Gfz/S2ISE=;
 b=mwhL7oFqkNZ1ARyQY3sSjyQJr8ZmiZhLaYVs2CT/m4L4lPnXfXRmE4xjW3s5p8qlnW
 d0sAroLY2Pkwo300KMtDdctLJtrYQ86IKRVHUY6Ro8x3Iw69KQNSaLCxhQGa5OuQcNKD
 HXJnOA8N0sPt/Wcm9++yEZOj5VytUZZWRpsXeUhZAsmQCl7IJ7vvJI22aPxcmw2wyPyt
 H5Y7n18DG/XPRQnavCidBOcRD6EzZRpH/hGdAVc0akTQnjcbk8k5wL7zx0pLIciqoWA9
 ZH17FbIgmzGc3thkw4Y138uwm6EoqA2dVUc4lwIm0EnqFqQSiBsprGU0xT1RyZ0dGkX+
 n59g==
X-Gm-Message-State: AOJu0YyjJukyvgeSBd5+z1MgcH1gECXZUQiiGG/4OeA28i52fg9TtvHo
 5uS3a3ZjdETE1ljEdZgBgzjztGz+0fi5FSG+NfI2SOtt0HSoXTcPFFC8VBhDWqsZiwPbJvGNxFI
 VSfzfLXg=
X-Gm-Gg: ASbGncvIdjmNg9KXy6/T4aLff0bHsQUPxu4hWaZpVNpUJeP06OeXL0zFbtiJMLT9YVl
 YsZZoMcRjh18L3deEBoy/GV55bTqb9xjsMEcFW25qhkKW4lnu9zOX6DjXY2vQ8XN82HtJqEJcNp
 nzFYm921CoBpI5up91OaF0YWKKj46yZOwfnueW7FAAHIrwUvggoCO7KOy40UdP8W47kNN0WlESL
 TlzQhXWcSSZkipjJSW3MfF2GTkOfEJJXZ1YG9kJL/VoHRI+Mf1axHuKOzDVnDchdkpLn2KgLiBs
 pP3TC1ORNupz4UreDpT637aElLO6Tm6sBftdZN9uNpsm6lOecJsHHbovsqUi78NRH2uRhXcZU05
 M5ZekqsND6mKBjKATGUpQXthvqGkPlBVw+jGdfmrLv8JoQrEdn4ONDRw5qYk=
X-Received: by 2002:a05:6871:e589:b0:2ef:98fc:6f59 with SMTP id
 586e51a60fabf-2f796e50a48mr1933660fac.35.1751639320829; 
 Fri, 04 Jul 2025 07:28:40 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:28:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 082/108] target/arm: Implement SVE2p1 PEXT
Date: Fri,  4 Jul 2025 08:20:45 -0600
Message-ID: <20250704142112.1018902-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jqRDAj17Ul69

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    |  2 +
 target/arm/tcg/vec_internal.h  | 74 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve_helper.c    | 28 +++++++++++++
 target/arm/tcg/translate-sve.c | 36 +++++++++++++++++
 target/arm/tcg/sve.decode      |  6 +++
 5 files changed, 146 insertions(+)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 5f5ecc2e0d..ec82d0a4e7 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -2953,3 +2953,5 @@ DEF_HELPER_FLAGS_4(sve2p1_uminqv_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2p1_uminqv_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2p1_uminqv_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2p1_uminqv_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(pext, TCG_CALL_NO_RWG, void, ptr, i32, i32)
diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 5efd257c50..61c67bb35e 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -337,4 +337,78 @@ bfloat16 helper_sme2_ah_fmin_b16(bfloat16 a, bfloat16 b, float_status *fpst);
 float32 sve_f16_to_f32(float16 f, float_status *fpst);
 float16 sve_f32_to_f16(float32 f, float_status *fpst);
 
+/*
+ * Decode helper functions for predicate as counter.
+ */
+
+typedef struct {
+    unsigned count;
+    unsigned lg2_stride;
+    bool invert;
+} DecodeCounter;
+
+static inline DecodeCounter
+decode_counter(unsigned png, unsigned vl, unsigned v_esz)
+{
+    DecodeCounter ret = { };
+
+    /* C.f. Arm pseudocode CounterToPredicate. */
+    if (likely(png & 0xf)) {
+        unsigned p_esz = ctz32(png);
+
+        /*
+         * maxbit = log2(pl(bits) * 4)
+         *        = log2(vl(bytes) * 4)
+         *        = log2(vl) + 2
+         * maxbit_mask = ones<maxbit:0>
+         *             = (1 << (maxbit + 1)) - 1
+         *             = (1 << (log2(vl) + 2 + 1)) - 1
+         *             = (1 << (log2(vl) + 3)) - 1
+         *             = (pow2ceil(vl) << 3) - 1
+         */
+        ret.count = png & (((unsigned)pow2ceil(vl) << 3) - 1);
+        ret.count >>= p_esz + 1;
+
+        ret.invert = (png >> 15) & 1;
+
+        /*
+         * The Arm pseudocode for CounterToPredicate expands the count to
+         * a set of bits, and then the operation proceeds as for the original
+         * interpretation of predicates as a set of bits.
+         *
+         * We can avoid the expansion by adjusting the count and supplying
+         * an element stride.
+         */
+        if (unlikely(p_esz != v_esz)) {
+            if (p_esz < v_esz) {
+                /*
+                 * For predicate esz < vector esz, the expanded predicate
+                 * will have more bits set than will be consumed.
+                 * Adjust the count down, rounding up.
+                 * Consider p_esz = MO_8, v_esz = MO_64, count 14:
+                 * The expanded predicate would be
+                 *    0011 1111 1111 1111
+                 * The significant bits are
+                 *    ...1 ...1 ...1 ...1
+                 */
+                unsigned shift = v_esz - p_esz;
+                unsigned trunc = ret.count >> shift;
+                ret.count = trunc + (ret.count != (trunc << shift));
+            } else {
+                /*
+                 * For predicate esz > vector esz, the expanded predicate
+                 * will have bits set only at power-of-two multiples of
+                 * the vector esz.  Bits at other multiples will all be
+                 * false.  Adjust the count up, and supply the caller
+                 * with a stride of elements to skip.
+                 */
+                unsigned shift = p_esz - v_esz;
+                ret.count <<= shift;
+                ret.lg2_stride = shift;
+            }
+        }
+    }
+    return ret;
+}
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 625734fff9..866f85ba30 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -7821,3 +7821,31 @@ DO_FCVTLT(sve2_fcvtlt_sd, uint64_t, uint32_t, H1_8, H1_4, float32_to_float64)
 
 #undef DO_FCVTLT
 #undef DO_FCVTNT
+
+void HELPER(pext)(void *vd, uint32_t png, uint32_t desc)
+{
+    int pl = FIELD_EX32(desc, PREDDESC, OPRSZ);
+    int vl = pl * 8;
+    unsigned v_esz = FIELD_EX32(desc, PREDDESC, ESZ);
+    int part = FIELD_EX32(desc, PREDDESC, DATA);
+    DecodeCounter p = decode_counter(png, vl, v_esz);
+    uint64_t mask = pred_esz_masks[v_esz + p.lg2_stride];
+    ARMPredicateReg *d = vd;
+
+    /*
+     * Convert from element count to byte count and adjust
+     * for the portion of the 4*VL counter to be extracted.
+     */
+    int b_count = (p.count << v_esz) - vl * part;
+
+    memset(d, 0, sizeof(*d));
+    if (p.invert) {
+        if (b_count <= 0) {
+            do_whilel(vd, mask, vl, vl);
+        } else if (b_count < vl) {
+            do_whileg(vd, mask, vl - b_count, vl);
+        }
+    } else if (b_count > 0) {
+        do_whilel(vd, mask, MIN(b_count, vl), vl);
+    }
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 2e29dff989..6ad4d1e289 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3336,6 +3336,42 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
     return true;
 }
 
+static bool do_pext(DisasContext *s, arg_pext *a, int n)
+{
+    TCGv_i32 t_png;
+    TCGv_ptr t_pd;
+    int pl;
+
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    t_png = tcg_temp_new_i32();
+    tcg_gen_ld16u_i32(t_png, tcg_env,
+                      pred_full_reg_offset(s, a->rn) ^
+                      (HOST_BIG_ENDIAN ? 6 : 0));
+
+    t_pd = tcg_temp_new_ptr();
+    pl = pred_full_reg_size(s);
+
+    for (int i = 0; i < n; ++i) {
+        int rd = (a->rd + i) % 16;
+        int part = a->imm * n + i;
+        unsigned desc = 0;
+
+        desc = FIELD_DP32(desc, PREDDESC, OPRSZ, pl);
+        desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
+        desc = FIELD_DP32(desc, PREDDESC, DATA, part);
+
+        tcg_gen_addi_ptr(t_pd, tcg_env, pred_full_reg_offset(s, rd));
+        gen_helper_pext(t_pd, t_png, tcg_constant_i32(desc));
+    }
+    return true;
+}
+
+TRANS_FEAT(PEXT_1, aa64_sme2_or_sve2p1, do_pext, a, 1)
+TRANS_FEAT(PEXT_2, aa64_sme2_or_sve2p1, do_pext, a, 2)
+
 /*
  *** SVE Integer Wide Immediate - Unpredicated Group
  */
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index a3221308ad..b762257759 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -60,6 +60,7 @@
 %rn_ax2         6:4 !function=times_2
 
 %pnd            0:3 !function=plus_8
+%pnn            5:3 !function=plus_8
 
 ###########################################################################
 # Named attribute sets.  These are used to make nice(er) names
@@ -823,6 +824,11 @@ WHILE_lt_cnt4   00100101 .. 1 ..... 0110 . 1 ..... 1 . ...  @while_cnt
 WHILE_gt_cnt2   00100101 .. 1 ..... 0100 . 0 ..... 1 . ...  @while_cnt
 WHILE_gt_cnt4   00100101 .. 1 ..... 0110 . 0 ..... 1 . ...  @while_cnt
 
+# SVE2.1 extract mask predicate from predicate-as-counter
+&pext           rd rn esz imm
+PEXT_1          00100101 esz:2 1 00000 0111 00 imm:2 ... 1 rd:4  &pext rn=%pnn
+PEXT_2          00100101 esz:2 1 00000 0111 010 imm:1 ... 1 rd:4 &pext rn=%pnn
+
 ### SVE Integer Wide Immediate - Unpredicated Group
 
 # SVE broadcast floating-point immediate (unpredicated)
-- 
2.43.0

