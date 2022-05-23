Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3757332lfh;
        Mon, 23 May 2022 13:57:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHQE3nB7ss/7ZM/LguBWpKg9OiLX+HlR7krYZjVfCM2R5qHJmaA4VDVdA7IoSrPXNGa3aE
X-Received: by 2002:ad4:5bc1:0:b0:42c:37be:6ac3 with SMTP id t1-20020ad45bc1000000b0042c37be6ac3mr18238714qvt.18.1653339453156;
        Mon, 23 May 2022 13:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339453; cv=none;
        d=google.com; s=arc-20160816;
        b=VG0TzgjfOltyjSISlXfm4ugamk8MobY3RPK0167wOMS9U5LrdMJ3BVAMBk7HzMmgNj
         B20XA8Bh6/P87H95YC+T1MuQPRU4/v4MM9edC2EQQO1Dj4eBWUbtkNeRcca4N4FxV6E/
         rqK7HOc96ub9t+Ogx80rgzcwX6PD0ZNlMYaZbdr/7OTbP12pI+2XA0gLfeLzj6lCv1og
         2e3rxlTWObwlEDTK0W0dLHjzFM1BXAZWAWy4tow8ricTc252+Ykw2IOBdwmTw+rpsf9a
         XxaSMof4EcyMX45e8XTI6mfcwmAAp3dU/vNGN46DuY0Uz7/sUK8/XcR39FgCA8nTQxY0
         wrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FY/9m2bfUciW+9b94QolKYkajfJbMNVAwbOW4VNUDuA=;
        b=H++p4VTTLLw65fgUWOkzowUe0EBVUSSZc2hyi/UByJmT2xQTyXsgwnTgsuctS3/Jso
         a3Zc6QKB4ba10StCmHZQvPili46mONsdVH62pe72yEMiymsMPJdbKlMUhyi1oU7QRjIW
         J7vuQMK6PQFdCjzHBOX8UPS1ulfkrZaSbcUhQwTy+CWmJMZStH0IqLbsd3SRcQa8D4Ms
         v6mpZ+G9X4GcPBRqlEm0s2sBHhxSAsWCRKMqnxdW4tlRiFxzRuLizP/xoSvbnQd23ejQ
         HN33WcTlQf+EWqIFYpofJVzN/Lf66J9vj1G9cE/zctpenG9vyqpEyNDusCEsimvHGqcJ
         y5rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q2mOQ/7g";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21-20020a05620a295500b006a5718ccc54si206420qkp.5.2022.05.23.13.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:57:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q2mOQ/7g";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntF7M-0003tH-N5
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy3-0008JS-Bn
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:55 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy0-00051M-Lk
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so356372pjf.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FY/9m2bfUciW+9b94QolKYkajfJbMNVAwbOW4VNUDuA=;
 b=q2mOQ/7gXRasaJZ0j5wfFTvfn8D7hgG8IkRZxKB0W51H6pRe6PJoe+GKxIKiS4RKUp
 xA+V8avPrPZe5GbCM67VklBZU8QjeyZh+3a9mh/hDjZg/DD2WVNr/PWGlzvKd8JIEjJ8
 yoQ/J5OvUzH/9FWdSNKNP2hx4oP/E1ss4XQwaeM1czWNRu2GMZm5jiagliJXZLBmxjWL
 6UImFu5tumloGriaLmmPWrNW6nFyYvMbdlv6ingPACBsmoBklijhNptG4UWGQJ+cwM1p
 hmlhN74GNhjvYX97yueGBuvRYEWSIT0yMUpSMaRazFlcyrg26lY67hMWTWycQIFVs5Tg
 6/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FY/9m2bfUciW+9b94QolKYkajfJbMNVAwbOW4VNUDuA=;
 b=uxR070e0fb8NQTFq5/VqV4uxvBnTZYJQM2jUGs+8goSmMZTJVq0UrDoQ0XmTugXDCa
 aww17IO45TxaCiYczPymaJjbGx5sVEpiXISPprf4N6FJ1KSLJ6rofrbhn2k1IqBrya8n
 80KEnIFq5nr19W1D04yz5fwpbf7z1dYfBNwmhY4rb7U/0My4DnzFsBEg9bnu/VE8os7n
 t41TDFqEJoAzvTr2UUlneTvayt8oGrFSdGpPXpVPWNmmNoJ7i9H+aOveWXmzZcRjMf1d
 JH42mj+b1CESelQJUs6KT+ukLJ2cAa+aZLqD3GP918vhoGplas9TAHi6VxVoia1Oob2Z
 JE1Q==
X-Gm-Message-State: AOAM532iJXxOmLE5bztjnplLrIztw9CKPheierJU6JAWcQ5IyWuwZ+pJ
 CXkcq0RPcW4HyMD6HkMS23ey77unlSNhAg==
X-Received: by 2002:a17:90b:4c4d:b0:1df:a164:7055 with SMTP id
 np13-20020a17090b4c4d00b001dfa1647055mr849515pjb.180.1653338871021; 
 Mon, 23 May 2022 13:47:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/18] target/arm: Hoist arm_current_el in
 arm_generate_debug_exceptions
Date: Mon, 23 May 2022 13:47:31 -0700
Message-Id: <20220523204742.740932-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: W0sJ6sP8rIoV

Read this value once in the main function, and pass it
around between the subroutines.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 20a0e4261a..2bbf065b3a 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -13,9 +13,8 @@
 
 
 /* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
-static bool aa64_generate_debug_exceptions(CPUARMState *env)
+static bool aa64_generate_debug_exceptions(CPUARMState *env, int cur_el)
 {
-    int cur_el = arm_current_el(env);
     int debug_el;
 
     if (cur_el == 3) {
@@ -43,18 +42,16 @@ static bool aa64_generate_debug_exceptions(CPUARMState *env)
     return debug_el > cur_el;
 }
 
-static bool aa32_generate_debug_exceptions(CPUARMState *env)
+static bool aa32_generate_debug_exceptions(CPUARMState *env, int cur_el)
 {
-    int el = arm_current_el(env);
-
-    if (el == 0 && arm_el_is_aa64(env, 1)) {
-        return aa64_generate_debug_exceptions(env);
+    if (cur_el == 0 && arm_el_is_aa64(env, 1)) {
+        return aa64_generate_debug_exceptions(env, cur_el);
     }
 
     if (arm_is_secure(env)) {
         int spd;
 
-        if (el == 0 && (env->cp15.sder & 1)) {
+        if (cur_el == 0 && (env->cp15.sder & 1)) {
             /*
              * SDER.SUIDEN means debug exceptions from Secure EL0
              * are always enabled. Otherwise they are controlled by
@@ -82,7 +79,7 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
         }
     }
 
-    return el != 2;
+    return cur_el != 2;
 }
 
 /*
@@ -99,10 +96,12 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_generate_debug_exceptions(CPUARMState *env)
 {
+    int cur_el = arm_current_el(env);
+
     if (env->aarch64) {
-        return aa64_generate_debug_exceptions(env);
+        return aa64_generate_debug_exceptions(env, cur_el);
     } else {
-        return aa32_generate_debug_exceptions(env);
+        return aa32_generate_debug_exceptions(env, cur_el);
     }
 }
 
-- 
2.34.1

