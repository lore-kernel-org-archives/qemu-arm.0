Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3360702njc;
        Wed, 24 Jul 2024 15:07:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3ebFSox26SbwRIH/0HWcAatT9BPJHl5dmFsaOJN2HMHMJecGt3c9YAFMr+/bz+xALi2xx4aq8u/LUWm4cdyWcyUJrJku1
X-Google-Smtp-Source: AGHT+IG6duajeKZcWAhpsfo+/xmFUR9aTJVeXpZZOiuPuH9LxAOfUQ8IT5hN5Fhijb+8KGwCHe3R
X-Received: by 2002:a05:620a:390f:b0:79e:f9f4:3e99 with SMTP id af79cd13be357-7a1d45bafb4mr197461185a.1.1721858844755;
        Wed, 24 Jul 2024 15:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721858844; cv=none;
        d=google.com; s=arc-20160816;
        b=lrp5Sz/un9rSrpcBsIt/eyAP2RsmeMGRwVikEmm58X6RrDxxrH8vKmNEn6YLSf6/qd
         DSfX19QtO1FpstYnPD1sgi/PkaM9zgkaRUet9M0bqkw33NhkFaintuodOjU2/8nWgGhC
         Ah4XxSLkV6qNdqhMPODBQZOqTEt1OJp6WoRs+W0k34qM5BBAhHtrf69ANyNHVedlmdF8
         79xj5EH+I2QJh2JWq/XOfTNQvMucPHeSp83co4JtKOC5iO/2Vkpi5Hkv/kWDdvcTNmiE
         24ywlaOQWuoaJ23aWkZ8+DtgIhtND+rytAB8VULEVspk1BQxTWnigrDrfgQEXWneS7+K
         0Zzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W3XlKNMv+/RjVBRuGDBQWo+adXw6lKr/2b70+lGZd98=;
        fh=j6RU62ete7A2aFs+shkwIdtPmU0pfzNEXejr8eeILXo=;
        b=WptBuqL9XI5tHIa+ZuuWGlpEPKVFM/nKxG5mexuPcg32wItIhWToC0Pznzx2tmsFXT
         qXRNIkbSD9d8gfsDULI4izZnUX6vHAjThhiPCwiZjGFaOA/D0ofdQIV9YLC/uCXFXPwZ
         Xzoze0XBQnDu9Rjx4fEBSlYdAvPM4kZI4jTLh4I8ApWZ8M+oGFylMaLHdAeDofm1DdFI
         CJd9I3n9zN8BPXd2Aiwp6+JjcWXLu6zw/t0MsYgbXcUx3XudN9qnODeZkVTyk4LLi20l
         mugHh4ppgdUZAXvTw/Ixc308iq7Bc78IoG/eus73q6oao9W1CB2pVC0pqhm8TFjNK2ZC
         D8eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=qZWPIx44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe8423fd2si1039901cf.619.2024.07.24.15.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 15:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=qZWPIx44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWk7w-0000MB-Qc; Wed, 24 Jul 2024 18:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7v-0000GW-GB
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:27 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7q-0006Vf-Kp
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:27 -0400
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-804ac219676so45555039f.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 15:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721858781; x=1722463581;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3XlKNMv+/RjVBRuGDBQWo+adXw6lKr/2b70+lGZd98=;
 b=qZWPIx44hpwe2ifsO+Uhx69jn0YnQLoRUMsFDb+7WcJtCZDvgDeXwvPu5OB3Z/7Pik
 K9S8T4YFfgcotO86Lam4SBRkNLSXxj/5lJuy33bhiipE7PX5zwOPNc2xnMJescrRh4Rs
 P9tIElsaxr3I29+bCJyQihSP4zRGhZOUr0diUdSFLR6V3vRABWw+89PS5gZNCDt0xJTw
 Fb7tMErlTfiIHuBq3Hn/kJOKg/Y6yRI84zeqKR8+uwVyHKgAYaY6YIQIelxesokcvFJM
 LJy8ofm7LnbJReC/T/kSPZdVhfOTcJKPgl/ly/lDS2wbKplQn5E9Il90jFyFcVKY3Qp8
 5QSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721858781; x=1722463581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3XlKNMv+/RjVBRuGDBQWo+adXw6lKr/2b70+lGZd98=;
 b=DHW2vVPycZnlc4NHOUNJfmST71esPJwfEyDY4Pi9Fhx06RAHVeTc8jmgSBO0c3THCS
 irZ1DN27ksvlv1AzKd9TUiTcaR+gDg7nRmfGRS1RDRbo5Q0YYhwFwmQS5UW/fbNGaAPB
 /b/6BSSsme6Ye5hq+CRpcufOs5/v/c3A6YZFyWt+e5/Np1D33Sz10/i/MuxW8p/2znaX
 RuPJel5y1z1y+OPf5RSrfdwAOpqsspMoPFCF87nwKxhr7ekQ/RLkGcbWV2+u9ydVWClW
 K6F6sNkUTDxjnD3XVQpz4/CpcHq4QQ52caE48WyrjICNX787h6xU4yY/4OfPu1sVk2dW
 +5zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSlvN8Z3Jyc58b/p62TfDpim804uFb2Pgoxr9Bl16OZC4kKwsG3G+rSqQpBJbeLTDiu7V1uS6Bjvny/24s5E8RkqLM
