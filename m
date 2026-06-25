Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACB5CDE00C
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 22:37:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcsfd-00052K-IS; Thu, 25 Jun 2026 18:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsf1-0004ar-Tr
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:35:10 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsev-0002KQ-NH
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:35:02 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-845369f60faso149343b3a.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 15:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782426728; x=1783031528; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ukzXmTkH/UG6MtnXHMAWLuPgUKOI9johr32VpU9wJfY=;
 b=zCsbUbbrW7hXf5Lu8ksupJNOwulNgbRN5hroB7XxJBljU9Htytw+8pIuBmvoB2Tz1h
 izdplmNnKVcWfrTEuJAKKfZFgKIJ2UFOhQ+jtNMvgEkqzFlc0yDBmYGkGf2i13Xf9Uic
 RbkxV3hNXvVxPmxxDl2OBgj1oQjddZ1De8kel5Eo1D+aBAbd3FPeqPVA0jpcgTktKvau
 vHvHdVkJ9gKwfZXcCSP600/sdAza9X7Me3UOVbftP9JhS9XH4stfYlW1Kc2JtMmPtDLt
 9Kvs6s64bopQqXwuG/A9iKZBx9DuDVeerN/+bhXtvuW8psKMW8R1HeKpNjULT+MsnkOq
 6hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782426728; x=1783031528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ukzXmTkH/UG6MtnXHMAWLuPgUKOI9johr32VpU9wJfY=;
 b=OPWhBk5rPWS82w2cz+wPiSboYuf+ydMKynlM7mx2V97sKK38lx3icXWApx2CG+H4yl
 ckWZ0hyEbCYNXQg2fHX63DI3FERrZfSe5y46ZQ6I/WKdMHslTaPwJmh5S7ZpBNnv+YOU
 X5aa+G1S/FgfttnC6czHNh5REBNfcSeB8yQ4eH82SSeixXhJIbcADVWSgm09ywqRUFqt
 12xiOHYo7VsaMD0jEvRlEQ4x5yLQn4mP8nO1XYmzr03dz9jGu/PlQmyoHB3izZQAiLA3
 CBbIV2jeM48xYFRmF0XiaOaoRYjgzk0V/5HRHxOpX89kjTsiIBSzPL1vXHCVOE5gMjjO
 fpFA==
X-Gm-Message-State: AOJu0YyKOBo7XSxL1BWri1nEyFFlhYbuhtqP6KwAGFTVyFHtL8oEQ9bA
 mPLd3sA2kU1eiSwH0bnJGivM/0UZVjxiky24kS+0E3zwNfseHkbmSASheHsIhAthNXNYqFcyLy5
 8ONIo
X-Gm-Gg: AfdE7cn09jHGufYoEfwKwkW/51dd+2WOb6tY7lcbKVMeDebDHBPtoYfkHKcBv7caCrB
 4nx7RRKNGTvRtmpNoSkbnVp/vPlyBQ9TtWTt9FX+V2L3nLxaLsSFU4QDMIzeZbovW7zqrnPejEC
 GmhSxxyxnV5TMD3YVdpU35IcUsY9UuXx+v2T7PPwh6J8XW9jGtrKwUiMDyt3XVregJCAJ31mSPd
 hh2w8FgFUc+UKTnZ5k4ALBv3MylOg51LQEe1DXxL2G4ZrpYWPEqrd7O2HbGessdIZzWFeWMH4qb
 abnCC6dkWgK92emeu35rDtEFQn1uENT5wpXc7G7HYB9lbO3GQ6QGJuBWm2ZaZHKmeBK4SFGQRaN
 w9DtIxOgiUVbM0lkuPyF16Y4Poyh9OmR5YaZnoonnNgayVj+SIaoZPLmd7eMXY/cav7Q96Yy194
 izPaqzz7sP9uOOjovjtBdc7og0JqUebwpxNmHycYa0lTMNwTvvnw==
X-Received: by 2002:a05:6a00:4088:b0:845:2f67:a0e6 with SMTP id
 d2e1a72fcca58-845b3c17addmr5224854b3a.46.1782426728172; 
 Thu, 25 Jun 2026 15:32:08 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a412e5e9sm5450139b3a.54.2026.06.25.15.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 15:32:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/15] target/arm: Implement SMOP4[AS] (2-way)
