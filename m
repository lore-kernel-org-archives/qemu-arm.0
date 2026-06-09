Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7729CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:36:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX28t-0006IM-UM; Tue, 09 Jun 2026 15:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX24S-0005MJ-IR
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:25:13 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX247-0005X6-OX
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:24:56 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2c0c1e0d00bso57672775ad.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781033085; x=1781637885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Xz8fr+g8sTOXusmljC0L+Nm4oefyAqFDlrk9++y4e8=;
 b=W3pJZ8PpMJQoBTGbXh1pS07sakq2kpn9In7Vld8IXCQoAqjxORSiig76G8ASOXGRr8
 sayg2g7b+GQrtZRPtQzLjxqE6nBhDQhCQRvoglZemAYjz0nAbpvVkWW0LR5xRVu7qf3M
 neprE0sQRSa5S0Vh1P0yaeObaSp7phQc9gJyZmGx4MDPWu9uutcoHtwkHLzGUVckHIOk
 e4A3py5GNGgv4hR8VY8UZ7c6LvP0qADPZYht583P70xBr+b4EX65AW6jIEpCeIqf1oSD
 FJsXuNVLKS3k9VZiqgeRNYuzaGr4RcJCUTwFR4fwJwayzT3Vkz22AkA08xu4L7DdtvN0
 cUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781033085; x=1781637885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1Xz8fr+g8sTOXusmljC0L+Nm4oefyAqFDlrk9++y4e8=;
 b=Cil3c88RuB525GQn5Ga+eRH04kZ0m1CboY27jVMaf9vR9e05heu2TUa2xC7Cmygd1s
 FrlbOuE5PrxZXAPSUYiI3T2f2iLla/AUPwBIbW/J32X9BY5yM3DuuQQXtnM09G6lxUQq
 ohQx0OcDG7MiSVEZCmTlDrxmxA6MbAQNg39jdnIrHL2+JjnoX2Pve8eGN/523B/iopIc
 uX6GBHCZKz1Lsn5g44/WiHcyJVaMkaU1qKqRsz2oblj3Zr48HwTwu/yIdQZ8nkLP4ou0
 VdUTs4j+VnASEyHvj2/8ffP2XQ7nimL1QtytUCs4KaDybvVHK3SWeHQWZ9gK+lifRWi5
 W1yg==
X-Gm-Message-State: AOJu0YxRwx42Bj8KeSK8f+rrTj+Zki0feQ4OgGwbITn6LZ1b+lD817FT
 xQucPqlSogPHiIIn2Na2SGnJRKFbJZ8CUo4jXWEPKxfPnpJnMIV9TCCsEFsZ7U5VURSS3Xa/pvP
 fD54Ok5w=
X-Gm-Gg: Acq92OERCwi44rBXt5WL9mo0iA1IJVxCSRlLs9Aiff2Ej+Iik/IshuMDdl+jtRgPUqR
 YrcwN64afiHVPtdlIxB3HqnDufspXDy1Fn1Z8zrSZrjmfSyKcmqRcQY0hpd6M7GBjiPVs6CCJYH
 6ygJAXDaXVu+DosJ3Vv4BDjLsW9sip2qoOgClqaQ1sLowzqb6BIwqXWXumaY4mmxls7R/Por7Ka
 kWPB6Yk9+EiDha2ZpvOaR8hF7jb1dXdMRb4M2XXhBhdRRnmGs+s3ae8zfzmXLSaryBfotLh3fku
 4aHWRLcG13Ns7Iz7OpIloR2abwXRRaRU7FSVvb31mMAN2ebP65u8ZgNjKIH180xU8n1LepbKcfn
 LNq401EBZubl6SsBqKIm/nm84jLG7+vIlo3kh8R7KAG7+fb6qgy/Kd/gg6YYszoz9kQ2MU9r69U
 vyf454Ws1nDMPDbnWpglKQjsuqjmD0KNPUR2oMO94=
X-Received: by 2002:a17:902:f60d:b0:2c1:e426:70f4 with SMTP id
 d9443c01a7336-2c1e8481634mr220977135ad.23.1781033085180; 
 Tue, 09 Jun 2026 12:24:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164fa00b3sm212247045ad.32.2026.06.09.12.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:24:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 43/45] target/arm: Implement FMMLA (FP8 to FP16) for
 AdvSIMD
Date: Tue,  9 Jun 2026 12:21:07 -0700
Message-ID: <20260609192110.752384-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
 target/arm/cpu-features.h        |  5 +++++
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 25 +++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   |  1 +
 target/arm/tcg/a64.decode        |  1 +
 5 files changed, 33 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 2b1d1034c0..6d65706186 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1635,6 +1635,11 @@ static inline bool isar_feature_aa64_f8mm8(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8MM8);
 }
 
+static inline bool isar_feature_aa64_f8mm4(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8MM4);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 3c74f02022..e942308af4 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -37,3 +37,4 @@ DEF_HELPER_FLAGS_5(gvec_fdot_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_fdot_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fmmla_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_fmmla_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index b9d4ba3b6a..bd0877071b 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -832,3 +832,28 @@ void HELPER(gvec_fmmla_sb)(void *vd, void *vn, void *vm,
 
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fmmla_hb)(void *vd, void *vn, void *vm,
+                           CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, 0xf);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nseg = oprsz / 8;
+    uint32_t *n = vn;
+    uint32_t *m = vm;
+    float16 *d = vd;
+
+    for (size_t seg = 0; seg < nseg; seg++, d += 4, n += 2, m += 2) {
+        float16 d0 = f8dotadd_h(n[H4(0)], m[H4(0)], 4, d[H2(0)], &ctx);
+        float16 d1 = f8dotadd_h(n[H4(0)], m[H4(1)], 4, d[H2(1)], &ctx);
+        float16 d2 = f8dotadd_h(n[H4(1)], m[H4(0)], 4, d[H2(2)], &ctx);
+        float16 d3 = f8dotadd_h(n[H4(1)], m[H4(1)], 4, d[H2(3)], &ctx);
+
+        d[H2(0)] = d0;
+        d[H2(1)] = d1;
+        d[H2(2)] = d2;
+        d[H2(3)] = d3;
+    }
+
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 367f87f05d..126b7b44b8 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7502,6 +7502,7 @@ static bool do_f8dot(DisasContext *s, arg_qrrr_e *a,
 TRANS_FEAT(FDOT_sb_v, aa64_f8dp4, do_f8dot, a, gen_helper_gvec_fdot_sb)
 TRANS_FEAT(FDOT_hb_v, aa64_f8dp2, do_f8dot, a, gen_helper_gvec_fdot_hb)
 TRANS_FEAT(FMMLA_sb, aa64_f8mm8, do_f8dot, a, gen_helper_gvec_fmmla_sb)
+TRANS_FEAT(FMMLA_hb, aa64_f8mm4, do_f8dot, a, gen_helper_gvec_fmmla_hb)
 
 static bool do_f8dot_idx(DisasContext *s, arg_qrrx_e *a,
                          gen_helper_gvec_3_ptr *fn)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 6922e91010..28cd1faf61 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1228,6 +1228,7 @@ FDOT_sb_v       0.00 1110 000 ..... 11111 1 ..... ..... @qrrr_s
 FDOT_hb_v       0.00 1110 010 ..... 11111 1 ..... ..... @qrrr_h
 
 FMMLA_sb        0110 1110 100 ..... 11101 1 ..... ..... @rrr_q1e0
+FMMLA_hb        0110 1110 000 ..... 11101 1 ..... ..... @rrr_q1e0
 
 ### Advanced SIMD scalar x indexed element
 
-- 
2.43.0


