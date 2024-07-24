Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3360537njc;
        Wed, 24 Jul 2024 15:07:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSyAULhj42W8ozyqTd1iaWeZDMiuxYtg1QW6YADkKs/SkYQIGuF9Ncet4ItkQrXfNd8JpUhNrWra3Wg0r/YXxLw6ZoI/Ih
X-Google-Smtp-Source: AGHT+IErAXaQjUaFcRwziv87hBrPeP3P1UM96N0y9JDxgOxXoL4hwNm3YliE46eXTQT60req9Mgq
X-Received: by 2002:a05:6214:1c07:b0:6b5:80de:987f with SMTP id 6a1803df08f44-6bb3c887f1emr20944956d6.3.1721858820566;
        Wed, 24 Jul 2024 15:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721858820; cv=none;
        d=google.com; s=arc-20160816;
        b=B7IVGb4YKXCzmLdQC4Dn1mwmvT+P9GEG4cAGTxZ5HtDLJij3vo55MBC7Ea/rqtG9/3
         E1FDUHQexmvdb1CnCh/ZCM8eNi56CD8EJ7OYn399Yy1Ty3IXjPWWfdMnmfnq6z2s9Hj6
         RR1MDupOy1T00u3Kl7agreYghzkKqXRv4uhauFBAtZPLEYuqeTZYfG+Ec0BJvGlXSL7b
         nkRx7+xJrCAM15DF0TSoscdGarDL41TPwgimblDwr4E7WwEXu/0v11wMHGzlNdXj/VuP
         MIKKzIa3eJ1+qJpb1EQEXzorlbEJkuy+CbVHwWk5B5t2uWPE30aIXtrbOR9asGuJT50U
         Ybkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9RgA/sQrSqu0rivwfkVX+vpcUdtyuMUfMJ/jiDAmIes=;
        fh=K5kqaJTZccB/9znrH9pXDnPNLuyiHHXKOURL7vodvgE=;
        b=qWuHBImAcGYSimPUh7/BmU83r1+G6In/+vtkHJm6hnvscca27Lp2MdWdNXkimeGbV7
         85qGRSV3K8d/wTKZGvOD9HZjfn1j9kjOSDYBRoQQZBJRmNQrVG3/FFnoJLCb1C7lDs7X
         pdnIcedUQfFREzPCyd1qr1UVQUsdDk+m+fGwPSyIOJBHYfdBBHaEyya8BDLhlIx+qfJF
         /8jeoHwMT4b773gB+uHA9yBg1K1BRhoS1br8Pl1asvbuyuEfNt/MBbdktS1TBXG0M369
         8LC1SBIAoPteklshlj2SS32LvBT63i8srolEUvw7eWLKm1WYjnF74ph8vy1hbhwdBNZ0
         B3iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=PjL1+Jto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fa86ed0si1024876d6.262.2024.07.24.15.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 15:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=PjL1+Jto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWk7t-00008E-1g; Wed, 24 Jul 2024 18:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7r-00007B-HJ
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:23 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7n-0006Ql-Me
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:23 -0400
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-81477e9fd89so10703139f.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 15:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721858777; x=1722463577;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9RgA/sQrSqu0rivwfkVX+vpcUdtyuMUfMJ/jiDAmIes=;
 b=PjL1+JtoOqmWBg4bOQLNtGvS9kFOZRCqd6ApWkleJf0+Gw8AP9t09GIlpm3HwmAhzE
 FB9nnNgba9OqXT0nBZq3O0Jqy7Y5cmwPLhb5REP/OoQA15fiBioJnrk5dTt2Mm6XpxjE
 CP2JMArQYnmsNCq/y0f7i1ZtL4xyWB84LpvYhVhimBrw2vUxxAm+PmXjhAKLX1di9FIy
 nYHK/r3AesDdfAllrWnf5YZXC5oGXOIbPPBjfBDVdBmm8nPTTtErjDRY+DW8Inrab0jo
 JBVRKxU6ozygfl+33jYMa8+4OoJVax//AjAye6n5LcKaVEF515A6/QdU63gq0qePLPuG
 T/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721858777; x=1722463577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9RgA/sQrSqu0rivwfkVX+vpcUdtyuMUfMJ/jiDAmIes=;
 b=QeWk3OlHLjuIFyDitipsNMdyFbxXKk6yVUSszCazzDL6x7mPcMMaKVt33KWiQQXYfH
 PmZsZijUrINkDQg09HddySMN3x7biV302mnVjJHUfGVaZNzBM4++LL6yftQeQ2UFGX5e
 fjknpMnbE8iNCsBEeO6u2tBq0CVIC1bXpgqmouJ5Hx7/+zVUF08DLlbXuTpZAexhKYwq
 /cqnP8vXQgzh/lHmjF4zurwVLZzSwpJTVyMeagQDdL8S69TEULVxLCTOZY17U936+PfS
 Ls/W4lyDQMfd3/Y5/OHsZDlmyjTdozpPSkVHv+V6tkdJVmqpaUUJwyjcaLnni9Ng77N4
 V6gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvF+9zpp/w0ViLJC0ZCrrE/KuLojBlWPIKIS3vUwr8bfKY2Z6M4p2/0v62996v23o2j1Kymf6VVIZW9LSaFOjJGDXV
