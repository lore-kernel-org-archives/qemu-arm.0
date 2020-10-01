Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp740565lfq;
        Thu, 1 Oct 2020 10:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaNjj1lfI18m3Ereaw7jpDE2mLWlXQNtbuRCbHgmqaj9HFzgefUTuVcG9L4NlPURL6FyQM
X-Received: by 2002:ab0:25c7:: with SMTP id y7mr6084126uan.137.1601572255637;
        Thu, 01 Oct 2020 10:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601572255; cv=none;
        d=google.com; s=arc-20160816;
        b=GlcOXPkZTaplvSOHdw/r54i3u5Njuesor4qXSmDtmI0/L3ApZKgmKspFSDc1NHaZ4R
         ajJ1XjbtxKFdZoHPU8++oa/1RjtlrM/DX8FwMqRvPtK3h30Pdue+NXVQd6TG2PYaG1sE
         3iATlH5xbcEoZ2oDPLWVP/HCaZkBAtWzcT5Wv/A5/kSLPbung5pRaW8Ca6fGKrAEvxoV
         puXVJeGS0UyDVhH7kfF8hmgXXFIBzoYb6l8C3GTcr72tSYIPxdg53/paNc5xxEFQl42P
         5I8ozs7N+Paipxmd+Bl01/FfPKqGo5T1TnnVWwZY4mrF2Cf5xyG00pi7A/uF0lEYoTHq
         o/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iUnm89xPwtbKdupFnLnc0nvrW4vzj+N7K5y5SPZF9pc=;
        b=fNEI7h2sczW9qrP8H9bYZsi3rDEscqLDo8Q9N0HOEVsNaLCdn/evUmBsmbDdghSUiI
         MeARFbLpasHGOspc8AMbDDdBBppb6mmMgS95byYYke36qdZTsqJ6lQ9fln7lVfrQNINU
         0Co56B5Gv9ZH6Xdb/xbK+CtSCwcec70/K/jErl28VKD9oaOZqocxdOTPREyeoyTO0lwu
         ndyO36hpwTOFJbkbhrSghXnKihJ+si3g23Axc26kph1WMzNzC+txei4/ayzIDjcxnt89
         HYQS1iArm1HFlCO9S0OxlKF8pjzoqCCXfYnmhLiaickMLElIW1fA20uXRpxFZGts2vqC
         JvXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NgVxjl3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q26si932118vsn.48.2020.10.01.10.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 10:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NgVxjl3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kO26Y-0004nl-Ro
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 13:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO23m-00024B-Gx
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 13:08:02 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO23j-0001cO-IH
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 13:08:02 -0400
Received: by mail-oi1-x243.google.com with SMTP id x14so6336625oic.9
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2020 10:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iUnm89xPwtbKdupFnLnc0nvrW4vzj+N7K5y5SPZF9pc=;
 b=NgVxjl3u+laVek7/3WZq+NBXxPIu9qOguwmXbz6yp5kXsIIfkBvSruhz5XdTl7UjEb
 xzgklub4wp/7i0M5wxuTzVX0G+4zYH7824BO9xWq0XckUFTAkJ+gPdDYZPK01mlA03YW
 +08cqb2BwrUfyevbAc5fY7L/t5U4bcRrpxonxEPUY8i6snZ8WECXOcsQgazDJvLInkFS
 YJqFN4RE34NmMkydy5zw+OiMbNx8CzOyOM2p9cnZCmId5l6GrwNN0nTdCKSkjJGswoUX
 6Xp71YRnoOqQ54jQsDNcsQy6JasifyNY2add1XX3nXQv8tgcGWH4WJkXUVbW5RCyn3N7
 n8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iUnm89xPwtbKdupFnLnc0nvrW4vzj+N7K5y5SPZF9pc=;
 b=GoApwMsHp1u6qw75lK1tAWFHLRDD89NzAcqAWaqXdfifeaHpnC68aRtCMs3FJvV6zG
 CkNNJEzVMDiURG7+bZnhrvUA9czbBJT03FVkZQ008gDpGIGQq4spZwXnVpLhDzHRQ1lI
 ZzDu+KUHK0MU75LWZRTE/awesuI19H/hRqeNXDCo91tQYVMteKwcxR7LX2JNLXAqX+qz
 KwFUsTB8KgmjTDSLMmaYCU4RYkRdAPH8/gEPGt0BkAdPUf4hWxsnDAAr1/GwxDdpHUq/
 lB7mAJJisVPnWUKlpvh3x1LNliAXJfWJUKuWpYCJOROHLt7MlRXoNfxVxKokQ9eXZh4X
 my+w==
