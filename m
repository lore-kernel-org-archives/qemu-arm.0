Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5D7CDE00B
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 22:37:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcsfd-00050T-5z; Thu, 25 Jun 2026 18:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsf1-0004an-Rf
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:35:08 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsev-0002KX-NQ
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:35:01 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-84532e3dbf7so138113b3a.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 15:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782426729; x=1783031529; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9xbsNghhooG56Y5xDxFqxu7y9OvncapOaejYstM/XY=;
 b=rj3foIvXyK3UGZ6oKEa7f+HsJ7n1NwyQsM0vdUxUTOtjLhBnTK57YYJw2RB9B2pBmX
 HY2OArx0TjxNqGB0u2CYwXuEv8FgLZaMtnEjmr9JlUUEDTrNOmrzvswFc3TDpDQQeR7l
 pJThcVpWVbxslJ5AULdzy7DtFm30wcJiiwmBjjcoOUT/N9aSePrmZHsUTi9VnqHYU4Lp
 2zh0cuLqNFcnhe/mIq8fJFi29PDfFxv7fzmMaK4mLrZTmdh1IE7dVLTzUAFmRJY8g+bR
 20di+P9TKJ9todkJUBWjDfl9uQdMD6vkHC6Kbw4fzdyR6sdjjXOamdwDM8XaHTUO7Nty
 Tqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782426729; x=1783031529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p9xbsNghhooG56Y5xDxFqxu7y9OvncapOaejYstM/XY=;
 b=eHe5NZnzGig+1bk1fA2w6zNMMPd5g6N4qv4RVyXhBa0iOxj4ECNSAZb5nB5Dw7pcve
 R+joyfexL7ArcuHcu7sLyBj3PrgEAWdHBLbmDSDtJWtV9Li7oV0x1mU0xDw3okjWYOzH
 Q5BSq4WqM3pXijrmrSfa1mFOvyx+HQpqliPimu0b6u89+Q3pqtlDBa9meamq4jNDf1k4
 GDex0eUkr9X22JIjehB1uaEvE1LvoQ/CV1oHEjGapFHTUDTQkcTVoujl4i2xiQ0PsbDM
 bltMBxHSfpgVmBHcRdtIoZgtsVPts0W1WNa5R/nCFm9ydamD+PCWdD8pEuadx2cxDH6l
 jS7A==
X-Gm-Message-State: AOJu0YzET+cC6mmi+0e7e0mcUfj9QV5MkOD0kXylFw8wzGjCgssXWo/p
 vHkKOIC0U6r7IMBSapqOk9gkqo5ry1Ass9GjnGLoC6EaGQmoJFji8CGV9E4Cs0Qaozg=
X-Gm-Gg: AfdE7cl+pICzLHEyDlQ+SKExDsmxohLimRuSN0gX/QgWysMeyy4lwbos5EeI9mr/LqJ
 7EomVWj2c91USEFFK5X13swstyijROf6FAuet4o4RQRzy+1eV2ln1NmRkcZy5r9VdXgpmE345UW
 VcQRfwh5fmBAfJo73dt+tuqeknt+4j+Kl2Zlh//K411KuPq1O9mcNeH8FGBrTSJuWLhWaXRhQID
 yM+5O3XTZuXLJBys3MVXNxgxD+jjh3hburDciHQElmK/W1/dLRcXMQk5GoyKNy5vs7edCK5SqcB
 1+/LsBj5dkbSVBtCmgqeApIYvuEKkUeq+bHoMYl/0sE12eCc7QP156UTLZikiYu8TamBiFib2il
 CvKa7SoUWSH9cZDDQ/dLcxEuKB7+MC8nM7NsSDHWD/sZUhgOKnRcLI0SodQfqJQP4yxYTeg8SPs
 0D2seXLCTze67zglx9N/6ZQ5ld24kwH25ZuQaJX3PnWvTkXmmspg==
X-Received: by 2002:a05:6a00:1a8e:b0:842:4a39:6047 with SMTP id
 d2e1a72fcca58-845b3ab68c8mr4946567b3a.29.1782426728929; 
 Thu, 25 Jun 2026 15:32:08 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a412e5e9sm5450139b3a.54.2026.06.25.15.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 15:32:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/15] target/arm: Implement SMOP4[AS] (4-way)
