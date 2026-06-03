Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E957CD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcI4-0006hC-JP; Tue, 02 Jun 2026 23:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI2-0006eo-34
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:10 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcHz-0003cb-O2
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:09 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c85825bbc4fso2593603a12.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457346; x=1781062146; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYt4Xvo7JmWJ5kLRhU7z6WrSENBPotJcbXqumf2zKiI=;
 b=NKpfufsJCXfpx5lTlHx1eyOXUw1yYF5xw4T2W5moKq2C6ow8tZhY4j5NogJPZBoNL2
 lGQF5ryvjRb8eZYSNrUms2m36Nhw74WYXB28lBZdgmnmw6ywMh+kemJn83G1kISnUxkK
 2zgQh8OK/8z3VHI0sfC5Pjz8D3SLiEqpOJ8bkSFyVWv20U308XdopMlz+NzmZ2opXNkH
 aMiUvsYzyN0g2NvTdzyLPtuFd549cPgwDy4z+tyFiCjlO2svY/8K7tgSVK/BXw5lhvrs
 qg1kYsfMunuLtDVEW6bH2mMk9Vq84w0EXYvXf3GkHhNYUFiwk+7pm1Ev4ENREAoLGXOr
 iTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457346; x=1781062146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yYt4Xvo7JmWJ5kLRhU7z6WrSENBPotJcbXqumf2zKiI=;
 b=hr7eQ5yAWxcvqufg0UvqacHa6+AvDSjv1Jn46JUBTwcwcm60E3NEQo0fFKKo503vXT
 8UM57dX9aghGHfGDxXGGt8Ge1kelYWsImCGSTS+vwWNDOCNs6cJNQuo6+eAtaCo9ggMy
 IjgHTsjUez7lHtAkAcR1WVDUp3znptCwrlVoYcj4V/NlOxkFtdpcWk/eednLizVm25DU
 kgpisRWHFvrcvDEuhEE4yuf99gR8kst0RrzAZSQxmlguWFWre2kPni1GNJ6nZgGd7+rk
 z6j+IYmS7AGVvLcN4aKj1wcelwLbTqdIkbC2lvKqm7I3HV7U0C+C21aktQ3DL65eropS
 oO6Q==
X-Gm-Message-State: AOJu0Yys7gU0XZESrTFCcrXDiAIyBhMc4hAKoRL+iqMk2sPH6w4/viMg
 uY0upNWtcJ3IX4Ek3AukJVJgGXintHZe55iNndC9r8rM1GviCLWwpNcPoHmBabZ0YvE9TcL4DJY
 8gR9TiwI=
X-Gm-Gg: Acq92OGyrCt6LDO3nf9LwCbL+hEJbGcEsWeE2uhAJCNAFbQcXwuqjK/BTGAAWnzDtOI
 uJX6sn/ERxKY9Rdphd6S23iIEjWguVlYsvYFT7OqLJtFstxcE561uTxybvwePUe1FR24lqZt4NW
 SpKjXRfX9k+WmEr9GR8kn+uaMtKrFuICc63pJbxHh5PT6t3p2xH1vmsliY1Lkl8URG6mWWfRf7U
 h40RPO2oiBLW6dtJxmSQym4Xd+e80SNqmhWpenyQSIRPebHioA4ISyCQ04mqBfXGwRJz5tMqubz
 1xde6KM9m1jkqq0XJGaqsNSxRPtVoXlYYHhU+XX7kCGuiarprDS1sHjq3ZDb9eDE7B2vYpnw1hC
 QjMqR12sUGJTB+/4YolKqgihXvQPQwQ0Pj6sOrpAm4Ck0n/EdnVlX+hA6iszGJCYWM8k2uW0hbF
 QjWw0nFriutFbNFG/GHadFpdv45bKRrYvixwg7Zec=
X-Received: by 2002:a05:6a00:218e:b0:842:6cf3:5550 with SMTP id
 d2e1a72fcca58-84284f2ab99mr1485687b3a.47.1780457346043; 
 Tue, 02 Jun 2026 20:29:06 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 14/45] target/arm: Implement BFCVTN for SVE
Date: Tue,  2 Jun 2026 20:28:23 -0700
Message-ID: <20260603032855.106930-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-fp8-defs.h |  2 +
 target/arm/tcg/fp8_helper.c      | 92 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  3 ++
 target/arm/tcg/sve.decode        |  2 +
 4 files changed, 99 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index b5dc2b7064..bbc8d69e28 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -12,3 +12,5 @@ DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index e2330177ec..ffeaf02f97 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -72,6 +72,17 @@ static FP8Context fp8_src_start(CPUARMState *env, uint32_t desc, int scale_mask)
     return fp8_start(env, desc, f8fmt, scale);
 }
 
