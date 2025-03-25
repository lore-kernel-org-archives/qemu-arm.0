Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2396935njc;
        Mon, 24 Mar 2025 21:59:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7QdDA+ASJs9hMw28Lw2oXOwKWLcZvenK/GNtGi1wIYkIiTylAnw5r/+FCEpZkbnMO6vYxA09AwzySDA==@linaro.org
X-Received: by 2002:a17:903:1786:b0:220:d078:eb33 with SMTP id d9443c01a7336-22780e0299cmr223060275ad.36.1742878766051;
        Mon, 24 Mar 2025 21:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878766; cv=none;
        d=google.com; s=arc-20240605;
        b=UMd/r0/PB85MQimf1Oz24kz9X/GJjX/swz3w3rnOES//3A6dbvpPXS88rgNRDW46Fd
         ZX1doQg0gnI3cHPzLOwbf1KGJXvTWzmnNnuGjNUen7v46Zr9CKm/vjLIWPmh7ggrrNTY
         jQ8i3ymcxhR3p3yu6Fbxxtfge17oG468xRiVP3gITWcGMpr7NV+hKjBmg/8SY93r3iYc
         IpX0IDVHfQkHawfdbdsvz2fTPj8nCQAEXi52zWOpfZrEJFLw6e3ou2f7ZscOOzLoIu9N
         YY3Zqx34LTwVDVmj7CRc45cYptkGppssXDMqWRJe67Kn2gfyyNsXXld47anCCcv+gM7j
         gUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HISsD/yjiDCIhuWCuAB0iBmxKFE5uY8JxwYjacPHlXU=;
        fh=uBHFqirmoubax/DZLYfbnmUJilPJHropCjUt5HcLnb4=;
        b=BLP7BH1C+P9n3BmFThXYZMTvvFaue/WKX+pBv+5+ryR4ma77NKq5jaL5PsSHLYyv+1
         5BVzv607/HSkiBnhj/2b/51QPO5JVHzJPBiuHR90vWnJqKgJHYrayFjuYR+YOQ9EqwSv
         hpL2MWjhwT820IZ52ks4WAzpWSTB666kjFvOwQFnJEC0XQu3sfIYdhRQ8PcMxsMfSU/S
         DcKC/Facijtt8c4bxbVd0rmu7prP/EmeYzt5qz5C6A4EDF/CdFLPIt29zkg3qIvxxgHv
         W48T4QVunqJibYpgQEm7KxGmrD0ETxTAl0kJGxBNxYKkXDeP4F+05AORAxWjBaEqSw5/
         Xzsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a68VIBKK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f778e51sor8302158a91.3.2025.03.24.21.59.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a68VIBKK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878765; x=1743483565; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HISsD/yjiDCIhuWCuAB0iBmxKFE5uY8JxwYjacPHlXU=;
        b=a68VIBKKwm9nLPYQEMGQ7W4i9uWyrc/8HQkux/wP2kX8oIU3Ss9tqlZUmv7cjq5zNq
         gp0/JVZGLCAaQzsQthOUIpnTAgjBGQR2LZsimEpD10Vu8jaEhHe/cLMqYRO67ukIScHc
         s/SkBVRgDl67dTrsswrNuUoga/L483tqb/aGQ/l092V+HDR3RJMo7TSxREg7M9UVmcgh
         rU0ZJLlqetQEge8NCt1ijawKarBnv4KC5/z0Qp43z+ly7E0lznVCqj2n0htiotWNTThF
         IrPTsj81K2qTaX2RuhHJUrkaERXcpTEPgRWKKOXbeO1fwSTgCnN01EoaygnwJucCzudl
         xOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878765; x=1743483565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HISsD/yjiDCIhuWCuAB0iBmxKFE5uY8JxwYjacPHlXU=;
        b=CDaEY8ih1AnfFAN7M8HJBaowbTbEARV3EjYBW7BJ6KrXFkee57UVgytBcVDr6MzN7w
         Eq1CsUEOJVIz0Z+WvriZuNBqtXdsWeCyXOuIF8v5YIkmEI4oRtYSmgdjS3/Domv8mOIZ
         uP3ZYQbO9jLARiEZI3eZETiysIYhyaQKmkFUZvHZ0HjE1sXSsq2JyZOv7axaUKokKuyQ
         AZ+jz9ZKEptT1EFdau5/rj6uBLCcpU/lIXyoSEyNhazJ/1+3IUmk7FE6TT+SuK8734w6
         duinKGwM6khR+TByrNxr4dweEiXYbvV6VimbXjDeSZAzYbbwI+6IRvIp3La17wkTAGFP
         lf1g==