X-Gm-Message-State: AOJu0YyPwok+AqxVsKEGZkvm9n8cI8DAT18K7Dp2PAgJkCKx6ROgQzCl
 ejzm94VRNO04v0VT6FQ0co6ynbX2Auicd5gtVv5g7LzXefEUbSDz/nKLINBsiD4=
X-Received: by 2002:a05:6602:6395:b0:7f8:c131:3bde with SMTP id
 ca18e2360f4ac-81f72f47f01mr239482839f.5.1721858777134; 
 Wed, 24 Jul 2024 15:06:17 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c29fa983f8sm10086173.47.2024.07.24.15.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 15:06:16 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>, Ajeet Singh <itachis@FreeBSD.org>,
 Sean Bruno <sbruno@freebsd.org>, Jessica Clarke <jrtc27@jrtc27.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/15] bsd-user:Add CPU initialization and management functions
Date: Wed, 24 Jul 2024 16:04:34 -0600
Message-ID: <20240724220449.10398-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
References: <20240724220449.10398-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
X-TUID: Sce0Tvg5oHlj

From: Stacey Son <sson@FreeBSD.org>

Added function to initialize ARM CPU and check if it supports 64-bit mode.
Implemented CPU loop function to handle exceptions and emulate execution of instructions.
Added function to clone CPU state to create a new thread.
Included AArch64 specific CPU functions for bsd-user to set and receive thread-local-storage
value from the tpidr_el0 register.
Introduced structure for storing CPU register states for BSD-USER.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Ajeet Singh <itachis@FreeBSD.org>
Co-authored-by: Kyle Evans <kevans@freebsd.org>
Co-authored-by: Sean Bruno <sbruno@freebsd.org>
Co-authored-by: Jessica Clarke <jrtc27@jrtc27.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240707191128.10509-2-itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/aarch64/target_arch_cpu.c |  31 +++++
 bsd-user/aarch64/target_arch_cpu.h | 192 +++++++++++++++++++++++++++++
 bsd-user/aarch64/target_syscall.h  |  51 ++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 bsd-user/aarch64/target_arch_cpu.c
 create mode 100644 bsd-user/aarch64/target_arch_cpu.h
 create mode 100644 bsd-user/aarch64/target_syscall.h

