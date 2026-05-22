Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2EECD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:12:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY2X-0001jL-CV; Fri, 22 May 2026 18:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1L-0006qK-B5
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:13 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1E-0002jx-U0
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:06 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2ba856db1c0so57508305ad.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487619; x=1780092419; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eytuaCbSA78hWc4iV5jWqOyRZ8ZpfJdBOHvcB/QX7E=;
 b=uqNxaLlOrlsKPVS9/MQ1ebP1UgqywLqgqhig+3zh1s8gyviS0Cwcafypm6LB3M/uTU
 U40G0oabu0vajP4EMYnsLYcOHpIBguaEJ8Gv4cfAThARgJY7fbcE28l4zXixC2hWDlQE
 9SjMM+2u31UR034a+4w4V6zrZvUh7v06wyYWvOyJHqNer+D86p7H/Onz6lED/YMUUTbH
 LgdGt8twvl3mRvrluuD4sikxT58Re3DgUkIVmuiAWmrMpgl0b5jhgnyfzOEr9BQCqbHJ
 Ax2hG40HwIMJ4dcWAYBpg1FAnyZJSIi0g8Ch/RuAYG90+yTuIPt1pS+MQ5wlEXRoDZKC
 nLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487619; x=1780092419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8eytuaCbSA78hWc4iV5jWqOyRZ8ZpfJdBOHvcB/QX7E=;
 b=mcniJyr9EeifbPSHSkZ0mby89IXxUGc7GXLqhfzVm3DRcyiPHbabEZ4ciShSxkFbk9
 hZNwBqw5dOIiEztwgMwHwm8eiwGi1Xh3BjfBivWaLcSe/om+TlcU4Ck6FZ5fnPXPjyCl
 GN00MLtc5cHhexbzAwJp8NrIq4PWsSQsTOYgmC143SBY6gEgfMmEeENgG9pzKvBMYBcB
 7abQ4qewLiytp0Xp6x7d2vlLzX2kdCUlvmfwcU6FJ+MUFLPDaCIFyRtu2swOA8TzzRTP
 tZqFZiqd+3X7POnz5AEyLAX5aLGKTt2WKvGOaAYV0O4i2m0XTXgp/puBGEVa4mywWiPg
 3hHg==
X-Gm-Message-State: AOJu0Yyxskjgw9wKxmNGwZozym2lkCsMVeb4ZoUlukyoybvPCEXtSq6D
 gt6OM4yJTK/G6FOarhWpEkiVonJQSxRITEs0w5w8XWO89W9HPMPRMJHJ/vky9AYF5yNOS3WgASQ
 eFLBD
X-Gm-Gg: Acq92OEPQQjrsE/CKaXQyYcOTWUuKRU2rWHQ2qPAVmdTJJ7DysYII8Qkhu+F5Vp0LLx
 wKnnE2fzO8NRt+yyqEU4du89UA5sMqdOP+dKR/oaOUQAqOVM5xzPWED8UQ+qq1+sTAZZRAODYmN
 R1xKSvTUoy++ePhYDSFMLVNYNrBcO/E+Uc7rX0rjmMbaPoM5IFPemC1y2n6p/axpb4SMiAPeO93
 MjhkmNLply1aKlorjJ10AbRGI+QlnH58oGDMoXOJFYzMFpM7OQ6OEsMqpu9n+B+UhQHTVclSc1R
 OpjvXujzg7WQEjR428+RICJfA4bJMn5oc11EbaAYUkHsgrZ4vFyT8pOK2yvz+sHA353QeByWVbX
 gPigOMMdEyUceKNjHgEN3YPTbJR7CBm8Ze5B0aCr9BpFSueadWWeU5sp0agu5alPUdLJ/Uoa57k
 Ole+TrjK15aX/hQxdL9hJBQc8Bz0Mx
X-Received: by 2002:a17:903:41ca:b0:2b7:aba0:ac10 with SMTP id
 d9443c01a7336-2beb066295cmr62433645ad.11.1779487618820; 
 Fri, 22 May 2026 15:06:58 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:06:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 54/64] target/arm: Implement FDOT (FP8 to FP32) for SVE
Date: Fri, 22 May 2026 15:02:56 -0700
Message-ID: <20260522220306.235200-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
 target/arm/tcg/translate-sve.c | 35 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  4 ++++
 3 files changed, 44 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index fbce0386ef..17d6acc14d 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1550,6 +1550,11 @@ static inline bool isar_feature_aa64_ssve_f8fma(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8FMA);
 }
 
+static inline bool isar_feature_aa64_ssve_f8dp4(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8DP4);
+}
+
 static inline bool isar_feature_aa64_sme_b16b16(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, B16B16);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index f74e888580..af7f115f4c 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8390,3 +8390,38 @@ TRANS(FMLAL_idx_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
 
 TRANS(FMLALL_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_sb)
 TRANS(FMLALL_idx_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_sb)
+
+static bool do_f8dp4(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                     int rd, int rn, int rm, int index)
+{
+    bool fp8dp4 = dc_isar_feature(aa64_f8dp4, s);
+    bool ssve_fp8dp4 = dc_isar_feature(aa64_ssve_f8dp4, s);
+    bool ok = false;
+
+    /* Feature detection and enabling are complex here. */
+    if (!(ssve_fp8dp4 || (fp8dp4 && dc_isar_feature(aa64_sve2, s)))) {
+        return false;
+    }
+    if (fpmr_access_check(s)) {
+        if (fp8dp4) {
+            s->is_nonstreaming = !ssve_fp8dp4;
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
+TRANS(FDOT_sb, do_f8dp4, gen_helper_gvec_fdot_sb, a->rd, a->rn, a->rm, 0)
+TRANS(FDOT_idx_sb, do_f8dp4, gen_helper_gvec_fdot_idx_sb,
+      a->rd, a->rn, a->rm, a->index)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 06bbd7fa63..c49e992f10 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1874,6 +1874,8 @@ FMLALL_sb       01100100 00 1 rm:5 10 idxn:2  10 rn:5 rd:5 &rxx idxm=0
 FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 
+FDOT_sb         01100100 01 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
+
 ### SVE2 floating-point multiply-add long (indexed)
 
 FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
@@ -1897,6 +1899,8 @@ FMLALL_idx_sb   01100100 idxn:2  1 .. rm:3 1100 .. rn:5 rd:5 \
 FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 
+FDOT_idx_sb     01100100 01 1 ..... 010001 ..... .....     @rrxr_2 esz=2
+
 ### SVE broadcast predicate element
 
 &psel           esz pd pn pm rv imm
-- 
2.43.0


