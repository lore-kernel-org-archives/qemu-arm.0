Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64427CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:32:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPld3-0005m2-3c; Wed, 20 May 2026 14:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcN-0004Jr-2m
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:08 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcI-0002Ar-8p
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:06 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2baca4df358so30600125ad.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301558; x=1779906358; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZ3I4CizPNDr7l3Qj3+qL13Yx8GTzrnhQalZXWGErYg=;
 b=vmQwoyK3e4W8ddUINE+a6UkOljIeMUu8T9CH7nn7bzDXiuYr67OtWrS2+QzyJmgBN2
 eX2mjxxNuUu5G62Uo2ApEWhTKtxNASppVv1HmgB9HdpvkDj6PnUdHfYQklNuSadGiTgJ
 IHZK2vW3MbEcrgg20bK1oZiAbtOFGLi7kXYMB12Cy7zJ1ZNh3vQs8CQs+hsZB/BVMlK1
 CVRiWHlxXkVLsqS6Da0IrjU9c3IxBZmaq1QgboC9ZpnJ6+kPYdBDFb7+8NQFw/ZhfzUb
 iB0EWPrW2wom0Z4UmrQpslWJJ3Tjzz6RCOUeovy6vllQQvkkU07+5yi+dGigyY6Qi97M
 e02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301558; x=1779906358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pZ3I4CizPNDr7l3Qj3+qL13Yx8GTzrnhQalZXWGErYg=;
 b=MrQZONaeiqyG+zj3NgHPNvwvT8UyZzxEsCS1QcC/raxm1VhsZX4hVxembZuE9IDk6P
 Y7v4c3zsACtIpASR7iAx/HFyfpT7dML6X+aSx0TT4Uxs2vlaPsCCsHRdNWy/s3uP7+Hl
 tZnwXsRE3HwCIUB6+HoCD/NmX4wXNvnTiAgmO5+wOV3XXcl630mFLCF2cWsbdUL9ZANF
 rEJ4ZtO97B9u5UN63oX3EjsIW1YiEBIjCNoi2gJQ09hNnArHBxqmbaqGg1y+L7rfo6HF
 LJTzInxPfJN0PTD0/oLbhfrnE7/EXVXZRiHIpUjFGImGm8pcoLG/yCF/OnOl2/tZZR/j
 lRNw==
X-Gm-Message-State: AOJu0YzMnsM32Jw2J2+b2NX9NhXU2h7IANUYzWvNvlkwfzwfzfqh/RIE
 DSax+O2hbpJpLTVzBhzgF3Ob1in2P4Bw1ttLeTAtou/GnhTo44JLtfKDOxYFnMG3PKI=
X-Gm-Gg: Acq92OHSDKkaI9GIOiXMLYa4eUoR6pDnIl5N+x2GUQ7PvDzV9+Te8qGYYcPmbjCsS6c
 2b/RJemzEmqV+gvS/10a50cao6oJniL+6+1UEgovIJ1T6VxbcaVMmTVSwj+yRL+PUOWUm64JH0m
 +PxLWOLlNq0EhkKbAhgSa/7/m41w5bQdJOhjremOSv9ltimTi+htFl3ngRfSyfspxKRqRX2PxSL
 /mnHOo1qL2H83PsHW7gH9VA4g4DsSnr8wnc/QhMQvDvomVjzILW3AipCK5Sbtona4fxZefM8Kzx
 WBFKmh1erTT1iEOqO3Yk+oT9GLPEiTI9LagPKVtbdQARITFdecIIXy43mqh/Q0Zn2uCgZipLDSt
 7SwpYmJNDiVGiDANVDiAyNqtUTnjA3IoPE8g7Pwajl5tTEVnCQsq8KlTnSwJLzNVPen4wz10jsw
 2b4Hhd9jOTtzGDelIIlU+hIrPChzf/3/gr19qs1Sw=
X-Received: by 2002:a17:902:da8c:b0:2b2:5597:bad4 with SMTP id
 d9443c01a7336-2bd7e9adf9emr278246955ad.30.1779301557523; 
 Wed, 20 May 2026 11:25:57 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:25:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 58/64] target/arm: Implement FMMLA (FP8 to FP32) for SVE
Date: Wed, 20 May 2026 11:22:07 -0700
Message-ID: <20260520182213.872945-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/translate-sve.c | 16 ++++++++++++++++
 target/arm/tcg/sve.decode      |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 67b9d7e982..8f6cc2974f 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1693,6 +1693,11 @@ static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
     return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_bf16(id);
 }
 
+static inline bool isar_feature_aa64_sve2_f8mm8(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sve2(id) && isar_feature_aa64_f8mm8(id);
+}
+
 static inline bool
 isar_feature_aa64_sme2_or_sve2_faminmax(const ARMISARegisters *id)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 8d622f9a1c..5bda5f6c01 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8442,3 +8442,19 @@ static bool do_f8dp2(DisasContext *s, gen_helper_gvec_3_ptr *fn,
 TRANS(FDOT_hb, do_f8dp2, gen_helper_gvec_fdot_hb, a->rd, a->rn, a->rm, 0)
 TRANS(FDOT_idx_hb, do_f8dp2, gen_helper_gvec_fdot_idx_hb,
       a->rd, a->rn, a->rm, a->index)
+
+static bool do_fmmla_fp8(DisasContext *s, arg_rrrr_esz *a,
+                         gen_helper_gvec_3_ptr *fn)
+{
+    if (fpmr_access_check(s) && sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, vsz, vsz, 0, fn);
+    }
+    return true;
+}
+
+TRANS_FEAT_NONSTREAMING(FMMLA_sb, aa64_sve2_f8mm8, do_fmmla_fp8, a,
+                        gen_helper_gvec_fmmla_sb)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 26b3c7697a..6610432528 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1808,6 +1808,8 @@ BFMMLA          01100100 01 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=1
 FMMLA_s         01100100 10 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=2
 FMMLA_d         01100100 11 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=3
 
+FMMLA_sb        01100100 00 1 ..... 111 000 ..... .....  @rda_rn_rm_ex esz=2
+
 ### SVE2 Memory Gather Load Group
 
 # SVE2 64-bit gather non-temporal load (scalar plus 64-bit unscaled offsets)
-- 
2.43.0


