Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952472ejd;
        Thu, 18 Apr 2024 12:26:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaHMAVd7rKIWMv3fzL9bCB6nZAdVo+lwWw8Qy+etwY1ak7QxONtUkw0dwrRHIIprDHRaTLQa5p9DsHnz9eU/SP/6DqbTv7
X-Received: by 2002:a17:906:1f48:b0:a4e:cd5c:da72 with SMTP id d8-20020a1709061f4800b00a4ecd5cda72mr42883ejk.63.1713468384500;
        Thu, 18 Apr 2024 12:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468384; cv=none;
        d=google.com; s=arc-20160816;
        b=y0fCk3pou5/yhVtUKEBawk8A/ZGITEDOOpCm/eS7ifHEvOl6hEhnTtr2w4oAhn0LCl
         RwplLqfIrxoXQk1unpj1eTihQ+6njpuw+2fPwwfbAWM1P4pPsM2B+hGuDqlEX9R7pcpF
         PJkvf7msrAlc1OZ2n7PheGrXidzHszlmz/pZkUbBtRWigg8lC3/xWxjNgUmGWrAaPv2i
         p5k0hUYz9IEbZKWX96y0oaPyNgAln0dtYYzziNEJ31grU3k3xWQEVXol/w0iGrE8WVH4
         8+YHzVLfsAgcNp7tZ3c/sFa5UYXHWfivLZxHyFMD/2HeAw1gYny8CEXy3gztQX3Q7x2N
         J9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cz2i/C3VQ13wYP5OhAoy8JFwTzWM+gW+I5eQgS4AVJI=;
        fh=pVWoVIJh8FJ011MVZ5okc8vYqRqCbXwVXHta5RgCLag=;
        b=HrMAhus7zJIbYMlZud+kbEZoi24ReMyG91IdWkAx2BrSs1gj4L3wgcl0Q7gAMRdHL8
         sWV7qw4VRpApuLJ/QPHhDYerwIhmMbyNzChO3D7eyMp/aq3YlSR/sD4N12M8Lm7cxe8J
         kZru+A5mCdTB8AhdLBqKFQ0NpSHO2RAfRkG3pcEtYPl2juaZY9IoGAmw5EJ1tWTdKTSf
         j0l4SpMEyqcffMLpWkCrkmpmiba0dkDD/tVDZ3RLflDOUuI35T2dSDUN/0UDv4jUWWiC
         zH0oumdOEyuS7kS744PlL92BnasfqXh3DK5g80BiiKhdnfwmKVNTcCMZmbpjFSkbjJ9R
         WPgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qX3ibTy+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n27-20020a1709062bdb00b00a52584d63cesor681945ejg.21.2024.04.18.12.26.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qX3ibTy+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468384; x=1714073184; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cz2i/C3VQ13wYP5OhAoy8JFwTzWM+gW+I5eQgS4AVJI=;
        b=qX3ibTy+bW1tGYUUTCMS/dM92IvkS6w83ZkXvJgS8aISqRuG8WTz7PCqETo8EDZfuf
         tNy3gIOaY8A2Kk6/GAeoderlQBPlJXJ87ckY+aUMTqKeIw1yLjh/L2Klo3nVmC7GI9kT
         gXJm2jnpzM2eJsNkjyIw3vDQWCjhuN5Hp0fHzHcUZGxNDWlMypFlhYT9k9KWM4RF8zHQ
         0c2mz4kJKEzT08WnY2Zi2Bkwr2JQtxCy8EsSMzbr/8ovq5KossznA31oWxjJgdvA49px
         luhrjo+ScoT+nZydCi4Z2B+fZkg9BzbWc0609w7AW2jjA5iAIiIdgq19+TH4Z+KZUiwr
         b4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468384; x=1714073184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cz2i/C3VQ13wYP5OhAoy8JFwTzWM+gW+I5eQgS4AVJI=;
        b=pjebo7HnIq3B13ddLJ83l3CxMpE/1w++f0lMa1OjBi6x91OE8KMksqVrAThdLib8q6
         7yJh/1qR0BT/dbiYwlnjmlp5MlY6KSdO2QPgEb4TS1YFISy4SymomAhavMchkBFpG273
         OuV08c4miliHNwUpELOpQM0AttgJKOojqXO4MT5UjQo33AH6mhf0MuEUVfLb9RKr5ljF
         uFhq/p02d9SNPzgjm54f1LmqGSLP4hFIJQ6UfsEYLIRDVwykRS+DeCIqvsSwRet3rnDV
         ZclcRxKg+KobdOll6Abe5F+jshtGr2eD2jt2G0bgS97BKmtCzIE1poL6XuBvLRZJoJ32
         pgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCFup3RUK3stLYUN50XsICq9XsMeLF+haUf4dUgxTj56g4oEsTNtsbJb2u+/AvZj509w1q/UKv2P1gVVWLz7Hcp3VCKa7v
X-Gm-Message-State: AOJu0YxGlB7XGM8R1JQo/pNZOb28UicC8n3u6MHBcjysJEYIdc+PLUt0
	IeL2/p/KqEpyK9oYeW4npXKGi0hhXgjdxQf/pb4fKUpuJqGbbRgNdZFVVO6d6evCZg==
