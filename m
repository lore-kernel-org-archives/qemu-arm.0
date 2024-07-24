Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3360686njc;
        Wed, 24 Jul 2024 15:07:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4GujNiCWVUOaWPM0fJ3aWsCf3gM6s/Ie5Lgn5xzmGbHvI2ibAtRO+ltdpai/8NygDzCDpRqKcuqC1uPGrRbpgwBjkLUi3
X-Google-Smtp-Source: AGHT+IEHgl/lHL3EmM5iE5yaegzDHGyLW+LekWl9oknt/3WmHL/YTg8bAbCGmhJQYL/Pe3ZeIes2
X-Received: by 2002:a05:6830:610b:b0:704:46da:5fa0 with SMTP id 46e09a7af769-70932124889mr63049a34.10.1721858843398;
        Wed, 24 Jul 2024 15:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721858843; cv=none;
        d=google.com; s=arc-20160816;
        b=moZdJHrNNwMMyz+u+NB2AOkbRd660eRU1hIe5SPv8vj0UATfYMC4n1mvP7kVbNelUZ
         ORC0EKB+CCfqwdl6+ptWmwWoQJJBwSRgS75PIKckboRv7aQq7f0ervlMKKdUs/954lfX
         Y5/shgW+ezS2ch+hMrT1WELYAA9cteaQ2tsqE3KBvqvzuzaS+OFDlItIA6GoxAZrVv+C
         0UZrOQ2CRVSiyBV9VYq/tyS7tpfKJCgOr8WYuqN0xW5gncXMUj23hLfVCltQrIXvb5Yz
         gIeIkdDiAfsYYDikJXH/U+QvcMEU29xG3xcBW4qqhYnC/szAaQOF3sP2gSrz1G+E807A
         2x+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iERzhBKroDxEdhIs7F3pdJn/htP75xFz5hRc3MKZk4Y=;
        fh=NIRSznYUZSKfnFB4CeEPoC5FT12HOLqXvjgLFu7CFM4=;
        b=a4aVpVfI46bjRdd/eR++Q408AB8GAfEdDmvMNrc9hUED3vfb6EGqKiUA9iL85ueHnD
         hoAKr0EORLEXwQpUWxHGrifZ2cH9vRiOI1E7i8r6Qt5rh5WpvgzTW3jBSYxYgz1OKAD6
         etOiqdmh4Z8xMLqfkBfK6nJ7Pio21rJnC4nf8E/hFOB2AH0WtAZ9PBE366Nrdp5VME8b
         O6GQ6w9Kdnu4ACuG1744DSyYkqkfEICJLzOY7ec/Dhd5Dib1ickXRBKlQxRAw9u+uZ+F
         0RPkUvCoG2bK6RT3+/KixrMZjjYajcjFekEI97u/DTw9UhG74KFcn/S2PpJiMxKLFsKb
         crTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=UxYhLUdc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7446663si17036885a.315.2024.07.24.15.07.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 15:07:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=UxYhLUdc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWk8C-0001Li-1I; Wed, 24 Jul 2024 18:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7x-0000OU-JX
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:29 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7v-0006Zy-29
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:29 -0400
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-808a8c90f5bso12411439f.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 15:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721858786; x=1722463586;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iERzhBKroDxEdhIs7F3pdJn/htP75xFz5hRc3MKZk4Y=;
 b=UxYhLUdcHd6n7SKHosDRcGhbIN02cEgr/b+kz/A4/DN//3Her9CfZidjXvN6W1DIUl
 hQKq0i21JNCH9ZmsOZBD6XL1mxGXZM5A/KsmP22JGxkVY5UCcvSnUcFWuSA+QTmDOwQ5
 G+aA6ienxzdkkFmz2ipgdCd/4tahNida+rhUKnTL35XAr9ii7sJyfBpH6yq5d2HlUHz3
 OmvIi/bIXXIAitxMPwHkTjytHg8Ob4GwOtoJX0OLi4mcq9mzeVZA5zypprPtpIAo/gMp
 NAqqOJc+wgaHwZ9Sr+8nADIWi+zxstFh/kjcPijmWkv/4AAac/OPQnmPbbtcWcRYNtbM
 Vlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721858786; x=1722463586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iERzhBKroDxEdhIs7F3pdJn/htP75xFz5hRc3MKZk4Y=;
 b=mSKLEEx9U8cSb2a+7FBECdb+7jgyGILRuDEOMIN2i+HbMC9g3eH+IOQJBIox5B9s/T
 I2eWn0wDojn0ncxxiLwEO9Lq9UGpCgt1uKHNCWqMhs2ZFIOHwEdn93t+BGp8gSvoyWgJ
 inR+LMfqq4FYDoeyjUGajddYcLCpFxm7uop+6QI1AramMd4NWYamnRx3NWEaXa0RlQ7D
 d0ZW2TcS7zKWurkp82wrkjBxMOHUjVTsb9fjcYljTPTf8viujTWH7lvD7Lh+0tk2m/PC
 33pJjbZD8Uj4ovv0vuF3hlGriLpOWkeBOH7fMArpk0rXfkpU/oN10Q+51SKS+EOylak1
 ZchQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5rWbDtD+fMu0RURGu1/auqP6zG1s7tWRLHzaIQSijGCaLfdepMmUkz3RAKZXC9a/P/gU4ZwT+Lo4HFvs0Yiyin8q0
X-Gm-Message-State: AOJu0Yxo2yvE7W7jUHAga6Hq6aNzgEJnPJhcQu9FBbsSeEomRyKwbfsg
 S+O9OF5ZBv01eKFUyL2rYR6SBs8TksM1Bg1gSWvvn2GhuU469sWhkOkwDzpi9uw=
