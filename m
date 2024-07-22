Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2155804njc;
        Mon, 22 Jul 2024 14:45:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrf4mNgxkeDsZ4bx2DNstAUWoAsWBmoMnMg0QAFz1WmhGPbdu84u0CdMn91lpZ/dKhlxE+HAK0NGEk6ZS5ftqRR89Azw31
X-Google-Smtp-Source: AGHT+IENhWapT7qFJDqSyzcX27mp9T8S1xwST8dnJlOaXx4Oh4exPZ13tqFEUnT8PXKU7fYBZJc2
X-Received: by 2002:a05:620a:4041:b0:79f:14b:8433 with SMTP id af79cd13be357-7a1c06bbad7mr122113285a.25.1721684709961;
        Mon, 22 Jul 2024 14:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721684709; cv=none;
        d=google.com; s=arc-20160816;
        b=K4IuQaKL36/zd2CBspHQUL/8FepaNDnwhtFfJTZBU07DdPNiG029FDkwSxq4iygyNz
         aqPT9jKjs5Ebq2fhc4G19+agoedJ0atqFRAkC6QAomNRJ6psd0Qkkbiwjyh9w4CEcYwY
         GmR1AIMAkZJ94XvNbXRgK+sitCmwUrk22DXjFV0bp4IKCWNoeDw+lvophdd9Mprir6RW
         l5OmadSlXqm4KfHIsi1Y+oT/xwJw2CE4i412tk/66C+L/FCj/Ydl9sSkCoVKCDiydHbR
         1dB9nfQXKuxRbCCijKd1BnO5YDmBp1DJ59RNvBTES3kmRC/uSB6sN5TToY2zpagO0hDc
         T3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yKi1gMVKcZkhr3TxLjW1YvmZHL7RtLDRQyR73xxYF4A=;
        fh=WBnUjYFy9hsFGl3PGfYHVGeuMc/FR7a6SswhkEbyQKs=;
        b=d0LeGsphZl/8HHvqJ1r13AiFEVr/MmF5mP9oy9JFJFlZXPVkx5jGHM+G6B54tVy/0T
         8XKGdhMSgSCzOo8vk+ayoJvobnSveEinmG5hmBkFh9goHa+e4HdcSQcEo03GagNvLJ3X
         NTbVM/HO57QsjD/SrKtyCUU9+243jOreEPkgUI+96IAMVw2uuAZRdTTvTGyZXJ2DAjp9
         1PcJHhkW1Mmx0wcz+tF+itzN3OtvAbnT0ccBB1MUfTE+CYncYaNYA7Z6Y0tB9QnTNYR7
         Dh+BsLmn3D5Icuve9hLpW6CR8sclwlHeIEKqa0+dGl0zQkSx2e+HGznVT6+n+CsIIV8A
         o2bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=qdEf5I7b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a198f97a2dsi887303085a.48.2024.07.22.14.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 14:45:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=qdEf5I7b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW0q5-0005KP-H8; Mon, 22 Jul 2024 17:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0pv-00052C-EC
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:44:53 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0pq-0004HU-An
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:44:51 -0400
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-8036ce66134so187979639f.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 14:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721684685; x=1722289485;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKi1gMVKcZkhr3TxLjW1YvmZHL7RtLDRQyR73xxYF4A=;
 b=qdEf5I7bRyJLHzRrPdZzScino/Xi8MFg6MKOwK3eyIccq4Asb3P7rAUuig9XPDDhEx
 sLI+of7QqhxsETR6YlKjepRsD+EZLmeVLcnIMhtcP/ERHnktim5BVOjyG6nomABlV9km
 slVPIGyY4dKwfLZVmjh8Ungvbr7hzbtMwqWl7a/DSBQ9LqyxyqfsFj7p56+GCln+L612
 EEVIidJne4HtviupJa2Q1RnyPtcxB7y6mb97aHyLTLt7j0rcWJiVGc8jMtSUBe6lS2li
 WldkuPdbt4qRpsGvVTO1PO02hI9kXLWbSbjP9mviGw99vLP2fbwgJ1kPu6KDt+OAHQ3R
 9QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721684685; x=1722289485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKi1gMVKcZkhr3TxLjW1YvmZHL7RtLDRQyR73xxYF4A=;
 b=nKe6EgS7pWC3Mg4nr0x6ipNlVoaDHjiIz+qp4Pn5ekTT+Sw6eE5lJphuR2jleZdwnL
 gY/p8InPqH/kRcm/BKqOCpGsF91rNYyNLJA8jtTiFy1mnL1XUdyW0rESyZ+u/3UGpTzq
 UIdndygWc4+IEeB/hyNvnP3nxMgBeR3CK1p8UQTlYMSgHBFj51XHOViB1hYNJVQqdskt
 3d7hjn4hVO4MegULkOy/ujAC8rUbElHD4D5zN7S23CplUmfya/58E3m3VAGBw1Xm/OSq
 8y74wr2TTmBJQ7mrfFQDTlvm7njML9QCcM/CkY0XtHR1AC1cgUqfNbS9EOBVtM+08lYL
 ZHDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEfXwEsB3NjCmVizOsXQ++I5u99l+dknBOTOpAtdx8CadnfvQdZbcwMt3LEMMNwG8X+AOuDV+c56jlWrVwyT3VJgej
