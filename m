Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EBCC44516
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:25:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkrtt-0001Xo-Jz; Fri, 17 Jul 2026 19:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrts-0001Wp-8A
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:24 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrto-0006zJ-S8
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:23 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-38101f85591so1572438a91.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330599; x=1784935399; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/HU9UyOqGkjqTpc/QpkyDLeK41rIzSxxgyQ7DWIvTQ8=;
 b=eoWX/RwFqZbvfo3rQfiLmrNqC6k+yIzEEyXztUW7O8nE59+G3Clz3UZuLZDW+YbSJp
 bfkY5rgYk/kR+wM9LSMTa7dSv/XWCxTAGnP7flFl7quNbwI98PVtBPsKVcJ4j3j3DlWc
 1OFVQmBkvj9WFHQ7aiAlFBkyqxopqem8SJPDt2qOlfJfiDqiQ11t6+yu7tEMoygYbEeh
 lO164bl3zPf/aG5fDfN/ovapsmG5CVXaT9mOlxehlxQL2NSzScOSgxsF5OGJtxoA5LR2
 Ml7rPBiP+i92bVYSGSIfzUgFtNkpa3Vjp3z8pEdHaXFlteEBXszECnDP6YOXs0Lqfmj5
 q1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330599; x=1784935399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/HU9UyOqGkjqTpc/QpkyDLeK41rIzSxxgyQ7DWIvTQ8=;
 b=E2kfEc8xlTmFPFjdMVdczIHCQE50PZzZ9GheK5yG8KGHgHPRGPHclDmdoTX1sCx3/T
 2KSshylZo4j2t8xFYtqeG8XTXetFUq5yNWNXeHTk5H4v4f+sv7hYChXLAkAAL/0PCqpT
 fWnaMe5ZgKHnf59hrwFKaNao2IIigKzRw+A8DMLGWdY9V+rqiryLphUHrqYw/DZcC/Oe
 GLqU7mUHYP62bI1ZSHyeV3j5YBsxIKAxcijCoHQkyWVdpJoqrZ9/X8wADag4AyFGAt4v
 +xRMyr67y9Ip73LlLI3pate77GlJl2TQpa/dzo9O/6QpTPYcEFpXQJmjhVeii0IFVDT4
 cBkQ==
X-Gm-Message-State: AOJu0YwnTMIW2lgh81294vG7BtT8RG7rbtoTnoxjfeJ9t1YKyzpAgcOO
 y5yqU5am7jxl1xZV1By2J8lJeQRu2wF3k9JJGO/rcgHOqVsrOBwr7ord1N7EkJJMvZY=
X-Gm-Gg: AfdE7cn/RpBNLIkhtWKHkTctG/adaJ62UYQ5brkwIgdXq132afw2VtpyK6e2lzqbW9M
 Y//vJIRr1djDq4iu/JHs2p/TZPbi7lQ3oYddSonwzeWwKjL+NW52XZOpLM0xgx1X7M9Pwn7gijY
 6fh6FHH9N1wyRKOfe0DVmmBTgfLFarkFCV4jSz10cwmutn9uQjTmmKGn4vxUmVcUEfXZyZfQmvy
 edYkKXTa2a7pcFJfrTsOFBXz4f7ySQgMjfnboJE/iK9CVl7a8iBEYxQewXVmrSQ2adKlGEEBl15
 erXyyvx07ew1CSX1qvsjPsALvFNRyNXN5d/nnk9qqtDjZ0xxGRggK8Pl+fMe82F5E13GSwRY1ZL
 JDrEsxkbXnRXL8EgJMVxrFc/fglbOhWJPoMh/V2wbIA4eVC+rmnYzOX2Jo4tyUr40QW2WVIMNUT
 k/d9MN6/0=
