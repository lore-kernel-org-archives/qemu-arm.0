Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC00CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:34:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX29F-0007EV-Hg; Tue, 09 Jun 2026 15:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX24r-0005bv-BA
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:25:34 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX24h-0005Wj-EW
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:25:30 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2bf22d29dabso40018505ad.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781033083; x=1781637883; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGO1KH2dWLuKc0TZeKusI9hi1gX1fWKEPTW0xxCeIvs=;
 b=RbTrJc96OHtmu94OqVJKL5e8THERAANcN3Ma7AmPu1/haiWQq2GLwuQt7WW9qr120G
 cmYSRTqw6wiVbNsiEYhSGs9VPoEd+N6I+1kgjOTJxgW/kA+AVN5+oHnGqbVnsjiaV1iI
 fW9nnRe62MhgbmtZoH8Cxum/H3sdoiKYy6LFL8sTZOg2mlo05v94TxSBoC1/938fBGXQ
 WwPG+HMPpyxaXhjZFXTeiqDobHJWjkdkhPQ/ZSkgn5tMCdsaIOqfwqGc7TP0VJ6Q7G/9
 y5P4hSoEmvnhoMZvfMvLREeR/WqrRfx2ywt+4IN60s9dTmokj9WzrW3AqiQFOWexgQiW
 LfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781033083; x=1781637883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wGO1KH2dWLuKc0TZeKusI9hi1gX1fWKEPTW0xxCeIvs=;
 b=XZK1gdb2VSlbdEU2kT4iYNgt3OgqkT/zR+XI/D5YnJnegjCBo458fl5KooUY+mMKpk
 Lro1x+R5OYAra67jmDllYXEHoC2Eq5Krlmzx1imF4+LbVsfLT19rF6x4YXTplthzrri7
 dD/EuqojdJ+BdBn26G8+k0w9XdWgxPOLjqRw6WS/iVdQOYa7aooqhMGdENibKu7YgqhF
 YKSoFPpeM7ZWqt2QxZ6M5Zei3/wes0Frq2XnOouEaakB5PflGCGG9Z5BlNUsvF56b3Hf
 rtnPGvPnrwVJ3i6g4RWCVxL6frakc4jxOQPualrcdqDpDX86G5qAcWNDrH6ABPf4xCjJ
 nl3A==
X-Gm-Message-State: AOJu0YzceMyaWLS74zR97/p6D1E2ORs6M08aCFh+DUyDYYRC3VRTg2wh
 xjSh5nzRtzZo4rIlt0If9vLEFhJCwsynNU0T7fkLFYHqfMJgFZjX0/ySMm5jjjijlg0=
X-Gm-Gg: Acq92OHHQC8MZaSGNXtyK+Zz6mPGCQp0XVQ7cBeok+EYEttkTnAFJ7vr0+npL2AoxUA
 51ndS5hG5oG2sLtFg9xY9BIWHs2PIbJtoqLJi9SbOOZVX0n5ikW7OEV7C97DmDsH5TLZlLIQQl6
 i10SHPi0VubugPCK3pWo+sSOxnljQYOJRE02TyGPQRC//2aNyUeL/mH2ZbucwZSQJMwYwZeCRCX
 67WR+OEPcqcBViE0QcaVGeonzTFnyVlFbDKh96dT6BOWb+jrMAmm80YrBo2AnxnCco1+flB65r9
 kuplSBxC5vYECHThWzHdSwZASwxLUhjqGjhG6LG/zVo/Zh60eaqbTrQ59pC9iv6SqLaVQo5H3at
 fYzF598lbfFRhBJqUA+jiMkynCF8grQW0Mwp2+LeMQy7LTjyar6R+pld28pubbM5zJO1AoGTDF9
 Akr88LzHIF2w+EggzbJUrjWBbgTsQino0ynugQ2dY3rqeHqqs2XA==
X-Received: by 2002:a17:902:ebc3:b0:2c2:7baf:139f with SMTP id
 d9443c01a7336-2c2a1c9b30dmr52135825ad.30.1781033083488; 
 Tue, 09 Jun 2026 12:24:43 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164fa00b3sm212247045ad.32.2026.06.09.12.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:24:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 41/45] target/arm: Implement FMMLA (FP8 to FP32) for SVE
Date: Tue,  9 Jun 2026 12:21:05 -0700
Message-ID: <20260609192110.752384-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
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
index 2cc5e129e9..f6705ee95d 100644
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


