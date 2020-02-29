Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1317350lfg;
        Fri, 28 Feb 2020 17:28:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqx98TeeBMNhF4P5dG8c1tea3K0rNyOinwQiEf2zPxxhEzo+/0r3JdhWUhD+fW9Wg3cXGXrR
X-Received: by 2002:ac8:8c6:: with SMTP id y6mr6837971qth.388.1582939716117;
        Fri, 28 Feb 2020 17:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582939716; cv=none;
        d=google.com; s=arc-20160816;
        b=v1DRpLTNOFpFTw9yT7bkbdsx9zE/Bu/prlRd8hxnG26gCDezf/cD82MTydzJ6jCw9M
         zjBeZvUXQ/3n/CQid82Czt+ilv4OUV32pUHKf/LoWxJgoCymw7GWQyCFZVTIXMv9ekBH
         Fj41eF2sHROiuZX9EmcGwta8i456hdhvdfYiS0lLl7BS5vfGGtCkS5vE7ctQ2wrPNAyz
         K7gWwiBr2Q1ijpokPm/LXGRQ0KUZiQGYavRXLItk6m0hhUmRQ2vkXds+xUjXsOCZBDMD
         B5ecHNpRlBRdElg7yjjVDG6wv9x5MbSI1vlv1yZLeKaewbKKxbUPKSG01v911lNfQkLd
         iq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=f02zxp7l+Sqo1gI6cxnt5pVpIauWmflCG9BwYQEIz+Q=;
        b=u6MDykzuYOsFJSJGy9rb1pqzt02BeGvJQr19e/ldV38WfUkl/s+6cLnKGgGvz0fa0o
         kn1J3FhDnsfuUW63pE53qG5CIbDD76IiDLCiM2R8R6LYzb9hMrSieycA6FVsqA/fkf1U
         GLT/4Cuue24AkNZFcI9zqJgV+k+uLAtQQNlcLQeXkfNaEX8H9yLvwn+KkHxUfSkIFCH4
         203qC9FwwCN7CIbg2xxLF0zhuVyldWxtirgDxnkjlN810RKanr45bVlW4DjdBaBn9qVn
         fMfJwiASLE7r79Mmwzv89TIYpisAmcJ2rTk+BloFUl/ZJjiKHzWT2LYZCkYzsvD7e1ZY
         junQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gq+2nEB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si2354103qtp.393.2020.02.28.17.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 17:28:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gq+2nEB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7qvj-0004kF-Dl
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 20:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvT-0004j0-FE
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvR-0005xd-CV
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:18 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:32775)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7qvR-0005xP-74
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:17 -0500
Received: by mail-pg1-x543.google.com with SMTP id 6so2405971pgk.0
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 17:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f02zxp7l+Sqo1gI6cxnt5pVpIauWmflCG9BwYQEIz+Q=;
 b=gq+2nEB6tyfr3suuUaJuiFLEN8m1kb2LsIfDX2ppB3XERpvWN0o0Ta5vf0DLZlxshs
 BREHJsZvV98bBlvrXdZGiMAGIuPTx5xr4QN/l+QRfFHHUnRLCXSlEM7UhxAM6Rxw9MIy
 30ULRp743uMLYPFflyx12tJ6TO4FPVm+N3iFQSCKMxwbe8UMTF4ll1YRDkAqrA21pp+k
 B8wJLfOdGQvSfH1c63nwVWPvg/Zw4Gm4gvo9snbqd2Qn4kZsZliAeAEQsJZo07/WEJYN
 IIp1HdTZyoi3jmo4we5EGhkK23OtfzPeCkQFEMkWOfY/d5I09xMt11/aTF9YRNjExjtR
 hkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f02zxp7l+Sqo1gI6cxnt5pVpIauWmflCG9BwYQEIz+Q=;
 b=X+IKqw8PninFwNRxCxY7cbs57AM+Q26LTbIPjrxAQ+5CqCFbirrfzaRYoxfSRuAY8W
 rDrBQbWAwh32TyKvsK3vsvMqkvZGQ1e/wfEAwBekLMgxwYgBF4tI4CvW+XXFPNDY7i7P
 zQJ952BuBq3HmYGDUzp64srwGH51ars5Q88ZTZjYRBzJH0J6UqR+7TW/Ts/JJzF1aw+u
 Kl2d8x+zvsBk1JIiWODB8pSQK9PktldiSoxNUjhV4cPY3NPYlPlAtE3UT3MLgLWblTTq
 z3JgAs/XiXANHfE/C9WgGOBwmzf3BYYBgoQA3zFh4POLrp02oTZSXjBEu8NnUMgZBXhm
 MjoA==
