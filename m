Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2890704lfq;
        Mon, 14 Dec 2020 12:25:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+J7V5vaiklr9LhOHDJJcVps7j3uvgKNS6DS4IwWs0GATtn91mQi4vmNqVO2QzMlbM/jZ/
X-Received: by 2002:a25:e708:: with SMTP id e8mr39923328ybh.174.1607977541002;
        Mon, 14 Dec 2020 12:25:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607977540; cv=none;
        d=google.com; s=arc-20160816;
        b=fMe0j6mgXWH4Z2rsu9ZBmzYo4f1gu/Y76jRpxMbHuavd/bX69/IkNLQ/Q/95zsQv3E
         aRbc9Rc6mHXxaoriWcEkrfitWX1yU3ON4t0NAvANInWiMh+IsXOYQ0ZDC4KKx7Y4NUWH
         QSkKb4AnF9sv8de/b2zo7WIc+wq28y8i1F1eCljtUQ7cdHtI6OBWIPsspQnMhOdTfXXu
         R6+bndFqKThJqtGlI9qI/7KnFh7SxB9cyu41fITZ9n0elAp5y0ZDKuqfpgp+3KWtEOu3
         HE+uj8cTCKqNZXiTAeTMGyyGnoMPJ22k8/xgqTycziRqmhWIANw6krYUvvemf9lc1iq8
         XCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0/870XNH4HDaR8yVuCboXl+zTH18vO9+XdLVrm/RwSM=;
        b=g9FCDyWwNznhVu1nTLpmdTmvOUwZF8SUwa3O50TjQx+A2s35FbR0l5of/UhurndtAv
         gETDdUtWG0exWjxmjMGr1DHcNKnNBFlV9QuNM1Jl6xJJ0Vznf/hGQeEehzq9+Cl1/VkL
         3bxMasH3HVqlalvyZ2KwotqeOLp8qC4DIFVyyj/pLoq9A6OKoX+dbodSSwSsGeRBrdfb
         MAMkrOBav/3LFrMqThsd7lNnFEYkFW9qBuP/Styi3Gz5V9Xto1QePEKxf3SPaCZ5Gx8y
         bqjjcubYtPYFJPsRgEMqFTdBcdGz+FLgYCDjZbVj0ackFYATE+4B/wH0hOsvMeHQ/Thj
         DHdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=QhKPbDr+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si4513390ybi.210.2020.12.14.12.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 12:25:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=QhKPbDr+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kouPc-0002HS-AI
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 15:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kouNo-0000Xj-Kj
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:23:48 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kouNm-0006eQ-Ew
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:23:48 -0500
Received: by mail-pl1-x62e.google.com with SMTP id y8so9439719plp.8
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0/870XNH4HDaR8yVuCboXl+zTH18vO9+XdLVrm/RwSM=;
 b=QhKPbDr+fkSO/22Kui/6+i75nXTv3YHH9iZb2iUQRv3vm7/MmBMiUZav+DytQUFzaq
 Hs2LrVHbM4d+pK571QzdWGX6k0dGmaUNWcqjj39CPm3Z2ykdforvkxFGTpfDGgHdvfHE
 wA9drswXrYdU+j6gbI9xZnfuSAdIdCgEbBhBhIkEXTPFa51bngxF2iv+tIZ3lsJ++T3X
 Zp6BH6H8xRwp3RTbaXXLSRMdifKPoGIrfeqKqDejni9ioV8XVtmeuUCWpFJQmH9X3oJv
 5ZE8v+vVheA2+qWoSQNho0J6FSNyCXGEXyfwbPHxhDOZVBhatNSCDlbeV183bohXe/JO
 7Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0/870XNH4HDaR8yVuCboXl+zTH18vO9+XdLVrm/RwSM=;
 b=Lf6cJ2NkRk+kLzpHbxx5cEkhUzH3FCFuIgkc6/UmdkJl+67pttYlGuibaSaJx+o7P0
 MDsdtCZa6eOZKva+U5zzjP3l1GObOkio1a1qnxanXql+3cAUXcMuE01F6h0AoDb3iXOn
 dAIwTRcS0RWoUMHgZXHyApBhSIcuVQPV0eKyj2nUrmD8T9Isrpb7px/NRguyJN8Utdum
 N6+TAKxcRFmQOz81EIQKV9bV4ciozD7lwb6IXMMLyfs5c5jtmRNDzS0xFwTAOm3ephC/
 9IjWsAdoC1JphXCB1N5g67SQeRLRtj5r6z5MjxjtEpZKKcWVPN0jPvJ+9GwJuLKvZ+Wr
 uFJg==
X-Gm-Message-State: AOAM5338kIw0763RmSYvtseg3V/v2ZJr/0HrafGcYuLc3jh7zi/H7M/n
 ZA9jTCrQY5B+Q7lRn7iXOJpuxYb8+5ZqA0ntXLtlHELHdM0s9bWaW/CRR01oBsjZAvpjnV6O4Pl
 Erqg8RuTXu0jePWcLTEoqNom1B88k43Lx4o5+9AOvBJW2enSNsB9Ha1aDsiO1ygsaBS/+kMIOAw
 ==
