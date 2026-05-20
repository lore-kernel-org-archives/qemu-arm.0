Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51109CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:26:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlZN-0007wu-MK; Wed, 20 May 2026 14:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlZG-0007co-0s
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:54 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlZ9-0000hB-0M
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:53 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-36608b2f2dcso3219371a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301355; x=1779906155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZqJ9crbI/VVYm4sDhLmU7TwL1lWbYpvdrgfl/UPxcc=;
 b=m6eOJEomAOyMU+xuPFi027L46qrLu8YJiJxQiKZcnA3Y/4z3e6dxZqDUKRF5tgG43o
 /GF6D6vG2RLUi1b/weoSjpqx1srkLuUr4WGlck5tO12dzQa6UKgGRqd0leTGusmPc5eI
 Q/g+sV0wNecA773k4LnaSIuw3n994K5/jmJrqqNJb0Pc/SUL7LvwqPxTDspZVe6eHzs2
 25NBB0yTh9OQpZ8MUQWhIEdeU24X4Zynt4aQ9pWY7Ke5iZImoTVFxJ1UyZGjnOSriUnZ
 GdxZGLfMbxSRGi1HN6XhwXLoLm69Tf3vO1XiG6KlXBMPY2xmghpxpOjs3FRqdnHEGgNa
 LkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301355; x=1779906155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6ZqJ9crbI/VVYm4sDhLmU7TwL1lWbYpvdrgfl/UPxcc=;
 b=dlnORuDSejnyVSzXj4fLpH3jE13aE+tOLA/QgsjLG/XtKo46AH8QX+ExVwrnbF6wBi
 Rm1bbQlqgtc9d06Sg7fGIEKAJPNWK7EMAHxnM1TcgAdTejwmhdIlJgCLKH9naRiE2sIA
 EoP5bRZi9PnPPeDMeDDGJ7P4ZWBQo0oxw4d1lY/pbjb5bmEYzbkNJL8cFMJfrGpGHWnS
 PzF4DP2bO20oLq3JOS0jFzm8oL39+hfwXAI9cjmy/WIV9mNKbbIrypJdfotR8R38BSFP
 Zw67ZVrxMAn3k98/9LyjOTJHCTbq/1zAoFXt72NSKmmFrpXbqWSX4aE1yw9hl7TqXGRc
 uCTg==
X-Gm-Message-State: AOJu0YxKkNE8FSY1eEDJ4Ak8tVPJMWrYbeHBVVCPM/UFzBNCQbrt/K/W
 5kEYoYIr3r7UV5yGuv9MWEQy28srPM6lM1iEoZRdzDUyLVm98YoWS8dEMu6Oh28wcZ67KTdDHHq
 Sm9SfPeo=
X-Gm-Gg: Acq92OGPRvj3di3oYr1/3cQvMSG6wD13rp0XxENwZm7BbGlJW6ciP4WWWdXpxZO9t7E
 hY8t3eRd27NAlBtcznzIIwKIC9nSV7F7mn6544ZlgRYyVKfhCu57rFCRCbl8fLSNk40Alf3YN0z
 ilc6aNTueTpb0TdahIrjamqqZqZT9pEcM3fF/WmCl/CWPNAeGAMvG4XXrGoWGGV6Z+kSToyfGme
 esRlaZ3lic0TancD7z2c00US9Eiv7ErUerACkOU0j7GUtlPv0QjhQm4s/OaDgvx+7644b+vFG81
 ER00WLwZNHA6dXhtOwIilidx5WnRv1+5fUnrKeWd6TE2QQlTnnhjcnJzDS5pS8mHsi8NsLEOptG
 fUpcTM4NJwvHd7TSURCvx6jOIY/pALke00ChJI8Ffna23FOVbM/YShohaq79MLLKNk45HfarAQy
 Z61ZwyOscT7NlpGbFIFkOaonYIXli7+EueEYPln3g=
X-Received: by 2002:a17:90b:4a8f:b0:367:e244:4c40 with SMTP id
 98e67ed59e1d1-36951c990ecmr23656096a91.26.1779301354976; 
 Wed, 20 May 2026 11:22:34 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 29/64] target/arm: Implement F1CVT, F1CVTLT, F2CVT,
 F2CVTLT for SVE
Date: Wed, 20 May 2026 11:21:38 -0700
Message-ID: <20260520182213.872945-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index 9bab5feb93..5200f3d034 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4081,6 +4081,15 @@ static bool do_f8cvt(DisasContext *s, arg_rr_esz *a,
     return true;
 }
 
+TRANS_FEAT(F1CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
+           gen_helper_sve2_fcvt_hb, false, false)
+TRANS_FEAT(F2CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
+           gen_helper_sve2_fcvt_hb, true, false)
+TRANS_FEAT(F1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
+           gen_helper_sve2_fcvt_hb, false, true)
+TRANS_FEAT(F2CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
+           gen_helper_sve2_fcvt_hb, true, true)
+
 TRANS_FEAT(BF1CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
            gen_helper_sve2_bfcvt, false, false)
 TRANS_FEAT(BF2CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
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


