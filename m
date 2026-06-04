Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D54CD6E7D
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:50:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHo9-0006ey-9Y; Thu, 04 Jun 2026 19:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo6-0006c5-NE
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:03 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo2-0007rP-Mv
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:02 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2c0c32f6ce1so8941075ad.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616937; x=1781221737; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhmzNQ0hN+2JOR8CyUmXzaKMbo6oKKtlmxC+yvJIhD4=;
 b=TA/W6k9l7JWCVxWZzpw7trJBLh159BiWBQzTj5zXB5XwOBBYvvm7o4Ez5JPOE3XmqI
 PI3Ym64lVbkWEmJw74fRqjVP0EdQJ52obm/NWfNZL7ntvMiBvz5P02iiwdNJam+WMuOx
 bYid+1rO5DMZmm2W7R/K4J//gaEvp3rrpKEHV92i7RqYLK/YQGqUGya0ihnn12mtPUMj
 FWAb01mnHYsgmMD7W3pBsDCImgKdX5nT47HmhwaKnL28Lyacz8Oe47d9NJ6LTaLvqgoS
 uiRS0OmLWR5JRec4004TuDW6MllxdtV6cdcvZbQ6Ig3B1IQOLR2GN+eRk/YkogpDUQZA
 fDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616937; x=1781221737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qhmzNQ0hN+2JOR8CyUmXzaKMbo6oKKtlmxC+yvJIhD4=;
 b=n1aJNc5+wXz+b5mrMLwGqpBtv17Vt8Z1cYxK8Wf2Tocdo+FbYFr40/pnIFiMRtcSFc
 NaAC71r9ofe+VZO0PVLHqr40v1asDjPjByO84CabvxsEC6CkUPxcGojRQ5R2H3HmjweY
 ZT6AHRT/cLKA/sWIbwrrcLNIYYH3mLTaHEgj9zPFRa9Pn1jH71YjBY8mSNg0gLa4hpXF
 cDTA0cSATNYMHF4LXp1k12fgrgTFvqILcQ+Ms43/TNUMW1XPvPng02fmUnI5Qub8qkGx
 iIwFBACA05AFzHqo6GzGKFh6Ghz1nRz/lvFrNg0rgh1Q6P2Sdhkt5dhG0tYRW0af8Ivt
 Ad9A==
X-Gm-Message-State: AOJu0Yw1NFAhjXS5/IzEYrGInH89hbEGfHiPVpIrvACnrmwQImoVuVK6
 S2N9P6Ozr6ObrsLSHU97qd4k7XntsfKAUax+FxSBJaZBQ95eAY09KoBo8AM6P/b0CnrUQjmyYW/
 xuXBZdtg=
X-Gm-Gg: Acq92OGt9VG2SrsfvrnvbZ8oE8a1JuvQwCkUD/JyMyH806RvKNyK/mwnG/fk08/JLJW
 nwtkTP3WYkXu+16QV2dmWMrXsaqE9TH3ssV9emL0HyS5XVXUEkfK1pTs7TmfbtA99XR3TSuyxtM
 ziJyOMTVGFP15wPBgQmpgbNbS9N4hJ82ehPPpiXCDfhJpS6O2YYuh1m5DyfD/aPVZ5nl7YsuJU7
 wNamXNuZJUlwUxnSsg9cMd8DBsro0PRrSHgITvVqAVWtUgcjQHbMikTUKZWjSd59T+dWpRCcHax
 CuK489QBG5xkaabfPlovUgcW0NbmnhW+zzgYgdqT/BRsx/3vwnKkElNK1xsEaYtAVn5UMWLp33C
 F6sFUpOZOznDOsvfPt+YRtSUxZHEFjZpCeoEXot3ldKVZhJFLHNKupMxkFDcOHzDrp/EuFi2k8q
 VVqzGz1dsnsjxu/QIZDJKuQ7PL7JvGq5f73Xp50p5ijXcTESe4tQ==
X-Received: by 2002:a17:902:d4cd:b0:2b2:4260:109 with SMTP id
 d9443c01a7336-2c1e7f926d1mr6980885ad.23.1780616937037; 
 Thu, 04 Jun 2026 16:48:57 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:48:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/25] target/arm: Expand DO_ZPZ in translate-sve.c
Date: Thu,  4 Jun 2026 16:48:31 -0700
Message-ID: <20260604234852.573178-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
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