X-Received: by 2002:a17:90a:74cd:: with SMTP id
 p13mr10058166pjl.25.1607977424521; 
 Mon, 14 Dec 2020 12:23:44 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a141sm20927524pfa.189.2020.12.14.12.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 12:23:43 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: add FEAT_TLBIRANGE support
Date: Mon, 14 Dec 2020 13:23:28 -0700
Message-Id: <20201214202329.26765-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214202329.26765-1-rebecca@nuviainc.com>
References: <20201214202329.26765-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=rebecca@nuviainc.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NTpY0AnLMfmi

ARMv8.4 adds the mandatory FEAT_TLBIRANGE, which provides instructions
for invalidating ranges of entries.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 accel/tcg/cputlb.c      |  24 ++
 include/exec/exec-all.h |  39 +++
 target/arm/helper.c     | 273 ++++++++++++++++++++
 3 files changed, 336 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 42ab79c1a582..103f363b42f3 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -603,6 +603,30 @@ void tlb_flush_page(CPUState *cpu, target_ulong addr)
     tlb_flush_page_by_mmuidx(cpu, addr, ALL_MMUIDX_BITS);
 }
 
+void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                    int num_pages, uint16_t idxmap)
+{
+    int i;
+
+    for (i = 0; i < num_pages; i++) {
+        tlb_flush_page_by_mmuidx(cpu, addr + (i * TARGET_PAGE_SIZE), idxmap);
+    }
+}
+
+void tlb_flush_page_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                    target_ulong addr,
+                                                    int num_pages,
+                                                    uint16_t idxmap)
+{
+    int i;
+
+    for (i = 0; i < num_pages; i++) {
+        tlb_flush_page_by_mmuidx_all_cpus_synced(src_cpu,
+                                                 addr + (i * TARGET_PAGE_SIZE),
+                                                 idxmap);
+    }
+}
+
 void tlb_flush_page_by_mmuidx_all_cpus(CPUState *src_cpu, target_ulong addr,
                                        uint16_t idxmap)
 {
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 94fe05daaa18..c379e2404443 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -220,6 +220,35 @@ void tlb_flush_page_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
  */
 void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
                                               uint16_t idxmap);
