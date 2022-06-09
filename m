Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp695639lfb;
        Thu, 9 Jun 2022 14:02:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPYz2fiJF9qwByTMCIm50gL4vxLcT0O0dvnnxE8AK4KTlLGMTzld+Yy+avpRjWk+PqJZpv
X-Received: by 2002:a05:620a:4405:b0:6a7:26b7:b66f with SMTP id v5-20020a05620a440500b006a726b7b66fmr3749844qkp.93.1654808541760;
        Thu, 09 Jun 2022 14:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654808541; cv=none;
        d=google.com; s=arc-20160816;
        b=pHt/jewXUptkTQJUFtU4hFx+Bf5RXBLJGY3JR+kYpQoIsxWmF+LEdFwr+bamAqSxU5
         gBQMkOB4YPX0fjqfyjuCVDGvaqflLUEMQWfbA8ykHWdBX2ZdYqVRcIrKlKF5XkKqvmv8
         4iC8KVgu/SYmEXBXpcSelEfLv3qtKpJBrzeSYvL75SmmJrhpdHx2VoNp7XKnCVDoWFQY
         +TB1JTTD0jE/g3wO/RqXSoIGkJvD6dQt0VWmWqIo70Eiv7Ig0sqKsrSFdUcdekzyQyvM
         tiqBuAR8djMVxt6x256LhbSpQ7IGHczcOOeqf4Fr/1Z5XbMfFjrB598mzP1cYI9aNDeb
         vpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=odSylXA2XRBD0oTe2Ed3JfqFz439C4lE/Ju+M7CRV9E=;
        b=gsIA//vNfWfy8pveI6OLRBsywpWcuG+YzmgP+BVQJGH+xRjU4MrlA10PLkJ/CwollH
         0pdsTcdr21Z9Vz1LMLrSD8A0y6EM+MkBSbN61zREV787PquetH44TtJ0/U4U31ILsRaY
         /GCKJ9mpu4sER0XgbLhlwoXXl/fhX3Ja1BV2Dfqr4xz/4KzKHBOdSsS74yjDbHqT7jYQ
         kSWzUd0dNvdFUI40FNvxGeNBQco1R0Fa6U5mdmzRmckeqVxc28TDh0ai6EbvAbikjvCi
         BFzbYS4dzw/155swLirvoDhht3T9Oo5CB/R0tYVocOtJylMjQRLAx7H9eR4W1/4HPJbp
         NGnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s3WJ8EPB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a0562140ca300b00443d08ee87csi658155qvs.273.2022.06.09.14.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 14:02:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s3WJ8EPB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzPIL-0005ku-73
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 17:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmW-0004Fr-VV
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:29 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmS-00007x-Qh
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:26 -0400
Received: by mail-pg1-x531.google.com with SMTP id d129so22849878pgc.9
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=odSylXA2XRBD0oTe2Ed3JfqFz439C4lE/Ju+M7CRV9E=;
 b=s3WJ8EPB6vmK1cLVlBRzxg1KDbZ1KIK9Wav1PynJGapIlLproIJwNOK39qR3M2PNZX
 0Zou14sdBtRNK2el+iZ8VU4EQ0fSA0m5/iHBVl9W2fTJyd2ojpfnNIenhjHLoGAA+4V5
 WqGbkvvO8PnZoihF+f0Ip50XT+L1gaT/mQMoqeonQ8SVUCjJkOD1scKS39PPhv/IZazc
 pMygNIkGTSc/3dh4J8S3kuEsxwWh/A8M+7rLrqA3xJBrB1emzfi4kL9jk3KngEXKciqH
 pgfv8PkfNzR31C5JV73l806rGyrv+pAoMP6/kWz2ORhP3kqclEnBCixXcCJ0sgaJV9TJ
 qWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=odSylXA2XRBD0oTe2Ed3JfqFz439C4lE/Ju+M7CRV9E=;
 b=RBEMEdEEz5cP7BC/IN8fFkuNTE85iJTjaYrs79h9QvK7hQZxLyYMrHrPXbSki5Cn+S
 mBA41/eo7qPWBDkOoNuVbuppiO3w2AnBidXI1MXVcugGeK2AUJD0ogxX8QU9iexR/Av7
 u144MqfFbwsUV94hl/GH1H3ufveicD70Af0fAWxJQaz0/wxd0Ayi5lvNtWdoErcVbn9w
 2LyviRX2CGje8HfNfnbLuG27S+56qHxAcKcf9qbRjhJIlUGpES2xyXWcFxTlH3jPPdcH
 hLuvq5NI1zpiAjhtCuaEG1VFq5zZgHtkv4LGAzly5ZpbAwkeqZqvS1vra3HSOBYn+p+x
 O78g==
X-Gm-Message-State: AOAM532P3NfaeFqm4Ffy5qJnU35Zk6wBvnDXSf/iGPr1H6oX22IsZv6U
 r+V9hsjJaAaa9pZ7+UgyzCr2Rw==
X-Received: by 2002:a65:644b:0:b0:3fd:d5d5:8c7e with SMTP id
 s11-20020a65644b000000b003fdd5d58c7emr18319992pgv.590.1654806563562; 
 Thu, 09 Jun 2022 13:29:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 23/23] target/arm: Fix Secure PL1 tests in fp_exception_el
Date: Thu,  9 Jun 2022 13:29:01 -0700
Message-Id: <20220609202901.1177572-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
X-TUID: 8s14vP7m6Pla

We were using arm_is_secure and is_a64, which are
tests against the current EL, as opposed to
arm_el_is_aa64 and arm_is_secure_below_el3, which
can be applied to a different EL than current.
Consolidate the two tests.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2b2c1998fd..b95aa53474 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10879,27 +10879,22 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         int fpen = FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, FPEN);
 
         switch (fpen) {
+        case 1:
+            if (cur_el != 0) {
+                break;
+            }
+            /* fall through */
         case 0:
         case 2:
-            if (cur_el == 0 || cur_el == 1) {
-                /* Trap to PL1, which might be EL1 or EL3 */
-                if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
-                    return 3;
-                }
-                return 1;
-            }
-            if (cur_el == 3 && !is_a64(env)) {
-                /* Secure PL1 running at EL3 */
+            /* Trap from Secure PL0 or PL1 to Secure PL1. */
+            if (!arm_el_is_aa64(env, 3)
+                && (cur_el == 3 || arm_is_secure_below_el3(env))) {
                 return 3;
             }
-            break;
-        case 1:
-            if (cur_el == 0) {
+            if (cur_el <= 1) {
                 return 1;
             }
             break;
-        case 3:
-            break;
         }
     }
 
-- 
2.34.1