Date: Thu, 25 Jun 2026 15:31:54 -0700
Message-ID: <20260625223200.763198-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625223200.763198-1-richard.henderson@linaro.org>
References: <20260625223200.763198-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
 target/arm/tcg/helper-sme-defs.h |  3 +++
 target/arm/tcg/sme_helper.c      | 16 ++++++++++++++++
 target/arm/tcg/translate-sme.c   | 18 ++++++++++++++++++
 target/arm/tcg/sme.decode        |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 780b8f162a..ddf771e446 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -379,3 +379,6 @@ DEF_HELPER_FLAGS_5(sme_ah_bfmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env,
 DEF_HELPER_FLAGS_5(sme_fmop4a_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(sme_fmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(sme_ah_fmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme_smop4a_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_smop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 123f459342..32fe867a3b 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2938,3 +2938,19 @@ void HELPER(sme_ah_fmop4s_sh)(void *vza, void *vzn, void *vzm,
 {
     sme_mop4(vza, vzn, vzm, env, desc, sizeof(float32), inner_ah_fmop4s_sh);
 }
+
+#define IMOP4_2WAY(NAME, OP, TYPED, TYPEN, TYPEM)                       \
+static void inner_##NAME(void *vd, void *vn, void *vm, void *vinfo)     \
+{                                                                       \
+    TYPEN *n = vn; TYPEM *m = vm; TYPED *d = vd;                        \
+    *d OP##= (TYPED)n[0] * m[0] + (TYPED)n[1] * m[1];                   \
+}                                                                       \
+void HELPER(sme_##NAME)(void *vza, void *vzn, void *vzm, uint32_t desc) \
+{                                                                       \
+    sme_mop4(vza, vzn, vzm, NULL, desc, sizeof(TYPED), inner_##NAME);   \
+}
+
+IMOP4_2WAY(smop4a_sh, +, int32_t, int16_t, int16_t)
+IMOP4_2WAY(smop4s_sh, -, int32_t, int16_t, int16_t)
+
+#undef IMOP4_2WAY
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index b198c7c855..b948591dd3 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2092,3 +2092,21 @@ TRANS_FEAT(FMOP4A_sb, aa64_sme_mop4_f8f32,
            do_mop4_fp8, a, MO_32, gen_helper_sme_fmop4a_sb)
 TRANS_FEAT(FMOP4A_hb, aa64_sme_mop4_f8f16,
            do_mop4_fp8, a, MO_16, gen_helper_sme_fmop4a_hb)
+
+static bool do_mop4_int(DisasContext *s, arg_mop4 *a, MemOp esz,
+                        gen_helper_gvec_3 *fn)
+{
+    if (sme_smza_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        uint32_t desc = simd_desc(svl, svl, (a->m << 1) | a->n);
+        TCGv_ptr za = get_tile(s, esz, a->zad);
+        TCGv_ptr zn = vec_full_reg_ptr(s, a->zn);
+        TCGv_ptr zm = vec_full_reg_ptr(s, a->zm);
+
+        fn(za, zn, zm, tcg_constant_i32(desc));
+    }
+    return true;
+}
+
+TRANS_FEAT(SMOP4_sh, aa64_sme_mop4, do_mop4_int, a, MO_32,
+           a->s ? gen_helper_sme_smop4s_sh : gen_helper_sme_smop4a_sh)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 43b6c32c04..a872fbb4c7 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1116,3 +1116,5 @@ FMOP4_sh        1000 0001 001. ...0 0000 00.. ..0. 00..         @mop4_o2
 
 FMOP4A_sb       1000 0000 011. ...0 0000 00.. ..00 00..         @mop4_o2_s0
 FMOP4A_hb       1000 0000 001. ...0 0000 00.. ..00 100.         @mop4_o1_s0
+
+SMOP4_sh        1000 0000 000. ...0 1000 00.. ..0. 10..         @mop4_o2
-- 
2.43.0