X-Google-Smtp-Source: AGHT+IEvmItgMVF6C3/vVOPtGDziKuF0Mk9IzmEgs2m+jrdat7LuYqaRaUfsQ5Ozj1eVRXpxQ9qu5A==
X-Received: by 2002:a17:906:c290:b0:a52:1e53:febf with SMTP id r16-20020a170906c29000b00a521e53febfmr42958ejz.69.1713468383981;
        Thu, 18 Apr 2024 12:26:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id s13-20020a170906bc4d00b00a553de860c6sm1262836ejv.133.2024.04.18.12.26.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:26:23 -0700 (PDT)
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
	Peter Xu <peterx@redhat.com>
Subject: [PATCH 09/24] physmem: Restrict TCG CPU IOTLB code to TCG accel
Date: Thu, 18 Apr 2024 21:25:08 +0200
Message-ID: <20240418192525.97451-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M1eZ/R3jBUxg

Restrict iotlb_to_section(), address_space_translate_for_iotlb()
and memory_region_section_get_iotlb() to TCG. Declare them in
"exec/cputlb.h". Declare iotlb_to_section() using the
MemoryRegionSection typedef.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cputlb.h   | 25 +++++++++++++++++++++++--
 include/exec/exec-all.h | 21 ---------------------
 system/physmem.c        |  6 ++++++
 3 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index 173eb98b9a..3594f904b4 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -21,6 +21,8 @@
 #define CPUTLB_H
 
 #include "exec/abi_ptr.h"
+#include "exec/hwaddr.h"
+#include "exec/memattrs.h"
 #include "exec/cpu-common.h"
 #include "exec/mmu-access-type.h"
 
@@ -43,10 +45,29 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
                         MMUAccessType access_type, int mmu_idx);
 
 #if !defined(CONFIG_USER_ONLY)
-/* cputlb.c */
+
 void tlb_protect_code(ram_addr_t ram_addr);
 void tlb_unprotect_code(ram_addr_t ram_addr);
-#endif
+
+/**
+ * iotlb_to_section:
+ * @cpu: CPU performing the access
+ * @index: TCG CPU IOTLB entry
+ *
+ * Given a TCG CPU IOTLB entry, return the MemoryRegionSection that
+ * it refers to. @index will have been initially created and returned
+ * by memory_region_section_get_iotlb().
+ */
+MemoryRegionSection *iotlb_to_section(CPUState *cpu,
+                                      hwaddr index, MemTxAttrs attrs);
+MemoryRegionSection *
+address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
+                                  hwaddr *xlat, hwaddr *plen,
+                                  MemTxAttrs attrs, int *prot);
+hwaddr memory_region_section_get_iotlb(CPUState *cpu,
+                                       MemoryRegionSection *section);
+
+#endif /* CONFIG_USER_ONLY */
 
 #endif /* CONFIG_TCG */
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5cddfea01b..e4cff08db4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -536,21 +536,6 @@ extern __thread uintptr_t tci_tb_ptr;
    smaller than 4 bytes, so we don't worry about special-casing this.  */
 #define GETPC_ADJ   2
 
-#if !defined(CONFIG_USER_ONLY)
-
-/**
- * iotlb_to_section:
- * @cpu: CPU performing the access
- * @index: TCG CPU IOTLB entry
- *
- * Given a TCG CPU IOTLB entry, return the MemoryRegionSection that
- * it refers to. @index will have been initially created and returned
- * by memory_region_section_get_iotlb().
- */
-struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
-                                             hwaddr index, MemTxAttrs attrs);
-#endif
-
 /**
  * get_page_addr_code_hostp()
  * @env: CPUArchState
@@ -659,12 +644,6 @@ void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, vaddr addr);
 void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
 
-MemoryRegionSection *
-address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
-                                  hwaddr *xlat, hwaddr *plen,
-                                  MemTxAttrs attrs, int *prot);
-hwaddr memory_region_section_get_iotlb(CPUState *cpu,
-                                       MemoryRegionSection *section);
 #endif
 
 #endif
diff --git a/system/physmem.c b/system/physmem.c
index cf6334f3a3..38d3ede9f9 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -31,6 +31,7 @@
 #endif /* CONFIG_TCG */
 
 #include "exec/exec-all.h"
+#include "exec/cputlb.h"
 #include "exec/target_page.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
@@ -585,6 +586,7 @@ typedef struct TCGIOMMUNotifier {
     bool active;
 } TCGIOMMUNotifier;
 
+#ifdef CONFIG_TCG
 static void tcg_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     TCGIOMMUNotifier *notifier = container_of(n, TCGIOMMUNotifier, n);
@@ -648,6 +650,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
         notifier->active = true;
     }
 }
+#endif
 
 void tcg_iommu_free_notifier_list(CPUState *cpu)
 {
@@ -668,6 +671,7 @@ void tcg_iommu_init_notifier_list(CPUState *cpu)
     cpu->iommu_notifiers = g_array_new(false, true, sizeof(TCGIOMMUNotifier *));
 }
 
+#ifdef CONFIG_TCG
 /* Called from RCU critical section */
 MemoryRegionSection *
 address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
@@ -761,6 +765,8 @@ hwaddr memory_region_section_get_iotlb(CPUState *cpu,
     return section - d->map.sections;
 }
 
+#endif /* CONFIG_TCG */
+
 void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr)
 {
-- 
2.41.0
