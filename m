Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9819DCD5BAB
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:32:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPld4-0005vi-IH; Wed, 20 May 2026 14:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcN-0004Jn-10
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:08 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcE-00027w-Qb
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:05 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2bd2c147abaso31124885ad.3
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301556; x=1779906356; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sODePEuBtD1IMu2N8xv9dK23f4fUAur2uaNFWSg4sSI=;
 b=S+Fny22ce5V7BZ2gWjIOywMQvz9VovK9SUDVovvHO5TmwoRlhR2pRlLFSOBemQefSQ
 sYhAeyZ2C3eclWZP0aa8PzPa6e+VJYx9xajsNODoMonRE/LzDHehTG0NxALFN1+kgMFJ
 gtREoQw0yq4HcwLMbGt2SHoA7lE4SwbEedE+RH540DUtjl5qCq0MSbORvESDX9Cr8Sur
 XL9PAP6WUZ5SqxFgIccp3t4cEmLQOEJ5ngZZ+dOwB+WGtIFayozsX/RdOKUEIfjBXsDn
 RYIJ9kH4beE3mfgwQMC7GNCRYmkhsXKnPXPIl/uR5gn6+MadDPoVoLL28jyJxD3/9GE1
 Bnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301556; x=1779906356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sODePEuBtD1IMu2N8xv9dK23f4fUAur2uaNFWSg4sSI=;
 b=ZOLOcDyOHOtP6RI/2+FzAfpJ0OTUZKmUbN5DLtWF1WvakiTJ9Xb3670GfZ3/sr9Kk4
 TJ3nQp8gL31ZNiZY9WU2lcRRAgwD4/rKXZeNLD4ZjwKtURGTJZeL+v7zM2DcpxzNyUbg
 ZDZthMOu8rT1tkMX+Zgk12oYNQyOUUI9hJpIHJNSgUpj1w7d5nWQYlVC3HulD258XWbN
 y50P1sTsBjidcAHrOAcZTJBZsjYWC7cll6zU1KjfUs6iMRBDTvArTKNvML1FPzhAVkTV
 mNNhfqT12wdS9Sz9BwVPF4irouaEIgclwv8eIc7eKCIjb4vgNkJCTwQquGI9dpM+ddxa
 XTQg==
X-Gm-Message-State: AOJu0Yxh7UMWvOw/a1O7tva1h80a5KBFy0Nhdx22nan+27Z3qQksNes3
 xH1pozS5MBeYFpV6uZI9XhGgrXcyVkhyZEtguKaX6vLDoCrvmWfr4aPXYhcsGEbtJnM=
X-Gm-Gg: Acq92OGvrT0kkzOKHiJRt9O4ONpTO3zBLvWVXhjItnP4842eyHKICAhtlwr99ley/K+
 b1/LdPqWI9Jmu0yEntxRKSqRexQ8BXJ5SwjG5drL/R11V27l+zEppO5pIolmHcuVgXMeohdFGJ4
 32/IEnTsIe711V41F88OXt0PjIYq2Ep68p1Bwrwrb5FBB0jadOtLoH5Q112oeO7JJcraTHlRYoF
 Xeqs6kt2U6XtzSiUwYD/I8gPDTYc27ou1k9n921SG5Roc8MJuWlHHFb0YfDJvGoVL8oz1hCaqjD
 0yBL8uVXSbfXOeyyKrW65O14C2GMSUjUQ2IxrpY3B2TGc/ENw2fViMs0fManpZ9WgE9+R+nM9KO
 gpwFOpckUOc5n6NR7lye2NXw45kwpuOicpxeiAvxsy38hdF8a4cXDH4IaDijZzK61DoqdCGITBL
 UXjb47UcxosgnFsANpCufvNDLItghq
X-Received: by 2002:a17:903:46c4:b0:2b9:e82f:bfef with SMTP id
 d9443c01a7336-2bd7e88f2d7mr264258505ad.21.1779301555457; 
 Wed, 20 May 2026 11:25:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:25:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 55/64] target/arm: Implement FDOT (FP8 to FP16) for SVE
Date: Wed, 20 May 2026 11:22:04 -0700
Message-ID: <20260520182213.872945-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/translate-sve.c | 35 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  2 ++
 3 files changed, 42 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 7bedc293fd..90098c3cbe 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1555,6 +1555,11 @@ static inline bool isar_feature_aa64_ssve_f8dp4(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8DP4);
 }
 
+static inline bool isar_feature_aa64_ssve_f8dp2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8DP2);
+}
+
 static inline bool isar_feature_aa64_sme_b16b16(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, B16B16);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 88e6148b83..8d622f9a1c 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8407,3 +8407,38 @@ static bool do_f8dp4(DisasContext *s, gen_helper_gvec_3_ptr *fn,
 TRANS(FDOT_sb, do_f8dp4, gen_helper_gvec_fdot_sb, a->rd, a->rn, a->rm, 0)
 TRANS(FDOT_idx_sb, do_f8dp4, gen_helper_gvec_fdot_idx_sb,
       a->rd, a->rn, a->rm, a->index)
+
+static bool do_f8dp2(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                     int rd, int rn, int rm, int index)
+{
+    bool fp8dp2 = dc_isar_feature(aa64_f8dp2, s);
+    bool ssve_fp8dp2 = dc_isar_feature(aa64_ssve_f8dp2, s);
+    bool ok = false;
+
+    /* Feature detection and enabling are complex here. */
+    if (!(ssve_fp8dp2 || (fp8dp2 && dc_isar_feature(aa64_sve2, s)))) {
+        return false;
+    }
+    if (fpmr_access_check(s)) {
+        if (fp8dp2) {
+            s->is_nonstreaming = !ssve_fp8dp2;
+            ok = sve_access_check(s);
+        } else {
+            ok = sme_sm_enabled_check(s);
+        }
+    }
+
+    if (ok) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           tcg_env, vsz, vsz,
+                           index, fn);
+    }
+    return true;
+}
+
+TRANS(FDOT_hb, do_f8dp2, gen_helper_gvec_fdot_hb, a->rd, a->rn, a->rm, 0)
+TRANS(FDOT_idx_hb, do_f8dp2, gen_helper_gvec_fdot_idx_hb,
+      a->rd, a->rn, a->rm, a->index)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index c49e992f10..26b3c7697a 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1875,6 +1875,7 @@ FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 
 FDOT_sb         01100100 01 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
+FDOT_hb         01100100 00 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=1
 
 ### SVE2 floating-point multiply-add long (indexed)
 
@@ -1900,6 +1901,7 @@ FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 
 FDOT_idx_sb     01100100 01 1 ..... 010001 ..... .....     @rrxr_2 esz=2
+FDOT_idx_hb     01100100 00 1 ..... 0100.1 ..... .....     @rrx_3a esz=1
 
 ### SVE broadcast predicate element
 
-- 
2.43.0


