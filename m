Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1804427lfb;
        Mon, 6 Jun 2022 19:53:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1jKEyIa8RiQV0FjqO7F0e+pYApChRvsIYaO/73EzKKXMl59hgNOGqEQ8kgk3tqsLfLysB
X-Received: by 2002:a37:9ecb:0:b0:6a6:a6e4:fd47 with SMTP id h194-20020a379ecb000000b006a6a6e4fd47mr12353389qke.708.1654570401772;
        Mon, 06 Jun 2022 19:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570401; cv=none;
        d=google.com; s=arc-20160816;
        b=miINTaBbgZegotR0aIs4mpa86Et3gbzrJ1RJ6H7T3ifCQuxmq25YtGAAt1tQGC9d7Y
         coJWwchb7OPmLptCqcZ0l3+2TBwHQcPKRwoiIXdGKUpXSZqCHmfnj9myzUkDG830N3T3
         gy5DP6DTxc9b3xOazM6W+ugjVoHcCntgYqUjK8Y1NNw21m4Bs2guGjhxqNYdRTKrWTjG
         ImFXaQOxbs8s9A8DedSIs/30J2na+v8yoOaExzjHTBQpREuK1Z6FnuWqmFErjyRoSecm
         QTOKXij/tcOHG48YKJGA4JG4pa6ioDjKZYabcZfac1Qd+xq3DIb0e+WbXL4rTIbbCRmV
         XgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t3QqzZZIr7UgbN3ZekMQ8h5fse6DD+fMoam6hjgppWE=;
        b=PZy3k5z6DDmQXatE2zGWVQ08wRsT3UR/NY7ibhYmftyYwtZlvZ+QDc5jzu5+2HU0Dj
         dUAI+Yk4geCIOAaNQtXAMTujeJukhohnhekJOgkllL+M7HhYrS9URmJkonAjY1fvu+7c
         T98m3ZIfO0VmfTfYh955sCC/5MB+s6CGERODvPyMEP9NLaT1gjckiZZoKTi6DimF0Lf0
         P8Na4cmGApy8oJwBJvgH4dFbonyg2nVivehH0NeD/jmjaEKmFIq8keXPLD/jlJm8H89T
         xiRdERioumKBwxp5/SBjRktZClrpIZ8HsLyi3NWJPTsw56U6IEgYA7wdbBYrIy9CxZpt
         hbeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTmXMfS6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05622a000a00b00304ef237f6esi1752140qtw.669.2022.06.06.19.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTmXMfS6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPLN-0008Ra-7H
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFz-0006lB-1H
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:47 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFv-0000Jc-KY
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:46 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so14214085pjs.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t3QqzZZIr7UgbN3ZekMQ8h5fse6DD+fMoam6hjgppWE=;
 b=CTmXMfS6FCWvfvnO5WPje6Oj9LPCpEKr1KhT25MLPj2UIBdFYDMmGH3xJ7DhED3peo
 /4LTy71tWBI7RWdTN5cQJ0+AVgposcFWpaPBDnQF1NaolNjx/gXvOkHrlKuDQuZxkPtT
 RQ0JPZPdZal7q3p5jZ8QduKRN6K/tsLd5LO52tUsfvZaZDd4QX9W7g7kAYXKa/W57QfI
 hqoyznEaXeA8JKEkRMyRKUm9nKXckupDbNlKXVjdkDNSTLwpsnvXmCSYT+r5lFYEneOx
 URlbNxeSoBZzlLd0kYlCkdktv3gkWSMyAo9VDk1/bPVYfr79H3d/jV3koQY8f4oLred+
 e6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3QqzZZIr7UgbN3ZekMQ8h5fse6DD+fMoam6hjgppWE=;
 b=nN/F8d8zskAjiEn26miF2pxWTUTteQ7QjCYcBg8uIqrRCZxrAyMJo2aFALWcrBW58r
 uxaJpDVbdvvMY8giphMYywTm87PSGDesjd89L6nUDI7VUTMPTynVOKZvZthaZghm+O8e
 T5JfkPFL0VwDvFF+ZlZaTJC5bsC3B9rGd35ywReBSr5R7gKoPi9iSTZNeSYTU34gjUZU
 T1JnncSUYJCsc+bndbCkrT+z6peqtTqOaQtZdNV96RtdUJMSOzzquGGguUz5PlGF4/YX
 5cmkFDKt9bX6mjiRrRmVfiFGvAVfcuy6vvckv+vwryyak8LE2jgTE+7p6pBKz2POrYxu
 jEpQ==
X-Gm-Message-State: AOAM530wCWIzN0KOpK5h1IH5fQ6cDYyIcl389Byg/WrTykeKKiY/DxYg
 HGhxB0P7uWLfsjN53GmipyoaKI4oMPIxEQ==
X-Received: by 2002:a17:90b:380b:b0:1e6:67f6:f70c with SMTP id
 mq11-20020a17090b380b00b001e667f6f70cmr32040077pjb.120.1654570062385; 
 Mon, 06 Jun 2022 19:47:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 08/25] target/arm: Move exception_bkpt_insn to
 debug_helper.c
Date: Mon,  6 Jun 2022 19:47:17 -0700
Message-Id: <20220607024734.541321-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: nclog831B7fK

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
index 00a082d1f7..ae0009d1a3 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -413,35 +413,6 @@ void HELPER(exception_advsimdfp_access)(CPUARMState *env,
     raise_exception(env, EXCP_UDEF, syndrome, target_el);
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

