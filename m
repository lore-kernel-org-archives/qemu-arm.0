Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2886082lft;
        Mon, 27 Jun 2022 21:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tmYelCobiojRM4TWIOb1ulrPrmBvmYftfk2vwC6zpw3HXc3IdueO87YTenti9BfT67NgmC
X-Received: by 2002:a05:620a:27d0:b0:6af:1fed:2d10 with SMTP id i16-20020a05620a27d000b006af1fed2d10mr6667602qkp.127.1656390502374;
        Mon, 27 Jun 2022 21:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656390502; cv=none;
        d=google.com; s=arc-20160816;
        b=fSh0hEWT8KoHdO95232jjmt8WLFWPNpIS4R/YNQsiLUQHDw1BxDGTG6YrEBHpdiv8i
         JCcStf05b1rwNQlJuzg7H/BvI7UJRFBnASQTbo2H1HU/P81NipoAnebALOVuatmwvMOp
         zz18DNi93k0fJSZKrkb+TmydzB6OOJUw6C697OwlYJF4VVo33dWggBaJdQUcbj+KOhda
         mkirRoZw/toBEqzPDbq/96AKTiH6EnllTUsiRIf+OXKkLgr6oYm5ybWaou9pJ5jYcGYQ
         L94oB1C2T8p6DqiwvdVVQEpnbk4egia+nh7jZ5OwW7CYEsYF4CQNqHCbmMohlRMh7bfm
         teEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h76SjsaX+1rVxX8KDTWd9JukUhZC70d2S6ar++qWxxM=;
        b=hcBuIRvmyXraGRLC0FHADR9SdDQX42rOtMSE0kuRLQYSMoMlGl2MEzJQwWvZGPvQWW
         S4vdMLXcEMAoKJv9W9af4Li5UqZspt4Gmk1hO/Y3YqFduTY9ZqSA1CAFvAM1TlIQYWK0
         6F4Ny1Sjd0LxPWHGn8Dd3jBdpM42rFDTS4X6pwH75s6SJgm42ioFm5RUdMFjp+pinO24
         PhRyP3186ej48XBklzRkbWYyhMmSUMC/U++jCi/e6nPV6YuqlLXHM4M8ZHcu78h6ca5n
         O9VEHRKV0fnYPdr6R6bYJwWdFuykts7nPHyutv/pvc9Ft3cRQ5rk9Cd3N+Btbpq5DHih
         zgVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tK3NSonz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020ac85c43000000b00303fba5ed5bsi6764532qtj.312.2022.06.27.21.28.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tK3NSonz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62pp-0003IL-P8
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jM-0001RF-Qp
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:40 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jK-0003fO-K6
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:40 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 9so11009619pgd.7
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h76SjsaX+1rVxX8KDTWd9JukUhZC70d2S6ar++qWxxM=;
 b=tK3NSonzpdYbaCx8Dt9bz38Gf0QjJN3f2bcqCUiXBeoKLtryImD+FpaxKjFBCf6apR
 n/sQBW8Yxc6rqVy34jgEiToZRNe13tgtpUquXT0oZmv/5dNAOp6KZOoImtY5hPgtdMkC
 jc/CVVfkbmKpVaellB0+13/lCiY6qck0bcTWV0vakP+HAMuvyyp9rsDqIu4Ih06A0eyl
 PnZI1SNG1w2df2YRKwdHsrFPzt2PaqJJb/TbebnVTFX5TRBjq7PCJ18kIZADWhJ8IV3u
 K1GtLxqJW5C8cpZVa9ia3B9IsDgxnk4cUpnEojGOy/VVd3ucEUj5Fdl1mwnv2rslSooI
 oA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h76SjsaX+1rVxX8KDTWd9JukUhZC70d2S6ar++qWxxM=;
 b=cZDQIrGw1ML+8xZPtcQAvJARh9TSf6kO2VbuH+P+l/aeBWvJ3A2/foK2BI7CwxcevP
 wLcaiuYI8Jt4WnqsTzk2upCECuQUzPKSdXvWbLAmeXg5KLKbLEgX9ANRR/kgLFhryG49
 u+4i/FI4pjGVle5yz/JI18sg+thOJiN3PD5hq7Wgw7OdWAVIRrH8tLqkxu/Pa2DcEuoY
 2sC2lej709xBOLDWcVE7LG93cPi3Osmo9at3U6vYv4SQDmeo9PzQ0Kx9E5vChW25Hvt3
 /ELsXNaJJjQpQdFyalgLxkzA98m3t5ulrt5Obx8lAlcdA4qjPSxGcClGaJxlXuUYNiIE
 TMdg==
