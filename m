Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80B1CD6E6C
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:34:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcI3-0006gf-D1; Tue, 02 Jun 2026 23:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI0-0006bW-2w
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:08 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcHx-0003bX-NG
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:07 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-84232e83ca9so1491018b3a.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457344; x=1781062144; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YLZTWTNHQmgPXZ+6u4Ok/BrhLJw04DqdyqKLuC9WFEs=;
 b=sly4hT2otaKZmotqWVwTUR7qX+eg39Vka1g9jZ6vizGtfV80eZDsk8D+ObqIPd1PDZ
 tT01a9LaUZauyJ+bERJaqhk56SwwAv8Z5W+FdSdxdfguEvVziOr7zyrvrudy9zGRX6ML
 vXPFeHNUjZ6j+Govp9L3V9SXgJVdxq5/n4pJPTPcZfdcgPQP629wJ07ozKv7cVIFxuZC
 DpEv2vMrTc5n+cwEJAXmR9Z1ix0XS/d2BtCwhXotzuGDLfOuzDqqos1slqK4C/Y/vuqS
 i6y36fsmbTqj6c/qf3ewDQo5FgjDvZSSlXFtpccS6Z8pJWKKb4pMa7LbnC/vO6SE20Pr
 x4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457344; x=1781062144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YLZTWTNHQmgPXZ+6u4Ok/BrhLJw04DqdyqKLuC9WFEs=;
 b=astYMI5CLlPiqdW0ucj2ZgWcgFObmUidERvCgm60I3CHoufdN9axBykKVXdYAGCnC8
 PjN+jP97qscqb8RSTGPzHNaIBaWWCrszJhwC9G6As+mfWfsrdgodpyc/kHZi6EM9vhPl
 BUSuBcbcJv/mO1gix5PrG8Hjw5Gm43JOCS267i1whasKHFo+rNKN6iuocOilNbxxoik/
 b97fESEpYzTza/UHMlB0wh28n2CYJCnGPFCWOBzLZIQr1Bp7YZQ11HjsyJlR6OoUpUbr
 b1al/EN/xZ4D0baC/E1cZp9ennunHB76tHOFKSopP47TsLbtnopbGRDbLtUpWT5pvPcU
 2EBw==
X-Gm-Message-State: AOJu0YyjzFQf+MD3aKcyqWOfQiLiCkRfT+TjBUpqNsAILQA4YInzNPHB
 6YM45pkTMWgTYuN9Ap2+PKjqhCynilAspQlGCuGxndJTxKalX2HFVCdcwomgvwanjjs=
X-Gm-Gg: Acq92OHgeVIw+ORJwg8ju4n1UV4wE86y1iaAy/Nn7hqAFeOVuzoCURv+sLeqrkEnO7S
 jwxytr0t9nO5qycLSQiN6i60unOvyLzEogspiiKBAcbCnC5cmoSIZEGG2gkO+jY37fvfmRV/E1t
 An9eYHw/QvA7zt+urmcHCNmAVvfCp4rQEx5+yi8zJ50/nnvWkhgfrTx4WAYqg2FzcpdoROQmgUI
 4LME229Bo2Pm05DjboMXmTAtEXy20mnxft7YGufYdFdJ1z3hRggnBJvfLKbQXD5w0PYDmDify+t
 yb/4lnWGjksNqGmXy9kDf+iejFcTEtIuGPGj97P03h+E0qsPHrtVOgiD4dcOnGmEWv2B/UFXuxt
 cFwsGsQ6etVFxXXnsL+VRKU9hPLXRjoZL6tRFr5mX8Z+8+r4AbgqKB6gSNhU6S8iCZ0t4jzoBi2
 ++iOv/mkADrn3MW0NxWw0Ldo9JuuqNdEQ5a6s6plU=
X-Received: by 2002:a05:6a00:4b4e:b0:842:74e3:48a5 with SMTP id
 d2e1a72fcca58-84284e0a2e4mr1604798b3a.16.1780457344189; 
 Tue, 02 Jun 2026 20:29:04 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 11/45] target/arm: Implement F1CVTL, F1CVTL2, F2CVTL,
 F2CVTL2 for AdvSIMD
Date: Tue,  2 Jun 2026 20:28:20 -0700
Message-ID: <20260603032855.106930-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
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


