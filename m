Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp264798ejb;
        Thu, 30 Nov 2023 06:27:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrjQdCHmWR0aznTdrU+J4n59ZLYrTc1NqnfT4392wCNVa7+4u2alJipkP/EVrG2ILY5OPf
X-Received: by 2002:a67:f615:0:b0:464:5389:b2e7 with SMTP id k21-20020a67f615000000b004645389b2e7mr3352280vso.3.1701354422559;
        Thu, 30 Nov 2023 06:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354422; cv=none;
        d=google.com; s=arc-20160816;
        b=AYK83RANUCGksZ9T8JjLzOhs9zoUUxqSZt7Cv3VVmjt86wUOYviMg/7Mw9C9IFOm6J
         Yq8exZzSaMVqLlNMWBu2C5ACJnCWkQM3ZBWEdB1bKbl6UQufHhDftgl6UxsV2PDBIXma
         DgnoNWSBKdcs99/k4sAqCw1VY2fDWw6ajmTCq1NMjs13pSgRpdQCA9+s/BelZVLHd5kp
         DGM4yFXr/gHB2mzv60WCG9nqaDyEATt9KoS+pGy9ssljvA3aMYk5LQdKwaZCQ8B9kPjy
         mxfZVuiwaYQ6/rnS05ym09mg7VDzHHZT23g9Q4g1c5OB5IVyZCe9nucmFgs8bXKJKYqQ
         EiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uoizzG5xhbCsM7Lv7ogHVV2wsLPjyGAgiELWh60n2G8=;
        fh=DKQFoSm5rvXVk6AUqpSavFv+IR+qPwKdgcCOIx8jJm4=;
        b=jSXKkNcdlCLXRIEHSEs4RzVrCjCcWFzYcK8gJ5vtOK1nyGTLN6hFQcqalM/md4QAHh
         fmni9JoqGzZjXpLEhgu7byJ6ebkXb0W+0bKgpBaBfjUOihax8z/0PvvPIZ/vRCEsaj4k
         8PVWdWHVo4ublgUNcmvfqUUkY8ySzE2PyCv/EJnIcO37JOsjuVyr5gXGkE3viHCmvehk
         t6G029GvpKfU1HfeumDN4saixCihYFRY8B6EshauY/OYB2oCry70GFPqJkNiF9J/GJoq
         Kz/rrwxRynuKWmhpltAYqe98YdZucus7cPSXVbcdlUFgEWJ+ABZ/hFQHUNOWc6uFtUSl
         4bzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G70tfHUc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020a67eb4c000000b00464424fd613si171809vso.727.2023.11.30.06.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Nov 2023 06:27:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G70tfHUc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8hz0-0006F5-22; Thu, 30 Nov 2023 09:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hyu-0006Ch-El
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:25:34 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hyr-0008Mg-P8
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:25:31 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-54af2498e85so1089730a12.0
 for <qemu-arm@nongnu.org>; Thu, 30 Nov 2023 06:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701354328; x=1701959128; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uoizzG5xhbCsM7Lv7ogHVV2wsLPjyGAgiELWh60n2G8=;
 b=G70tfHUcbdWVRnXCkTYa4yEENAJPfqnC+uiFMdlCGZElv4+7fpS8R4v6MObwxSxzCk
 YCAn98N6NRRywcnqh6ttgJVQ8do72cpQVsGtD028ch6owsfq8VBPCIamEsvmkC4FlYyW
 Ci6xPfCh1ywBFxQAlSD6ll+AVf2jWNUBS4nAqBPTIzCPavFPMqw4s4QZHlFYxQnJIebi
 aRE3219YnNsTuEX2iVUHGRPXJgl1URW+huYKWRMqqwaWRxCNNjvSQUY8RLvCeUPNINrc
 FG3vwViftJOfVMxBHhmr8VXn9z8MFMLA0g26I0qKHkGtaeVLXDoIM4bDy42+hBV9Mp+X
 Z9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701354328; x=1701959128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uoizzG5xhbCsM7Lv7ogHVV2wsLPjyGAgiELWh60n2G8=;
 b=jO+jHq1aPHEZPORcQnujrPtVMb5m8GMhMYjr67EZ2yzQ7POSCqLg/Ghvts+xmMWG3d
 gy01vHKSr1JnbJjw+8WRzpSTEWXac34jCd5LDsABXkRpuh3lmrgScRfd5GGx3oNGxBq1
 qOlABd3E95qi+9zm0FbimqRPrHKXUt89suD2rHlJKVPVqozBgKT3rNxdondTVyvgSVH4
 MewHO97dQnC5LsiLKb67KiTp5c+6DhCUnORTRoz+oMRwaocyDyqWIF+rEhljg5hls4ah
 MZh53u5HqYwxJc5X26WddL4V99SQItIVGCd+tvnIJP0+uaWOTNOX+aDpt/R9Lubhelpk
 s9QA==