X-Gm-Message-State: AOJu0YwckQpYQ8EvHBz/qMjnjx93ick0ZfHig2+vGe6xfvzE/xWwZuc4
 a3gytbnUPPbXIhh7OKpH/V72HKLplBT+2dTAdyaVHqo4Q5bslrPbxE8sHFAw3rs=
X-Received: by 2002:a05:6e02:12e7:b0:396:788:f4ef with SMTP id
 e9e14a558f8ab-39a1a80ef7fmr25651355ab.14.1721858781062; 
 Wed, 24 Jul 2024 15:06:21 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c29fa983f8sm10086173.47.2024.07.24.15.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 15:06:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>, Ajeet Singh <itachis@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 04/15] bsd-user:Add ARM AArch64 signal handling support
Date: Wed, 24 Jul 2024 16:04:37 -0600
Message-ID: <20240724220449.10398-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
References: <20240724220449.10398-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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
X-TUID: 3smyUtxOMxmh

From: Stacey Son <sson@FreeBSD.org>

Added sigcode setup function for signal trampoline which initializes a sequence of instructions
to handle signal returns and exits, copying this code to the target offset.
Defined ARM AArch64 specific signal definitions including register indices and sizes,
and introduced structures to represent general purpose registers, floating point registers, and machine context.
Added function to set up signal handler arguments, populating register values in `CPUARMState`
based on the provided signal, signal frame, signal action, and frame address.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Ajeet Singh <itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Co-authored-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240707191128.10509-5-itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/aarch64/signal.c               | 53 ++++++++++++++++
 bsd-user/aarch64/target_arch_signal.h   | 80 +++++++++++++++++++++++++
 bsd-user/aarch64/target_arch_sigtramp.h | 48 +++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 bsd-user/aarch64/signal.c
 create mode 100644 bsd-user/aarch64/target_arch_signal.h
 create mode 100644 bsd-user/aarch64/target_arch_sigtramp.h

