Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7174BCD6E6E
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:52:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoC-0006k0-K7; Thu, 04 Jun 2026 19:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo8-0006dS-9p
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:04 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo4-0007s0-UP
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:03 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2c0c32f6ce1so8941195ad.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616939; x=1781221739; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GnRR2OwqXTkVX+yGNuI1CmmR5VQnfJrJeFCD/rxXTNs=;
 b=UMDvEZD5apd7w1//ITIqIP9PAG1/H9VYT+US+JAfz2Q4PF28enTC0MKl4g01H7cMoT
 +Dv9RjOr+XdO+cg8kccoEjDC+Pc8gpY79G2lJZHSVlJvFW9BJcqV4zdGS6va+b76PYfV
 Cp/qXKXVurXP92Pgkw40JDGRXvVMEX9w95O6X4/YGu8LExq6d4AW/Uk9Z2uUWT04tacJ
 UwCP5kV9Witkt0PFq6UWXlz8FZM/0QhIL+GMhDaG9KYafuHNzwEWuNNNKPIc3OgVqJgq
 2MPRfGLSZdNBN70ATfQ89W6WvoRZuby0m+ZIkWjQJlr7WYNMgWMtmuyPY3M3/gKPpCOi
 jFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616939; x=1781221739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GnRR2OwqXTkVX+yGNuI1CmmR5VQnfJrJeFCD/rxXTNs=;
 b=XvgHw8QMV985UEUBjThyyTHswUZICBew4a9vk2G3MOERjhoZ8y1BdN7s+/wnnOlr02
 V38P4fvOLj3hvQkGh6/HMJ5uj6rC+y8bKqWAr9pvRvy2uYQ+4D4WcA4gb3RUoms5WPFp
 UlMwmZ3KX+xK//kgN5bXd1dDbRkUI4zvvIsfCagfIm7WG3n84JUyPGA+FEDiOOMh0BNi
 ThI5l359WOHpbhb7A1V4gvKN+BymbVSTke8ELx50yl8iTm5pIozvqXTx3DJ3h9IPCTqB
 CLz94m3nJs97AiCg4upSO3BnvStVrwtnY7qK40u7QZdpiLI+bkp7tFA0U/qjWh7pWNMG
 vCWg==
X-Gm-Message-State: AOJu0Ywe+XBl1sTjdA30bEXJ7Jgug92rMbhg2rLlzQdnFlr9IlN6u13P
 RL0kJz2cYzch8UddHvRWmzPFHRgqzd/+zdhAxxM1gh+5IndD30Jd1VBfDz0XKkcMDY4=
X-Gm-Gg: Acq92OHoUpKfbVSDsCvQFuqTAxQOCvguagPKUWeO9GVEQKXB/yU8JCXuv3+5/RadVgI
 sqdNs/ib+enZAvrXDw5sdXZtVet9BXODJujVXxTSE3TnYbzQEI4Qqqo04T42LkfMpQPu8Z6HMMR
 vIcVHzEP/CllF2+oHWA2QelU5wFq90IS7s41PkC6/vhfsaKjjc5hNnZ2/sHmUKXZniE0afS/Qpy
 46RWjS3oDat1uyvJuMszhkSdk9JYyq7TeaC9BnYW8gM4nXfafhcFPPehB9D/i2p0JOxOI9TRn8o
 aU61VQISAdF3zQiXqpZAZqXyHXNNZqdlWddFs2zqG/gN1rge7FA3v4aoceNH0yu2FY+eU/mwYH2
 bbT5F01FikXKjO2AOA5fFtpYGguYALIbTBaVCEZZ9mp+HJyrmes8iRwPp67sjjoMI1m7D/hHGYH
 pgt8Lz7HYSVANzTOJbn7i8cgG5prq/R+DyvEAuWGg=
X-Received: by 2002:a17:903:2c08:b0:2c0:bb11:19c8 with SMTP id
 d9443c01a7336-2c1e820db02mr7091005ad.36.1780616938584; 
 Thu, 04 Jun 2026 16:48:58 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:48:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/25] target/arm: Implement SVE bitwise unary operations
 (predicated, zeroing)
Date: Thu,  4 Jun 2026 16:48:33 -0700
Message-ID: <20260604234852.573178-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

This includes CLS, CLZ, CNT, CNOT, NOT, FABS, FNEG.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 21 ++++++++++++++++++---
 target/arm/tcg/sve.decode      |  8 ++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index e090a0383d..2e138f9ac0 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -781,30 +781,41 @@ static gen_helper_gvec_3 * const sve_cls_fns[4] = {
     gen_helper_sve_cls_s, gen_helper_sve_cls_d,
 };
 TRANS_FEAT(CLS_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_cls_fns[a->esz], a, 0)
