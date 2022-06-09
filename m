Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp684826lfb;
        Thu, 9 Jun 2022 13:37:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE9lfpXzn4zt+ebYPRsVaszKHg5cmx1XRgY1AoUxQWp3Z8qg45W7IDY8VFDx1emRutQxrb
X-Received: by 2002:a05:6214:761:b0:441:196:795e with SMTP id f1-20020a056214076100b004410196795emr86193671qvz.67.1654807052545;
        Thu, 09 Jun 2022 13:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654807052; cv=none;
        d=google.com; s=arc-20160816;
        b=0M8WIzU3o7VkUqBZyAQ/HM81vj4ABmkpZOsNbTNiEZ3R9DQZGgcZrzR7rp0ZQ3TpsR
         PejqrIv4SsLlXN8phY7zpQ5c0OvpAYIKCRQrVSAWOnhULmGS9nu4w4pD+0VhQpN59mEl
         UHn+4EyqAvLjm1WTPuFaxJtGCQD22l76oH6tzSKcUYttSIw5Dl6q4SDB3frkwzhmB8Qd
         7ideHXTu4EOJ5VLOxziRCeKWTCFF3oaMcJM4sUvCrxexYs0IsiWW0GZxWyF0iIIJUw46
         B0p/rUUZBsuooGA1v3YkZHz2Xq6RdOemds+kQF6JCbAq34PadQq30OBVk8VmVNu37YLb
         oB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kj2ZYfRQGSWcXMLkNM8zljFGjh4Y1FzFkf5hNzLBiyI=;
        b=tgqg66z91yf/gL8peGS22FJwHBTh3qxjCanX4nVJTPjosfGVwFJu+fcXOJ9BOjHzp1
         0bDaGnZTkxPUBXQ//EjYofFz4aHGisQrvrxaFxkIHIP98XDJ8ZdDgVQ9TtTRnZ3G9Zuj
         XnX52/wwhXrSokA1n934ND6M6BHCfYCCdw7U3j55RUwnri4JTLkpZy29t/lSSLfH5dkS
         qeJ4Pd1QvOyMvhfmlb3P0kW1DALL9LZr9Kni0B8wZ/ur6+uX46u3ONcuwxPW81agaHkV
         1BZDNqs1V88ZXPCqWV91qw8JUVtHkMc+Oej3+AjU5XoFTMSvJxMBXW/AljtMuVy1i2J6
         PxHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QmusMp69;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20-20020a05622a025400b00304e9cde18fsi8305230qtx.609.2022.06.09.13.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:37:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QmusMp69;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzOuJ-0004q9-UH
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmG-0003fH-De
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:12 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmE-0008SR-A9
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:12 -0400
Received: by mail-pl1-x635.google.com with SMTP id h1so21111454plf.11
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kj2ZYfRQGSWcXMLkNM8zljFGjh4Y1FzFkf5hNzLBiyI=;
 b=QmusMp69D93YwXt/7TOjJMXhkbte6nFaynuJ6DlS9+82QVE5I5dDyJD5/7g7pdGmyE
 xmhHthrgXobgre1xJCfHsEetJzDucay2DV2f9WO+dOWK+IxmHFNNe1nkmqQmE5WQlWtX
 AdlXXmxOfJL2DOWKlZjpZnIuufHv1yzuaqtqcVoHolZUaG0e8+QWTuMvxL0wPNjrq/xO
 Pb4ldVG9UXXj3axqtqKb4e9sFuc8hAjTzLQAU39ChG1itLNDaz/WtszMs7hSRO8q+FgV
 1CNinAGTpSyub7lZjUuwJCXTkmsgVIIoM7YdF2FQ8dAbbOPbmRFWLGh+3JHX4iiE4Lir
 gEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kj2ZYfRQGSWcXMLkNM8zljFGjh4Y1FzFkf5hNzLBiyI=;
 b=pxLrDesVawRbHcr7yuIRnBaq24deAMYjfdF7LdhrXZThdKQsgn8IieuaPdSr/fEdql
 g6Tw6/BDmnUjHUUIN+Zuou8dic3ESRAws3dF48/U1pqAjvu1iuGgUeOhd7HlumYxw4sa
 n+i2i6ARTJLCL7UNn/A1FkpBUvdfhvxwRxN1eiRHEzXZv/i4BRGrwY4Auk9e8DiSdjCd
 0fFm+Cfj/7IpdVlsmRnD9Gk0+GGlL4a7hmFPqC1O5nV+p+qDQ0gsaWPLfSRCD2bEaUjI
 vR3uW/OR4Asbll2qOAKCRxLNXflGg0xW6Urn9ngCyvBNhHGG24e706YUVKQ3kvzuFYcB
 13rg==
