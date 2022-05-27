Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1264407lfh;
        Fri, 27 May 2022 13:16:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEeOj+dUWwNb1nQYO2FrTYh8HXBZlhjbbaUqzblCOicnVEBFXwP87XwGun7rI2Vf0ic29K
X-Received: by 2002:a05:620a:298c:b0:6a0:94d2:2e39 with SMTP id r12-20020a05620a298c00b006a094d22e39mr30379833qkp.278.1653682592413;
        Fri, 27 May 2022 13:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653682592; cv=none;
        d=google.com; s=arc-20160816;
        b=bBFOJp1TppD24NJfPuati5H+XnQVbLRX9P6aHw26E0pV8RaOcwIGNmY1cjDgW1KvBH
         8yD9oq7GFgSA0Zo7HGdMaMGWAtG7zmviR/KcxUwo6Q+JG8OC1qaTYswTAwBTxuobfh4q
         xG9ajZNJY2lm2Ncd9U0HiHxhMySLxCSeDdRR3eFBMWKYV+uxIcWHLhpwMtsSAD0OmcUf
         anLGHaa92qItou0xC+LbAyS9E1GQrc0zy2YpFjj/JzgH4EKe3Mp18u5uK+ZMoME75Akc
         cjMf2TSg7afM7J+/uddbyb1RNkTaXemDFHuPxy+iiv/9UTEtYK81Ye9ymTXc2lXwPnNF
         v/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vJSRaq3csOjLF210xdPggRDvmphcL+Yq8uVJkALhuZI=;
        b=CIZtg2iV9XEFlPwlA6044LahJ6w3Gbc87EF0NK1+WpOW1Zp3ZKn8ITnqTuFHG6oAFT
         hm3mYJ3Rh5GonXKqZSFNatR8F2Y8sKWm2FW+aEbp/OSIqIl8KHB4imA8DC0rcI2Pz2TF
         85lw6RZxGFd9ZB6eeRzMAKQWu8QdQj3SpcM4N+d07VOlIrwzhwGaOpUn7bIgbb+wUxQZ
         O42l3vIOEQnnUy+mvJSPaa4M8Bi/vRMFZJcA+Q5ewtY8sbBb1QoHUk133WP0kE3SUoEe
         B0aLNYd4AGxqKow0iVOLh1lURUrGrxGi06GIwAIg6O3hp+tw1prkYxnkqphjhrZZvX/U
         tnjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbjP2Oyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s139-20020a374591000000b006a3ab84a852si3219826qka.121.2022.05.27.13.16.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:16:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbjP2Oyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugNr-00051A-Rz
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefj-000208-Pc
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefd-0005OI-LK
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:51 -0400
Received: by mail-pj1-x102b.google.com with SMTP id gk22so5300396pjb.1
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJSRaq3csOjLF210xdPggRDvmphcL+Yq8uVJkALhuZI=;
 b=zbjP2OyzIXkPcLfnC8wlaYGMtzdvbQWTkCoa1+W1Fr57Z0lhr2D280tZkkmZlUFtZT
 Kj+Af4SmupNAzqrZ2UFshwSieE2FB59x1Ry0CsOEFhvtf026mIUC9w+CcjPSrghTrlUX
 x5nsGNc9CwTLy3KwOsYLbgkFtEito3hUiPQ6/0JYw9zmCovk26MvqsIUyS8bScyWya9g
 pWi3aei+w1oirI4cNN6AlrDEehhkfgT68NEfBHKL36otNeNOQmM4nsAU7UR/vr2aF8Wy
 3vPidia0hI+dN4/rXJEmiSt1XHi17Xnc706IQWXNZ81gLa9y2kfiDqPKOkDBic2cNclU
 Eu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJSRaq3csOjLF210xdPggRDvmphcL+Yq8uVJkALhuZI=;
 b=v/xtLszRjkPdALPeeNmIcJrSGpHctniFmc+GmyAiLp8uWPpSKgw2ri6tb1Q1G8zVds
 u/L8AnGA+qw0/n3CoMgrIiZ/zuwuaN3nEth6vWv4wq7JHVA4+4nAQti9grNgBz2nHjZM
 2INI0JQMeu6AVkOcNJntDn8OkTgDNkYy2+KPsUJKvcEwBDOkTiVWqG+qmsFKCuGtZDRH
 DePzxjypZqqUe/BIQam2nsCFY14Kz7uLbgq1jkXTgpb6cY3y/62Zj4ANVEC9JzH9aoAQ
 uvv8TIqe6QwCtS+Hky1Ib5IyCEjiofBfzeFnA/cYfFkvg4lsysZFGFYEDkII0a6vy1qE
 ypeA==
