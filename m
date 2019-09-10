Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5573657wrp;
        Tue, 10 Sep 2019 07:50:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqys4vZ7V8tsc9Va5iD7rSTnd47ZCw77AJi5VMYyUb78PY6bfcIsSyq2Vwx+rovHJNFlbIiL
X-Received: by 2002:a37:a310:: with SMTP id m16mr29521143qke.123.1568127013153;
        Tue, 10 Sep 2019 07:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568127013; cv=none;
        d=google.com; s=arc-20160816;
        b=WYYnT+dw1lZZniBQIH7LHl/rnuu5DDoHTRxFj4LwEEtkxLKmFLhIi9ki0A4MGhHGAx
         wpyvHyin+lKJ73BJ9zpuyiAi0NHljiIaMi7fpy/1aE0yQ2eKJ7yfQ6vdk/1QkJOzp2jW
         zXQ2VfeIswalqQ3OIvTrFs+J9DXI+593EPCSgJhJRJoqVbFdmXuBgDhmfvNhOn7aFNB2
         pxJLriZcb+0T5QZaAQ+dJ5kzsTmE2ZmU+Qh3Id0q+StBXWf3HtgB97m8e88vkhLTDHn+
         bzCFQSzdWLKaQr5y2wOcmgdftsGYfYgtdsyqX8M9CL7HVH6vb/uto1YEFfKZ6XAZuA6B
         Se7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fZA5qZtHref6EES7glsBu8W4zydJFLjuwr0G2I/qEek=;
        b=q+z9+yUWynaFQvTW7rEVdPqFf/K4BVdw/YXDKFP3acKnbR0yEV7E5AtIawB9B6Z6CM
         PSxb5k93tfSURnPpBXNN4Xp1BkF7+yZoQfCX0VzEgBpjtSmfrZ/HT680vZhfwzZlKJZp
         VOU4l/ZGDF8uMrEJnXQg7EL7q6jOr60FK3ru77D6R2qIj1PTWEQt1C2/He4fAgm7ePSR
         YFvpZX0a+Bj1zC7BpApps0TBh+yKHzWtq3dzNcQQSa239CqMM5gFwaxGnfmjuQZJH7AH
         H6roMVwyj9JIuBKgmJGTlaHaeX77oLj7EVvODNBRBwBPc9/uFZxwojO1HEYsmhSqyMrx
         0DaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IX1Bn+L7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d28si12391001qtc.320.2019.09.10.07.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IX1Bn+L7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7hT9-0001rJ-Bn
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNm-0005QE-A7
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNk-000500-Qi
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:38 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44440)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNk-0004zP-LR
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:36 -0400
Received: by mail-wr1-x443.google.com with SMTP id k6so8680346wrn.11
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fZA5qZtHref6EES7glsBu8W4zydJFLjuwr0G2I/qEek=;
 b=IX1Bn+L75xsE7wR97ujQGTwx7gERV6QZ/5uUFlJkg4cM3TAIGRuAZ2f8MUOuzmaH/l
 7p/3UeB5SACUV7ULkrYPZf4l2JC6jj9Ia/1JBrdu/hhdk1juMbf8qBwLTe92d8CIm2NH
 WqRilXdkGprmhh3ov14IQ7t9hsiz58myU8OUi1MYToYLLjsE8dU5/PPSjzbfSGiJadSs
 odf3GudeX81c3LIKoUY4DDPGTQ+v4lqfc74WKRh2/Rk+9uigZLmqKWZKFn9C/RpQPWBT
 H58yH/v9YQlvo4v5LyWy2MbX0gUfHO+LhyDje0OVd5RAKY69sFsgMk0+YMYgWXUZ/p/I
 WqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fZA5qZtHref6EES7glsBu8W4zydJFLjuwr0G2I/qEek=;
 b=o9WH5Dmmwz21GMdtf6HxbNjVuRAoLvOjIy3WK2mqBrCR48LC3kBRQtqtYC9jK0v6zo
 fmmOZjgroDAklJ+/rOH5i8yNKspZryvOom7tk8Wo84E+Q9Ahd6oGqfjZQSb3pi757MM1
 tqvz1b0kzPRRRZP98e3BxS1rSvy23lJTHdAbWhkRyolLZP5hiHDE15etBhFlozqHGpBb
 d+kK1RWzmxzKXkXzh4oKPE7BgWgnuML0yegbuwhFbM5bfc7DrwJzDfUzxlE5DbjqNDxD
 v36wnTlCHwycrjyCw7Zm8K4Dm/E+beViJHNy0imuHtOeJmX2ysi3YJ3+7s0l7OYf6Rn5
 7q9w==