+static FP8Context fp8_dst_start(CPUARMState *env, uint32_t desc, bool is_f16)
+{
+    uint64_t fpmr = env->vfp.fpmr;
+    FPMRType f8fmt = FIELD_EX64(fpmr, FPMR, F8D);
+    int scale = (is_f16
+                 ? FIELD_SEX64(fpmr, FPMR, NSCALE_F16)
+                 : FIELD_SEX64(fpmr, FPMR, NSCALE));
+
+    return fp8_start(env, desc, f8fmt, scale);
+}
+
 /*
  * Invalid input format: we could take one of the usual set of
  * CONSTRAINED UNPREDICTABLE options for use of a reserved value,
@@ -111,6 +122,64 @@ static float16 fcvt_fp8_to_f16(uint8_t x, fp8_input_fn *f8fmt,
     return float16_round_pack_canonical(&p, s);
 }
 
+/*
+ * Invalid output format: we could take one of the usual set of
+ * CONSTRAINED UNPREDICTABLE options for use of a reserved value,
+ * but choose to take the additional option provided by the FPMR
+ * register specification, of setting the result to 0xff and
+ * signaling Invalid Operation.
+ */
+static uint8_t fcvt_fp8_invalid_output(FloatParts64 *p, int scale,
+                                       bool saturate, float_status *s)
+{
+    float_raise(float_flag_invalid, s);
+    return 0xff;
+}
+
+static uint8_t fcvt_fp8_e4m3_output(FloatParts64 *p, int scale,
+                                    bool saturate, float_status *s)
+{
+    *p = parts64_scalbn(p, scale, s);
+    /*
+     * Saturating Inf -> Max handled in uncanon_e4m3_overflow
+     * because there is no infinity encoding.
+     */
+    return float8_e4m3_round_pack_canonical(p, s, saturate);
+}
+
+static uint8_t fcvt_fp8_e5m2_output(FloatParts64 *p, int scale,
+                                    bool saturate, float_status *s)
+{
+    /*
+     * Because e5m2 has an infinity encoding, we need to handle
+     * saturation conversion of Inf -> Max manually.
+     */
+    if (unlikely(p->cls == float_class_inf)) {
+        if (saturate) {
+            /* maximum or minimum normal value for E5M2 */
+            return 0x7b | (p->sign << 7);
+        }
+    } else {
+        *p = parts64_scalbn(p, scale, s);
+    }
+    return float8_e5m2_round_pack_canonical(p, s, saturate);
+}
+
+typedef uint8_t fcvt_fp8_output_fn(FloatParts64 *, int, bool, float_status *);
+
+static fcvt_fp8_output_fn * const fcvt_fp8_output_fmt[8] = {
+    [0 ... 7] = fcvt_fp8_invalid_output,
+    [OFP8_E5M2] = fcvt_fp8_e5m2_output,
+    [OFP8_E4M3] = fcvt_fp8_e4m3_output,
+};
+
+static uint8_t fcvt_b16_to_fp8(bfloat16 x, fcvt_fp8_output_fn *f8fmt,
+                               int scale, bool saturate, float_status *s)
+{
+    FloatParts64 p = bfloat16_unpack_canonical(x, s);
+    return f8fmt(&p, scale, saturate, s);
+}
+
 void HELPER(advsimd_bfcvtl)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -277,3 +346,26 @@ void HELPER(sme2_fcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_cvt_finish(env, &ctx);
 }
+
+void HELPER(sve2_bfcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, false);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+
+    for (size_t i = 0; i < nelem; ++i) {
+        bfloat16 e0 = n0[H2(i)];
+        bfloat16 e1 = n1[H2(i)];
+        d[H1(2 * i + 0)] = fcvt_b16_to_fp8(e0, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+        d[H1(2 * i + 1)] = fcvt_b16_to_fp8(e1, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index c47e79637e..eccb5b191c 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4100,6 +4100,9 @@ TRANS_FEAT_STREAMING_IF(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
 TRANS_FEAT_STREAMING_IF(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
                         do_f8cvt, a, gen_helper_sve2_bfcvt, true, true)
 
+TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_bfcvtn_bh, false, false)
+
 /*
  *** SVE Floating Point Compare with Zero Group
  */
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index ca110f4bc1..b6ef8ed8de 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1101,6 +1101,8 @@ BF2CVT          01100101 00 001 000 001111 ..... .....          @rd_rn_e0
 BF1CVTLT        01100101 00 001 001 001110 ..... .....          @rd_rn_e0
 BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
 
+BFCVTN          01100101 00 001 010 001110 ....0 .....          @rd_rnx2 esz=1
+
 ### SVE FP Compare with Zero Group
 
 FCMGE_ppz0      01100101 .. 0100 00 001 ... ..... 0 ....        @pd_pg_rn
-- 
2.43.0