X-Gm-Message-State: AOAM530D/z9NiFRLLGHc4xAeY9ZAM4oxAZip6JVW+T1uPqYDDkcPs12B
 ynO34UEZdm2DZe/PQlExUep2EExl5vH2vg==
X-Received: by 2002:a17:90b:4b82:b0:1df:e6b4:1fa4 with SMTP id
 lr2-20020a17090b4b8200b001dfe6b41fa4mr9865032pjb.46.1653676004352; 
 Fri, 27 May 2022 11:26:44 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 102/114] target/arm: Use TRANS_FEAT for gen_gvec_fpst_zzzzp
Date: Fri, 27 May 2022 11:18:55 -0700
Message-Id: <20220527181907.189259-103-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: 6ScdMcBgH5E1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 42 +++++++++++++-------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8f50956d3b..75854a7c6c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3998,22 +3998,14 @@ TRANS_FEAT(FCADD, aa64_sve, gen_gvec_fpst_zzzp, fcadd_fns[a->esz],
            a->rd, a->rn, a->rm, a->pg, a->rot,
            a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
-static bool do_fmla(DisasContext *s, arg_rprrr_esz *a,
-                    gen_helper_gvec_5_ptr *fn)
-{
-    return gen_gvec_fpst_zzzzp(s, fn, a->rd, a->rn, a->rm, a->ra, a->pg, 0,
-                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-}
-
 #define DO_FMLA(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rprrr_esz *a)          \
-{                                                                    \
-    static gen_helper_gvec_5_ptr * const fns[4] = {                  \
-        NULL, gen_helper_sve_##name##_h,                             \
-        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d         \
-    };                                                               \
-    return do_fmla(s, a, fns[a->esz]);                               \
-}
+    static gen_helper_gvec_5_ptr * const name##_fns[4] = {              \
+        NULL, gen_helper_sve_##name##_h,                                \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d            \
+    };                                                                  \
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_zzzzp, name##_fns[a->esz], \
+               a->rd, a->rn, a->rm, a->ra, a->pg, 0,                    \
+               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 DO_FMLA(FMLA_zpzzz, fmla_zpzzz)
 DO_FMLA(FMLS_zpzzz, fmls_zpzzz)
@@ -4022,19 +4014,13 @@ DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz)
 
 #undef DO_FMLA
 
-static bool trans_FCMLA_zpzzz(DisasContext *s, arg_FCMLA_zpzzz *a)
-{
-    static gen_helper_gvec_5_ptr * const fns[4] = {
-        NULL,
-        gen_helper_sve_fcmla_zpzzz_h,
-        gen_helper_sve_fcmla_zpzzz_s,
-        gen_helper_sve_fcmla_zpzzz_d,
-    };
-
-    return gen_gvec_fpst_zzzzp(s, fns[a->esz], a->rd, a->rn, a->rm,
-                               a->ra, a->pg, a->rot,
-                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-}
+static gen_helper_gvec_5_ptr * const fcmla_fns[4] = {
+    NULL,                         gen_helper_sve_fcmla_zpzzz_h,
+    gen_helper_sve_fcmla_zpzzz_s, gen_helper_sve_fcmla_zpzzz_d,
+};
+TRANS_FEAT(FCMLA_zpzzz, aa64_sve, gen_gvec_fpst_zzzzp, fcmla_fns[a->esz],
+           a->rd, a->rn, a->rm, a->ra, a->pg, a->rot,
+           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
 {
-- 
2.34.1

