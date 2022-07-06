Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4549039lft;
        Wed, 6 Jul 2022 01:54:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQf0qpBb7HZHqUVhFjnU/HP6BA/jaR+aEcPloGzRqrfTrtUAMlCSvWR73mdaiwGCI2p4rw
X-Received: by 2002:a25:d70f:0:b0:66e:4aa6:e12f with SMTP id o15-20020a25d70f000000b0066e4aa6e12fmr15831457ybg.531.1657097678808;
        Wed, 06 Jul 2022 01:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657097678; cv=none;
        d=google.com; s=arc-20160816;
        b=I5te+502FoDNPru/KzYUICE8OPVmoC/vSScHESDtDKg3BWTbgZlRvCKf3VHKqLyN8t
         4t0L7tLy4P6QyV9dCLLBgitSbEuwRa8FGnPYMX3IV3SPRLGYvMbf4G3zVDtyo/a1s073
         ij9kKiwGeRnD7lu3xssZbeIXLsPtbFsvmS/r411YLBp8r55YzrfSbATifDdlzbXRtvjl
         4hetwylscMsnH+rwHkjVyHFGFmGwO1XPCK4PbaNlMiEoCMdqscMHDr1Mx51hsmtH4JYy
         cP6c2XZcyNv9EkQ8QmqLr8sdQIOMNdvFUe7NIsKUo60+hr3ARXZ6lBTAvIDfiZOPiqIk
         fjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3fycTpR631CAyDn0p7xxlDZ9oFm740riIb23T+ghRkc=;
        b=xs/fielJ0yuhxRs3R8T/Zr47x0pGkPt03srGfki36YQ4FOMxg858/bAlszRagXrwJr
         I52UdRF1mtVasYhtMJtbHxBGArsAeSGMx7hFBtMrdjisZxZOuE3DDLyJGtls2EXQ3TOc
         13SKfHE5F63jUxp8XvhSyIPW/fdlRQ0FqoxgQd4x9vA2XGxG3yLnaJ2f71o1Cvcb0WS1
         X5ROAra2GnBEVb0yC1b6KOTDAqc0nzgUjJTVCN/crk31r6R8CgvysN9JGZjVWPG9AEo/
         Lv4E5Y8Oobftfrcuv/C1Zf9kf7Ku9x8hddXMveslfFcnIKtO+JywgicCPed9ROr61Yce
         Pm8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GkfpssZ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x64-20020a254a43000000b0066e756981e1si5182441yba.4.2022.07.06.01.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 01:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GkfpssZ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90nu-00060c-7J
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 04:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LA-00060f-Ck
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90L6-0000PV-Sk
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id y18so5048474plb.2
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3fycTpR631CAyDn0p7xxlDZ9oFm740riIb23T+ghRkc=;
 b=GkfpssZ3zDqg3a2hEsIIUnMan3aEYwz0l+ZG8gYBuXNobkfxMOLo4SmeK92tLQ218i
 1b6RLycoN5u/BryOhh7+vmbieDN/twcdUmyH3aWardqGV5vWm+XZ2nndcSeIh2Y+HZrW
 FopuesK7mJ8M6RebWkA66PTfgurKpfo+XG5TJ2AYxVeeYLI9kQNtQesZCXKrT4RjNS73
 65QBswAvBob3eFpE6ce2L8mPbmdrLINcD5tUAYVpcYRbi3RX8UG8BsFG10H+AbYcYy61
 rCE+pB9+BZ57t7QJTxAnYX3zOZTkTEWU8NqoYWkh+ttIkZTaPVvyo4Cihv6fREQtPSk5
 7liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3fycTpR631CAyDn0p7xxlDZ9oFm740riIb23T+ghRkc=;
 b=gocY40q4beuizJgchYYp8WLLIxris2LXI0aqol6suaANf8pvmzsK7udOD8Fm6KOCPp
 ujY67f5Q5Wu8csB542dWMHhVAS1h845mMdiaKo7w/0Pdvjkq8fUENGO+XTDEZW8pghNF
 TQdgqfbLMT1cpriDdN8EeTwJJGl5MWGG1RGhKFb6Ln5j8CoVD4wm77g6Xy24J5bhu9zn
 jNpNku8+vmz5NM6lFghmdZlIRliPFtZoJOZQZ+XJwCn41TXQE2E60jyuKTCvZXpJr/UA
 r3Ty2rnCavN2ITZhsRQUeazOu69FxklBppYIr7nScAKktXMtLUSZ2rDL51a942j2eYkc
 90JQ==
X-Gm-Message-State: AJIora+D3toBWV9oVwIitzzFS9wQiFTAG9O1ZB598jHfOfTGv3TqNy/U
 qK708mk/6LEUjjVaxHm58V6k3Q==
X-Received: by 2002:a17:90b:343:b0:1ef:b65d:f4d8 with SMTP id
 fh3-20020a17090b034300b001efb65df4d8mr1902757pjb.187.1657095889488; 
 Wed, 06 Jul 2022 01:24:49 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 13/45] target/arm: Mark LDFF1 and LDNF1 as non-streaming
Date: Wed,  6 Jul 2022 13:53:39 +0530
Message-Id: <20220706082411.1664825-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: oMgYps7QO9ga

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 2 --
 target/arm/translate-sve.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 7d4c33fb5b..2b5432bf85 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,5 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
-FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
 FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bbf3bf2119..5182ee4c06 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4805,6 +4805,7 @@ static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
@@ -4906,6 +4907,7 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> dtype_esz[a->dtype];
-- 
2.34.1

