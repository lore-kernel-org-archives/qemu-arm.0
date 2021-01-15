Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp686662lfq;
        Fri, 15 Jan 2021 15:09:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxq5G7UTIhEoen8v39Z9iJAn1ZJNUSQyMotluFz0wz0BM6GhCAArXgzAqcC13FiMK8RlZeq
X-Received: by 2002:a25:d805:: with SMTP id p5mr21992066ybg.46.1610752199259;
        Fri, 15 Jan 2021 15:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610752199; cv=none;
        d=google.com; s=arc-20160816;
        b=btGmc2+dQAlqV7uVYnfpE5/aB+YYdLo0nI9+mcOa7WcWDjMGnx6vhPV1v7TV99buL8
         07a2c/QDIfatke54TkzW5nl5Jih38HL9RctJZ+kvqE2tB7Y3PVsg73qIGXvuHvx+6iCp
         eNuVxuoA/S2fV20mDR6EaT8Ot/xF0IrukONdXy38yHUZwrKNA2flhyno7g8xdmPnnwDU
         JAy7WyGQJD5T+7/p22UEvUjyJphoIKFVLUO//skhF8StKnJdbD/RJC3kmvyYnXUeEbzA
         bt5diUxRuuinc8jY4cLsG0BD2bxQJcBY/lMBXpXNKSwtQBeCTPFnfPaFyFhkrQCNXB+F
         fA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d+pOvzjLdVYp+MmYo9tDbbGKAe+YDrG7n/EDarHxK9g=;
        b=CyuaR7ZAa3UZFVBwWRI26nLBs2vgwbS2YacopecwCn0fdaPY6icZMNtvU4ruoa+veh
         ios15jPr5/4Ve/EDfFRG5UPRdUf64hwjCiy4omhKspT83ij717RW3p7lItAavZQ6Gj4J
         ebrNDtTjIqdbVwt0PId1+j/KWeqX9IZU6nD2PYtDWV1p/L7MM0/vGH0nDF3EL8/sQyoZ
         Q+jJh2cv0jd/I6xP/Azr+mzDDR7z/rKiBlUq8nRxXfBrr6EGiq3TgyitYtL7+6CY+u3y
         eImmgT13QjcVl0UqB3QWxVfOJQcTw3xVFn0GRFrKmV2i6A84fZXrkmrr82O0p6xX9HEL
         bxGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x0XQUAUs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si8935645ybe.97.2021.01.15.15.09.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 15:09:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x0XQUAUs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0YEA-0007hl-Kt
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 18:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsO-0003xd-Uh
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:30 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsF-0005JG-E7
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:28 -0500
Received: by mail-pj1-x102f.google.com with SMTP id y12so5897187pji.1
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 14:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d+pOvzjLdVYp+MmYo9tDbbGKAe+YDrG7n/EDarHxK9g=;
 b=x0XQUAUsc7bB+vP4BeTYRil5LWXgaCzg/miumn33qYnIpbwR0B06YQ3tHmXqOHdGKv
 EUecuDPif9BQWgX6TNmlmLfRrfR+GDSEjdKJNgUgLKM6mrAg6zhutkLlzqJ206o+8G29
 Q7b4Tq0QPTNei1l1FyuVR/IP9cZdfZanRyfaX9LpCb829mKAtH/H5RmxFbEX+I+Kd8RD
 trTx/5L1rY9vvjRQ36HN5LRVkaLclWbm/3qJt1Afg06vzZoLgMFTqKqsDs3dGtHiq9r6
 PF12XeazIhUAiLlkzVXDTwRFDZX4bg+oFylqc3gi//25pDh0Z7TvqFjErhPyRyk9BvML
 eWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+pOvzjLdVYp+MmYo9tDbbGKAe+YDrG7n/EDarHxK9g=;
 b=AQw1Xb0xmd8Z7URo66+nZUu/sPr5o3DktSJgeMuFXEfd1BMBXFxFhPnV24XOOdWEDl
 UDyoCG/FH9Gg+ObmvU1raM+6R4PWcAxfszSdPXw8o6EnHPJK5Prwm6lSuWeWcQs5W+u5
 CcueYPvP4x5OsnTQbqxzzQyu1wd9krRGXcDroaPdrH7GRLcCwhS1FdBLQLmEyxV3YicR
 BfuSQ8OXnqu2FZ7iiKFdkFphLkkhM6WJiRFsV5lgIEqMc/9sWfdhYORqK/E352hFvAnb
 TzSvzFDUXnJlGjj+vCXULcBTWTwi8KAXhGGzDW7uuuKx720AGdZVQvcApnpxGjZ27yz8
 C2uQ==
