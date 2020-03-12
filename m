Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1088291lfc;
        Thu, 12 Mar 2020 12:43:18 -0700 (PDT)
X-Received: by 2002:a63:7c4:: with SMTP id 187mr9045140pgh.369.1584042198176;
        Thu, 12 Mar 2020 12:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042198; cv=none;
        d=google.com; s=arc-20160816;
        b=LMCzCay/VJdgftd47rQxrOojoB4TXStBBE5ULYsqe76hcx/WBDRmJ2wVo8pLZvwjnL
         /+g51sBGqSkeNXODZkloNqJVxdBvM/RNE560YJvjpxzCE1xTypJr7ln3tMdd+ZCl1xru
         bnBmiEDA5dSnpPj9Q8Kex3z0Td5unNveQHQR2JdUHOBF3xgDd+jgGerbkpNnwMvynNym
         wWDo/DHjOPwdDejboprCUHu50VkgD/Jy7zNcsbmmoY8q6AO6NvdTL9Eq/8btrrVCIbRp
         11S1FPIpofd9p1ibV4fn6SBEC66gzKYZR7mWFqTR1wXQ4SRwAChn4GsUidcrHcbvw5GJ
         cyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D6dUTV6+AbmOvovc5B167VTVViwAF6biFLlOzA9HmSw=;
        b=Pw1dkV8yaHktQXQ6iwDDQFg6fXk1CA9a+DFFoPOh8CMTphM+1TjmJVzuTlLBu+htOy
         0vCrycjYYim1epEhi8+htCmPpHEBOCoGrutDrg+6GitHs1LZpdPg/hDOmHqo69z58Cun
         kUdZavmOOCkTC6LgMKcntZ7o144n2wrfrxyReuAMilBz92JC1qnr3ZWIY0uoEVVhROdo
         odYt4yqhqz60j1OGXQ6OWYZ1JMo8kVABV3iyh8cjddd0t6AAroJORLgbb4Hkyb2Hx5gv
         3P/pCCzJB7lwubAGGn7FV8xq6S9JhdwL2htME074f7xTP0hP4Uu21Qq4b2H5SitYgA4W
         Hngw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e09oKrAd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y5sor7694494plp.41.2020.03.12.12.43.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e09oKrAd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D6dUTV6+AbmOvovc5B167VTVViwAF6biFLlOzA9HmSw=;
        b=e09oKrAdsRYr04MKQUlFO5Sqre3QYt0so/zB/TKS5uGXJhsG6oOYeV7w+jgh5Y62Lm
         I//ZEHwflheAWSAxD8k+NuOx8a2NbefPHvR1uQGSDQh9SPObQtbjp+osr2MIT3T73/4X
         kCg72AenLxeDqJ4LAMGUnnKpQA9LdegM2cAAuMHnW/3wi6bee2ocaZuhXVV6nK+GTtNm
         BqB4lzAmezWoeC/GAjhoGbblxnFeHnrZy1NjmKTtdJwKktoCcaFStfNgnapjKM9lpmd0
         bRCJuzjeyPs+oyKiwfYbszRwc0ZT0iKX6Innswx5xCPMOd5b573cvaSCUHY/Ya957npe
         W05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D6dUTV6+AbmOvovc5B167VTVViwAF6biFLlOzA9HmSw=;
        b=QgPwY+p6YP7RjaOPAFkaD1LrWKTll1oHoDy+m0f1RymS6bpcJfR2z1/CpmLoygtG24
         6DtrhOuArbsnsEx6STyAKFXnOmQJ3sPmkzpSLSBuYA8mDsrklYRR2PRT24X4E9fTwkxV
         1wY2CusmXkY51wcDPFaVXZ41rtB5Rncg3gNeMZ7l1Gp+Eogxgvh0m6fN+dkKIYAcipxT
         jnpla1nnSk94gJlpoUIWm4eM0W62+OgL2Yl9+Ft01Rur0x8xtvaldhDbNnNSsaV0FFJJ
         SYgnNt8sHcepuaK7t5p34/rYjjLRsisl4xj8L9Z+910gV6dpmLkXypRS8PYl825CFdTB
         lUdg==
X-Gm-Message-State: ANhLgQ1N6l4rKtR8cHbg0KxCBfWihxxQDGz4ulqeFxo3oU3yZKA15t/E
	gYlPGbVbbuJElHz/7g3oCKmwzk40
X-Google-Smtp-Source: ADFU+vuBH+RPEBGPrZa1p2Vs6VHSN6g4Zif2yEuU7dsc48h3upM17JSgGj4hBgX89AK3TeDaLTHS/w==
X-Received: by 2002:a17:902:8a88:: with SMTP id p8mr10026309plo.56.1584042197603;
        Thu, 12 Mar 2020 12:43:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 42/42] target/arm: Add allocation tag storage for system mode
Date: Thu, 12 Mar 2020 12:42:19 -0700
Message-Id: <20200312194219.24406-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8a1k6YSYGUyF

