Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C222CD6E75
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:52:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoA-0006h6-4C; Thu, 04 Jun 2026 19:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo7-0006cd-Kk
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:03 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo4-0007rj-TB
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:02 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2bf3781ca51so13838095ad.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616938; x=1781221738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9uZQxyhgyiLou14mlgeDj5cB6BxBZLZaIk+PvH3KSC8=;
 b=TiVmVKPt5EXtcTymNSBY3EGxi0Lt5feSjtaRoVIhc5vyJNuMnLBPOJ2xRIXyoGzld6
 xeJ9iM+YzHsXbzmpeznGackdrH0f3QLoC16uNK4yPGqn4Sewkqry+rzThgpZ2FYD9SIE
 6XYSLB6nsQ0WsR2C7yLE+XhFn/q1IBgAQ25JiS5fJRMjLiTxzLApD+NvgBeKtK0Dbjte
 mdzNqpgTX8GXMjaVxFG/H+FRTOaFgpVqRR0Z9vRSCm63cb7IRCQB9T70a0S/YBemjy1U
 o84LfIrEH7/SgK3fQJkepY9lwhGmeeEO0opqeSFqF21JniiIwOsCs4FqfB++oRkW/FAS
 WEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616938; x=1781221738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9uZQxyhgyiLou14mlgeDj5cB6BxBZLZaIk+PvH3KSC8=;
 b=pO92FinU7YuGD2/Je8MGU1P6S4fDo+zY7rHQOOtqOv4awChsntkSHjjxbzfq7OEvcQ
 LPkzOFYnhfhcC0IO6omqpKDhnaw5kPKjSBqVXralM9XrYdr2nE6+vPmKhP/J+5DRePVw
 nDEuqwI5LgolY2toqXF+fuVSRGKInyIuxtb78e2ooVIhI8nKxzFrNo9DAeZ/xaDdsi0A
 Z3ytWN6WjdWfZQ3B/sSOIvpIlpJKytQfvy9XmUt1VOerR5vN9Qm18yVwbs/BNr/X2R0B
 FKPeAqLwfxZTVHSNCMGM/2JHPRrmaXaJg0PMUrej34t1Yh48/DjNIuYH0EOokeB6jBo+
 uTGA==
X-Gm-Message-State: AOJu0YwSvfzh3+bYrdNOLKnqEvVNJP9/A7ZkKPnFF1JEOnao8jFXQKTb
 kJknx6rPDqXLfWvkrKaoqHSCoppHrzEhtn9CO8pszMS+/XQ99SzE+W1jWz0h3/dBeyZ3WAKnqPc
 p0RFyBks=
X-Gm-Gg: Acq92OExrSO3oZSSS2NlY6v36v0Sdghjd5k2iaxiCsrRaJfH0WMch859V7BmvemoOvO
 R7HRSvleXO/rC6NfFFrsRnPXh4IGuL8x4l+Mvt9adTDUtnCHzFwIalIDDMydyCuxPsQXvipvuOL
 17Bfo7fK9Z1D6Tnc1UCKzgBdlKgy3Fw51ihqV8fIyqICin3Mzfcll/JbLbuIReBoA3wD8FFdS48
 9+2Vwfr/I6mP/SRFphRy/FH1v6QU6+fApUflDbL2j0VjVHxaX1vAJXSopa/ADU3jX4fS2128ePn
 o800dqCVKUV6hWYuJe4OE6igCmvmi75liEC+uCNnR/0PjPk1hLuJ9QIIlFN5om+rTg9AyDnOkfz
 M6qa5mr2QAoAf+Zc0i2CK3QC0FgHMV8Piof0bUCIWydvuKGQ8VMuemUR0CpFwj8xhDboRbz1x45
 w7YjyzMi4tKnmenJJ8h0lAJsJHQCJ+vjBeoI5R6vy+MSAG9jmBSA==
X-Received: by 2002:a17:902:d4c6:b0:2bf:160f:7043 with SMTP id
 d9443c01a7336-2c1e834a531mr7251435ad.34.1780616937997; 
 Thu, 04 Jun 2026 16:48:57 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:48:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/25] target/arm: Implement SVE integer unary operations
 (predicated, zeroing)
