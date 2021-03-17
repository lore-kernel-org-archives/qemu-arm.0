Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp855268lfg;
        Wed, 17 Mar 2021 16:33:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdInw4xgDN9q1RlnGG63khYdLZXRTKpRnff9HVc7ZZHVVwHhkatJBjagVOtiuVhwd1/GYJ
X-Received: by 2002:a05:6902:1009:: with SMTP id w9mr7078520ybt.199.1616024008269;
        Wed, 17 Mar 2021 16:33:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616024008; cv=none;
        d=google.com; s=arc-20160816;
        b=Nli/Keb/jDVl53nmzotrxUMBR3KxBiXw7JJ15g1tuSkyDjRuTx1bkn9FHMj78PdwXO
         ZCN4Wl8gobwgS9zQA+v7MJBGKQvWqrxOiddT+c8rC/wvWHQIfziU2o0EbV6b4b/It+7D
         k8glHyXNNUcaOoIdl/QzWoAUCssoycai/aTNjZgMIgaGKpp/N3GZgDAeFIwIpb2B0G3I
         p/0LRL2E20VQpptIviUnBLeZ3zRgfyCxS4EyymemSZ/lBwGUX+9un+m7XI3OIFbyOD4S
         puthl/GThwNfEeWFnRgwNEk7ewQI6BaHG+/2MO2UqWUgErOyPuhDVYv/wJcWLqjdTOgP
         UkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dxBnR0GWozhCbPZ5SDTZ2WfHl4olEKROy08nwxW9Pd4=;
        b=N7QDhxqdileZfYfYVhJdrCOVO1CPUZKY32trvFNs5RZdKOjmylSL8GBkIRqjZxs242
         ItU4L67bXZGtwci3Rpad+a32qzGCeG5khv1wDLwqLDy2eP4+59VOJowCkyxq/ixf3MY7
         GzEsssIg1yu3UiJtbJ0XwBwyoScUF3SCgpieWNSRX7daM4Dj7ybtoc242jPFSwjNeC83
         4lw273wRGCx/roij/rweVv90NzzgCmzZMHSMaAy6EeLRvK3deTmqXyYlP66FR1SY7NxR
         iWJulNKrdzxyy70DBlimPDmaDV04Z0rZGhWKANgPk6HPpZqVjwuHcdeZ6Izl+5JSmfpP
         wQgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="m/gvl/n4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d203si468309ybh.272.2021.03.17.16.33.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 16:33:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="m/gvl/n4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMffL-0004Ij-Im
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 19:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff4-0004IR-Rx
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 19:33:10 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:41961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff2-0001rh-SI
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 19:33:10 -0400
Received: by mail-io1-xd35.google.com with SMTP id z3so377104ioc.8
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 16:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dxBnR0GWozhCbPZ5SDTZ2WfHl4olEKROy08nwxW9Pd4=;
 b=m/gvl/n4+oCiGTa0Kc85BmDDZVBVfcdX2V57+vHiaxOo/8QgNorLIu+o9oHFEZYW2m
 hJU6kkQfxeoIDEzur4y2pIgwfkM1KDhkr+qu5BBE6EqApdf1EKKmiQtEIQ+QURD6e8Fl
 1MjeKetu/msc6AOo1JflqRWP7gf7DNnFqeceRAyfnYVzOe23Ecn1LJsV7Nbr+gDbkFjv
 dm+TpLvwcZeAXsRr2XLOEHwiC37qgR/EojYmKYhdphTbGLAT5dJkJO4rTb9l7FCsPWGN
 B39dNyssNW2M+WZBSmsPDN+GdWic3WIKJpqoWS/oAM09/Au0iYsFmkoZRSEelQEi6uEC
 ZMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dxBnR0GWozhCbPZ5SDTZ2WfHl4olEKROy08nwxW9Pd4=;
 b=TTj7wMygPIKCmfB71cHHYDFW0HWQLAc6kTjMikoi9lCgya5/Lwf/laOQApYK65TiNV
 Ieeml2ZqmnHKHth9Sj+ULV/rXOOdPXZaI/oM/toXsB9qaNua8uaqeExVdAxpN6dAFV8D
 2CqRtPV5zJT8kaTrXvJcgdije8QGwI14bdZmd76M10kjC1CTnI8ZEy5JFmuJNFJQ5p31
 8YRckBgXpGl4ZqiKp865KuXTSYxPAfsqyzUi4drgElgqoKVTcMxS6BMBsQJxRA+QEHNT
 fJ1SjzdzGjFFJfMFWdaukyBOlBDrqLvyjZy5HHzsyxnIlrKubmxZYTV0enUZ5vFj6Z8O
 ac0w==
