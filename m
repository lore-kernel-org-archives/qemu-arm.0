Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E214AEA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:18:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Sd-0000Xg-C2; Tue, 21 Apr 2026 01:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3S1-0008LB-K2
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:09 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Rz-0006tD-KZ
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:09 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-c76c60c7502so1751784a12.0
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748506; x=1777353306; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJ1VXgG74f8s4Xmso5BQZxSExdCoj+QRYM7tqnseBPw=;
 b=gt58P+9770apCT6Tnri7nWaMCjQfzgpdyZn6kPQpzCuh6cHnHfnNZepM7GSup0U6Q3
 ZB9TASc35EbHgb46D2cmRZVo4GGxYXe2TX0fwiFo5nlvwv7xKQn9uoxrmyUY0K9P0CRD
 0mz6EgKr2hzpfpZyp4llUO/3ZMLsuTfsPeC3zQlCyhRdZn4vFjL8iPe1GpiS3uh946aj
 5YNjOuJI5iV27IoXh25Zu3kmCASEJcR6sO7pXNKeBNXCV5d7YN0BbUXN84de12LPCY8y
 VBo7LoE8DuLud5ukI/PeQKGX0xXeDjmzlkkMZt1E+HfwOAzPF8eUPGlLecM9ezbEvUmZ
 D+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748506; x=1777353306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GJ1VXgG74f8s4Xmso5BQZxSExdCoj+QRYM7tqnseBPw=;
 b=Z20WtOiv2zVNQShS3etTHBOhsEXo3R9jtQllIZL0GxP86gSrEIfft3xiDs8J1NyJuE
 f4Y0y+VFFuTy8WXHcOWfH7u51yHDrDO11f7IVm+3MyYajLoZHYvZRqihoqMXWjN7cdpp
 RkaeCZbljJ70Y4SkTYyJMifQmJfyPVa+WIdtT2f7WA0IZlwXG4eSk+WqnUKWbsgoAtA5
 qpuAumbrNweybl+7/8hT4YgEwdOXJ074cFpr/4/s34hdDoq32vUQ73B7AByYj1VaMXCJ
 9HZe+ULzAwsCPYnbfUxJZlnBbTXky/f2pVRs0QEThyQwshJfnQLRFdlMbsB8t2cvk9tn
 dK8Q==
X-Gm-Message-State: AOJu0YwOhfqdZyoZSzV33Kbr6FYtksJNr9A8MYuVHkk5zmSzt5QbSPMI
 dUESvEJ34aYeCkkVJCFVtn5SP5X0fVe+N/+z6zDUBZ+kUvDgj9zqUhUobBEruXGBuOEhK42edtA
 UJ1eHwko=
X-Gm-Gg: AeBDieuAllhzeBJASqRdYinndniMieFZ0DQlrzKsJBDcC+8ebpUQUdRPHBhEsP2quZz
 R4FIkMsilYy3X0OyYLqavJTLDLRlzJpq8sPe94BuV3jhTvsstBUSEP5x7mj0yhsS5QUi3kGPZpe
 N6OvCW1G1Pd6XazAdIcUnu2U1+HF8fBQ5t/5P9bbkAcWSAOnFlIF4kq73sdqgMa9dxrbkL2bPp7
 cww7oc4d0v7wCx/gJkLoWMQMnzLZFAZqquiveBQZpxCqaLp7Ax8KXl28BwCqdwJO0ExPqjUoenG
 gxCOdS9HnE/10E4nrEnxhul+AFBhw419NTBD70QG8rcUOw5L9N5/wYy2tkA+w2PVokWg2hxqzOR
 6tNzW1rp7GmWtM1+ugu953qApKUSmzVyUO50nkBHDMxUP+VWBVStN9TzmRO05kXO3SPvRSJsvRa
 L16iBjLJMWz6mqsU5tCXEZZAkBwnt79ccHqONIoDCm
X-Received: by 2002:a17:902:f541:b0:2b0:4f7a:1958 with SMTP id
 d9443c01a7336-2b5f9efa280mr147131115ad.29.1776748505629; 
 Mon, 20 Apr 2026 22:15:05 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:15:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 31/37] target/arm: Implement FCVTN (16- to 8-bit fp) for
 AdvSIMD
Date: Tue, 21 Apr 2026 15:13:40 +1000
Message-ID: <20260421051346.41106-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
 target/arm/tcg/fp8_helper.c      | 48 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   | 15 ++++++++++
 target/arm/tcg/a64.decode        |  2 ++
 4 files changed, 67 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index bbc8d69e28..6530d1a6da 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -14,3 +14,5 @@ DEF_HELPER_FLAGS_4(sme2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index ad5a2dc64d..6241297269 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -432,3 +432,51 @@ void HELPER(sve2_bfcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_finish(env, &ctx);
 }
+
+void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
+                          CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint16_t *n = vn;
+    uint16_t *m = vm;
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    ARMVectorReg scratch;
+
+    if (vd == vm) {
+        m = memcpy(&scratch, vm, oprsz);
+    }
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e = n[H2(i)];
+            d[H1(i)] = float16_to_float8_e5m2(e, ctx.scale, osc, &ctx.stat);
+        }
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e = m[H2(i)];
+            d[H1(i) + nelem] =
+                float16_to_float8_e5m2(e, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e = n[H2(i)];
+            d[H1(i)] = float16_to_float8_e4m3(e, ctx.scale, osc, &ctx.stat);
+        }
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e = m[H2(i)];
+            d[H1(i) + nelem] =
+                float16_to_float8_e4m3(e, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    default:
+        float8_invalid_output(d, oprsz, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b3fbc5f193..93c883de88 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6521,6 +6521,21 @@ static gen_helper_gvec_3_ptr * const f_vector_fscale[3] = {
 };
 TRANS_FEAT(FSCALE, aa64_f8cvt, do_fp3_vector, a, 0, f_vector_fscale)
 
+static bool trans_FCVTN_bh(DisasContext *s, arg_qrrr_e *a)
+{
+    if (!dc_isar_feature(aa64_f8cvt, s)) {
+        return false;
+    }
+    if (fpmr_access_check(s) && fp_access_check(s)) {
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, a->q ? 16 : 8, vec_full_reg_size(s),
+                           FPST_A64 << 2, gen_helper_gvec_fcvt_bh);
+    }
+    return true;
+}
+
 static bool do_fmlal(DisasContext *s, arg_qrrr_e *a, bool is_s, bool is_2)
 {
     if (fp_access_check(s)) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 26d31d0a33..71456d44e1 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1201,6 +1201,8 @@ FAMIN           0.10 1110 1.1 ..... 11011 1 ..... ..... @qrrr_sd
 FSCALE          0.10 1110 110 ..... 00111 1 ..... ..... @qrrr_h
 FSCALE          0.10 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
 
+FCVTN_bh        0.00 1110 010 ..... 11110 1 ..... ..... @qrrr_h
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0


