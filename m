Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1330CCD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcLL-0001el-J0; Tue, 02 Jun 2026 23:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcLH-0001UC-Bs
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:32:33 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcLE-0004cQ-2f
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:32:30 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2c0c379e8ffso22675635ad.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457547; x=1781062347; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9YCh36KGW4DMNvDs+qzc9ZLkXx+lxkD5bVdA/i8Kk4=;
 b=npOJdKEAS70pK+ll6edxWSL7brneuJMTPX9rIIS9kkZcyihb4T31ytzxIRkMOQB6wx
 gQbKCg7HKnSeOUm8EIBJWjl8qjISz9rMNh6wKDZAvwEH7ew+ipRBVTYWBJuaZGoJS5vk
 TLlTUtOB5LMOYgSdHXF0obtyc3j2tIyOBxUolEhTwrfnu6mftptCJ/lBhNEmowruy0dr
 kCxTkzZEzGLqw8WqEnMv58EBP4c9zzt25lYu+ZbY4+KBjObm1JLwMMi1+NQbIFj1TDqa
 NqMLooCQA3wxc5VTSex6M4NooIDFJ7MyQ1Ti9lJH/R6LphCfpa+borvJAPrm8InQBvz2
 yqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457547; x=1781062347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u9YCh36KGW4DMNvDs+qzc9ZLkXx+lxkD5bVdA/i8Kk4=;
 b=a+IVFKAv0o37252ROgMBhdZVhmAYcgJL4D3I6euSeHSQNkkt38wTrlYFtstni1kzb2
 GbQIOs+tPsTzrHeyywNjyev1IyZg3TqVPB96yKf3NL5+bJ9nAm77fNe3ZBBKmZ8M7BWU
 8rON+egD0ApmButjCED55LFSMdNSAEjq9jfTiDckH7sGZJWIlbFn09zRn8uyFaQgYgP8
 UZ5+jbCo2devhFTd141Vd3FfLEZRoDkl9Ve68ZiD9yB2Am5bkg6hiYhABHgzON7V+ct9
 JbJ6cuC+/3jmHVNDiUo1gjvQjU+TQEaoXtGX2/SoW+K3zPDuPZjWnMMAp46W1YJZtH+4
 3Qxg==
X-Gm-Message-State: AOJu0Yw1bWo+QDaNmd71HDS0n7s6K43YeNJc8HPRXM0fU2IjbUBbakQB
 Ls9/FlryL6K2M6YY9cz4tv/7hzmFjh91rYp6RbeX/nCRX3qv1gVT2J9MbjM/z7R12dglKNZeXXL
 bwwa3AO0=
X-Gm-Gg: Acq92OGO+KZDNDM32tAKrkbFOfF+DivMx8pJnL7jadxFFOF9gte4ECSwO+g3hVh0YeQ
 adqjWz/xiv+FhzrR5NzNPW/Kc+8/iQCTa8bqOQsHMn3YlRjkgt4eYLEi4Ad11gVxxDid0YM3whu
 ezqFHqCthxoIkbw1hxV79AyfOQ9tmKZmQo7KY+/+Y0xPXwGPngr5vE7sTa0R+DwYCQnNynA9p2j
 XKEvxUHeeFnF0ae5f6tGIetQSBTwZkox1zFOYGRbjoitaQDpBohxwS3ISoD7ohP8hi7wxMqv6r5
 zhl5sW5dF+eRcSvf/4CdV+tCxu3TUHu9XlpGH7PaPA/PzEmNlYOlCvGR/Tsafv2Ste9VsT3qvaE
 1YYzl+z7HHTv351Z5pocNLyorYVCYAk3AAKvzYPeWX7lq1oZkfL1pBgtl7ZRBK7pDaGzBSe1Xal
 j7kTJI8WaJw/PypyMfhL9905r0eXfIRj5JMyLC+eE=
X-Received: by 2002:a17:902:f60b:b0:2b9:f59e:aca5 with SMTP id
 d9443c01a7336-2c1644b12c2mr16936155ad.39.1780457546518; 
 Tue, 02 Jun 2026 20:32:26 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164fa0236sm7785685ad.33.2026.06.02.20.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:32:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 41/45] target/arm: Implement FMMLA (FP8 to FP32) for SVE
Date: Tue,  2 Jun 2026 20:28:50 -0700
Message-ID: <20260603032855.106930-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
index fa0f3d23b2..1def148f64 100644
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


