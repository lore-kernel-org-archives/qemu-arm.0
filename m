Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp195733lfm;
        Tue, 21 Apr 2020 21:38:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypJgZmYMxMIfusG7jvQHfi7e7M9nHQuYz/pAYCCS2i3rZ4i06ygfgiMT+Ve7cFhLWSNjv2Z2
X-Received: by 2002:a37:b0e:: with SMTP id 14mr24369664qkl.170.1587530285391;
        Tue, 21 Apr 2020 21:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587530285; cv=none;
        d=google.com; s=arc-20160816;
        b=CCKQpKXBiNO3alggiC/C+3ebz0pgBpz1WvELJv7+R5yUSKiAqw7aFqyqcA0IHu61HG
         EqebZ9uEflxjoDp1Hyth6oGwCQKaihWagd2+Ovd6Rznk8NcZnYV2leoxFGlaVqOygNkn
         ZUjZwAsqk3ywZGd3c0hDBXc5w7JMEj7eqis3V054FBeHakfg3zeqHdWLXpalKA0fsAZe
         3Bl14lunicDuMRLBvUCgXmbe9JZYdl2yMQv1Kld/I5h9EmctxFYKE5Z2IK6eb9AJMq3k
         wS2X4024aCip3TUZTMXWreHJBxchlqHiWgq6EehmCyGXT2xsZWkCVlj5tB227o+Ggbax
         fcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tL5ieek7M74DoYpRz2/QiRNptpBgZR28dRwW48lo168=;
        b=xyziv8eDaVa/+YOQB5OQ3VKQltbfyRKx/Ch7vyTUYZ9FZmv47EVhPsXMGnUplBvtgM
         DySe5B/HE8gbJqTmGdT/FqRb6wz37/Bm+nAseKoW3lweJ1MN2Et0zRUiJGUeARSwF1T1
         4UTYqjGfqS+0HginqHmXEmE3vmWdHwYse2B2IaRjm9OSU8L+KwVl3rQj3B2jrwSReogy
         cSU02XYgUxE3U63DNL1gSrbo6gMwLulJKF3158BzeoSKkLE+bWfH84KWbzND1s+bz83o
         1yhtfHDw2TMqncZ0nWf1rWxQbnevMJZ2ArVW23h+sw9jPBfZ/RPQ2o0hB65rzdHXoxng
         kVsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tq6uNrEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22si2630864qtt.84.2020.04.21.21.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tq6uNrEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR79A-0008P4-Jt
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74g-0000gT-A9
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74e-0005Kr-Tm
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:26 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR74e-0005FO-At
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:24 -0400
Received: by mail-pl1-x641.google.com with SMTP id f8so444206plt.2
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tL5ieek7M74DoYpRz2/QiRNptpBgZR28dRwW48lo168=;
 b=Tq6uNrEqUUQVb1p2TU7+4TSxDp06OtKaO9BfJB8OcAUX4bPpAXSkj9FV1HA0e628OV
 BiBXJHpfdv9yLRcFc6kzfdnecGyhwz3QYZ1jHD4FJ4xj+JsGWxRY7vlfvlotZxxGy/Jx
 MLbwk3MbknNgS/bI9U/jv8sG6GiW01bBivjTT38SWhanghHGctSHCNV8zr0DvkFNxs16
 0NnR3ivubE3zVvhG2eNsXrvX2wDE4F/Kz3FaMYk1PfH8HrFAzauG++jZt6LozCm7x+GO
 2XiVscBGLtrbuMIPXJS2p6h9mEvJ2EERLd78bgkNQWxw9RTd972WbSj6GGYxindwpkXw
 6fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tL5ieek7M74DoYpRz2/QiRNptpBgZR28dRwW48lo168=;
 b=Ne/K6KSpbGPkqquQqrYgehNssYmHZzk5RN55d4RqW5BWbiZQ7ATxRSjUk3D9YAkVUe
 pYJtLrqHi3/yfnpP7grn7NIGPmTjhKvpY5gj6CPKJfpn4otHMQ6i1uDKuFLu3unw25TU
 bNti/cf8IPwARhRnEFgM9YJ7CMKa5Y8aj+lUJn6nlw5zsLyugxEnmKNg/s3qn+KiNEDZ
 V0CjqZo9/po+rH8PnbeaaY1LzZuLlcP6ZUqlCasH2Bpu/RQfliKV03iWtq6pMix6c1Pt
 HTBI88aTL6PvuBhrBq39Wf149WhdsOotYGcWh4BwcdRn4mBa36fGqm02Fjo7Hvmr5f/0
 wu9g==
