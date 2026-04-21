Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6C0F55805
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:19:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Sb-0000VR-8Q; Tue, 21 Apr 2026 01:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Ry-0008Ix-V8
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:06 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Rw-0006nn-Rs
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:06 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2ad9f316d68so16885765ad.2
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748503; x=1777353303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEaE+Gz4pYUADHfndZN2FYmsXkuJHrO7JwM42EplOck=;
 b=EtyXz6i2tuBI3azUy2iFLBeG2wBEu/xNHbdMpIzwcJh+A2idfR4iNvj9KFvejQrgEH
 Ud0keRSTqnEROixSX7qsUjuWFLI45hrMuCvpQnAq7jsQbr+Xqg1pr315KifRIEaYFWYv
 LljjwnADoTm0E2Q/UXsAZPe13dA5iMyq2bZkaHiQAFeoB2V1kdvO1Jt0BlSV8Gpnjto7
 rZx2yiHChaKJMCMvK22e5O3QJ20LYSIFQugY0ij5WQ53vBsri83OJO/aOIrqc78C5cEs
 GClukZIP9o1dwB/YxVPReoW5SGG2tv9jMDMzGs8TxC2Un7bJVB0diHLg4Fnax7L9Q6A6
 Blyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748503; x=1777353303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pEaE+Gz4pYUADHfndZN2FYmsXkuJHrO7JwM42EplOck=;
 b=VKtoxxmV9GCrfvT7C1tIws0OfgDEyF4p48uFM9vX5gD2/0lVuUCmCaWw/LoYXKsZuY
 s2/CWGxWLckV4rRC6cl30VgstpBnitE2/cWgjzA2tyzTfacJgOIjlEZyG+7KUcwj0CwO
 vx6EMZG5sOBRsKocs/ZQ3sIisTJ1fsgKsuEUqJcMlibbYWu+n+9DtIStE4u8Md7VYptA
 l73qimT8F43uHpPN5xLipRsCUbUnTUc+lUodm8S5fVitdsw2k/kZq0SpFrOok2BAU5r1
 uciKP9gOVNYD0zSCuX5dHucpHymZtLqbtRsn6U/vBOSg1FENQjZlP3Dzd57AdkN/XeqQ
 8btQ==
X-Gm-Message-State: AOJu0YybbOndG8JzULIyY2itCoxRgxV7wIs9bubijr2hG6m+LyKC9nT8
 0roBgBIO0tohxmNJc0MpPWmcQNNjfnjut7inR8ZWCb9c3pyNBfJQYKi0NwBkIBkiTIo=
X-Gm-Gg: AeBDieuR4LNM67LuzxQx/rpAIiuQAtiLIeNMD426UiHrcqMQHXoW4mfeXNv1wg6O8Ay
 zrjN395+P0HLUwbQXv/r3dtPjHIaO3Oe3X0sQvwEHN5y+AyxPMpT+RCIo8TvkyFHDxPUXuggCqa
 1n7rdQ+LKZTm4D4I7AZ1Le6/cYkxOUcVwgWrlOCCNYVk3vCgiBS6Z3EIiWmR9fE+xLrksSlSJwv
 Znta/nSNzI29SwrjbaEJvEw4lnt3xHb/FElupLDUZkHaLbdTZI4+/xj6eCSrLEzrNJmPfMCVVdg
 tVVfFp6puOG6DkQRBRA822MIo1XQUFxgbkyNP5sdN784uSwdtH5Fkt72+tEDN6wfYH29mZ/0Z4N
 rieDTOG+4ic5nCnG2cpKdneGVpyRa/Qhr4PeJOYNGtqxsaty3CR9oaqnSuheSCAad1EJ/6umDKZ
 WmPa5cPyRu1mJL0qKLKQ7b1w+GdwrLlW20sw1HWdLf
X-Received: by 2002:a17:902:d592:b0:2b0:ccad:de1a with SMTP id
 d9443c01a7336-2b5f9f3aa58mr158637985ad.30.1776748503316; 
 Mon, 20 Apr 2026 22:15:03 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:15:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 30/37] target/arm: Implement BFCVTN for SVE
Date: Tue, 21 Apr 2026 15:13:39 +1000
Message-ID: <20260421051346.41106-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 55 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  3 ++
 target/arm/tcg/sve.decode        |  2 ++
 4 files changed, 62 insertions(+)

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
index 2b1955508d..ad5a2dc64d 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -77,6 +77,15 @@ static FP8Context fp8_src_start(CPUARMState *env, uint32_t desc, int scale_mask)
     return fp8_start(env, desc, f8fmt, scale);
 }
 
+static FP8Context fp8_dst_start(CPUARMState *env, uint32_t desc)
+{
+    uint64_t fpmr = env->vfp.fpmr;
+    FPMRType f8fmt = FIELD_EX64(fpmr, FPMR, F8D);
+    int scale = FIELD_SEX64(fpmr, FPMR, NSCALE);
+
+    return fp8_start(env, desc, f8fmt, scale);
+}
+
 /*
  * Invalid input format is treated as snan, then the conversion operation
  * converts to default nan and raises invalid.
@@ -101,6 +110,13 @@ static void float16_invalid_input(float16 *d, size_t nelem, float_status *s)
     float_raise(float_flag_invalid | float_flag_invalid_snan, s);
 }
 
+/* Invalid output format writes -1 and raises invalid.  */
+static void float8_invalid_output(uint8_t *d, size_t nelem, float_status *s)
+{
+    memset(d, -1, nelem);
+    float_raise(float_flag_invalid, s);
+}
+
 void HELPER(advsimd_bfcvtl)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -377,3 +393,42 @@ void HELPER(sme2_fcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_finish(env, &ctx);
 }
+
+void HELPER(sve2_bfcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            bfloat16 e0 = n0[H2(i)];
+            bfloat16 e1 = n1[H2(i)];
+            d[H1(2 * i + 0)] =
+                bfloat16_to_float8_e5m2(e0, ctx.scale, osc, &ctx.stat);
+            d[H1(2 * i + 1)] =
+                bfloat16_to_float8_e5m2(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            bfloat16 e0 = n0[H2(i)];
+            bfloat16 e1 = n1[H2(i)];
+            d[H1(2 * i + 0)] =
+                bfloat16_to_float8_e4m3(e0, ctx.scale, osc, &ctx.stat);
+            d[H1(2 * i + 1)] =
+                bfloat16_to_float8_e4m3(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    default:
+        float8_invalid_output(d, oprsz, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index e31ab609f9..54f1b253c6 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4098,6 +4098,9 @@ TRANS_FEAT(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
 TRANS_FEAT(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
            gen_helper_sve2_bfcvt, true, true)
 
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


