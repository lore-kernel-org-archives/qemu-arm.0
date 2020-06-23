Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4355131lfm;
        Tue, 23 Jun 2020 12:59:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdxI2LOttN6SbCRgb80y7gXtjr4nckysmNESeN/TCw90ghm3S+zASL8hxKZHrRCLZ0IdFT
X-Received: by 2002:a25:3342:: with SMTP id z63mr36063452ybz.200.1592942353560;
        Tue, 23 Jun 2020 12:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592942353; cv=none;
        d=google.com; s=arc-20160816;
        b=hvU/0sWfNkcA+9Q9pc8093Dq/NS2YI+wsuzwVs066HjjaOi0ytUFhKFGz7c2wd8DGQ
         f11ogKoPu/QTc7gUbbxZGqA4dD3OEzlFPtVQcBVxq/c+bKW8HFirxTDakZX8Sstf1sWF
         HkfkiHdxuzGgTJdrtoTpnBh+RfFmUDLqiFX8brNqlHP0pKJlhqdnBZguq5HBl14zKwif
         HEttZr2Qrmgm6BFrfX/XO2k1g5Uue56Dw5pBfv1dlWIsYjOlcFyJsFsLRAWEJIGMOMWm
         2A/us+YRz7dOp7BTuyE9/30MRJCX2eqOwaHBbWcbnCUp39LN2xzE2KMtU6bUAVI6h7rI
         FQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tGDG+ujJfFVLYNmYlA8Z4jYqGTGnE3to6p0u9zyaEeY=;
        b=CdQ18RlkSJo5Hvwqgkc+NH9A1V6X3WfJuJlK1MUBRuutpGO/OewwoAVFvMz77Z/QFv
         26cSGTajxiWSviyjmuLIBizG6nwPi/nexNbQbUWncR076bUMKxTS7Nnbj3ZUdmbitX0s
         VRsf6vX6JGi4cBMke+b/tQxh1UA+fG6ZHGIjRrAMhJOoPX7Y9Gwq9qld9Jmik0E+vcF8
         p1zif4Qwz1O3rWz06D65WqrjnQCCpHzn/K/fSY2XisiPgKxpIXuSpxItNesmhkT9FT6e
         CgC/xcb/7EeJQYSyBaZd4MdG1R/rUxueBUPyTanZjTOLJsf6hMLMon6RweXKhKbhvnJR
         gsmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZQ5Lvswu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si17390575ybo.380.2020.06.23.12.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZQ5Lvswu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnp4a-0003pI-EP
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnokB-0005Y0-69
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:38:07 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnok5-0005xE-TY
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:38:06 -0400
Received: by mail-pg1-x544.google.com with SMTP id d4so24464pgk.4
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tGDG+ujJfFVLYNmYlA8Z4jYqGTGnE3to6p0u9zyaEeY=;
 b=ZQ5Lvswud7aj6rNkMYUnnBoLAX76FhSJNOZOW7FBtcdciT3UYrLLPCcOq3sEI1GK/z
 YvHBmN71w4f6OsIxo35Y1Kn86LLYF0Y/NuQPX1b1POFqq6/PUjN9IPDYySdvKGX2x70b
 pQPCIgp5yWGOOS756DJ2aqAliDsZH8Ze4W4mZxT4ETaxqIOvcZmGCW6HaYF936UzGELf
 r9ZZQPEg2RAGYEVn+CuHTaoj5HOYaAOz1oS7cnDn4NXM36v0fJWjoxvRDTkED1pAP4Sn
 wmVV1IPnr47yOdVifqPvL4qZyz2B22kDOKfu0fDtT7BzNxupjxaEC4Dl5bKwN8GY5btu
 6cJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGDG+ujJfFVLYNmYlA8Z4jYqGTGnE3to6p0u9zyaEeY=;
 b=HK9w2SRRLzOQVn3zkC18EyiggrFA5jyKWTzlFY4L9jwO5vzdSBM1SOK3aX0Ipk6RZQ
 lqiW1+1vpKhcSdfC4f0C5YPPdWgIlHSX2FiAEycNtnz3Ut/yf8uB71obivv323gxeZDx
 nFZqpSagnkz+X1DOKH/CSht45zobntoQk2vLmqZgQV0RiYxcoP7j1EsFQKfpgTmcKU9u
 2Mt51nhMz5t7ObZZ9oBFelx5iTlzQzL95cocpAQAQeI+4fRYwPc5Dwjv5cB/VczMvwXb
 oRv9uz8GIkkvWwms8sX8pkOlRgKd/yUwFVZzA+kdvq+fHU/UWkMZKCN+DQtFLQOFdnSW
 tzSA==
X-Gm-Message-State: AOAM532mH8WpybP6yoeyMWmnOZoL16dhWIDakse+4eD6p9AHFRlFFYOx
 N4jGlepvBlESBMtu/gtiwMr9IA==
X-Received: by 2002:aa7:8a4c:: with SMTP id n12mr26360643pfa.326.1592941080532; 
 Tue, 23 Jun 2020 12:38:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 44/45] target/arm: Add allocation tag storage for system
 mode
Date: Tue, 23 Jun 2020 12:36:57 -0700
Message-Id: <20200623193658.623279-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cJHzlhtCPiWt

Look up the physical address for the given virtual address,
convert that to a tag physical address, and finally return
the host address that backs it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 126 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 4f9bd3add3..4911cbca50 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "exec/ram_addr.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 
@@ -74,8 +75,133 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
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
+     * Probe the first byte of the virtual address.  This raises an
+     * exception for inaccessible pages, and resolves the virtual address
+     * into the softmmu tlb.
+     *
+     * When RA == 0, this is for mte_probe1.  The page is expected to be
+     * valid.  Indicate to probe_access_flags no-fault, then assert that
+     * we received a valid page.
+     */
+    flags = probe_access_flags(env, ptr, ptr_access, ptr_mmu_idx,
+                               ra == 0, &host, ra);
+    assert(!(flags & TLB_INVALID_MASK));
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
+    if (!arm_tlb_mte_tagged(&iotlbentry->attrs)) {
+        return NULL;
+    }
+
+    /* If not normal memory, there is no tag storage: access unchecked. */
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
2.25.1

