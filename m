Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD07FC43602
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 20:45:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfOG5-0006la-7a; Thu, 02 Jul 2026 16:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfOFx-0006fU-0f
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 16:43:33 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfOFq-0000Tm-Gt
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 16:43:30 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-ca00f126b7eso97255a12.2
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 13:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783025003; x=1783629803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWXEj27Gc3N4j5eqiB0V40kWOPw2D/tF24InH3I7ZHE=;
 b=BlXxmupdGquQtwzNHS8CEu3qIk7XYMAIzdPnNLZEPpQ6QmitnQvDxzI7A9/KbioGAp
 XyCSdhsW/LZYjJH8BfnqK4hlz7EZSbLsb5JQDOa0X0ZRD17gx0nN1PTj2pgnyCVLLOW3
 uR/eM5zCv8Ln24B7yygDLOd1AKshodz5nXPBb6muZC5km1xxtm7ixCKfobXkGDemMg8r
 6iy9xp4/lUyDjLdRXpKL08qTccn44KWHX5XSW/v8GYyBPZRAuy2uMzQfnpqB3Z1GChUG
 ZC19VFHr7jy88nhSOTXVUwlVQgl1VBgisc2WQ7/i8fuWHNAnR9q5mg6AUlaFOf2mOpwP
 iumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783025003; x=1783629803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aWXEj27Gc3N4j5eqiB0V40kWOPw2D/tF24InH3I7ZHE=;
 b=WuxXMuJMg8CcTEEcKud9CrkFjLLdyuTz4X9Q1nr+4q33pNHyFhgtVxfN8IU5pv8Fce
 puhlM5JiJuj2sPu3+Hg6W1vy0oTTIG1GjjIirX3uE2FAL9T1EiKsD/IqtZpKekulqlhQ
 niF9VF6CNJgHSppFj9nfZQTUhz5U2ZuOoOry0S3AmVo0Z0+kOY6M0cuhpH06AC2vhbpX
 8V+WthrfrmCvNezO7uVs2szJp4F5GnXGN/ngFcsFfMNLv7uayPlIrUVhGvRBtaf1fkWl
 RmoZDIt7liISDgTtwJVZXoUzlRnGHJEO28uZQZrdBkM6wcUz+AUv+x3H831FYuiPl6Hi
 SVwQ==
X-Gm-Message-State: AOJu0YxI3K9w1KcVMLvfUc6PppSiY+yduOYY0e6ypkkAbvrnZsR61pbG
 Ge/Ny4UsShwwn+2d0TJFICGvQGgsmB3tsK4Gkd8pVV9hqZLltnO8Kf6PWO9TghnUkns=
X-Gm-Gg: AfdE7cmCKSSNiAsrhs92ZbPN+bKDhTGJ3Mrm1T/o0dfQC+hyw0LXgzSnsvQkftLWh4E
 cesuPrengchMM1RDrv1U+cgBDh1r7IhIu8+ZiyJeBRYbc0DAqrXTJHqCFgHwYj3kjHPrripQcYx
 xTn4SmRKaOsg0PaDH9Mb6VNPGcOKzefl5sTkBV/k9I/BcjvISR2t8hqXpJm0vtvQOKOli0YycSs
 oHRsL6Ebs9i0d6hthXzqKMmCaTXuHvmSrpkL+unIJRu8ECxEIkwDoMDMt8sR7/l7H/ehIo3kht9
 /RJ+W6u5QWuuFPwqDfOmke32aYt9No3K+e1H1PvckpmDA4fiCd2fJWjUWQt/BrzsWnPkhR+9ReA
 vOyb6J0aLKzAD9/igCd43mTMyVGzTAOXUovrs8lOAQzgpw5TOxuVnvtjKYtjWLITf34phGYhgW6
 WCeWKezt50ET4aQk61gggkjngApzcRUwgAjRsU4Xoo0rXVw/zcMA==
X-Received: by 2002:a05:6a20:be8f:b0:39f:216:f400 with SMTP id
 adf61e73a8af0-3bfed1bb837mr9931765637.14.1783025002751; 
 Thu, 02 Jul 2026 13:43:22 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9e921cd139sm1678941a12.23.2026.07.02.13.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 13:43:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 08/15] target/arm: Implement FMOP4A (widening, 2-way,
 FP8 to FP16)
