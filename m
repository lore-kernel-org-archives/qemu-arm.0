Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2658943ejm;
        Wed, 3 May 2023 00:23:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qYAlH0sBQRvHY84rwP8yS0BEfDYSfgO+xxxELzBVBCfIsGSOCzK1mOTN2UXukff70wkPV
X-Received: by 2002:a05:6214:2629:b0:61b:5816:a265 with SMTP id gv9-20020a056214262900b0061b5816a265mr9908241qvb.16.1683098588078;
        Wed, 03 May 2023 00:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098588; cv=none;
        d=google.com; s=arc-20160816;
        b=e1wSn5t0JPugzlOekrtNujeAlzvHKhPgk3/VYEU6JnF/fO37zDYaFM8dOuU5KyChXh
         axTcD92aH7BDp0SOKVpwfequR1OQCS5nyv79LZVcBk3yqh5Xpb+MOYpu04ia/UmdnR8/
         zn+wNI0fZYFSXCiQk0ihrjy8FcYQbUL+bUw5eR8XBMq5ugztwYKD2SXEIUdxbdFuvlZ6
         bldnIE24QOij5URh3JSZmUa0NYNEg4GGmtVbWCSGV2SPjHcgCTgAvCN1l0sIRkt8R5PW
         gt5G5TiotevxqsTa2MYJhwquaDzKpcGyb8lNBVVxfE897tocTNtnbXaYyYJxu/EZkypt
         VafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Qm6MoMk9ybdgfvVzjFlg+kTYG6DqCqNHtfSUbvJxM98=;
        b=aqkCC8JJ1MD1XsjHF2zIizPdri1VyP44b9LyWgGsn0EVhlP7BU08pVHsm5ccr9XXHO
         +MoN0tCdsHgl/SUH9JhSDijcr7DzEF85jMky/YUpJs+E/m89oWj3186MoCzLUTTUGvv2
         TiDTSgPONk0BcynliPqEzLZ2e6GXmoOXW+fURJb6DqKAnNZvTW6+Vk+9IZUlrkEf0kCE
         FC2Ofyda32/TfWTymf2S+OMwytl66fccTH7L7HOZXSzoIgmkMoA/f8tuetdZvCTU8SxL
         UHJ2Ayphr6WDbuULmRcirJ1vZMm7gxRe6D2+dEWhyPTE3cJm+VAv6TbkG+E+8t+D6HC0
         y5xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UO8Ew9fN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if4-20020a0562141c4400b0061b5b1f4c80si2211379qvb.122.2023.05.03.00.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UO8Ew9fN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6aI-0005iL-P1; Wed, 03 May 2023 03:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zx-00053Q-KN
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zr-0005af-Bt
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso31631345e9.1
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097622; x=1685689622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qm6MoMk9ybdgfvVzjFlg+kTYG6DqCqNHtfSUbvJxM98=;
 b=UO8Ew9fNxdwEiELKQEVLpVBMpnShCvKozwOBysMIkVYCsO+vsYL+UX7dIzMzyKvjBa
 HBE3cYJMPGBDsYioECZXl4WGyP2Og1/1Zy45HsAIL/tLn3bhmStW77av3PaE1972K+Ld
 NNrRWIFvBDaaQHAxG5hVW2ekksA/5OSLCD7jDDuVDO/2mz5oL8sWfuQmIdqvC42SIEGs
 BGl0P6+97Bknmnkmnh37j3dja/6XmRPXxhshJYXTuDSj9CXF35w/lBXvciEPGNe0we4x
 GgcrTYW8QEUMxCxZZAkC+HQmBh5QQ9SyVp+w4tVv8BUO/Fg5liJjIJAeg38lHPjG2Lyt
 7n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097622; x=1685689622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qm6MoMk9ybdgfvVzjFlg+kTYG6DqCqNHtfSUbvJxM98=;
 b=L255/FAGTpJEKxjyw12OX/S3VmL3Kl9QDfU259nb8/ozZ1Okq+sC7XOuGDsOGn7aSh
 GQ/DH426bu78Q5trLUJnUZ9gMynUmyOqfqa27NH5fS0ekWYX7lJc7WG58Tw7nQSzZilY
 pLDeIPjc0Oq6SRnTggy1tPG4XYPgP2cAJVAFzfiQWelVEtvNCFDM2rm6xYSO1k8TBrZJ
 ai4MV6ORLSeDpfS5k6pINi52rfRZzh3QW1SgATF9Iiwf6yp5kVw8WGHYPPM9GQ9FS5Cy
 KYKZMBR3l6TPrxJa+BY39HOavRhRngMFdf0MGda0w846712xZWtDlr2Rqb5cdkm9ezgF
 cwLA==