X-Received: by 2002:a17:90a:da84:b0:38e:5ce1:ae30 with SMTP id
 98e67ed59e1d1-38e5ce1b055mr887165a91.14.1784330598600; 
 Fri, 17 Jul 2026 16:23:18 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/17] target/arm: Generalize probe argument to
 allocation_tag_mem_internal
Date: Fri, 17 Jul 2026 16:22:56 -0700
Message-ID: <20260717232306.378988-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

We had a confusing relationship between 'probe' and 'ra == 0'.
Make this explicit via an enumeration.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mte_helper.c | 130 ++++++++++++++++++++++--------------
 1 file changed, 80 insertions(+), 50 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index e6e78634b6..997248bd57 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -88,26 +88,46 @@ typedef struct AllocationTagMem {
     MemTxAttrs attrs;
 } AllocationTagMem;
 
+typedef enum {
+    /* Trap on missing pages, invalid tag access, or watchpoints. */
+    ATM_NORMAL,
+    /* Gracefully return no tag memory for invalid pages. */
+    ATM_PROBE_PAGES,
+    /*
+     * Basic page access has already been checked,
+     * so a missing tlb entry is some sort of bug.
+     * Assert the tlb entry is present, but gracefully fail if tag
+     * access is not permitted to the page.
+     */
+    ATM_ASSERT_PAGES,
+} AllocationTagMemKind;
+
 static AllocationTagMem
 allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
                             vaddr ptr, MMUAccessType ptr_access,
                             int ptr_size, MMUAccessType tag_access,
-                            bool probe, uintptr_t ra)
+                            uintptr_t ra, AllocationTagMemKind atm_kind)
 {
     AllocationTagMem ret = { };
 
+    assert((atm_kind >= ATM_PROBE_PAGES) == (ra == 0));
+
 #ifdef CONFIG_USER_ONLY
     vaddr clean_ptr = useronly_clean_ptr(ptr);
     int flags = page_get_flags(clean_ptr);
     int req_flags = ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ;
 
     if (unlikely(!(flags & req_flags))) {
-        if (probe) {
+        switch (atm_kind) {
+        case ATM_PROBE_PAGES:
             ret.flags = TLB_INVALID_MASK;
             goto fini;
+        case ATM_NORMAL:
+            cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
+                                  !(flags & PAGE_VALID), ra);
+        default:
+            g_assert_not_reached();
         }
-        cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
-                              !(flags & PAGE_VALID), ra);
     }
 
     /* Require both MAP_ANON and PROT_MTE for the page. */
@@ -123,7 +143,6 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
     ret.attrs = MEMTXATTRS_UNSPECIFIED;
 #else
     CPUTLBEntryFull *full;
-    int in_page;
     hwaddr ptr_paddr, tag_paddr, xlat;
     MemoryRegion *mr;
     ARMASIdx tag_asi;
@@ -133,16 +152,12 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
      * Probe the first byte of the virtual address.  This raises an
      * exception for inaccessible pages, and resolves the virtual address
      * into the softmmu tlb.
-     *
-     * When RA == 0, this is either a pure probe or a no-fault-expected probe.
-     * Indicate to probe_access_flags no-fault, then either return NULL
-     * for the pure probe, or assert that we received a valid page for the
-     * no-fault-expected probe.
      */
     ret.flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
-                                  ra == 0, &ret.ptr_mem, &full, ra);
+                                  atm_kind >= ATM_PROBE_PAGES,
+                                  &ret.ptr_mem, &full, ra);
     if (unlikely(ret.flags & TLB_INVALID_MASK)) {
-        assert(probe);
+        assert(atm_kind == ATM_PROBE_PAGES);
         goto fini;
     }
     ret.attrs = full->attrs;
