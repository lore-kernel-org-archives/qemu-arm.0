Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5198771lfh;
        Thu, 2 Jun 2022 14:56:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq4Qpg7KYTc8Cl0sFV/ze/PDOlyo3DOUAlR6QCYbDvHhGOcrxZ0f0g/XrSXAl+kN8VSUbt
X-Received: by 2002:a05:620a:1183:b0:6a3:4ea5:7dc2 with SMTP id b3-20020a05620a118300b006a34ea57dc2mr4991523qkk.138.1654206985208;
        Thu, 02 Jun 2022 14:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654206985; cv=none;
        d=google.com; s=arc-20160816;
        b=Al5Y+lP6jcERXGdpoSaF8u38yLst+fVxo6ptIKC1Y62MWnMatD/wEwLMJolnQTMEKa
         T/AE2an3DvtkYHBzF213Xetks5F2r45H4yYpkUcu4PQgR6/WpEzIYNVoGL5Jv6L6o2Lk
         4CIlD0a+cRDKWtO/2WIBeIe3OdiM8+Ur0k15C5OEQuxkBPsbiJRGEU8LkE1r7GWrVUOl
         KZffkMDuVfq16OJu0zjQQWuTmBVxxobO+cIH5FOBdX9e3cNO0lsSPJc/HrvJBDJl3pZr
         seCfSQqLO3nbZgWI/1PP4bNVbLd3c+weWj8qlw71mNq9CNvbd5/ja4X/pVgekQYw2PRe
         MZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bgSSWj3FWGjqqOHg3NGXEoGoqiXuSmAzBvkeO1FtIzY=;
        b=EZpziu0uHyuSrx8ZGHwTpU0EURZC18amHKwat4mPdON0blDLEZu+UooOYUOR2f/Ia4
         S999ojB7jmkk8KertBOfQd+TTf5SHcf0aEvVJMzjkg9M95X8zhBVI2N0hvQYD+o+ozKO
         mV0bmCWI6itu6SYSEdwSu0oPLgD8rzqNaqB+FP5gaTS52VjworEwc0D3ensndBYs02NC
         eWkJSdlXVw+njg6K3KmbW4sAP1DwnkCnYKpq/tSmIoYp4p5H6p9toO8G/N8VfETFEWwz
         iWBAUYXJeaO3YnMIvnyaRSuxpaYbM3867uk0lcXxNQIv68QsPUdM9LMPjntO3TMPEQHa
         /3Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U4SDgABt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a0562140dc700b00467cb4ba225si1553655qvt.23.2022.06.02.14.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 14:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U4SDgABt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwsno-0004fJ-Lf
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 17:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgj-0004Yv-Tc
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:06 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsge-0008Ut-EA
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:05 -0400
Received: by mail-pj1-x1036.google.com with SMTP id gd1so6024440pjb.2
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgSSWj3FWGjqqOHg3NGXEoGoqiXuSmAzBvkeO1FtIzY=;
 b=U4SDgABtc7qf5g49OVWbGQJvO3x2QaH5yFiFAOEre0YLKzh7rpPy5ZXMabsrBz2dlv
 sFRfNlKnLRbH+LJIIfg27obrmm2Zn1eiWBThBo07GsdMkkBVw7OupjcV4h1KCYxvuvKp
 hBMiYfvru7XdZg4IeWIZ2K9hUKsTo2JU8N9Pdzg7EAAMheqbdvQh3jDTKq2GrWmSqUFf
 +UXP/F6Wn30jKevcgQTuh/jF2jNJsml868X+ZtQ4bVGvVowWTyVxlu7eM7eKv85/U0Um
 c+cjtHr0rmklsIpsaCSr9lEymhwUCyB6oXTvkgXoL/v/JSrNcC1R4yn9THAP0dFwnPaV
 UwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgSSWj3FWGjqqOHg3NGXEoGoqiXuSmAzBvkeO1FtIzY=;
 b=MLMwERZ5wtdq2QaEetp0dv+izu9v/bss1IPqrvdZU3fF9E6IF/e3qZu3Vw945uXqHB
 PcKRQGjYGX2UclZwX4aRU9OUyYWiXGK6ynv1XwX5mcXQ8zAmIEIbTKCESPQZxJS3MRs7
 yBPmQ3oxTxhLf3NDLmJ2iOY4XiCAw9U+OcBIqNesGzIEcZscppLpMFXcm2KVS1SqLd7j
 /0i15lxbSPr4ETE7ImUvlM6Jc3nUOTNIzvpUJzdeXDGp+6snibaz4MHnT7f+oaBPeOFO
 I9levI/PBaBYbjbttsULc3u2QuPrJa26tceMfMFnEEjnvRc6FZBYkyHT+wpI9FLL/5H2
 akQA==
X-Gm-Message-State: AOAM533eatHISFIx7ZqOo7qIfC/nGuF4tmJvPokPu04oHLfVrJEROSAg
 vK3ylKBLO1aEp6zI3HFTim20dQ==
X-Received: by 2002:a17:90b:1a8a:b0:1e0:3630:19f0 with SMTP id
 ng10-20020a17090b1a8a00b001e0363019f0mr42099725pjb.89.1654206539020; 
 Thu, 02 Jun 2022 14:48:59 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 05/71] target/arm: Add el_is_in_host
Date: Thu,  2 Jun 2022 14:47:47 -0700
Message-Id: <20220602214853.496211-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: T748Qt+ucowc

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

