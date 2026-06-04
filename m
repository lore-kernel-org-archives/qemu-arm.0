Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C72CD6E75
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:49:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoG-0006pe-Ps; Thu, 04 Jun 2026 19:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoE-0006mZ-KC
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:10 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoB-0007wu-TU
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:10 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2c0aa420401so9825565ad.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616946; x=1781221746; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwe1BKhTDm6Lb2c1Tvgh4n00uncLiVqYDlZzQyMqaaU=;
 b=CxHfxiG489zFpB7IAxQ6QyJBm8+0NAqrsIc4RczyxNYvBdoU4dQfzZ1qI9SAobw/lF
 Qt/CE1J5Z8cXJDk6TWZ0/AKJ8ZIrl5DROJS3FSmEf752KFHIGOxQAsOpFDsU15Gv/bUZ
 KR4JTe2NfwfU/l2EmV0Z0LelEOAGayVJYPwgjx4cpwHz4GkV0/smy6BciOda5PqltWg8
 cTRlB8P2xSqzeAFbq2+dRq0Gj/fM33MNMS2trfZb0e8T3nCg6F2WeBIJykZQRZaVMprz
 SGZjN9XDYinlfs7rslhIVNr2Q+K7wyfDxB82LYamvB/NWi9nG68U21AG/P2P3W8Z5k82
 vusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616946; x=1781221746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vwe1BKhTDm6Lb2c1Tvgh4n00uncLiVqYDlZzQyMqaaU=;
 b=X731HQ/cDZ/6xxbiZtCDKMrP0XDrH1IriWuwhCq/k3qUtCwRcvpbTnhDOOaHxxWJ4Z
 owS5Op2T66aP82LSglkPH55+wcTHGs3myOcsTjWSJ30bS2RlMGh2+GK4Kad7gYaPRmLW
 rHNmRMz6k3fEkG95L9EgVX8GP/+Bw37LNOyUILzxRi2sgi0SqxBMQf1+7bpRlWnGQMRv
 Jyok/nVc/+81joMHkmWmFUgVjW3YQNABiK6urHTt/rwoXab0dwP/2MZKqEpDahG+JCLy
 bM51VEhrMrGAe8OIR/XwWrY/EHJye7G0IIRLgOb7vDTDUWQDOTO2ZWZLtl4lG4ayc157
 ++XA==
X-Gm-Message-State: AOJu0YyXGs5jKe5KDmBDrjBlNZWd2CjxxWK3J/kb2tG1h1nDTA1k7uGg
 54FbYPG8KyUTayzlvp0um4KpBq21QBDSnz5oS99xPJgJUkt9zN5Imm6cAGj+TgqfyyE=
X-Gm-Gg: Acq92OEU51myWsu02VYt35RAa4AADLGyEmTT6WRIwthMIDFxyxMPA16V1Xuf9AUT6yw
 UiK1C5z5OGL7i0SGjQ5RWCkFkHIuKtCK4r/OypJ4DfUXV7vFnSkM4oYHmOSoGQN0y15GYiOwpgD
 G6Zf16lFG0yQDHQ2fM6OUPWD6yx4bqYWYsUjzgODhx6lEpiB5Zoz96uj5Mf22ep+MtWvvrkt7Gz
 be8f+fe72TXgPEWD/yZtvx3u1pfm5hXyDhX3NFynczyq1vuJUvoNyXaeGiQsUhODfS4nVqdbJ+B
 0uWHD2yb9s/9N8zqmrZXn1xW9d3qDtrhIzCBv3OLugfXHnvznIQ9hmwDZHgWtBFFPUpFWylCoSE
 U/OZ84BnDWWjjWRGffXKhfGRhdiGmRif5iLpABxm/U0WrCi5cg8GZVjBBwOxML1Yu3G+MYc2JyJ
 p4Dc4ca98QLMFETwepZj4xssNHzP2tKz6PM+6jYDU=
X-Received: by 2002:a17:903:240f:b0:2bc:db35:96c7 with SMTP id
 d9443c01a7336-2c1e822121cmr6643185ad.28.1780616946463; 
 Thu, 04 Jun 2026 16:49:06 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:49:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 17/25] target/arm: Implement SVE floating-point convert (top,
 predicated, zeroing)
Date: Thu,  4 Jun 2026 16:48:44 -0700
Message-ID: <20260604234852.573178-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

This includes FCVTXNT, BFCVTNT, FCVTNT, FCVTLT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 13 +++++++++++++
 target/arm/tcg/sve.decode      |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 842ef96221..841f625c25 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8097,17 +8097,28 @@ static bool trans_RAX1(DisasContext *s, arg_RAX1 *a)
 
 TRANS_FEAT(FCVTNT_sh_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_A64)
+TRANS_FEAT(FCVTNT_sh_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtnt_sh, a, 1, FPST_A64)
 TRANS_FEAT(FCVTNT_ds_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_ds, a, 0, FPST_A64)
+TRANS_FEAT(FCVTNT_ds_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtnt_ds, a, 1, FPST_A64)
 
 TRANS_FEAT(BFCVTNT_m, aa64_sme_sve_bf16, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_bfcvtnt, a, 0,
            s->fpcr_ah ? FPST_AH : FPST_A64)
+TRANS_FEAT(BFCVTNT_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_bfcvtnt, a, 1,
+           s->fpcr_ah ? FPST_AH : FPST_A64)
 
 TRANS_FEAT(FCVTLT_hs_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_hs, a, 0, FPST_A64_F16)
+TRANS_FEAT(FCVTLT_hs_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtlt_hs, a, 1, FPST_A64_F16)
 TRANS_FEAT(FCVTLT_sd_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_sd, a, 0, FPST_A64)
+TRANS_FEAT(FCVTLT_sd_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtlt_sd, a, 1, FPST_A64)
 
 TRANS_FEAT(FCVTX_ds_m, aa64_sme_or_sve2, do_frint_mode, a,
            FPROUNDING_ODD, 0, gen_helper_sve_fcvt_ds)
@@ -8116,6 +8127,8 @@ TRANS_FEAT(FCVTX_ds_z, aa64_sme2p2_or_sve2p2, do_frint_mode, a,
 
 TRANS_FEAT(FCVTXNT_ds_m, aa64_sme_or_sve2, do_frint_mode, a,
            FPROUNDING_ODD, 0, gen_helper_sve2_fcvtnt_ds)
+TRANS_FEAT(FCVTXNT_ds_z, aa64_sme2p2_or_sve2p2, do_frint_mode, a,
+           FPROUNDING_ODD, 1, gen_helper_sve2_fcvtnt_ds)
 
 static gen_helper_gvec_3_ptr * const flogb_fns[] = {
     NULL,               gen_helper_flogb_h,
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 5c814c7769..673cbaae57 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1941,6 +1941,13 @@ FCVTLT_hs_m     01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds_m     01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_sd_m     01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
 
+FCVTXNT_ds_z    01100100 00 0000 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTNT_sh_z     01100100 10 0000 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTNT_ds_z     01100100 11 0000 10 101 ... ..... .....  @rd_pg_rn_e0
+BFCVTNT_z       01100100 10 0000 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_hs_z     01100100 10 0000 01 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_sd_z     01100100 11 0000 11 101 ... ..... .....  @rd_pg_rn_e0
+
 ### SVE2 floating-point convert to integer
 FLOGB_m         01100101 00 011 esz:2 0101 pg:3 rn:5 rd:5  &rpr_esz
 
-- 
2.43.0


