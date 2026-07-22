Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E153C4453A
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Jul 2026 18:42:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmbsz-0004TE-4p; Wed, 22 Jul 2026 14:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmbsk-0004Mt-E9
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 14:41:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmbsh-0006NT-Sc
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 14:41:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-38de840f2f0so8797099a91.0
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 11:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784745682; x=1785350482; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1iV4cfKmJ85SbIeZG946KmTHF9GXveJIAMOLWNKJw6s=;
 b=FVLXx7sXgaZbz0eX7s/pex54wb5FZa3b6ulp8uVhVJE6Tup3qbesKlz66iLd8SuULF
 ghLuI+wwWQLDuQT6JwxoQGNrNe9X9UC93Guf8NUucikDOXlxrMrVpqnnsZnOOJ2DrVXx
 1hqL79uYvTcwhrBH832C70zrffBoPU0c441xhZzctSI73oUgbyh+lXA7If8zSzMxFYdQ
 OohWhfqSAgts1cH2LMHyc1owxrlYnq/kQkEtduMleV/PAToUeqKB1a8czQMpe7A4gYaW
 e+XutmRHj3QeUvtiPNODK2qLjcfAsmWomnhCJ5SbNbyfBEizp69pwWL4p7yNSNPp18fB
 Q1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784745682; x=1785350482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1iV4cfKmJ85SbIeZG946KmTHF9GXveJIAMOLWNKJw6s=;
 b=adTWQ7uPL+4pcDsBEAhJM4ZFbKPYtGxnda4StbvqL6Y/5+4fdc4Jh7WJBH/fM3vRWz
 XIO104jXuiTaijGO80yOdfpb79jQ1RlUbSTuPO969MjZ1QxKZ2EbYtgsKbqu14OZEsC4
 IezMxkSLS03xyNqkojx8Ow+kt3E8CBtwBJgaa5OKwjOvlQ2qPZFTZSWoL7p5S4zdYjK1
 Zuoc9EcQPlLL6AtDWyRnkBepT3kXJFnZjdJVvRZB4BN3BktbT+22+lbJ/oPIA3LDabsP
 Gc8NHrTql77GfmNOZ23tbmu+SwSZarluvPxeJEc08aV1SFztxM3umGFsTz0hYCjsxoQY
 P6jg==
X-Gm-Message-State: AOJu0YxQRS1yhwyaYGOOvRBXfjzMDxKwl5sasDBkwfs8b96im36CbVUs
 33m0qDUfI8Fxpie1VGY0UPq18JKxd7DpUyquVaab0p2UBP2xDe7KIB0doubQxDsTk7mjaeNF52f
 SpctB
X-Gm-Gg: AR+sD12uN951tDTjGcuv+BkyMdptdLaZhWI+9fk0Uhmpn/5k9JKO0mzb1VBvaIGqk2O
 4vj6zdK9OSH2/8nRSnc4uiHdJgCYo7VLFqvB1VRwYqQltfbRG0tv751sgvPoE1Jl2YwgMbDX18M
 u1Foq1GEHEgeU87RvGKiVZUU+Gz+xZBMDsQ+G8N6Ysp6fXa948aSBrQ1qfZ3T0FyxnUEOLdNaGc
 OL8tZQNjqx2ueARJqWNredNDeJlWb4g5QKCXSv1368WYjOgrPyUio9nkp/+uYADyxo8vBh74VZY
 aGR7C9gYOgxClJ1nIGtjss1X2w1XzTKQM5f6EraagBa6dO7ZU1p4KnPjl0wVTqbSBfzutwDvnmd
 wF+Ae4PUhbvv+nGm2lv3Qzihzvu9yuYD7QWxJ7rQJFiH8s0J+ljPFo/uRSoJJsdwXyaVsboZRHy
 ZOex2zQarAqVmHKkXcfH+cXSxiLSatT5BYwhSDX1vemzEecCintvvnhC3hU8Vp11VoVOToPA5q
X-Received: by 2002:a17:90a:d886:b0:37f:9cdf:f03c with SMTP id
 98e67ed59e1d1-38e4b54082emr22950740a91.31.1784745682195; 
 Wed, 22 Jul 2026 11:41:22 -0700 (PDT)
Received: from stoup.. (162-198-231-97.lightspeed.wlfrct.sbcglobal.net.
 [162.198.231.97]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13d13015052sm8559298c88.5.2026.07.22.11.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2026 11:41:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 3/3] host/aarch64: Implement atomic64_{read,
 set} with FEAT_LS64
Date: Wed, 22 Jul 2026 11:41:17 -0700
Message-ID: <20260722184117.11937-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722184117.11937-1-richard.henderson@linaro.org>
References: <20260722184117.11937-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Detect the host feature in cpuid, then use it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/aarch64/host/cpuinfo.h           |  1 +
 include/qemu/value64.h                        |  7 ++++
 util/cpuinfo-aarch64.c                        | 14 ++++++--
 .../include/aarch64/host/atomic512-ldst.h.inc | 36 +++++++++++++++++++
 meson.build                                   |  8 +++++
 5 files changed, 63 insertions(+), 3 deletions(-)
 create mode 100644 host/include/aarch64/host/atomic512-ldst.h.inc

diff --git a/host/include/aarch64/host/cpuinfo.h b/host/include/aarch64/host/cpuinfo.h
index fe671534e4..ac3a224fc3 100644
--- a/host/include/aarch64/host/cpuinfo.h
+++ b/host/include/aarch64/host/cpuinfo.h
@@ -12,6 +12,7 @@
 #define CPUINFO_AES             (1u << 3)
 #define CPUINFO_PMULL           (1u << 4)
 #define CPUINFO_BTI             (1u << 5)