X-Gm-Message-State: APjAAAWXkNPpN1OhX4hl3SrvPCs3WuaXyTGC2nz5zzpew/KocTbpHAJP
 AKeAhrc5wM7JNY9ttmBMniTu4iyaOtoKMQ==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr18411913wrn.352.1568126675477; 
 Tue, 10 Sep 2019 07:44:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:19 +0100
Message-Id: <20190910144428.32597-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 04/13] target/arm/arm-semi: clean up TaskState*
 usage in non-user-only code
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WnQem2uMvJmQ

The semihosting code has to build for both user-only and softmmu;
for user-only it needs access to the TaskState struct that holds
per-thread information. For softmmu we don't need it.

Currently the softmmu set_swi_errno() takes a CPUARMState *,
which it doesn't use, and the 'ts' variable in do_arm_semihosting()
is set to either be a TaskState* or a CPUARMState* depending on
whether CONFIG_USER_ONLY is set, so that the callsite always
passes 'ts'. Since we don't actually need the CPUARMState *,
we can instead make set_swi_errno() always take a TaskState*,
by providing a local-to-this-file dummy typedef for the softmmu
case and setting ts to NULL for softmmu.

This will make it easier to have other functions which pass
through the TaskState*, because now they can have the same
prototype regardless of whether they're CONFIG_USER_ONLY or not.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 48 ++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 05491bf5248..ce3ba554bef 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -36,6 +36,13 @@
 #else
 #include "exec/gdbstub.h"
 #include "qemu/cutils.h"
+
+/*
+ * Dummy typedef so that we can have functions that take
+ * a TaskState* even if we're building for softmmu; in that
+ * case the argument will always be NULL.
+ */
+typedef void TaskState;
 #endif
 
 #define TARGET_SYS_OPEN        0x01
@@ -213,27 +220,24 @@ static GuestFD *get_guestfd(int guestfd)
     return gf;
 }
 
-#ifdef CONFIG_USER_ONLY
-static inline uint32_t set_swi_errno(TaskState *ts, uint32_t code)
-{
-    if (code == (uint32_t)-1)
-        ts->swi_errno = errno;
-    return code;
-}
-#else
+#ifndef CONFIG_USER_ONLY
 static target_ulong syscall_err;
 
-static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
-{
-    if (code == (uint32_t)-1) {
-        syscall_err = errno;
-    }
-    return code;
-}
-
 #include "exec/softmmu-semi.h"
 #endif
 
+static inline uint32_t set_swi_errno(TaskState *ts, uint32_t code)
+{
+    if (code == (uint32_t)-1) {
+#ifdef CONFIG_USER_ONLY
+        ts->swi_errno = errno;
+#else
+        syscall_err = errno;
+#endif
+    }
+    return code;
+}
+
 static target_ulong arm_semi_syscall_len;
 
 static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
@@ -374,13 +378,15 @@ target_ulong do_arm_semihosting(CPUARMState *env)
     int nr;
     uint32_t ret;
     uint32_t len;
-#ifdef CONFIG_USER_ONLY
-    TaskState *ts = cs->opaque;
-#else
-    CPUARMState *ts = env;
-#endif
+    TaskState *ts;
     GuestFD *gf;
 
+#ifdef CONFIG_USER_ONLY
+    ts = cs->opaque;
+#else
+    ts = NULL;
+#endif
+
     if (is_a64(env)) {
         /* Note that the syscall number is in W0, not X0 */
         nr = env->xregs[0] & 0xffffffffU;
-- 
2.20.1

