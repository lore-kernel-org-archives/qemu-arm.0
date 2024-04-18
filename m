Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952633ejd;
        Thu, 18 Apr 2024 12:26:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRqEMvU/DbqsGwHv9h15ew+EdDZQ9QMwLSPUpFaIrW0ye9D6x/wsBAI7Gt3t3lKhI7eMTMLif31E95CTIcCTn5ZtHIXP9d
X-Received: by 2002:a05:651c:b0f:b0:2da:38e:f73d with SMTP id b15-20020a05651c0b0f00b002da038ef73dmr3266328ljr.51.1713468402610;
        Thu, 18 Apr 2024 12:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468402; cv=none;
        d=google.com; s=arc-20160816;
        b=BCmgxgMFDOJT5va7R/WnA/azwgfu+TbSNrBBvIXwUzJdlb2Jsv15WS8m/4q1Qh8sLk
         o030xkEB+CUZCXjnU0x+zhPPmFJuytXeKHgyZEE8KX3AIxM+QqD8VKRGDAJovmI2bOy9
         k2IkWWgqtlS+uCiaRvohKE2zDdlYTnKzXuFx0IHSEYwXHtTtF/ByUPzuR7tOjsXLJcSI
         OO1UcWSUBwIOHSvePHCk/ty9HIy0gPIRL5FeMEa/bGbseouCZZtQxmWpzSQljw9oXJ4y
         jiJBQgREMIljA3fdJlq0VwAMg/D5rA3VjqO1RCYyflZapUM0lrC5wlp7eS4bOuh/mCmh
         48dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cb1njxsoj9fqYLqI6LbCARFpOVdltqpYC3ClFHXZbjY=;
        fh=DyqKojjW1nh28m64FsONQoYtWwkN18cBNEngfgdNAX4=;
        b=uz/GKmQDf844WyfP8rOS6Q5BMq1toTr5nifjXF1ljcfVwFI7yX3Gen8BHYegsoEGsA
         2zfLZgh1mMjcDzDxVfJG+l9HZnqZXknnoxjfdZ+qTjyS+zY+Tc/Cz9xaDU9Vu9qNZ60M
         DAm/C8oC8CIHhhyXEz9zfBvIxEQ4ZkqlcNVfCaZBOOBDML5qChKWB1tFrTckfJ0JdIWi
         NieDJiea3myNwdrwz6IJmqulNgH7uE313QFaHaGEg0MSi0lWP+a4CEQ+K/G7yeVPjjcB
         ls3vrecBuINYhqDlD/lxyDdSDkAB6EbjWkAPDJ4E1UKyhk3heFkl5ZTPLa5B6FfKbstw
         7gYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NDkGdbb0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e23-20020a50d4d7000000b0056e2b094003sor621396edj.5.2024.04.18.12.26.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NDkGdbb0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468402; x=1714073202; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cb1njxsoj9fqYLqI6LbCARFpOVdltqpYC3ClFHXZbjY=;
        b=NDkGdbb07k4EpE4SRMg94uangb50fod38+CyIcp/11LqElN/f7Z8eK/9rry+JIgDIk
         TbW1Rt35XmskvMu4Y7q6lAkIiwBHuX1AKI06xsO2EpAFbpMRuT0OTxJMRD/rSSRAbWbC
         UU22CqxSxAV+tPNssPb8ceo6336UR/qxcFgKHaPFkK2Y/EmaNa8P9qBNR6sDUKkhnrcB
         Pat0ecHViNivTJcAU68guyMCqCrRirda+Sd7M902Usq4yUjrH5OH822+AAyAJ/dJaT0t
         7Ozz/p35rBBgxWVvCj+Ot9ZyATC+UMbl2EzVKLLFlSP0EDF/XAGTqcAh4cD5n0elN3Wn
         6/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468402; x=1714073202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cb1njxsoj9fqYLqI6LbCARFpOVdltqpYC3ClFHXZbjY=;
        b=bmGWR59IVvJkQ2bCiscmLHkfSe3w2TCrptOaA9l+PsN5u3p0YjGG6aiqea1A2bJAh1
         kPTqsmJLakho+POwvYuD5+P5f5+yATO7ynE010tT83CE8HW0q8Gj8wP85WykB3YG17zH
         mJ6YwhYMp7mYwcL3yp0PxXchZtZq3AMn/szde+Kd0LfA1w+9wWSJKMsiVvwVw9cNG8bo
         qo9/nJKdoGf/h4izq2HYfsUDzz4yzPC7ZwLRxaV22vIAGpijzNaWP9SWHW1rLQyM1vPM
         QWDbLXZJuWQ5Rds2d6d4dVN2lAmk1xI+2BLVp49X5x5/Fnyt43oM8xKMDHH5LoyBbP/1
         xQNw==
