Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2444261lft;
        Sun, 3 Jul 2022 01:56:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzCRz/o3GxpwY9c+C1gVAd1JfdO24f43PLcfiwfDpCAubrPdf4Boaj6HH6TELiuGShazih
X-Received: by 2002:a81:c5:0:b0:317:6551:94e5 with SMTP id 188-20020a8100c5000000b00317655194e5mr27545756ywa.499.1656838596968;
        Sun, 03 Jul 2022 01:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656838596; cv=none;
        d=google.com; s=arc-20160816;
        b=xjqa6bQZpfkgfNjXoNcUU1Vq+LKFmjLLqV3SW2n9Ukx+s1+w+mAsPp5n7hYsl0intz
         P2qiGUnXGpzFDmiyiC6hYlDFXqADLLGe4mgSCZhMV58/+CCyNdBoh7PqqT36bLeIOhIq
         c8dgeU9ImEdlMaNgMVuZcgV2tKIz4K+SKABYLR2n64GrRkYKCfVNCKIGhfXzc4zjPZVv
         tcnl6Bl2xBGS6b1b0YPIZPjZm+qKEq8CGVVlpJSBB1ktxncdvhaI8tQc1CnOOsLj+XYl
         olpowCpxftdG/pJUbXv82uBLV152FU/1Qb0ywWWnQc5RS0KprWvXff+/wzAZo3eYv6SG
         Puww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vLAvxSHjryBSlV/58LjYjX4bLoTG9g4zcCWg1cB7QP0=;
        b=TVlxVLt4zQPemx95C1glW8A9k6ddLyiVOUzudzKhZou4Fc+hGjML7Dvx41YKOIq0DF
         Z78LE99/8f9cGq0Pc13KVNb1OWzUNbj3RrDxkuEyebKFQH/RQiEaK5nVDQv5+knWenGW
         b5MELSiRsqQMAgsYS7vZJFfSBNmI1V09dazpcD4H+aqATsR44z0NGhIrYkjDV8VZVAMi
         hqcTBRvNkfHVbgr/bH0YFgASuep7HodMuZg1nrYNzaerGkD1UAXumREtOjn/2vJwCvx2
         lKk9JOuW96tXkuOY/3EsLtzOVqiEhQlhtVYX4CjWZxLewUv2PDIGMHC7WbPmoX3pmA+a
         UAwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AoeURa6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020a056902070300b0066ce6f64f04si32510592ybt.177.2022.07.03.01.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AoeURa6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vPA-0006SI-BK
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz2-00087u-Kw
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:36 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz1-0006fA-23
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:36 -0400
Received: by mail-pg1-x531.google.com with SMTP id bh13so312212pgb.4
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vLAvxSHjryBSlV/58LjYjX4bLoTG9g4zcCWg1cB7QP0=;
 b=AoeURa6S8yUYZOi6BuboAwkd6wJ1mXmBBI4tVMt4XJtnfRTzT+qNsYsQUzAC/E5CsO
 rDzRVF5SwSrNmk6UJ1IQ+Ld5SlsWoR8NhqzkPAvO7ZgpVwomWQAzkIZ5FpuyFfuld8dF
 ENnLvcll2XHSLi2COvJc7PCf1iyLA/ZXq7NQlaFOK36yvhAbAc5H070G7rM3+7OKPzWB
 vlWGC6yaG6LIVrXxCTDHLY2DWATdCnPgMXjFUzcx5Qg0PUKO9cBs7wIEIIS5w3ajS8sY
 Ufu/ixFZ6DJDWlKafRSK1wqg4gbnFH9NmmA+AHP5m6GtLKQUoU02aWW3MCjbSMrK1Me4
 4Dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vLAvxSHjryBSlV/58LjYjX4bLoTG9g4zcCWg1cB7QP0=;
 b=qyVlv9gAHIgkvnz/x1HEzHVUAeDHNEjU1Pb/4JTuXQ34charkKpNpNPXqdjctfdlVa
 OSxUJTT9cSuE7Xnli8ncjixsWdQJ3sOP3wt0t9O0ED2E6V83A8+Z/KVhmOFaPVdqFzst
 MspekFSkluz/KGF9tnw9fpT/hcsmPJl3Mj3DGDREXZscS6eApEusLoxUOFuZByjAU0xy
 TdL/vHYgih+gWn8PoNr/pO7hG1nsrfYYBMLZmdpRCRKqn3/2YQdfWVyjbSjRuZrj3RiY
 ltWjyv+lZUQCJ4C9fIqZBTobz1AnINfBEBx51h6MaCMXIt3CT7ChFVUF6SYx5+cTt4GK
 j++w==
X-Gm-Message-State: AJIora/cUA9skNOM0QQwMJrmXBguU5sxRu//C6yH6QY5PLvfWf0owK+O
 LM0dvn6dv0iP6kUWFkT1QYERPw==
X-Received: by 2002:a05:6a00:4211:b0:525:a57c:25c8 with SMTP id
 cd17-20020a056a00421100b00525a57c25c8mr30006357pfb.85.1656836973759; 
 Sun, 03 Jul 2022 01:29:33 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 41/62] target/arm: Fix ATS12NSO* from S PL1
Date: Sun,  3 Jul 2022 13:53:58 +0530
Message-Id: <20220703082419.770989-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
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
X-TUID: wIyoBjKhTsWf

This has been broken since arm_hcr_el2_eff gained a check for
"el2 enabled" for Secure EL2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a760ab86c5..43a82c3c7f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -146,7 +146,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
     }
 
-    hcr_el2 = arm_hcr_el2_eff(env);
+    hcr_el2 = arm_hcr_el2_eff_secstate(env, is_secure);
 
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
@@ -230,7 +230,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             return ~0;
         }
 
-        hcr = arm_hcr_el2_eff(env);
+        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
@@ -2357,7 +2357,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            hcr = arm_hcr_el2_eff(env);
+            hcr = arm_hcr_el2_eff_secstate(env, is_secure);
             if (hcr & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
@@ -2490,7 +2490,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
         result->page_size = TARGET_PAGE_SIZE;
 
         /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-        hcr = arm_hcr_el2_eff(env);
+        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         result->cacheattrs.shareability = 0;
         result->cacheattrs.is_s2_format = false;
         if (hcr & HCR_DC) {
-- 
2.34.1

