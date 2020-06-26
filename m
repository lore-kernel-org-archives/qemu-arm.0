Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp63270lfm;
        Thu, 25 Jun 2020 21:02:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqM9VpSE0H9wkBfg1uUSd8q1FJvMSSeXPk4wddWK16kFDoIkqc/rdplg4R7FHi2/wUf1Q9
X-Received: by 2002:a05:6902:6cd:: with SMTP id m13mr1825773ybt.29.1593144150081;
        Thu, 25 Jun 2020 21:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593144150; cv=none;
        d=google.com; s=arc-20160816;
        b=oyenZisy0moEcrFlZr5NkitA6rm0CGClM9cpz2+ErywJUkF6j/x6OEcrUkIORmokSZ
         cbulbUyPjuJnOmaaxsgNgoBe4hYUStlLnajS9iHHMxVu6Uo5fZPxEXllJW8euJ/lX4B3
         /9cdB2wBgUEawJu5uwR8LoL2jsZGE5/8tcAN2eiIPhVOKxb+rJcbXhm9L/h0IZRTZgS0
         w0yxbVUhBVuGuwqPIgewceY+yVPe8+fJ3RmF+p6yv+G3zU9VJhfUngytH1foUXE41bDa
         Oa58by9t6hqmZIlDQHL6rEnrtbk5+99+pC4FNTN8wNp7XAtSDmfzFYuHj7pWAhWemGEE
         ORfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UjqghZMppldJJQFCz4puY4NIT8Id2WOfJG93PywKQl8=;
        b=IIC187lAIigqB6Iuvtdo7ffrf2gW+24UAgAvlTFzLk759/0EWb+Lu6da2iNBpy3kjf
         pDD792wgAm20duRrXZmULPaQqXEAemZ3gIqHL0vnhKwC2AXwzIe7TXfA2fks40PneaZh
         Ve6k6/WhmwXY4x/hz7TKu7phuFVRNaBuOqlhQXSlpLTh5m6ewmZnSZjsWowmyZN+MOFN
         QAWqFM6aKUzQZiq2QQHG1P0PI5PuF6khBPFtrxmZbPuJ9CKBq04jQeAOoOTg97GeDq6+
         WyzVhYa20JEYEfnTbO7u+l04PzHdBpU2D5Q8TX88/7YLE5aIrrqiNB6EaK0icjENjzMi
         Rqwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oJQGPQmi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si27421165ybj.207.2020.06.25.21.02.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 21:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oJQGPQmi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofZN-0006pC-GU
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 00:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6e-0001Vb-LC
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:48 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6c-00028g-KM
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:48 -0400
Received: by mail-pg1-x541.google.com with SMTP id r18so4349399pgk.11
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UjqghZMppldJJQFCz4puY4NIT8Id2WOfJG93PywKQl8=;
 b=oJQGPQmitKNtnEQOFZ7B040mdDpGJ4Li5laWEnkKtf4RvSCQFyKw0/0WtYXvQ+tEWj
 WL15tT6BTSX2t0WQrhuDua1AoJaFnP1G/EwcMaFeqZ0tOxjSsHjBMtvVoudjjhVBVzuE
 dJK8onjFX64H1rs9laiu29nKXDqi7eWGy10kQh0Hq6aly7cl6dkEChZjOe38xPST5v7f
 vx5A4xkrxN+6JPVGh2DAcBALWxV96xIpS7NaumWhe4HjaVoyPNRTRwdRLSxHU6mbgloK
 0NZfMHGumE5oOKMUfGymHUoqr4VvK5jr7w0f1ny7bfE7tYis6I4XnJhq6oarJuFQm3t4
 krSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UjqghZMppldJJQFCz4puY4NIT8Id2WOfJG93PywKQl8=;
 b=Bvj+LSC8vWUnSz1apE0bbkZOCw7IpQ8IczmP7A/nVFq6/RQcEDROQ7a3pMiVQapEzO
 j39LcBHFGNNAaLBn/+XDvSg6XrqHkK19pe2Kef7bui0VDNVZ60T4trT8ZK+PMCDLoWQe
 f5nl1DNBT80XXuLxBdmMpWiJ9yO1s3xvdckNTFe6iniVolI4y6XJFU0muiv0lU596HEU
 VTihNcI0fhameni5O4vd/j8SGAYC5mrnmLM5TSGCDE2l9RXFtxu846wfzQFD85/zm9pL
 Sgfzg6dqCUcxG5FoZkk6KFxbSWByw7Xz3EwMBa/nOjm5e5s3X05DMAXjud/P2VbZw0lv
 4HZA==
X-Gm-Message-State: AOAM532mTAsdr6U7eVVWVfoWmeNkOx+ozqOxw+08mV1L9sN3VeoZj1GW
 7DlsnPInvmj1W8Ta2FJLecDmWQ==
X-Received: by 2002:a63:cf03:: with SMTP id j3mr947773pgg.24.1593142365268;
 Thu, 25 Jun 2020 20:32:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 44/46] target/arm: Add allocation tag storage for system
 mode
Date: Thu, 25 Jun 2020 20:31:42 -0700
Message-Id: <20200626033144.790098-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
X-TUID: tqbk/VcZYSAO

Look up the physical address for the given virtual address,
convert that to a tag physical address, and finally return
the host address that backs it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 131 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 4f9bd3add3..5ea57d487a 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "exec/ram_addr.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 
@@ -74,8 +75,138 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
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
+    /*
+     * If not backed by host ram, there is no tag storage: access unchecked.
+     * This is probably a guest os bug though, so log it.
+     */
+    if (unlikely(flags & TLB_MMIO)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Page @ 0x%" PRIx64 " indicates Tagged Normal memory "
+                      "but is not backed by host ram\n", ptr);
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
+                                    ptr_mmu_idx, ra == 0, &ignore, ra);
+        assert(!(flags & TLB_INVALID_MASK));
+    }
+
+    /* Any debug exception has priority over a tag check exception. */
+    if (unlikely(flags & TLB_WATCHPOINT)) {
+        int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
+        assert(ra != 0);
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

