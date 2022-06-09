Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp688741lfb;
        Thu, 9 Jun 2022 13:46:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0pIkjUYIWewPQrZWlloq5AoVXxg3DTdEOX8foLlRSFjPf7HBwEhSDdAqJ3p1jeevbdR+s
X-Received: by 2002:a05:6214:d03:b0:46b:afbe:1c2f with SMTP id 3-20020a0562140d0300b0046bafbe1c2fmr15097850qvh.112.1654807618652;
        Thu, 09 Jun 2022 13:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654807618; cv=none;
        d=google.com; s=arc-20160816;
        b=DTszCLyz0mBy9r89uKjS9guF7EklSyTwQEaz9MTYFEhAlp52R4KMpat9IgH+vidfkq
         TR+Yr8BjLXzCMKNwbaBMrq89zZ5uqy9aoXymGcojK3aObuUWDnSF4+r+s/Y2ak6fqqWh
         k9PUIg43ffLFQWWbE7C9ElGYaQP+8S25J50Mi0yiTk9oTYqfX3WdYaqXfXW46Z3XuuiK
         Uy1D1k1gbl9vdexaxUXO3zZ0+0aGHJGRzNJ4Cb/swiAMwfxfATNbpbDC7012axsrktpQ
         ROlt1ssfFrvA76TRJrjcFDZGhRsUwj9Vcm8i2toZpsGDir6xt/4kJDqeQnr2lIR2529w
         Y1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rHr3GvWpnhlYyxP8wVfL31GtOWGiQW1hytUXYczR5lk=;
        b=e6jjhvV14i2yFFl9Yr0cI/1Xq3NahGmqNxGN9XC22WPPCqgntbaO7DSQ70sd+V2uuk
         nC+QcfPgPGzBV2JgQlNw33n0Ux5VgR7qbyNm7wEzI7/5qgHoYKOUr0N+1Xx7JSlfKZat
         UG0vsNpGIkfZRPBQ90PW7EBJvILywS1g3Z3gahFvmq9M3/uZmY7GLXaYRESz/7FtQQwg
         168vCOJmG1/TqONKMT3fLPtBVwPs1gLUyHcOU/JaLiVed6M1U11yAyLM6gnOdtfSv+QZ
         c74AGH3qNNJ6bDGKbkfYGewjn/6ZO4b7WaqZSFe0expr9FTWBfaDqv9zlyKpZp9b3ft2
         DEPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FXddmIt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a056214076600b0046b96742c72si7112737qvz.405.2022.06.09.13.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FXddmIt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzP3R-0005mF-Vr
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmU-0004Du-6p
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmR-0008VG-LL
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:25 -0400
Received: by mail-pf1-x434.google.com with SMTP id e11so22035763pfj.5
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHr3GvWpnhlYyxP8wVfL31GtOWGiQW1hytUXYczR5lk=;
 b=FXddmIt9cI7ADeTK9+lMTP4ZfbBamYEfScDKvaQZzcWtszHXPVjPCF4W2w2HS31jtd
 EJFEn4szy7KevR/F4+67Nfai5j1MOKC46hEpvjGTpw7wZ/MCnHg5QF0sZ+9inFTBx3Yc
 Ozuo++dicgV72mPNp7VxHoYb9eOB7TNKqXQaAAQmSbtruabF/i3bWD5LicNEgcr5HGFK
 hltWKmbg7EFbtf77PWTLcPhxO2iqVXW+MkyA7vMFkHBJaGTxwZtMPGM5ZzDICyS01Nqz
 56vznTe8/+Kq/qdNB2vPt2A4hPML4zPeDMtRqEccV8JlDTEH/F33sYv7OjvkVUlQfAB/
 hY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHr3GvWpnhlYyxP8wVfL31GtOWGiQW1hytUXYczR5lk=;
 b=lg7hbkTf95h9pu7XLdQMe5RLcMEEQVf73xVfOqMSKV09FBIDwTxOOdyy++QsoV2Jsx
 xruULENh7kPhMqUrH1q3rUomg8qaRD7XjJeqEmfuQvQOkzfo0VHJVHTjX84iZw3QBjK6
 GDe3xUReLeK0FWyeuoDJPPkCndH07k7RL7qAPUlvyA+0UCHp5pPHpUb4tgSPaX4L7sU8
 0Mnh2faeaeV17W1UKKRvrTQoMew7uN0EOmE+L0M5nnkEv/WHoU0DAVy+Hl2OH0IQA9cB
 ZpWWeJxBW+sIzMiah7GYpcWnp1penYd/1E3ux5E3CNoTQ32ZAt7Z5nGSdn9BkMfKsAVP
 t5Jg==
X-Gm-Message-State: AOAM530sOXUcVIkollYGgj3neyzMsLiWkSRqDA35TY7pWq5+JJ2n3M+l
 rnRoULmSeRW1muJRn2KWKgD1DA==
X-Received: by 2002:a05:6a00:1956:b0:51c:3a0:49d2 with SMTP id
 s22-20020a056a00195600b0051c03a049d2mr27029295pfk.29.1654806562544; 
 Thu, 09 Jun 2022 13:29:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 22/23] target/arm: Move arm_debug_target_el to
 debug_helper.c
Date: Thu,  9 Jun 2022 13:29:00 -0700
Message-Id: <20220609202901.1177572-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-TUID: AvvGpQpTuJum

This function is no longer used outside debug_helper.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 21 ---------------------
 target/arm/debug_helper.c | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 719613ad9e..161ac9fa2e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2986,27 +2986,6 @@ typedef enum ARMASIdx {
     ARMASIdx_TagS = 3,
 } ARMASIdx;
 
-/* Return the Exception Level targeted by debug exceptions. */
-static inline int arm_debug_target_el(CPUARMState *env)
-{
-    bool secure = arm_is_secure(env);
-    bool route_to_el2 = false;
-
-    if (arm_is_el2_enabled(env)) {
-        route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
-                       env->cp15.mdcr_el2 & MDCR_TDE;
-    }
-
-    if (route_to_el2) {
-        return 2;
-    } else if (arm_feature(env, ARM_FEATURE_EL3) &&
-               !arm_el_is_aa64(env, 3) && secure) {
-        return 3;
-    } else {
-        return 1;
-    }
-}
-
 static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
 {
     /* If all the CLIDR.Ctypem bits are 0 there are no caches, and
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 26004df99b..b18a6bd3a2 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,6 +12,27 @@
 #include "exec/helper-proto.h"
 
 
+/* Return the Exception Level targeted by debug exceptions. */
+static int arm_debug_target_el(CPUARMState *env)
+{
+    bool secure = arm_is_secure(env);
+    bool route_to_el2 = false;
+
+    if (arm_is_el2_enabled(env)) {
+        route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
+                       env->cp15.mdcr_el2 & MDCR_TDE;
+    }
+
+    if (route_to_el2) {
+        return 2;
+    } else if (arm_feature(env, ARM_FEATURE_EL3) &&
+               !arm_el_is_aa64(env, 3) && secure) {
+        return 3;
+    } else {
+        return 1;
+    }
+}
+
 /*
  * Raise an exception to the debug target el.
  * Modify syndrome to indicate when origin and target EL are the same.
-- 
2.34.1