X-Forwarded-Encrypted: i=1; AJvYcCUWxVdO3cgve7TiW1aioSszvrdJNcl6DY3pxxHytYpsJVl6VBD1+EEO67E/y98eanoE3Df/kQwKqHBfdLBLROlki16im9ou
X-Gm-Message-State: AOJu0YwY3RC8+JgyAwH8YkseTzEbudKT9A506/cbToUJK7d3Ptt8UNVM
	iIGl+GPn39CVENIKH/TyIXrGDcXm9fBEYP7bPpKYEXae4an63zgrSs34+1viyVTUfA==
X-Google-Smtp-Source: AGHT+IE+0wbmWgIFnPU7i6VoBuSEKx6idnpuhGmJGfEUKBYV1liUnXM/8gEwZP44oUl1tDGVCvsLvw==
X-Received: by 2002:a50:d7db:0:b0:56e:d9e:f4d3 with SMTP id m27-20020a50d7db000000b0056e0d9ef4d3mr95268edj.18.1713468402179;
        Thu, 18 Apr 2024 12:26:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id d3-20020a50f683000000b0056e59d747b0sm1276471edn.40.2024.04.18.12.26.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:26:41 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/24] exec: Move CPUTLBEntry helpers to cputlb.c
Date: Thu, 18 Apr 2024 21:25:11 +0200
Message-ID: <20240418192525.97451-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lZIqlk7qNOqm

The following CPUTLBEntry helpers are only used in accel/tcg/cputlb.c:
  - tlb_index()
  - tlb_entry()
  - tlb_read_idx()
  - tlb_addr_write()

Move them to this file, allowing to remove the huge "cpu.h" header
inclusion from "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h | 55 -----------------------------------------
 accel/tcg/cputlb.c      | 51 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 55 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 7032949dba..2c5a0a5c81 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -70,7 +70,6 @@
 #include "exec/abi_ptr.h"
 #include "exec/mmu-access-type.h"
 #include "qemu/int128.h"
-#include "cpu.h"
 
 #if defined(CONFIG_USER_ONLY)
 
@@ -294,60 +293,6 @@ Int128 cpu_atomic_cmpxchgo_be_mmu(CPUArchState *env, abi_ptr addr,
                                   Int128 cmpv, Int128 newv,
                                   MemOpIdx oi, uintptr_t retaddr);
 