X-Gm-Message-State: AC+VfDwzyJiQcVFbu0OqeUTxGaQYUjcyRhngqjE2XaMo84I9Zxc0iDpk
 4p8vChculUI+iyCCm6MiTfsSiw==
X-Received: by 2002:a1c:7c19:0:b0:3f1:8c5f:dfc5 with SMTP id
 x25-20020a1c7c19000000b003f18c5fdfc5mr14421084wmc.39.1683097621715; 
 Wed, 03 May 2023 00:07:01 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 05/57] accel/tcg: Reorg system mode store helpers
Date: Wed,  3 May 2023 08:06:04 +0100
Message-Id: <20230503070656.1746170-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cR84wqwv7xfP

Instead of trying to unify all operations on uint64_t, use
mmu_lookup() to perform the basic tlb hit and resolution.
Create individual functions to handle access by size.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 408 +++++++++++++++++++++------------------------
 1 file changed, 193 insertions(+), 215 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index dd68514260..f52c7e6da0 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2531,322 +2531,300 @@ store_memop(void *haddr, uint64_t val, MemOp op)
     }
 }
 
-static void full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                         MemOpIdx oi, uintptr_t retaddr);
-
-static void __attribute__((noinline))
-store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
-                       uintptr_t retaddr, size_t size, uintptr_t mmu_idx,
-                       bool big_endian)
+/**
+ * do_st_mmio_leN:
+ * @env: cpu context
+ * @p: translation parameters
+ * @val_le: data to store
+ * @mmu_idx: virtual address context
+ * @ra: return address into tcg generated code, or 0
+ *
+ * Store @p->size bytes at @p->addr, which is memory-mapped i/o.
+ * The bytes to store are extracted in little-endian order from @val_le;
+ * return the bytes of @val_le beyond @p->size that have not been stored.
+ */
+static uint64_t do_st_mmio_leN(CPUArchState *env, MMULookupPageData *p,
+                               uint64_t val_le, int mmu_idx, uintptr_t ra)
 {
-    uintptr_t index, index2;
-    CPUTLBEntry *entry, *entry2;
-    target_ulong page1, page2, tlb_addr, tlb_addr2;
-    MemOpIdx oi;
-    size_t size2;
-    int i;
+    CPUTLBEntryFull *full = p->full;
+    target_ulong addr = p->addr;
+    int i, size = p->size;
 
-    /*
-     * Ensure the second page is in the TLB.  Note that the first page
-     * is already guaranteed to be filled, and that the second page
-     * cannot evict the first.  An exception to this rule is PAGE_WRITE_INV
-     * handling: the first page could have evicted itself.
-     */
-    page1 = addr & TARGET_PAGE_MASK;
-    page2 = (addr + size) & TARGET_PAGE_MASK;
-    size2 = (addr + size) & ~TARGET_PAGE_MASK;
-    index2 = tlb_index(env, mmu_idx, page2);
-    entry2 = tlb_entry(env, mmu_idx, page2);
-
-    tlb_addr2 = tlb_addr_write(entry2);
-    if (page1 != page2 && !tlb_hit_page(tlb_addr2, page2)) {
-        if (!victim_tlb_hit(env, mmu_idx, index2, MMU_DATA_STORE, page2)) {
-            tlb_fill(env_cpu(env), page2, size2, MMU_DATA_STORE,
-                     mmu_idx, retaddr);
-            index2 = tlb_index(env, mmu_idx, page2);
-            entry2 = tlb_entry(env, mmu_idx, page2);
-        }
-        tlb_addr2 = tlb_addr_write(entry2);
+    QEMU_IOTHREAD_LOCK_GUARD();
+    for (i = 0; i < size; i++, val_le >>= 8) {
+        io_writex(env, full, mmu_idx, val_le, addr + i, ra, MO_UB);
     }
+    return val_le;
+}
 
-    index = tlb_index(env, mmu_idx, addr);
-    entry = tlb_entry(env, mmu_idx, addr);
-    tlb_addr = tlb_addr_write(entry);
+/**
+ * do_st_bytes_leN:
+ * @p: translation parameters
+ * @val_le: data to store
+ *
+ * Store @p->size bytes at @p->haddr, which is RAM.
+ * The bytes to store are extracted in little-endian order from @val_le;
+ * return the bytes of @val_le beyond @p->size that have not been stored.
+ */
+static uint64_t do_st_bytes_leN(MMULookupPageData *p, uint64_t val_le)
+{
+    uint8_t *haddr = p->haddr;
+    int i, size = p->size;
 
-    /*
-     * Handle watchpoints.  Since this may trap, all checks
-     * must happen before any store.
-     */
-    if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
-        cpu_check_watchpoint(env_cpu(env), addr, size - size2,
-                             env_tlb(env)->d[mmu_idx].fulltlb[index].attrs,
-                             BP_MEM_WRITE, retaddr);
-    }
-    if (unlikely(tlb_addr2 & TLB_WATCHPOINT)) {
-        cpu_check_watchpoint(env_cpu(env), page2, size2,
-                             env_tlb(env)->d[mmu_idx].fulltlb[index2].attrs,
-                             BP_MEM_WRITE, retaddr);
+    for (i = 0; i < size; i++, val_le >>= 8) {
+        haddr[i] = val_le;
     }
+    return val_le;
+}
 
-    /*
-     * XXX: not efficient, but simple.
-     * This loop must go in the forward direction to avoid issues
-     * with self-modifying code in Windows 64-bit.
-     */
-    oi = make_memop_idx(MO_UB, mmu_idx);
-    if (big_endian) {
-        for (i = 0; i < size; ++i) {
-            /* Big-endian extract.  */
-            uint8_t val8 = val >> (((size - 1) * 8) - (i * 8));
-            full_stb_mmu(env, addr + i, val8, oi, retaddr);
-        }
+/*
+ * Wrapper for the above.
+ */
+static uint64_t do_st_leN(CPUArchState *env, MMULookupPageData *p,
+                          uint64_t val_le, int mmu_idx, uintptr_t ra)
+{
+    if (unlikely(p->flags & TLB_MMIO)) {
+        return do_st_mmio_leN(env, p, val_le, mmu_idx, ra);
+    } else if (unlikely(p->flags & TLB_DISCARD_WRITE)) {
+        return val_le >> (p->size * 8);
     } else {
-        for (i = 0; i < size; ++i) {
-            /* Little-endian extract.  */
-            uint8_t val8 = val >> (i * 8);
-            full_stb_mmu(env, addr + i, val8, oi, retaddr);
-        }
+        return do_st_bytes_leN(p, val_le);
     }
 }
 
-static inline void QEMU_ALWAYS_INLINE
-store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
-             MemOpIdx oi, uintptr_t retaddr, MemOp op)
+static void do_st_1(CPUArchState *env, MMULookupPageData *p, uint8_t val,
+                    int mmu_idx, uintptr_t ra)
 {
-    const unsigned a_bits = get_alignment_bits(get_memop(oi));
-    const size_t size = memop_size(op);
-    uintptr_t mmu_idx = get_mmuidx(oi);
-    uintptr_t index;
-    CPUTLBEntry *entry;
-    target_ulong tlb_addr;
-    void *haddr;
-
-    tcg_debug_assert(mmu_idx < NB_MMU_MODES);
-
-    /* Handle CPU specific unaligned behaviour */
-    if (addr & ((1 << a_bits) - 1)) {
-        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_STORE,
-                             mmu_idx, retaddr);
+    if (unlikely(p->flags & TLB_MMIO)) {
+        io_writex(env, p->full, mmu_idx, val, p->addr, ra, MO_UB);
+    } else if (unlikely(p->flags & TLB_DISCARD_WRITE)) {
+        /* nothing */
+    } else {
+        *(uint8_t *)p->haddr = val;
     }
-
-    index = tlb_index(env, mmu_idx, addr);
-    entry = tlb_entry(env, mmu_idx, addr);
-    tlb_addr = tlb_addr_write(entry);
-
-    /* If the TLB entry is for a different page, reload and try again.  */
-    if (!tlb_hit(tlb_addr, addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
-            addr & TARGET_PAGE_MASK)) {
-            tlb_fill(env_cpu(env), addr, size, MMU_DATA_STORE,
-                     mmu_idx, retaddr);
-            index = tlb_index(env, mmu_idx, addr);
-            entry = tlb_entry(env, mmu_idx, addr);
-        }
-        tlb_addr = tlb_addr_write(entry) & ~TLB_INVALID_MASK;
-    }
-
-    /* Handle anything that isn't just a straight memory access.  */
-    if (unlikely(tlb_addr & ~TARGET_PAGE_MASK)) {
-        CPUTLBEntryFull *full;
-        bool need_swap;
-
-        /* For anything that is unaligned, recurse through byte stores.  */
-        if ((addr & (size - 1)) != 0) {
-            goto do_unaligned_access;
-        }
-
-        full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
-        /* Handle watchpoints.  */
-        if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
-            /* On watchpoint hit, this will longjmp out.  */
-            cpu_check_watchpoint(env_cpu(env), addr, size,
-                                 full->attrs, BP_MEM_WRITE, retaddr);
-        }
-
-        need_swap = size > 1 && (tlb_addr & TLB_BSWAP);
-
-        /* Handle I/O access.  */
-        if (tlb_addr & TLB_MMIO) {
-            io_writex(env, full, mmu_idx, val, addr, retaddr,
-                      op ^ (need_swap * MO_BSWAP));
-            return;
-        }
-
-        /* Ignore writes to ROM.  */
-        if (unlikely(tlb_addr & TLB_DISCARD_WRITE)) {
-            return;
-        }
-
-        /* Handle clean RAM pages.  */
-        if (tlb_addr & TLB_NOTDIRTY) {
-            notdirty_write(env_cpu(env), addr, size, full, retaddr);
-        }
-
-        haddr = (void *)((uintptr_t)addr + entry->addend);
-
-        /*
-         * Keep these two store_memop separate to ensure that the compiler
-         * is able to fold the entire function to a single instruction.
-         * There is a build-time assert inside to remind you of this.  ;-)
-         */
-        if (unlikely(need_swap)) {
-            store_memop(haddr, val, op ^ MO_BSWAP);
-        } else {
-            store_memop(haddr, val, op);
-        }
-        return;
-    }
-
-    /* Handle slow unaligned access (it spans two pages or IO).  */
-    if (size > 1
-        && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
-                     >= TARGET_PAGE_SIZE)) {
-    do_unaligned_access:
-        store_helper_unaligned(env, addr, val, retaddr, size,
-                               mmu_idx, memop_big_endian(op));
-        return;
-    }
-
-    haddr = (void *)((uintptr_t)addr + entry->addend);
-    store_memop(haddr, val, op);
 }
 
