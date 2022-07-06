Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4551014lft;
        Wed, 6 Jul 2022 01:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vhHEp1KbR3BNCpXp0ff4QLSikRwrUi35k+Mp3hxecH5EsVQXw1ffpJz3hSZ0N7uIz8XguZ
X-Received: by 2002:a05:620a:2452:b0:6b2:4c50:5a69 with SMTP id h18-20020a05620a245200b006b24c505a69mr20928302qkn.295.1657097926195;
        Wed, 06 Jul 2022 01:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657097926; cv=none;
        d=google.com; s=arc-20160816;
        b=rjfwXao9awR4kgP2LjgsS71qFn5iV40AlN585rOO+2rnSlqpObCnRz5ZiQd3+xgwpa
         00bxNqskkl0xbtjE0aFF8FDsRdMWUiPmyl1+SZx11M58F19uMTW6rQ02FGPO2esgrOjz
         4v2eWQv0pf6xG/uW89t1A1YIB7tHSsFJoS44N9pq7fjvw8QIb04stH6YyEJmPsVr6zZ7
         xVMnTR0ASDrU9po+tIWfQU+khvnjVxsUhPzzVmm4R4YHJxBRISL8m9WjXL07TtWaDBMR
         l/BB/Mxg/9H1bHQDVCDwbIETiiLu0s+sU63a8sXgPfIqq7A3dBSVuRJOUexcsqArb6d3
         VFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eMDZljSMa7lgcdxc4v8wiBGe99d03Zr6CetA/Z+JkFo=;
        b=Vmtwq2/YgE7jTHNzO1IemOBmsW9n1qtHbN5xZF/tcEOB2axbqlFBIm8Gx3AXhpSuiZ
         uRvu7n80IZ+1yDsbcrDA04bhqatI6CYs2ulpKfznIZFCJggyCnt2R8um9wMxHiEOhZUf
         Y3VAkf5kWZ696qrv5OMT0kjcAPXXujLw3pxwz28zjK1rYEh6Yp1qAwNiU/EPAm6ymtRd
         G6Vjy6E0FHxssh4EcvdMkADa9moMEpkYHEVobpJSnbyIN2WoZFcnQrNhDOKaH+9sTSlM
         x7gOIl6Vi/EIvkUc01zaYpV87itmbAlegyN5QjjkUr94DJA0/7f2+TxbbFfBsesIfvjY
         Rcmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GOWVfceP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ez3-20020a05622a4c8300b0031df140dd93si4560212qtb.659.2022.07.06.01.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 01:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GOWVfceP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90rt-0002gq-Dn
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 04:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90L1-0005uq-By
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:52 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kz-0000O2-3l
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:46 -0400
Received: by mail-pj1-x1035.google.com with SMTP id ju17so9443100pjb.3
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eMDZljSMa7lgcdxc4v8wiBGe99d03Zr6CetA/Z+JkFo=;
 b=GOWVfcePYSz5k/iq92KMZdyKm3lTK9q0yHLDuhFWv/amV0LHTMrLxmc75iBvAbnmc+
 9lD/mztlfIVFf1ggMPmBGrhuaGKdP0XnjN8RmXAv+kh9jBdpEqOApMcejGMhu5EFEZsF
 DoXpRxLk2rSXvzoMFKeww3ci2zGW047KNiyXj9b7kL5fzTNTk75vVcnwtFCNBCHioKpN
 /JiGJ09v9xr/qkUABmndvltgRDUdFm2GrpRS5xvMVwqXn2rJtT5RXADuu5xpHe5aqPTf
 BvXP105/i9FTvg6lp5bx01R7XzTP/qv8xbn8xo1zz7HkLRsBb+oTOQJDLBexRX0tPtVo
 OLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMDZljSMa7lgcdxc4v8wiBGe99d03Zr6CetA/Z+JkFo=;
 b=kuLXT+M7nV3iRkFhsWGv+P5NVSiTjBzqREqdwcT1Ln2Hjr8cYbKp3T78K4plYqymiW
 XkbvsjFGWtKHd9AHFdEhqrfFbCt10MM7t625koNYFZfAUhGa/+h8dT4FA5pFQmne3Aqq
 KLKpCCDMSkLX83wYyvi4m7xKgvcor5MqVDwPSjIe8uNxMoS5gcKszMDaqEH3z8QyZALO
 BqfbPo7PBWgv8Cwtwhi9IaJHaKyp+1dek/YZfscmOLIHXKXghhXNwTbqYuWzAdhGJ3ug
 N/SflYloT/nXdXuKNsb+HnqI7TbnA/hGbEmEcZmUGjh+mTRUxyy71N0PaVhaJTOyH/U6
 vhFA==