-#if !defined(CONFIG_USER_ONLY)
-
-#include "tcg/oversized-guest.h"
-
-static inline uint64_t tlb_read_idx(const CPUTLBEntry *entry,
-                                    MMUAccessType access_type)
-{
-    /* Do not rearrange the CPUTLBEntry structure members. */
-    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_read) !=
-                      MMU_DATA_LOAD * sizeof(uint64_t));
-    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_write) !=
-                      MMU_DATA_STORE * sizeof(uint64_t));
-    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_code) !=
-                      MMU_INST_FETCH * sizeof(uint64_t));
-
-#if TARGET_LONG_BITS == 32
-    /* Use qatomic_read, in case of addr_write; only care about low bits. */
-    const uint32_t *ptr = (uint32_t *)&entry->addr_idx[access_type];
-    ptr += HOST_BIG_ENDIAN;
-    return qatomic_read(ptr);
-#else
-    const uint64_t *ptr = &entry->addr_idx[access_type];
-# if TCG_OVERSIZED_GUEST
-    return *ptr;
-# else
-    /* ofs might correspond to .addr_write, so use qatomic_read */
-    return qatomic_read(ptr);
-# endif
-#endif
-}
-
-static inline uint64_t tlb_addr_write(const CPUTLBEntry *entry)
-{
-    return tlb_read_idx(entry, MMU_DATA_STORE);
-}
-
-/* Find the TLB index corresponding to the mmu_idx + address pair.  */
-static inline uintptr_t tlb_index(CPUState *cpu, uintptr_t mmu_idx,
-                                  vaddr addr)
-{
-    uintptr_t size_mask = cpu->neg.tlb.f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
-
-    return (addr >> TARGET_PAGE_BITS) & size_mask;
-}
-
-/* Find the TLB entry corresponding to the mmu_idx + address pair.  */
-static inline CPUTLBEntry *tlb_entry(CPUState *cpu, uintptr_t mmu_idx,
-                                     vaddr addr)
-{
-    return &cpu->neg.tlb.f[mmu_idx].table[tlb_index(cpu, mmu_idx, addr)];
-}
-
-#endif /* !defined(CONFIG_USER_ONLY) */
-
 #if TARGET_BIG_ENDIAN
 # define cpu_lduw_data        cpu_lduw_be_data
 # define cpu_ldsw_data        cpu_ldsw_be_data
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e16d02a62c..953c437ba9 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -27,6 +27,9 @@
 #include "exec/tb-flush.h"
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
+#include "exec/mmu-access-type.h"
+#include "exec/tlb-common.h"
+#include "exec/vaddr.h"
 #include "tcg/tcg.h"
 #include "qemu/error-report.h"
 #include "exec/log.h"
@@ -95,6 +98,54 @@ static inline size_t sizeof_tlb(CPUTLBDescFast *fast)
     return fast->mask + (1 << CPU_TLB_ENTRY_BITS);
 }
 
+static inline uint64_t tlb_read_idx(const CPUTLBEntry *entry,
+                                    MMUAccessType access_type)
+{
+    /* Do not rearrange the CPUTLBEntry structure members. */
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_read) !=
+                      MMU_DATA_LOAD * sizeof(uint64_t));
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_write) !=
+                      MMU_DATA_STORE * sizeof(uint64_t));
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_code) !=
+                      MMU_INST_FETCH * sizeof(uint64_t));
+
+#if TARGET_LONG_BITS == 32
+    /* Use qatomic_read, in case of addr_write; only care about low bits. */
+    const uint32_t *ptr = (uint32_t *)&entry->addr_idx[access_type];
+    ptr += HOST_BIG_ENDIAN;
+    return qatomic_read(ptr);
+#else
+    const uint64_t *ptr = &entry->addr_idx[access_type];
+# if TCG_OVERSIZED_GUEST
+    return *ptr;
+# else
+    /* ofs might correspond to .addr_write, so use qatomic_read */
+    return qatomic_read(ptr);
+# endif
+#endif
+}
+
+static inline uint64_t tlb_addr_write(const CPUTLBEntry *entry)
+{
+    return tlb_read_idx(entry, MMU_DATA_STORE);
+}
+
+/* Find the TLB index corresponding to the mmu_idx + address pair.  */
+static inline uintptr_t tlb_index(CPUState *cpu, uintptr_t mmu_idx,
+                                  vaddr addr)
+{
+    uintptr_t size_mask = cpu->neg.tlb.f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
+
+    return (addr >> TARGET_PAGE_BITS) & size_mask;
+}
+
+/* Find the TLB entry corresponding to the mmu_idx + address pair.  */
+static inline CPUTLBEntry *tlb_entry(CPUState *cpu, uintptr_t mmu_idx,
+                                     vaddr addr)
+{
+    return &cpu->neg.tlb.f[mmu_idx].table[tlb_index(cpu, mmu_idx, addr)];
+}
+
 static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
                              size_t max_entries)
 {
-- 
2.41.0