+/**
+ * tlb_flush_page_range_by_mmuidx:
+ * @cpu: CPU whose TLB should be flushed
+ * @addr: virtual address of start of page range to be flushed
+ * @num_pages: the number of pages to be flushed
+ * @idxmap: bitmap of MMU indexes to flush
+ *
+ * Flush a range of pages from the TLB of the specified CPU, for the specified
+ * MMU indexes.
+ */
+void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                    int num_pages, uint16_t idxmap);
+/**
+ * tlb_flush_page_range_by_mmuidx_all_cpus_synced:
+ * @cpu: Originating CPU of the flush
+ * @addr: virtual address of start of page range to be flushed
+ * @num_pages: the number of pages to be flushed
+ * @idxmap: bitmap of MMU indexes to flush
+ *
+ * Flush a range of pages from the TLB of all CPUs, for the specified MMU
+ * indexes like tlb_flush_page_by_mmuidx_all_cpus except the source
+ * vCPUs work is scheduled as safe work meaning all flushes will be
+ * complete once the source vCPUs safe work is complete. This will
+ * depend on when the guests translation ends the TB.
+ */
+void tlb_flush_page_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
+                                                    target_ulong addr,
+                                                    int num_pages,
+                                                    uint16_t idxmap);
 /**
  * tlb_flush_by_mmuidx:
  * @cpu: CPU whose TLB should be flushed
@@ -321,6 +350,16 @@ static inline void tlb_flush_page_all_cpus_synced(CPUState *src,
                                                   target_ulong addr)
 {
 }
+static void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                    int num_pages, int idxmap)
+{
+}
+static void tlb_flush_page_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                    target_ulong addr,
+                                                    int num_pages,
+                                                    uint16_t idxmap)
+{
+}
 static inline void tlb_flush(CPUState *cpu)
 {
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 28556eb48b44..fffac1e1efa9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4667,6 +4667,165 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                                   ARMMMUIdxBit_SE3, bits);
 }
 
+static int tlbi_aa64_range_get_num_pages(CPUARMState *env, uint64_t value,
+                                         uint64_t addr)
+{
+    uint64_t exponent;
+    uint64_t high_addr;
+    int page_size;
+    int page_shift;
+    uint64_t scale = (value >> 44) & 0x3;
+    uint64_t num = (value >> 39) & 0xF;
+    int page_size_granule = (value >> 46) & 0x3;
+
+    switch (page_size_granule) {
+    case 1:
+      page_size = 4096;
+      page_shift = 12;
+      break;
+    case 2:
+      page_size = 16384;
+      page_shift = 14;
+      break;
+    case 3:
+      page_size = 65536;
+      page_shift = 16;
+      break;
+    default:
+      qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
+                    page_size_granule);
+
+      raise_exception(env, EXCP_UDEF, syn_uncategorized(),
+                      exception_target_el(env));
+
+      break;
+    }
+
+    exponent = (5 * scale) + 1;
+    high_addr = addr + (((num + 1) << exponent) * page_size);
+
+    return (high_addr - addr) >> page_shift;
+}
+
+
+static void tlbi_aa64_rvae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL1&0.
+     * Currently handles all of RVAE1, RVAAE1, RVAALE1 and RVALE1,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages,
+                                                       mask);
+    } else {
+        tlb_flush_page_range_by_mmuidx(cs, addr, num_pages, mask);
+    }
+}
+
+static void tlbi_aa64_rvae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, Inner/Outer Shareable EL1&0.
+     * Currently handles all of RVAE1IS, RVAE1OS, RVAAE1IS, RVAAE1OS,
+     * RVAALE1IS, RVAALE1OS, RVALE1IS and RVALE1OS, since we don't support
+     * flush-for-specific-ASID-only, flush-last-level-only or inner/outer
+     * shareable specific flushes.
+     */
+    CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages, mask);
+}
+
+static void tlbi_aa64_rvae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL2.
+     * Currently handles all of RVAE2, RVAAE2, RVAALE2 and RVALE2,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    CPUState *cs = env_cpu(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages,
+                                                       ARMMMUIdxBit_E2);
+    } else {
+        tlb_flush_page_range_by_mmuidx(cs, addr, num_pages, ARMMMUIdxBit_E2);
+    }
+}
+
+static void tlbi_aa64_rvae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, Inner/Outer Shareable, EL2.
+     * Currently handles all of RVAE2IS, RVAE2OS, RVAAE2IS, RVAAE2OS,
+     * RVAALE2IS, RVAALE2OS, RVALE2IS and RVALE2OS, since we don't support
+     * flush-for-specific-ASID-only, flush-last-level-only or inner/outer
+     * shareable specific flushes.
+     */
+    CPUState *cs = env_cpu(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages,
+                                                   ARMMMUIdxBit_E2);
+}
+
+static void tlbi_aa64_rvae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL3.
+     * Currently handles all of RVAE3, RVAAE3, RVAALE3 and RVALE3,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    CPUState *cs = env_cpu(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages,
+                                                       ARMMMUIdxBit_SE3);
+    } else {
+        tlb_flush_page_range_by_mmuidx(cs, addr, num_pages, ARMMMUIdxBit_SE3);
+    }
+}
+
+static void tlbi_aa64_rvae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL3, Inner/Outer Shareable.
+     * Currently handles all of RVAE3IS, RVAE3OS, RVAAE3IS, RVAAE3OS,
+     * RVAALE3IS, RVAALE3OS, RVALE3IS, and RVALE3OS, since we don't support
+     * flush-for-specific-ASID-only, flush-last-level-only or inner/outer
+     * specific flushes.
+     */
+    CPUState *cs = env_cpu(env);
+    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
+    int num_pages = tlbi_aa64_range_get_num_pages(env, value, addr);
+
+    tlb_flush_page_range_by_mmuidx_all_cpus_synced(cs, addr, num_pages,
+                                                   ARMMMUIdxBit_SE3);
+}
+
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                       bool isread)
 {
@@ -4938,6 +5097,63 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "TLBI_IPAS2LE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2E1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 2,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2E1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 2,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 3,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RVAAE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 3,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+    { .name = "TLBI_RVAAE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 3,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAAE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 3,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+    { .name = "TLBI_RVAE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 1,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAE2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 1,
+      .access = PL2_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2_write },
+    { .name = "TLBI_RVAE2IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 1,
+      .access = PL2_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+   { .name = "TLBI_RVAE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL2_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+   { .name = "TLBI_RVAE3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 6, .opc2 = 1,
+      .access = PL3_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3_write },
+   { .name = "TLBI_RVAE3IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 1,
+      .access = PL3_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+   { .name = "TLBI_RVAE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL3_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
     { .name = "TLBI_ALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
@@ -5046,6 +5262,63 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "TLBIIPAS2LIS",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL2_W },
+    { .name = "TLBI_RIPAS2LE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2LE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 7,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RVAALE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 7,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+    { .name = "TLBI_RVAALE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 7,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAALE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 7,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+   { .name = "TLBI_RVALE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 5,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+   { .name = "TLBI_RVALE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 5,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+   { .name = "TLBI_RVALE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 5,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+   { .name = "TLBI_RVALE2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2_write },
+   { .name = "TLBI_RVALE2IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+   { .name = "TLBI_RVALE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+   { .name = "TLBI_RVALE3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 6, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3_write },
+   { .name = "TLBI_RVALE3IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+   { .name = "TLBI_RVALE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 5, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
     /* 32 bit cache operations */
     { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
-- 
2.26.2