+#define CPUINFO_LS64            (1u << 6)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/include/qemu/value64.h b/include/qemu/value64.h
index 7de287a13d..b74316bf82 100644
--- a/include/qemu/value64.h
+++ b/include/qemu/value64.h
@@ -3,12 +3,19 @@
 #ifndef QEMU_VALUE64_H
 #define QEMU_VALUE64_H
 
+#ifdef __aarch64__
+#include <arm_acle.h>
+#endif
+
 /*
  * An stream of 64 bytes; no endianness implied.
  * The members are perforce host byte ordering.
  */
 typedef union {
     uint64_t l[8];
+#ifdef __aarch64__
+    data512_t arm;
+#endif
 } Value64;
 
 #endif /* QEMU_VALUE64_H */
diff --git a/util/cpuinfo-aarch64.c b/util/cpuinfo-aarch64.c
index 288074c08f..0a01050626 100644
--- a/util/cpuinfo-aarch64.c
+++ b/util/cpuinfo-aarch64.c
@@ -13,9 +13,6 @@
 #  include <asm/hwcap.h>
 #  include "elf.h"
 # endif
-# ifndef HWCAP2_BTI
-#  define HWCAP2_BTI 0  /* added in glibc 2.32 */
-# endif
 #endif
 #ifdef CONFIG_ELF_AUX_INFO
 #include <sys/auxv.h>
@@ -29,6 +26,13 @@
 # include <sys/sysctl.h>
 #endif
 
+#ifndef HWCAP2_BTI
+# define HWCAP2_BTI 0  /* added in glibc 2.32 */
+#endif
+#ifndef HWCAP3_LS64
+# define HWCAP3_LS64 0 /* added in glibc 2.44 */
+#endif
+
 unsigned cpuinfo;
 
 #ifdef CONFIG_DARWIN
@@ -72,6 +76,9 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
 
     unsigned long hwcap2 = qemu_getauxval(AT_HWCAP2);
     info |= (hwcap2 & HWCAP2_BTI ? CPUINFO_BTI : 0);
+
+    unsigned long hwcap3 = qemu_getauxval(AT_HWCAP3);
+    info |= (hwcap3 & HWCAP3_LS64 ? CPUINFO_LS64 : 0);
 #endif
 #ifdef CONFIG_DARWIN
     info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE") * CPUINFO_LSE;
@@ -79,6 +86,7 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
     info |= sysctl_for_bool("hw.optional.arm.FEAT_AES") * CPUINFO_AES;
     info |= sysctl_for_bool("hw.optional.arm.FEAT_PMULL") * CPUINFO_PMULL;
     info |= sysctl_for_bool("hw.optional.arm.FEAT_BTI") * CPUINFO_BTI;
+    info |= sysctl_for_bool("hw.optional.arm.FEAT_LS64") * CPUINFO_LS64;
 #endif
 #if defined(__OpenBSD__) && !defined(CONFIG_ELF_AUX_INFO)
     int mib[2];
diff --git a/host/include/aarch64/host/atomic512-ldst.h.inc b/host/include/aarch64/host/atomic512-ldst.h.inc
new file mode 100644
index 0000000000..a254560be7
--- /dev/null
+++ b/host/include/aarch64/host/atomic512-ldst.h.inc
@@ -0,0 +1,36 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Load/store for 512-bit atomic operations, AArch64 version.
+ */
+
+#ifndef HOST_ATOMIC512_LDST_H
+#define HOST_ATOMIC512_LDST_H
+
+#ifdef CONFIG_ARM_LS64_BUILTIN
+#include "host/cpuinfo.h"
+#include <arm_acle.h>
+
+#ifdef __ARM_FEATURE_LS64
+# define HAVE_ATOMIC512_LD  true
+# define ATTR_LS64_ACCEL
+#else
+# define HAVE_ATOMIC512_LD  likely(cpuinfo & CPUINFO_LS64)
+# define ATTR_LS64_ACCEL  __attribute__((target("+ls64")))
+#endif
+#define HAVE_ATOMIC512_ST   HAVE_ATOMIC512_LD
+
+static inline Value64 ATTR_LS64_ACCEL atomic64_read(const void *s)
+{
+    return (Value64){ .arm = __arm_ld64b(s) };
+}
+
+static inline void ATTR_LS64_ACCEL atomic64_set(void *d, const Value64 *v)
+{
+    __arm_st64b(d, v->arm);
+}
+
+#else
+#include "host/include/generic/host/atomic512-ldst.h.inc"
+#endif
+
+#endif /* HOST_ATOMIC512_LDST_H */
diff --git a/meson.build b/meson.build
index 164328ded8..5afeda83fd 100644
--- a/meson.build
+++ b/meson.build
@@ -3106,6 +3106,14 @@ config_host_data.set('CONFIG_ARM_AES_BUILTIN', cc.compiles('''
     void foo(uint8x16_t *p) { *p = vaesmcq_u8(*p); }
   '''))
 
+config_host_data.set('CONFIG_ARM_LS64_BUILTIN', cc.compiles('''
+    #include <arm_acle.h>
+    #ifndef __ARM_FEATURE_LS64
+    __attribute__((target("+ls64")))
+    #endif
+    void foo(void *p, void *q) { __arm_st64b(q, __arm_ld64b(p)); }
+  '''))
+
 if get_option('membarrier').disabled()
   have_membarrier = false
 elif host_os == 'windows'
-- 
2.43.0


