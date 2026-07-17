Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4524AC44516
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:26:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkrty-0001bJ-OF; Fri, 17 Jul 2026 19:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtt-0001Xl-IZ
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:25 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtr-0006zy-DC
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:25 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2ceed7018c8so32770365ad.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330602; x=1784935402; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lhhqC/hOwEz9oJ5MIevvbAiCo2J0aN9y+C175uWjrEg=;
 b=K14lUA2q0RzRzlCOUa8/TfpckDJkZ0PzCrkq7YzK/NIv0ABIbivtnwbBMhRmkKI9x7
 ghScR7fag77WOmnXhVKCwevKaY7Iq24ddzVjK2JOaj/xMHp2nVn+dZra2v9o1i5sv1Ow
 6B+ZX6vdZq5+ioi29W7szGmgEK6bI3HgoTepLGKhTAh/yZHbu0tpxVdHUw7t+K973/Eu
 UKGdhg5dhBfe8aj/6FFjkJttNaopqYTy7fkd6wuDOQJta9bvti7/FN7/221nk2KIzoS8
 gNwtW5iukcPVIaNqj1nKfzzJyNiwlB4v6Jm9KSLoWYq7ZDtwMrYO0Wx55UzLd4NqEGdn
 6lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330602; x=1784935402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lhhqC/hOwEz9oJ5MIevvbAiCo2J0aN9y+C175uWjrEg=;
 b=ElNVZwvzMkjsyB67Espcek94dV2DJxFAEOV4Rg298NBxfQey1HUnKySdQaQHvjSNF7
 pE8JNN6uiXGfwvKWMRd0LcJX4Boyn+bozNAGIdtV743w0tBBhHXBp4dwdOjj7A9UOUgD
 ziYu3kjVProf+O+W3+mb75D4mh2LtFJM8+2PIFiYnBTyLTwnpPd+EtvPCdgIE5pq3a93
 kNTeXgqnxvn2D3q3rdAiFl8HzGStniFN5J6CuzIZmpbnn3FHqmbGE0DoFxMTCxIkSZsV
 KNVr1L+mdya0b+61lit/cw4LGxSSf6+/jvnabUYLwFUSBYuauel4RMh+UlAFLEjWw3WU
 dD0Q==
X-Gm-Message-State: AOJu0YxeeDxpLYpSFE5GvyBVTU+v9Uw6LlwbfPEy8dYmQNZ18pTa3BXn
 p/+akJx95oKrrFQpsDntifA82kD/aOSqTpLF+/RFl6+pKEbTsnX/g5C5aAxPv/PwkMM=
X-Gm-Gg: AfdE7clgl9wy75tqx54dskEKeokCtcoJgA//+K6MnsM4M4x8lp66A0z7/g3UNdFJ4b5
 QHACs+dU4dLHmSQh37JE5W2l98rDSVeuqwUM1XPP/m0tR1uQ3anby16NPSRr+w7/MYHtK+uviMy
 A7a0JmqnofH42Jkge+oEKmTmqQ066vVHLY6JISHQkQ4CXZ5/G9LvXQhuo/9dqjMwuuhWK7LcTIC
 vARHJtLy/kzBS31rE77PAUxUkL5OpxDfMln7+z8WJcWEDjhLF+Cp0gecSgbx6bEIqMu93WdVOXv
 X0bRSFpiY6WL3Uqw/5RAEsNF2ANuPGrrkX6n2ofQ1CTWpLNpTDaWQJNGvUI5D+jzj2AtAjPSwUr
 VuOzV/yIVQqTEX1fATcNVPRhrYF2mGy2yCrW7dHtHN2nHMCnNWzJLqXpK8MuWKHXRWAxM/xPRgm
 QEv0Q6I7E=
X-Received: by 2002:a17:90b:534d:b0:37f:a915:1c29 with SMTP id
 98e67ed59e1d1-38e4b42ebd6mr4918785a91.19.1784330601769; 
 Fri, 17 Jul 2026 16:23:21 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/17] target/arm: Probe second page earlier in
 allocation_tag_mem_internal