Look up the physical address for the given virtual address,
convert that to a tag physical address, and finally return
the host address that backs it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 128 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index c51f7f04f4..47db87a5a1 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "exec/ram_addr.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 
@@ -74,8 +75,135 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                    int ptr_size, MMUAccessType tag_access,
                                    int tag_size, uintptr_t ra)
 {
+#ifdef CONFIG_USER_ONLY
     /* Tag storage not implemented.  */
     return NULL;
+#else
+    uintptr_t index;
+    CPUIOTLBEntry *iotlbentry;
+    int in_page, flags;
+    ram_addr_t ptr_ra;
+    hwaddr ptr_paddr, tag_paddr, xlat;
+    MemoryRegion *mr;
+    ARMASIdx tag_asi;
+    AddressSpace *tag_as;
+    void *host;
+
+    /*
+     * The caller must split calls to this function such that it will
+     * not access *tag* memory beyond the end of the page.
+     */
+    in_page = -(ptr | -(TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1)));
+    g_assert(tag_size <= in_page);
+
+    /*
+     * Probe the first byte of the virtual address.  This raises an
+     * exception for inaccessible pages, and resolves the virtual address
+     * into the softmmu tlb.
+     */
+    flags = probe_access_flags(env, ptr, ptr_access, ptr_mmu_idx,
+                               false, &host, ra);
+
+    /*
+     * Find the iotlbentry for ptr.  This *must* be present in the TLB
+     * because we just found the mapping.
+     * TODO: Perhaps there should be a cputlb helper that returns a
+     * matching tlb entry + iotlb entry.
+     */
+    index = tlb_index(env, ptr_mmu_idx, ptr);
+# ifdef CONFIG_DEBUG_TCG
+    {
+        CPUTLBEntry *entry = tlb_entry(env, ptr_mmu_idx, ptr);
+        target_ulong comparator = (ptr_access == MMU_DATA_LOAD
+                                   ? entry->addr_read
+                                   : tlb_addr_write(entry));
+        g_assert(tlb_hit(comparator, ptr));
+    }
+# endif
+    iotlbentry = &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
+
+    /* If the virtual page MemAttr != Tagged, access unchecked. */
+    if (!iotlbentry->attrs.target_tlb_bit1) {
+        return NULL;
+    }
+
+    /* If not normal memory, tag storage is not implemented, access unchecked. */
+    if (unlikely(flags & TLB_MMIO)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Page @ 0x%" PRIx64 " indicates Tagged Normal memory "
+                      "but is Device memory\n", ptr);
+        return NULL;
+    }
+
+    /*
+     * The Normal memory access can extend to the next page.  E.g. a single
+     * 8-byte access to the last byte of a page will check only the last
+     * tag on the first page.
+     * Any page access exception has priority over tag check exception.
+     */
+    in_page = -(ptr | TARGET_PAGE_MASK);
+    if (unlikely(ptr_size > in_page)) {
+        void *ignore;
+        flags |= probe_access_flags(env, ptr + in_page, ptr_access,
+                                    ptr_mmu_idx, false, &ignore, ra);
+    }
+
+    /* Any debug exception has priority over a tag check exception. */
+    if (unlikely(flags & TLB_WATCHPOINT)) {
+        int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
+        cpu_check_watchpoint(env_cpu(env), ptr, ptr_size,
+                             iotlbentry->attrs, wp, ra);
+    }
+
+    /*
+     * Find the physical address within the normal mem space.
+     * The memory region lookup must succeed because TLB_MMIO was
+     * not set in the cputlb lookup above.
+     */
+    mr = memory_region_from_host(host, &ptr_ra);
+    tcg_debug_assert(mr != NULL);
+    tcg_debug_assert(memory_region_is_ram(mr));
+    ptr_paddr = ptr_ra;
+    do {
+        ptr_paddr += mr->addr;
+        mr = mr->container;
+    } while (mr);
+
+    /* Convert to the physical address in tag space.  */
+    tag_paddr = ptr_paddr >> (LOG2_TAG_GRANULE + 1);
+
+    /* Look up the address in tag space. */
+    tag_asi = iotlbentry->attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
+    tag_as = cpu_get_address_space(env_cpu(env), tag_asi);
+    mr = address_space_translate(tag_as, tag_paddr, &xlat, NULL,
+                                 tag_access == MMU_DATA_STORE,
+                                 iotlbentry->attrs);
+
+    /*
+     * Note that @mr will never be NULL.  If there is nothing in the address
+     * space at @tag_paddr, the translation will return the unallocated memory
+     * region.  For our purposes, the result must be ram.
+     */
+    if (unlikely(!memory_region_is_ram(mr))) {
+        /* ??? Failure is a board configuration error. */
+        qemu_log_mask(LOG_UNIMP,
+                      "Tag Memory @ 0x%" HWADDR_PRIx " not found for "
+                      "Normal Memory @ 0x%" HWADDR_PRIx "\n",
+                      tag_paddr, ptr_paddr);
+        return NULL;
+    }
+
+    /*
+     * Ensure the tag memory is dirty on write, for migration.
+     * Tag memory can never contain code or display memory (vga).
+     */
+    if (tag_access == MMU_DATA_STORE) {
+        ram_addr_t tag_ra = memory_region_get_ram_addr(mr) + xlat;
+        cpu_physical_memory_set_dirty_flag(tag_ra, DIRTY_MEMORY_MIGRATION);
+    }
+
+    return memory_region_get_ram_ptr(mr) + xlat;
+#endif
 }
 
 uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
-- 
2.20.1