diff --git a/bsd-user/aarch64/signal.c b/bsd-user/aarch64/signal.c
new file mode 100644
index 00000000000..98861f9ab3b
--- /dev/null
+++ b/bsd-user/aarch64/signal.c
@@ -0,0 +1,53 @@
+/*
+ * ARM AArch64 specific signal definitions for bsd-user
+ *
+ * Copyright (c) 2015 Stacey D. Son <sson at FreeBSD>
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
+
+#include "qemu.h"
+
+/*
+ * Compare to sendsig() in sys/arm64/arm64/machdep.c
+ * Assumes that target stack frame memory is locked.
+ */
+abi_long set_sigtramp_args(CPUARMState *regs, int sig,
+                           struct target_sigframe *frame,
+                           abi_ulong frame_addr,
+                           struct target_sigaction *ka)
+{
+    /*
+     * Arguments to signal handler:
+     *  x0 = signal number
+     *  x1 = siginfo pointer
+     *  x2 = ucontext pointer
+     *  pc/elr = signal handler pointer
+     *  sp = sigframe struct pointer
+     *  lr = sigtramp at base of user stack
+     */
+
+    regs->xregs[0] = sig;
+    regs->xregs[1] = frame_addr +
+        offsetof(struct target_sigframe, sf_si);
+    regs->xregs[2] = frame_addr +
+        offsetof(struct target_sigframe, sf_uc);
+
+    regs->pc = ka->_sa_handler;
+    regs->xregs[TARGET_REG_SP] = frame_addr;
+    regs->xregs[TARGET_REG_LR] = TARGET_PS_STRINGS - TARGET_SZSIGCODE;
+
+    return 0;
+}
diff --git a/bsd-user/aarch64/target_arch_signal.h b/bsd-user/aarch64/target_arch_signal.h
new file mode 100644
index 00000000000..df171733166
--- /dev/null
+++ b/bsd-user/aarch64/target_arch_signal.h
@@ -0,0 +1,80 @@
+/*
+ * ARM AArch64 specific signal definitions for bsd-user
+ *
+ * Copyright (c) 2015 Stacey D. Son <sson at FreeBSD>
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
+#ifndef TARGET_ARCH_SIGNAL_H
+#define TARGET_ARCH_SIGNAL_H
+
+#include "cpu.h"
+
+#define TARGET_REG_X0   0
+#define TARGET_REG_X30  30
+#define TARGET_REG_X31  31
+#define TARGET_REG_LR   TARGET_REG_X30
+#define TARGET_REG_SP   TARGET_REG_X31
+
+#define TARGET_INSN_SIZE    4       /* arm64 instruction size */
+
+/* Size of the signal trampolin code. See _sigtramp(). */
+#define TARGET_SZSIGCODE    ((abi_ulong)(9 * TARGET_INSN_SIZE))
+
+/* compare to sys/arm64/include/_limits.h */
+#define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
+#define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
+
+/* struct __mcontext in sys/arm64/include/ucontext.h */
+
+struct target_gpregs {
+    uint64_t    gp_x[30];
+    uint64_t    gp_lr;
+    uint64_t    gp_sp;
+    uint64_t    gp_elr;
+    uint32_t    gp_spsr;
+    uint32_t    gp_pad;
+};
+
+struct target_fpregs {
+    __uint128_t fp_q[32];
+    uint32_t    fp_sr;
+    uint32_t    fp_cr;
+    uint32_t    fp_flags;
+    uint32_t    fp_pad;
+};
+
+struct target__mcontext {
+    struct target_gpregs mc_gpregs;
+    struct target_fpregs mc_fpregs;
+    uint32_t    mc_flags;
+#define TARGET_MC_FP_VALID  0x1
+    uint32_t    mc_pad;
+    uint64_t    mc_spare[8];
+};
+
+typedef struct target__mcontext target_mcontext_t;
+
+#define TARGET_MCONTEXT_SIZE 880
+#define TARGET_UCONTEXT_SIZE 960
+
+#include "target_os_ucontext.h"
+
+struct target_sigframe {
+    target_siginfo_t    sf_si;  /* saved siginfo */
+    target_ucontext_t   sf_uc;  /* saved ucontext */
+};
+
+#endif /* TARGET_ARCH_SIGNAL_H */
diff --git a/bsd-user/aarch64/target_arch_sigtramp.h b/bsd-user/aarch64/target_arch_sigtramp.h
new file mode 100644
index 00000000000..8cdd33b621d
--- /dev/null
+++ b/bsd-user/aarch64/target_arch_sigtramp.h
@@ -0,0 +1,48 @@
+/*
+ * ARM AArch64 sigcode for bsd-user
+ *
+ * Copyright (c) 2015 Stacey D. Son <sson at FreeBSD>
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
+#ifndef TARGET_ARCH_SIGTRAMP_H
+#define TARGET_ARCH_SIGTRAMP_H
+
+/* Compare to ENTRY(sigcode) in arm64/arm64/locore.S */
+static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
+        unsigned sys_sigreturn)
+{
+    int i;
+    uint32_t sys_exit = TARGET_FREEBSD_NR_exit;
+
+    uint32_t sigtramp_code[] = {
+    /* 1 */ 0x910003e0,                 /* mov x0, sp */
+    /* 2 */ 0x91000000 + (sigf_uc << 10), /* add x0, x0, #SIGF_UC */
+    /* 3 */ 0xd2800000 + (sys_sigreturn << 5) + 0x8, /* mov x8, #SYS_sigreturn */
+    /* 4 */ 0xd4000001,                 /* svc #0 */
+    /* 5 */ 0xd2800028 + (sys_exit << 5) + 0x8, /* mov x8, #SYS_exit */
+    /* 6 */ 0xd4000001,                 /* svc #0 */
+    /* 7 */ 0x17fffffc,                 /* b -4 */
+    /* 8 */ sys_sigreturn,
+    /* 9 */ sys_exit
+    };
+
+    for (i = 0; i < 9; i++) {
+        tswap32s(&sigtramp_code[i]);
+    }
+
+    return memcpy_to_target(offset, sigtramp_code, TARGET_SZSIGCODE);
+}
+#endif /* TARGET_ARCH_SIGTRAMP_H */
-- 
2.45.1

