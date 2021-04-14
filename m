Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp6180753lfr;
        Wed, 14 Apr 2021 13:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8eBr1jZz3kBKC9DG3wjMNggIeAnwuL8jcruluFkRI9hhQPSyol31aqkVPAJB//TMXC/Nh
X-Received: by 2002:a05:6e02:d41:: with SMTP id h1mr86561ilj.0.1618432632941;
        Wed, 14 Apr 2021 13:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618432632; cv=none;
        d=google.com; s=arc-20160816;
        b=lpdubUVG8IMoEKoVef4Pw27JFUT3DhEBn2AnNwXmCwWjf0zgv0nu10oRNpcQRKstUK
         QUT/WayM+Hn/z2QUcI7ku8i2vVnDPqziZ6105tpwCHlXE1xBWniy7TEfEGEhMapk2CCO
         wo7vqzbBy7SotagHuAnEsXZ62nu23tUIFmjODxbj3K95UWUbkpkQPWUrscO6czP49gjz
         owvPDxOlp9UNUIh6BLMmyE0Jzmg2NU0Yd/eGEDQQvaANHNFrHhPQ+IKZ8txK4vHKpSpV
         WD/glFROgaUK7XJjbfp9j6mwyqTBN8M7rVJCAyRHyjTiSy6i8kG7wd3PAwsfZMKbyeqE
         XUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zwZq+t97SgnMqyfF6b0pI8SyhVaDvItExYxxm1cmwZM=;
        b=APiovGJqPSynPbK79TLgKEh71f0bC8O0rhg7WtTSNfliIAP3Dq7JrBWszRh1WYONbe
         CsKJTcw1f4fzcbYtKnpod5fFbIUDnUBIxxfxVN3Efq+0yfGUlxRqpAuIQTqF9CHg2lAG
         IC2f7IEa/5c0vEm0bePUynd0d46tndAjnnMyZxfxFtb44cH/vgpl4tQkRXhsxhuHhyAy
         /UELqFNdrR/QJu5ej5lomBHcOpQX7zkjLDDFWAA3NJ2K/rC9cdZxh3Uvmg28G2iWYlX9
         tt/S850RZ9iw2AHvsNWErOK+hS53wJkMfwbaWYX9FKk//Uy0ewPzzFoOT0yig+n5V1zn
         DufA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=OXo+LnHe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si492453jai.115.2021.04.14.13.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Apr 2021 13:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=OXo+LnHe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWmG8-0007ys-2v
	for alex.bennee@linaro.org; Wed, 14 Apr 2021 16:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBm-0005C2-97
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:32:42 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:35530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBk-0004nQ-5p
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:32:42 -0400
Received: by mail-qk1-x731.google.com with SMTP id h13so4244879qka.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 13:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwZq+t97SgnMqyfF6b0pI8SyhVaDvItExYxxm1cmwZM=;
 b=OXo+LnHegWzJyl9gupSa7keh65b4j5odHr94EMmpKdtAv6P6rttqcfb5Sh2U0MYK98
 fZ59+q1JqI4tkL+dEEWXPRTyB36jaZqYmiLAmKY7Yv+psaFQEcJCisB1Z7Z5d60dfYqj
 pvd6TaHVk0Amo1Qkcot3yfu9safE7taDsy3dL3nyp7u2DIe8FdShyuqa3cfO3ne3UXgZ
 u7cfusz3hzlREQHO7TeVgJsE/6B7dHieMW1NRPl6hu1C94+NeHy4Sw6gQv7l6TM2kvBf
 5n9k+sT4t79KhGun+5k/gtkwA3Yd19STxxBXYFlmMvoy+8f5hzas8Au+IBPbCFDrVTBu
 g14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwZq+t97SgnMqyfF6b0pI8SyhVaDvItExYxxm1cmwZM=;
 b=RgKvF633unu3Ff9SbuehsG1KZ8SgYAmISEi1J+jTCavbShAEJMPSy1oIpW/N0i5Aze
 /RRfPiZIFHH78V4nSiRBMW9uvvTPLevefegusV8bLmNrDY2uhcEJmPAB5F0xWCCzIqt9
 GSe9v8qav5y2pB6Oqr80xLpQbPnHf9tUI5K9lub/G4MztvCGYN69mZ2npgMIQTvUiAOo
 FCQ0I064jE2lbt1zk2E7WwMr2YhLyf1SWm2H3QAt+q9ky6HkIRBbIr6bfIhSCTJxZqlA
 Qoft6gqseirEK2enslwMkdeV3IX6mH9EdqUHFSQLIyxO2a6KsjgwuOMrw+aPfmkCBEfQ
 EGhw==
X-Gm-Message-State: AOAM533RK8CN0X5Pr1rl+tvOuMDknIaogIuZLGzWzgFAmUep5cO3LsDY
 JrCVDU49XAG6uw7oqJ7sA4VeMQ==
X-Received: by 2002:a37:4389:: with SMTP id q131mr142018qka.255.1618432359328; 
 Wed, 14 Apr 2021 13:32:39 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id q3sm304692qtw.40.2021.04.14.13.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 13:32:38 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v7 1/4] accel/tcg: Add TLB invalidation support for ranges of
 addresses
Date: Wed, 14 Apr 2021 14:32:28 -0600
Message-Id: <20210414203231.824-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210414203231.824-1-rebecca@nuviainc.com>
References: <20210414203231.824-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LYyASkgIfT/K

Add functions to support the FEAT_TLBIRANGE ARMv8.4 feature that adds
TLB invalidation instructions to invalidate ranges of addresses.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 accel/tcg/cputlb.c      | 130 +++++++++++++++++++-
 include/exec/exec-all.h |  46 +++++++
 2 files changed, 173 insertions(+), 3 deletions(-)

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
index 6b036cae8f65..a7ff35efb865 100644
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
@@ -313,6 +344,21 @@ static inline void tlb_flush_page_all_cpus_synced(CPUState *src,
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
+static inline void
+tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                    target_ulong addr,
+                                                    target_ulong length,
+                                                    uint16_t idxmap,
+                                                    unsigned bits)
+{
+}
 static inline void tlb_flush(CPUState *cpu)
 {
 }
-- 
2.26.2

