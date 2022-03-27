Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp5531678lfb;
        Sun, 27 Mar 2022 02:36:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFtpqnCxZy9rkHC4t+p8zMYIrmyZ5u0K2MKyitKvUfDosWpAQyNoJls2Tch1SLSftpOrdw
X-Received: by 2002:a05:622a:1708:b0:2e1:9106:66cd with SMTP id h8-20020a05622a170800b002e1910666cdmr16667657qtk.440.1648373795268;
        Sun, 27 Mar 2022 02:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648373795; cv=none;
        d=google.com; s=arc-20160816;
        b=X1HC0IDleD20GfRrUOaLS1wGH5Ln/Mj4CM6Zsb1iAEaiALqjLi643xN5sDHfmkLAGx
         ZHDnGjdw2Sp+uXpB+P+owe7NKeEzsULZ06bdnVlXU6IZjjM2rpj0mJ7x/03orHH3jfkC
         ucToyJWi+RtZ46SpXPrCDCiJR4Z2mAt5HAgZyC7nUbPWsEO6DAodUIGZjXP1v32pjJTf
         RTnYI2XirpFZpS+6z4+wZVykJkFXMwDjFblXHLtqbY8oUjV3t2siXUMgfhyIlsYflN0H
         8jfZzUZjibMby8Avg/Tjp5RBV9J7pdWj13XLYEZOjcjxn2ldYjxQKOXSh8zJ/BPbBJO6
         m1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=E//zXgi7Zvk3jC2Mzbnu5NDh5bLaoeibchr3ErcYk+A=;
        b=D+Kmm3RULbbtfCUMbYqkxb+a4BYnT8BRRwnRpMHBCiuEa378DH/+X9Lwfrbgn2PPfi
         DackdS/+dlrOP9vNvdWcaRshouCb+OOEErbN7KTfcWZHMpUJpnI9AqWaalW9n+MbEUAg
         RUMP2y4AEytFD52oGJNmIgW9wwsI9o4blqqfFc1WuonOf1meSqswrtsonM20+J1grQn1
         8UK6TekVN6GrgJbfQwIzPwsSdqI3L2NVZl2VKefel8bSBtEPedveoFpgoNruaiHpFLbQ
         BRG8HNcfM1Vk1LrGzsGRTc5LD1le7zEhOyLjxQ20VPlpONwXKDTLRkp9YFIiyTBxbasw
         bT7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=SgGk1zaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l127-20020a378985000000b0067e4be23a70si3602750qkd.693.2022.03.27.02.36.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Mar 2022 02:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=SgGk1zaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYPK6-0003Oj-Of
	for alex.bennee@linaro.org; Sun, 27 Mar 2022 05:36:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIm-0002kQ-Tz; Sun, 27 Mar 2022 05:35:17 -0400
Received: from [2a00:1450:4864:20::436] (port=41698
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIk-0002cK-49; Sun, 27 Mar 2022 05:35:12 -0400
Received: by mail-wr1-x436.google.com with SMTP id h23so16304434wrb.8;
 Sun, 27 Mar 2022 02:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E//zXgi7Zvk3jC2Mzbnu5NDh5bLaoeibchr3ErcYk+A=;
 b=SgGk1zajx3WWPYU7pknGrknpa+/xCfkUxlbHVg23eywbsqhSCbBlNCrxqUXlORtJ6i
 EMdYk6E3dOLjSeIGKQJfAUfgP6jFVYgc77639tBIc1nHwsJzoWxBw3vwo3FpYdvVCwfy
 MyLuHx6XtDyS2+7OV3nYQPOhLcyf2o89OTMpGoEYGRjIOPoSunbg34SFNeNyA8F7oNaA
 Saj43nJtX39TmUOFtaK6u50rgoGiZayc2GFFCqHBZLPNCio/PtEIBB5Tv5Zz+NXveT6S
 4Krj2dB89Yy5YkPwh/+wGm6rN1Of60kbPLnodckBNTP5fbPx3wlxM3dRMVV2ImsrJkBx
 NrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E//zXgi7Zvk3jC2Mzbnu5NDh5bLaoeibchr3ErcYk+A=;
 b=PF2jv0sZVXqFJEeVwGrKtZ8pFFU7toGrHj6i1VzJPDiGQBRdI1PYmV1CHXO8SxcdEu
 k2BjeRIWF+8SqCwnEJwDuqVIFYoJFP6SZvdVlBflY49BrgNKoPovcgr3HbCYLLju249q
 jguJxatQva/SiJPvvmLeqLw21AcxhVp/lStfPuXssSc9k41VkA45o3hgiBhhP9nmxsY7
 QvTyr4xvDrYH5k8aEL/Q8UUNT6sO0pgb2rrUmZcYl/DsaEMif5r423/4CuUBdVES+Rm+
 FyC6kBnByrYVp8klHUg9q8yE8iDTQ4xOGfWmPj1GNJ87x4/Le5sdm6NvpJvM1cF8V8fb
 CSFg==
X-Gm-Message-State: AOAM531a+510eGHwcBiVV1JkdnkTA02B5VEXu/Wg9W3JjxSDHQ5CrkWG
 8iF9+XpQnV/mgdcqgcexVraBN7vesHM=
X-Received: by 2002:a5d:6211:0:b0:1ef:85dd:c96b with SMTP id
 y17-20020a5d6211000000b001ef85ddc96bmr16712926wru.456.1648373698041; 
 Sun, 27 Mar 2022 02:34:58 -0700 (PDT)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-183-80-20.red.bezeqint.net. [79.183.80.20])
 by smtp.gmail.com with ESMTPSA id
 14-20020a056000154e00b00203f8adde0csm11892039wry.32.2022.03.27.02.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 02:34:57 -0700 (PDT)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 3/3] target/arm: Determine final stage 2 output PA space based
 on original IPA
Date: Sun, 27 Mar 2022 12:34:28 +0300
Message-Id: <20220327093427.1548629-4-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327093427.1548629-1-idan.horowitz@gmail.com>
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U5Se/1vi0p6I

As per the AArch64.S2Walk() psuedo-code in the ARMv8 ARM, the final
decision as to the output address's PA space based on the SA/SW/NSA/NSA
bits needs to take the input IPA's PA space into account, and not the
PA space of the result of the stage 2 walk itself.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 target/arm/helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e2695e846a..16c2628f8f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12644,6 +12644,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             hwaddr ipa;
             int s2_prot;
             int ret;
+            bool ipa_secure;
             ARMCacheAttrs cacheattrs2 = {};
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
@@ -12657,14 +12658,15 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 return ret;
             }
 
+            ipa_secure = attrs->secure;
             if (arm_is_secure_below_el3(env)) {
-                if (attrs->secure) {
+                if (ipa_secure) {
                     attrs->secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
                 } else {
                     attrs->secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
                 }
             } else {
-                assert(!attrs->secure);
+                assert(!ipa_secure);
             }
 
             s2_mmu_idx = attrs->secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
@@ -12701,7 +12703,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
             /* Check if IPA translates to secure or non-secure PA space. */
             if (arm_is_secure_below_el3(env)) {
-                if (attrs->secure) {
+                if (ipa_secure) {
                     attrs->secure =
                         !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
                 } else {
-- 
2.35.1