@@ -153,12 +168,11 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
 
     case 0xe0: /* NoTagAccess */
         if (cpu_isar_feature(aa64_mteperm, env_archcpu(env))) {
-            if (probe) {
+            if (atm_kind >= ATM_PROBE_PAGES) {
                 ret.ptr_mem = NULL;
                 ret.flags = TLB_INVALID_MASK;
                 goto fini;
             }
-            assert(ra);
             mte_perm_check_fail(env, ptr, ra, tag_access == MMU_DATA_STORE);
         }
         /* fall through */
@@ -190,22 +204,21 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
      * tag on the first page.
      * Any page access exception has priority over tag check exception.
      */
-    in_page = -(ptr | TARGET_PAGE_MASK);
-    if (unlikely(ptr_size > in_page)) {
-        void *discard_mem;
-        int flags2 = probe_access_full(env, ptr + in_page, 0, ptr_access,
-                                       ptr_mmu_idx, ra == 0,
-                                       &discard_mem, &full, ra);
+    if (atm_kind == ATM_NORMAL) {
+        int in_page = -(ptr | TARGET_PAGE_MASK);
+        if (unlikely(ptr_size > in_page)) {
+            void *discard_mem;
+            ret.flags |= probe_access_full(env, ptr + in_page, 0, ptr_access,
+                                           ptr_mmu_idx, false,
+                                           &discard_mem, &full, ra);
+        }
 
-        assert(!(flags2 & TLB_INVALID_MASK));
-        ret.flags |= flags2;
-    }
-
-    /* Any debug exception has priority over a tag check exception. */
-    if (!probe && unlikely(ret.flags & TLB_WATCHPOINT)) {
-        int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
-        assert(ra != 0);
-        cpu_check_watchpoint(env_cpu(env), ptr, ptr_size, ret.attrs, wp, ra);
+        /* Any debug exception has priority over a tag check exception. */
+        if (unlikely(ret.flags & TLB_WATCHPOINT)) {
+            int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
+            cpu_check_watchpoint(env_cpu(env), ptr, ptr_size,
+                                 ret.attrs, wp, ra);
+        }
     }
 
     /* Convert to the physical address in tag space.  */
@@ -266,8 +279,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                    uintptr_t ra)
 {
     return allocation_tag_mem_internal(env, ptr_mmu_idx, ptr, ptr_access,
-                                       ptr_size, tag_access, false, ra)
-           .tag_mem;
+                                       ptr_size, tag_access,
+                                       ra, ATM_NORMAL).tag_mem;
 }
 
 uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
@@ -275,8 +288,8 @@ uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
                                   int ptr_size, MMUAccessType tag_access)
 {
     return allocation_tag_mem_internal(env, ptr_mmu_idx, ptr, ptr_access,
-                                       ptr_size, tag_access, true, 0)
-           .tag_mem;
+                                       ptr_size, tag_access,
+                                       0, ATM_PROBE_PAGES).tag_mem;
 }
 
 uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
@@ -880,6 +893,7 @@ static int checkNrev(uint8_t *mem, int odd, int cmp, int count)
  * @desc: MTEDESC descriptor
  * @ptr: virtual address of the base of the access
  * @fault: return virtual address of the first check failure
+ * @kind: per allocation_tag_mem_internal
  *
  * Internal routine for both mte_probe and mte_check.
  * Return zero on failure, filling in *fault.
@@ -887,13 +901,14 @@ static int checkNrev(uint8_t *mem, int odd, int cmp, int count)
  * Return positive on success with tbi enabled.
  */
 static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
