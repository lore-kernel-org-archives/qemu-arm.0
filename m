Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED38BCD98CC
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:31:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX28A-0003Wc-8g; Tue, 09 Jun 2026 15:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21v-0003aH-2w
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:36 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21k-00043O-MF
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:27 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2c0bb4a94b8so50347545ad.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032879; x=1781637679; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eidadIHZOQyB/SuKSXnQnTco+rbFHJLAnIxWl8Mn6gM=;
 b=N1EXkTvh0CDr5Q2d+Ed3xQQ17GmPLttTYlG+9RwCzS9tthehy4v8eyJ/5GWuMCsCCy
 7sJdP5MRh0yMBr4zIPdI4oKB38m/AOpF3dYxeGT8sHWcVHcXE17AMR0VSl9+TaflpiCH
 Zai0qCrYqv+brlMoy+YTMs3l+X7EfnTTV1bmVvGfgdyc5eUVttI5lSAoqu/QhhvurbtG
 k3toZFqOKIBXbcoTPYvIPt3QfNY5VNnbR/e4mrYwWW+8Bwa9FCX1rOkmVhNzxiEQrqqt
 85yKfTE+oMrqcCF14FN/nGIrlrSA6FHHoZGJcRM4pflXPQBHOdgdOi0ngdRX2Ie8Shw2
 sLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032879; x=1781637679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eidadIHZOQyB/SuKSXnQnTco+rbFHJLAnIxWl8Mn6gM=;
 b=YRLvEdstRoUyGFHAipBXM9Ponqm10mzjRugaOlDTE7VPwcm84OlLYZrMERk1f/nMJb
 v85H2GAMwXMTuCq9zUwsz6QNFvRS/yedazheoytmngs/+P+hIDUcaKNpDTfpiyZHspAj
 9KC5BaE+yawOXdJ5KLLW4gjRuRUTqs2at2KB3VZH+yv1G65NsSbQMgxqNRnndVJ3lc8s
 4K0DaD5pZwDZVEWGKlygX7Lfv3NWtjuRTy8CmDrx7Hq3NW6tc0oCviy2IjFtWnTBskIk
 loqH/u2Ej/owlirGWUobzGIiEThEK080YEBbfNuBrrhx6g3duOscIMd+WdmZ/8RohXc5
 oH3g==
X-Gm-Message-State: AOJu0YyoUuca+GZMNUy9H9VmvJYQ8uIT3Mk/0biq3FyGzstGRjza7C36
 rsY6+gr1d15mjTUgYIIEato/eXl+1yD/ivou2q18lwgsWQmL3ocx1suvNfOXoGfZsg+jDZkV0Id
 hu2je1Dk=
X-Gm-Gg: Acq92OHYU6GfztBzqQ1RNF/337pFGtrIQZg7lx1b1CuqSJ83ba4Q8g2uOoBApSNnVij
 USLt9pYxiIvizMWNJ0G++GtYoyzwc9sesEtMJ22/zxG20TWhsv+BozBoyphPjQdqa9W6yhDisnU
 UcYhFX0yleCCDFucADOa0HHQNxOc9vWiTqqZKV/UQNw/AOrXWMLnPNQKZAnIytZPpUEsbFipjvO
 HLxcYezD1lr/Gu1iwe9rxgURbW2X4ftKxEbsx31Kqfs310A9OV4xuAEymYamCLBbkMSDhg1ARkn
 pUypBDAP1DWNl5Af5weCaqgQxFDtSvUqPwQXSFBViZnnP8rwjvbRRCv3VFsC8hgknz/r3lutta2
 KiSwIeKP7t9sNBroD3JfGYJ9aKfnCTzulvnG7jSifs03CtLJiA8053Z4uT9SmlNsVwa+F84y1yM
 enULLYabgXoPNJAqzH4cy/pKWcX0Lk73kanhPe0ILZVJXL0iMmkg==
X-Received: by 2002:a17:902:fc47:b0:2c0:eee2:fc45 with SMTP id
 d9443c01a7336-2c1e7b2f6c7mr266954695ad.4.1781032879185; 
 Tue, 09 Jun 2026 12:21:19 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 11/45] target/arm: Implement F1CVTL, F1CVTL2, F2CVTL,
 F2CVTL2 for AdvSIMD
Date: Tue,  9 Jun 2026 12:20:35 -0700
Message-ID: <20260609192110.752384-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 29 +++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   |  3 +++
 target/arm/tcg/a64.decode        |  3 +++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 966f83d796..718463422b 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -7,3 +7,5 @@ DEF_HELPER_FLAGS_4(advsimd_bfcvtl, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_bfcvt, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_bfcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_bfcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index aad03b0817..0f3c279696 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -103,6 +103,14 @@ static bfloat16 fcvt_fp8_to_b16(uint8_t x, fp8_input_fn *f8fmt,
     return bfloat16_round_pack_canonical(&p, s);
 }
 
+static float16 fcvt_fp8_to_f16(uint8_t x, fp8_input_fn *f8fmt,
+                               int scale, float_status *s)
+{
+    FloatParts64 p = f8fmt(x, s);
+    p = parts64_scalbn(&p, scale, s);
+    return float16_round_pack_canonical(&p, s);
+}
+
 void HELPER(advsimd_bfcvtl)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -123,6 +131,27 @@ void HELPER(advsimd_bfcvtl)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     clear_tail(vd, 16, simd_maxsz(desc));
 }
 
+void HELPER(advsimd_fcvtl_hb)(void *vd, void *vn,
+                              CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    fp8_input_fn *input_fmt = fp8_input_fmt[ctx.f8fmt];
+    uint8_t *n = vn, scratch[16];
+    float16 *d = vd;
+
+    if (vd == vn) {
+        n = memcpy(scratch, vn, 16);
+    }
+    n += ctx.high * 8;
+
+    for (size_t i = 0; i < 8; ++i) {
+        d[H2(i)] = fcvt_fp8_to_f16(n[H1(i)], input_fmt, ctx.scale, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+    clear_tail(vd, 16, simd_maxsz(desc));
+}
+
 void HELPER(sve2_bfcvt)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5c6e88e0bc..5266bbc413 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10726,6 +10726,9 @@ static bool do_f8cvt(DisasContext *s, arg_qrr_e *a,
     return true;
 }
 
+TRANS_FEAT(F1CVTL, aa64_f8cvt, do_f8cvt, a, gen_helper_advsimd_fcvtl_hb, false)
+TRANS_FEAT(F2CVTL, aa64_f8cvt, do_f8cvt, a, gen_helper_advsimd_fcvtl_hb, true)
+
 TRANS_FEAT(BF1CVTL, aa64_f8cvt, do_f8cvt, a, gen_helper_advsimd_bfcvtl, false)
 TRANS_FEAT(BF2CVTL, aa64_f8cvt, do_f8cvt, a, gen_helper_advsimd_bfcvtl, true)
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index e30c7e5ca9..3c806259f9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1921,6 +1921,9 @@ URSQRTE_v       0.10 1110 101 00001 11001 0 ..... .....     @qrr_s
 
 FCVTL_v         0.00 1110 0.1 00001 01111 0 ..... .....     @qrr_sd
 
+F1CVTL          0.10 1110 001 00001 01111 0 ..... .....     @qrr_h
+F2CVTL          0.10 1110 011 00001 01111 0 ..... .....     @qrr_h
+
 BF1CVTL         0.10 1110 101 00001 01111 0 ..... .....     @qrr_h
 BF2CVTL         0.10 1110 111 00001 01111 0 ..... .....     @qrr_h
 
-- 
2.43.0


