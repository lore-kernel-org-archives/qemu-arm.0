Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C57EFF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:25:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFAT-0007jt-60; Wed, 29 Apr 2026 20:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAL-0007NA-GK
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:05 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAJ-0006YQ-HV
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:05 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-82f33d28c1dso206024b3a.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508522; x=1778113322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4qYbU7+TPTFqGiBQwxxMXvd6dGbNUHDSbf7XY1Mn5Rg=;
 b=Z/YhzmDPMlJpWRvx2e9RPmDIY0ss9CjSC/PFSI/RPlvw78BUm2mE+q6A9727aCXFRU
 NXWojAvbp2OFWJtjAp5/7Emj4Klf4bP6MjW+8tctXKkNPAWtFftVc3lkcHK7TXUcCpU/
 MExAtGT3GrwU9uYI5mzLZQ4VpnR63yIvHVObNU3lnPZgzJtZxLTfRLKsrZOTSkAd3n0i
 wJ91fMd96bOstUh3iSbEON9Arl3C+6W7dHo7TJUPM+cPEIq3AX6ycW2GYhXnX37WMHDj
 TF0GgxRgvd1+nIPdlrHj+JLGMMxwE740JUNdMXwslSjHARd5AAEq4xli9Gmh+pb60bw3
 xUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508522; x=1778113322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4qYbU7+TPTFqGiBQwxxMXvd6dGbNUHDSbf7XY1Mn5Rg=;
 b=bjEgQlx0lmn+QV1P9exMHPOfU+O2tIu9xlK3L4GHSPJrIZXLcp/sV/RXygS/vtaMo8
 JZUjqJXZ76/ThF3J6AZlstVDORfLMpSaqHM87I25kKDDlmRGhcGBYk7KZVCsAP5XjQGH
 g9h6YHESDBvZk/epJAgCSu3xxqtsmM0wnMWIXOnV6J9vST0ozMb7829+ztdqilEQkAMT
 WrUcVk5mUg816N+N0eL5GSwcW5P4iU441+vPMIFCKJX6E11Wr6ICC7ZGGrDOnjs2pabq
 7ohQovnpxJ3HAXFoGcEDfOb5ujCFjFQYSAkuvHlekF76tNhAbUuAuyiNvp86nzsytZvO
 xk7A==
X-Gm-Message-State: AOJu0Yw03WZcUYKguJQeZFztQQJRNZPUpIbRymlOV2d5HhZk30oONM+C
 WX/+eQyg8EsTfUwOBwYbYc7dO55YQeup0ikmELvyFhJwdnmFCJpaXblkh9x/WUfTQk9/wWMoyFO
 oNbtDieo=
X-Gm-Gg: AeBDietAr2kZvwWfH8+jXyqoGcPaU4TBKDbarPgnKuz3Y6/sTz2LHcu2CSoBiGT0sQj
 WDHcfV+t5G8GBx2AMJvUIvWVlQMed2uB7ShIY538JI5jxsUWValzJV9YgH6XOKG++c9eoXmp+ho
 m+j4XFpn0E14TsL1oQ6RkW/Bx+VgHwJJBe0eZubFgJna2sbWS2TocdShMDloEFNgFVdSpcPPz42
 ysxuqL+RqXp2uAEP8wc4ltTXcEsyiqX1/r/cP8flZel3nIzhS0nogYQgDP1kG8hV70bf6W5M4JB
 NFTnwtw8P3d911+XfbTrBEefhDrPP2nc0fSdDbnekWF2Ch/MEmyZeaR+Eld7CyM7DxLRvqzAyZO
 LSttrt2gKXJIPrIwQcTFcvQBkbT8lW1iOESoIk1q1HZnQM83TPktrc73wOwzVKr6a1NgkBBtjls
 BS4p33FbBTpRtkB2wWDxZaPISWHGxB2o92vB73bmNP
X-Received: by 2002:a05:6a00:2e0d:b0:82f:5c3f:94c6 with SMTP id
 d2e1a72fcca58-834fdcdeaafmr835948b3a.28.1777508521985; 
 Wed, 29 Apr 2026 17:22:01 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:22:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 32/47] target/arm: Implement FCVTNB, FCVTNT for SVE