X-Forwarded-Encrypted: i=1; AJvYcCX604PdwG+/W1N67BkWehcuRN9F9Tq/KAVVjhjJym5Zh0Gzci56Vn4XaYVlVDhjazqTxl6H4M2LkgBJ3Q==@linaro.org
X-Gm-Message-State: AOJu0YwdwJ+wlmZTxnBSppt0wHFg6SUNGdFfboNu0WxcGyys2KYR1eAL
	fR1MLm2guqqsJtd7KbeZcREnff6UUPSRowf6kLAPvK36rNo6/39Lrp1Nh4KQHQvDUA==
X-Gm-Gg: ASbGncuKFRx34hZU8OJkYqWk1gdeBJP28huMSgfcNOwqGZRulTK44zWi8ucsKMmUdvt
	lOzUPJKpDi46o7zx4UZOYZ0/cMP8dQLTiALeaC8neE9VdC7fj8URWIl7e1DHYfjQoY9+J3HID8C
	7ut/2MydqxoTlsDq5Di1RR0vmFIIl3RuS+Zkfny9obzbAWrpberGGrjATpcgUD/QjgGYnbIp7qG
	i1A/qm0XqdAnzDP2pq1OIW6/fs5AxtlEMo2Jq3jF3aSWgVmNUox1q7FL8BPkZPTG8+rYsxt0aKs
	2nRTdPmikZx8t6OXivOAMLa+0sZvc64x7Cknv9+ZphnRnR4rgVxLcqU=
X-Google-Smtp-Source: AGHT+IFoY1eiSJJfufVJQZtYSRSJk0fK81aF9nqBARSwohBwsIhwmUMW832ig2eDHAk631vAPf9qQQ==
X-Received: by 2002:a17:90b:350f:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-303100222fdmr22200481a91.35.1742878765386;
        Mon, 24 Mar 2025 21:59:25 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 04/29] exec/cpu-all: remove system/memory include
Date: Mon, 24 Mar 2025 21:58:49 -0700
Message-Id: <20250325045915.994760-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IcRdMCkqVXVL

We include this header where needed. When includes set already have
ifdef CONFIG_USER_ONLY, we add it here, else, we don't condition the
include.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/s390x/ipl.h                       | 1 +
 include/exec/cpu-all.h               | 3 ---
 target/arm/internals.h               | 1 +
 target/hppa/cpu.h                    | 1 +
 target/i386/hvf/vmx.h                | 1 +
 target/ppc/mmu-hash32.h              | 2 ++
 hw/ppc/spapr_ovec.c                  | 1 +
 target/alpha/helper.c                | 1 +
 target/arm/hvf/hvf.c                 | 1 +
 target/avr/helper.c                  | 1 +
 target/i386/arch_memory_mapping.c    | 1 +
 target/i386/helper.c                 | 1 +
 target/i386/tcg/system/misc_helper.c | 1 +
 target/i386/tcg/system/tcg-cpu.c     | 1 +
 target/m68k/helper.c                 | 1 +
 target/ppc/excp_helper.c             | 1 +
 target/ppc/mmu-book3s-v3.c           | 1 +
 target/ppc/mmu-hash64.c              | 1 +
 target/ppc/mmu-radix64.c             | 1 +
 target/riscv/cpu_helper.c            | 1 +
 target/sparc/ldst_helper.c           | 1 +
 target/sparc/mmu_helper.c            | 1 +
 target/xtensa/mmu_helper.c           | 1 +
 target/xtensa/op_helper.c            | 1 +
 24 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