X-Gm-Message-State: AOAM5310LPsTxdm+ReUfYPyHLPpaqYmLnHk66MVRqHPnTJo2gK543Vsc
 KZyxJ2ViEvUqQhr5WzbgAGyxMQ==
X-Received: by 2002:a17:90a:5318:: with SMTP id
 x24mr13186645pjh.226.1610750838077; 
 Fri, 15 Jan 2021 14:47:18 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/21] linux-user/aarch64: Signal SEGV_MTEAERR for async
 tag check error
Date: Fri, 15 Jan 2021 12:46:42 -1000
Message-Id: <20210115224645.1196742-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: rIrYq++ACZkp

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h |  1 +
 linux-user/aarch64/cpu_loop.c      | 34 +++++++++++++++++++++---------
 target/arm/mte_helper.c            | 10 +++++++++
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 777fb667fe..18013e1b23 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,6 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTEAERR  8  /* Asynchronous ARM MTE error */
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 6867f0db2b..6160a401bd 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -72,6 +72,21 @@
         put_user_u16(__x, (gaddr));                     \
     })
 
+static bool check_mte_async_fault(CPUARMState *env, target_siginfo_t *info)
+{
+    if (likely(env->cp15.tfsr_el[0] == 0)) {
+        return false;
+    }
+
+    env->cp15.tfsr_el[0] = 0;
+    info->si_signo = TARGET_SIGSEGV;
+    info->si_errno = 0;
+    info->_sifields._sigfault._addr = 0;
+    info->si_code = TARGET_SEGV_MTEAERR;
+    queue_signal(env, info->si_signo, QEMU_SI_FAULT, info);
+    return true;
+}
+
 /* AArch64 main loop */
 void cpu_loop(CPUARMState *env)
 {
@@ -88,15 +103,13 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
-            ret = do_syscall(env,
-                             env->xregs[8],
-                             env->xregs[0],
-                             env->xregs[1],
-                             env->xregs[2],
-                             env->xregs[3],
-                             env->xregs[4],
-                             env->xregs[5],
-                             0, 0);
+            if (check_mte_async_fault(env, &info)) {
+                ret = -TARGET_ERESTARTSYS;
+            } else {
+                ret = do_syscall(env, env->xregs[8], env->xregs[0],
+                                 env->xregs[1], env->xregs[2], env->xregs[3],
+                                 env->xregs[4], env->xregs[5], 0, 0);
+            }
             if (ret == -TARGET_ERESTARTSYS) {
                 env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
@@ -104,7 +117,8 @@ void cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_INTERRUPT:
-            /* just indicate that signals should be handled asap */
+            /* Just indicate that signals should be handled asap. */
+            check_mte_async_fault(env, &info);
             break;
         case EXCP_UDEF:
             info.si_signo = TARGET_SIGILL;
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 153bd1e9df..d55f8d1e1e 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -565,6 +565,16 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
             select = 0;
         }
         env->cp15.tfsr_el[el] |= 1 << select;
+#ifdef CONFIG_USER_ONLY
+        /*
+         * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
+         * which then sends a SIGSEGV when the thread is next scheduled.
+         * This cpu will return to the main loop at the end of the TB,
+         * which is rather sooner than "normal".  But the alternative
+         * is waiting until the next syscall.
+         */
+        qemu_cpu_kick(env_cpu(env));
+#endif
         break;
 
     default:
-- 
2.25.1