-static void __attribute__((noinline))
-full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-             MemOpIdx oi, uintptr_t retaddr)
+static void do_st_2(CPUArchState *env, MMULookupPageData *p, uint16_t val,
+                    int mmu_idx, MemOp memop, uintptr_t ra)
 {
-    validate_memop(oi, MO_UB);
-    store_helper(env, addr, val, oi, retaddr, MO_UB);
+    if (unlikely(p->flags & TLB_MMIO)) {
+        io_writex(env, p->full, mmu_idx, val, p->addr, ra, memop);
+    } else if (unlikely(p->flags & TLB_DISCARD_WRITE)) {
+        /* nothing */
+    } else {
+        /* Swap to host endian if necessary, then store. */
+        if (memop & MO_BSWAP) {
+            val = bswap16(val);
+        }
+        store_memop(p->haddr, val, MO_UW);
+    }
+}
+
+static void do_st_4(CPUArchState *env, MMULookupPageData *p, uint32_t val,
+                    int mmu_idx, MemOp memop, uintptr_t ra)
+{
+    if (unlikely(p->flags & TLB_MMIO)) {
+        io_writex(env, p->full, mmu_idx, val, p->addr, ra, memop);
+    } else if (unlikely(p->flags & TLB_DISCARD_WRITE)) {
+        /* nothing */
+    } else {
+        /* Swap to host endian if necessary, then store. */
+        if (memop & MO_BSWAP) {
+            val = bswap32(val);
+        }
+        store_memop(p->haddr, val, MO_UL);
+    }
+}
+
+static void do_st_8(CPUArchState *env, MMULookupPageData *p, uint64_t val,
+                    int mmu_idx, MemOp memop, uintptr_t ra)
+{
+    if (unlikely(p->flags & TLB_MMIO)) {
+        io_writex(env, p->full, mmu_idx, val, p->addr, ra, memop);
+    } else if (unlikely(p->flags & TLB_DISCARD_WRITE)) {
+        /* nothing */
+    } else {
+        /* Swap to host endian if necessary, then store. */
+        if (memop & MO_BSWAP) {
+            val = bswap64(val);
+        }
+        store_memop(p->haddr, val, MO_UQ);
+    }
 }
 
 void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                        MemOpIdx oi, uintptr_t retaddr)
