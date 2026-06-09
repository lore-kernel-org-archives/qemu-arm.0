Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A187BCD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:27:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX268-0008Ke-H8; Tue, 09 Jun 2026 15:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21p-0003Xx-Oh
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:30 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21e-00043e-Ov
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:21 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-36d98b9aa9aso5294591a91.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032880; x=1781637680; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fg24Nf8kQbJKUwBDXjXMzbe46wddllhWV3XxPVAUUWA=;
 b=yCh+vPVQM6ZGQleyXQVY/GWmnuhjARtyoGBM6kfkeV2vGefhNYWgdfMbfXCHJpruWZ
 VneVX/cqAcgDVur0TMPyAfuMqqrsM2ExOHKrVSVHNkk1kmKj6Uet0sCnxtt/q+LDfMn2
 qB+cV3rVJ7dmKvvZHfYJbm0qCZdCsY4yqelZshWzy3K/FO0kz0LTXZ8NRHpcnZWeyGL4
 7g3HPGwlpmgTFi2Kw97v7ioThQl3+Qu60Vd3VBhy4A4ls9YLpSd5wGW3f/l++kHuGQgy
 LVZf7lk5hFouqBiQVLlXFuqUWAskfsVLw6URm7UwlsS2pTsW2lhC7Ob7l2z5mIeZuhao
 pAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032880; x=1781637680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fg24Nf8kQbJKUwBDXjXMzbe46wddllhWV3XxPVAUUWA=;
 b=akXawQPfMDE02RHS/N5zbFeuWx0BUFgEtL7Ev+oEmAk/arL9LRTrdnxl5zL1W/8bT+
 VK6hVNG1UtbD/IW/vl21JwPRbFKY61SSdhXk7HZzGDvjYPkP8QiuDreeWUfP/0Jdb6lG
 9EetYRx/tqgYMfV1BWNECu66tEfrms4ysRk4cR85iFladl7RLroSERb83T7gtUbtRwW0
 4htZ7LC9fkAUjsLSUSGXCSruD+HkytbPje6VmJzi5W5cJOfCBvdGbI1Gn0JiDa6k5PIe
 z+sbHl0cIHJ9Vh9lVECTooBnLQlt2tnAMr4xumn9qkfsUg3X5iC/Wog1bF4CZa141leo
 gBSg==
X-Gm-Message-State: AOJu0Yxjb6yZSep9+EyJijSwQHcQptHVGX4mH/lguVZJKHAdhXB9tsiF
 wJBUv1JKOdk4w18Wlz228VCYcjNMgWo6UtHr0JDRzUchRb4z5f6p3WFxOsTDmvKm/Mw=
X-Gm-Gg: Acq92OFizpZlGRdBBCkV7WKdJ0CaSXEey8hxbHl4BvIs8ctjg6c177E1NjKPNgHgLjO
 3AvgTZeZHuAWya65I+YeC3/47ysWE+45vM/AkW8pcoMtX/VN91l7+AM4wbnVSYvgNLFjnT7w8iw
 +1mzZDoPAg0EdqEoAht727VIXOIKk5pgB4Bc1jb+1eZfIn7MTdGPU0l4L1rBmBNGckKqZXwYzwq
 oA3wCTsgdLOeCqtVtcNudsxal4QFWgpfTDGRpRJySc44dvzBkybSDyJfKHRM1XQ+n5LCOL9/x4j
 ogtT+OP24xAZQQua2oX/oIxeQ92IdcpEMf/qFdkEoprBxLmsM5Yurmfe5U8pKUPAmGsFm3XIG3q
 dg70gmwLmlNuuYb0VES29uEHxitLrj65/93nGCr0WyeNLtH6GyJMngh4ZbCs9D50zANp3kZWfyc
 JfXhlO/HYhUeDMZZWLJR99GuCU6cY7Bmx6oUjzMH0=
X-Received: by 2002:a17:903:228b:b0:2c0:d4a8:85d0 with SMTP id
 d9443c01a7336-2c1e85ac3e2mr257713125ad.32.1781032880142; 
 Tue, 09 Jun 2026 12:21:20 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 12/45] target/arm: Implement F1CVT, F1CVTLT, F2CVT,
 F2CVTLT for SVE
Date: Tue,  9 Jun 2026 12:20:36 -0700
Message-ID: <20260609192110.752384-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 16 ++++++++++++++++
 target/arm/tcg/translate-sve.c   |  9 +++++++++
 target/arm/tcg/sve.decode        |  5 +++++
 4 files changed, 31 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 718463422b..3021dafd44 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -9,3 +9,4 @@ DEF_HELPER_FLAGS_4(sme2_bfcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_bfcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 0f3c279696..75c89203fe 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -168,6 +168,22 @@ void HELPER(sve2_bfcvt)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     fp8_cvt_finish(env, &ctx);
 }
 
+void HELPER(sve2_fcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    fp8_input_fn *input_fmt = fp8_input_fmt[ctx.f8fmt];
+    uint8_t *n = vn;
+    uint16_t *d = vd;
+    size_t nelem = simd_oprsz(desc) / 2;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        d[H2(i)] = fcvt_fp8_to_f16(n[H1(2 * i + ctx.high)],
+                                   input_fmt, ctx.scale, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
+
 void HELPER(sme2_bfcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 718a21de70..c47e79637e 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4082,6 +4082,15 @@ static bool do_f8cvt(DisasContext *s, arg_rr_esz *a,
     return true;
 }
 
+TRANS_FEAT_STREAMING_IF(F1CVT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
+                        do_f8cvt, a, gen_helper_sve2_fcvt_hb, false, false)
+TRANS_FEAT_STREAMING_IF(F2CVT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
+                        do_f8cvt, a, gen_helper_sve2_fcvt_hb, true, false)
+TRANS_FEAT_STREAMING_IF(F1CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
+                        do_f8cvt, a, gen_helper_sve2_fcvt_hb, false, true)
+TRANS_FEAT_STREAMING_IF(F2CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
+                        do_f8cvt, a, gen_helper_sve2_fcvt_hb, true, true)
+
 TRANS_FEAT_STREAMING_IF(BF1CVT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
                         do_f8cvt, a, gen_helper_sve2_bfcvt, false, false)
 TRANS_FEAT_STREAMING_IF(BF2CVT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index e7984fa8e0..ca110f4bc1 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1091,6 +1091,11 @@ FMINQV          01100100 .. 010 111 101 ... ..... .....         @rd_pg_rn
 FRECPE          01100101 .. 001 110 001100 ..... .....          @rd_rn
 FRSQRTE         01100101 .. 001 111 001100 ..... .....          @rd_rn
 
+F1CVT           01100101 00 001 000 001100 ..... .....          @rd_rn_e0
+F2CVT           01100101 00 001 000 001101 ..... .....          @rd_rn_e0
+F1CVTLT         01100101 00 001 001 001100 ..... .....          @rd_rn_e0
+F2CVTLT         01100101 00 001 001 001101 ..... .....          @rd_rn_e0
+
 BF1CVT          01100101 00 001 000 001110 ..... .....          @rd_rn_e0
 BF2CVT          01100101 00 001 000 001111 ..... .....          @rd_rn_e0
 BF1CVTLT        01100101 00 001 001 001110 ..... .....          @rd_rn_e0
-- 
2.43.0