Date: Thu, 30 Apr 2026 10:20:31 +1000
Message-ID: <20260430002046.59739-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
 target/arm/tcg/fp8_helper.c      | 87 +++++++++++++++++++++++++++++++-
 target/arm/tcg/translate-sve.c   |  4 ++
 target/arm/tcg/sve.decode        |  2 +
 4 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index e67fb191c2..5863a6dbb8 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -19,3 +19,5 @@ DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(advsimd_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvtnb_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvtnt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 9c89964721..f92ffe68e3 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -626,7 +626,6 @@ void HELPER(sve2_fcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     fp8_finish(env, &ctx);
 }
 
-
 void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
                              CPUARMState *env, uint32_t desc)
 {
@@ -668,3 +667,89 @@ void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
     fp8_finish(env, &ctx);
     clear_tail(vd, ctx.high ? 16 : 8, simd_maxsz(desc));
 }
+
+void HELPER(sve2_fcvtnb_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint32_t *n0 = vn;
+    uint32_t *n1 = vn + sizeof(ARMVectorReg);
+    uint16_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float32 e0 = n0[H2(i)];
+            float32 e1 = n1[H2(i)];
+            d[H2(2 * i + 0)] =
+                fcvt_f32_to_fp8e5m2(e0, ctx.scale, osc, &ctx.stat);
+            d[H2(2 * i + 1)] =
+                fcvt_f32_to_fp8e5m2(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float32 e0 = n0[H2(i)];
+            float32 e1 = n1[H2(i)];
+            d[H2(2 * i + 0)] =
+                fcvt_f32_to_fp8e4m3(e0, ctx.scale, osc, &ctx.stat);
+            d[H2(2 * i + 1)] =
+                fcvt_f32_to_fp8e4m3(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    default:
+        /* -1 in each even field, 0 in each odd field. */
+        for (size_t i = 0; i < oprsz; i += 8) {
+            *(uint64_t *)(vd + i) = 0x00ff00ff00ff00ffull;
+        }
+        float_raise(float_flag_invalid, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+}
+
+void HELPER(sve2_fcvtnt_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint32_t *n0 = vn;
+    uint32_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float32 e0 = n0[H2(i)];
+            float32 e1 = n1[H2(i)];
+            d[H1(4 * i + 1)] =
+                fcvt_f32_to_fp8e5m2(e0, ctx.scale, osc, &ctx.stat);
+            d[H1(4 * i + 3)] =
+                fcvt_f32_to_fp8e5m2(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float32 e0 = n0[H2(i)];
+            float32 e1 = n1[H2(i)];
+            d[H1(4 * i + 1)] =
+                fcvt_f32_to_fp8e4m3(e0, ctx.scale, osc, &ctx.stat);
+            d[H1(4 * i + 3)] =
+                fcvt_f32_to_fp8e4m3(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    default:
+        /* -1 in each odd field, even fields unchanged. */
+        for (size_t i = 0; i < oprsz; i += 8) {
+            *(uint64_t *)(vd + i) |= 0xff00ff00ff00ff00ull;
+        }
+        float_raise(float_flag_invalid, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index c7fcf27183..13f7ab01af 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4103,6 +4103,10 @@ TRANS_FEAT(FCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
            a, gen_helper_sve2_fcvtn_bh, false, false)
 TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
            a, gen_helper_sve2_bfcvtn_bh, false, false)
+TRANS_FEAT(FCVTNB, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_fcvtnb_bs, false, false)
+TRANS_FEAT(FCVTNT, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_fcvtnt_bs, false, false)
 
 /*
  *** SVE Floating Point Compare with Zero Group
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 806953bc35..7fce189b36 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1103,6 +1103,8 @@ BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
 
 FCVTN           01100101 00 001 010 001100 ....0 .....          @rd_rnx2 esz=1
 BFCVTN          01100101 00 001 010 001110 ....0 .....          @rd_rnx2 esz=1
+FCVTNB          01100101 00 001 010 001101 ....0 .....          @rd_rnx2 esz=1
+FCVTNT          01100101 00 001 010 001111 ....0 .....          @rd_rnx2 esz=1
 
 ### SVE FP Compare with Zero Group
 
-- 
2.43.0