+                        MemOpIdx oi, uintptr_t ra)
 {
-    full_stb_mmu(env, addr, val, oi, retaddr);
+    MMULookupLocals l;
+    bool crosspage;
+
+    validate_memop(oi, MO_UB);
+    crosspage = mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE, &l);
+    tcg_debug_assert(!crosspage);
+
+    do_st_1(env, &l.page[0], val, l.mmu_idx, ra);
 }
 
-static void full_le_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                            MemOpIdx oi, uintptr_t retaddr)
+static void do_st2_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+                       MemOpIdx oi, uintptr_t ra)
 {
-    validate_memop(oi, MO_LEUW);
-    store_helper(env, addr, val, oi, retaddr, MO_LEUW);
+    MMULookupLocals l;
+    bool crosspage;
+    uint8_t a, b;
+
+    crosspage = mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE, &l);
+    if (likely(!crosspage)) {
+        do_st_2(env, &l.page[0], val, l.mmu_idx, l.memop, ra);
+        return;
+    }
+
+    if ((l.memop & MO_BSWAP) == MO_LE) {
+        a = val, b = val >> 8;
+    } else {
+        b = val, a = val >> 8;
+    }
+    do_st_1(env, &l.page[0], a, l.mmu_idx, ra);
+    do_st_1(env, &l.page[1], b, l.mmu_idx, ra);
 }
 
 void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    full_le_stw_mmu(env, addr, val, oi, retaddr);