Date: Thu,  4 Jun 2026 16:48:32 -0700
Message-ID: <20260604234852.573178-6-richard.henderson@linaro.org>
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

This includes ABS, NEG, SXT{B,H,W}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 15 +++++++++++++++
 target/arm/tcg/sve.decode      |  9 +++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index ea37c073c7..e090a0383d 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -811,12 +811,14 @@ static gen_helper_gvec_3 * const sve_abs_fns[4] = {
     gen_helper_sve_abs_s, gen_helper_sve_abs_d,
 };
 TRANS_FEAT(ABS_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_abs_fns[a->esz], a, 0)
+TRANS_FEAT(ABS_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sve_abs_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sve_neg_fns[4] = {
     gen_helper_sve_neg_b, gen_helper_sve_neg_h,
     gen_helper_sve_neg_s, gen_helper_sve_neg_d,
 };
 TRANS_FEAT(NEG_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_neg_fns[a->esz], a, 0)
+TRANS_FEAT(NEG_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sve_neg_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sve_rbit_fns[4] = {
     gen_helper_sve_rbit_b, gen_helper_sve_rbit_h,
@@ -873,6 +875,8 @@ static gen_helper_gvec_3 * const sxtb_fns[4] = {
 };
 TRANS_FEAT(SXTB_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            sxtb_fns[a->esz], a, 0)
+TRANS_FEAT(SXTB_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           sxtb_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const uxtb_fns[4] = {
     NULL,                  gen_helper_sve_uxtb_h,
@@ -880,23 +884,34 @@ static gen_helper_gvec_3 * const uxtb_fns[4] = {
 };
 TRANS_FEAT(UXTB_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            uxtb_fns[a->esz], a, 0)
+TRANS_FEAT(UXTB_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           uxtb_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sxth_fns[4] = {
     NULL, NULL, gen_helper_sve_sxth_s, gen_helper_sve_sxth_d
 };
 TRANS_FEAT(SXTH_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            sxth_fns[a->esz], a, 0)
+TRANS_FEAT(SXTH_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           sxth_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const uxth_fns[4] = {
     NULL, NULL, gen_helper_sve_uxth_s, gen_helper_sve_uxth_d
 };
 TRANS_FEAT(UXTH_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            uxth_fns[a->esz], a, 0)
+TRANS_FEAT(UXTH_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           uxth_fns[a->esz], a, 1)
 
 TRANS_FEAT(SXTW_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_sxtw_d : NULL, a, 0)
+TRANS_FEAT(SXTW_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           a->esz == 3 ? gen_helper_sve_sxtw_d : NULL, a, 1)
+
 TRANS_FEAT(UXTW_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_uxtw_d : NULL, a, 0)
+TRANS_FEAT(UXTW_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           a->esz == 3 ? gen_helper_sve_uxtw_d : NULL, a, 1)
 
 static gen_helper_gvec_3 * const addqv_fns[4] = {
     gen_helper_sve2p1_addqv_b, gen_helper_sve2p1_addqv_h,
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index c7e633ec4f..31b65fab1b 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -411,6 +411,15 @@ UXTH_m          00000100 .. 010 011 101 ... ..... .....         @rd_pg_rn
 SXTW_m          00000100 .. 010 100 101 ... ..... .....         @rd_pg_rn
 UXTW_m          00000100 .. 010 101 101 ... ..... .....         @rd_pg_rn
 
+ABS_z           00000100 .. 000 110 101 ... ..... .....         @rd_pg_rn
+NEG_z           00000100 .. 000 111 101 ... ..... .....         @rd_pg_rn
+SXTB_z          00000100 .. 000 000 101 ... ..... .....         @rd_pg_rn
+UXTB_z          00000100 .. 000 001 101 ... ..... .....         @rd_pg_rn
+SXTH_z          00000100 .. 000 010 101 ... ..... .....         @rd_pg_rn
+UXTH_z          00000100 .. 000 011 101 ... ..... .....         @rd_pg_rn
+SXTW_z          00000100 .. 000 100 101 ... ..... .....         @rd_pg_rn
+UXTW_z          00000100 .. 000 101 101 ... ..... .....         @rd_pg_rn
+
 ### SVE Floating Point Compare - Vectors Group
 
 # SVE floating-point compare vectors
-- 
2.43.0