Date: Thu, 25 Jun 2026 15:31:55 -0700
Message-ID: <20260625223200.763198-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625223200.763198-1-richard.henderson@linaro.org>
References: <20260625223200.763198-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/arm/cpu-features.h        |  5 +++++
 target/arm/tcg/helper-sme-defs.h |  4 ++++
 target/arm/tcg/sme_helper.c      | 19 +++++++++++++++++++
 target/arm/tcg/translate-sme.c   |  4 ++++
 target/arm/tcg/sme.decode        |  2 ++
 5 files changed, 34 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4319a95921..c3eeecbea9 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1817,6 +1817,11 @@ static inline bool isar_feature_aa64_sme_mop4_f8f16(const ARMISARegisters *id)
     return isar_feature_aa64_sme_mop4(id) && isar_feature_aa64_sme_f8f16(id);
 }
 
+static inline bool isar_feature_aa64_sme_mop4_i16i64(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme_mop4(id) && isar_feature_aa64_sme_i16i64(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index ddf771e446..070a1a2c1d 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -382,3 +382,7 @@ DEF_HELPER_FLAGS_5(sme_ah_fmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env,
 
 DEF_HELPER_FLAGS_4(sme_smop4a_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_smop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_smop4a_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_smop4s_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_smop4a_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_smop4s_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 32fe867a3b..11d9d509ec 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2954,3 +2954,22 @@ IMOP4_2WAY(smop4a_sh, +, int32_t, int16_t, int16_t)
 IMOP4_2WAY(smop4s_sh, -, int32_t, int16_t, int16_t)
 
 #undef IMOP4_2WAY
+
+#define IMOP4_4WAY(NAME, OP, TYPED, TYPEN, TYPEM)                       \
+static void inner_##NAME(void *vd, void *vn, void *vm, void *vinfo)     \
+{                                                                       \
+    TYPEN *n = vn; TYPEM *m = vm; TYPED *d = vd;                        \
+    *d OP##= (TYPED)n[0] * m[0] + (TYPED)n[1] * m[1] +                  \
+             (TYPED)n[2] * m[2] + (TYPED)n[3] * m[3];                   \
+}                                                                       \
+void HELPER(sme_##NAME)(void *vza, void *vzn, void *vzm, uint32_t desc) \
+{                                                                       \
+    sme_mop4(vza, vzn, vzm, NULL, desc, sizeof(TYPED), inner_##NAME);   \
+}
+
+IMOP4_4WAY(smop4a_sb, +, int32_t, int8_t, int8_t)
+IMOP4_4WAY(smop4s_sb, -, int32_t, int8_t, int8_t)
+IMOP4_4WAY(smop4a_dh, +, int64_t, int16_t, int16_t)
+IMOP4_4WAY(smop4s_dh, -, int64_t, int16_t, int16_t)
+
+#undef IMOP4_4WAY
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index b948591dd3..6f3806f4de 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2110,3 +2110,7 @@ static bool do_mop4_int(DisasContext *s, arg_mop4 *a, MemOp esz,
 
 TRANS_FEAT(SMOP4_sh, aa64_sme_mop4, do_mop4_int, a, MO_32,
            a->s ? gen_helper_sme_smop4s_sh : gen_helper_sme_smop4a_sh)
+TRANS_FEAT(SMOP4_sb, aa64_sme_mop4, do_mop4_int, a, MO_32,
+           a->s ? gen_helper_sme_smop4s_sb : gen_helper_sme_smop4a_sb)
+TRANS_FEAT(SMOP4_dh, aa64_sme_mop4_i16i64, do_mop4_int, a, MO_64,
+           a->s ? gen_helper_sme_smop4s_dh : gen_helper_sme_smop4a_dh)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index a872fbb4c7..6fdf79c7b6 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1118,3 +1118,5 @@ FMOP4A_sb       1000 0000 011. ...0 0000 00.. ..00 00..         @mop4_o2_s0
 FMOP4A_hb       1000 0000 001. ...0 0000 00.. ..00 100.         @mop4_o1_s0
 
 SMOP4_sh        1000 0000 000. ...0 1000 00.. ..0. 10..         @mop4_o2
+SMOP4_sb        1000 0000 000. ...0 1000 00.. ..0. 00..         @mop4_o2
+SMOP4_dh        1010 0000 110. ...0 0000 00.. ..0. 1...         @mop4_o3
-- 
2.43.0