X-Gm-Message-State: AOJu0YwCn28qwtXY2/WLC35xpemm2zCcxU+9LV70f0x8tMjTTnn4oU4l
 Dd7RWWbBcsk1mE2KwsexDl7FM9Mx7FzF71sZzTTG2dOFoUNngq5T+zGn9phZjQQ=
X-Received: by 2002:a05:6602:2d94:b0:807:f0fb:11a2 with SMTP id
 ca18e2360f4ac-81ea4d83700mr126075839f.13.1721684684924; 
 Mon, 22 Jul 2024 14:44:44 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2343d2ff3sm1816830173.128.2024.07.22.14.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 14:44:43 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Ajeet Singh <itachis@FreeBSD.org>,
 Jessica Clarke <jrtc27@jrtc27.com>, Sean Bruno <sbruno@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 02/14] bsd-user:Add AArch64 register handling and related
 functions
Date: Mon, 22 Jul 2024 15:43:01 -0600
Message-ID: <20240722214313.89503-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240722214313.89503-1-imp@bsdimp.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
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
X-TUID: NboJubQfAffH

From: Stacey Son <sson@FreeBSD.org>

Added header file for managing CPU register states in FreeBSD user mode.
Introduced prototypes for setting and getting thread-local storage (TLS).
Implemented AArch64 sysarch() system call emulation and a printing function.
Added function for setting up thread upcall to add thread support to BSD-USER.
Initialized thread's register state during thread setup.
Updated ARM AArch64 VM parameter definitions for bsd-user, including address spaces for FreeBSD/arm64 and
a function for getting the stack pointer from CPU and setting a return value.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Ajeet Singh <itachis@FreeBSD.org>
Co-authored-by: Jessica Clarke <jrtc27@jrtc27.com>
Co-authored-by: Sean Bruno <sbruno@freebsd.org>
Co-authored-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240707191128.10509-3-itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/aarch64/target_arch.h         | 28 +++++++++++
 bsd-user/aarch64/target_arch_reg.h     | 56 +++++++++++++++++++++
 bsd-user/aarch64/target_arch_sysarch.h | 42 ++++++++++++++++
 bsd-user/aarch64/target_arch_thread.h  | 61 +++++++++++++++++++++++
 bsd-user/aarch64/target_arch_vmparam.h | 68 ++++++++++++++++++++++++++
 5 files changed, 255 insertions(+)
 create mode 100644 bsd-user/aarch64/target_arch.h
 create mode 100644 bsd-user/aarch64/target_arch_reg.h
 create mode 100644 bsd-user/aarch64/target_arch_sysarch.h
 create mode 100644 bsd-user/aarch64/target_arch_thread.h
 create mode 100644 bsd-user/aarch64/target_arch_vmparam.h

