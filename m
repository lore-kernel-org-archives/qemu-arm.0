Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278892njc;
        Thu, 20 Mar 2025 15:30:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMW9tG+/jdBXlMzJenICQK6L3PIZ1ON2QKGvLKZ/QDojzakM/XgHwKE2J2hlWW5CoeVR3ozcR/f1pCcA==@linaro.org
X-Received: by 2002:a17:902:e892:b0:223:26da:4b6f with SMTP id d9443c01a7336-22780c7be85mr17176765ad.14.1742509819399;
        Thu, 20 Mar 2025 15:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509819; cv=none;
        d=google.com; s=arc-20240605;
        b=R+qj324XAk2uTVgykTBuN5eFhHFUuXfVEt1C76Lna0mZCne7ylss3oQ2vXOvyYXYCb
         c3WpeXaeIuJJqOOpqxoqE8n8UfyKs/IbqHUzEVQ7PxPQNlaXjSsnIjt0+NeS3yYuvak7
         0huqehplehXOKdnGFyFvOlhxuiDeZR3geoSj1KEXy1QozBfIrILWF+JbD/AaKD/5qG+/
         4RcJrO33qFL3K+shrLl2D4NPacKj4g9F2edrwdat/o2qV5xiQGhyXy27JGTeVmQY+Fgp
         S7jQN/qhGgj6wer6vF95s7r1m7lm+3ZKoA2KufeH1EjgC/3ulH2Gmi+/bAykEbYu8YCJ
         SYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=L67JWKUSXROFYdtx0JJFWcEyH0Rce6fQuUWLWkYcbSM=;
        fh=u5MZumqizyQzpGiP+rrvNbQVHkDtuSCne2Pmw4OqF7Y=;
        b=ijvdKHt3YLSzX+8edgMf/d89KqfRirnLc+ygllERyHyTfCSZlt7YoGpQhbVGMEyJ8Q
         /D82nAumkUvZmIthYoKNHeidoU4Oti898ttQr44MIQT9kwsiL/cLDMTwpjbg8TQaoO62
         SYFTXwkOa6cmV7GZ86SmB3M3p6PEmEvJVcCw+ckwFPUIKk4cmXd1kPU3Uz/oYoH+21dy
         2ipGnxtIYaxVz07zl8lSsYsm9id+eJNLsvMLJ6aMoIqSPkJhM5f2yXQfb8NknLxZn+5E
         +0PlX/rLi9P2FXVwFnVM3uXmdihwGRKZuGGnjn5xfZIKpDkqVOBw9drxjOlvKTjKOTEG
         iAGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YKIBqKtl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811da417sor5105855ad.17.2025.03.20.15.30.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YKIBqKtl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509819; x=1743114619; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L67JWKUSXROFYdtx0JJFWcEyH0Rce6fQuUWLWkYcbSM=;
        b=YKIBqKtlD8LC2aoN2pfEGGw5BYWH7cWQ2t2mMlMMjHyhzkOqN+xn4sxozcKqUeqRwG
         aQKhxRF1w5+TnO3y62tMX0KM/dSPuxuImEm6vjfoYmAXx0P97gxjGpcO746CWuqwVdU5
         DpneI88KYcYU2NGVrpXhwRbtWfGi2bFPzR/B2LMj5oM6CSCz53IbB592qevWk7wagZYv
         Maf4WqzQI6ohyzLrYR86kxzORtfFIFkmVMNdRYD77NoFciG8CoDpitAx/Iz9ex3vdC3/
         SqfNJB8X/Y64LbDLaONcICa9jqm+ELBpQqNnZNv151F8Ki7jFjbrzKUbyd1+qBc94alW
         5htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509819; x=1743114619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L67JWKUSXROFYdtx0JJFWcEyH0Rce6fQuUWLWkYcbSM=;
        b=P8n/tk4LF1beEhh8pDenD0RQLe6oMYpcC2m/HctokZA7fMvhBMdz7VggoyJ3JWLRiG
         KzqsLe+ww0Z9Vhu8OKnQx4NVhlIQ1myoXqfAuyWpMaoLjW39ziCceyw1DQq76kfzokqF
         7TYYVZQuLsDC9tae1G8dK0SQKtRglSTV589s8VLWN2XL69OuRvcMt0t86sznzxU64Aio
         eawWnf9Bnlk3MeSoBtf58AftSVgqgYSJUQfcfhWFNpA1izXhhCE4N3huPKqrFSq1RHfN
         vmkvmqicIw/kzT8dCQdK4rCkpDNAyZGhAslyFbq7MKvyETl+3NtIN1I5UT6xfZh42o6l
         sylA==
X-Forwarded-Encrypted: i=1; AJvYcCXwdbKICRG7s8Um0HeCEDO6q52u3dSg/nnLJuwySAF/pR2+INZWOzVDnDbTfY3envij/ngT6ttLGHi48A==@linaro.org
X-Gm-Message-State: AOJu0YwYAdoXY07HKLxBM6kq+O7IJ39ftr6NaoPLQMw0Cc3RZhguoEX2
	5x86RU+SIf7IJZNQ2wHqrKhd3/N48f9pXyay/p8iH82N3WrqFA7iry3MlCiZ6mOX2A==
X-Gm-Gg: ASbGncs70flYsznUq1j9xUaP2aGsdiJcTENXcGcFweaAClYuBoaXBD9yyMokx7e4U/J
	7vUdtaDOa6/XMpT2sA5zQLFrEAITHH422k/7Y9IJwERmUlFWlNOcRD/r3XySIQx5Vo53hlQ7ZAF
	LmBRTihyknxPIMfiPz0K9qPdEk7Y48EvGonaeRZ93JqJFXZsPQQCBybJwrYKfiXqb/cQb3sOUSy
	/KR1Mi/sicPvQHD3hq2/Bx+H87ly1//GMRtVfEix8lt5J0mxCcsFpebdQ8YB1Q5ZG9zaGjawD8W
	Xb7q1/yxA2kKAbiQDgqZ4dEbqhQjwpbkwvd/8JD8aeYY
X-Google-Smtp-Source: AGHT+IGpP6s+cuDhlrsumYbzxqxXH4hCEx5EdUEKMCwNguE6R8G0z2Llcwdd8JctqX19mKxhAEzdzQ==
X-Received: by 2002:a17:902:d58b:b0:215:6e01:ad07 with SMTP id d9443c01a7336-22780c551d0mr15664475ad.6.1742509818778;
        Thu, 20 Mar 2025 15:30:18 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:18 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 05/30] exec/cpu-all: remove system/memory include
Date: Thu, 20 Mar 2025 15:29:37 -0700
Message-Id: <20250320223002.2915728-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DQnjkkpTYmSE

We include this header where needed. When includes set already have
ifdef CONFIG_USER_ONLY, we add it here, else, we don't condition the
include.

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
index 44e19aacd8d..1b1e37729e1 100644
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