X-Gm-Message-State: APjAAAVuJRTXK3+9r6/J8V1g24aEvcvS/ZBmD1TY7I4umd+XHwdwX7mb
 N9WCoKRV6G+NfiSe5X0+ZOc98w==
X-Received: by 2002:a62:f247:: with SMTP id y7mr7062056pfl.5.1582939696093;
 Fri, 28 Feb 2020 17:28:16 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 17:28:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/12] target/arm: Improve masking of HCR/HCR2 RES0 bits
Date: Fri, 28 Feb 2020 17:28:00 -0800
Message-Id: <20200229012811.24129-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229012811.24129-1-richard.henderson@linaro.org>
References: <20200229012811.24129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LI6gCYhlPywN

Don't merely start with v8.0, handle v7VE as well.  Ensure that writes
from aarch32 mode do not change bits in the other half of the register.
Protect reads of aa64 id registers with ARM_FEATURE_AARCH64.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6be9ffa09e..e68e16b85b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5086,11 +5086,15 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
+static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
 {
     ARMCPU *cpu = env_archcpu(env);
-    /* Begin with bits defined in base ARMv8.0.  */
-    uint64_t valid_mask = MAKE_64BIT_MASK(0, 34);
+
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        valid_mask |= MAKE_64BIT_MASK(0, 34);  /* ARMv8.0 */
+    } else {
+        valid_mask |= MAKE_64BIT_MASK(0, 28);  /* ARMv7VE */
+    }
 
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         valid_mask &= ~HCR_HCD;
@@ -5104,14 +5108,17 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
          */
         valid_mask &= ~HCR_TSC;
     }
-    if (cpu_isar_feature(aa64_vh, cpu)) {
-        valid_mask |= HCR_E2H;
-    }
-    if (cpu_isar_feature(aa64_lor, cpu)) {
-        valid_mask |= HCR_TLOR;
-    }
-    if (cpu_isar_feature(aa64_pauth, cpu)) {
-        valid_mask |= HCR_API | HCR_APK;
+
+    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+        if (cpu_isar_feature(aa64_vh, cpu)) {
+            valid_mask |= HCR_E2H;
+        }
+        if (cpu_isar_feature(aa64_lor, cpu)) {
+            valid_mask |= HCR_TLOR;
+        }
+        if (cpu_isar_feature(aa64_pauth, cpu)) {
+            valid_mask |= HCR_API | HCR_APK;
+        }
     }
 
     /* Clear RES0 bits.  */
@@ -5143,12 +5150,17 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     arm_cpu_update_vfiq(cpu);
 }
 
+static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
+{
+    do_hcr_write(env, value, 0);
+}
+
 static void hcr_writehigh(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
     /* Handle HCR2 write, i.e. write to high half of HCR_EL2 */
     value = deposit64(env->cp15.hcr_el2, 32, 32, value);
-    hcr_write(env, NULL, value);
+    do_hcr_write(env, value, MAKE_64BIT_MASK(0, 32));
 }
 
 static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -5156,7 +5168,7 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     /* Handle HCR write, i.e. write to low half of HCR_EL2 */
     value = deposit64(env->cp15.hcr_el2, 0, 32, value);
-    hcr_write(env, NULL, value);
+    do_hcr_write(env, value, MAKE_64BIT_MASK(32, 32));
 }
 
 /*
-- 
2.20.1

