Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26831njc;
        Wed, 13 Nov 2024 17:15:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhVOjgE4XQGKn5HZplv+t2HGbvQyq/0HRfzZ+gMr10hoqjS4LJZyrNKBqDZReO7+GbuPXgcvPwTLHUKQ==@linaro.org
X-Received: by 2002:a05:6000:1866:b0:37c:c5be:1121 with SMTP id ffacd0b85a97d-381f18651cdmr19657757f8f.9.1731546955882;
        Wed, 13 Nov 2024 17:15:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546955; cv=none;
        d=google.com; s=arc-20240605;
        b=P6s6gRmwVm56rPj0ySg+IQC+FoIjsvAEHDVdNmzV5WaLXGzdwGAs3Du1RO6272c7D+
         rfh6aJne5YSUKtkBjUdl8k3hCjhkxRM2REi8YZepRJw53DrGWilux99qqvszccVQZ8vR
         CE1EECQ3WMGajrCmZ+f2JGjWPuw8aPiFNMSj17c/fRMfD3A8Eoyl8PoRCKIfbSBiAo3M
         FQOyWzlQqSpnhqrGvmln1OimuLAKJbt1GNPLzBLkv65xhk81NhmkGnW2PKoCkjzIGJEe
         iTq12/ipRo44P8lPP6bXlQSlHxvPQX2Z0py+Znkl1rg/A21FO+nRgBQwkkx19vvz/Rhp
         3uJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MKGKBpB51JYn8fa9pIjr5nOqIfE0klwKIY58pnM7yzQ=;
        fh=qe2Ah0xfGCZCja+YeCiNl9ReYL+12WX1gxOqD+8Gbvk=;
        b=fQmZEv2XnqwTv6aN1lx7QbfBFQ08okqEii48BICh3vPNZ7gELuR/GQ8+sjbrOYTrcV
         CI7CXlUbl/LSwfLfVUGQ4kT/3f8U+oARu/vqjMVktr/ZyjqXkWKFe2b1pUsLS9Senw9Q
         n2xIaFTqq2kVnq8wVmxtdGzztsCjDNKUt98WMvOGs3k6tbIk5iUZfFGZ6/3T15c2Ii+X
         eCCyRIUNBdnXi5tG1vGlE0Rro/NZc0ygKAeKGqrF90ANZP2eFILrSAY20/aR5yAnl1Ux
         ZeBsuvYDxQx/B65l36eCIf4M2FRJuXM9nEZm43p+jA4bxx+LbZW/d5wXNKHjLtTYhjUQ
         3hEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jR6dnklD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381ed974eacsor5200400f8f.1.2024.11.13.17.15.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:15:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jR6dnklD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546955; x=1732151755; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKGKBpB51JYn8fa9pIjr5nOqIfE0klwKIY58pnM7yzQ=;
        b=jR6dnklDpIqC8nxKtXz0IMJLi9jMS7fzWG962b7FlPERbr2iEi9GDz01YNZ9oKPIC8
         GMRyNlXU+XdgWpfpn9tSH99KxdMexDaMhlNezmIGgauW3zfrZcL0wkjjgqNt8TixKAig
         6BRuFxUBtou4e2wGXNA/ZKzw1RL2EY0HX4Q4A2X1QazKNErkrcH9/K+w3Unhz7L3Vbds
         Ib0YvjRxkNLkABlrmRo7+00OpYYb6+UPcuI1dzGzjduxuQavHWBSmGD+A2lI3e9qtzQe
         E+KNbSwfHhl+zxIkBJqMBIihEIbuwUa5GW+mXNYPUVbD0vxDjPmpETHHB/m2ae9PVc1Z
         BWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546955; x=1732151755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKGKBpB51JYn8fa9pIjr5nOqIfE0klwKIY58pnM7yzQ=;
        b=c6l0eHVfb47yNCubXghz7rb9COnzeBl+qtx2HyoUg/IrIN6amRXqB6/yWojXRUsn0l
         +55xADyXTwmf25ICJuN94Akp5OlftvNhwNGraY1/AfQhnVgyUafVozAgN4nVPFHA1WMq
         f2DWrNcUz8WRod1+J6iShSxZtBM6371fuF+moAq4UxtNktpGGXAQm2pv2yVj0ewOpTHO
         z9BxZlceFs9Qpe8uDvqWjlelsttgU3mf/um/wB9yE8a58TRCM7F1QsW2dn029Cu7PpoK
         ZXZjrdkFcSCoVcN0SkbP9oLE36OxJKhsrU96NOGLdIttAcleM0o+b9whX1vKr1lmX2ll
         N48g==
