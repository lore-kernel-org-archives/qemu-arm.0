Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp733lfb;
        Fri, 3 Jun 2022 21:36:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyptmqDMNcfbe94ZmHhr+l3siOLYSk39CkXOGqIkJVyavayh7dRgSUlQyHT971OL3eljnuM
X-Received: by 2002:a05:622a:58f:b0:2f9:16f3:95b0 with SMTP id c15-20020a05622a058f00b002f916f395b0mr10495121qtb.493.1654317406872;
        Fri, 03 Jun 2022 21:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654317406; cv=none;
        d=google.com; s=arc-20160816;
        b=jKfbvJsHeqscor8c1rVkiW4ytHeNSydjodZ/aUL2LLjCVRpv6sJRVdfZOxWCzhghwD
         LNt4ul4bY2sIGNyk/Qgu1ibbyDNTQa2s+Iq64J80bxOltPtM1FUm9K6ITygo+Fot1ZWu
         qamjK2Ih6StzRlqsPE7ZhxV1Nc/cJx5wm4RAwvYrnn8E3IokN1IGCV1cvhyudqxNmKNa
         BvcJKKZyMrkXcuTUVWX8BIboHKwKcqcTlh5ZB2HVtmCRU4W2x83FCUbSRvgH+YGWZvxj
         bMXRaGqpF8KFKX4XHtxz47MnmZdQj3GWdtVWkrHz4pPEDiDdv5zbyHJg2YhjO1ghMamg
         x2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=m8FrJXaj9IkZtQ3fkmfO7j242cR+2ACwn4iIRM1nBdE=;
        b=Hhq4YuQRGOtJpFkQ8Ld9ROEdYFlJIDnuW9Z0qJzZ1gFc2wpszR2xQhfxPAzPBt7y9s
         CCslVj0ziEOn99A28QexvOn6YuYNtVnAAUviYmLwbjzgAVjGOtLF6t+dlq0ectVqfsKY
         BqkWqoR/5o/ZP7pSgQkmOz9ASmrqclaUI+6N7wJ3omKYsPyXr7i9AE3jZK0wabz00cEw
         TLh9/sHrmOMBl0zu9ZAOqOI1AD3iE6zm4oYxl6IB9twNCJNFJBidoOYo2YZj2ywBvPxI
         6QavPItSSnDMbRuHhiBXhalljeDpQs6kneZ9lfJtKaGK2r65YiLgwoQeAUNxJc6D02Om
         8FrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xvjVy75q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk3-20020ad45d43000000b00467db70c76asi2729199qvb.109.2022.06.03.21.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xvjVy75q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLWo-0004JB-Bq
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3Z-0008UD-Os
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:33 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3Y-00006A-5Z
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:33 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so13537379pju.1
 for <qemu-arm@nongnu.org>; Fri, 03 Jun 2022 21:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8FrJXaj9IkZtQ3fkmfO7j242cR+2ACwn4iIRM1nBdE=;
 b=xvjVy75q9PU5G+jZOXybpnCGXgr8n8KCgaCqpnnAN0zKCuSBtUy7OaWLqGW8zlOQBa
 ew6AQPbq9ndXlBUyziw5k7qVfx2jFVpTc1EbcDLDpF48Ftwb2Pf/0yuZk71COmtM5n0M
 V55eZtBKSHUlKXB9s1vqc8RhhkuM3JH7AfSrK5SnqrsSpmcavxEWYrSGp6MmvWmOzIXy
 f6xiyrD1Fs/DckW7z3r3hTDfyGSKQ9vBna+5cDR8Itf1EmVIvbpWBySIu4epTwSi5rT6
 5tebjaEmmNuIgk6/zAgVTjdxehSDVTRPzYEMv6SIkI0nmPpGgQ87OEUHsvZFjllXHFdi
 XYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m8FrJXaj9IkZtQ3fkmfO7j242cR+2ACwn4iIRM1nBdE=;
 b=Vzo/TB5PL+P1sXEZe2DBrIU5BECT9DBj3vh6s9BAIN+rW1bkekG85U2GFcHzBjwItH
 W9BdsYfPoxDpyhd0gb9Y3an3ztKjq+YUbupke17+IoQDS9zjxzVLYcmkAPICCpbANXLD
 gCIOZBhL6i2aQ500J4MrDrwrpM0ayEs1DHY8N+vN0nugj7rkkfR1cGzruJUZdDaAF3uY
 /GSLn8+f+vhht7qoNeiYiJKTFxT+ahya9SFgxv+6TJJng7mMCFC0V/0lxNusnNy71xUJ
 P3i7dI8OBvM6CroyGB5lNO8RLWnm/Y0yUjijMax+0QWcuzVPucVUF4mEXYiifAmw27tp
 bgmg==
X-Gm-Message-State: AOAM531mQagWTWKLV2xbYKJ/ikauDMU37+5lZlaOjj5vfHX2frR9s0WC
 B1nWA9wVBTg2uv5HCLnlVVaIpg==
X-Received: by 2002:a17:903:2d1:b0:156:7ceb:b56f with SMTP id
 s17-20020a17090302d100b001567cebb56fmr13016010plk.11.1654315591426; 
 Fri, 03 Jun 2022 21:06:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 24/28] target/arm: Move regime_ttbr to ptw.c
Date: Fri,  3 Jun 2022 21:06:03 -0700
Message-Id: <20220604040607.269301-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: DLq9CrqBqr9Z

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  1 -
 target/arm/helper.c | 16 ----------------
 target/arm/ptw.c    | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 3d3061a435..ed152ddaf4 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -12,7 +12,6 @@
 #ifndef CONFIG_USER_ONLY
 
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
-uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
 
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 568e02c5dc..07b4f7bcc5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10439,22 +10439,6 @@ bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-/* Return the TTBR associated with this translation regime */
-uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return env->cp15.vttbr_el2;
-    }
-    if (mmu_idx == ARMMMUIdx_Stage2_S) {
-        return env->cp15.vsttbr_el2;
-    }
-    if (ttbrn == 0) {
-        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
-    } else {
-        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
-    }
-}
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8db4b5edf1..dc559e6bdf 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -75,6 +75,22 @@ static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the TTBR associated with this translation regime */
+static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return env->cp15.vttbr_el2;
+    }
+    if (mmu_idx == ARMMMUIdx_Stage2_S) {
+        return env->cp15.vsttbr_el2;
+    }
+    if (ttbrn == 0) {
+        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
+    } else {
+        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
+    }
+}
+
 static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 {
     /*
-- 
2.34.1