X-Gm-Message-State: AOAM532m45ozZudeM+bMLt4TQcor8VCGDDiaYxie96jCo/qbcGxhVlEw
 dgBRozPWzB4pwbb2aWEOQXQkng==
X-Received: by 2002:a17:902:eb85:b0:167:987e:2686 with SMTP id
 q5-20020a170902eb8500b00167987e2686mr14360987plg.33.1654806548944; 
 Thu, 09 Jun 2022 13:29:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 07/23] target/arm: Move exception_bkpt_insn to
 debug_helper.c
Date: Thu,  9 Jun 2022 13:28:45 -0700
Message-Id: <20220609202901.1177572-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: +25l4KGNL1v6

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 31 +++++++++++++++++++++++++++++++
 target/arm/op_helper.c    | 29 -----------------------------
 2 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index a18a09a0c3..80dff0788b 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -430,6 +430,37 @@ void arm_debug_excp_handler(CPUState *cs)
     }
 }
 
+/*
+ * Raise an EXCP_BKPT with the specified syndrome register value,
+ * targeting the correct exception level for debug exceptions.
+ */
+void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
+{
+    int debug_el = arm_debug_target_el(env);
+    int cur_el = arm_current_el(env);
+
+    /* FSR will only be used if the debug target EL is AArch32. */
+    env->exception.fsr = arm_debug_exception_fsr(env);
+    /*
+     * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
+     * values to the guest that it shouldn't be able to see at its
+     * exception/security level.
+     */
+    env->exception.vaddress = 0;
+    /*
+     * Other kinds of architectural debug exception are ignored if
+     * they target an exception level below the current one (in QEMU
+     * this is checked by arm_generate_debug_exceptions()). Breakpoint
+     * instructions are special because they always generate an exception
+     * to somewhere: if they can't go to the configured debug exception
+     * level they are taken to the current exception level.
+     */
+    if (debug_el < cur_el) {
+        debug_el = cur_el;
+    }
+    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 97c8c9ec77..2a8bdc2cbf 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -399,35 +399,6 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
-/* Raise an EXCP_BKPT with the specified syndrome register value,
- * targeting the correct exception level for debug exceptions.
- */
-void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
-{
-    int debug_el = arm_debug_target_el(env);
-    int cur_el = arm_current_el(env);
-
-    /* FSR will only be used if the debug target EL is AArch32. */
-    env->exception.fsr = arm_debug_exception_fsr(env);
-    /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
-     * values to the guest that it shouldn't be able to see at its
-     * exception/security level.
-     */
-    env->exception.vaddress = 0;
-    /*
-     * Other kinds of architectural debug exception are ignored if
-     * they target an exception level below the current one (in QEMU
-     * this is checked by arm_generate_debug_exceptions()). Breakpoint
-     * instructions are special because they always generate an exception
-     * to somewhere: if they can't go to the configured debug exception
-     * level they are taken to the current exception level.
-     */
-    if (debug_el < cur_el) {
-        debug_el = cur_el;
-    }
-    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
-}
-
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
     return cpsr_read(env) & ~CPSR_EXEC;
-- 
2.34.1

