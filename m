Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2403369lfb;
        Tue, 7 Jun 2022 13:37:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyICYAALXpRtLMFDzqo0+u8Ie4LM7HJK3En5llxWPfWKrmz/yeUfzsxFjXdIW02fN6vsodh
X-Received: by 2002:a05:6214:21cf:b0:462:485b:d7b9 with SMTP id d15-20020a05621421cf00b00462485bd7b9mr62531032qvh.78.1654634227490;
        Tue, 07 Jun 2022 13:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634227; cv=none;
        d=google.com; s=arc-20160816;
        b=Sk0o9m58Peman1oka4sCcK4tGpCuZCaoFRiatSt/m6hH5tZZegylsaHc0T98jiPpAu
         dwjIY3mrm7F4KuXjcs/SESb+S4xQH2aDQlBkMRhQX92GUn6tRRpV3xdyLPxI4pxNd9sy
         18yr6dELFwRDBoOOu1tQwak89qU+tnCt9nOFYRp2aT+Q0QYwFuSC0Yj8fkSv2YmXpcY0
         pwMOAiku0eXnyjM6T+TPMWVL+Wr4nr2v2eoTkKcUHKRbGH9QEikpVpdCX0yL/O220DhX
         KtpHSllisiDJa4PGGE1dt6IcS/mp6H4Vz1Mk5XKvRLpTWYTQPSTthIdrtQ9HeTNs4/Fw
         8sBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bgSSWj3FWGjqqOHg3NGXEoGoqiXuSmAzBvkeO1FtIzY=;
        b=Cjm/Pf4Xr5f+o1hrOJ2yRfDreCCbrV/rmDNs5Xy15VrxvG5j9sECUSEIJUBCkmCiqf
         tX89GTiMalFuN87kdZ0MuQyjx14xSgnCQ62nKYKwl/PXm+MQE3GCMydX7+poe8e4ZoCt
         8i7JvktVctvW3JWwqWJ3RUEqtDVSnIAOLigjr1ABYdquext0B6u9VUhoorOl/8YD6y2i
         xVU1wHMIwPptK09LPTTlNg/xNOv3f/NfQDPPMDh7PiSC4hD3RJ9/RctFTPvV129d0+tr
         lX3Ia+LLOpUi4Z4h9L2AriBA8KNut+97ZAH/ESDAc+dyxhTWeC5FjFlQKwFW6vGeoxsQ
         b6wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQfeqX1U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020a05620a430600b0069f6d69fe47si11454576qko.304.2022.06.07.13.37.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQfeqX1U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyfwp-00068v-02
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft7-0007HW-6u
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:17 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft3-0007Dg-Jw
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:16 -0400
Received: by mail-pl1-x631.google.com with SMTP id h1so15775130plf.11
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgSSWj3FWGjqqOHg3NGXEoGoqiXuSmAzBvkeO1FtIzY=;
 b=WQfeqX1U+IFBpsPRJTcz748nuIuq87IcS6s8MhUOl8rTJ8kk68tIQyEP4guqvNB8dp
 VUymy3PVaIsPJSUqaBAG1XsWLAVz9WrFu1MIYMxTNw1t0SlZGA6XThZGhIqe8rUsZJoO
 3+W7xxRqmmZcxFcawoH+Utc6BhOanbPqSm2O57Zvvu3zHGyy9QmrJZ30D57X7WChu59K
 c88XOwMrB8es88jk9DKGjT/HDUKTTtroasiEjvx5hQOEh0SxZUz85HoehAjLRNZQ5hMc
 tGJTPRNxMn9sv8KZ+GRxRO3t4wgmNVzbGakXsLwtTqyRfKiSpMo1Q1ZHrP2iZOxUR/kw
 vA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgSSWj3FWGjqqOHg3NGXEoGoqiXuSmAzBvkeO1FtIzY=;
 b=FarwIhXddtwxNaSffzdrql7tkUxVC6ZAW50+R7Gp1D35JmVMd1MRk+rLtgEzO5m3LE
 ODm6JdAVJ9RDnCxQKIz4v/eBy7+rdiO7xlnPmSvWSSOKNpSS3fffVDz6IE0VAw+MiYZV
 +5dwsjZUsmUJO8YhgIw/MwDG09VUhvwEIpUAnvjiTwQ2aMaiSTcodL+ZjOjDO/Jadxwa
 p0orKYKlCRTk616r3QLmpAJAyn7ahkBMH52YQWzvKOtyQVCBuEu2LbepplAlJaAB9pFM
 Hawmpw3k3ezWxHwCc4KQbS1wZ1Oe8CIsuHiM3F54LxhW+4DmH4tXCCaH9T+l7gaQGP2B
 niyw==
X-Gm-Message-State: AOAM533CIrhH7ovQ3sHETaYKoIKs3CF5TV6/bDPBjpe7K7lN8ejkdpwR
 Emy7CirOAr7sHzGk6x3UAt7k+w==
X-Received: by 2002:a17:903:41d0:b0:167:68a7:c2f with SMTP id
 u16-20020a17090341d000b0016768a70c2fmr17693386ple.148.1654633992263; 
 Tue, 07 Jun 2022 13:33:12 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 05/71] target/arm: Add el_is_in_host
Date: Tue,  7 Jun 2022 13:32:00 -0700
Message-Id: <20220607203306.657998-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: FlrCD5ayu2ma

This (newish) ARM pseudocode function is easier to work with
than open-coded tests for HCR_E2H etc.  Use of the function
will be staged into the code base in parts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  2 ++
 target/arm/helper.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b654bee468..a73f2a94c5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1328,6 +1328,8 @@ static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
+bool el_is_in_host(CPUARMState *env, int el);
+
 void aa32_max_features(ARMCPU *cpu);
 
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bcf48f1b11..839d6401b0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5292,6 +5292,34 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
+/*
+ * Corresponds to ARM pseudocode function ELIsInHost().
+ */
+bool el_is_in_host(CPUARMState *env, int el)
+{
+    uint64_t mask;
+
+    /*
+     * Since we only care about E2H and TGE, we can skip arm_hcr_el2_eff().
+     * Perform the simplest bit tests first, and validate EL2 afterward.
+     */
+    if (el & 1) {
+        return false; /* EL1 or EL3 */
+    }
+
+    /*
+     * Note that hcr_write() checks isar_feature_aa64_vh(),
+     * aka HaveVirtHostExt(), in allowing HCR_E2H to be set.
+     */
+    mask = el ? HCR_E2H : HCR_E2H | HCR_TGE;
+    if ((env->cp15.hcr_el2 & mask) != mask) {
+        return false;
+    }
+
+    /* TGE and/or E2H set: double check those bits are currently legal. */
+    return arm_is_el2_enabled(env) && arm_el_is_aa64(env, 2);
+}
+
 static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-- 
2.34.1

