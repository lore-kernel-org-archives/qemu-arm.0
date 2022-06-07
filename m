Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1807523lfb;
        Mon, 6 Jun 2022 20:02:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy57/C2VNi+tRMor8148YT/1iV8/WQVyeUblnNfMZ517fMmXNkatUV5dfc2IHvg26gxHJ4C
X-Received: by 2002:ae9:eb88:0:b0:6a6:b3e3:4c44 with SMTP id b130-20020ae9eb88000000b006a6b3e34c44mr7341208qkg.83.1654570949125;
        Mon, 06 Jun 2022 20:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570949; cv=none;
        d=google.com; s=arc-20160816;
        b=lxWgTydspL/8rpGWZbLsrzqPOBFlGfz4pMOWwJppv0FETo95YQup7Ng89lWMOEWlme
         NglxvDv5/MLqzy9SmmFJjdA14YdTTIWME8CuDFR9o4oXGAf79wAyZyDX4Z0oifkFJxPo
         7tJKJwKkWa2TrwmOShjBwqW8aaotHlbcOEbPE7toaVA9NvTKcJkX+qrNkPA8etR6jo9Y
         w9Rk6Gt7/UCTvP6iYQch+XCAhSC/eudjgjUjtII1dGIpDyVdfe8hlG4ZHO2lqAj2YOsu
         EbWaGMrlPoG+mFO/ike9HhCeJr4QGfRqK7C4HZS96p/6BPqF38L4M1nafJuVjDc32z7c
         TUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DResuf4yvFSsZX3asYb/x0WdRbn6myIqroBLohdXR6s=;
        b=oai59XSn1a8bxTrhjWsEXUDSQdtPXHzjVkpFN9IQr95ioZh8FaFgq7HnNdc/d/FFHy
         HRi8rCrvxKpCzbBaGdC+NdhqSGT5YEo5ix2qDgaSSUkV2QjOrsG0R4DMx2UUZPUD7SZr
         mSm30zqaqqTTuoLm7saNEUqe0o2+/vHXki3O5UoFaNzFYC3hFl3aHEcI06XQfL/nSaJi
         uloEOnFQ+84TXG4OrcIF6JBRe25RiDcI3x/C13IOCD7ZsoEDBPRWx0juYEuZZ75kecRm
         uJDqp7J8xX3RCVZk+9T3M5+kBAbOo4QCM3o1rlZdqaDnQjK8u91Rf5Xe7M8nGXewJ2AJ
         epnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T1iGVGo/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020a05622a02c100b002f9470133besi9190140qtx.48.2022.06.06.20.02.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 20:02:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T1iGVGo/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPUC-0000MD-L5
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 23:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPGD-0007ZZ-Vw
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:48:02 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG9-0000Pb-6P
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:48:01 -0400
Received: by mail-pf1-x42b.google.com with SMTP id j6so14244846pfe.13
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DResuf4yvFSsZX3asYb/x0WdRbn6myIqroBLohdXR6s=;
 b=T1iGVGo//xSotjD6+Dq6ruzGkNWUpbqCm0ZzIwPVfGh9qz5pykd7UBic/emjHfpD2v
 uSdPEpDxf25fUGeWpaDYqyT/smhqIPAdwi4FW3jZ+jnNRVrRlOWcMQa++7EqH7WlKlJE
 MWAEbmH+hfDBKTClcxJNN69IKYPMMooHaF4r6W9uvL3Nsac6jakv4+p9fHdj/bX2OS7V
 dOLpf8pujV68G+dccUjt+SzRurQ1TY3NOMZQMaHecctSU56FxNbNV35ivxvQ0RjtAZGv
 bhrkr2r3H3XaiqRc/LQyon0HMK3EbGJdS2yMDhQUEWGLyAphHuV+G74lzwfiKBZDkF4r
 D43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DResuf4yvFSsZX3asYb/x0WdRbn6myIqroBLohdXR6s=;
 b=AyhFQJHU7+dexaL0JSqHiQBJgkAmDn/MbnbhfGj6vs1He+y4XzIe/LQetWcvem+QUI
 cH0pwqgSbLc3h2zUTnPUVTGLaMSYm3AjlYVgoUX/y36njbaMsQIoeeL/cQ3BgWqerHXl
 N/EehKq2nTVGcIMewSOLZfitgnxGWHJBPj/qzJzGCKFdTO6KBjFKWX5YyNT5s2ZUA6mT
 Zjflb2dTP+g2v6EZYyMvD4ehCs0drbKu7DfbPqS7f1Uz9DlmnF/BzX18Nio35SQy7hoJ
 ZAwaMH5FWTx3NADIkvQXhAjmuGtiQ//0IAyhytNPIJCSJAiZDfzRcP/Q1BBjr9nGQ3W1
 /Llw==
X-Gm-Message-State: AOAM531ZUspTPSz4bQ07T0w3i9vWIFrX5AIOGqfvfHjk83amDppT6ByH
 aXkiZF0xFBqWjl3wFyUXojbJTg==
X-Received: by 2002:a05:6a00:1344:b0:51b:e3b5:54e2 with SMTP id
 k4-20020a056a00134400b0051be3b554e2mr19648969pfu.6.1654570075809; 
 Mon, 06 Jun 2022 19:47:55 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 23/25] target/arm: Move arm_debug_target_el to
 debug_helper.c
Date: Mon,  6 Jun 2022 19:47:32 -0700
Message-Id: <20220607024734.541321-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: HkeOqHIcGR2j

This function is no longer used outside debug_helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 21 ---------------------
 target/arm/debug_helper.c | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5224dc2c85..5bc6382fce 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2967,27 +2967,6 @@ typedef enum ARMASIdx {
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

