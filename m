Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2672148njc;
        Tue, 23 Jul 2024 11:12:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2P2ccxsoqpv292eQ4Aay7Qre1n2hY5E4wvf+6e4FNHNhEEjCUM69xlgjb/wZj9KB3J/dQtwizFM5eQakZc024JHHnE3L0
X-Google-Smtp-Source: AGHT+IEZICxskmb1UXj8bqbzMvPynsOK9gIgeQDWYfUleVsZC23ZraEuj4cfPLUSMvNFmwXS5XTl
X-Received: by 2002:a05:6870:b50b:b0:261:136a:9724 with SMTP id 586e51a60fabf-261213a42c8mr10283090fac.16.1721758375922;
        Tue, 23 Jul 2024 11:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721758375; cv=none;
        d=google.com; s=arc-20160816;
        b=xbkUn1WeTCaNdlHdz6Ad4gQ8rqha4pkbPswukIb9eaEgZA8kC61i08hseF9colLlrX
         SD0lbvxmdsX6FO7sq0zqAfRE7UVTZJixHEhjzGZnYDC2RJ5HNp/UU2/Tw1VUgIntDPD2
         9eOjVAr1W5IOgOfcKwx+bJFAHStjYjA2vKC2CVQaJHaseWlN0yLXoNhpItlTtdsHhOUu
         A/2qoEQ9okJEe+Qf8lnnDnoBB2NiyQRWNccj8VE9kvhxB3qICaQCJ8IodkloSYgAdBbP
         Kp19gta48kqbYhGqDqBe/m1zI8Zd+iDrRGKfgd+od4re2BU/kgXaOehYvS1KkKXP4ST/
         HJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yKi1gMVKcZkhr3TxLjW1YvmZHL7RtLDRQyR73xxYF4A=;
        fh=s1nusqJ3gQaOFBLFlhCoJmgMenF99W5W3ETxGrmFf7E=;
        b=F60r2Yu9OZn+upSrp/FTXE1u2QgJukC0vu6FA56npBQlMZ+n+RM6yJDbgTtnAu3BX2
         zmKaUTBrEmHaV2afft4KQzMBUx5iEr3RtbZ7vqK8BMYVqy7b9vURIotPdMxfQ0OF95DC
         tIAAcTPC3yuqgG7DdBykEkAlLeOcRD1nQSqmnCIc3z4bSJQQwcQM8lf+drRi0ygvNAjJ
         s+MXFu6vHkxwITRGmxFhB96/UStEcuXaCecIVAoDRn6jRpOCh7eY59RxU6be5Z7z8SRZ
         ly4vI/LkjDrRVTi873RtCIjMnOQhdLfVPa2TK5DcooSFwPuDhm8TVjsvIcF/g8To+j94
         U/mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=HZTYFtBD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a19904b41csi1083546785a.321.2024.07.23.11.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 11:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=HZTYFtBD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWJx3-0001YP-J5; Tue, 23 Jul 2024 14:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwb-00013O-DM
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:01 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwY-0001BJ-LV
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:00 -0400
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-396675b83afso26442425ab.0
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721758137; x=1722362937;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKi1gMVKcZkhr3TxLjW1YvmZHL7RtLDRQyR73xxYF4A=;
 b=HZTYFtBD63RYqP4k4XTU1nl/NNk5Hfxhh4KOiPYYbcQ93plObFIFgSjtVGEkHIP6GF
 TQG2WIwIP5i9WrcjMVeOO668y8sZaa0tgsDQz43shCldni11sFIdQaDd5QpxRdC0lEQL
 dS2wBA0AKDw89DVFdM2b7V3f0JXQZx0GqxLF1JP+AdLqs6iAtuL44ZZlyDT2cwrdgzmx
 G4DE7C6dLtEEpEAzqcnzR+HMtob44XzondJjkExwPPBZGNMRr9yySX3IY3fTYQo9Y4m2
 dcy5AEUulx5aPfLRblsiu/1IGsbxsRNjtVeeU3r8C8imJPidlB66fkRD5lpSLBUN3fEy
 QgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721758137; x=1722362937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKi1gMVKcZkhr3TxLjW1YvmZHL7RtLDRQyR73xxYF4A=;
 b=ZVUo3tNdLX2nIRvd8I6rMojQcdqZltUPtDcWFveb8XYgwxXD2ClGDkDZ5HcIKdwlSM
 DsYN/0sUeI1tkxtRzZepDLxgXYidncMpPAcZcOd6k9pd+lkpSURgxMyOLmpCMhCfKGSg
 4P/An0usNOWnynCVVHUV3zL5UwlIOVtaL26TkdvakJVdpkaFcKb2wWvyv8xV1Vd5525o
 KC0aNRhnZbk08H48fwjdsbpNdOOOOlbxaONPYJrQYSjGjYQC98Wpe881Ym8iiPnqjSUj
 pnwk+QQj4+rjv3FDsiNn2uo9toYJeEHCjjpvxTUegbEvPa3JiGKtMWdj3UbXTorKK1Jl
 7hMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ9DFakYGPSLYtTjCW1HI2cQKqQ2KW+uRljdCVVY07W9l+rsi1yVC651sxI2uVlWksM1470mcu2ALpgVjmhbl/F6UN
X-Gm-Message-State: AOJu0Yxz/aX9DuoIMDmt8v899cYF/FEOYXC0SwOmTrJAy7FanMd6Tw2w
 vWACy/7LOpTeo1SHV1Z1n8q92Q/ZdSoZ75PNWIyuWzSJsf48PfqlJu3xbiKFhyw=
X-Received: by 2002:a05:6e02:19ce:b0:38b:48c9:55d5 with SMTP id
 e9e14a558f8ab-398e8d5219emr153831685ab.13.1721758136875; 
 Tue, 23 Jul 2024 11:08:56 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f7a2827csm33361775ab.53.2024.07.23.11.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 11:08:56 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Stacey Son <sson@FreeBSD.org>, Ajeet Singh <itachis@FreeBSD.org>,
 Jessica Clarke <jrtc27@jrtc27.com>, Sean Bruno <sbruno@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/14] bsd-user:Add AArch64 register handling and related
 functions
Date: Tue, 23 Jul 2024 12:07:13 -0600
Message-ID: <20240723180725.99114-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240723180725.99114-1-imp@bsdimp.com>
References: <20240723180725.99114-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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
X-TUID: fP6r8yLNHGvO

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