X-Gm-Message-State: AJIora90RH0nHn0xQ5tzw4bY1T03xQ+0f2R9bKdS90ECVDyzLky5knhE
 TgCtt1QMuop5NFlioDJYtSDTGUB2pDDfeHEK
X-Received: by 2002:a17:90b:4a92:b0:1ed:5294:49b4 with SMTP id
 lp18-20020a17090b4a9200b001ed529449b4mr48602841pjb.127.1657095882204; 
 Wed, 06 Jul 2022 01:24:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 10/45] target/arm: Mark string/histo/crypto as non-streaming
Date: Wed,  6 Jul 2022 13:53:36 +0530
Message-Id: <20220706082411.1664825-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: 23HjZDK78Tim

Mark these as non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  1 -
 target/arm/translate-sve.c | 35 ++++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 3260ea2d64..fe462d2ccc 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
 FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9bbf44f008..f8e0716474 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7110,21 +7110,21 @@ DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
 static gen_helper_gvec_flags_4 * const match_fns[4] = {
     gen_helper_sve2_match_ppzz_b, gen_helper_sve2_match_ppzz_h, NULL, NULL
 };
-TRANS_FEAT(MATCH, aa64_sve2, do_ppzz_flags, a, match_fns[a->esz])
+TRANS_FEAT_NONSTREAMING(MATCH, aa64_sve2, do_ppzz_flags, a, match_fns[a->esz])
 
 static gen_helper_gvec_flags_4 * const nmatch_fns[4] = {
     gen_helper_sve2_nmatch_ppzz_b, gen_helper_sve2_nmatch_ppzz_h, NULL, NULL
 };
-TRANS_FEAT(NMATCH, aa64_sve2, do_ppzz_flags, a, nmatch_fns[a->esz])
+TRANS_FEAT_NONSTREAMING(NMATCH, aa64_sve2, do_ppzz_flags, a, nmatch_fns[a->esz])
 
 static gen_helper_gvec_4 * const histcnt_fns[4] = {
     NULL, NULL, gen_helper_sve2_histcnt_s, gen_helper_sve2_histcnt_d
 };
-TRANS_FEAT(HISTCNT, aa64_sve2, gen_gvec_ool_arg_zpzz,
-           histcnt_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(HISTCNT, aa64_sve2, gen_gvec_ool_arg_zpzz,
+                        histcnt_fns[a->esz], a, 0)
 
-TRANS_FEAT(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
-           a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
+TRANS_FEAT_NONSTREAMING(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
+                        a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
 
 DO_ZPZZ_FP(FADDP, aa64_sve2, sve2_faddp_zpzz)
 DO_ZPZZ_FP(FMAXNMP, aa64_sve2, sve2_fmaxnmp_zpzz)
@@ -7238,20 +7238,21 @@ TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
 TRANS_FEAT(USDOT_zzzz, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
            a->esz == 2 ? gen_helper_gvec_usdot_b : NULL, a, 0)
 
-TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
-           gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
+TRANS_FEAT_NONSTREAMING(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
+                        gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
 
-TRANS_FEAT(AESE, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_aese, a, false)
-TRANS_FEAT(AESD, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_aese, a, true)
+TRANS_FEAT_NONSTREAMING(AESE, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_aese, a, false)
+TRANS_FEAT_NONSTREAMING(AESD, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_aese, a, true)
 
-TRANS_FEAT(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_sm4e, a, 0)
-TRANS_FEAT(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_sm4ekey, a, 0)
+TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_sm4e, a, 0)
+TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_sm4ekey, a, 0)
 
-TRANS_FEAT(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz, gen_gvec_rax1, a)
+TRANS_FEAT_NONSTREAMING(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz,
+                        gen_gvec_rax1, a)
 
 TRANS_FEAT(FCVTNT_sh, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_FPCR)
-- 
2.34.1