X-Gm-Message-State: AOAM533GogbXo72TajxffbJBEspDbFq5P9mmLJP7gWnAyXipBQ9iRJog
 uJ4OuCEGxRNIRkXLJgKa3HttHg==
X-Received: by 2002:aca:bad5:: with SMTP id k204mr553175oif.141.1601572078195; 
 Thu, 01 Oct 2020 10:07:58 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w25sm1334350oth.22.2020.10.01.10.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 10:07:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2] accel/tcg: Add tlb_flush_page_bits_by_mmuidx*
Date: Thu,  1 Oct 2020 12:07:51 -0500
Message-Id: <20201001170752.82063-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201001170752.82063-1-richard.henderson@linaro.org>
References: <20201001170752.82063-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Jordan Frank <jordanfrank@fb.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CFtWb4QlzRd0

On ARM, the Top Byte Ignore feature means that only 56 bits of
the address are significant in the virtual address.  We are
required to give the entire 64-bit address to FAR_ELx on fault,
which means that we do not "clean" the top byte early in TCG.

This new interface allows us to flush all 256 possible aliases
for a given page, currently missed by tlb_flush_page*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h |  36 ++++++
 accel/tcg/cputlb.c      | 259 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 286 insertions(+), 9 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 1fe28d574f..7b3b6bf57d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -251,6 +251,25 @@ void tlb_flush_by_mmuidx_all_cpus(CPUState *cpu, uint16_t idxmap);
  * depend on when the guests translation ends the TB.
  */
 void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu, uint16_t idxmap);
+
+/**
+ * tlb_flush_page_bits_by_mmuidx
+ * @cpu: CPU whose TLB should be flushed
+ * @addr: virtual address of page to be flushed
+ * @idxmap: bitmap of mmu indexes to flush
+ * @bits: number of significant bits in address
+ *
+ * Similar to tlb_flush_page_mask, but with a bitmap of indexes.
+ */
+void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                   uint16_t idxmap, unsigned bits);
+
+/* Similarly, with broadcast and syncing. */
+void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
+                                            uint16_t idxmap, unsigned bits);
+void tlb_flush_page_bits_by_mmuidx_all_cpus_synced
+    (CPUState *cpu, target_ulong addr, uint16_t idxmap, unsigned bits);
+
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
@@ -337,6 +356,23 @@ static inline void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                        uint16_t idxmap)
 {
 }
+static inline void tlb_flush_page_bits_by_mmuidx(CPUState *cpu,
+                                                 target_ulong addr,
+                                                 uint16_t idxmap,
+                                                 unsigned bits)
+{
+}
+static inline void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *cpu,
+                                                          target_ulong addr,
+                                                          uint16_t idxmap,
+                                                          unsigned bits)
+{
+}
+static inline void
+tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
+                                              uint16_t idxmap, unsigned bits)
+{
+}
 #endif
 /**
  * probe_access:
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index aaf8e46ae5..d74032a898 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -409,12 +409,21 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
     tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, ALL_MMUIDX_BITS);
 }
 
+static bool tlb_hit_page_mask_anyprot(CPUTLBEntry *tlb_entry,
+                                      target_ulong page, target_ulong mask)
+{
+    page &= mask;
+    mask &= TARGET_PAGE_MASK | TLB_INVALID_MASK;
+
+    return (page == (tlb_entry->addr_read & mask) ||
+            page == (tlb_addr_write(tlb_entry) & mask) ||
+            page == (tlb_entry->addr_code & mask));
+}
+
 static inline bool tlb_hit_page_anyprot(CPUTLBEntry *tlb_entry,
                                         target_ulong page)
 {
-    return tlb_hit_page(tlb_entry->addr_read, page) ||
-           tlb_hit_page(tlb_addr_write(tlb_entry), page) ||
-           tlb_hit_page(tlb_entry->addr_code, page);
+    return tlb_hit_page_mask_anyprot(tlb_entry, page, -1);
 }
 
 /**
@@ -427,31 +436,45 @@ static inline bool tlb_entry_is_empty(const CPUTLBEntry *te)
 }
 
 /* Called with tlb_c.lock held */
