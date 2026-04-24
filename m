Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228ABFB44A4
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:35:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8DM-0002KF-0n; Fri, 24 Apr 2026 00:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8DK-0002Bv-42
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:32:26 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8DH-0003Xv-BQ
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:32:25 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-4243bf9be36so3461536fac.3
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005142; x=1777609942; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMcr01u60LrCES988dBDvl79mkeVcUNH9ZYKZAUuh5E=;
 b=KL+pV7E3KGebFNDe41gR+k2rdkg59o1eI6nSk6bBfFIxJNYPdc5EZIBUsOLpKOK7gQ
 64r7Qqvn8A90iG2RRQznndqhRFwMNS1BA9X4iR9X5AGIq9q/jNdDx9OPjzi3kJhTwMUF
 2skpOxKCySCu3XGY84My9Oa6X8WENPksjSZdECuKekStrYk8VuVjokCj8r607UFvLgQt
 N4whKu4N0unrH6ISkkN1Gzl4cot7M0LWPPLQmfxp8y1uSGfS/13ZS4yiApOTuVReQVmk
 TsTpR6F4qaJx9LCO9AaXvMnVo+dN9WXOC1zzhFoQV5xrYpzea3sKXJOgOIQTLZqn9SAr
 1C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005142; x=1777609942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UMcr01u60LrCES988dBDvl79mkeVcUNH9ZYKZAUuh5E=;
 b=Q/XaB6e/txCRZTOuJlbwg+Z1VOeVO3Gx9iUOJltor0VvBYzZHlyk55+v3NvMhS9Moa
 7LpisVLTbPWngjo8AyuF+npH91MKtl8dgIhxmICH7JwS63Q5bnuQy2+P7JK9D2eXIwkW
 /93FOL5qRBtaYvPyTD0O+JYkRGKYrNVrPed9o229jSYgSvpAYiQ9irabJf3N4y+t232S
 vmvDxepqL8n6a8az8/yeeOPreXgKuzHaW7a+nNV5n8Di2QDWWkDa0biEc4lGhbjJ1Bb/
 8fZJ6I3D7RBqcVEox3Wrwn6R/PeVP3kHC+hPT/EYPZAicpkqJpBU4yl2lzVlNEgLu4oR
 DZ1w==
X-Gm-Message-State: AOJu0YwRyDtl/Y58Lsf5LbPuryM0mrI/dzy/2wp4lLXVVamSUnsct3bd
 YHMED8G4pSwV+xds/9myBy0ulvYuezASaL2fHQFELcacOBjIROS1AW9FRyR6FbxnmNMfDKlQAP2
 q0a/wWic=
X-Gm-Gg: AeBDievuhQ/FRaWD3wWaLOM6u7V3c0RWx/Iyd2U6ai8eS6hfsyElztTlOeXrdLlVm+S
 Sx7EyFP2uR8bGaFXv6q1Vio731OsxZvwH5QEh++QcEOm1TGoeoTvYBrx8ct9k+vmDMcXbZ2OJvE
 bgPVbjrue2nvBFKq9dtpZmLqNjUDYn0PLCNyCcEhPWf0Ll2i8o7HcFql7SFxwikiproavAfZ9EW
 4zCnxQ/kRl/stFkwpCZSLlRArhYA1lEROKNTBYCwv0mLmXjHX0Vy8aeN3SHyKUQj/NIMdEiz0KE
 n8m2CkPPtVblmzo2oyc1ZvghYAmlwzGXlJNQe6bCvGioCLdk/CEDXhaR5V/YgBT9nZJ/iDfb2Za
 tTzxMxRQbVcYqTXWRvlYYv5gVpd8MsUcYAVkEGb/lfyAUe1r6K9FoSKpQNg0OKIDYMbiI51blDG
 BlHAjfnx7vEh5UpQ8ZueAxiUhNt8X/ytnvnjJLIql3f1L9jYgaRwuF0VSvG+Hw7lHFxFNC/hMt
X-Received: by 2002:a05:6870:968d:b0:42c:1cbb:5f5b with SMTP id
 586e51a60fabf-42c1cbc662amr10115100fac.31.1777005141917; 
 Thu, 23 Apr 2026 21:32:21 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:32:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 29/40] target/arm: Implement F1CVT, F1CVTL, F2CVT,
 F2CVTL for SME
