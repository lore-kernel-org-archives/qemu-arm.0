Received: by 10.223.188.70 with SMTP id a6csp2319734wrh;
        Thu, 24 Aug 2017 08:59:17 -0700 (PDT)
X-Received: by 10.13.197.71 with SMTP id h68mr5638284ywd.46.1503590357399;
        Thu, 24 Aug 2017 08:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503590357; cv=none;
        d=google.com; s=arc-20160816;
        b=iKXYjjChzmVHteZyUmIxUIxrbDpzylA6NK9Jcfe3V71tY+1hUxjEqjf9w8v7BCT1k6
         B81TppSQx9fIo7GzHu4FsSdxbThS2Cvgq0jofGhDhIJX6FTrbQqMfj6TqCzkzDON4JX0
         4S9+t2SLkELhJMgJcmYm+ncNVMhKi7si+47y/CbvxToZ2IJOVFj5JXRfQDP9jQsUO8RE
         y5Inb8iPZHAxiz86nopjJEuaJ7+448N6zc9Viki/19hGumLuL8amjomF98CIl06NJ0Ll
         Cjnj+1Ahn6c/xfbIqnm3M0SqDAvxscGMyC9DRgoTc8ahf/IKUk+y5gpDHSptWCo7mu6J
         5TwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=mCxoU6s2fGfnIbm2+bkacaR6glyHPvo3dQvfOD99Mfo=;
        b=snv83ECzy/qtYwhgZYHTuOI4lwFLrY3NdbHazY8YdARQMf9AJ1QRw7Im0gsD32t1fd
         U4UMtuZQ62Vs9LucOcR+YYOOfJ54ux9qzTX3W6HD86L8Te+O3V/lK3GNYiGHvfAxv/kg
         1UpmWLc7fY62fkOOOnK0phLd+SG3puJQiksNR99MPJ8yBEb7vbh2+6Zz/nzl6s7jYZnU
         +9Ygnk9poy2Ko3RcXlNjXup/2pVI9iNE6TjU8yjYc/42B38+k9XYEZIzueTHIJAtplbs
         NZbVz1Y3sKXhCV3pDHUsFW7WU4Pc7d7w2QKUmC2y/UcArPdMnwFpX3xHNOr7tSW8ID5+
         8vRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KayGvoe1;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <bobby.prani@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z2sor535865ywe.131.2017.08.24.08.59.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 24 Aug 2017 08:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KayGvoe1;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mCxoU6s2fGfnIbm2+bkacaR6glyHPvo3dQvfOD99Mfo=;
        b=KayGvoe192mKxXt+jBmEa4kyERXaPW2Ij2TpiKufeWfsH+J7pgpn05fkJgIqQu41Bo
         J5/wQYubfCHKoVmOipyqyqXUm6gEMISiuXHIHoKqZTVvAKZSLKKGbnZclyG1ESTJpv3e
         z73HTH1yco1VK0E+KLQkmnpSfa/dq66sVS42kSmuyGcDp7NlP9SxUSUjUtHTAaZ1d1zq
         1aR+WQSLlHK6egDUUW/SgtVtMFifyuQRPQJE7Ce6yDxEvR7qoKCHrVDVcN5YyrK9RLxN
         zGez+DDGjz7ckDEpeNxZVTBUsYEjI1DXorzWYWBDmLUWstZDxMlkTrVNQeEPAjuum4lo
         Wt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mCxoU6s2fGfnIbm2+bkacaR6glyHPvo3dQvfOD99Mfo=;
        b=PdyFEyPgv+fezVU5BjkSr129Xm7ovV7mOYalQrnnrY28epe3oOGZGS8t6svIit28fY
         pge0KebZphMyihCJlqdc1Ia1WziCdGCZuRO0u+wrXkMPiiaR3oi9yEYHPgAhKgoAIP8V
         mXznLmGdBdzjXFvxmp2+kDwuTdeMLeOP3p37yqYhxSIzs4rpHQv+yh2qY6DhMAuSt5vF
         tOFcTtayTj4UpekUnpH4EEnF3YTHzpKZt7Iw03J/2Ky2Gxos5M195TT6mGalk4WRsiro
         tLcsWsq3ACrVEClaC7MuoZvv6Wd05b8JhzkHmD7BFptHWyZ9i3sNolIAF0f/bJb9hmI3
         lSXw==
X-Gm-Message-State: AHYfb5g961Yrxn0u/wgZSZonQ7V13ZKU4LMTAp73Nx8IHkRky8+ULbOy
	a+p+1/8tP5BDZZS/+FrUvA==
X-Received: by 10.37.244.13 with SMTP id q13mr5323445ybd.152.1503590356690;
        Thu, 24 Aug 2017 08:59:16 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from localhost.localdomain ([98.192.46.210])
        by smtp.gmail.com with ESMTPSA id v187sm1636867ywb.78.2017.08.24.08.59.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Aug 2017 08:59:16 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org (open list:Overall),
	qemu-arm@nongnu.org (open list:AArch64 target)
Cc: qemu-devel@nongnu.org
Subject: [RFC v2 PATCH] tcg/softmmu: Increase size of TLB caches
Date: Thu, 24 Aug 2017 11:58:49 -0400
Message-Id: <20170824155849.30799-1-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.13.0
X-TUID: V4CDwhLLTt8L