index c6ecb3433cc..6557ac3be5b 100644
--- a/hw/s390x/ipl.h
+++ b/hw/s390x/ipl.h
@@ -15,6 +15,7 @@
 
 #include "cpu.h"
 #include "system/address-spaces.h"
+#include "system/memory.h"
 #include "hw/qdev-core.h"
 #include "hw/s390x/ipl/qipl.h"
 #include "qom/object.h"
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index b1067259e6b..eb029b65552 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -24,9 +24,6 @@
 #include "exec/cpu-interrupt.h"
 #include "exec/tswap.h"
 #include "hw/core/cpu.h"
-#ifndef CONFIG_USER_ONLY
-#include "system/memory.h"
-#endif
 
 /* page related stuff */
 #include "exec/cpu-defs.h"
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 28585c07555..895d60218e3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -28,6 +28,7 @@
 #include "exec/breakpoint.h"
 #include "hw/registerfields.h"
 #include "tcg/tcg-gvec-desc.h"
+#include "system/memory.h"
 #include "syndrome.h"
 #include "cpu-features.h"
 
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 7be4a1d3800..bb997d07516 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -22,6 +22,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "system/memory.h"
 #include "qemu/cpu-float.h"
 #include "qemu/interval-tree.h"
 #include "hw/registerfields.h"
diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
index 87a478f7fde..3ddf7982ff3 100644
--- a/target/i386/hvf/vmx.h
+++ b/target/i386/hvf/vmx.h
@@ -34,6 +34,7 @@
 #include "system/hvf_int.h"
 
 #include "system/address-spaces.h"
+#include "system/memory.h"
 
 static inline uint64_t rreg(hv_vcpuid_t vcpu, hv_x86_reg_t reg)
 {
diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 2838de031c7..04c23ea75ed 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -3,6 +3,8 @@
 
 #ifndef CONFIG_USER_ONLY
 
+#include "system/memory.h"
+
 bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
                       hwaddr *raddrp, int *psizep, int *protp, int mmu_idx,
                       bool guest_visible);
diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
index 6d6eaf67cba..75ab4fe2623 100644
--- a/hw/ppc/spapr_ovec.c
+++ b/hw/ppc/spapr_ovec.c
@@ -16,6 +16,7 @@
 #include "migration/vmstate.h"
 #include "qemu/bitmap.h"
 #include "system/address-spaces.h"
+#include "system/memory.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 #include <libfdt.h>
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 57cefcba144..f6261a3a53c 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -25,6 +25,7 @@
 #include "fpu/softfloat-types.h"
 #include "exec/helper-proto.h"
 #include "qemu/qemu-print.h"
+#include "system/memory.h"
 
 
 #define CONVERT_BIT(X, SRC, DST) \
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 93a3f9b53d4..34ca36fab55 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -23,6 +23,7 @@
 #include <mach/mach_time.h>
 
 #include "system/address-spaces.h"
+#include "system/memory.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "qemu/main-loop.h"
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 6b90fa82c3d..64781bbf826 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -27,6 +27,7 @@
 #include "exec/page-protection.h"
 #include "exec/cpu_ldst.h"
 #include "system/address-spaces.h"
+#include "system/memory.h"
 #include "exec/helper-proto.h"
 #include "qemu/plugin.h"
 
