Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23ACC61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:44:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHeB-0000FK-RD; Wed, 26 Aug 2026 13:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdw-00005i-M9
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:32 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdu-0004oO-RA
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:32 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-cc1a4c62804so1283763a12.3
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766149; x=1788370949; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oHlvtyL2rQlyiAdhAGXJKakXVeYyRaf33f+zCffDFKc=;
 b=XCbUk0BdIM5hpHNBKi+nVzKciMCt4iARLqzQ5To2cQsvBsY8Gp3AV3uTvEYfI0D1k1
 a2xgQRB34SZnVZfvpMOWcLqfkMJ7kJoDo8klkDhDEBa0N0Glxf/qxXY6Nta0rsyNmdNC
 JX+yDSchTPyvCfHSDUfQtcd2df0n6vhERjBE/Q+J8a//uASMOaTtuK+rtJjEGQBg+D/9
 6inQt07RmpEglDL5Mqe/RJdd/EksYeHrXwQDuxmNPQ77acEv3N1CVw6bJYKpMQ/eGFnl
 3LDzA8Y0Kvgw25mBXrBfpNsemUAHahR6tufgd9ASu5ytWOvdAJiMn2DqThkE6S9Llabs
 lumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766149; x=1788370949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oHlvtyL2rQlyiAdhAGXJKakXVeYyRaf33f+zCffDFKc=;
 b=H/R3Fm6FKrJf5eLFXKKhhk4ttp9ulpuk9nPpYFZlrbsGN6hVu2M/hqPDZUpdZhamRb
 2bjndo5UUDE2qokd3cQMB3QEJL4I6CfuJdD1GVXqYilbRreYtNxBD1bKcaG/ExoryCuL
 Ca09Lextn4+ElAzG21UFSioEtkYdygx/WPeB2Tff4ToENYVOFcCxxBLPAk+X3y7jqKBj
 +kV81+OGF+lOyN4NFOLPJads48Tc2mEm94fOWBqL0O2Cek8l0DMXKUEehOjRiDbu3Lzd
 9F9g7tD4g+zoGndlVfW0UVWI5jkGJ7nBocdNz4QQ8kF8tEmLR/fR1gRzYHjjKwEhVHeQ
 Urxg==
X-Gm-Message-State: AFuF++ng4BCc5g2XCD1+tfDrKY1E9M3dZ7qhTzEne1IspNOvq7hslOXI
 kHiFGqVf1wX+cvfjC8Vo+rgEiNlCCeczzYYdbBVaFRfrz7AU/drp23uZw+KR2+ecedvw81ZDSaI
 r6PiYBWA=
X-Gm-Gg: AR+sD12kg9/9NqvKjiAjRcOmuehwZzvmJf4Dd2NkqSQjuwKUYnJTsEwI0/ZZBki733R
 znewwIIo+Onv8mnPd9dVdlSSRKR281fJpXr/Lz/eNxSOWEw3pIPOAOmqAH42Kz/uOy4NYYxlW2u
 5wDHGhronf7TYc2+v5PtjQjWqjzjAne2GwozyM/ezQdra1IePIZHh0S08ycb8bq3G3NDveExh2n
 K5x+AWeJrqt9zfPotYgJbT8xBA/Bx4RkP+iqXGYQ5+4EF9rn50/ksC3vitRwuQaH/PgWJXeRHiK
 ODO9aU0yMqa8hzrsH7TtfUoxBeYwfRkQa2esgdS0eqIX7uO/xSetf+STtjTKUVCPATXaQwtd9/7
 kJ+C5c+NEgHiKMOObXSX9RWsNbonhBZhtMubeiPM2HcUkjD9MFOYNa0c42vv/YW4mhIXFiKiLRj
 FEOCbsq7TQcrok0eJXqaNpKh90jWK8gtics734+k0zeeqDx8lTxzhMK1Hp/KJ460RL2LhYlcpyr
 4yuuBmjNhFB5mVkl8VRo+KELKEJ
X-Received: by 2002:a05:6a21:7985:b0:3d0:ba81:79b7 with SMTP id
 adf61e73a8af0-3d0ba817c06mr5050655637.12.1787766149040; 
 Wed, 26 Aug 2026 10:42:29 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 12/25] target/arm: Implement SME BFSCALE