Date: Fri, 24 Apr 2026 14:30:03 +1000
Message-ID: <20260424043014.46305-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
 target/arm/tcg/fp8_helper.c      | 79 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   |  5 ++
 target/arm/tcg/sme.decode        |  5 ++
 4 files changed, 91 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 3021dafd44..b5dc2b7064 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -10,3 +10,5 @@ DEF_HELPER_FLAGS_4(sme2_bfcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 32c7a82647..2b1955508d 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -264,6 +264,50 @@ void HELPER(sme2_bfcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     fp8_finish(env, &ctx);
 }
 
+void HELPER(sme2_fcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    uint8_t *n = vn;
+    uint16_t *d0 = vd;
+    uint16_t *d1 = vd + sizeof(ARMVectorReg);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    ARMVectorReg scratch;
+
+    if (vectors_overlap(vd, 2, vn, 1)) {
+        n = memcpy(&scratch, vn, oprsz);
+    }
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float8_e5m2 e = n[H1(i)];
+            d0[H2(i)] = float8_e5m2_to_float16(e, ctx.scale, &ctx.stat);
+        }
+        for (size_t i = 0; i < nelem; ++i) {
+            float8_e5m2 e = n[H1(i) + nelem];
+            d1[H2(i)] = float8_e5m2_to_float16(e, ctx.scale, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float8_e4m3 e = n[H1(i)];
+            d0[H2(i)] = float8_e4m3_to_float16(e, ctx.scale, &ctx.stat);
+        }
+        for (size_t i = 0; i < nelem; ++i) {
+            float8_e4m3 e = n[H1(i) + nelem];
+            d1[H2(i)] = float8_e4m3_to_float16(e, ctx.scale, &ctx.stat);
+        }
+        break;
+    default:
+        float16_invalid_input(d0, nelem, &ctx.stat);
+        memcpy(d1, d0, oprsz);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+}
+
 void HELPER(sme2_bfcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -298,3 +342,38 @@ void HELPER(sme2_bfcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_finish(env, &ctx);
 }
+
+void HELPER(sme2_fcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    uint8_t *n = vn;
+    uint16_t *d0 = vd;
+    uint16_t *d1 = vd + sizeof(ARMVectorReg);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float8_e5m2 e0 = n[H1(2 * i + 0)];
+            float8_e5m2 e1 = n[H1(2 * i + 1)];
+            d0[H2(i)] = float8_e5m2_to_float16(e0, ctx.scale, &ctx.stat);
+            d1[H2(i)] = float8_e5m2_to_float16(e1, ctx.scale, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float8_e4m3 e0 = n[H1(2 * i + 0)];
+            float8_e4m3 e1 = n[H1(2 * i + 1)];
+            d0[H2(i)] = float8_e4m3_to_float16(e0, ctx.scale, &ctx.stat);
+            d1[H2(i)] = float8_e4m3_to_float16(e1, ctx.scale, &ctx.stat);
+        }
+        break;
+    default:
+        float16_invalid_input(d0, nelem, &ctx.stat);
+        memcpy(d1, d0, oprsz);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 3e1da83535..29d116a57a 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1545,6 +1545,11 @@ static bool do_f8cvt(DisasContext *s, arg_zz_n *a,
     return true;
 }
 
+TRANS_FEAT(F1CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvt_hb, 0)
+TRANS_FEAT(F2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvt_hb, 1)
+TRANS_FEAT(F1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvtl_hb, 0)
+TRANS_FEAT(F2CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvtl_hb, 1)
+
 TRANS_FEAT(BF1CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 0)
 TRANS_FEAT(BF2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 1)
 TRANS_FEAT(BF1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvtl_hb, 0)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index df9586c1a5..d6192eb59d 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -853,6 +853,11 @@ UUNPK_4bh       11000001 011 10101 111000 ....0 ...01       @zz_4x2_n1
 UUNPK_4hs       11000001 101 10101 111000 ....0 ...01       @zz_4x2_n1
 UUNPK_4sd       11000001 111 10101 111000 ....0 ...01       @zz_4x2_n1
 
+F1CVT           11000001 001 00110 111000 ..... ....0       @zz_2x1
+F2CVT           11000001 101 00110 111000 ..... ....0       @zz_2x1
+F1CVTL          11000001 001 00110 111000 ..... ....1       @zz_2x1
+F2CVTL          11000001 101 00110 111000 ..... ....1       @zz_2x1
+
 BF1CVT          11000001 011 00110 111000 ..... ....0       @zz_2x1
 BF2CVT          11000001 111 00110 111000 ..... ....0       @zz_2x1
 BF1CVTL         11000001 011 00110 111000 ..... ....1       @zz_2x1
-- 
2.43.0


