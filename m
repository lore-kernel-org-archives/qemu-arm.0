Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC84CD4F54
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:22:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrd-0000Wc-Ua; Sat, 30 May 2026 19:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSra-0000Te-OH
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:13:06 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrZ-0007dq-6j
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:13:06 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2bf36a6905cso6624545ad.3
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182783; x=1780787583; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGo4qqEtI42nHrPCcXab2YjAMcQp38Ka3VdQ+FON0mQ=;
 b=SRouIVCR0k9zOA9H/xW4NP6cp18OR24B4THHe110/3LbVZOHuNdiNoHz5H1k7q8Ckf
 MTLqXQBKjpMif45qlu1UkjtTgEHA2krexx10t8FVspragXjAdGgpYsJ8AMKZfM980Gv5
 yt/+vAzJFrjhc2IlHjK6kKlBcj+5IvMKVZszsL/JA9L37YeT3ApuJeVp3QlHoM1HRHzi
 SOLYQqnEWd0VkznyzLuoRZgFvPk+brjB7JEq24thooRqdvzNXJIswWp1BpwCPLWcd9YC
 GxsNu+qmYSKUKhIxryOL3N0v5NjTxZNt7M1kRjr3xdLDSFaaKSHFbExvBU9YRdithRBT
 kJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182783; x=1780787583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WGo4qqEtI42nHrPCcXab2YjAMcQp38Ka3VdQ+FON0mQ=;
 b=JJtDq1u5t4MSkRQLFwr9lLT49OPMIEi3v4Nhf5xTxyKKaacSkD85lb9Y1Qg7MwqYAd
 1o1V7bxJduprk3gw5aQyuY7HVG9BCiWBGYeVEPEtMtY8gPfnUBcr6b+/MTAJ+bMdp/cp
 P1DvQsNeZM+IwwuO7Cw2dh0jl7An6BiYpjIQ52eRpbg8TPewhsWySihVu4rUlQt40Zkg
 eVTrIlDqcUWPRYwRxf1Lb13ianGzX/TZ4GFYNZ+yVtpu3riPMT3TET3YG852M38rq8fw
 9HWG+TYvUY4DIg5NocQZ/Iuckvhb3lPahmkaAQLzipHYh6VFKfgQL2G1x42Bjy3WLr4U
 v4mA==
X-Gm-Message-State: AOJu0YwIDpiMjZ6HguKgOrLH1TWcCwpvbFOOQ95lQUbTy+sgmUJSP3CC
 1jrrmMbgoAmxKCUffyPtr0+MqWP8d51hS/A3RN1HTxbpQoELx+WrVtpp8AtRpvHF56umtKy+jqI
 AdCdesu8=
X-Gm-Gg: Acq92OHcG/RyWdYjU90rciShuEpU/nMxg5G9b1PISOVfEg9wJxT0TMVkMiJG0ilkI0C
 RPJNsJyPcSQWNlYXYzmT4gKoFu0qeZCJTK7ECmVnu4uX563raKF9BcEm9gontLM/yMxubfcIKlE
 Wqye6Z8djyF+4oYhWfxJr+SCrd2YRw2wpu4Vfv6eAb/s3WKBEh4vqLeAIiTwhzYo/AvsvjYr9MR
 jbvcSzNPTomsQNxypxNX8ZSeH/B0kjENzcttt/nVRnQ+GjCXMOOoQQ6WG+FKNxEUZoeZdu1VBCz
 gVFI1H7ixKfKNktICOWsdFWercr71x/1fxcGI+LtFWDx6adfmHZUoql0SzGisD9McyqV8oczWz8
 EwojkGkvu0nrtHcfGUZJ4O1xttxxHpg9Sjm73CMY7IVhgSsZZ5QS6iZVxYTXLxDflO0DsiD12yn
 mlSfzPLbyGA7Mbl4SkZ+0grMbLP8kJdy33irgEFio=
X-Received: by 2002:a05:6a21:2d46:b0:3a2:d436:acb6 with SMTP id
 adf61e73a8af0-3b427f33810mr5755176637.37.1780182783334; 
 Sat, 30 May 2026 16:13:03 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:13:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 37/41] target/arm: Implement FMMLA (FP8 to FP32) for SVE
Date: Sat, 30 May 2026 16:12:25 -0700
Message-ID: <20260530231229.400441-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
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
 target/arm/tcg/translate-sve.c | 16 ++++++++++++++++
 target/arm/tcg/sve.decode      |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 1fc8db8d58..2b1d1034c0 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1703,6 +1703,11 @@ static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
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
index cf370b3c86..2ecaa0f1e5 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8461,3 +8461,19 @@ static bool do_f8dp2(DisasContext *s, gen_helper_gvec_3_ptr *fn,
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


