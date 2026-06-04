Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DF1CD6E7B
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:52:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoJ-0006tH-5G; Thu, 04 Jun 2026 19:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoF-0006oF-Gn
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoC-0007xM-O3
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:11 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2bf1f074a12so13208875ad.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616947; x=1781221747; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+w/sKT5/KeL0RQ3Jm1sYzGDykuGbRQbxTFr+VTCZiM=;
 b=NxIDXPNriCpDjKtvlrzCIdzCggzo3ZBFpmrDFgpqkXYWgg5EBpJYSfrc7Jey4XZs8i
 FfWgkeW2Xs7PxoREK0mAgXRgUnFe3B6dS0KZLVUrVsq7IaBTroyZguyCvooQd+7fPWoa
 MEKeH41P0lvFaU26aHMhYi65QpxMJMpvCzf9zTl+w8YI4X45unmSMSMzOWLNH3WpVSml
 CZ4UnNSSlEgNlPDnT9fZ627FBrvfxjtIg4NbrnAjJeWAhNWvFFsvsZnn2ijlv84C1UZO
 eWBy6mwIxETRktnvzJouTKG13WRQHcPZO2FJeA2xa0mfvHZGeu+jt+lYF7miiNIg94vm
 UCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616947; x=1781221747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6+w/sKT5/KeL0RQ3Jm1sYzGDykuGbRQbxTFr+VTCZiM=;
 b=rvKhD31EyxQNZqzC+l55mZfLIeF3Q6b401T8M9gZQOpCkzcDBgMatrVigUSi9Zrlt/
 6Rmcb1WxzIOn87sSqMbP/MMZy0LqZozDqzLM+a+WLwNZeAw7FjAPREIZdJ6/Cd58N0XB
 Gt7yZ7zEIlJmIScmHNU9TdSPT4Pu+HDpBJmkyKpPCCwdyCWPTFl2xldfPZIGdlzBgaV/
 Aq2MAXE6AqC5WFkKbXsAPs7PJFqrHfR4pcwtlEh8HbF2t5pIrLl+i8TcebJn7Lz79ddL
 jlL9CPgCsJXRgQwDRVNplq8LQnKb6WtsriBY7ah63EzznRxrLri5QNU1kL0qTcg7eWCQ
 oj5g==
X-Gm-Message-State: AOJu0Yx+nlyvnjDl6ApfWPzUIvnwSUZ5vxhZ/keSP3HR2uBv1tufFnz4
 WzCRiU+75wZyg5KVs9NaRmQcG43lxwBuS//jrPwtC8B/WPktRQlHzm/FuYeD02CzIU2baY2DA/Z
 89hS+2q0=
X-Gm-Gg: Acq92OFPyEL/NJ/Zh/iu8hsweVS26vVK93D8GJhfGTTB751B7h+3p4sskmzvOrej64T
 TcmjrqYB5M/MpWpd2MiNrt2U2SdF/5obYJZAZVHH0hOdFCaV2nvieFvEhk+tV5ASt83MJMSkhVc
 UqwuLdlxV0uNi3PLzYbwdhVNXRpZGnG+zX3CusIgyt+lXAegAUMeqQyH28rzfca9CqCgzpMApsl
 m2CMBuAvU/+yiyehVeIcfb4NjOu7s8cBEYabP8nY7Af0HEgEWx6iz5RCRu8PeBXG4+V0XS4sa+W
 FbPGwliq8bd9UExmafLCe6ueAkZ50M+L97SB3XeriB8bQL0VCUrSrJ9h3Qd0cuBkrRoCmotujKH
 UJHw4rgPcE+xpZakan7DQBcWg6INa0QMw5oqsO/QYrs/1nEoAkRZwaGd/nh/lFWYC2Aa027nk3k
 bsM0nrpQEXuogD/r/Iot7ijpyovu0WhtrjvUIQ0u1oiyDdyGDXDw==
X-Received: by 2002:a17:903:90f:b0:2c1:1a22:7c43 with SMTP id
 d9443c01a7336-2c1e8495360mr7219615ad.24.1780616947081; 
 Thu, 04 Jun 2026 16:49:07 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:49:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 18/25] target/arm: Implement floating-point log and convert to
 integer (zeroing)
Date: Thu,  4 Jun 2026 16:48:45 -0700
Message-ID: <20260604234852.573178-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

