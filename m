Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1006891ejc;
        Mon, 22 Aug 2022 09:19:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hMQlDnR0oZvIKsF8ffagWag+Ttkh7NsCcRa/6bGBGeNWjTHzRkeVuhjP31Ojjx18iR8qh
X-Received: by 2002:a05:620a:bcd:b0:6ab:84b8:25ee with SMTP id s13-20020a05620a0bcd00b006ab84b825eemr13103906qki.512.1661185178092;
        Mon, 22 Aug 2022 09:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661185178; cv=none;
        d=google.com; s=arc-20160816;
        b=qjchUxLh7VSGzaoG6P8/nxxcWVVQNuaRgn5Yy3sK/JgGN66loIR1nQr0CnH9D6F0qT
         EYkyejUL7O1cQuUnKVZBSNBuNra2JWHk+pRv4y+Egt700v3nL48l4qtxX9R+WU1tjmRV
         0/DaZNCf4woS7XqmG6D4rnbWml0ccdD61eUXOZxa7VfuSUoHUGxj6EyqXrUmmCjdx0cR
         xEiV668VoSzoRXr5HrdTF1UIwTAK5SWur3tYxXKK7p9O2pRxL3JQ4Dx54I95oFXV3pJZ
         EA5fOru/fjjfPm9QnPI7e4gUc86JeWi6s9bZpM3IV4FYrlpVIBBoW/xi5Il5t/NHrxKV
         FnpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4/YHldnnmnuk4Q+DchTbg+rS/RVPMy/dFmBuum/ulns=;
        b=v+iYrNf1m02vODbqKpL60c5wvUCMlKQWSQyxISmGHhRbzMR/4zJM3fEyhkoFobF1V/
         zbYqP9VzE2EFHxVfuBFdgG6s+mT7lBEAzvVqBSrmYW8FjEmL9FOVtpVEHR4pdvi+oItB
         ltXGDk72r6llKqjmhLyDO+K8sEGsj30utO9PAsqfjFUQWpksknGZzRjd9hPMKtYFDbhq
         lCxZmT6xzt9kfx/GGZ5hqQL8nGYragBcpBOQ4iBM0xJaeO7xr0w19gYqluPcdaIhPQ5C
         6sIe7f8rxBMFHlP8zh5sF2Ktsji6DwricsPYJbPOq0vTnFI+3d6eLdsq0X1E5lagojle
         JFYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BZ9SaFbF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020ac80683000000b0034455f9701asi4427967qth.622.2022.08.22.09.19.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 09:19:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BZ9SaFbF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQA9J-0004Hl-Gg
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 12:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lj-0008SD-0c
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:23 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LT-0000p2-4y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:22 -0400
Received: by mail-pg1-x52c.google.com with SMTP id bh13so9685199pgb.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4/YHldnnmnuk4Q+DchTbg+rS/RVPMy/dFmBuum/ulns=;
 b=BZ9SaFbFLDtkhExyRbZxLr/DPJFxPRvhG0b6ZbVKH5/mRSHX8VukNmWATjiw9f+Nwn
 62aXYuAELyyqnsJlONYZaocNVp0LwZHACqv8giUjP9zevJ2HwoSyclHoW4GwbaUyaEYr
 vhQmUDX/RP6dmsaa+JkffvVugR3ddk6J38T6nmIkxkCuPMEiwou/Jo2D3vSYD9k63s4x
 vwZIEBb83LTdLZYrQ4buNvLRIWohUxpAhYe8RhT6greRmHoD0qCwTG7I3OHaqnrlMv3E
 5ZvjLlVsKlN/0Hs2ds/YhgVwlfMBL3Y71se6TWAtA9tLIMd5xOx99CpuN9dx9dEvsVjL
 8CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4/YHldnnmnuk4Q+DchTbg+rS/RVPMy/dFmBuum/ulns=;
 b=K/CQVNAnKm+rRw47+Oib/zIiUtCxrJA47VFaxZKlGJ7xeqazawvU/Y1rTub+O79X97
 xYRh9Ya/CMN5zLNwfsTGhDWvQ3DCkAtJKc/0IUzvcWHsUbNQW+dAd/fIPvdugp6k0sAo
 5pjdijg/rKSvAcasEV9VLGe3uKtEFDElB8z3p1+1bVAMcKBF/XqNyLuzdL8TxPI3AJMA
 LhgRQySvkpKt6X/IniKbTz9atMDhMhAt8mcxuf4fYcXSZeKdHk1oRQVKn1bHbuaDe6+4
 8hOmdadD5dSQVj6OJ1ADCu9xf7RVD9M1Cyz4obcx0oynDevMQRPTtbYSNMAAMePUg2Hs
 oorA==