X-Gm-Message-State: AGi0PubGpeiyUj7MJOpFyT7VZdRobcwp3SV8KWcGEcPuShpQH0VXk3ki
 oyrxfLj/ksOwb1ZuPGkhp2jxDw==
X-Received: by 2002:a17:902:6b86:: with SMTP id
 p6mr24755683plk.150.1587530002691; 
 Tue, 21 Apr 2020 21:33:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm4129613pfd.107.2020.04.21.21.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 21:33:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/18] target/arm: Add sve infrastructure for page lookup
Date: Tue, 21 Apr 2020 21:32:59 -0700
Message-Id: <20200422043309.18430-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200422043309.18430-1-richard.henderson@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3+ha5lx+FJiO

For contiguous predicated memory operations, we want to
minimize the number of tlb lookups performed.  We have
open-coded this for sve_ld1_r, but for correctness with
MTE we will need this for all of the memory operations.

Create a structure that holds the bounds of active elements,
and metadata for two pages.  Add routines to find those
active elements, lookup the pages, and run watchpoints
for those pages.

Temporarily mark the functions unused to avoid Werror.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 263 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 261 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index aad2c8c237..2f053a9152 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1630,7 +1630,7 @@ void HELPER(sve_cpy_z_d)(void *vd, void *vg, uint64_t val, uint32_t desc)
     }
 }
 
-/* Big-endian hosts need to frob the byte indicies.  If the copy
+/* Big-endian hosts need to frob the byte indices.  If the copy
  * happens to be 8-byte aligned, then no frobbing necessary.
  */
 static void swap_memmove(void *vd, void *vs, size_t n)
