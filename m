Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3755842lfh;
        Mon, 23 May 2022 13:54:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8bNQw9TTAit7L+stZl5feV6nn2dMStjH7l2+RGLCWT/mx0rkMXAmaq52DKE+e/qMAAP7S
X-Received: by 2002:a05:620a:1ec:b0:69f:9f4a:161c with SMTP id x12-20020a05620a01ec00b0069f9f4a161cmr15130661qkn.54.1653339265444;
        Mon, 23 May 2022 13:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339265; cv=none;
        d=google.com; s=arc-20160816;
        b=CA5yYtSdufAsQcY22a21rHeEUXtn8GTQ7JuDGw2H9lLUzuNn9RdwsAaSD/vZPbCJ9g
         IuMMNdt1z0nF1ElpdcpPu55PA7RgKnr/GpswlIo5OtG2HstNKYtS7ioHsZFBwD1hKeGJ
         h/kr44WSTcw3rwhTDypKvKXnoLrdz3OiF4mCtimC+nnNNWcxrhVER3i20cBu2oG196IP
         sKYpFFJfZ44b4YNrlZWwRmf1P8zW7HFMTy9qO5HwUAuw1jBu7A7y90tJTEJajoeFujQ8
         hHI9iw6h4aiULx4kF+s7HOgSB9YCp9Ce2HsBJvMI/N7AmpZxJZGIjCMubIj18zPEueM3
         cvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EfHC5sh/pejKXX57jmwQUPJC/F0imk6n0vf48RAawTc=;
        b=No0wWFej2gW7y1WeVYZpZ89H27P8K10yhnoYPKDdSviKKEQSSAgJJK0gXMIUW89qTQ
         t1zwf9bKfLdqkBQ5JI5lN3hNVAJkHAUDuNqrysMEgOs6UJ8/QxgkRnfSypzRhkThkLYb
         CPdmxOUAjbc54teAlXi1wdAq2eNOHkgOd2bgkEQOD+/qebNjamzDvRAmM4lFnR7QYaXB
         QgjVYZkcmS40VPVz4sXvzNjyKYF2hjRrtgJPwbTdHLjM17fVHNJ3Ifqfod2+SXReR2sd
         agzQd37zX5Vpc9PHYL5mcVFyIy73DWFTNcFC3BY+uch41jlZChUHyOk82VEHJr8r/9wo
         67fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eD9YlSJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q22-20020a05622a031600b002f92db3be9fsi2728957qtw.257.2022.05.23.13.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eD9YlSJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntF4K-0000rW-Tz
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy4-0008O9-Me
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:48:00 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy2-00052D-Mg
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:56 -0400
Received: by mail-pl1-x635.google.com with SMTP id s14so14123662plk.8
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EfHC5sh/pejKXX57jmwQUPJC/F0imk6n0vf48RAawTc=;
 b=eD9YlSJ/LV1T585l5ykRzRgfChRcnUsqJpUsRBjA2AyjXiKcgB8xpiyASEIVhM6HFj
 xpbc+MeK21D+OB38BbNLXJag1sBTQtxKOmyzZq2aqrDkVyZgvOGKFsySfAJBDJlayyok
 +q9brb+s+qo/d+FKE2PbY6QmcZSIwjE5aVSzyhSv7KfskGh8cFVtbs1h/bFK7mZpGj1d
 Ig79tFeUndaA0InrEFTNgs+BIbbZsxeNonKqRPkXnKqtk9TiH3fUJBCy8ClWEbx8l5pr
 bhWeCnWq3Yt3c71e2fFAIPx2VoFHDEPh6JFvGFsLO7zqVHk0fnEbMSvDFAmQR8t6ido7
 5NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EfHC5sh/pejKXX57jmwQUPJC/F0imk6n0vf48RAawTc=;
 b=4HILOdoc50A7bjU8vtlNTy5nWD1Jvom+NNcW6Qj3uI9Yspo2KMevj0XG/VVUNY0S0z
 KVtmyYgF+WsCt2VqyEDl3aFI/I9iI7IdQtzzALUgrMeBbtRxdGQem0ighLgb1nGunDCf
 YbkDLQ3cEKOXfG4VO/gtmg/VLlhkpxEurtntlRGY7Z4inZaszzFsfUeKIG2yKkYwtJ94
 fiJT51SBW5OnGre03hocpRT1Ob41RFepa8qBMePCClBwIn/YRUSbFzIOAp0W2WU6e8vf
 cWb8iBgWeLDkszobT2Cl3O1rMoeANTYGX1SkTdiCjAC9zh61dG1SVbhzdia0KoDyopOx
 HXsw==
X-Gm-Message-State: AOAM530wOkukbruH9npbrSEX7Fj4yna7NEmfR6E21RYfYBLYoEKXszmv
 RDEd2pwdDw5172FxVBwmAemStA==
X-Received: by 2002:a17:902:9b94:b0:161:5a74:aa6c with SMTP id
 y20-20020a1709029b9400b001615a74aa6cmr24005748plp.108.1653338873311; 
 Mon, 23 May 2022 13:47:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/18] target/arm: Move exception_bkpt_insn to debug_helper.c
Date: Mon, 23 May 2022 13:47:33 -0700
Message-Id: <20220523204742.740932-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
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
X-TUID: eJlOIUwTyM3o

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 31 +++++++++++++++++++++++++++++++
 target/arm/op_helper.c    | 29 -----------------------------
 2 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 3a86901779..bdcd5f36d6 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -429,6 +429,37 @@ void arm_debug_excp_handler(CPUState *cs)
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
index 55440dfa84..0a50dbf274 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -413,35 +413,6 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
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