X-Gm-Message-State: ACgBeo3uP4snjRNdNexx3f00apOr9Yb9OjjMMrLj7qlYk0l+VTp/CbU4
 SRbKMEDqhxkXBr1nTJYWV3Tq0gUtdImf3w==
X-Received: by 2002:a05:6a00:4acc:b0:536:46c4:d084 with SMTP id
 ds12-20020a056a004acc00b0053646c4d084mr12449878pfb.71.1661182085645; 
 Mon, 22 Aug 2022 08:28:05 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 29/66] target/arm: Introduce arm_hcr_el2_eff_secstate
Date: Mon, 22 Aug 2022 08:27:04 -0700
Message-Id: <20220822152741.1617527-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nGfSkhpFyx0l

For page walking, we may require HCR for a security state
that is not "current".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 20 +++++++++++++-------
 target/arm/helper.c | 11 ++++++++---
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cea2121f67..a08e546de4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2401,15 +2401,15 @@ static inline bool arm_is_secure(CPUARMState *env)
  * Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
  * This corresponds to the pseudocode EL2Enabled()
  */
+static inline bool arm_is_el2_enabled_secstate(CPUARMState *env, bool secure)
+{
+    return (arm_feature(env, ARM_FEATURE_EL2)
+            && (!secure || (env->cp15.scr_el3 & SCR_EEL2)));
+}
+
 static inline bool arm_is_el2_enabled(CPUARMState *env)
 {
-    if (arm_feature(env, ARM_FEATURE_EL2)) {
-        if (arm_is_secure_below_el3(env)) {
-            return (env->cp15.scr_el3 & SCR_EEL2) != 0;
-        }
-        return true;
-    }
-    return false;
+    return arm_is_el2_enabled_secstate(env, arm_is_secure_below_el3(env));
 }
 
 #else
@@ -2423,6 +2423,11 @@ static inline bool arm_is_secure(CPUARMState *env)
     return false;
 }
 
+static inline bool arm_is_el2_enabled_secstate(CPUARMState *env, bool secure)
+{
+    return false;
+}
+
 static inline bool arm_is_el2_enabled(CPUARMState *env)
 {
     return false;
@@ -2435,6 +2440,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
  * "for all purposes other than a direct read or write access of HCR_EL2."
  * Not included here is HCR_RW.
  */
+uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure);
 uint64_t arm_hcr_el2_eff(CPUARMState *env);
 uint64_t arm_hcrx_el2_eff(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b9f1a3d826..55355197b8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5101,15 +5101,15 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 /*
- * Return the effective value of HCR_EL2.
+ * Return the effective value of HCR_EL2, at the given security state.
  * Bits that are not included here:
  * RW       (read from SCR_EL3.RW as needed)
  */
-uint64_t arm_hcr_el2_eff(CPUARMState *env)
+uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure)
 {
     uint64_t ret = env->cp15.hcr_el2;
 
-    if (!arm_is_el2_enabled(env)) {
+    if (!arm_is_el2_enabled_secstate(env, secure)) {
         /*
          * "This register has no effect if EL2 is not enabled in the
          * current Security state".  This is ARMv8.4-SecEL2 speak for
@@ -5168,6 +5168,11 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
+uint64_t arm_hcr_el2_eff(CPUARMState *env)
+{
+    return arm_hcr_el2_eff_secstate(env, arm_is_secure_below_el3(env));
+}
+
 /*
  * Corresponds to ARM pseudocode function ELIsInHost().
  */
-- 
2.34.1