X-Received: by 2002:a05:6602:1404:b0:817:49a2:fcf7 with SMTP id
 ca18e2360f4ac-81f7e4dce37mr15371939f.17.1721858785765; 
 Wed, 24 Jul 2024 15:06:25 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c29fa983f8sm10086173.47.2024.07.24.15.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 15:06:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>, Ajeet Singh <itachis@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 08/15] bsd-user:Add AArch64 improvements and signal handling
 functions
Date: Wed, 24 Jul 2024 16:04:41 -0600
Message-ID: <20240724220449.10398-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
References: <20240724220449.10398-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gR9/xPqakSU7

From: Stacey Son <sson@FreeBSD.org>

Added get_ucontext_sigreturn function to check processor state ensuring current execution mode is EL0 and no flags
indicating interrupts or exceptions are set.
Updated AArch64 code to use CF directly without reading/writing the entire processor state, improving efficiency.
Changed FP data structures to use Int128 instead of __uint128_t, leveraging QEMU's generic mechanism for referencing this type.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Ajeet Singh <itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240707191128.10509-9-itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/aarch64/signal.c             | 20 +++++++++++++++++++-
 bsd-user/aarch64/target_arch_cpu.h    |  7 ++-----
 bsd-user/aarch64/target_arch_reg.h    |  2 +-
 bsd-user/aarch64/target_arch_signal.h |  2 +-
 bsd-user/qemu.h                       |  3 +++
 5 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/bsd-user/aarch64/signal.c b/bsd-user/aarch64/signal.c
index 13faac8ce60..6bc73a798f3 100644
--- a/bsd-user/aarch64/signal.c
+++ b/bsd-user/aarch64/signal.c
@@ -21,7 +21,7 @@
 #include "qemu.h"
 
 /*
- * Compare to sendsig() in sys/arm64/arm64/machdep.c
+ * Compare to sendsig() in sys/arm64/arm64/exec_machdep.c
  * Assumes that target stack frame memory is locked.
  */
 abi_long set_sigtramp_args(CPUARMState *regs, int sig,
@@ -117,3 +117,21 @@ abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int srflag)
 
     return err;
 }
+
+/* Compare to sys_sigreturn() in  arm64/arm64/machdep.c */
+abi_long get_ucontext_sigreturn(CPUARMState *regs, abi_ulong target_sf,
+                                abi_ulong *target_uc)
+{
+    uint32_t pstate = pstate_read(regs);
+
+    *target_uc = 0;
+
+    if ((pstate & PSTATE_M) != PSTATE_MODE_EL0t  ||
+        (pstate & (PSTATE_F | PSTATE_I | PSTATE_A | PSTATE_D)) != 0) {
+        return -TARGET_EINVAL;
+    }
+
+    *target_uc = target_sf;
+
+    return 0;
+}
diff --git a/bsd-user/aarch64/target_arch_cpu.h b/bsd-user/aarch64/target_arch_cpu.h
index 5c150bb7e9c..b288e0d069b 100644
--- a/bsd-user/aarch64/target_arch_cpu.h
+++ b/bsd-user/aarch64/target_arch_cpu.h
@@ -48,7 +48,6 @@ static inline void target_cpu_loop(CPUARMState *env)
     CPUState *cs = env_cpu(env);
     int trapnr, ec, fsc, si_code, si_signo;
     uint64_t code, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
-    uint32_t pstate;
     abi_long ret;
 
     for (;;) {
@@ -88,18 +87,16 @@ static inline void target_cpu_loop(CPUARMState *env)
              * The carry bit is cleared for no error; set for error.
              * See arm64/arm64/vm_machdep.c cpu_set_syscall_retval()
              */
-            pstate = pstate_read(env);
             if (ret >= 0) {
-                pstate &= ~PSTATE_C;
+                env->CF = 0;
                 env->xregs[0] = ret;
             } else if (ret == -TARGET_ERESTART) {
                 env->pc -= 4;
                 break;
             } else if (ret != -TARGET_EJUSTRETURN) {
-                pstate |= PSTATE_C;
+                env->CF = 1;
                 env->xregs[0] = -ret;
             }
-            pstate_write(env, pstate);
             break;
 
         case EXCP_INTERRUPT:
diff --git a/bsd-user/aarch64/target_arch_reg.h b/bsd-user/aarch64/target_arch_reg.h
index 5c7154f0c18..b53302e7f7a 100644
--- a/bsd-user/aarch64/target_arch_reg.h
+++ b/bsd-user/aarch64/target_arch_reg.h
@@ -31,7 +31,7 @@ typedef struct target_reg {
 } target_reg_t;
 
 typedef struct target_fpreg {
-    __uint128_t     fp_q[32];
+    Int128          fp_q[32];
     uint32_t        fp_sr;
     uint32_t        fp_cr;
 } target_fpreg_t;
diff --git a/bsd-user/aarch64/target_arch_signal.h b/bsd-user/aarch64/target_arch_signal.h
index df171733166..bff752a67ab 100644
--- a/bsd-user/aarch64/target_arch_signal.h
+++ b/bsd-user/aarch64/target_arch_signal.h
@@ -49,7 +49,7 @@ struct target_gpregs {
 };
 
 struct target_fpregs {
-    __uint128_t fp_q[32];
+    Int128      fp_q[32];
     uint32_t    fp_sr;
     uint32_t    fp_cr;
     uint32_t    fp_flags;
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 9d2fc7148eb..3736c417860 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -17,6 +17,9 @@
 #ifndef QEMU_H
 #define QEMU_H
 
+#include <sys/param.h>
+
+#include "qemu/int128.h"
 #include "cpu.h"
 #include "qemu/units.h"
 #include "exec/cpu_ldst.h"
-- 
2.45.1

