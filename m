Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1225401njf;
        Mon, 2 Sep 2024 13:32:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1K7IPOLqsxwlZaUfYQOXyVY3q7jS84qGGmu1s7OSL1Q5Dnt3IJWK99V9UZKhtxtvq6fcYCPro87VJHg==@linaro.org
X-Google-Smtp-Source: AGHT+IGJMh7UwaHhFAlnaFTUWwz3dLP2b1HICMYo4Fc8IO6X1XBatsYVrx3HegGk/eQVKjhfQ4MB
X-Received: by 2002:a05:600c:a05:b0:428:29d:4b59 with SMTP id 5b1f17b1804b1-42bb01c2271mr123905315e9.20.1725309134085;
        Mon, 02 Sep 2024 13:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725309134; cv=none;
        d=google.com; s=arc-20240605;
        b=br9gPdni65fNjiKu14t7SAS4d0weeBmyyYaSGSsDVsHJH2IXPonlrt9Li5hPkj6mpy
         OR23l+LhP3oZJHrKH+BVC6k0OdBGbLQaS+9C2K9/3UGeV/cJIcDjuWKPz7Lz/1jQkGNx
         inSxZvFi2Yf7Q6rKh4G3OD3e9nql8UPZEutM2n3sSJM6N03WMMijr4++zfAhCHpdfggY
         kipnhzZhacv9n7jFy3gvPvoUmcknCuNNGTJeV+mzKpzogJDX7nwty5QYdIKsS6/dyojY
         cAlD1+YNhJ3+Dsp1cYse+9dhmMyPKM8G71SqSIHENebzHiW05nJYF0Lzg5KvWOA5xPwF
         w//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=9uXaDCDIOldbkPGWLuiQiiFhSSa+DMRb3CLcqoW2Yss=;
        fh=DFoqy1KDHJ65Sk33YexJ1qtPwmZQyS3+oglGtRkvlE0=;
        b=Pjr/WasLWqx2VfYoL6e7a/Fpjdzppm8mEKEaigZRvmA9jCER0wYWovYP30dZOEQYSb
         qCSsf7Ap9OPW3pwr6mgVEF1VkK4diWnsxU3O5KGSvFPqcL00MrQ3uxuM0qE5QQCoRh7G
         aUS81wKOOlQWtCSy4gzoylzgbrYTYOfNke+0TUoFEPIfl/YaOw9KIpRN7vbo228JSg1U
         3cwXvjEm94CXYqFSzgqZL7GV6fvSfvF+sdEM5bLtwkXJyej3pTyqoszxB3pktz81VMbt
         tQnNl3q1e+j1Ggz9px49yTEhr7gfl6H816u9C2+DYLl6dCmkosJoKC/n8rWu+ZAW4V7p
         97hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=alireza.sanaee@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <alireza.sanaee@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42bb6deab43si51550635e9.42.2024.09.02.13.32.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2024 13:32:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=alireza.sanaee@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WyL0n6Bc8z6K5n5;
	Tue,  3 Sep 2024 04:27:53 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (unknown [7.191.161.198])
	by mail.maildlp.com (Postfix) with ESMTPS id E221B14058E;
	Tue,  3 Sep 2024 04:32:12 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.78.245) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 21:32:12 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <linuxarm@huawei.com>, <peter.maydell@linaro.org>,
	<richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
	<Jonathan.Cameron@Huawei.com>, <alex.bennee@linaro.org>, <philmd@linaro.org>,
	<jiangkunkun@huawei.com>
Subject: [PATCH v3] target/arm/tcg: refine cache descriptions with a wrapper
Date: Mon, 2 Sep 2024 21:32:11 +0100
Message-ID: <20240902203211.270-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.78.245]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500006.china.huawei.com (7.191.161.198)
X-TUID: dNoDBdkwUfSP

This patch allows for easier manipulation of the cache description
register, CCSIDR. Which is helpful for testing as well. Currently,
numbers get hard-coded and might be prone to errors.

Therefore, this patch adds a wrapper for different types of CPUs
available in tcg to decribe caches. One function `make_ccsidr` supports
two cases by carrying a parameter as FORMAT that can be LEGACY and
CCIDX which determines the specification of the register.

For CCSIDR register, 32 bit version follows specification [1].
Conversely, 64 bit version follows specification [2].

Changes from v2 [3] -> v3:

1) add only one function instead of ccsidr32 and ccsidr64
2) use deposit32 and deposit64 in ccsidr function