X-Gm-Message-State: AOJu0Yy3JuEdeiojEH2P4iIwXol9p3TsIF1gLxX0HRl3Xre19Wlssuxs
 7R8Y7+Euao6gGYsrU+KSgDKXnQ==
X-Received: by 2002:a50:cd9d:0:b0:54b:5243:f7d6 with SMTP id
 p29-20020a50cd9d000000b0054b5243f7d6mr9622510edi.32.1701354327887; 
 Thu, 30 Nov 2023 06:25:27 -0800 (PST)
Received: from m1x-phil.lan (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 h13-20020aa7c60d000000b0053e5f67d637sm586275edq.9.2023.11.30.06.25.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Nov 2023 06:25:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 1/3] target/arm: Restrict TCG specific helpers
Date: Thu, 30 Nov 2023 15:25:17 +0100
Message-ID: <20231130142519.28417-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231130142519.28417-1-philmd@linaro.org>
References: <20231130142519.28417-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CPwKmCG2Qv6i

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c        | 55 --------------------------------------
 target/arm/tcg/op_helper.c | 55 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2746d3fdac..4844cf1d78 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10135,61 +10135,6 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     }
 }
 
-/* Sign/zero extend */
-uint32_t HELPER(sxtb16)(uint32_t x)
-{
-    uint32_t res;
-    res = (uint16_t)(int8_t)x;
-    res |= (uint32_t)(int8_t)(x >> 16) << 16;
-    return res;
-}
-
-static void handle_possible_div0_trap(CPUARMState *env, uintptr_t ra)
-{
-    /*
-     * Take a division-by-zero exception if necessary; otherwise return
-     * to get the usual non-trapping division behaviour (result of 0)
-     */
-    if (arm_feature(env, ARM_FEATURE_M)
-        && (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_DIV_0_TRP_MASK)) {
-        raise_exception_ra(env, EXCP_DIVBYZERO, 0, 1, ra);
-    }
-}
-
-uint32_t HELPER(uxtb16)(uint32_t x)
-{
-    uint32_t res;
-    res = (uint16_t)(uint8_t)x;
-    res |= (uint32_t)(uint8_t)(x >> 16) << 16;
-    return res;
-}
-
-int32_t HELPER(sdiv)(CPUARMState *env, int32_t num, int32_t den)
-{
-    if (den == 0) {
-        handle_possible_div0_trap(env, GETPC());
-        return 0;
-    }
-    if (num == INT_MIN && den == -1) {
-        return INT_MIN;
-    }
-    return num / den;
-}
-
-uint32_t HELPER(udiv)(CPUARMState *env, uint32_t num, uint32_t den)
-{
-    if (den == 0) {
-        handle_possible_div0_trap(env, GETPC());
-        return 0;
-    }
-    return num / den;
-}
-
-uint32_t HELPER(rbit)(uint32_t x)
-{
-    return revbit32(x);
-}
-
 #ifdef CONFIG_USER_ONLY
 
 static void switch_mode(CPUARMState *env, int mode)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index ea08936a85..9de0fa2d1f 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -121,6 +121,61 @@ void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
     }
 }
 
+/* Sign/zero extend */
+uint32_t HELPER(sxtb16)(uint32_t x)
+{
+    uint32_t res;
+    res = (uint16_t)(int8_t)x;
+    res |= (uint32_t)(int8_t)(x >> 16) << 16;
+    return res;
+}
+
+static void handle_possible_div0_trap(CPUARMState *env, uintptr_t ra)
+{
+    /*
+     * Take a division-by-zero exception if necessary; otherwise return
+     * to get the usual non-trapping division behaviour (result of 0)
+     */
+    if (arm_feature(env, ARM_FEATURE_M)
+        && (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_DIV_0_TRP_MASK)) {
+        raise_exception_ra(env, EXCP_DIVBYZERO, 0, 1, ra);
+    }
+}
+
+uint32_t HELPER(uxtb16)(uint32_t x)
+{
+    uint32_t res;
+    res = (uint16_t)(uint8_t)x;
+    res |= (uint32_t)(uint8_t)(x >> 16) << 16;
+    return res;
+}
+
+int32_t HELPER(sdiv)(CPUARMState *env, int32_t num, int32_t den)
+{
+    if (den == 0) {
+        handle_possible_div0_trap(env, GETPC());
+        return 0;
+    }
+    if (num == INT_MIN && den == -1) {
+        return INT_MIN;
+    }
+    return num / den;
+}
+
+uint32_t HELPER(udiv)(CPUARMState *env, uint32_t num, uint32_t den)
+{
+    if (den == 0) {
+        handle_possible_div0_trap(env, GETPC());
+        return 0;
+    }
+    return num / den;
+}
+
+uint32_t HELPER(rbit)(uint32_t x)
+{
+    return revbit32(x);
+}
+
 uint32_t HELPER(add_setq)(CPUARMState *env, uint32_t a, uint32_t b)
 {
     uint32_t res = a + b;
-- 
2.41.0