This patch increases the number of entries cached in the TLB. I went
over a few architectures to see if increasing it is problematic. Only
armv6 seems to have a limitation that only 8 bits can be used for
indexing these entries. For other architectures, the number of TLB
entries is increased to a 4K-sized cache. The patch also doubles the
number of victim TLB entries.

A few statistics collected from a build benchmark for various cache
sizes is below:

| TLB bits\vTLB entires |             8 |            16  |            32 |
|                     8 | 952.94(+0.0%) | 929.99(+2.4%)  | 919.02(+3.6%) |
|                    10 | 898.92(+5.6%) | 886.13(+7.0%)  | 887.03(+6.9%) |
|                    12 | 878.56(+7.8%) | 873.53(+8.3%)* | 875.34(+8.1%) |

The best combination for this workload came out to be 12 bits for the
TLB and a 16 entry vTLB cache.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 include/exec/cpu-defs.h  | 6 +++---
 tcg/aarch64/tcg-target.h | 1 +
 tcg/arm/tcg-target.h     | 1 +
 tcg/i386/tcg-target.h    | 2 ++
 tcg/ia64/tcg-target.h    | 1 +
 tcg/mips/tcg-target.h    | 1 +
 tcg/ppc/tcg-target.h     | 1 +
 tcg/s390/tcg-target.h    | 1 +
 tcg/sparc/tcg-target.h   | 1 +
 tcg/tci/tcg-target.h     | 1 +
 10 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index bc8e7f848d..a5e1ad6cea 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -57,8 +57,8 @@ typedef uint64_t target_ulong;
 #endif
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
-/* use a fully associative victim tlb of 8 entries */
-#define CPU_VTLB_SIZE 8
+/* use a fully associative victim tlb of 16 entries */
+#define CPU_VTLB_SIZE 16
 
 #if HOST_LONG_BITS == 32 && TARGET_LONG_BITS == 32
 #define CPU_TLB_ENTRY_BITS 4
@@ -89,7 +89,7 @@ typedef uint64_t target_ulong;
  * of tlb_table inside env (which is non-trivial but not huge).
  */
 #define CPU_TLB_BITS                                             \
-    MIN(8,                                                       \
+    MIN(CPU_TLB_BITS_MAX,                                        \
         TCG_TARGET_TLB_DISPLACEMENT_BITS - CPU_TLB_ENTRY_BITS -  \
         (NB_MMU_MODES <= 1 ? 0 :                                 \
          NB_MMU_MODES <= 2 ? 1 :                                 \
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 55a46ac825..f428e09c98 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -15,6 +15,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE  4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
+#define CPU_TLB_BITS_MAX 12
 #undef TCG_TARGET_STACK_GROWSUP
 
 typedef enum {
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 5ef1086710..69414be393 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -60,6 +60,7 @@ extern int arm_arch;
 #undef TCG_TARGET_STACK_GROWSUP
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
+#define CPU_TLB_BITS_MAX 8
 
 typedef enum {
     TCG_REG_R0 = 0,
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 73a15f7e80..35c27a977b 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -162,6 +162,8 @@ extern bool have_popcnt;
 # define TCG_AREG0 TCG_REG_EBP
 #endif
 
+#define CPU_TLB_BITS_MAX 12
+
 static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
 {
 }
diff --git a/tcg/ia64/tcg-target.h b/tcg/ia64/tcg-target.h
index 901bb7575d..fd713f7adf 100644
--- a/tcg/ia64/tcg-target.h
+++ b/tcg/ia64/tcg-target.h
@@ -28,6 +28,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 16
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 21
+#define CPU_TLB_BITS_MAX 8
 
 typedef struct {
     uint64_t lo __attribute__((aligned(16)));
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index d75cb63ed3..fd9046b7ad 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -37,6 +37,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
+#define CPU_TLB_BITS_MAX 12
 #define TCG_TARGET_NB_REGS 32
 
 typedef enum {
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 5f4a40a5b4..f5071f706d 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -34,6 +34,7 @@
 #define TCG_TARGET_NB_REGS 32
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
+#define CPU_TLB_BITS_MAX 8
 
 typedef enum {
     TCG_REG_R0,  TCG_REG_R1,  TCG_REG_R2,  TCG_REG_R3,
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 957f0c0afe..218be322ad 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -27,6 +27,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 2
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 19
+#define CPU_TLB_BITS_MAX 12
 
 typedef enum TCGReg {
     TCG_REG_R0 = 0,
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 854a0afd70..9fd59a64f2 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -29,6 +29,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
+#define CPU_TLB_BITS_MAX 12
 #define TCG_TARGET_NB_REGS 32
 
 typedef enum {
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 06963288dc..3d39d479ea 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -43,6 +43,7 @@
 #define TCG_TARGET_INTERPRETER 1
 #define TCG_TARGET_INSN_UNIT_SIZE 1
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
+#define CPU_TLB_BITS_MAX 8
 
 #if UINTPTR_MAX == UINT32_MAX
 # define TCG_TARGET_REG_BITS 32
-- 
2.13.0