-static inline bool tlb_flush_entry_locked(CPUTLBEntry *tlb_entry,
-                                          target_ulong page)
+static bool tlb_flush_entry_mask_locked(CPUTLBEntry *tlb_entry,
+                                        target_ulong page,
+                                        target_ulong mask)
 {
-    if (tlb_hit_page_anyprot(tlb_entry, page)) {
+    if (tlb_hit_page_mask_anyprot(tlb_entry, page, mask)) {
         memset(tlb_entry, -1, sizeof(*tlb_entry));
         return true;
     }
     return false;
 }
 
+static inline bool tlb_flush_entry_locked(CPUTLBEntry *tlb_entry,
+                                          target_ulong page)
+{
+    return tlb_flush_entry_mask_locked(tlb_entry, page, -1);
+}
+
 /* Called with tlb_c.lock held */
-static inline void tlb_flush_vtlb_page_locked(CPUArchState *env, int mmu_idx,
-                                              target_ulong page)
+static void tlb_flush_vtlb_page_mask_locked(CPUArchState *env, int mmu_idx,
+                                            target_ulong page,
+                                            target_ulong mask)
 {
     CPUTLBDesc *d = &env_tlb(env)->d[mmu_idx];
     int k;
 
     assert_cpu_is_self(env_cpu(env));
     for (k = 0; k < CPU_VTLB_SIZE; k++) {
-        if (tlb_flush_entry_locked(&d->vtable[k], page)) {
+        if (tlb_flush_entry_mask_locked(&d->vtable[k], page, mask)) {
             tlb_n_used_entries_dec(env, mmu_idx);
         }
     }
 }
 
+static inline void tlb_flush_vtlb_page_locked(CPUArchState *env, int mmu_idx,
+                                              target_ulong page)
+{
+    tlb_flush_vtlb_page_mask_locked(env, mmu_idx, page, -1);
+}
+
 static void tlb_flush_page_locked(CPUArchState *env, int midx,
                                   target_ulong page)
 {
@@ -666,6 +689,224 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr)
     tlb_flush_page_by_mmuidx_all_cpus_synced(src, addr, ALL_MMUIDX_BITS);
 }
 
+static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
+                                       target_ulong page, unsigned bits)
+{
+    CPUTLBDesc *d = &env_tlb(env)->d[midx];
+    CPUTLBDescFast *f = &env_tlb(env)->f[midx];
+    target_ulong mask = MAKE_64BIT_MASK(0, bits);
+
+    /*
+     * If @bits is smaller than the tlb size, there may be multiple entries
+     * within the TLB; otherwise all addresses that match under @mask hit
+     * the same TLB entry.
+     *
+     * TODO: Perhaps allow bits to be a few bits less than the size.
+     * For now, just flush the entire TLB.
+     */
+    if (mask < f->mask) {
+        tlb_debug("forcing full flush midx %d ("
+                  TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
+                  midx, page, mask);
+        tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
+        return;
+    }
+
+    /* Check if we need to flush due to large pages.  */
+    if ((page & d->large_page_mask) == d->large_page_addr) {
+        tlb_debug("forcing full flush midx %d ("
+                  TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
+                  midx, d->large_page_addr, d->large_page_mask);
+        tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
+        return;
+    }
+
+    if (tlb_flush_entry_mask_locked(tlb_entry(env, midx, page), page, mask)) {
+        tlb_n_used_entries_dec(env, midx);
+    }
+    tlb_flush_vtlb_page_mask_locked(env, midx, page, mask);
+}
+
+static void tlb_flush_page_bits_by_mmuidx_async_0(CPUState *cpu,
+                                                  target_ulong addr,
+                                                  uint16_t idxmap,
+                                                  unsigned bits)
+{
+    CPUArchState *env = cpu->env_ptr;
+    int mmu_idx;
+
+    assert_cpu_is_self(cpu);
+
+    tlb_debug("page addr:" TARGET_FMT_lx "/%u mmu_map:0x%x\n",
+              addr, bits, idxmap);
+
+    qemu_spin_lock(&env_tlb(env)->c.lock);
+    for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
+        if ((idxmap >> mmu_idx) & 1) {
+            tlb_flush_page_bits_locked(env, mmu_idx, addr, bits);
+        }
+    }
+    qemu_spin_unlock(&env_tlb(env)->c.lock);
+
+    tb_flush_jmp_cache(cpu, addr);
+}
+
+static void tlb_flush_page_bits_by_mmuidx_async_1(CPUState *cpu,
+                                                  run_on_cpu_data data)
+{
+    target_ulong addr_map_bits = (target_ulong) data.target_ptr;
+    target_ulong addr = addr_map_bits & TARGET_PAGE_MASK;
+    uint16_t idxmap = (addr_map_bits & ~TARGET_PAGE_MASK) >> 6;
+    unsigned bits = addr_map_bits & 0x3f;
+
+    tlb_flush_page_bits_by_mmuidx_async_0(cpu, addr, idxmap, bits);
+}
+
+typedef struct {
+    target_ulong addr;
+    uint16_t idxmap;
+    uint16_t bits;
+} TLBFlushPageBitsByMMUIdxData;
+
+static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
+                                                  run_on_cpu_data data)
+{
+    TLBFlushPageBitsByMMUIdxData *d = data.host_ptr;
+
+    tlb_flush_page_bits_by_mmuidx_async_0(cpu, d->addr, d->idxmap, d->bits);
+    g_free(d);
+}
+
+void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                   uint16_t idxmap, unsigned bits)
+{
+    /* If all bits are significant, this devolves to tlb_flush_page. */
+    if (bits >= TARGET_LONG_BITS) {
+        tlb_flush_page_by_mmuidx(cpu, addr, idxmap);
+        return;
+    }
+    /* If no page bits are significant, this devolves to tlb_flush. */
+    if (bits < TARGET_PAGE_BITS) {
+        tlb_flush_by_mmuidx(cpu, idxmap);
+        return;
+    }
+
+    /* This should already be page aligned */
+    addr &= TARGET_PAGE_MASK;
+
+    if (qemu_cpu_is_self(cpu)) {
+        tlb_flush_page_bits_by_mmuidx_async_0(cpu, addr, idxmap, bits);
+    } else if (idxmap <= MAKE_64BIT_MASK(0, TARGET_PAGE_BITS - 6)) {
+        run_on_cpu_data data
+            = RUN_ON_CPU_TARGET_PTR(addr | (idxmap << 6) | bits);
+        async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_1, data);
+    } else {
+        TLBFlushPageBitsByMMUIdxData *d
+            = g_new(TLBFlushPageBitsByMMUIdxData, 1);
+
+        /* Otherwise allocate a structure, freed by the worker.  */
+        d->addr = addr;
+        d->idxmap = idxmap;
+        d->bits = bits;
+        async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+                         RUN_ON_CPU_HOST_PTR(d));
+    }
+}
+
+void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
+                                            target_ulong addr,
+                                            uint16_t idxmap,
+                                            unsigned bits)
+{
+    /* If all bits are significant, this devolves to tlb_flush_page. */
+    if (bits >= TARGET_LONG_BITS) {
+        tlb_flush_page_by_mmuidx_all_cpus(src_cpu, addr, idxmap);
+        return;
+    }
+    /* If no page bits are significant, this devolves to tlb_flush. */
+    if (bits < TARGET_PAGE_BITS) {
+        tlb_flush_by_mmuidx_all_cpus(src_cpu, idxmap);
+        return;
+    }
+
+    /* This should already be page aligned */
+    addr &= TARGET_PAGE_MASK;
+
+    if (idxmap <= MAKE_64BIT_MASK(0, TARGET_PAGE_BITS - 6)) {
+        run_on_cpu_data data
+            = RUN_ON_CPU_TARGET_PTR(addr | (idxmap << 6) | bits);
+        flush_all_helper(src_cpu, tlb_flush_page_bits_by_mmuidx_async_1, data);
+    } else {
+        CPUState *dst_cpu;
+        TLBFlushPageBitsByMMUIdxData *d;
+
+        /* Allocate a separate data block for each destination cpu.  */
+        CPU_FOREACH(dst_cpu) {
+            if (dst_cpu != src_cpu) {
+                d = g_new(TLBFlushPageBitsByMMUIdxData, 1);
+                d->addr = addr;
+                d->idxmap = idxmap;
+                d->bits = bits;
+                async_run_on_cpu(dst_cpu,
+                                 tlb_flush_page_bits_by_mmuidx_async_2,
+                                 RUN_ON_CPU_HOST_PTR(d));
+            }
+        }
+    }
+
+    tlb_flush_page_bits_by_mmuidx_async_0(src_cpu, addr, idxmap, bits);
+}
+
+void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                   target_ulong addr,
+                                                   uint16_t idxmap,
+                                                   unsigned bits)
+{
+    /* If all bits are significant, this devolves to tlb_flush_page. */
+    if (bits >= TARGET_LONG_BITS) {
+        tlb_flush_page_by_mmuidx_all_cpus_synced(src_cpu, addr, idxmap);
+        return;
+    }
+    /* If no page bits are significant, this devolves to tlb_flush. */
+    if (bits < TARGET_PAGE_BITS) {
+        tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, idxmap);
+        return;
+    }
+
+    /* This should already be page aligned */
+    addr &= TARGET_PAGE_MASK;
+
+    if (idxmap <= MAKE_64BIT_MASK(0, TARGET_PAGE_BITS - 6)) {
+        run_on_cpu_data data
+            = RUN_ON_CPU_TARGET_PTR(addr | (idxmap << 6) | bits);
+        flush_all_helper(src_cpu, tlb_flush_page_bits_by_mmuidx_async_1, data);
+        async_safe_run_on_cpu(src_cpu, tlb_flush_page_bits_by_mmuidx_async_1,
+                              data);
+    } else {
+        CPUState *dst_cpu;
+        TLBFlushPageBitsByMMUIdxData *d;
+
+        /* Allocate a separate data block for each destination cpu.  */
+        CPU_FOREACH(dst_cpu) {
+            if (dst_cpu != src_cpu) {
+                d = g_new(TLBFlushPageBitsByMMUIdxData, 1);
+                d->addr = addr;
+                d->idxmap = idxmap;
+                d->bits = bits;
+                async_run_on_cpu(dst_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+                                 RUN_ON_CPU_HOST_PTR(d));
+            }
+        }
+
+        d = g_new(TLBFlushPageBitsByMMUIdxData, 1);
+        d->addr = addr;
+        d->idxmap = idxmap;
+        d->bits = bits;
+        async_safe_run_on_cpu(src_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+                              RUN_ON_CPU_HOST_PTR(d));
+    }
+}
+
 /* update the TLBs so that writes to code in the virtual page 'addr'
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
-- 
2.25.1

