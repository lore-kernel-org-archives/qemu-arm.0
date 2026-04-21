Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D28EA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:18:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Se-0000YN-5K; Tue, 21 Apr 2026 01:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3S3-0008Nd-M4
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:12 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3S1-0006uJ-P0
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:11 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b2589c26e3so34133215ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748508; x=1777353308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wW+LW+Nt1rhrQi5WxMDAPWgTbe7PVFsy6KMvcn0ZFDU=;
 b=EmSjA5haqH6rZein6PbDTFbgvLMb4zSkQdHsyvIcmC+A0cOvr8yzkO24Qi0dqry/LD
 BOYTyp8IHW58KdBxTbdB+r0eo2Xzu76Ks5q+1l1BiVXVf8XOsimURDgM32Ac7hKh0ssb
 /JkfcVNF8Kpydf6XUw74nnEruTp8LjqZ5kNRUaO7HM+fc8xfZWTYz6e6LMM/3v3dUJ0J
 ptfRaSMugLq0gkDyx/kgHvreA0M3Xe5/WimVm78x08z9P/865GL4G2SKxj+HT+XkLQuk
 dvvavgxpfAsjbpqsm5iSgAY2bgZ263dR0cJJNuCVx9RbTMV4uNPj1/qlkujQqSu8BYyv
 1lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748508; x=1777353308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wW+LW+Nt1rhrQi5WxMDAPWgTbe7PVFsy6KMvcn0ZFDU=;
 b=lcsULcSsgZ4a2zbq3vrDuTNNCLIhXzK5P9zcSREldXIOz0vZCvw9lzwJskKy7cjJhA
 PeKWq91J6Jv6im1pXJZ0x7BbhcIlSdSFGYD0WYeqD2pn0OFrq/sfUxzSp1HtwdlRbbVp
 dC0tkcGUtvJyQAtNh6kaWmPt01pdGbu7leak9uXTjC3IFGeUbmya04O0PSeT4IwrA+uD
 Zx3+pauS9iaSltWBpR8GjK6XUXzKhzixC9KrOxj1VV6rg2HAc8CSHizA63RIiH9JMVMn
 HB/ddnZt8t6icicRGgCIH6Fok2jofv4TRGEFGquDDKxH7VWEt/udP0z6CmUsaXE9OaPW
 XXAw==
X-Gm-Message-State: AOJu0YyclkeDNtrNbyerHnYCnZFTi8J4ihKXt6wC7i/welIVLuYHPkRv
 iOQiTyOQtIBXMr0uFNJpu6X3UCOXAsBOIcVvdlqPU6koT7l+PTU5pkgpiTpbDeNF7V1v2Wq2AmG
 cFwthC1w=
X-Gm-Gg: AeBDiesJwUjtdl6FYvP7Hi1dsi+vjAOgHNfRgxpa8P5FLAzxv7wAezdjG9XqpJky9bL
 R2gVnh4YKxBNGEdhuM8CSVPi8pu8G1f24LYrVj2G0WvIr4t1BbbMxkFxqb4ydifqIUMECuW3DJr
 MXhf1haofEzfIH8wqTkeV9zIFb9UKJQDczLTJOeauIgiXZYQ+1wHR2LqUGYm2K+2yywYlXWIQ6w
 mmZ6EoHoj+qJQDDpbhoPqBHSVI8nWbCrOsWYl+Xom1mRq97KfkUAnyxM794FzYdLC0M93llPj1w
 CbNFAEV/rVuAHH2ZDBG9uPwf6JjbuQi5i2BxrjsuravGTp0hrTgb5rpmbAzCD34w36oN2shlCr3
 oQEyC/OP7ivxvLGOyhdilMO4MWYRwxHTJ0xFxb+alon0B3ZNc2Xj6wEyB5ChHBwoC3Oh6FPW418
 BNA0ZaZrEUR2bfQMvE8SO8I8lB5aRvM1qSzNoLRQyS
X-Received: by 2002:a17:902:7207:b0:2ae:ced7:4650 with SMTP id
 d9443c01a7336-2b5f9f7d14emr113637475ad.24.1776748508012; 
 Mon, 20 Apr 2026 22:15:08 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:15:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 32/37] target/arm: Implement FCVTN,
 FCVTN2 (32- to 8-bit fp) for AdvSIMD
Date: Tue, 21 Apr 2026 15:13:41 +1000
Message-ID: <20260421051346.41106-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
 target/arm/tcg/fp8_helper.c      | 42 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   | 16 ++++++++++++
 target/arm/tcg/a64.decode        |  1 +
 4 files changed, 61 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 6530d1a6da..023a49e12f 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -16,3 +16,5 @@ DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(advsimd_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 6241297269..fecd9cca0b 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -480,3 +480,45 @@ void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
     fp8_finish(env, &ctx);
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
+                             CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint32_t *n = vn, *m = vm, scratch[4];
+    uint8_t *d = vd + 8 * ctx.high;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+
+    if (vd == vm) {
+        m = memcpy(scratch, vm, 16);
+    }
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < 4; ++i) {
+            float32 e = n[H2(i)];
+            d[H1(i + 0)] = float32_to_float8_e5m2(e, ctx.scale, osc, &ctx.stat);
+        }
+        for (size_t i = 0; i < 4; ++i) {
+            float16 e = m[H2(i)];
+            d[H1(i + 4)] = float16_to_float8_e5m2(e, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < 4; ++i) {
+            float16 e = n[H2(i)];
+            d[H1(i + 0)] = float16_to_float8_e4m3(e, ctx.scale, osc, &ctx.stat);
+        }
+        for (size_t i = 0; i < 4; ++i) {
+            float16 e = m[H2(i)];
+            d[H1(i + 4)] = float16_to_float8_e4m3(e, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    default:
+        float8_invalid_output(d, 8, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+    clear_tail(vd, ctx.high ? 16 : 8, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 93c883de88..6013226266 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6536,6 +6536,22 @@ static bool trans_FCVTN_bh(DisasContext *s, arg_qrrr_e *a)
     return true;
 }
 
+static bool trans_FCVTN_bs(DisasContext *s, arg_qrrr_e *a)
+{
+    if (!dc_isar_feature(aa64_f8cvt, s)) {
+        return false;
+    }
+    if (fpmr_access_check(s) && fp_access_check(s)) {
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, 16, vec_full_reg_size(s),
+                           (a->q << 1) | FPST_A64 << 2,
+                           gen_helper_advsimd_fcvt_bs);
+    }
+    return true;
+}
+
 static bool do_fmlal(DisasContext *s, arg_qrrr_e *a, bool is_s, bool is_2)
 {
     if (fp_access_check(s)) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 71456d44e1..a9cf259b9b 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1202,6 +1202,7 @@ FSCALE          0.10 1110 110 ..... 00111 1 ..... ..... @qrrr_h
 FSCALE          0.10 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
 
 FCVTN_bh        0.00 1110 010 ..... 11110 1 ..... ..... @qrrr_h
+FCVTN_bs        0.00 1110 000 ..... 11110 1 ..... ..... @qrrr_h
 
 ### Advanced SIMD scalar x indexed element
 
-- 
2.43.0