-}
-
-static void full_be_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                            MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUW);
-    store_helper(env, addr, val, oi, retaddr, MO_BEUW);
+    validate_memop(oi, MO_LEUW);
+    do_st2_mmu(env, addr, val, oi, retaddr);
 }
 
 void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    full_be_stw_mmu(env, addr, val, oi, retaddr);
+    validate_memop(oi, MO_BEUW);
+    do_st2_mmu(env, addr, val, oi, retaddr);
 }
 
-static void full_le_stl_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                            MemOpIdx oi, uintptr_t retaddr)
+static void do_st4_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                       MemOpIdx oi, uintptr_t ra)
 {
-    validate_memop(oi, MO_LEUL);
-    store_helper(env, addr, val, oi, retaddr, MO_LEUL);
+    MMULookupLocals l;
+    bool crosspage;
+
+    crosspage = mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE, &l);
+    if (likely(!crosspage)) {
+        do_st_4(env, &l.page[0], val, l.mmu_idx, l.memop, ra);
+        return;
+    }
+
+    /* Swap to little endian for simplicity, then store by bytes. */
+    if ((l.memop & MO_BSWAP) != MO_LE) {
+        val = bswap32(val);
+    }
+    val = do_st_leN(env, &l.page[0], val, l.mmu_idx, ra);
+    (void) do_st_leN(env, &l.page[1], val, l.mmu_idx, ra);
 }
 
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    full_le_stl_mmu(env, addr, val, oi, retaddr);
-}
-
-static void full_be_stl_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                            MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUL);
-    store_helper(env, addr, val, oi, retaddr, MO_BEUL);
+    validate_memop(oi, MO_LEUL);
+    do_st4_mmu(env, addr, val, oi, retaddr);
 }
 
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    full_be_stl_mmu(env, addr, val, oi, retaddr);
+    validate_memop(oi, MO_BEUL);
+    do_st4_mmu(env, addr, val, oi, retaddr);
+}
+
+static void do_st8_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                       MemOpIdx oi, uintptr_t ra)
+{
+    MMULookupLocals l;
+    bool crosspage;
+
+    crosspage = mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE, &l);
+    if (likely(!crosspage)) {
+        do_st_8(env, &l.page[0], val, l.mmu_idx, l.memop, ra);
+        return;
+    }
+
+    /* Swap to little endian for simplicity, then store by bytes. */
+    if ((l.memop & MO_BSWAP) != MO_LE) {
+        val = bswap64(val);
+    }
+    val = do_st_leN(env, &l.page[0], val, l.mmu_idx, ra);
+    (void) do_st_leN(env, &l.page[1], val, l.mmu_idx, ra);
 }
 
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUQ);
-    store_helper(env, addr, val, oi, retaddr, MO_LEUQ);
+    do_st8_mmu(env, addr, val, oi, retaddr);
 }
 
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUQ);
-    store_helper(env, addr, val, oi, retaddr, MO_BEUQ);
+    do_st8_mmu(env, addr, val, oi, retaddr);
 }
 
 /*
  * Store Helpers for cpu_ldst.h
  */
 
-typedef void FullStoreHelper(CPUArchState *env, target_ulong addr,
-                             uint64_t val, MemOpIdx oi, uintptr_t retaddr);
-
-static inline void cpu_store_helper(CPUArchState *env, target_ulong addr,
-                                    uint64_t val, MemOpIdx oi, uintptr_t ra,
-                                    FullStoreHelper *full_store)
+static void plugin_store_cb(CPUArchState *env, abi_ptr addr, MemOpIdx oi)
 {
-    full_store(env, addr, val, oi, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
                  MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, full_stb_mmu);
+    helper_ret_stb_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stw_be_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, full_be_stw_mmu);
+    helper_be_stw_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stl_be_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, full_be_stl_mmu);
+    helper_be_stl_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stq_be_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, helper_be_stq_mmu);
+    helper_be_stq_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stw_le_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, full_le_stw_mmu);
+    helper_le_stw_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stl_le_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, full_le_stl_mmu);
+    helper_le_stl_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stq_le_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, helper_le_stq_mmu);
+    helper_le_stq_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
-- 
2.34.1