[1] B4.1.19, ARM Architecture Reference Manual ARMv7-A and ARMv7-R
edition, https://developer.arm.com/documentation/ddi0406
[2] D23.2.29, ARM Architecture Reference Manual for A-profile Architecture,
https://developer.arm.com/documentation/ddi0487/latest/
[3] https://lore.kernel.org/qemu-devel/20240830184713.224-1-alireza.sanaee@huawei.com/

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 target/arm/cpu-features.h |  50 ++++++++++++++++++
 target/arm/cpu64.c        |  19 ++++---
 target/arm/tcg/cpu64.c    | 108 +++++++++++++++++++-------------------
 3 files changed, 117 insertions(+), 60 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index c59ca104fe..ef40b0dfdc 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1022,6 +1022,56 @@ static inline bool isar_feature_any_evt(const ARMISARegisters *id)
     return isar_feature_aa64_evt(id) || isar_feature_aa32_evt(id);
 }
 
+typedef enum {
+    CCSIDR_FORMAT_LEGACY,
+    CCSIDR_FORMAT_CCIDX,
+} CCSIDRFormat;
+
+static inline uint64_t make_ccsidr(CCSIDRFormat format, unsigned assoc,
+                                   unsigned linesize, unsigned cachesize,
+                                   uint8_t flags)
+{
+    unsigned lg_linesize = ctz32(linesize);
+    unsigned sets;
+    uint32_t ccsidr32 = 0;
+    uint64_t ccsidr64 = 0;
+
+    assert(assoc != 0);
+    assert(is_power_of_2(linesize));
+    assert(lg_linesize >= 4 && lg_linesize <= 7 + 4);
+
+    /* sets * associativity * linesize == cachesize. */
+    sets = cachesize / (assoc * linesize);
+    assert(cachesize % (assoc * linesize) == 0);
+
+    if (format == CCSIDR_FORMAT_LEGACY) {
+        /*
+         * The 32-bit CCSIDR format is:
+         *   [27:13] number of sets - 1
+         *   [12:3]  associativity - 1
+         *   [2:0]   log2(linesize) - 4
+         *           so 0 == 16 bytes, 1 == 32 bytes, 2 == 64 bytes, etc
+         */
+        ccsidr32 = deposit32(ccsidr32, 28,  4, flags);
+        ccsidr32 = deposit32(ccsidr32, 13, 15, sets - 1);
+        ccsidr32 = deposit32(ccsidr32,  3, 10, assoc - 1);
+        ccsidr32 = deposit32(ccsidr32,  0,  3, lg_linesize - 4);
+        return (uint64_t)ccsidr32;
+    } else {
+        /*
+         * The 64-bit CCSIDR_EL1 format is:
+         *   [55:32] number of sets - 1
+         *   [23:3]  associativity - 1
+         *   [2:0]   log2(linesize) - 4
+         *           so 0 == 16 bytes, 1 == 32 bytes, 2 == 64 bytes, etc
+         */
+        ccsidr64 = deposit64(ccsidr64, 32, 24, sets - 1);
+        ccsidr64 = deposit64(ccsidr64,  3, 21, assoc - 1);
+        ccsidr64 = deposit64(ccsidr64,  0,  3, lg_linesize - 4);
+        return ccsidr64;
+    }
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 262a1d6c0b..458d1cee01 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "cpregs.h"
 #include "qemu/module.h"
+#include "qemu/units.h"
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
 #include "sysemu/qtest.h"
@@ -642,9 +643,12 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41013000;
     cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
+    /* 32KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    /* 48KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
+    /* 2048KB L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB, 7);
     cpu->dcz_blocksize = 4; /* 64 bytes */
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
@@ -700,9 +704,12 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.dbgdevid1 = 0x1;
     cpu->isar.reset_pmcr_el0 = 0x41033000;
     cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe07a; /* 1024KB L2 cache */
+    /* 32KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    /* 32KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 1, 64, 32 * KiB, 2);
+    /* 1024KB L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 1 * MiB, 7);
     cpu->dcz_blocksize = 4; /* 64 bytes */
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index fe232eb306..904a7e90b4 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -29,32 +29,6 @@
 #include "cpu-features.h"
 #include "cpregs.h"
 
-static uint64_t make_ccsidr64(unsigned assoc, unsigned linesize,
-                              unsigned cachesize)
-{
-    unsigned lg_linesize = ctz32(linesize);
-    unsigned sets;
-
-    /*
-     * The 64-bit CCSIDR_EL1 format is:
-     *   [55:32] number of sets - 1
-     *   [23:3]  associativity - 1
-     *   [2:0]   log2(linesize) - 4
-     *           so 0 == 16 bytes, 1 == 32 bytes, 2 == 64 bytes, etc
-     */
-    assert(assoc != 0);
-    assert(is_power_of_2(linesize));
-    assert(lg_linesize >= 4 && lg_linesize <= 7 + 4);
-
-    /* sets * associativity * linesize == cachesize. */
-    sets = cachesize / (assoc * linesize);
-    assert(cachesize % (assoc * linesize) == 0);
-
-    return ((uint64_t)(sets - 1) << 32)
-         | ((assoc - 1) << 3)
-         | (lg_linesize - 4);
-}
-
 static void aarch64_a35_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -106,9 +80,12 @@ static void aarch64_a35_initfn(Object *obj)
     cpu->isar.reset_pmcr_el0 = 0x410a3000;
 
     /* From B2.29 Cache ID registers */
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x703fe03a; /* 512KB L2 cache */
+    /* 32KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    /* 32KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 2);
+    /* 512KB L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 512 * KiB, 7);
 
     /* From B3.5 VGIC Type register */
     cpu->gic_num_lrs = 4;
@@ -272,9 +249,12 @@ static void aarch64_a55_initfn(Object *obj)
     cpu->revidr = 0;
 
     /* From B2.23 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
+    /* 32KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    /* 32KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 2);
+    /* 512KB L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 512 * KiB, 7);
 
     /* From B2.96 SCTLR_EL3 */
     cpu->reset_sctlr = 0x30c50838;
@@ -338,9 +318,12 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41023000;
     cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe07a; /* 1MB L2 cache */
+    /* 32KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    /* 48KB L1 dcache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
+    /* 1MB L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 1 * MiB, 7);
     cpu->dcz_blocksize = 4; /* 64 bytes */
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
@@ -397,9 +380,12 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->revidr = 0;
 
     /* From B2.18 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe03a; /* 512KB L2 cache */
+    /* 64KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
+    /* 64KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
+    /* 512KB L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 512 * KiB, 7);
 
     /* From B2.93 SCTLR_EL3 */
     cpu->reset_sctlr = 0x30c50838;
@@ -449,9 +435,12 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->isar.id_aa64isar1 = 0x0000000000010001;
     cpu->isar.id_aa64zfr0 = 0x0000000000000000;
     cpu->clidr = 0x0000000080000023;
-    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
+    /* 64KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 7);
+    /* 64KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 2);
+    /* 8MB L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 256, 8 * MiB, 7);
     cpu->dcz_blocksize = 6; /* 256 bytes */
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
@@ -637,9 +626,12 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->revidr = 0;
 
     /* From B2.23 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe03a; /* 1MB L2 cache */
+    /* 64KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
+    /* 64KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
+    /* 1MB L2 dcache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
 
     /* From B2.98 SCTLR_EL3 */
     cpu->reset_sctlr = 0x30c50838;
@@ -721,9 +713,12 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
      * L2: 8-way set associative, 64 byte line size, either 512K or 1MB.
      * L3: No L3 (this matches the CLIDR_EL1 value).
      */
-    cpu->ccsidr[0] = make_ccsidr64(4, 64, 64 * KiB); /* L1 dcache */
-    cpu->ccsidr[1] = cpu->ccsidr[0];                 /* L1 icache */
-    cpu->ccsidr[2] = make_ccsidr64(8, 64, 1 * MiB);  /* L2 cache */
+    /* 64KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0);
+    /* 64KB L1 icache */
+    cpu->ccsidr[1] = cpu->ccsidr[0];
+    /* 1MB L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 1 * MiB, 0);
 
     /* From 3.2.115 SCTLR_EL3 */
     cpu->reset_sctlr = 0x30c50838;
@@ -959,9 +954,12 @@ static void aarch64_a710_initfn(Object *obj)
      * L1: 4-way set associative 64-byte line size, total either 32K or 64K.
      * L2: 8-way set associative 64 byte line size, total either 256K or 512K.
      */
-    cpu->ccsidr[0] = make_ccsidr64(4, 64, 64 * KiB);   /* L1 dcache */
-    cpu->ccsidr[1] = cpu->ccsidr[0];                   /* L1 icache */
-    cpu->ccsidr[2] = make_ccsidr64(8, 64, 512 * KiB);  /* L2 cache */
+    /* L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0);
+    /* L1 icache */
+    cpu->ccsidr[1] = cpu->ccsidr[0];
+    /* L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 512 * KiB, 0);
 
     /* FIXME: Not documented -- copied from neoverse-v1 */
     cpu->reset_sctlr = 0x30c50838;
@@ -1057,10 +1055,12 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
      * L1: 4-way set associative 64-byte line size, total 64K.
      * L2: 8-way set associative 64 byte line size, total either 512K or 1024K.
      */
-    cpu->ccsidr[0] = make_ccsidr64(4, 64, 64 * KiB);   /* L1 dcache */
-    cpu->ccsidr[1] = cpu->ccsidr[0];                   /* L1 icache */
-    cpu->ccsidr[2] = make_ccsidr64(8, 64, 512 * KiB);  /* L2 cache */
-
+    /* L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0);
+    /* L1 icache */
+    cpu->ccsidr[1] = cpu->ccsidr[0];
+    /* L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 512 * KiB, 0);
     /* FIXME: Not documented -- copied from neoverse-v1 */
     cpu->reset_sctlr = 0x30c50838;
 
-- 
2.34.1
