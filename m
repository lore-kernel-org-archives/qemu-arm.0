Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3238C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 20:46:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfOG5-0006m8-EB; Thu, 02 Jul 2026 16:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfOFw-0006fP-VN
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 16:43:33 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfOFq-0000UT-L9
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 16:43:30 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-845537740ddso1662167b3a.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 13:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783025005; x=1783629805; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mUvfYWqQa4430Z8IazmhDPOpdaKVQE0WFkSEepOUgzg=;
 b=GIk+m3Zv8zcF1+DvdEQDtfBFo+GcPff/fjTSifbqLTw/MVU+nfQxLX1QSBum7lVPXx
 Z4Tua2dV1+Cp8dejQ1Kvm3U0jyhy1+9rbuc4YfZzKNwbC8//qrRPeK7dupI1obvK++WB
 S4E0nEn1UpwepMKf/L+eU6XO3ZOzrU/g9t2pc6WtOG1KIOxVOnFf7QLHIWFjF+pG15wp
 yNCv9QuDra/9Rz0UbTTMR+LUe4j0Ckk1XrYn/tKo+UO58rkysYzvMiQgPAa5tvpxcAkj
 GzBovyoXt57hguCuWTEBFRk15yTJWvLiqVcTcZVBH1+/5WgjYLvzWKo/af8uTZSg7RyK
 8cVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783025005; x=1783629805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mUvfYWqQa4430Z8IazmhDPOpdaKVQE0WFkSEepOUgzg=;
 b=mTSD/tt6M0vZkhJrya9VS053Fc0zaVbnmscesnOS22Pxwol/yDNZr+xDJAzBwO9fkS
 FJ9jYiCWVaRKeWS5T0PuiUlXqbX+6v8sdBQ0MIG5FTmcyP6VjJmr+XGvqnRMRGeXgGrU
 ivZYVBmcAihZeZB+ZI7J0vO63FiP+pLP10AFdT9Z4bbMoETSA9Pf336Ok+Z0cMAzMAKA
 dqcwaIaqpOl+wjg+d2+c+eo6chY2rNUGs0SZqupuQx6p1+MTQd8NJhwpEwyfHpYDbgRI
 5+o7XENk9onqmbtgvMQtdnfZR9SAW754COPMA4Fjzs90JJz2EhG+1JkPqmiZqvCLreE+
 2KuA==
X-Gm-Message-State: AOJu0YyAG0+c8wCUugzJyp9S4+tsvQYmFl7E9Dm23ggFCRCVkubw7dZF
 bgO8PlexK8Uyj/vGEylq9dD/ucVDjhxL+bg6z4NaR6N03rULTtcjyC6M8Ithh1AZw2g=
X-Gm-Gg: AfdE7cl5H5ks4SGGnRhbe51wiXc/458NkJitiA8Se3Jotbo1SNWmLbuka1FgofovUFb
 DSBCntFkb1fKUI8nNtEIbol2cFm7iZpDHMRd8mukfNy46d9fAq7j/x9Qk/p8DqdelB65iKFdJV3
 /LbLO0NtrMzPKzjT9yJcOxXyt/SxvkL0kivJrGmL9SCrhhrqQFw+cR/TIMZOvjXk0E+Ooo+mt9c
 ckMLmTqvhGiIzOYpE2Zenmy/gGqJBEQAPEEH+84DqyvTXQk0eumII2rMW5tN/pJhi5YnFUxZdwc
 /WnZh4wQYchiUGgTpTW1X1fR+iV+xFpDmegtXL17gbUPeiXe6f+FDqFqBwj1Bj9gPvmRV6hGd2L
 LyzlI/7YEWrJ4fq0DDeZ4hHMFatqDY/N/5wQGNHJ92EvQG+777k07XIZwI1iKLC2XOHwhrpxIys
 hOcdZskgRtrSxlw+e71U5Vhf6xgU06fVpemKInxW8/mkVnf/V5KQ==
X-Received: by 2002:a05:6a00:a90:b0:842:72af:b3b7 with SMTP id
 d2e1a72fcca58-847c512d33bmr7183829b3a.33.1783025004630; 
 Thu, 02 Jul 2026 13:43:24 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9e921cd139sm1678941a12.23.2026.07.02.13.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 13:43:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 10/15] target/arm: Implement SMOP4[AS] (4-way)
Date: Thu,  2 Jul 2026 13:43:09 -0700
Message-ID: <20260702204314.79224-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702204314.79224-1-richard.henderson@linaro.org>
References: <20260702204314.79224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 target/arm/tcg/helper-sme-defs.h |  4 ++++
 target/arm/tcg/sme_helper.c      | 19 +++++++++++++++++++
 target/arm/tcg/translate-sme.c   |  4 ++++
 target/arm/tcg/sme.decode        |  2 ++
 5 files changed, 34 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index bceaa10a0e..3bc96ea3ac 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1822,6 +1822,11 @@ static inline bool isar_feature_aa64_sme_mop4_f8f16(const ARMISARegisters *id)
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
index 20a2febd63..16f86a9d2d 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1118,3 +1118,5 @@ FMOP4A_sb       1000 0000 001. ...0 0000 00.. ..00 00..         @mop4_o2_s0
 FMOP4A_hb       1000 0000 001. ...0 0000 00.. ..00 100.         @mop4_o1_s0
 
 SMOP4_sh        1000 0000 000. ...0 1000 00.. ..0. 10..         @mop4_o2
+SMOP4_sb        1000 0000 000. ...0 1000 00.. ..0. 00..         @mop4_o2
+SMOP4_dh        1010 0000 110. ...0 0000 00.. ..0. 1...         @mop4_o3
-- 
2.43.0


