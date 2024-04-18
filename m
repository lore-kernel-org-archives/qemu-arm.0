Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952399ejd;
        Thu, 18 Apr 2024 12:26:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfMOsYVmMxjx/pxoxXBvk68COQ/KAyedtGaOAOLXYlrU5KoiCM6F3yWovQoOVs5xyk2rgbMhpqCtB4Zn6oR8y2zHwlKz8f
X-Received: by 2002:adf:f5d1:0:b0:346:c5d8:38 with SMTP id k17-20020adff5d1000000b00346c5d80038mr1987089wrp.10.1713468372247;
        Thu, 18 Apr 2024 12:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468372; cv=none;
        d=google.com; s=arc-20160816;
        b=iC9XHaqxKjnJSddsoq5xZt9dYwXdpHVxO9DFUI2vA1OueSYYWF1oYE0on004A4A3ax
         uckppLnJYSCgrQAVt/CQ6qUnfoCadHIuEcVB2YN7GBtkOIlkd9XGLjdu/czucpWInOp4
         xAlgc/6luypAqaxrNv/ThYqBFfEqheo2aQM4hicOpdrAoUqFKc9aDWSZNgZjfwNhodOW
         Bx4eQrQqnR2jUSWn7ylsysL/RkgvLQDAiYi67e91ROL07e7GtgC26nXUwj4rdTyABRfr
         xy82kQimn3TSoqeIKxZ0FeaFXvsMfAKXTh6MmnATphp71X2SRF8RmLDwihZt3gEr7lmk
         jcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9U+h/wZIc3z+oX/TXzP2qUKxN0wKW4ADsCvM3ymjRp0=;
        fh=izQ4ZQvxoP6d/AdMwEsHLsb2Z8gYrPttwaTivYVoxw4=;
        b=oJCdMB1Ymfy5OPkR8OrR4Xl4AVN1pLrZhg2p9v4rrSsMH1aQBiyUoD8WZ5TQYazP85
         vKlqVWwd4BwCZjNyiv6Hfamz2KekTq6JaLko1jl+Vs255qOb7UZNhGWvR/PghFrc4qYl
         ZxM4t6Ws8rrxo5xs/MFHknzAhfVcaDXXAWDyGsziY5xZdpWWsshN07+726Px4CjriFmN
         U8B9gCtlKWI7nB5Dq4/fH1H0L05vQ0j2Ae2yRQYhgqGb6EG/yyr1/tzKd1w0t9agSmjI
         JYJw456BgAX+ezcXCzgSriIB0u9xYvUIk4J5U3DeCf/SD5fUDR90p+YexnZPUKBpDG3M
         GsTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZhPY4ifV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h16-20020a17090634d000b00a51dd18c1cfsor689111ejb.13.2024.04.18.12.26.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:26:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZhPY4ifV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468372; x=1714073172; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U+h/wZIc3z+oX/TXzP2qUKxN0wKW4ADsCvM3ymjRp0=;
        b=ZhPY4ifVQxaVYKo8p5jxy4cOwXgCN7huNBoIAkOtIeSjlonAyBpSaq25jdKjesxrWP
         JCDoNxbmT3NlgNsRAnMhady8AgJRwKqWUbEsL0zhCgbojg7gcTiY97izF9Hu6ayQRUZ5
         31BPMnunx2zJYh7Ma6pW6cY7tMtpZ+oxtwgXFbY0X3nCU8eUwObheu55qsd7iOZpvwGW
         Vlqpr+/QKBd4OCOI4OvKklsT6eKjC3b9sMIIdWkkjf6N6qr8W81uzNT6f7fkJLUAHIr4
         7+EDReVt2MPEk+5w/sJTh+H/9t9QRs7hK+blkN6JVy7P6ynBOFK7Ob8Uwl8XGY/YNjV0
         3sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468372; x=1714073172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9U+h/wZIc3z+oX/TXzP2qUKxN0wKW4ADsCvM3ymjRp0=;
        b=uT1VJP6/U+4SKEZ6EQFNqkFZt9QBx+6cdip6pPLhXxemTLXqhkEITGtSGU8PwQkYds
         DB3qR0cnYjCgWkZtmgt9Efsmra9XbXQIxxGdGdP63ioD6E5LmWiYa51oLLfYB/7IFpYi
         xgr9Kxp9bwtzwlzqMz5svmz/bGTjG5dc/pnSOxZmpxPP1nQRBQ9YoMNM87XPQgBQMxfb
         QxrEIpv0lCnlHD87YbIOMDbm8vEvvJEr2w62uZQsw8wx8QhjVjVCS1Iv/ijIi6FPqDLB
         hRIQoiP/Yw2gX0HWBOFKKisxqAZo4+3Z0ke+wthy5T2c266Z50WdyvGTKfjB0/6SYZl/
         DQyA==
