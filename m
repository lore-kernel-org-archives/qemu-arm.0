Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9664CD6E75
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:50:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoF-0006o9-DF; Thu, 04 Jun 2026 19:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoB-0006jJ-N5
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:07 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo8-0007uC-8K
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2bf2247e38eso13168465ad.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616943; x=1781221743; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQuDkDowjaL4I0KT7PVxqCRwbKYWziEo/8pi/s1dqN8=;
 b=noCvzK0pyM7TMZNqcZ4tDMcrNhYvbPvIIrVneXEzx8dxTSLOV7ZMF6yDr9khks1LKf
 FS9V0m03NPvWQ8gM/y3q899M8blli+BnK7S+2YcjG+95162yjvSGhCD2Bj5KFhyd76/8
 7oSo3dE5nQfFCmFbydGB82D6+OaKg9SrkZIb+3+V6P7p1WuhdnMZQa18bnN4lo68ZDnp
 s+u1RUq8q1J4rRR85IVTilKnYSlWaW49zrpzSVJHBqB8EeYjgHAxTYoP+9gKsifmIqSa
 HkLakqPpoC56f3jh8pN9pk+ejPH+l1M9yGd2ioEg9G3CTFongWTbqgJlzDKfPkmGZopG
 KhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616943; x=1781221743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HQuDkDowjaL4I0KT7PVxqCRwbKYWziEo/8pi/s1dqN8=;
 b=KjPuR0v5AJGP3LWRaBeBVo/uomAkkohZ1BUth7VwEuOhn/cTjIpioi8ldw/m6RJx7C
 +nqLkxDuMUpJB1sIzCDGciFCEAkgCz0NV7xUcemiSMyzMmiZu/uIElCpVMEneKjKHaDq
 9c4lUk3r1S/da/fhIyP0ZCnIxuxjvkCTP4fDuDVbTUMeE8vz4EuojuigX+SoB8zBgwrM
 kW1sBVvFrzYAOOgVJVN6RRKchbvbNFQSaXQHJFoJeHZ5k5hyDSObnUnHTI/NwRt3AGJJ
 ZKUdbe7U2og9DeL1X+NKgws23WL5O6D2GNOx9nHxntPyKWjxgGpiETmAB6h1HHK0B5Zo
 NQnw==
X-Gm-Message-State: AOJu0YwZz9UuAt68DCEHqZZvzfpn3kNP2DrQe7fhlP9Wyt85DNBIXDuU
 Z87R3sKPBOLmU+TDkc9ihZn0ERfoQ9aLBs3hopQG54Ctb9EF+7dctoVQN8YxLbpxxiY8O39JYa/
 yMgiW/VQ=
X-Gm-Gg: Acq92OFTSHjJKXu8lTwLbmdyr7R5kXKxQMgWTPy6VsBA0nAs5ljQT8h+fyfDKoM7lmL
 W1wFcpcFzFvl9nu5iaR8A1f2soM3nx2A4hvb1vH3ZT9wwq8wrrEY/NgoFxQU/UyUgXzgEBOxyBY
 g2XgzNUyTnIIRuxA9wamrYg04yhwT06ui5XCfSbIPomhLZkF0HV1ROnp7m3z4MDVoNYnSkb9vrk
 x3Gh1TXTu0jtMC2BlXjX1+CW5cI8yzqh577zkbmMaa6Kx6eX4rMe9Y6WmL4qwGVuKTwOEQuGgWe
 2cdksQ2j3MgwNPOPuk+2V2DRmxqrr4g/fdTPkUSB9LDqnst42v9c5FolOiikAXOF1nFQ4s1Nj1T
 OO/WkE3Jtraueb0pKvlUfubdBdJ9pGat4ExAyomlgWRE2Q6oDGIAO/t7qD2URmiMq9IHhU0Q8yw
 qy7E9hhNHL5uINpYqcNjOp9FnN2Zfm6zzvblaeSOg=
X-Received: by 2002:a17:903:3805:b0:2c1:98b7:ecf3 with SMTP id
 d9443c01a7336-2c1e849577emr6640385ad.23.1780616942767; 
 Thu, 04 Jun 2026 16:49:02 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:49:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/25] target/arm: Implement Floating-point convert
 (predicated, zeroing)
Date: Thu,  4 Jun 2026 16:48:39 -0700
Message-ID: <20260604234852.573178-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