X-Forwarded-Encrypted: i=1; AJvYcCXT7eYRAqALfqTCRl/ioFPpGka7Dw/xNkNR6YTrBKWjfN0zIhMaNBa+3wG1AFGS43XBbqodBqdj9R6MHw==@linaro.org
X-Gm-Message-State: AOJu0YyFAzmOpvdrI7kDSdBXRcjTzEZvyQAQYRBy3wB+iivZaAsCH4C0
	OiyOtmmhEg3qgyDoNtDVKUkTzGR1oFRZ253GOzlsDDwst7cC4HouipO21zgOs1yUsg==
X-Google-Smtp-Source: AGHT+IGZeLWyySAwDHTHVjsW2SFDufD9UpueEyNXzGy6rQrK9O+R2MVoL8wOSZmjPebbfF+JzN4y0Q==
X-Received: by 2002:a05:6000:1ac9:b0:374:c640:8596 with SMTP id ffacd0b85a97d-381f186fc60mr19166319f8f.32.1731546955339;
        Wed, 13 Nov 2024 17:15:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381fc0f5f91sm11245808f8f.62.2024.11.13.17.15.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:15:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/24] exec: Declare tlb_vaddr_to_host() in 'exec/cputlb.h'
Date: Thu, 14 Nov 2024 02:13:05 +0100
Message-ID: <20241114011310.3615-21-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VJYC7L2L/1Q9

Move CPU TLB related methods to "exec/cputlb.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h     | 25 -------------------------
 include/exec/cputlb.h       | 26 ++++++++++++++++++++++++++
 target/arm/tcg/helper-a64.c |  1 +
 target/ppc/mem_helper.c     |  1 +
 4 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 769e9fc440..eec47ca05e 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,7 +69,6 @@
 #include "exec/memopidx.h"
 #include "exec/vaddr.h"
 #include "exec/abi_ptr.h"
-#include "exec/mmu-access-type.h"
 #include "qemu/int128.h"
 
 #if defined(CONFIG_USER_ONLY)
@@ -311,30 +310,6 @@ uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr);
 uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr);
 
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
-void *tlb_vaddr_to_host(CPUArchState *env, vaddr addr,
-                        MMUAccessType access_type, int mmu_idx);
-#endif
-
 /*
  * For user-only, helpers that use guest to host address translation
  * must protect the actual host memory access by recording 'retaddr'
diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index 07c4bc669e..4acc2c6235 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -20,6 +20,7 @@
 #ifndef CPUTLB_H
 #define CPUTLB_H
 
+#include "exec/abi_ptr.h"
 #include "exec/cpu-common.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
@@ -306,4 +307,29 @@ void tlb_set_page(CPUState *cpu, vaddr addr,
                   hwaddr paddr, int prot,
                   int mmu_idx, vaddr size);
 
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
+#ifdef CONFIG_USER_ONLY
+#include "user/guest-host.h"
+static inline void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+                                      MMUAccessType access_type, int mmu_idx)
+{
+    return g2h(env_cpu(env), addr);
+}
+#else
+void *tlb_vaddr_to_host(CPUArchState *env, vaddr addr,
+                        MMUAccessType access_type, int mmu_idx);
+#endif
+
 #endif
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 8f42a28d07..9cb5d8ee53 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -30,6 +30,7 @@
 #include "qemu/crc32c.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "exec/cputlb.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
 #include "fpu/softfloat.h"
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 51b137febd..44974b25f8 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "helper_regs.h"
 #include "exec/cpu_ldst.h"
+#include "exec/cputlb.h"
 #include "internal.h"
 #include "qemu/atomic128.h"
 
-- 
2.45.2
