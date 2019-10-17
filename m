Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1354895wrm;
        Thu, 17 Oct 2019 12:02:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjoFcdNJdsf/T84nChmaeVtlohKGNYGMFYa8CW99l9dQs6aCU++7OvD0vckv+2eCVDqV8f
X-Received: by 2002:aa7:c2d7:: with SMTP id m23mr5516814edp.206.1571338967175;
        Thu, 17 Oct 2019 12:02:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338967; cv=none;
        d=google.com; s=arc-20160816;
        b=TKr87OIDT8VqpHbNe1cdThUTO/kwre1g6/OT8P9q2JvOLAcrX/GM1pi0FH3kcd+zK5
         s/slY8tOV4f+0+QeWt8EamfbJQtIbXzpvxWC07J9IRtdii4UHrZ4tHqqN5HrRprzC3P6
         QxnBhjHpBgUEJiwZJJKYb+ZOS0sqFWy8twJzEyj1RsnvfWHUFtvClHYK6/4P5Tfa5uZz
         5Zbaq8emE8AVRiXPcGmLkJwl2+rZ6Idk68TRfLJOm9GDtNIpwV1rju+/CCWeWrE1VZgH
         Hjf3PeF5VbVtQig5YUBjVk0lbj3vR4/vXdyR0vwq4JXqs0kjuRUxftMOuCFKk5cAz3Jt
         xg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xWBixVJrplgoFEDYWsC1KvhyFbMO/zEb6ezvCN+GZN0=;
        b=g+WiWpCQvqMLdYVtMTKXxh9JtW90kckHEqnj9BeHtfgs7BaEB+GM3Vqmd21q5nZAX1
         76LCAZ5f3FAgdBUSaa6KKKJKUQinliMl2iSCJ3sWUL8TGN8+6b7X98Fn8RJd/loyQQYd
         8/s3yTFwTPGkDLGWYagLSC7oEyyefNS1Q8oeIrfiibFSKy4Sdnd5NniC9My3kM26EReB
         yJUMhrpi9AwW6IEp2ouCJ14jW9/WSA0k8s5lV50ZiH97LY2r/JXYvu6V/RPrAHD1SfSI
         b3gTv09CoYtQ5T5xC5JjHs+JGwgq4o0JlnOYioSxkgIZQoKUQMN/dZ7Jz91DQXAlGxZO
         1Mxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qLwtHFjk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si1905416ejx.141.2019.10.17.12.02.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 12:02:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qLwtHFjk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLB2r-0005CP-ML
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 15:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs7-0001Hg-RR
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs6-0000wV-FH
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:39 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37836)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLAs6-0000uH-4p
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:38 -0400
Received: by mail-pl1-x642.google.com with SMTP id u20so1567026plq.4
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xWBixVJrplgoFEDYWsC1KvhyFbMO/zEb6ezvCN+GZN0=;
 b=qLwtHFjka0RAuBfWznYLYokdMU6JmAewlx7MtQyQaY+cxUeLFNiS2BWWRlqM7bHH+N
 appSYNhRgn32/i203CIH6ROoriq7MgPxwQv3d3GFvj27A7NY+GBY8GMCqnFijBikanj6
 22jePEC3JGoqEl1Q4knIVv9RmR0zigQacCYqmIQM5gtFuPSDpr56xJiJM7yOGkzCWZKv
 wG+c8eBtJVXy0NBZJfZ8nDmOAuHyhChNDOhSaQlBn61R2B7iFdwcpUsg9EM5JTHkMBVv
 zLgRE6hWqELjjDpY1L5tKaNMBKi935EDHZ3emxEGwg/v84B8Utpf8vxfQ2FSSUWwlZzA
 sxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xWBixVJrplgoFEDYWsC1KvhyFbMO/zEb6ezvCN+GZN0=;
 b=JJ+XtWZaTtt8Qjeo5f3a3JFLlSF624LCuiPQ0hjBkqHfv0rpuqx/5yMR4bNRIXpzwg
 FYU9Oa4mnsddx7NbVnsqkJWERnjPWFJDjH2ZyBnDeSX/46cIY8gVdcsA9T9R0Sxl2Suw
 yWzmNSCIbfC3DqhzKuOcdiT5UTEwoGPm6snVmFkppYflmCvP8vfw9i0toySARBTh1XgM
 jLUbm2mS9VIvF/yHzXAMnZtpZCsdjS0smfps+Yn5LPNj51YOGNTgym3AJ4laPMC9Nldo
 GDEC30KPt/6cYYIzabPQ6lgNN8wFRUb8IfXRknZWsmPPxd49FtnHNGIyK+mbevQF+5SE
 20mQ==
X-Gm-Message-State: APjAAAVMhCI2fpDXVvzzGqisLNvpYhQt79xYsBrytypPxL7gyOkByANW
 i2iURB50WlU9ZnXev9mLqGf0D3gfeGM=
X-Received: by 2002:a17:902:8642:: with SMTP id
 y2mr5292662plt.187.1571338289434; 
 Thu, 17 Oct 2019 11:51:29 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/20] target/arm: Split out arm_mmu_idx_el
Date: Thu, 17 Oct 2019 11:51:03 -0700
Message-Id: <20191017185110.539-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-TUID: jZn5vUc3TMm8

Avoid calling arm_current_el() twice.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  9 +++++++++
 target/arm/helper.c    | 12 +++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 232d963875..f5313dd3d4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -949,6 +949,15 @@ void arm_cpu_update_virq(ARMCPU *cpu);
  */
 void arm_cpu_update_vfiq(ARMCPU *cpu);
 
+/**
+ * arm_mmu_idx_el:
+ * @env: The cpu environment
+ * @el: The EL to use.
+ *
+ * Return the full ARMMMUIdx for the translation regime for EL.
+ */
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el);
+
 /**
  * arm_mmu_idx:
  * @env: The cpu environment
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 85de96d071..3f7d3f257d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11026,15 +11026,12 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 }
 #endif
 
-ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
-    int el;
-
     if (arm_feature(env, ARM_FEATURE_M)) {
         return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
     }
 
-    el = arm_current_el(env);
     if (el < 2 && arm_is_secure_below_el3(env)) {
         return ARMMMUIdx_S1SE0 + el;
     } else {
@@ -11042,6 +11039,11 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     }
 }
 
+ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+{
+    return arm_mmu_idx_el(env, arm_current_el(env));
+}
+
 int cpu_mmu_index(CPUARMState *env, bool ifetch)
 {
     return arm_to_core_mmu_idx(arm_mmu_idx(env));
@@ -11202,7 +11204,7 @@ static uint32_t rebuild_hflags_internal(CPUARMState *env)
 {
     int el = arm_current_el(env);
     int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
 
     if (is_a64(env)) {
         return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
-- 
2.17.1