Prepare for adding zeroing instructions for some of these.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 84 +++++++++++++++++++++++++++-------
 1 file changed, 67 insertions(+), 17 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 8b4a06a060..ea37c073c7 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -776,24 +776,74 @@ TRANS_FEAT(SEL_zpzz, aa64_sme_or_sve, do_sel_z, a->rd, a->rn, a->rm, a->pg, a->e
  *** SVE Integer Arithmetic - Unary Predicated Group
  */
 
-#define DO_ZPZ(NAME, FEAT, name) \
-    static gen_helper_gvec_3 * const name##_fns[4] = {              \
-        gen_helper_##name##_b, gen_helper_##name##_h,               \
-        gen_helper_##name##_s, gen_helper_##name##_d,               \
-    };                                                              \
-    TRANS_FEAT(NAME, FEAT, gen_gvec_ool_arg_zpz, name##_fns[a->esz], a, 0)
+static gen_helper_gvec_3 * const sve_cls_fns[4] = {
+    gen_helper_sve_cls_b, gen_helper_sve_cls_h,
+    gen_helper_sve_cls_s, gen_helper_sve_cls_d,
+};
+TRANS_FEAT(CLS_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_cls_fns[a->esz], a, 0)
 
-DO_ZPZ(CLS_m, aa64_sme_or_sve, sve_cls)
-DO_ZPZ(CLZ_m, aa64_sme_or_sve, sve_clz)
-DO_ZPZ(CNT_zpz_m, aa64_sme_or_sve, sve_cnt_zpz)
-DO_ZPZ(CNOT_m, aa64_sme_or_sve, sve_cnot)
-DO_ZPZ(NOT_zpz_m, aa64_sme_or_sve, sve_not_zpz)
-DO_ZPZ(ABS_m, aa64_sme_or_sve, sve_abs)
-DO_ZPZ(NEG_m, aa64_sme_or_sve, sve_neg)
-DO_ZPZ(RBIT_m, aa64_sme_or_sve, sve_rbit)
-DO_ZPZ(ORQV, aa64_sme2p1_or_sve2p1, sve2p1_orqv)
-DO_ZPZ(EORQV, aa64_sme2p1_or_sve2p1, sve2p1_eorqv)
-DO_ZPZ(ANDQV, aa64_sme2p1_or_sve2p1, sve2p1_andqv)
+static gen_helper_gvec_3 * const sve_clz_fns[4] = {
+    gen_helper_sve_clz_b, gen_helper_sve_clz_h,
+    gen_helper_sve_clz_s, gen_helper_sve_clz_d,
+};
+TRANS_FEAT(CLZ_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_clz_fns[a->esz], a, 0)
+
+static gen_helper_gvec_3 * const sve_cnt_zpz_fns[4] = {
+    gen_helper_sve_cnt_zpz_b, gen_helper_sve_cnt_zpz_h,
+    gen_helper_sve_cnt_zpz_s, gen_helper_sve_cnt_zpz_d,
+};
+TRANS_FEAT(CNT_zpz_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_cnt_zpz_fns[a->esz], a, 0)
+
+static gen_helper_gvec_3 * const sve_cnot_fns[4] = {
+    gen_helper_sve_cnot_b, gen_helper_sve_cnot_h,
+    gen_helper_sve_cnot_s, gen_helper_sve_cnot_d,
+};
+TRANS_FEAT(CNOT_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_cnot_fns[a->esz], a, 0)
+
+static gen_helper_gvec_3 * const sve_not_zpz_fns[4] = {
+    gen_helper_sve_not_zpz_b, gen_helper_sve_not_zpz_h,
+    gen_helper_sve_not_zpz_s, gen_helper_sve_not_zpz_d,
+};
+TRANS_FEAT(NOT_zpz_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_not_zpz_fns[a->esz], a, 0)
+
+static gen_helper_gvec_3 * const sve_abs_fns[4] = {
+    gen_helper_sve_abs_b, gen_helper_sve_abs_h,
+    gen_helper_sve_abs_s, gen_helper_sve_abs_d,
+};
+TRANS_FEAT(ABS_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_abs_fns[a->esz], a, 0)
+
+static gen_helper_gvec_3 * const sve_neg_fns[4] = {
+    gen_helper_sve_neg_b, gen_helper_sve_neg_h,
+    gen_helper_sve_neg_s, gen_helper_sve_neg_d,
+};
+TRANS_FEAT(NEG_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_neg_fns[a->esz], a, 0)
+
+static gen_helper_gvec_3 * const sve_rbit_fns[4] = {
+    gen_helper_sve_rbit_b, gen_helper_sve_rbit_h,
+    gen_helper_sve_rbit_s, gen_helper_sve_rbit_d,
+};
+TRANS_FEAT(RBIT_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_rbit_fns[a->esz], a, 0)
+
+static gen_helper_gvec_3 * const sve2p1_orqv_fns[4] = {
+    gen_helper_sve2p1_orqv_b, gen_helper_sve2p1_orqv_h,
+    gen_helper_sve2p1_orqv_s, gen_helper_sve2p1_orqv_d,
+};
+TRANS_FEAT(ORQV, aa64_sme2p1_or_sve2p1, gen_gvec_ool_arg_zpz,
+           sve2p1_orqv_fns[a->esz], a, 0)
+
+static gen_helper_gvec_3 * const sve2p1_eorqv_fns[4] = {
+    gen_helper_sve2p1_eorqv_b, gen_helper_sve2p1_eorqv_h,
+    gen_helper_sve2p1_eorqv_s, gen_helper_sve2p1_eorqv_d,
+};
+TRANS_FEAT(EORQV, aa64_sme2p1_or_sve2p1, gen_gvec_ool_arg_zpz,
+           sve2p1_eorqv_fns[a->esz], a, 0)
+
+static gen_helper_gvec_3 * const sve2p1_andqv_fns[4] = {
+    gen_helper_sve2p1_andqv_b, gen_helper_sve2p1_andqv_h,
+    gen_helper_sve2p1_andqv_s, gen_helper_sve2p1_andqv_d,
+};
+TRANS_FEAT(ANDQV, aa64_sme2p1_or_sve2p1, gen_gvec_ool_arg_zpz,
+           sve2p1_andqv_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const fabs_fns[4] = {
     NULL,                  gen_helper_sve_fabs_h,
-- 
2.43.0