X-Gm-Message-State: AOAM532a6XtNgti1Ec9hooUoA00i36p3c8DNRwEJN5/0Cib3V/kirJdT
 ABf/x9IrzLfKbKpzsebVJ9snCr1wEqTfsA==
X-Received: by 2002:a02:c50f:: with SMTP id s15mr4695911jam.133.1616023987905; 
 Wed, 17 Mar 2021 16:33:07 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k12sm235183ios.2.2021.03.17.16.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 16:33:07 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v5 1/4] accel/tcg: Add TLB invalidation support for ranges of
 addresses
Date: Wed, 17 Mar 2021 17:32:58 -0600
Message-Id: <20210317233301.4130-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210317233301.4130-1-rebecca@nuviainc.com>
References: <20210317233301.4130-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YwQGeTP9ZwZ0

Add functions to support the FEAT_TLBIRANGE ARMv8.4 feature that adds
TLB invalidation instructions to invalidate ranges of addresses.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 accel/tcg/cputlb.c      | 130 +++++++++++++++++++-
 include/exec/exec-all.h |  45 +++++++
 2 files changed, 172 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8a7b779270a4..dc44967dcf8e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -709,7 +709,7 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr)
     tlb_flush_page_by_mmuidx_all_cpus_synced(src, addr, ALL_MMUIDX_BITS);
 }
 
-static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
+static bool tlb_flush_page_bits_locked(CPUArchState *env, int midx,
                                        target_ulong page, unsigned bits)
 {
     CPUTLBDesc *d = &env_tlb(env)->d[midx];
@@ -729,7 +729,7 @@ static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
                   TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
                   midx, page, mask);
         tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
-        return;
+        return true;
     }
 
     /* Check if we need to flush due to large pages.  */
@@ -738,13 +738,14 @@ static void tlb_flush_page_bits_locked(CPUArchState *env, int midx,
                   TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
                   midx, d->large_page_addr, d->large_page_mask);
         tlb_flush_one_mmuidx_locked(env, midx, get_clock_realtime());
-        return;
+        return true;
     }
 
     if (tlb_flush_entry_mask_locked(tlb_entry(env, midx, page), page, mask)) {
         tlb_n_used_entries_dec(env, midx);
     }
     tlb_flush_vtlb_page_mask_locked(env, midx, page, mask);
+    return false;
 }
 
 typedef struct {
@@ -943,6 +944,129 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     }
 }
 
