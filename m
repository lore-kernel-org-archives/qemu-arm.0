Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp503046lfo;
        Wed, 3 Feb 2021 11:34:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydAPciBQ+SrTNdsVJM6dywyWfPVIMxsAZvmSaXJrFnkKVfX4Nh402k1YKNzC3BmDOUEmzt
X-Received: by 2002:a25:6c45:: with SMTP id h66mr6752359ybc.490.1612380875062;
        Wed, 03 Feb 2021 11:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612380875; cv=none;
        d=google.com; s=arc-20160816;
        b=JLKqOl73LIoVWUa/QtgnuYOMGw2k64iN2rjz4tBjxzTBmBZWov/rFmGZ7pmrVu9Wsp
         NtGAYPT+TS0oDSfDq1SNb/EXTX6/Jb4l8ZXB/NQnjIPFnVoJ6hiblbLgXbPs57t1mDkk
         UfdaYrGgY1h/oBT3lw5sGBf6MgmmEtItHEMuFYhfWTg6pbKRfPngK6dgsUnN8v0FNK1d
         g0PoLpGs2YKz9FlukoV7q7XvdFbrGUkOUwnrEBUfSdO3DrxQpoZpydEEQZG+AYT0Wxpj
         rEpM7PYmgnq6XwhRdf+i2lk4Fn/MQuvhsCNTiJKNKi8j/OzlNbTAkXft0XOpSK0R/2/+
         iuwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=974AXR02Bhg4aUVmYtdJXY9jOyaOxnirKIOpaZIiAKE=;
        b=egEJ0ncOz6LGBDDG+UmY/+4+nWIv2m7rzZkYgvjghaFqkidOJYUP39Jk3X4pBOq1C+
         YBnyfnFjXivcovOSQhIBzRlB3bnaA634fzmIhiZ2fM7ZwhWXnk/W+U0sBqDGzaDu4Qzj
         9ymMTZOcuKQohmXFF9E6zwbnRWgXIArUokIACxwcUSs8+BGG7r9oHRNl/hJy408dnOXH
         1cNf+rpTvgNY/CbFw2zIyOnlfGssnuF41D4z+nz1Zocp1siuA7IC4k9Wl7boyr47506M
         IUEHDAYbObM5o1WkajDAgT7c1AUqWdweFmzZ+1ax4DoJEcSTdQ1AyYTa8u5kpJVNyK9Z
         lt0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uC3VrUVi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si3400946yba.421.2021.02.03.11.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uC3VrUVi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Nv7-00020o-F8
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOz-0007bi-IO
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:21 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001ps-I9
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:21 -0500
Received: by mail-pg1-x532.google.com with SMTP id r38so355196pgk.13
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=974AXR02Bhg4aUVmYtdJXY9jOyaOxnirKIOpaZIiAKE=;
 b=uC3VrUVigIqQnyoERevzYJv11v1YEPmymjefcoiQU4YtsJgR40QntKJjVi2JQVHfbN
 PvdhXM8za6ZbZK6g4fc24ntgNfdRmLcCMIyuS7G2Wwb9Zaidvyph4HEDx5IyjMmsAvd8
 p48X1znAvA+jzuH/4kguaM8UVHcrReJexgYq6Xl2rSUSp9cLF7P3AKJg+bB3dSGIf1Hw
 wu53zS9ZjT099cteb24Eac1rrdatfxdIfxv4fa341RAGKTc9Q1GBsyiG9np/L2nFwYxZ
 f57JUfJlvfxwZpAulY0oxjCr+6sAx1HtUXOjB7tRKANdDVJ4+kfXLy70iVOKAQUDHgdW
 H50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=974AXR02Bhg4aUVmYtdJXY9jOyaOxnirKIOpaZIiAKE=;
 b=O/zQd28bhnU7FEm9k1B8FAjnmF0Cfw0ayEYNDtbAy5OWXf55IuFQn6bLDrm/JecqYS
 vF58S+YyiFG36ztpgRzl6T4CtpvVMqeppbFQu5R75/oBEcgqscYe+zVQdNyoVdbVXNU5
 x1iyCmR1q3JxRi7HP0isc2yarkYzxKF7bZcJp5nQHKBImEXD/qcMtLNeLrlW8dgcY2CJ
 k0g4WN/CcKsqCVSXMRMk3cXDad1IZzEDx61iLKrIiEt2l9vBK8bYi1OQIXzyUunBhuEq
 Fw5/4ScD5EePF0n1MEy2QN5lVQE0lDAj6Ga6RhpWef380tTIuWqoFSDIjRmhdDxdpfZL
 cSiA==
X-Gm-Message-State: AOAM530c0TqCzEn3eNWF7Jkj7dYm3j21a9LL8jefCdhUSsKKeS56qe1X
 1djN0KVee7822RL+/53C3GfK2Q==
X-Received: by 2002:a63:5805:: with SMTP id m5mr5046724pgb.352.1612378870804; 
 Wed, 03 Feb 2021 11:01:10 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/31] linux-user/aarch64: Signal SEGV_MTEAERR for async
 tag check error
Date: Wed,  3 Feb 2021 09:00:07 -1000
Message-Id: <20210203190010.759771-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
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
X-TUID: rXZniTYWei0N

The real kernel collects _TIF_MTE_ASYNC_FAULT into the current thread's
state on any kernel entry (interrupt, exception etc), and then delivers
the signal in advance of resuming the thread.

This means that while the signal won't be delivered immediately, it will
not be delayed forever -- at minimum it will be delivered after the next
clock interrupt.

We don't have a clock interrupt in linux-user, so we issue a cpu_kick
to signal a return to the main loop at the end of the current TB.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