diff --git a/bsd-user/aarch64/target_arch.h b/bsd-user/aarch64/target_arch.h
new file mode 100644
index 00000000000..27f47de8eb3
--- /dev/null
+++ b/bsd-user/aarch64/target_arch.h
@@ -0,0 +1,28 @@
+/*
+ * ARM AArch64 specific prototypes for bsd-user
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
+#ifndef TARGET_ARCH_H
+#define TARGET_ARCH_H
+
+#include "qemu.h"
+
+void target_cpu_set_tls(CPUARMState *env, target_ulong newtls);
+target_ulong target_cpu_get_tls(CPUARMState *env);
+
+#endif /* TARGET_ARCH_H */
diff --git a/bsd-user/aarch64/target_arch_reg.h b/bsd-user/aarch64/target_arch_reg.h
new file mode 100644
index 00000000000..5c7154f0c18
--- /dev/null
+++ b/bsd-user/aarch64/target_arch_reg.h
@@ -0,0 +1,56 @@
+/*
+ *  FreeBSD arm64 register structures
+ *
+ *  Copyright (c) 2015 Stacey Son
+ *  All rights reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef TARGET_ARCH_REG_H
+#define TARGET_ARCH_REG_H
+
+/* See sys/arm64/include/reg.h */
+typedef struct target_reg {
+    uint64_t        x[30];
+    uint64_t        lr;
+    uint64_t        sp;
+    uint64_t        elr;
+    uint64_t        spsr;
+} target_reg_t;
+
+typedef struct target_fpreg {
+    __uint128_t     fp_q[32];
+    uint32_t        fp_sr;
+    uint32_t        fp_cr;
+} target_fpreg_t;
+
+#define tswapreg(ptr)   tswapal(ptr)
+
+static inline void target_copy_regs(target_reg_t *regs, CPUARMState *env)
+{
+    int i;
+
+    for (i = 0; i < 30; i++) {
+        regs->x[i] = tswapreg(env->xregs[i]);
+    }
+    regs->lr = tswapreg(env->xregs[30]);
+    regs->sp = tswapreg(env->xregs[31]);
+    regs->elr = tswapreg(env->pc);
+    regs->spsr = tswapreg(pstate_read(env));
+}
+
+#undef tswapreg
+
+#endif /* TARGET_ARCH_REG_H */
diff --git a/bsd-user/aarch64/target_arch_sysarch.h b/bsd-user/aarch64/target_arch_sysarch.h
new file mode 100644
index 00000000000..b003015daf4
--- /dev/null
+++ b/bsd-user/aarch64/target_arch_sysarch.h
@@ -0,0 +1,42 @@
+/*
+ * ARM AArch64 sysarch() system call emulation for bsd-user.
+ *
+ * Copyright (c) 2015 <sson at FreeBSD>
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
+#ifndef TARGET_ARCH_SYSARCH_H
+#define TARGET_ARCH_SYSARCH_H
+
+#include "target_syscall.h"
+#include "target_arch.h"
+
+/* See sysarch() in sys/arm64/arm64/sys_machdep.c */
+static inline abi_long do_freebsd_arch_sysarch(CPUARMState *env, int op,
+        abi_ulong parms)
+{
+    int ret = -TARGET_EOPNOTSUPP;
+
+    fprintf(stderr, "sysarch");
+    return ret;
+}
+
+static inline void do_freebsd_arch_print_sysarch(
+        const struct syscallname *name, abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+}
+
+#endif /* TARGET_ARCH_SYSARCH_H */
diff --git a/bsd-user/aarch64/target_arch_thread.h b/bsd-user/aarch64/target_arch_thread.h
new file mode 100644
index 00000000000..4c911e605ac
--- /dev/null
+++ b/bsd-user/aarch64/target_arch_thread.h
@@ -0,0 +1,61 @@
+/*
+ * ARM AArch64 thread support for bsd-user.
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
+#ifndef TARGET_ARCH_THREAD_H
+#define TARGET_ARCH_THREAD_H
+
+/* Compare to arm64/arm64/vm_machdep.c cpu_set_upcall_kse() */
+static inline void target_thread_set_upcall(CPUARMState *regs, abi_ulong entry,
+    abi_ulong arg, abi_ulong stack_base, abi_ulong stack_size)
+{
+    abi_ulong sp;
+
+    /*
+     * Make sure the stack is properly aligned.
+     * arm64/include/param.h (STACKLIGN() macro)
+     */
+    sp = ROUND_DOWN(stack_base + stack_size, 16);
+
+    /* sp = stack base */
+    regs->xregs[31] = sp;
+    /* pc = start function entry */
+    regs->pc = entry;
+    /* r0 = arg */
+    regs->xregs[0] = arg;
+
+    
+}
+
+static inline void target_thread_init(struct target_pt_regs *regs,
+        struct image_info *infop)
+{
+    abi_long stack = infop->start_stack;
+
+    /*
+     * Make sure the stack is properly aligned.
+     * arm64/include/param.h (STACKLIGN() macro)
+     */
+
+    memset(regs, 0, sizeof(*regs));
+    regs->regs[0] = infop->start_stack;
+    regs->pc = infop->entry;
+    regs->sp = ROUND_DOWN(stack, 16);
+}
+
+#endif /* TARGET_ARCH_THREAD_H */
diff --git a/bsd-user/aarch64/target_arch_vmparam.h b/bsd-user/aarch64/target_arch_vmparam.h
new file mode 100644
index 00000000000..dc66e1289b5
--- /dev/null
+++ b/bsd-user/aarch64/target_arch_vmparam.h
@@ -0,0 +1,68 @@
+/*
+ * ARM AArch64 VM parameters definitions for bsd-user.
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
+#ifndef TARGET_ARCH_VMPARAM_H
+#define TARGET_ARCH_VMPARAM_H
+
+#include "cpu.h"
+
+/**
+ * FreeBSD/arm64 Address space layout.
+ *
+ * ARMv8 implements up to a 48 bit virtual address space. The address space is
+ * split into 2 regions at each end of the 64 bit address space, with an
+ * out of range "hole" in the middle.
+ *
+ * We limit the size of the two spaces to 39 bits each.
+ *
+ * Upper region:        0xffffffffffffffff
+ *                      0xffffff8000000000
+ *
+ * Hole:                0xffffff7fffffffff
+ *                      0x0000008000000000
+ *
+ * Lower region:        0x0000007fffffffff
+ *                      0x0000000000000000
+ *
+ * The upper region for the kernel, and the lower region for userland.
+ */
+
+
+/* compare to sys/arm64/include/vmparam.h */
+#define TARGET_MAXTSIZ      (1 * GiB)           /* max text size */
+#define TARGET_DFLDSIZ      (128 * MiB)         /* initial data size limit */
+#define TARGET_MAXDSIZ      (1 * GiB)           /* max data size */
+#define TARGET_DFLSSIZ      (128 * MiB)         /* initial stack size limit */
+#define TARGET_MAXSSIZ      (1 * GiB)           /* max stack size */
+#define TARGET_SGROWSIZ     (128 * KiB)         /* amount to grow stack */
+
+                /* KERNBASE - 512 MB */
+#define TARGET_VM_MAXUSER_ADDRESS   (0x00007fffff000000ULL - (512 * MiB))
+#define TARGET_USRSTACK             TARGET_VM_MAXUSER_ADDRESS
+
+static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
+{
+    return state->xregs[31]; /* sp */
+}
+
+static inline void set_second_rval(CPUARMState *state, abi_ulong retval2)
+{
+    state->xregs[1] = retval2; /* XXX not really used on 64-bit arch */
+}
+#endif /* TARGET_ARCH_VMPARAM_H */
-- 
2.45.1

