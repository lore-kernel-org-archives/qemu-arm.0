Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp633158lfo;
        Thu, 28 Jan 2021 15:03:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPn1FdySlwePfKg7GxDIaLhSlFLf8XM2PXJqFiqcbSAJ5bTItFXvf1wYvmkjuZdtF8eXKn
X-Received: by 2002:a25:9887:: with SMTP id l7mr2326801ybo.319.1611875033143;
        Thu, 28 Jan 2021 15:03:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611875033; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3A4J51lK3wWStY5KWx2zxweGtrzwGzAY1KIQngMtCTTbVuxt1fPIRbzATn7kh8Mvw
         C859tAhHq0ZoO0osA2sOQR0T+oT9Dn1oib3Boql9JWScZJqLc6pcKaHgh5ZE3UWNo6T+
         fJ1RLErY1sxLuGXRNahSuJ3g1m8b8P2mCBv0sr1dxo3voNF78OXUMj9QHKpUWSmXpweV
         QCOP6CrO19wVbtr7NL9SHD3+f4b1UwI0XdLXduZ/xBth4TN6G01hn5h93VOXbRnmfaSD
         n+naOCIiVjpzVjUdIocfzbTj4qvtVLMae7V4xdDAgufCNlTp2CE43pR9kJhzdUpjDcq8
         xOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j34etXVQZzqqkkDQF4UCutDcHqFcrqbhKldr7JT3Nmk=;
        b=we/gubkMKOVN7dQU8MKzOOvZptPMYw2VNo+vkx+TEIML3std48oNvzOgaVE8yEF61B
         pUOa6t9XecdO45hAuapWSNm8oLhvWMt5mbjQ4hy7PakndDtzoUOCbTfCSJECT+5YPTUZ
         6dO4l/dp9KYi6jgff5PkgRRQYZQ8gNdpgNXZBB4O2s1Gqo3er+iSLwRBMFtxJ05Ooxfu
         pNiFFQky7/lCWkuefsdhQWlzX8hn4Jxklvo2ZMNTP4+c8Ca+ilYCLU+FJxPsdBcLmuGl
         P0l9zX9wBjkIG3OWE2nHUz/OnZbV6T8ppC6tzMMuvrezXUF3TyrWx9vQl2DSBXH4K3nO
         tm4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mKXxstFi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si7731064ybo.280.2021.01.28.15.03.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 15:03:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mKXxstFi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5GKO-0002hf-I0
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 18:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzj-0005vQ-9m
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:31 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzX-0008EO-La
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:30 -0500
Received: by mail-pg1-x532.google.com with SMTP id o63so5270628pgo.6
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 14:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j34etXVQZzqqkkDQF4UCutDcHqFcrqbhKldr7JT3Nmk=;
 b=mKXxstFiDWv5XglClKNXc3avHws3W7vvEy0pq/qksBqkMgKnqQh4abpDjGT/Q4EnzI
 kedzqZB0H6eWrsv4OpgHMMwy+XLK2MtrOhoIXJhgI+CLNjIaognILbgDT4uuyKeKCiI2
 0kxckyiOGwvuoQC4PNspD4VTFx2IX9cquudXu2+zwkDkJ79qXHDXha+p1dSrYW6WNWm8
 Y+0kTLPW9UeULwKyaL4QYLXhnADhhKDoeEUTdL26Eg+p/1hZR3kaBcZ8kD8FvQRYnGv7
 s6a+aPAuYQY/FvD7ddXBFIjb07S1uD5U73VJQJqhry0Z16RMahGHQ4zCBaaA2Q6KxOsJ
 X8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j34etXVQZzqqkkDQF4UCutDcHqFcrqbhKldr7JT3Nmk=;
 b=thEwkpFt54CCSeYCr+obnJ+rn2Ui7nHgEuuKDUX1+1yj4qVF2c9CfpaneTS4LTBubF
 qkEij3OWGOW+6WXNpuTwfAHDNdSWcWGvLIseQvu6Q1yHIjauVfiQWmfMHS7c9VVyf8Zx
 tRdUnq0vd7a4ueOIJ3i8k2grD8WGURN+sHkmM+ymtv+bapiOYU9kTai4nuFVLGzi8Qhl
 YXXZX9NI1P9HMTbRx8v+Cu/z8P60E09WdqP3+KzCJs8dICgn9CjL4hIIp0RPNpRMRSoh
 a4rcYi533KprEIFVAOGvQW+RIG1cP1XXCerHMcqObvmuGKe9qK682VayfQ+kdQBsbXBM
 ItBQ==
X-Gm-Message-State: AOAM533jpVXaYNCdPwLOtH1P95KG5UuEuWYOLfGjUvYlTBAMezqHPOsn
 g4NIiKho3xw0Ky0cIkHZACW3cA==
X-Received: by 2002:a65:56cb:: with SMTP id w11mr1696082pgs.88.1611873737546; 
 Thu, 28 Jan 2021 14:42:17 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/23] linux-user/aarch64: Signal SEGV_MTEAERR for async
 tag check error
Date: Thu, 28 Jan 2021 12:41:38 -1000
Message-Id: <20210128224141.638790-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: feAUBi1olv5g

The real kernel collects _TIF_MTE_ASYNC_FAULT into the current thread's
state on any kernel entry (interrupt, exception etc), and then delivers
the signal in advance of resuming the thread.

This means that while the signal won't be delivered immediately, it will
not be delayed forever -- at minimum it will be delivered after the next
clock interrupt.

We don't have a clock interrupt in linux-user, so we issue a cpu_kick
to signal a return to the main loop at the end of the current TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h |  1 +
 linux-user/aarch64/cpu_loop.c      | 11 +++++++++++
 target/arm/mte_helper.c            | 10 ++++++++++
 3 files changed, 22 insertions(+)

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
index b6a2e65593..7c42f65706 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -164,6 +164,17 @@ void cpu_loop(CPUARMState *env)
             EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n", trapnr);
             abort();
         }
+
+        /* Check for MTE asynchronous faults */
+        if (unlikely(env->cp15.tfsr_el[0])) {
+            env->cp15.tfsr_el[0] = 0;
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            info._sifields._sigfault._addr = 0;
+            info.si_code = TARGET_SEGV_MTEAERR;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        }
+
         process_pending_signals(env);
         /* Exception return on AArch64 always clears the exclusive monitor,
          * so any return to running guest code implies this.
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

