Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1224319lfh;
        Fri, 27 May 2022 11:58:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygFd8mKnCMcpnj2go6Dd+1NJ6BPu17QMMvrS1P7WCGw8OmB/IfBoVkJkaXx+at863iDH9y
X-Received: by 2002:a05:620a:4513:b0:6a5:7f09:ca6b with SMTP id t19-20020a05620a451300b006a57f09ca6bmr13062659qkp.321.1653677902729;
        Fri, 27 May 2022 11:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653677902; cv=none;
        d=google.com; s=arc-20160816;
        b=DbjaPmIsT6XsZFcMKPhT4/gHGHzboxsw6+HqtEkz23XtzqjcnfWhTjMvnA7xNQp31g
         JzPOSm/HgdS+jmNk0W5M4coLtuWPP5MO4lj4YT8L3i/v1WBctLfnKIceI0m7XtSWWPvl
         2E+37saXakIfu9c3V3iJvO/XGqM1VX5n85N338FleJ6o5pH/9siE63CYSUB1binrNG+o
         N6mEvS+45T00ZFseULAfF+Xu8/ujyo7JXeDQYXYpLxyzDDoJGAEtZJxdT3s9y+MFMV2N
         q1l3fX8S4bciqRUAd3tQS0JB1YBgqN3JF/ZVUCQTxn9yCk4fFTyD45S4h93bq3eS0kA3
         fD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3b6oJsf272bBUvknuTekfS8egmhm3vac1GqETP8gKmo=;
        b=F7aEssFShlcfAG+IUXP76dTNhLj8pIqBSSbTC8Re/+Et0x35Q2VpZB1k8L5PDMg7Db
         u2y2Qevwf7jsOS7kR7wJyk3saXTLnBiTIMGf4uDeFr/oIUg/Uso6mLXFn8VGF4/Fj1Cz
         npqqhu18SmtSvfRTta0yeqKAtlgysDu64C/zMeP5DBLvCRIJeVhKmrZom6EoljhSXoDz
         7+QiKO50iyJLm7lNTPbkZQAEDj/hScUKNLRjkg1DqD6wNTgWz3wB3XWs+ADAaFANyWul
         TN3DX0uGDEgCZ9Mlc3KDPt2Lxbs7RthqZQEdJfFUSCD4H5MUkuVUZZd9Eh7EaxbZRe+3
         8haA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UO1E1bI8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05620a284900b0069f3b5d754asi3365884qkp.207.2022.05.27.11.58.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UO1E1bI8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufAE-0005oq-81
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYb-0006wa-Oz
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:29 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYY-0003Xc-SG
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:29 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 129so289650pgc.2
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3b6oJsf272bBUvknuTekfS8egmhm3vac1GqETP8gKmo=;
 b=UO1E1bI8D890zqnqvhUMIP65Wd86esUYdtVn2ogkyJbwV0lEcmq4jad88tFAGfojHT
 6hqVHDcbcGlw1M3Ndx4NzsavE/Gu4ilWfVN89ynsKoo4NNTC6HNYJCNH+JjqCfbk38mC
 D5svG2BgS5rdDmRP5r7S8jn34yZFDMh9dpC9mkR0hxeGwdGJ7SoFZ4gna+0Uuiu9pwDZ
 GACQO8kwjzOkgZJ3S2AzGUfB/r2hnqGJI6dJxK8NQNj7urT8resHH0rNd6VPHh+vW6+c
 tjGJSlS2gGxEgnQ2Iv/sh3TjED2pA7LaewVFbcflTq4TacyC6tFaSIITSgjbMPMEOhfX
 YR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3b6oJsf272bBUvknuTekfS8egmhm3vac1GqETP8gKmo=;
 b=JP5MnSuo1RDgs2nS+F7OwLyNuhYrWEWLC6rQKD/jNeiZIBtNfWsTS/FYe0Af6/nbbE
 s336Uf+V85QbXBL0zjZPOvnqbYSwyQSfhwmTPw1N+m1RzYU1bgpogrITUy/QdvHWMQXa
 qC7XBy13dTmc7HBNwCOUEfmA2Ncc1QoicLdvY/gjMaVQWTN+57WHgEHlDXezwddVi+bZ
 RAfdWFWq5MSG8NwVKvImZfP7M0tCHE7d6o2k3NBgvCVfr0fGN47ZcNUZFO/x2Ii94esU
 77hBv0fM/RriZZcAPCscR1LL20Fm5/N2/WjiPnBb7kYhh0CZO2Ei+EWIsvtU5TyoR1Mf
 lxlA==
X-Gm-Message-State: AOAM533gHDzxsrT5HICVhzBOYYCOsxPkfMql7wbGGo6VZ+0A6GZ9EBJV
 se8rDyj0loaQGRoKAk4wWx/qiO59Btv8bg==
X-Received: by 2002:a63:8342:0:b0:3fb:c6b3:23ae with SMTP id
 h63-20020a638342000000b003fbc6b323aemr1329287pge.154.1653675566082; 
 Fri, 27 May 2022 11:19:26 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 018/114] target/arm: Use TRANS_FEAT for USDOT_zzzz
Date: Fri, 27 May 2022 11:17:31 -0700
Message-Id: <20220527181907.189259-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
X-TUID: mcuK2bpkrcgT

This is the last direct user of tcg_gen_gvec_4_ool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2347b60d8e..b4307f062c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8044,21 +8044,8 @@ static gen_helper_gvec_4 * const sqrdcmlah_fns[] = {
 TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
            sqrdcmlah_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
-{
-    if (a->esz != 2 || !dc_isar_feature(aa64_sve_i8mm, s)) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           vsz, vsz, 0, gen_helper_gvec_usdot_b);
-    }
-    return true;
-}
+TRANS_FEAT(USDOT_zzzz, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+           a->esz == 2 ? gen_helper_gvec_usdot_b : NULL, a, 0)
 
 TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
            gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
-- 
2.34.1

