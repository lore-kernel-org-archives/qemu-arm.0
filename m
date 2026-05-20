Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1441ECD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:28:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPleG-0007o1-MU; Wed, 20 May 2026 14:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcK-0004JC-TV
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:06 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcB-00026i-19
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:25:59 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2baca4df358so30599735ad.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301553; x=1779906353; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JulMb7JBgH2EgAoTHRzYHxSimKKsWGbaNst37ZkVAE=;
 b=yW0K4hPn8ys9xEp0KmsYzZGj3AQGOuE4W5X1FXNkLxEwrOH5F5uzGwT/CCGL/DDjvL
 44Tw6XviJjhZFOhRzdqX/1mvhvhuxkRFoIvRlOzyXsDaVAyxEAwjPChXPVM+5u+mZ15T
 f57o91s770zk64z5umJWEn0bzmr6vnnb+vMhM9Kgw5aElxqRWonLDmmd3/XoliN3IV9F
 oWaWmvtLckPpcla0z1+6joMIoqhPrSU931C1GficLQexcg7N8vwtO3/XgM/0sYaVreTh
 N6LGrsT0vk55sqEf4A71YbGRKF69X5TZNGJAKj1CpqHHmhTRDSO/+ZQ/ixfsaJ3BezAM
 nKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301553; x=1779906353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7JulMb7JBgH2EgAoTHRzYHxSimKKsWGbaNst37ZkVAE=;
 b=UZa7CeK3SsKTPUXZmB5yH/KHuZdwbZusBEwpyRQeqky+gijhsuEc3psqmE7gyh11Zc
 70rCYu1efTCoCL3gTDrtvLxwrEeZjLfwoAkjrSKMmvKIb6nrVdREj1bXQSYv8YmxxhOH
 w0xZhicB2MieFRnOarydENVKaTpju2miy4g4qJIUqjxI6tV5McbEU05iQIX/nHFb0/nm
 dvNmgKy6B2PI+BV3AvDguoSUJDMMU6KqwGOQYhTOUt/fbb48nW3OkAn5dGJ7WZdtSvM/
 scmt+DaVl4CRoK4a4aPd1DO7rI0SYAOlHxH8Ik50MYfkTdlmAwvN3FZgwQJDv0WqWp7U
 wOeA==
X-Gm-Message-State: AOJu0YyQdH9Lm+r+EQbkh4Ozm2MiXQbhhH0RoL9+VxPoCSZIkgAIzrCZ
 RvoTCTVLrPfiSAqHFyA8RC8PtxajzY/zyqr0fZCsreKKnHLzlpS0W9ZyWVUhka7aNN1DB1O3yMu
 /WSsw4m0=
X-Gm-Gg: Acq92OEEhylfqyRX4G6ScVMgrCDAkUe+vi/mjFnj/diiyth6h+DgydJP/rYLcTGcAgc
 o/AgU7fdjoQB5zgzYyroqKUa0JNuCuXllR+ZoOLjRBm8RT8Mp9NVJfNnenHMzZfL15ZIlLQ+/zG
 qHT+GxLioUSgZ5t8srvqeaDqWDhY8bhtqmOiRRcrxFrMPLAt+QtrgzkT/3dAtRbcO6VLN+ynXUK
 bSxrZDaC5nt62w6KcRAwcBOMJuecysEtHD5mZirhzenpXLD0qgZKQAEf9067l5Hpn3PX85FzfgE
 XM+qTL3CZLgNAKj7AxVNwf1jxCWrYpefXUzW0SANm2ouBjYjZHHORyNlnFtG40ax2gug8yGhvQe
 xc3ZBvIwQwFgBid+T+M+frUMUPuPpCeKGa2wUQMPERVap4Yxww//oshMYAXSiLo6GnnEmf304uN
 U/hZUJy2COZz+B+81nidLYxf5gXVH/
X-Received: by 2002:a17:903:3843:b0:2ba:b250:c015 with SMTP id
 d9443c01a7336-2bd7e8f0b6bmr243849705ad.14.1779301553002; 
 Wed, 20 May 2026 11:25:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:25:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 52/64] target/arm: Implement FDOT (FP8 to FP32) for SVE
Date: Wed, 20 May 2026 11:22:01 -0700
Message-ID: <20260520182213.872945-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
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
index e23ca43f55..88e6148b83 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8372,3 +8372,38 @@ TRANS(FMLAL_idx_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
 
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