Date: Wed, 26 Aug 2026 10:41:59 -0700
Message-ID: <20260826174213.614571-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
 target/arm/tcg/helper-a64-defs.h |  1 +
 target/arm/tcg/translate-sme.c   |  4 ++++
 target/arm/tcg/vec_helper64.c    |  1 +
 target/arm/tcg/sme.decode        | 20 ++++++++++++++++----
 5 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 76859c1f745..b29cd490200 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1872,6 +1872,11 @@ static inline bool isar_feature_aa64_sme_tmop_f8f32(const ARMISARegisters *id)
     return isar_feature_aa64_sme_tmop(id) && isar_feature_aa64_sme_f8f32(id);
 }
 
+static inline bool isar_feature_aa64_sme2_sve_bfscale(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) && isar_feature_aa64_sve_bfscale(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/helper-a64-defs.h b/target/arm/tcg/helper-a64-defs.h
index 12f58c6a442..c1e5d86b272 100644
--- a/target/arm/tcg/helper-a64-defs.h
+++ b/target/arm/tcg/helper-a64-defs.h
@@ -151,6 +151,7 @@ DEF_HELPER_FLAGS_5(gvec_famin_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32
 DEF_HELPER_FLAGS_5(gvec_famax_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_famin_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fscale_b16, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fscale_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fscale_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fscale_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 463754b057f..d28574a8cf0 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -890,6 +890,10 @@ static gen_helper_gvec_3_ptr * const f_vector_fscale[4] = {
 };
 TRANS_FEAT(FSCALE_n1, aa64_sme2_f8cvt, do_zzz_n1_fpst, a, f_vector_fscale[a->esz])
 TRANS_FEAT(FSCALE_nn, aa64_sme2_f8cvt, do_zzz_nn_fpst, a, f_vector_fscale[a->esz])
+TRANS_FEAT(BFSCALE_n1, aa64_sme2_sve_bfscale, do_zzz_n1_fpst, a,
+           gen_helper_gvec_fscale_b16)
+TRANS_FEAT(BFSCALE_nn, aa64_sme2_sve_bfscale, do_zzz_nn_fpst, a,
+           gen_helper_gvec_fscale_b16)
 
 static gen_helper_gvec_3_ptr * const f_vector_fmul[4] = {
     NULL,
diff --git a/target/arm/tcg/vec_helper64.c b/target/arm/tcg/vec_helper64.c
index d8b25b868ea..88799693507 100644
--- a/target/arm/tcg/vec_helper64.c
+++ b/target/arm/tcg/vec_helper64.c
@@ -179,6 +179,7 @@ DO_3OP(gvec_famin_s, float32_famin, float32)
 DO_3OP(gvec_famax_d, float64_famax, float64)
 DO_3OP(gvec_famin_d, float64_famin, float64)
 
+DO_3OP(gvec_fscale_b16, bfloat16_scalbn, int16_t)
 DO_3OP(gvec_fscale_h, float16_scalbn, int16_t)
 DO_3OP(gvec_fscale_s, float32_scalbn, int32_t)
 DO_3OP(gvec_fscale_d, scalbn_d, int64_t)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 60c7cacc10e..4e19c42b196 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -287,8 +287,14 @@ ADD_n1         1100000 1 .. 10 .... 1010.0 11000 .... 0    @z2z_4x1
 SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_2x1
 SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_4x1
 
-FSCALE_n1      1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_2x1
-FSCALE_n1      1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_4x1
+{
+  BFSCALE_n1   1100000 1 00 10 .... 1010.0 01100 .... 0    @z2z_2x1_e0
+  FSCALE_n1    1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_2x1
+}
+{
+  BFSCALE_n1   1100000 1 00 10 .... 1010.0 01100 .... 0    @z2z_4x1_e0
+  FSCALE_n1    1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_4x1
+}
 
 FMUL_n1        1100000 1 esz:2 1 zm:4 0 111010 ....0 ....0 \
                &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2
@@ -365,8 +371,14 @@ FAMAX_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 0    @z2z_4x4
 FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_2x2
 FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_4x4
 
-FSCALE_nn      1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_2x2
-FSCALE_nn      1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_4x4
+{
+  BFSCALE_nn   1100000 1 00 1 ..... 1011.0 01100 .... 0    @z2z_2x2_e0
+  FSCALE_nn    1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_2x2
+}
+{
+  BFSCALE_nn   1100000 1 00 1 ..... 1011.0 01100 .... 0    @z2z_4x4_e0
+  FSCALE_nn    1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_4x4
+}
 
 FMUL_nn        1100000 1 esz:2 1 ....0 111001 ....0 ....0  \
                &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2 zm=%zm_ax2
-- 
2.53.0


