Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D563AC5CFC1
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 20:39:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvL8j-0008HN-J9; Sat, 15 Aug 2026 16:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8f-0008Bd-RU
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:57 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008JB-Fn
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:57 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2d530328efbso15258045ad.0
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826268; x=1787431068; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Zk4qMQYX28j97m/g2YYmzDXr2lMBSgsykgiPV83NOik=;
 b=mH3kNAvpGqGmXxeYUOQITd01LHGip8KIoNUsqx/F5OMkQVqD6JXhH7UDM4Q6hrWdMT
 XkHxogjnt4odaft2J57YH4hJRUvaaHg6CopBHh6evmb5Hg/NTqQqJsMJZFKl9ZrLJENz
 Ba/fWPweZa7XYeJvklJ3LPjf8E7wrSg7JaXizWShWv52+MeJiGb2OjWyY/DuNZRrfOnL
 UhTtzcctOELfMF0MBxxZrHkcdAZiC4vZJSid9Lf2KQ0Y0jo6E1i9eYHHouiGsUdBgcek
 GgrMnkk6XRuUfLLOmypBZltuYuaN6fO7PIIUPm2QWzSG5CAHF1rOf7zPPO0mTLQOOGxv
 yaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826268; x=1787431068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Zk4qMQYX28j97m/g2YYmzDXr2lMBSgsykgiPV83NOik=;
 b=P93RTab5345UyF7wVdcL5hzOWWpj6XaKsoWFr2nw9bvb0tqU8oTTHipco5MbX+pbWh
 mKVaOdYzt/cutkwBXV1Nt3xjsPSFtotsYUA4wiN77e58T5Akhu4YzdcXg4vSwayIQi0N
 I3/bgzckBujaUhSRHdWrxKFQ6X5jFrqx8n3MeVBrJm+64ss53HXWKbPT9h2z13asGaVg
 5aU1JEZYGOb/Ta7qAIk+411Lo9MbCQhBej1GMdfiiX6USxqThyws1a4y5LLNgElFwIPn
 wUhsv43L4uGaxjkrYVtz2THAbTa+A9PmQ2eheFVRFLRku5Vqh/P1Xh0SfTVQbhzbNozA
 HKVA==
X-Gm-Message-State: AOJu0YzBatYgWUULtdsfgweJK49cRmn4QOn6fYTbtLbA3X7CWJ3EfNTP
 lOQ7ht17bW4kneRzrZxTG13BBS0Dy5Xphhbk/a9hf1hgv9wZ/7SqeqJ+iAxRF3VwGIY=
X-Gm-Gg: AR+sD11xmVAfLRqZSMoz9ij5WYEz5H14gCGdNnjSkQWhC0t4sr2i72VVbR55leq/Bis
 kRq/p709PDQrvvVwXVCzQGl1Ygt+mDNcTyc3K6sK9NE+EPZj82VIVeYfmuk6ZGN65GWfSY+q6kD
 ksdhYjw/xGXbcVS3YUkcwl6bMIZ506coDHES2TX3lEz/Ty+DwTvB94OktcOmsNCxIr0wSQ2KpsS
 CmJEkgEtwRerBowe2UXhiVHfxHe/9BT7rycEe5GeiKqvH/SauMeY6oT9FMZhi6xmA7k56oVis/z
 ccXstSlqUkIV17h6M2Rl+bFQJr6HLx2Zcl8FJHmpgP1BigahzvL/N9SiI0NoS0gnqaBQVeONAup
 SJTQOX71ht7eMqHJ2MbhN0oyjF9t8TEPooVAzzqLpfAdXGSu7uwo9KjUDyZlFPvyxQp0Y1yfWF7
 iWFX9PyirhILeOhE2A8GfAIjxiE0UthcI2OkqO5SLEped83X1oYBzjWdPdhfx5tjQ6I19vx1WIU
 SPvp0T+Qb/nqA6HVo+o
X-Received: by 2002:a17:90b:2781:b0:38f:aab1:5148 with SMTP id
 98e67ed59e1d1-3933b87a55cmr17424460a91.13.1786826268066; 
 Sat, 15 Aug 2026 13:37:48 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 11/18] accel/tcg: Replace size with first/last in
 tlb_fill_align
Date: Sat, 15 Aug 2026 13:37:23 -0700
Message-ID: <20260815203730.1468365-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Propagate the API change down one step further within cputlb.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b8c23b2948..95db2c22e2 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1236,11 +1236,12 @@ static inline bool tlb_hit(uint64_t tlb_addr, vaddr addr)
  * (e.g. CPUTLBEntry pointers) must be discarded and looked up again
  * (e.g. via tlb_entry()).
  */
-static bool tlb_fill_align(CPUState *cpu, vaddr addr, MMUAccessType type,
-                           int mmu_idx, MemOp memop, int size,
+static bool tlb_fill_align(CPUState *cpu, vaddr addr, vaddr first, vaddr last,
+                           MMUAccessType type, int mmu_idx, MemOp memop,
                            bool probe, uintptr_t ra)
 {
     const TCGCPUOps *ops = cpu->cc->tcg_ops;
+    int size = last - addr + 1;
     CPUTLBEntryFull full;
 
     if (ops->tlb_fill_align) {
@@ -1374,8 +1375,8 @@ static int probe_access_internal(CPUState *cpu, vaddr addr, vaddr first,
 
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type, page_addr)) {
-            if (!tlb_fill_align(cpu, addr, access_type, mmu_idx,
-                                0, last - addr + 1, nonfault, retaddr)) {
+            if (!tlb_fill_align(cpu, addr, first, last, access_type,
+                                mmu_idx, MO_UNALN, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
                 *pfull = NULL;
@@ -1664,8 +1665,8 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data, MemOp memop,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
-            tlb_fill_align(cpu, addr, access_type, mmu_idx,
-                           memop, data->size, false, ra);
+            tlb_fill_align(cpu, addr, addr, addr + data->size - 1,
+                           access_type, mmu_idx, memop, false, ra);
             maybe_resized = true;
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
@@ -1833,8 +1834,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
                             addr & TARGET_PAGE_MASK)) {
-            tlb_fill_align(cpu, addr, MMU_DATA_STORE, mmu_idx,
-                           mop, size, false, retaddr);
+            tlb_fill_align(cpu, addr, addr, addr + size - 1,
+                           MMU_DATA_STORE, mmu_idx, mop, false, retaddr);
             did_tlb_fill = true;
             index = tlb_index(cpu, mmu_idx, addr);
             tlbe = tlb_entry(cpu, mmu_idx, addr);
@@ -1849,8 +1850,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * but addr_read will only be -1 if PAGE_READ was unset.
      */
     if (unlikely(tlbe->addr_read == -1)) {
-        tlb_fill_align(cpu, addr, MMU_DATA_LOAD, mmu_idx,
-                       0, size, false, retaddr);
+        tlb_fill_align(cpu, addr, addr, addr + size - 1,
+                       MMU_DATA_LOAD, mmu_idx, 0, false, retaddr);
         /*
          * Since we don't support reads and writes to different
          * addresses, and we do have the proper page loaded for
-- 
2.43.0