This is FLOGB, FCVTZS, FCVTZU.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 37 ++++++++++++++++++++++++++++++++--
 target/arm/tcg/sve.decode      | 16 +++++++++++++++
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 841f625c25..315ebe82f9 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4654,6 +4654,37 @@ TRANS_FEAT(FCVTZS_dd_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
 TRANS_FEAT(FCVTZU_dd_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvtzu_dd, a, 0, FPST_A64)
 
+TRANS_FEAT(FCVTZS_hh_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_hh, a, 1, FPST_A64_F16)
+TRANS_FEAT(FCVTZU_hh_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_hh, a, 1, FPST_A64_F16)
+TRANS_FEAT(FCVTZS_hs_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_hs, a, 1, FPST_A64_F16)
+TRANS_FEAT(FCVTZU_hs_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_hs, a, 1, FPST_A64_F16)
+TRANS_FEAT(FCVTZS_hd_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_hd, a, 1, FPST_A64_F16)
+TRANS_FEAT(FCVTZU_hd_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_hd, a, 1, FPST_A64_F16)
+
+TRANS_FEAT(FCVTZS_ss_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_ss, a, 1, FPST_A64)
+TRANS_FEAT(FCVTZU_ss_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_ss, a, 1, FPST_A64)
+TRANS_FEAT(FCVTZS_sd_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_sd, a, 1, FPST_A64)
+TRANS_FEAT(FCVTZU_sd_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_sd, a, 1, FPST_A64)
+TRANS_FEAT(FCVTZS_ds_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_ds, a, 1, FPST_A64)
+TRANS_FEAT(FCVTZU_ds_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_ds, a, 1, FPST_A64)
+
+TRANS_FEAT(FCVTZS_dd_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_dd, a, 1, FPST_A64)
+TRANS_FEAT(FCVTZU_dd_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_dd, a, 1, FPST_A64)
+
 static gen_helper_gvec_3_ptr * const frint_fns[] = {
     NULL,
     gen_helper_sve_frint_h,
@@ -8134,8 +8165,10 @@ static gen_helper_gvec_3_ptr * const flogb_fns[] = {
     NULL,               gen_helper_flogb_h,
     gen_helper_flogb_s, gen_helper_flogb_d
 };
-TRANS_FEAT(FLOGB_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz, flogb_fns[a->esz],
-           a, 0, a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
+TRANS_FEAT(FLOGB_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
+           flogb_fns[a->esz], a, 0, a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
+TRANS_FEAT(FLOGB_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           flogb_fns[a->esz], a, 1, a->esz == MO_16 ? FPST_A64_F16 : FPST_A64)
 
 static bool do_FMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sub, bool sel)
 {
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 673cbaae57..2795c2ec7f 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1242,6 +1242,21 @@ FCVTZU_sd_m     01100101 11 011 10 1 101 ... ..... .....        @rd_pg_rn_e0
 FCVTZS_dd_m     01100101 11 011 11 0 101 ... ..... .....        @rd_pg_rn_e0
 FCVTZU_dd_m     01100101 11 011 11 1 101 ... ..... .....        @rd_pg_rn_e0
 
+FCVTZS_hh_z     01100100 01 011 11 0 110 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_hh_z     01100100 01 011 11 0 111 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_hs_z     01100100 01 011 11 1 100 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_hs_z     01100100 01 011 11 1 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_hd_z     01100100 01 011 11 1 110 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_hd_z     01100100 01 011 11 1 111 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_ss_z     01100100 10 011 11 1 100 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_ss_z     01100100 10 011 11 1 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_sd_z     01100100 11 011 11 1 100 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_sd_z     01100100 11 011 11 1 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_ds_z     01100100 11 011 11 0 100 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_ds_z     01100100 11 011 11 0 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_dd_z     01100100 11 011 11 1 110 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_dd_z     01100100 11 011 11 1 111 ... ..... .....        @rd_pg_rn_e0
+
 # SVE floating-point round to integral value
 FRINTN_m        01100101 .. 000 000 101 ... ..... .....         @rd_pg_rn
 FRINTP_m        01100101 .. 000 001 101 ... ..... .....         @rd_pg_rn
@@ -1950,6 +1965,7 @@ FCVTLT_sd_z     01100100 11 0000 11 101 ... ..... .....  @rd_pg_rn_e0
 
 ### SVE2 floating-point convert to integer
 FLOGB_m         01100101 00 011 esz:2 0101 pg:3 rn:5 rd:5  &rpr_esz
+FLOGB_z         01100100 00 011 1101 esz:2 pg:3 rn:5 rd:5  &rpr_esz
 
 ### SVE2 floating-point multiply-add long (vectors)
 FMLALB_zzzw     01100100 10 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
-- 
2.43.0