X-Forwarded-Encrypted: i=1; AJvYcCVa46ulPU09JmkLBv0qeitSBCt/9H0bzf88wN2tw7OTo4wM02wY+DBXnqXQjT29ByiH91eancgvXYDwOrneroAFS8Tc1jZp
X-Gm-Message-State: AOJu0Yz1jOUrJw2tlh7TNg1c0UwzIRtPCOIV0W7+/Dq7XYG7W0VCor5b
	hk1RNmOfN1S40yKtHyPMhFYrSembBSeOsAlttV5enAafuAZ7EiuJu0RbaXHi7A7Cag==
X-Google-Smtp-Source: AGHT+IF3G8X24RbaYze8VdVZ1kx3UyNMM7AzihIFYhjXkguw8ljWqt1FoAzlNUd5Ds9C7eQQOymXBQ==
X-Received: by 2002:a17:906:2642:b0:a51:982e:b3f7 with SMTP id i2-20020a170906264200b00a51982eb3f7mr47184ejc.37.1713468371935;
        Thu, 18 Apr 2024 12:26:11 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id v18-20020a170906489200b00a46baba1a0asm1259512ejq.100.2024.04.18.12.26.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:26:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Peter Maydell <peter.maydell@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 07/24] exec: Un-inline tlb_vaddr_to_host() and declare it in 'exec/cputlb.h'
Date: Thu, 18 Apr 2024 21:25:06 +0200
Message-ID: <20240418192525.97451-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 575XNL3kYqAX

Declare tlb_vaddr_to_host() in "exec/cputlb.h" with the CPU TLB
API. Un-inline the user emulation definition to avoid including
"exec/cpu_ldst.h" (which declares g2h) in "exec/cputlb.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h      | 24 ------------------------
 include/exec/cputlb.h        | 18 ++++++++++++++++++
 accel/tcg/user-exec.c        |  7 +++++++
 target/arm/tcg/helper-a64.c  |  1 +
 target/riscv/vector_helper.c |  1 +
 target/sparc/mmu_helper.c    |  1 +
 6 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 63186b07e4..7032949dba 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -418,28 +418,4 @@ static inline int cpu_ldsw_code(CPUArchState *env, abi_ptr addr)
     return (int16_t)cpu_lduw_code(env, addr);
 }
 
-/**
- * tlb_vaddr_to_host:
- * @env: CPUArchState
- * @addr: guest virtual address to look up
- * @access_type: 0 for read, 1 for write, 2 for execute
- * @mmu_idx: MMU index to use for lookup
- *
- * Look up the specified guest virtual index in the TCG softmmu TLB.
- * If we can translate a host virtual address suitable for direct RAM
- * access, without causing a guest exception, then return it.
- * Otherwise (TLB entry is for an I/O access, guest software
- * TLB fill required, etc) return NULL.
- */
-#ifdef CONFIG_USER_ONLY
-static inline void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
-                                      MMUAccessType access_type, int mmu_idx)
-{
-    return g2h(env_cpu(env), addr);
-}
-#else
-void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
-                        MMUAccessType access_type, int mmu_idx);
-#endif
-
 #endif /* CPU_LDST_H */
diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index ef18642a32..173eb98b9a 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -20,10 +20,28 @@
 #ifndef CPUTLB_H
 #define CPUTLB_H
 
+#include "exec/abi_ptr.h"
 #include "exec/cpu-common.h"
+#include "exec/mmu-access-type.h"
 
 #ifdef CONFIG_TCG
 
+/**
+ * tlb_vaddr_to_host:
+ * @env: CPUArchState
+ * @addr: guest virtual address to look up
+ * @access_type: 0 for read, 1 for write, 2 for execute
+ * @mmu_idx: MMU index to use for lookup
+ *
+ * Look up the specified guest virtual index in the TCG softmmu TLB.
+ * If we can translate a host virtual address suitable for direct RAM
+ * access, without causing a guest exception, then return it.
+ * Otherwise (TLB entry is for an I/O access, guest software
+ * TLB fill required, etc) return NULL.
+ */
+void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+                        MMUAccessType access_type, int mmu_idx);
+
 #if !defined(CONFIG_USER_ONLY)
 /* cputlb.c */
 void tlb_protect_code(ram_addr_t ram_addr);
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 1c621477ad..54b35588b9 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -23,6 +23,7 @@
 #include "tcg/tcg.h"
 #include "qemu/bitops.h"
 #include "qemu/rcu.h"
+#include "exec/cputlb.h"
 #include "exec/cpu_ldst.h"
 #include "exec/translate-all.h"
 #include "exec/helper-proto.h"
@@ -138,6 +139,12 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
     }
 }
 
+void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+                        MMUAccessType access_type, int mmu_idx)
+{
+    return g2h(env_cpu(env), addr);
+}
+
 typedef struct PageFlagsNode {
     struct rcu_head rcu;
     IntervalTreeNode itree;
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index ebaa7f00df..9b3ae06207 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -29,6 +29,7 @@
 #include "internals.h"
 #include "qemu/crc32c.h"
 #include "exec/exec-all.h"
+#include "exec/cputlb.h"
 #include "exec/cpu_ldst.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index fa139040f8..d3d9c33597 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
+#include "exec/cputlb.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index ad1591d9fd..e79a33367a 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/cputlb.h"
 #include "qemu/qemu-print.h"
 #include "trace.h"
 
-- 
2.41.0