-                         uintptr_t ra, uint64_t *fault)
+                         uintptr_t ra, uint64_t *fault,
+                         AllocationTagMemKind atm_kind)
 {
     int mmu_idx, ptr_tag, bit55;
     uint64_t ptr_last, prev_page, next_page;
     uint64_t tag_first, tag_last;
     uint32_t sizem1, tag_count, n, c;
-    uint8_t *mem1, *mem2;
+    AllocationTagMem r1, r2;
     MMUAccessType type;
 
     bit55 = extract64(ptr, 55, 1);
@@ -931,9 +946,14 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
 
     if (likely(tag_last - prev_page < TARGET_PAGE_SIZE)) {
         /* Memory access stays on one page. */
-        mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, sizem1 + 1,
-                                  MMU_DATA_LOAD, ra);
-        if (!mem1) {
+        r1 = allocation_tag_mem_internal(env, mmu_idx, ptr, type, sizem1 + 1,
+                                           MMU_DATA_LOAD, ra, atm_kind);
+        if (unlikely(r1.flags & TLB_INVALID_MASK)) {
+            /* Tag access disabled on an otherwise accessible page. */
+            assert(atm_kind == ATM_ASSERT_PAGES);
+            return 0;
+        }
+        if (r1.tag_mem == NULL) {
             /*
              * If mtx is enabled, then the access is MemTag_CanonicallyTagged,
              * otherwise it is Untagged. See AArch64.S1DecodeMemAttrs and
@@ -945,15 +965,22 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
             return 1;
         }
         /* Perform all of the comparisons. */
-        n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, tag_count);
+        n = checkN(r1.tag_mem, ptr & TAG_GRANULE, ptr_tag, tag_count);
     } else {
         /* Memory access crosses to next page. */
-        mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, next_page - ptr,
-                                  MMU_DATA_LOAD, ra);
+        r1 = allocation_tag_mem_internal(env, mmu_idx, ptr, type,
+                                         next_page - ptr, MMU_DATA_LOAD,
+                                         ra, atm_kind);
 
-        mem2 = allocation_tag_mem(env, mmu_idx, next_page, type,
-                                  ptr_last - next_page + 1,
-                                  MMU_DATA_LOAD, ra);
+        if (r1.flags & TLB_INVALID_MASK) {
+            /* Tag access disabled on an otherwise accessible page. */
+            assert(atm_kind == ATM_ASSERT_PAGES);
+            return 0;
+        }
+
+        r2 = allocation_tag_mem_internal(env, mmu_idx, next_page, type,
+                                         ptr_last - next_page + 1,
+                                         MMU_DATA_LOAD, ra, atm_kind);
 
         /*
          * Perform all of the comparisons.
@@ -962,15 +989,18 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
          * happen with or without mtx (canonical tagging) enabled.
          */
         n = c = (next_page - tag_first) / TAG_GRANULE;
-        if (mem1) {
-            n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, c);
+        if (r1.tag_mem) {
+            n = checkN(r1.tag_mem, ptr & TAG_GRANULE, ptr_tag, c);
         } else if (mtx_check(desc, bit55) &&
                    !tag_is_canonical(ptr_tag, bit55)) {
             return 0;
         }
         if (n == c) {
-            if (mem2) {
-                n += checkN(mem2, 0, ptr_tag, tag_count - c);
+            if (r2.flags & TLB_INVALID_MASK) {
+                /* Tag access disabled on an otherwise accessible page. */
+                assert(atm_kind == ATM_ASSERT_PAGES);
+            } else if (r2.tag_mem) {
+                n += checkN(r2.tag_mem, 0, ptr_tag, tag_count - c);
             } else if (!mtx_check(desc, bit55) ||
                        tag_is_canonical(ptr_tag, bit55)) {
                 return 1;
@@ -996,7 +1026,7 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
 {
     uint64_t fault;
-    int ret = mte_probe_int(env, desc, ptr, ra, &fault);
+    int ret = mte_probe_int(env, desc, ptr, ra, &fault, ATM_NORMAL);
 
     if (unlikely(ret == 0)) {
         mte_check_fail(env, desc, fault, ra);
@@ -1038,7 +1068,7 @@ uint64_t HELPER(mte_check)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
     uint64_t fault;
-    int ret = mte_probe_int(env, desc, ptr, 0, &fault);
+    int ret = mte_probe_int(env, desc, ptr, 0, &fault, ATM_ASSERT_PAGES);
 
     return ret != 0;
 }
-- 
2.43.0