Date: Thu,  2 Jul 2026 13:43:07 -0700
Message-ID: <20260702204314.79224-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702204314.79224-1-richard.henderson@linaro.org>
References: <20260702204314.79224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
 target/arm/tcg/fp8_helper.c      | 16 ++++++++++++++++
 target/arm/tcg/translate-sme.c   |  2 ++
 target/arm/tcg/sme.decode        |  3 +++
 5 files changed, 27 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index c7e247e37b..bceaa10a0e 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1817,6 +1817,11 @@ static inline bool isar_feature_aa64_sme_mop4_f8f32(const ARMISARegisters *id)
     return isar_feature_aa64_sme_mop4(id) && isar_feature_aa64_sme_f8f32(id);
 }
 
+static inline bool isar_feature_aa64_sme_mop4_f8f16(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme_mop4(id) && isar_feature_aa64_sme_f8f16(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 47f35a82dc..dedbd8541c 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -46,3 +46,4 @@ DEF_HELPER_FLAGS_5(sme_fvdot_idx_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env,
 DEF_HELPER_FLAGS_5(sme_fvdot_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(sme_fmop4a_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(sme_fmop4a_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index f899a6cbf7..4b046f5f26 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -989,3 +989,19 @@ void HELPER(sme_fmop4a_sb)(void *vza, void *vzn, void *vzm,
     FP8MulContext ctx = fp8_mul_start(env, -1);
     sme_mop4(vza, vzn, vzm, &ctx, desc, sizeof(float32), inner_fmop4a_sb);
 }
+
+static void inner_fmop4a_hb(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float16 *d = vd;
+    uint16_t *n = vn, *m = vm;
+    FP8MulContext *ctx = vinfo;
+
+    *d = f8dotadd_h(*n, *m, 2, *d, ctx);
+}
+
+void HELPER(sme_fmop4a_hb)(void *vza, void *vzn, void *vzm,
+                           CPUArchState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, 0xf);
+    sme_mop4(vza, vzn, vzm, &ctx, desc, sizeof(float16), inner_fmop4a_hb);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 386ded1b90..b198c7c855 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2090,3 +2090,5 @@ static bool do_mop4_fp8(DisasContext *s, arg_mop4 *a, MemOp esz,
 
 TRANS_FEAT(FMOP4A_sb, aa64_sme_mop4_f8f32,
            do_mop4_fp8, a, MO_32, gen_helper_sme_fmop4a_sb)
+TRANS_FEAT(FMOP4A_hb, aa64_sme_mop4_f8f16,
+           do_mop4_fp8, a, MO_16, gen_helper_sme_fmop4a_hb)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index b8b507d8fb..4b7a99e203 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1101,6 +1101,8 @@ LUTI4_s_4b      1100 0000 1001 101     1 00 00 00 ....0 zd:5    \
 @mop4_o3        .... .... ... m:1 .... .... .. n:1 ... . s:1 . zad:3 \
                 &mop4 zm=%mop4_zm zn=%mop4_zn
 
+@mop4_o1_s0     .... .... ... m:1 .... .... .. n:1 ... . .... zad:1 \
+                &mop4 zm=%mop4_zm zn=%mop4_zn s=0
 @mop4_o2_s0     .... .... ... m:1 .... .... .. n:1 ... . ... zad:2 \
                 &mop4 zm=%mop4_zm zn=%mop4_zn s=0
 
@@ -1113,3 +1115,4 @@ BFMOP4_sh       1000 0001 000. ...0 0000 00.. ..0. 00..         @mop4_o2
 FMOP4_sh        1000 0001 001. ...0 0000 00.. ..0. 00..         @mop4_o2
 
 FMOP4A_sb       1000 0000 001. ...0 0000 00.. ..00 00..         @mop4_o2_s0
+FMOP4A_hb       1000 0000 001. ...0 0000 00.. ..00 100.         @mop4_o1_s0
-- 
2.43.0