+TRANS_FEAT(CLS_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sve_cls_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sve_clz_fns[4] = {
     gen_helper_sve_clz_b, gen_helper_sve_clz_h,
     gen_helper_sve_clz_s, gen_helper_sve_clz_d,
 };
 TRANS_FEAT(CLZ_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_clz_fns[a->esz], a, 0)
+TRANS_FEAT(CLZ_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz, sve_clz_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sve_cnt_zpz_fns[4] = {
     gen_helper_sve_cnt_zpz_b, gen_helper_sve_cnt_zpz_h,
     gen_helper_sve_cnt_zpz_s, gen_helper_sve_cnt_zpz_d,
 };
-TRANS_FEAT(CNT_zpz_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_cnt_zpz_fns[a->esz], a, 0)
+TRANS_FEAT(CNT_zpz_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
+           sve_cnt_zpz_fns[a->esz], a, 0)
+TRANS_FEAT(CNT_zpz_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           sve_cnt_zpz_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sve_cnot_fns[4] = {
     gen_helper_sve_cnot_b, gen_helper_sve_cnot_h,
     gen_helper_sve_cnot_s, gen_helper_sve_cnot_d,
 };
-TRANS_FEAT(CNOT_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_cnot_fns[a->esz], a, 0)
+TRANS_FEAT(CNOT_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
+           sve_cnot_fns[a->esz], a, 0)
+TRANS_FEAT(CNOT_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           sve_cnot_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sve_not_zpz_fns[4] = {
     gen_helper_sve_not_zpz_b, gen_helper_sve_not_zpz_h,
     gen_helper_sve_not_zpz_s, gen_helper_sve_not_zpz_d,
 };
-TRANS_FEAT(NOT_zpz_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz, sve_not_zpz_fns[a->esz], a, 0)
+TRANS_FEAT(NOT_zpz_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
+           sve_not_zpz_fns[a->esz], a, 0)
+TRANS_FEAT(NOT_zpz_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           sve_not_zpz_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sve_abs_fns[4] = {
     gen_helper_sve_abs_b, gen_helper_sve_abs_h,
@@ -857,6 +868,8 @@ static gen_helper_gvec_3 * const fabs_ah_fns[4] = {
 };
 TRANS_FEAT(FABS_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            s->fpcr_ah ? fabs_ah_fns[a->esz] : fabs_fns[a->esz], a, 0)
+TRANS_FEAT(FABS_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           s->fpcr_ah ? fabs_ah_fns[a->esz] : fabs_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const fneg_fns[4] = {
     NULL,                  gen_helper_sve_fneg_h,
@@ -868,6 +881,8 @@ static gen_helper_gvec_3 * const fneg_ah_fns[4] = {
 };
 TRANS_FEAT(FNEG_m, aa64_sme_or_sve, gen_gvec_ool_arg_zpz,
            s->fpcr_ah ? fneg_ah_fns[a->esz] : fneg_fns[a->esz], a, 0)
+TRANS_FEAT(FNEG_z, aa64_sme2p2_or_sve2p2, gen_gvec_ool_arg_zpz,
+           s->fpcr_ah ? fneg_ah_fns[a->esz] : fneg_fns[a->esz], a, 1)
 
 static gen_helper_gvec_3 * const sxtb_fns[4] = {
     NULL,                  gen_helper_sve_sxtb_h,
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 31b65fab1b..e79b5e84c1 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -400,6 +400,14 @@ NOT_zpz_m       00000100 .. 011 110 101 ... ..... .....         @rd_pg_rn
 FABS_m          00000100 .. 011 100 101 ... ..... .....         @rd_pg_rn
 FNEG_m          00000100 .. 011 101 101 ... ..... .....         @rd_pg_rn
 
+CLS_z           00000100 .. 001 000 101 ... ..... .....         @rd_pg_rn
+CLZ_z           00000100 .. 001 001 101 ... ..... .....         @rd_pg_rn
+CNT_zpz_z       00000100 .. 001 010 101 ... ..... .....         @rd_pg_rn
+CNOT_z          00000100 .. 001 011 101 ... ..... .....         @rd_pg_rn
+NOT_zpz_z       00000100 .. 001 110 101 ... ..... .....         @rd_pg_rn
+FABS_z          00000100 .. 001 100 101 ... ..... .....         @rd_pg_rn
+FNEG_z          00000100 .. 001 101 101 ... ..... .....         @rd_pg_rn
+
 # SVE integer unary operations (predicated)
 # Note esz > original size for extensions.
 ABS_m           00000100 .. 010 110 101 ... ..... .....         @rd_pg_rn
-- 
2.43.0