This is FCVTX, FCVT and BFCVT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 22 ++++++++++++++++++++++
 target/arm/tcg/sve.decode      | 11 +++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 3b346aed35..b35db9d3c8 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4588,21 +4588,40 @@ TRANS_FEAT(FCMLA_zzxz, aa64_sme_or_sve, gen_gvec_fpst_zzzz, fcmla_idx_fns[a->esz
 
 TRANS_FEAT(FCVT_sh_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_sh, a, 0, FPST_A64)
+TRANS_FEAT(FCVT_sh_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_sh, a, 1, FPST_A64)
+
 TRANS_FEAT(FCVT_hs_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_hs, a, 0, FPST_A64_F16)
+TRANS_FEAT(FCVT_hs_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_hs, a, 1, FPST_A64_F16)
 
 TRANS_FEAT(BFCVT_m, aa64_sme_sve_bf16, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_bfcvt, a, 0,
            s->fpcr_ah ? FPST_AH : FPST_A64)
+TRANS_FEAT(BFCVT_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_bfcvt, a, 1,
+           s->fpcr_ah ? FPST_AH : FPST_A64)
 
 TRANS_FEAT(FCVT_dh_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_dh, a, 0, FPST_A64)
+TRANS_FEAT(FCVT_dh_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_dh, a, 1, FPST_A64)
+
 TRANS_FEAT(FCVT_hd_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_hd, a, 0, FPST_A64_F16)
+TRANS_FEAT(FCVT_hd_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_hd, a, 1, FPST_A64_F16)
+
 TRANS_FEAT(FCVT_ds_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_ds, a, 0, FPST_A64)
+TRANS_FEAT(FCVT_ds_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_ds, a, 1, FPST_A64)
+
 TRANS_FEAT(FCVT_sd_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_sd, a, 0, FPST_A64)
+TRANS_FEAT(FCVT_sd_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_sd, a, 1, FPST_A64)
 
 TRANS_FEAT(FCVTZS_hh_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvtzs_hh, a, 0, FPST_A64_F16)
@@ -8017,6 +8036,9 @@ TRANS_FEAT(FCVTLT_sd_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
 
 TRANS_FEAT(FCVTX_ds_m, aa64_sme_or_sve2, do_frint_mode, a,
            FPROUNDING_ODD, 0, gen_helper_sve_fcvt_ds)
+TRANS_FEAT(FCVTX_ds_z, aa64_sme2p2_or_sve2p2, do_frint_mode, a,
+           FPROUNDING_ODD, 1, gen_helper_sve_fcvt_ds)
+
 TRANS_FEAT(FCVTXNT_ds_m, aa64_sme_or_sve2, do_frint_mode, a,
            FPROUNDING_ODD, 0, gen_helper_sve2_fcvtnt_ds)
 
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 099cd4e93d..889ff85f72 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1215,6 +1215,17 @@ FCVT_hd_m       01100101 11 0010 01 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_ds_m       01100101 11 0010 10 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_sd_m       01100101 11 0010 11 101 ... ..... .....         @rd_pg_rn_e0
 
+FCVTX_ds_z      01100100 00 0110 101 10 ... ..... .....         @rd_pg_rn_e0
+
+FCVT_sh_z       01100100 10 0110 101 00 ... ..... .....         @rd_pg_rn_e0
+FCVT_hs_z       01100100 10 0110 101 01 ... ..... .....         @rd_pg_rn_e0
+BFCVT_z         01100100 10 0110 101 10 ... ..... .....         @rd_pg_rn_e0
+
+FCVT_dh_z       01100100 11 0110 101 00 ... ..... .....         @rd_pg_rn_e0
+FCVT_hd_z       01100100 11 0110 101 01 ... ..... .....         @rd_pg_rn_e0
+FCVT_ds_z       01100100 11 0110 101 10 ... ..... .....         @rd_pg_rn_e0
+FCVT_sd_z       01100100 11 0110 101 11 ... ..... .....         @rd_pg_rn_e0
+
 # SVE floating-point convert to integer
 FCVTZS_hh_m     01100101 01 011 01 0 101 ... ..... .....        @rd_pg_rn_e0
 FCVTZU_hh_m     01100101 01 011 01 1 101 ... ..... .....        @rd_pg_rn_e0
-- 
2.43.0


