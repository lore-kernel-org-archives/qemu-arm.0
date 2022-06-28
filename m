Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2894025lft;
        Mon, 27 Jun 2022 21:49:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s4yvljjY9Wbf/F0jd7KQ57ZecPGsXGNSd8jrmKUvMLDWsqhaymquvjqb34/2JNw2Dmn9aw
X-Received: by 2002:a37:a54f:0:b0:6ae:e60e:141b with SMTP id o76-20020a37a54f000000b006aee60e141bmr10393043qke.623.1656391751228;
        Mon, 27 Jun 2022 21:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391751; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8T5LqYT6e3puB5diE7bJpoW3rVaKOE18oPynOTxfl9l5AxNZgCEpjrEAWvFYNLfZW
         PwavBqKkzvh6G3APhRYnHpFdoDdLDY18hGbOCxUNm0pyVao1rzu+bRznn2goqeyoSPkz
         ENjXb5dzcq/T6WKUYeSZExRYj25dnYmXMxhhB0rTHW9eozWEfeYHd4vrn/tEd/Jkl+FY
         VZeqHmOE2GHB8XSnK6lfUJBV+4zdJE05S7UCrjxt+BbynPSoM0cwN1SuIUDH8/YhCVbo
         aszVSO/doRET0PgEricPiwmHY35esAIV1xQ6cVztg2GZjmp67tJwLyooHbensOz+X5Qo
         PUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1W2nx43eQtlEr+hd9bLz6u8JUHPhhCcdUN7L+wJEirI=;
        b=bKnVqxAq5V1pfe9IFpA4TpotcLp2CWDq3N8U5+qGblzjIh9+DnsBPO41LtxjnsADnC
         gO+uSMpgpmCEP3uUAiTuf8yMaWhAucg5y6S9mOnLNy28DJBp/rr7qkTH3RmGTwZo7m9y
         iPrjVcn7alA1I7Sv/+myg1y1EUkheHvq1r+/yuwBEbsgfJv7cgeaADZE3wte/DeeeDyU
         PXlh/6zJeeBOhBx9Hdor9sQxhrwRtYPKz3t0YegbzM94Oxgvh+bCs1mddB3+LAdaEPro
         f5sf7/uPGJSLxLby/0+P1PHy75jlGG7HFPqRXqx+UzEuQwTfA27IBOz98BNdLfKTA2od
         2Zbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dEGfj5fB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee6-20020a05620a800600b006af59e9de82si154901qkb.128.2022.06.27.21.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dEGfj5fB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o639y-00081D-Nw
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jd-0001p1-8B
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:57 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jb-0003iR-Fg
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:56 -0400
Received: by mail-pf1-x432.google.com with SMTP id x138so8214397pfc.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1W2nx43eQtlEr+hd9bLz6u8JUHPhhCcdUN7L+wJEirI=;
 b=dEGfj5fB0JuJF7UN7ntfnt5aUuO1X6L33rdohsLBvHpI/FzvJgfUJncNjOW1KQhBjQ
 JzHuwmJwbmhoABao2LwMHoZTPU1iqILppYO+W7zqf7pXKwDQminB5n6Kvf7qY3obzsqR
 skdzq8tndK/wF6pSR4lxXd4qoFUFCoJZZ23X6LFr/dhKDpChZcE58UIBYZhHuzZEv8Za
 j5AFm6ow5gK6pkkkiDPxqnvFxeFuFaOMpFk9tIErpq4gwoRJjpARyZYPb5dV3HVlCT9x
 8sBICPIodiZw4ynLSfKPDpC7xP54U9hri9QRVlsuVI0x4tlRfgsmY3lwwsdYr/aCa2dH
 lY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1W2nx43eQtlEr+hd9bLz6u8JUHPhhCcdUN7L+wJEirI=;
 b=mww3Qayg80hlHqu1Ht+Oa9XA+HksbFkTpDqh7iiZPZEfNodSXMksr2t3Epwm17fxoP
 IHOoNAksGU8/+03u3tKgdXsfCgrQaHql2GFzvuD4hv0CZZId/IP4c85f1t81wY8I3QbA
 uXNfGfVuzAt99l5WBpLJXJacEEuG6Zn421W1v9NdeFuH77nWsOgEIc2fgoWELnjuAFc6
 qboQkyiZvQuNtc9yz5zpkvL9h07xbHQQ52R5G49M0byvvilJdg1EGytFdXdYW/Z9MHUr
 g+EZyqHB9Fh96hKr28t0tdEJlpOkL+gsnP3RsfHGdHVmQvGvNXCKjgXGPDcVmpTgv0Qg
 ptlQ==
X-Gm-Message-State: AJIora9fl8ErfaZ/9rxMSt/Me6WrnX6cyqxdQUoAAflOPy1Wy6ECYtlI
 PlbgtthPrs1JvKDMWmH90z3UExWAop1hgw==
X-Received: by 2002:a63:2254:0:b0:40d:d291:7710 with SMTP id
 t20-20020a632254000000b0040dd2917710mr11713975pgm.269.1656390114229; 
 Mon, 27 Jun 2022 21:21:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 14/45] target/arm: Mark LD1RO as non-streaming
Date: Tue, 28 Jun 2022 09:50:46 +0530
Message-Id: <20220628042117.368549-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dSaaaK/TnF9t

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 3 ---
 target/arm/translate-sve.c | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 7a0b05cf2c..33bbd13bcb 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -57,6 +57,3 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --0- ---- ---- ---- ---- ----   # Load/store FP register (unscaled imm)
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
-
-FAIL    1010 010- -10- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
-FAIL    1010 010- -100 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 11874a8e77..e5e9e1e0ca 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5062,6 +5062,7 @@ static bool trans_LD1RO_zprr(DisasContext *s, arg_rprr_load *a)
     if (a->rm == 31) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
@@ -5076,6 +5077,7 @@ static bool trans_LD1RO_zpri(DisasContext *s, arg_rpri_load *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 32);
-- 
2.34.1