+typedef struct {
+    target_ulong addr;
+    target_ulong length;
+    uint16_t idxmap;
+    uint16_t bits;
+}  TLBFlushPageRangeBitsByMMUIdxData;
+
+static void
+tlb_flush_page_range_bits_by_mmuidx_async_0(CPUState *cpu,
+                                            target_ulong addr,
+                                            target_ulong length,
+                                            uint16_t idxmap,
+                                            unsigned bits)
+{
+    CPUArchState *env = cpu->env_ptr;
+    int mmu_idx;
+    target_ulong l;
+    target_ulong page = addr;
+    bool full_flush;
+
+    assert_cpu_is_self(cpu);
+
+    tlb_debug("page addr:" TARGET_FMT_lx "/%u len: " TARGET_FMT_lx
+              " mmu_map:0x%x\n",
+              addr, bits, length, idxmap);
+
+    qemu_spin_lock(&env_tlb(env)->c.lock);
+    for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
+        if ((idxmap >> mmu_idx) & 1) {
+            for (l = 0; l < length; l += TARGET_PAGE_SIZE) {
+                page = addr + l;
+                full_flush = tlb_flush_page_bits_locked(env, mmu_idx,
+                                                        page, bits);
+                if (full_flush) {
+                    break;
+                }
+            }
+        }
+    }
+    qemu_spin_unlock(&env_tlb(env)->c.lock);
+
+    for (l = 0; l < length; l += TARGET_PAGE_SIZE) {
+        tb_flush_jmp_cache(cpu, page);
+    }
+}
+
+static void
+tlb_flush_page_range_bits_by_mmuidx_async_1(CPUState *cpu,
+                                            run_on_cpu_data data)
+{
+    TLBFlushPageRangeBitsByMMUIdxData *d = data.host_ptr;
+
+    tlb_flush_page_range_bits_by_mmuidx_async_0(cpu, d->addr, d->length,
+                                                d->idxmap, d->bits);
+
+    g_free(d);
+}
+
+void tlb_flush_page_range_bits_by_mmuidx(CPUState *cpu,
+                                         target_ulong addr,
+                                         target_ulong length,
+                                         uint16_t idxmap,
+                                         unsigned bits)
+{
+    TLBFlushPageRangeBitsByMMUIdxData d;
+    TLBFlushPageRangeBitsByMMUIdxData *p;
+
+    /* This should already be page aligned */
+    addr &= TARGET_PAGE_BITS;
+
+    d.addr = addr & TARGET_PAGE_MASK;
+    d.idxmap = idxmap;
+    d.bits = bits;
+    d.length = length;
+
+    if (qemu_cpu_is_self(cpu)) {
+        tlb_flush_page_range_bits_by_mmuidx_async_0(cpu, addr, length,
+                                                    idxmap, bits);
+    } else {
+        p = g_new(TLBFlushPageRangeBitsByMMUIdxData, 1);
+
+        /* Allocate a structure, freed by the worker.  */
+        *p = d;
+        async_run_on_cpu(cpu, tlb_flush_page_range_bits_by_mmuidx_async_1,
+                         RUN_ON_CPU_HOST_PTR(p));
+    }
+}
+
+void tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                         target_ulong addr,
+                                                         target_ulong length,
+                                                         uint16_t idxmap,
+                                                         unsigned bits)
+{
+    TLBFlushPageRangeBitsByMMUIdxData d;
+    TLBFlushPageRangeBitsByMMUIdxData *p;
+    CPUState *dst_cpu;
+
+    /* This should already be page aligned */
+    addr &= TARGET_PAGE_BITS;
+
+    d.addr = addr;
+    d.idxmap = idxmap;
+    d.bits = bits;
+    d.length = length;
+
+    /* Allocate a separate data block for each destination cpu.  */
+    CPU_FOREACH(dst_cpu) {
+        if (dst_cpu != src_cpu) {
+            p = g_new(TLBFlushPageRangeBitsByMMUIdxData, 1);
+            *p = d;
+            async_run_on_cpu(dst_cpu,
+                             tlb_flush_page_range_bits_by_mmuidx_async_1,
+                             RUN_ON_CPU_HOST_PTR(p));
+        }
+    }
+
+    p = g_new(TLBFlushPageRangeBitsByMMUIdxData, 1);
+    *p = d;
+    async_safe_run_on_cpu(src_cpu, tlb_flush_page_range_bits_by_mmuidx_async_1,
+                          RUN_ON_CPU_HOST_PTR(p));
+}
+
 /* update the TLBs so that writes to code in the virtual page 'addr'
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6b036cae8f65..833e8d654a1c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -212,6 +212,37 @@ void tlb_flush_page_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
  */
 void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
                                               uint16_t idxmap);
+/**
+ * tlb_flush_page_range_by_mmuidx:
+ * @cpu: CPU whose TLB should be flushed
+ * @addr: virtual address of start of page range to be flushed
+ * @length: the number of bytes to be flushed
+ * @idxmap: bitmap of MMU indexes to flush
+ *
+ * Flush a range of pages from the TLB of the specified CPU, for the specified
+ * MMU indexes.
+ */
+void tlb_flush_page_range_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                         target_ulong length, uint16_t idxmap,
+                                         unsigned bits);
+/**
+ * tlb_flush_page_range_by_mmuidx_all_cpus_synced:
+ * @cpu: Originating CPU of the flush
+ * @addr: virtual address of start of page range to be flushed
+ * @length: the number of bytes to be flushed
+ * @idxmap: bitmap of MMU indexes to flush
+ *
+ * Flush a range of pages from the TLB of all CPUs, for the specified MMU
+ * indexes like tlb_flush_page_by_mmuidx_all_cpus except the source
+ * vCPUs work is scheduled as safe work meaning all flushes will be
+ * complete once the source vCPUs safe work is complete. This will
+ * depend on when the guests translation ends the TB.
+ */
+void tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(CPUState *cpu,
+                                                         target_ulong addr,
+                                                         target_ulong length,
+                                                         uint16_t idxmap,
+                                                         unsigned bits);
 /**
  * tlb_flush_by_mmuidx:
  * @cpu: CPU whose TLB should be flushed
@@ -313,6 +344,20 @@ static inline void tlb_flush_page_all_cpus_synced(CPUState *src,
                                                   target_ulong addr)
 {
 }
+static inline void tlb_flush_page_range_bits_by_mmuidx(CPUState *cpu,
+                                                       target_ulong addr,
+                                                       target_ulong length,
+                                                       uint16_t idxmap,
+                                                       unsigned bits)
+{
+}
+static inline void tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                                       target_ulong addr,
+                                                                       target_ulong length,
+                                                                       uint16_t idxmap,
+                                                                       unsigned bits)
+{
+}
 static inline void tlb_flush(CPUState *cpu)
 {
 }
-- 
2.26.2