diff --git a/target/i386/arch_memory_mapping.c b/target/i386/arch_memory_mapping.c
index ced199862dd..a2398c21732 100644
--- a/target/i386/arch_memory_mapping.c
+++ b/target/i386/arch_memory_mapping.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "system/memory_mapping.h"
+#include "system/memory.h"
 
 /* PAE Paging or IA-32e Paging */
 static void walk_pte(MemoryMappingList *list, AddressSpace *as,
diff --git a/target/i386/helper.c b/target/i386/helper.c
index c07b1b16ea1..64d9e8ab9c4 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -25,6 +25,7 @@
 #include "system/runstate.h"
 #ifndef CONFIG_USER_ONLY
 #include "system/hw_accel.h"
+#include "system/memory.h"
 #include "monitor/monitor.h"
 #include "kvm/kvm_i386.h"
 #endif
diff --git a/target/i386/tcg/system/misc_helper.c b/target/i386/tcg/system/misc_helper.c
index 0555cf26041..67896c8c875 100644
--- a/target/i386/tcg/system/misc_helper.c
+++ b/target/i386/tcg/system/misc_helper.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "system/address-spaces.h"
+#include "system/memory.h"
 #include "exec/cputlb.h"
 #include "tcg/helper-tcg.h"
 #include "hw/i386/apic.h"
diff --git a/target/i386/tcg/system/tcg-cpu.c b/target/i386/tcg/system/tcg-cpu.c
index ab1f3c7c595..0538a4fd51a 100644
--- a/target/i386/tcg/system/tcg-cpu.c
+++ b/target/i386/tcg/system/tcg-cpu.c
@@ -24,6 +24,7 @@
 #include "system/system.h"
 #include "qemu/units.h"
 #include "system/address-spaces.h"
+#include "system/memory.h"
 
 #include "tcg/tcg-cpu.h"
 
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 0bf574830f9..82512722191 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -25,6 +25,7 @@
 #include "exec/page-protection.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
+#include "system/memory.h"
 #include "gdbstub/helpers.h"
 #include "fpu/softfloat.h"
 #include "qemu/qemu-print.h"
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c941c89806e..da8b525a41b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "qemu/log.h"
+#include "system/memory.h"
 #include "system/tcg.h"
 #include "system/system.h"
 #include "system/runstate.h"
diff --git a/target/ppc/mmu-book3s-v3.c b/target/ppc/mmu-book3s-v3.c
index a812cb51139..38655563105 100644
--- a/target/ppc/mmu-book3s-v3.c
+++ b/target/ppc/mmu-book3s-v3.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "system/memory.h"
 #include "cpu.h"
 #include "mmu-hash64.h"
 #include "mmu-book3s-v3.h"
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 5ca4faee2ab..3ba4810497e 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -25,6 +25,7 @@
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "system/hw_accel.h"
+#include "system/memory.h"
 #include "kvm_ppc.h"
 #include "mmu-hash64.h"
 #include "exec/log.h"
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 461eda4a3dc..4ab5f3bb920 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -23,6 +23,7 @@
 #include "exec/page-protection.h"
 #include "qemu/error-report.h"
 #include "system/kvm.h"
+#include "system/memory.h"
 #include "kvm_ppc.h"
 #include "exec/log.h"
 #include "internal.h"
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0dd8645994d..ca58094fb54 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -26,6 +26,7 @@
 #include "exec/cputlb.h"
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
+#include "system/memory.h"
 #include "instmap.h"
 #include "tcg/tcg-op.h"
 #include "accel/tcg/cpu-ops.h"
diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index b559afc9a94..eda5f103f10 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -27,6 +27,7 @@
 #include "exec/cputlb.h"
 #include "exec/page-protection.h"
 #include "exec/cpu_ldst.h"
+#include "system/memory.h"
 #ifdef CONFIG_USER_ONLY
 #include "user/page-protection.h"
 #endif
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index cce3046b694..48fb2179b2d 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -24,6 +24,7 @@
 #include "exec/cpu-mmu-index.h"
 #include "exec/page-protection.h"
 #include "exec/tlb-flags.h"
+#include "system/memory.h"
 #include "qemu/qemu-print.h"
 #include "trace.h"
 
diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
index 96140c89c76..72910fb1c80 100644
--- a/target/xtensa/mmu_helper.c
+++ b/target/xtensa/mmu_helper.c
@@ -36,6 +36,7 @@
 #include "exec/cpu-mmu-index.h"
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
+#include "system/memory.h"
 
 #define XTENSA_MPU_SEGMENT_MASK 0x0000001f
 #define XTENSA_MPU_ACC_RIGHTS_MASK 0x00000f00
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 028d4e0a1c7..c125fa49464 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -31,6 +31,7 @@
 #include "exec/page-protection.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "system/memory.h"
 #include "qemu/atomic.h"
 #include "qemu/timer.h"
 
-- 
2.39.5