X-Gm-Message-State: AJIora80izU/YajB5glZRkcCv3KAejdQcGWXo1u8zoRuKHMPBN7hQI5m
 8mcfrtugN64KlBfZoZFpQLFd65CJvsgZIA==
X-Received: by 2002:a05:6a00:1a46:b0:525:82e2:a0d3 with SMTP id
 h6-20020a056a001a4600b0052582e2a0d3mr2612299pfv.48.1656390096570; 
 Mon, 27 Jun 2022 21:21:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 06/45] target/arm: Mark BDEP, BEXT, BGRP, COMPACT, FEXPA,
 FTSSEL as non-streaming
Date: Tue, 28 Jun 2022 09:50:38 +0530
Message-Id: <20220628042117.368549-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H48Zmj0zaqWE

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  3 ---
 target/arm/translate-sve.c | 22 ++++++++++++----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index a48f164ed4..c25bad5ee5 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,9 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
-FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
-FAIL    0100 0101 --0- ---- 1011 ---- ---- ----   # BDEP, BEXT, BGRP
 FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
 FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
 FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d6faec15fe..ae48040aa4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1333,14 +1333,15 @@ static gen_helper_gvec_2 * const fexpa_fns[4] = {
     NULL,                   gen_helper_sve_fexpa_h,
     gen_helper_sve_fexpa_s, gen_helper_sve_fexpa_d,
 };
-TRANS_FEAT(FEXPA, aa64_sve, gen_gvec_ool_zz,
-           fexpa_fns[a->esz], a->rd, a->rn, 0)
+TRANS_FEAT_NONSTREAMING(FEXPA, aa64_sve, gen_gvec_ool_zz,
+                        fexpa_fns[a->esz], a->rd, a->rn, 0)
 
 static gen_helper_gvec_3 * const ftssel_fns[4] = {
     NULL,                    gen_helper_sve_ftssel_h,
     gen_helper_sve_ftssel_s, gen_helper_sve_ftssel_d,
 };
-TRANS_FEAT(FTSSEL, aa64_sve, gen_gvec_ool_arg_zzz, ftssel_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(FTSSEL, aa64_sve, gen_gvec_ool_arg_zzz,
+                        ftssel_fns[a->esz], a, 0)
 
 /*
  *** SVE Predicate Logical Operations Group
@@ -2536,7 +2537,8 @@ TRANS_FEAT(TRN2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
 static gen_helper_gvec_3 * const compact_fns[4] = {
     NULL, NULL, gen_helper_sve_compact_s, gen_helper_sve_compact_d
 };
-TRANS_FEAT(COMPACT, aa64_sve, gen_gvec_ool_arg_zpz, compact_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(COMPACT, aa64_sve, gen_gvec_ool_arg_zpz,
+                        compact_fns[a->esz], a, 0)
 
 /* Call the helper that computes the ARM LastActiveElement pseudocode
  * function, scaled by the element size.  This includes the not found
@@ -6374,22 +6376,22 @@ static gen_helper_gvec_3 * const bext_fns[4] = {
     gen_helper_sve2_bext_b, gen_helper_sve2_bext_h,
     gen_helper_sve2_bext_s, gen_helper_sve2_bext_d,
 };
-TRANS_FEAT(BEXT, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
-           bext_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(BEXT, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+                        bext_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const bdep_fns[4] = {
     gen_helper_sve2_bdep_b, gen_helper_sve2_bdep_h,
     gen_helper_sve2_bdep_s, gen_helper_sve2_bdep_d,
 };
-TRANS_FEAT(BDEP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
-           bdep_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(BDEP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+                        bdep_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const bgrp_fns[4] = {
     gen_helper_sve2_bgrp_b, gen_helper_sve2_bgrp_h,
     gen_helper_sve2_bgrp_s, gen_helper_sve2_bgrp_d,
 };
-TRANS_FEAT(BGRP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
-           bgrp_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(BGRP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+                        bgrp_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const cadd_fns[4] = {
     gen_helper_sve2_cadd_b, gen_helper_sve2_cadd_h,
-- 
2.34.1