Date: Fri, 17 Jul 2026 16:22:58 -0700
Message-ID: <20260717232306.378988-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Translation faults have priority over everything else in
this function.  We were failing to trap for the second page
entirely in the user-only case, and when tag access is disabled
on the first page for the system case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mte_helper.c | 64 +++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 28 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 6177dea842..6e1f701c4c 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -129,6 +129,13 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
             g_assert_not_reached();
         }
     }
+    if (atm_kind == ATM_NORMAL) {
+        int in_page = -(ptr | TARGET_PAGE_MASK);
+        if (unlikely(ptr_size > in_page)) {
+            probe_access(env, ptr + in_page, ptr_size - in_page,
+                         ptr_access, MMU_USER_IDX, ra);
+        }
+    }
 
     /* Require both MAP_ANON and PROT_MTE for the page. */
     if ((flags & PAGE_ANON) && (flags & PAGE_MTE)) {
@@ -147,6 +154,7 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
     MemoryRegion *mr;
     ARMASIdx tag_asi;
     AddressSpace *tag_as;
+    uint8_t pte_attrs;
 
     /*
      * Probe the first byte of the virtual address.  This raises an
@@ -160,9 +168,32 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
         assert(atm_kind == ATM_PROBE_PAGES);
         goto fini;
     }
+
+    /*
+     * Remember these across the second lookup below,
+     * which may invalidate this pointer via tlb resize.
+     */
+    ptr_paddr = full->phys_addr | (ptr & ~TARGET_PAGE_MASK);
+    pte_attrs = full->extra.arm.pte_attrs;
     ret.attrs = full->attrs;
 
-    switch (full->extra.arm.pte_attrs) {
+    /*
+     * The Normal memory access can extend to the next page.  E.g. a single
+     * 8-byte access to the last byte of a page will check only the last
+     * tag on the first page.
+     * Any page access exception has priority over tag check exception.
+     */
+    if (atm_kind == ATM_NORMAL) {
+        int in_page = -(ptr | TARGET_PAGE_MASK);
+        if (unlikely(ptr_size > in_page)) {
+            void *discard_mem;
+            ret.flags |= probe_access_full(env, ptr + in_page, 0, ptr_access,
+                                           ptr_mmu_idx, false,
+                                           &discard_mem, &full, ra);
+        }
+    }
+
+    switch (pte_attrs) {
     case 0xf0: /* Tagged */
         break;
 
@@ -181,33 +212,10 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
         goto fini;
     }
 
-    /*
-     * Remember this across the second lookup below,
-     * which may invalidate this pointer via tlb resize.
-     */
-    ptr_paddr = full->phys_addr | (ptr & ~TARGET_PAGE_MASK);
-
-    /*
-     * The Normal memory access can extend to the next page.  E.g. a single
-     * 8-byte access to the last byte of a page will check only the last
-     * tag on the first page.
-     * Any page access exception has priority over tag check exception.
-     */
-    if (atm_kind == ATM_NORMAL) {
-        int in_page = -(ptr | TARGET_PAGE_MASK);
-        if (unlikely(ptr_size > in_page)) {
-            void *discard_mem;
-            ret.flags |= probe_access_full(env, ptr + in_page, 0, ptr_access,
-                                           ptr_mmu_idx, false,
-                                           &discard_mem, &full, ra);
-        }
-
-        /* Any debug exception has priority over a tag check exception. */
-        if (unlikely(ret.flags & TLB_WATCHPOINT)) {
-            int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
-            cpu_check_watchpoint(env_cpu(env), ptr, ptr_size,
-                                 ret.attrs, wp, ra);
-        }
+    /* Any debug exception has priority over a tag check exception. */
+    if (unlikely(ret.flags & TLB_WATCHPOINT) && atm_kind == ATM_NORMAL) {
+        int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
+        cpu_check_watchpoint(env_cpu(env), ptr, ptr_size, ret.attrs, wp, ra);
     }
 
     /* Convert to the physical address in tag space.  */
-- 
2.43.0