diff --git a/bsd-user/aarch64/target_arch_cpu.c b/bsd-user/aarch64/target_arch_cpu.c
new file mode 100644
index 00000000000..b2fa59efaf6
--- /dev/null
+++ b/bsd-user/aarch64/target_arch_cpu.c
@@ -0,0 +1,31 @@
+/*
+ * ARM AArch64 specific CPU for bsd-user
+ *
+ * Copyright (c) 2015 Stacey Son
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "target_arch.h"
+
+/* See cpu_set_user_tls() in arm64/arm64/vm_machdep.c */
+void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
+{
+    env->cp15.tpidr_el[0] = newtls;
+}
+
+target_ulong target_cpu_get_tls(CPUARMState *env)
+{
+    return env->cp15.tpidr_el[0];
+}
diff --git a/bsd-user/aarch64/target_arch_cpu.h b/bsd-user/aarch64/target_arch_cpu.h
new file mode 100644
index 00000000000..5c150bb7e9c
--- /dev/null
+++ b/bsd-user/aarch64/target_arch_cpu.h
@@ -0,0 +1,192 @@
+/*
+ *  ARM AArch64 cpu init and loop
+ *
+ * Copyright (c) 2015 Stacey Son
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef TARGET_ARCH_CPU_H
+#define TARGET_ARCH_CPU_H
+
+#include "target_arch.h"
+#include "signal-common.h"
+#include "target/arm/syndrome.h"
+
+#define TARGET_DEFAULT_CPU_MODEL "any"
+
+static inline void target_cpu_init(CPUARMState *env,
+    struct target_pt_regs *regs)
+{
+    int i;
+
+    if (!(arm_feature(env, ARM_FEATURE_AARCH64))) {
+        fprintf(stderr, "The selected ARM CPU does not support 64 bit mode\n");
+        exit(1);
+    }
+    for (i = 0; i < 31; i++) {
+        env->xregs[i] = regs->regs[i];
+    }
+    env->pc = regs->pc;
+    env->xregs[31] = regs->sp;
+}
+
+
+static inline void target_cpu_loop(CPUARMState *env)
+{
+    CPUState *cs = env_cpu(env);
+    int trapnr, ec, fsc, si_code, si_signo;
+    uint64_t code, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
+    uint32_t pstate;
+    abi_long ret;
+
+    for (;;) {
+        cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+        cpu_exec_end(cs);
+        process_queued_cpu_work(cs);
+
+        switch (trapnr) {
+        case EXCP_SWI:
+            /* See arm64/arm64/trap.c cpu_fetch_syscall_args() */
+            code = env->xregs[8];
+            if (code == TARGET_FREEBSD_NR_syscall ||
+                code == TARGET_FREEBSD_NR___syscall) {
+                code = env->xregs[0];
+                arg1 = env->xregs[1];
+                arg2 = env->xregs[2];
+                arg3 = env->xregs[3];
+                arg4 = env->xregs[4];
+                arg5 = env->xregs[5];
+                arg6 = env->xregs[6];
+                arg7 = env->xregs[7];
+                arg8 = 0;
+            } else {
+                arg1 = env->xregs[0];
+                arg2 = env->xregs[1];
+                arg3 = env->xregs[2];
+                arg4 = env->xregs[3];
+                arg5 = env->xregs[4];
+                arg6 = env->xregs[5];
+                arg7 = env->xregs[6];
+                arg8 = env->xregs[7];
+            }
+            ret = do_freebsd_syscall(env, code, arg1, arg2, arg3,
+                    arg4, arg5, arg6, arg7, arg8);
+            /*
+             * The carry bit is cleared for no error; set for error.
+             * See arm64/arm64/vm_machdep.c cpu_set_syscall_retval()
+             */
+            pstate = pstate_read(env);
+            if (ret >= 0) {
+                pstate &= ~PSTATE_C;
+                env->xregs[0] = ret;
+            } else if (ret == -TARGET_ERESTART) {
+                env->pc -= 4;
+                break;
+            } else if (ret != -TARGET_EJUSTRETURN) {
+                pstate |= PSTATE_C;
+                env->xregs[0] = -ret;
+            }
+            pstate_write(env, pstate);
+            break;
+
+        case EXCP_INTERRUPT:
+            /* Just indicate that signals should be handle ASAP. */
+            break;
+
+        case EXCP_UDEF:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
+            break;
+
+
+        case EXCP_PREFETCH_ABORT:
+        case EXCP_DATA_ABORT:
+            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
+            ec = syn_get_ec(env->exception.syndrome);
+            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
+
+            /* Both EC have the same format for FSC, or close enough. */
+            fsc = extract32(env->exception.syndrome, 0, 6);
+            switch (fsc) {
+            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_MAPERR;
+                break;
+            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
+            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_ACCERR;
+                break;
+            case 0x11: /* Synchronous Tag Check Fault */
+                si_signo = TARGET_SIGSEGV;
+                si_code = /* TARGET_SEGV_MTESERR; */ TARGET_SEGV_ACCERR;
+                break;
+            case 0x21: /* Alignment fault */
+                si_signo = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            force_sig_fault(si_signo, si_code, env->exception.vaddress);
+            break;
+
+        case EXCP_DEBUG:
+        case EXCP_BKPT:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
+            break;
+
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
+
+        case EXCP_YIELD:
+            /* nothing to do here for user-mode, just resume guest code */
+            break;
+        default:
+            fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
+                    trapnr);
+            cpu_dump_state(cs, stderr, 0);
+            abort();
+        } /* switch() */
+        process_pending_signals(env);
+        /*
+         * Exception return on AArch64 always clears the exclusive
+         * monitor, so any return to running guest code implies this.
+         * A strex (successful or otherwise) also clears the monitor, so
+         * we don't need to specialcase EXCP_STREX.
+         */
+        env->exclusive_addr = -1;
+    } /* for (;;) */
+}
+
+
+/* See arm64/arm64/vm_machdep.c cpu_fork() */
+static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
+{
+    if (newsp) {
+        env->xregs[31] = newsp;
+    }
+    env->regs[0] = 0;
+    env->regs[1] = 0;
+    pstate_write(env, 0);
+}
+
+static inline void target_cpu_reset(CPUArchState *env)
+{
+}
+
+
+#endif /* TARGET_ARCH_CPU_H */
diff --git a/bsd-user/aarch64/target_syscall.h b/bsd-user/aarch64/target_syscall.h
new file mode 100644
index 00000000000..08ae913c42e
--- /dev/null
+++ b/bsd-user/aarch64/target_syscall.h
@@ -0,0 +1,51 @@
+/*
+ * ARM AArch64 specific CPU for bsd-user
+ *
+ * Copyright (c) 2015 Stacey D. Son <sson at Freebsd>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef BSD_USER_AARCH64_TARGET_SYSCALL_H
+#define BSD_USER_AARCH64_TARGET_SYSCALL_H
+
+/*
+ * The aarch64 registers are named:
+ *
+ * x0 through x30 - for 64-bit-wide access (same registers)
+ * Register '31' is one of two registers depending on the instruction context:
+ *  For instructions dealing with the stack, it is the stack pointer, named rsp
+ *  For all other instructions, it is a "zero" register, which returns 0 when
+ *  read and discards data when written - named rzr (xzr, wzr)
+ *
+ * Usage during syscall/function call:
+ * r0-r7 are used for arguments and return values
+ * For syscalls, the syscall number is in r8
+ * r9-r15 are for temporary values (may get trampled)
+ * r16-r18 are used for intra-procedure-call and platform values (avoid)
+ * The called routine is expected to preserve r19-r28
+ * r29 and r30 are used as the frame register and link register (avoid)
+ * See the ARM Procedure Call Reference for details.
+ */
+struct target_pt_regs {
+    uint64_t    regs[31];
+    uint64_t    sp;
+    uint64_t    pc;
+    uint64_t    pstate;
+};
+
+#define TARGET_HW_MACHINE       "arm64"
+#define TARGET_HW_MACHINE_ARCH  "aarch64"
+
+#endif /* BSD_USER_AARCH64_TARGET_SYSCALL_H */
-- 
2.45.1

