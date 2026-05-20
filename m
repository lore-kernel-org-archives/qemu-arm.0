Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D64FCD5BAC
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:28:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlZJ-0007k2-0K; Wed, 20 May 2026 14:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlZH-0007gP-M9
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:55 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlZ9-0000fj-1r
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:55 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3698e34a567so4551119a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301358; x=1779906158; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTf30A5nAxp6e6ppMf2DDbWiS/oqqDCevaEDJz4Mgfk=;
 b=bHF9aXPCL3rAm/QMo/l5qdLUcOWljfjVkEejUz7gS74s/P7xkYSRbBf4PCcNAt1BwL
 1DA00P+istKR/LAxqMdqGENKVBR0CjkloxEe+G6IVeZabA/qXv28ccLHqCwmtOlSwtBV
 vQ/9f1/9GzCCus00TRJuN/T+NCoPdSq68SiscKTf7rgqwrD5UTXXAj3pApwBXmBPhdjE
 tFX8976knqffZFODOyL0gEN3ydtp3YTBbcG/I6HWHtqNa7Ws0K5li2jFqF4AWaxfsunk
 h3e2NcWekR1k25A4GySa35RYxFKI7ZLuHPXE9/dosXFxwoNSpKlqk7nxSTJqSWhAagod
 UMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301358; x=1779906158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YTf30A5nAxp6e6ppMf2DDbWiS/oqqDCevaEDJz4Mgfk=;
 b=RL4E6rAw837AdJ9ZBC/TMyYx+1yU6zbojI2oT8NJLyC3LmJskOZaE8DFc1mW5hWTPa
 5a83l++6gIrqvQ6RbkEovo277gEJp04fi9ZtR1NXJJJMF9wkNpU4r5hCPG86WzAKYTSy
 xzel5Cp2pKVQGC8CVQ9DW7ra+hkKSZ1E7SF/926xTVqMgOZptQ5WybDpHwdHOUu6hoTe
 zneUOKtf0Y+AoHss36jFsJdf9NHjQTYBeRIZm9k1A2cTeHCuj9YtA0NRnxRtebpcSoof
 zQ0HPmNLRVwYiogAhikCElUTHY5ZbtqrtNy+pKFziX13jTVoG4hHhS8ApBVY9k6+mg+v
 eWHQ==
X-Gm-Message-State: AOJu0YxSiRQ7/OelfvSidCXVvRE8M+1v7GMhNcVk+pOKFtt7y1eXL5VY
 7JBmD51yTisPWePfkURFJhHsO2uvGNqEQa3wAeL5/eBJqQJD7G3LR8HgVtVYkjVrkxY=
X-Gm-Gg: Acq92OEjt5mbL48GDXXxxPfhcK/x7Q/getqHnTDyNKkAf04HwU5M2QzgdK7pScl6D+a
 40FoTtcDnYSoROG3/ih17s+pQe0uC+fwFkMrSHBhyV6uPN6n68Bc/O7hwADAEJ3Cz5hkTVTqdQt
 LPz/PFhm3vmSscbrBP5SUHym25Gvbt4gvn3PuEd6WE7IiQfzEWEGXTeVWeZtjx0m58lv1WNzIq6
 Qjca+dvR0vjGApMsStVZv6jU+4w5r01T3J0zgs4bmAj8PmahOTXOpSlInEPybdyXTGHCKEXN1zh
 wukBOPxYa5w/Y/B4IyZvNCyAk7Ty5X2lgW4Bwo1E37a0p66UliY6/dhd1vQ35hXHAJD4hJxA8Gb
 Vu49Bfx9ykjeO8axeSKQwBeWeP2bi1jy5o1tJYBFhjhSE3xmQ5ptk+HMQI1j5f5VamAEd4tRwEr
 XbcODEj/GaoFX1mdoDvzjVJKZCJWuKqh6pGBzaO6c=
X-Received: by 2002:a17:90b:3905:b0:36a:2a9b:3fb2 with SMTP id
 98e67ed59e1d1-36a2a9b523amr3446810a91.16.1779301358233; 
 Wed, 20 May 2026 11:22:38 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 34/64] target/arm: Implement FCVTN (16- to 8-bit fp) for SVE
Date: Wed, 20 May 2026 11:21:43 -0700
Message-ID: <20260520182213.872945-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 23 +++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  2 ++
 target/arm/tcg/sve.decode        |  1 +
 4 files changed, 27 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 023a49e12f..e67fb191c2 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -16,5 +16,6 @@ DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(advsimd_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index f6b3eb6953..ad810852b8 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -415,6 +415,29 @@ void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
 
+void HELPER(sve2_fcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, true);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        float16 e0 = n0[H2(i)];
+        float16 e1 = n1[H2(i)];
+        d[H1(2 * i + 0)] = fcvt_f16_to_fp8(e0, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+        d[H1(2 * i + 1)] = fcvt_f16_to_fp8(e1, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
+
 void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
                              CPUARMState *env, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 7276d9c44a..c7fcf27183 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4099,6 +4099,8 @@ TRANS_FEAT(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
 TRANS_FEAT(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
            gen_helper_sve2_bfcvt, true, true)
 
+TRANS_FEAT(FCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_fcvtn_bh, false, false)
 TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
            a, gen_helper_sve2_bfcvtn_bh, false, false)
 
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index b6ef8ed8de..806953bc35 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1101,6 +1101,7 @@ BF2CVT          01100101 00 001 000 001111 ..... .....          @rd_rn_e0
 BF1CVTLT        01100101 00 001 001 001110 ..... .....          @rd_rn_e0
 BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
 
+FCVTN           01100101 00 001 010 001100 ....0 .....          @rd_rnx2 esz=1
 BFCVTN          01100101 00 001 010 001110 ....0 .....          @rd_rnx2 esz=1
 
 ### SVE FP Compare with Zero Group
-- 
2.43.0