@@ -3974,7 +3974,7 @@ void HELPER(sve_fcmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
 /*
  * Load elements into @vd, controlled by @vg, from @host + @mem_ofs.
  * Memory is valid through @host + @mem_max.  The register element
- * indicies are inferred from @mem_ofs, as modified by the types for
+ * indices are inferred from @mem_ofs, as modified by the types for
  * which the helper is built.  Return the @mem_ofs of the first element
  * not loaded (which is @mem_max if they are all loaded).
  *
@@ -4133,6 +4133,265 @@ static intptr_t max_for_page(target_ulong base, intptr_t mem_off,
     return MIN(split, mem_max - mem_off) + mem_off;
 }
 
+/*
+ * Resolve the guest virtual address to info->host and info->flags.
+ * If @nofault, return false if the page is invalid, otherwise
+ * exit via page fault exception.
+ */
+
+typedef struct {
+    void *host;
+    int flags;
+    MemTxAttrs attrs;
+} SVEHostPage;
+
+static bool sve_probe_page(SVEHostPage *info, bool nofault,
+                           CPUARMState *env, target_ulong addr,
+                           int mem_off, MMUAccessType access_type,
+                           int mmu_idx, uintptr_t retaddr)
+{
+    int flags;
+
+    addr += mem_off;
+    flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
+                               &info->host, retaddr);
+    info->flags = flags;
+
+    if (flags & TLB_INVALID_MASK) {
+        g_assert(nofault);
+        return false;
+    }
+
+    /* Ensure that info->host[] is relative to addr, not addr + mem_off. */
+    info->host -= mem_off;
+
+#ifdef CONFIG_USER_ONLY
+    memset(&info->attrs, 0, sizeof(info->attrs));
+#else
+    /*
+     * Find the iotlbentry for addr and return the transaction attributes.
+     * This *must* be present in the TLB because we just found the mapping.
+     */
+    {
+        uintptr_t index = tlb_index(env, mmu_idx, addr);
+
+# ifdef CONFIG_DEBUG_TCG
+        CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
+        target_ulong comparator = (access_type == MMU_DATA_LOAD
+                                   ? entry->addr_read
+                                   : tlb_addr_write(entry));
+        g_assert(tlb_hit(comparator, addr));
+# endif
+
+        CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
+        info->attrs = iotlbentry->attrs;
+    }
+#endif
+
+    return true;
+}
+
+
+/*
+ * Analyse contiguous data, protected by a governing predicate.
+ */
+
+typedef enum {
+    FAULT_NO,
+    FAULT_FIRST,
+    FAULT_ALL,
+} SVEContFault;
+
+typedef struct {
+    /*
+     * First and last element wholly contained within the two pages.
+     * mem_off_first[0] and reg_off_first[0] are always set >= 0.
+     * reg_off_last[0] may be < 0 if the first element crosses pages.
+     * All of mem_off_first[1], reg_off_first[1] and reg_off_last[1]
+     * are set >= 0 only if there are complete elements on a second page.
+     *
+     * The reg_off_* offsets are relative to the internal vector register.
+     * The mem_off_first offset is relative to the memory address; the
+     * two offsets are different when a load operation extends, a store
+     * operation truncates, or for multi-register operations.
+     */
+    int16_t mem_off_first[2];
+    int16_t reg_off_first[2];
+    int16_t reg_off_last[2];
+
+    /*
+     * One element that is misaligned and spans both pages,
+     * or -1 if there is no such active element.
+     */
+    int16_t mem_off_split;
+    int16_t reg_off_split;
+
+    /*
+     * The byte offset at which the entire operation crosses a page boundary.
+     * Set >= 0 if and only if the entire operation spans two pages.
+     */
+    int16_t page_split;
+
+    /* TLB data for the two pages. */
+    SVEHostPage page[2];
+} SVEContLdSt;
+
+/*
+ * Find first active element on each page, and a loose bound for the
+ * final element on each page.  Identify any single element that spans
+ * the page boundary.  Return true if there are any active elements.
+ */
+static bool __attribute__((unused))
+sve_cont_ldst_elements(SVEContLdSt *info, target_ulong addr, uint64_t *vg,
+                       intptr_t reg_max, int esz, int msize)
+{
+    const int esize = 1 << esz;
+    const uint64_t pg_mask = pred_esz_masks[esz];
+    intptr_t reg_off_first = -1, reg_off_last = -1, reg_off_split;
+    intptr_t mem_off_last, mem_off_split;
+    intptr_t page_split, elt_split;
+    intptr_t i;
+
+    /* Set all of the element indices to -1, and the TLB data to 0. */
+    memset(info, -1, offsetof(SVEContLdSt, page));
+    memset(info->page, 0, sizeof(info->page));
+
+    /* Gross scan over the entire predicate to find bounds. */
+    i = 0;
+    do {
+        uint64_t pg = vg[i] & pg_mask;
+        if (pg) {
+            reg_off_last = i * 64 + 63 - clz64(pg);
+            if (reg_off_first < 0) {
+                reg_off_first = i * 64 + ctz64(pg);
+            }
+        }
+    } while (++i * 64 < reg_max);
+
+    if (unlikely(reg_off_first < 0)) {
+        /* No active elements, no pages touched. */
+        return false;
+    }
+    tcg_debug_assert(reg_off_last >= 0 && reg_off_last < reg_max);
+
+    info->reg_off_first[0] = reg_off_first;
+    info->mem_off_first[0] = (reg_off_first >> esz) * msize;
+    mem_off_last = (reg_off_last >> esz) * msize;
+
+    page_split = -(addr | TARGET_PAGE_MASK);
+    if (likely(mem_off_last + msize <= page_split)) {
+        /* The entire operation fits within a single page. */
+        info->reg_off_last[0] = reg_off_last;
+        return true;
+    }
+
+    info->page_split = page_split;
+    elt_split = page_split / msize;
+    reg_off_split = elt_split << esz;
+    mem_off_split = elt_split * msize;
+
+    /*
+     * This is the last full element on the first page, but it is not
+     * necessarily active.  If there is no full element, i.e. the first
+     * active element is the one that's split, this value remains -1.
+     * It is useful as iteration bounds.
+     */
+    if (elt_split != 0) {
+        info->reg_off_last[0] = reg_off_split - esize;
+    }
+
+    /* Determine if an unaligned element spans the pages.  */
+    if (page_split % msize != 0) {
+        /* It is helpful to know if the split element is active. */
+        if ((vg[reg_off_split >> 6] >> (reg_off_split & 63)) & 1) {
+            info->reg_off_split = reg_off_split;
+            info->mem_off_split = mem_off_split;
+
+            if (reg_off_split == reg_off_last) {
+                /* The page crossing element is last. */
+                return true;
+            }
+        }
+        reg_off_split += esize;
+        mem_off_split += msize;
+    }
+
+    /*
+     * We do want the first active element on the second page, because
+     * this may affect the address reported in an exception.
+     */
+    reg_off_split = find_next_active(vg, reg_off_split, reg_max, esz);
+    tcg_debug_assert(reg_off_split <= reg_off_last);
+    info->reg_off_first[1] = reg_off_split;
+    info->mem_off_first[1] = (reg_off_split >> esz) * msize;
+    info->reg_off_last[1] = reg_off_last;
+    return true;
+}
+
+/*
+ * Resolve the guest virtual addresses to info->page[].
+ * Control the generation of page faults with @fault.  Return false if
+ * there is no work to do, which can only happen with @fault == FAULT_NO.
+ */
+static bool __attribute__((unused))
+sve_cont_ldst_pages(SVEContLdSt *info, SVEContFault fault, CPUARMState *env,
+                    target_ulong addr, MMUAccessType access_type,
+                    uintptr_t retaddr)
+{
+    int mmu_idx = cpu_mmu_index(env, false);
+    int mem_off = info->mem_off_first[0];
+    bool nofault = fault == FAULT_NO;
+    bool have_work = true;
+
+    if (!sve_probe_page(&info->page[0], nofault, env, addr, mem_off,
+                        access_type, mmu_idx, retaddr)) {
+        /* No work to be done. */
+        return false;
+    }
+
+    if (likely(info->page_split < 0)) {
+        /* The entire operation was on the one page. */
+        return true;
+    }
+
+    /*
+     * If the second page is invalid, then we want the fault address to be
+     * the first byte on that page which is accessed.
+     */
+    if (info->mem_off_split >= 0) {
+        /*
+         * There is an element split across the pages.  The fault address
+         * should be the first byte of the second page.
+         */
+        mem_off = info->page_split;
+        /*
+         * If the split element is also the first active element
+         * of the vector, then:  For first-fault we should continue
+         * to generate faults for the second page.  For no-fault,
+         * we have work only if the second page is valid.
+         */
+        if (info->mem_off_first[0] < info->mem_off_split) {
+            nofault = FAULT_FIRST;
+            have_work = false;
+        }
+    } else {
+        /*
+         * There is no element split across the pages.  The fault address
+         * should be the first active element on the second page.
+         */
+        mem_off = info->mem_off_first[1];
+        /*
+         * There must have been one active element on the first page,
+         * so we're out of first-fault territory.
+         */
+        nofault = fault != FAULT_ALL;
+    }
+
+    have_work |= sve_probe_page(&info->page[1], nofault, env, addr, mem_off,
+                                access_type, mmu_idx, retaddr);
+    return have_work;
+}
+
 /*
  * The result of tlb_vaddr_to_host for user-only is just g2h(x),
  * which is always non-null.  Elide the useless test.
-- 
2.20.1

