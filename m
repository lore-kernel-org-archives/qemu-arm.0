Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB44C44515
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:24:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkru3-0001dt-43; Fri, 17 Jul 2026 19:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkru2-0001dW-4t
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:34 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrty-00072g-Qr
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:33 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-38e1a9d9105so4177649a91.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330609; x=1784935409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8+n0chjhgHEG/9+gtVo6LG9MboZPR/anVOwxZf16NKo=;
 b=YjzEGx8RFl52EIMm+hCFRjcuF+9BE4dUaK7+g298DXAaNNWlWxNPYuRe3qt+NRSJnZ
 0xTYfBj2nZB+vFaeJXIrYtIui8W2DbVR4FlzNkTjTrFQ7P93mNUGKWhlRE5V9uXZoFKK
 0Aj+IelH1qOMbnzsHq08jpS7g6aYmfmolWGbLwVpVTzpZzOFnoqDZg5iIvNVTSxbtgVC
 bhIUuLx0HgbqcagbZwPayX7RlCLZwxAgPHJtS4lSI65OpHsoFUhF5uMdTOfS0zgxG2SN
 XGw7YBy4XfAz0tUPscSBo4juwkiSJ1Vk0JA/ja/4jYyCXTQwadtcXzLo7d5tLI4c/2AH
 xPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330609; x=1784935409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8+n0chjhgHEG/9+gtVo6LG9MboZPR/anVOwxZf16NKo=;
 b=D0nFRRZsKH++H/uYQ6D9CWFDJ04gRIT7/KG6MgvWa+0KaMVV2AgXshScg+2B5c/Saz
 CdXY+7/lfh+67e+Erg264VMjAxXuDYtnmkl0LFYrwTdHjv0qoFZIi9NkijOcnxa5qVww
 kxqW7ayH4+ko1xY0G1QoCzX5L7id93T8VN9xP6bLjK5mdoN4mZ1Bty5BxCo5g0ppUsx1
 ySonOisx8/dTo7tvGbttnBwDmgr6bTbV6hl90HLcL19sjO/DanTmnUrkYEKNGD36kxiG
 8ok36gulmszXVxFoe17dACNIrcaWd4gVzoK880OKfhOBYTaAu4qmzZb54gjwQkZO+xXo
 MmLg==
X-Gm-Message-State: AOJu0Yw+HkxzmrCry3X4zMu+J0lhrM0cObEmZd5Jpsm6TxwMhZ0wwGdp
 kBpl989eGZ4aY+V6HqH6biKjcdrNNbgNwxEZaVWXPzdK9PG2nDm5YNeOdit82crsu1vn0vDsDRy
 mLUmT
X-Gm-Gg: AfdE7cnsbNld9w7Cy4jmvrNPaDKD7j28+NvuIzH3EgidLDy06uaQ8IDbKAdT4LGZakw
 b25a4XlXxMc7rbk18QoNR9eCx24omNWK0J7sHtZOvUIu1swlHUnngsLuKA7OnQeLuthw2KfqBjw
 Y+UxXuZWpFm1U0zFuj0q9RcbQcr1tgLHlZRbv7Oznr4kHo9qGoH3KASzoPtfxVmaNZzUG61lRhv
 zNaRHVGQjLj0c3FErqaNBWiSz1hELx5z8XQZ7nbMlKWUVBAiBSj8VmVTIhqRxcwBLGlxVcCn8pc
 qU/Vzlrm3cLJJQIHYJ+8mVRNCkh3CWqaMLhQA6gJgI9WCLgf5gWhKIbC1t+ET02abchzQd5Tj9j
 AacISqqu9cH6/kmGTJnuSoAWUKAPPh+JL/tMJ8E7c3sa9UiIeda4deAbtghN1PiP019KxiTny30
 +PMbj6j8EtUZ/EJjkIbg==
X-Received: by 2002:a17:90b:39cc:b0:381:22d6:f7a3 with SMTP id
 98e67ed59e1d1-38e4b49a92amr5642930a91.18.1784330609093; 
 Fri, 17 Jul 2026 16:23:29 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 16/17] target/arm: Create helper_dc_zva_mte
Date: Fri, 17 Jul 2026 16:23:04 -0700
Message-ID: <20260717232306.378988-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Reorganize helper_mte_check_zva into helper_dc_zva_mte so that
we only require one function call from tcg generated code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64-defs.h |   2 +-
 target/arm/tcg/mte_helper.c      | 210 ++++++++++++++++---------------
 target/arm/tcg/translate-a64.c   |   8 +-
 3 files changed, 113 insertions(+), 107 deletions(-)

diff --git a/target/arm/tcg/helper-a64-defs.h b/target/arm/tcg/helper-a64-defs.h
index ac8f460ffb..518e74c8aa 100644
--- a/target/arm/tcg/helper-a64-defs.h
+++ b/target/arm/tcg/helper-a64-defs.h
@@ -81,6 +81,7 @@ DEF_HELPER_3(vfp_ah_maxs, f32, f32, f32, fpst)
 DEF_HELPER_3(vfp_ah_maxd, f64, f64, f64, fpst)
 
 DEF_HELPER_FLAGS_3(dc_zva, TCG_CALL_NO_WG, void, env, i64, i32)
+DEF_HELPER_FLAGS_3(dc_zva_mte, TCG_CALL_NO_WG, void, env, i64, i32)
 
 DEF_HELPER_FLAGS_3(pacia, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(pacib, TCG_CALL_NO_WG, i64, env, i64, i64)
@@ -99,7 +100,6 @@ DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 DEF_HELPER_FLAGS_3(mte_check, TCG_CALL_NO_WG, i64, env, i32, i64)
-DEF_HELPER_FLAGS_3(mte_check_zva, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
 DEF_HELPER_FLAGS_4(ldg, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 4fa6066cbc..4161f4eb32 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -91,6 +91,12 @@ typedef struct AllocationTagMem {
 typedef enum {
     /* Trap on missing pages, invalid tag access, or watchpoints. */
     ATM_NORMAL,
+    /*
+     * Trap on missing pages, invalid tag access.
+     * Align the pointer after initial DATA_ACCESS faults.
+     * Do not check for watchpoints.
+     */
+    ATM_ZVA,
     /* Gracefully return no tag memory for invalid pages. */
     ATM_PROBE_PAGES,
     /*
@@ -104,7 +110,7 @@ typedef enum {
 
 static AllocationTagMem
 allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
-                            vaddr ptr, MMUAccessType ptr_access,
+                            vaddr ptr_orig, MMUAccessType ptr_access,
                             int ptr_size, MMUAccessType tag_access,
                             uintptr_t ra, AllocationTagMemKind atm_kind)
 {
@@ -113,7 +119,7 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
     assert((atm_kind >= ATM_PROBE_PAGES) == (ra == 0));
 
 #ifdef CONFIG_USER_ONLY
-    vaddr clean_ptr = useronly_clean_ptr(ptr);
+    vaddr clean_ptr = useronly_clean_ptr(ptr_orig);
     int flags = page_get_flags(clean_ptr);
     int req_flags = ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ;
 
@@ -123,25 +129,29 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
             ret.flags = TLB_INVALID_MASK;
             goto fini;
         case ATM_NORMAL:
-            cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
+        case ATM_ZVA:
+            cpu_loop_exit_sigsegv(env_cpu(env), ptr_orig, ptr_access,
                                   !(flags & PAGE_VALID), ra);
         default:
             g_assert_not_reached();
         }
     }
+
     if (atm_kind == ATM_NORMAL) {
-        int in_page = -(ptr | TARGET_PAGE_MASK);
+        int in_page = -(ptr_orig | TARGET_PAGE_MASK);
         if (unlikely(ptr_size > in_page)) {
-            probe_access(env, ptr + in_page, ptr_size - in_page,
+            probe_access(env, ptr_orig + in_page, ptr_size - in_page,
                          ptr_access, MMU_USER_IDX, ra);
         }
+    } else if (atm_kind == ATM_ZVA) {
+        clean_ptr &= -ptr_size;
     }
 
     /* Require both MAP_ANON and PROT_MTE for the page. */
     if ((flags & PAGE_ANON) && (flags & PAGE_MTE)) {
         size_t page_data_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
         uint8_t *tags = page_get_target_data(clean_ptr, page_data_size);
-        uintptr_t index = extract64(ptr, LOG2_TAG_GRANULE + 1,
+        uintptr_t index = extract64(clean_ptr, LOG2_TAG_GRANULE + 1,
                                     TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
         ret.tag_mem = tags + index;
     }
@@ -149,6 +159,7 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
     ret.ptr_mem = g2h_untagged_vaddr(clean_ptr);
     ret.attrs = MEMTXATTRS_UNSPECIFIED;
 #else
+    uint64_t ptr = ptr_orig;
     CPUTLBEntryFull *full;
     hwaddr ptr_paddr, tag_paddr, xlat;
     MemoryRegion *mr;
@@ -169,6 +180,15 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
         goto fini;
     }
 
+    /*
+     * For DC_ZVA and friends, the initial page lookup and trap is performed
+     * with the original address, but we need to align the further results.
+     */
+    if (atm_kind == ATM_ZVA) {
+        ptr &= -ptr_size;
+        ret.ptr_mem = (void *)((uintptr_t)ret.ptr_mem & -ptr_size);
+    }
+
     /*
      * Remember these across the second lookup below,
      * which may invalidate this pointer via tlb resize.
@@ -204,7 +224,8 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
                 ret.flags = TLB_INVALID_MASK;
                 goto fini;
             }
-            mte_perm_check_fail(env, ptr, ra, tag_access == MMU_DATA_STORE);
+            mte_perm_check_fail(env, ptr_orig, ra,
+                                tag_access == MMU_DATA_STORE);
         }
         /* fall through */
 
@@ -1146,118 +1167,103 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t addr, uint32_t desc)
     do_dczva_0(env, addr, len, mem, mmu_idx, flags, ra);
 }
 
-/*
- * Perform an MTE checked access for DC_ZVA.
- */
-uint64_t HELPER(mte_check_zva)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+void HELPER(dc_zva_mte)(CPUARMState *env, uintptr_t ptr_orig, uint32_t desc)
 {
+    int dcz_bytes = FIELD_EX32(desc, MTEDESC, SIZEM1) + 1;
+    int mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     uintptr_t ra = GETPC();
-    int log2_dcz_bytes, log2_tag_bytes;
-    int mmu_idx, bit55;
-    intptr_t dcz_bytes, tag_bytes, i;
-    void *mem;
-    uint64_t ptr_tag, mem_tag, align_ptr;
+    uint64_t ptr = ptr_orig, ptr_tag, mem_tag;
+    int bit55;
+
+    AllocationTagMem r =
+        allocation_tag_mem_internal(env, mmu_idx, ptr, MMU_DATA_STORE,
+                                    dcz_bytes, MMU_DATA_LOAD, ra, ATM_ZVA);
+
+    r.flags = do_dcxva_traps(env, ptr, dcz_bytes, mmu_idx,
+                             r.flags, r.attrs, ra);
 
     bit55 = extract64(ptr, 55, 1);
-
-    /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
-    if (unlikely(!tbi_or_mtx_check(desc, bit55))) {
-        return ptr;
-    }
-
     ptr_tag = allocation_tag_from_addr(ptr);
+    ptr &= -dcz_bytes;
 
-    if (tcma_check(desc, bit55, ptr_tag)) {
-        goto done;
-    }
+    if (unlikely(!tbi_or_mtx_check(desc, bit55)) ||
+        tcma_check(desc, bit55, ptr_tag)) {
+        /* If TBI is disabled, or TCMA disabled, the access is unchecked. */
+    } else if (r.tag_mem) {
+        /*
+         * In arm_cpu_realizefn, we asserted that dcz > LOG2_TAG_GRANULE+1,
+         * i.e. 32 bytes, which is an unreasonably small dcz anyway, to make
+         * sure that we can access one complete tag byte here.
+         */
+        int tag_bytes = dcz_bytes / (TAG_GRANULE * 2);
 
-    /*
-     * In arm_cpu_realizefn, we asserted that dcz > LOG2_TAG_GRANULE+1,
-     * i.e. 32 bytes, which is an unreasonably small dcz anyway, to make
-     * sure that we can access one complete tag byte here.
-     */
-    log2_dcz_bytes = get_dczid_bs(env_archcpu(env)) + 2;
-    log2_tag_bytes = log2_dcz_bytes - (LOG2_TAG_GRANULE + 1);
-    dcz_bytes = (intptr_t)1 << log2_dcz_bytes;
-    tag_bytes = (intptr_t)1 << log2_tag_bytes;
-    align_ptr = ptr & -dcz_bytes;
+        /*
+         * Unlike the reasoning for checkN, DC_ZVA is always aligned, and thus
+         * it is quite easy to perform all of the comparisons at once without
+         * any extra masking.
+         *
+         * The most common zva block size is 64; some of the thunderx cpus use
+         * a block size of 128.  For user-only, aarch64_max_initfn will set the
+         * block size to 512.  Fill out the other cases for future-proofing.
+         *
+         * In order to be able to find the first miscompare later, we want the
+         * tag bytes to be in little-endian order.
+         */
+        switch (tag_bytes) {
+        case 1: /* zva_blocksize 32 */
+            mem_tag = *(uint8_t *)r.tag_mem;
+            ptr_tag *= 0x11u;
+            goto cmp_tag;
+        case 2: /* zva_blocksize 64 */
+            mem_tag = cpu_to_le16(*(uint16_t *)r.tag_mem);
+            ptr_tag *= 0x1111u;
+            goto cmp_tag;
+        case 4: /* zva_blocksize 128 */
+            mem_tag = cpu_to_le32(*(uint32_t *)r.tag_mem);
+            ptr_tag *= 0x11111111u;
+            goto cmp_tag;
+        case 8: /* zva_blocksize 256 */
+            mem_tag = cpu_to_le64(*(uint64_t *)r.tag_mem);
+            ptr_tag *= 0x1111111111111111ull;
+        cmp_tag:
+            if (unlikely(mem_tag != ptr_tag)) {
+                goto fail;
+            }
+            break;
 
-    /*
-     * Trap if accessing an invalid page.  DC_ZVA requires that we supply
-     * the original pointer for an invalid page.  But watchpoints require
-     * that we probe the actual space.  So do both.
-     */
-    mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
-    (void) probe_write(env, ptr, 1, mmu_idx, ra);
-    mem = allocation_tag_mem(env, mmu_idx, align_ptr, MMU_DATA_STORE,
-                             dcz_bytes, MMU_DATA_LOAD, ra);
-    if (!mem) {
+        case 16: /* zva_blocksize 512 */
+        case 32: /* zva_blocksize 1024 */
+        case 64: /* zva_blocksize 2048 */
+            ptr_tag *= 0x1111111111111111ull;
+            for (int i = 0; i < tag_bytes; i += 8, ptr += 16 * TAG_GRANULE) {
+                mem_tag = cpu_to_le64(*(uint64_t *)(r.tag_mem + i));
+                if (unlikely(mem_tag != ptr_tag)) {
+                    goto fail;
+                }
+            }
+            break;
+
+        default:
+            /* Values above 2KiB are architecturally invalid. */
+            g_assert_not_reached();
+
+        fail:
+            /* Locate the first nibble that differs. */
+            ptr += (ctz64(mem_tag ^ ptr_tag) >> 4) * TAG_GRANULE;
+            mte_check_fail(env, desc, ptr, ra);
+        }
+    } else {
         /*
          * If mtx is enabled, then the access is MemTag_CanonicallyTagged,
          * otherwise it is Untagged. See AArch64.S1DecodeMemAttrs and
          * AArch64.S1DisabledOutput.
          */
         if (mtx_check(desc, bit55) && !tag_is_canonical(ptr_tag, bit55)) {
-            mte_check_fail(env, desc, ptr, ra);
+            mte_check_fail(env, desc, ptr_orig, ra);
         }
-        goto done;
     }
 
-    /*
-     * Unlike the reasoning for checkN, DC_ZVA is always aligned, and thus
-     * it is quite easy to perform all of the comparisons at once without
-     * any extra masking.
-     *
-     * The most common zva block size is 64; some of the thunderx cpus use
-     * a block size of 128.  For user-only, aarch64_max_initfn will set the
-     * block size to 512.  Fill out the other cases for future-proofing.
-     *
-     * In order to be able to find the first miscompare later, we want the
-     * tag bytes to be in little-endian order.
-     */
-    switch (log2_tag_bytes) {
-    case 0: /* zva_blocksize 32 */
-        mem_tag = *(uint8_t *)mem;
-        ptr_tag *= 0x11u;
-        break;
-    case 1: /* zva_blocksize 64 */
-        mem_tag = cpu_to_le16(*(uint16_t *)mem);
-        ptr_tag *= 0x1111u;
-        break;
-    case 2: /* zva_blocksize 128 */
-        mem_tag = cpu_to_le32(*(uint32_t *)mem);
-        ptr_tag *= 0x11111111u;
-        break;
-    case 3: /* zva_blocksize 256 */
-        mem_tag = cpu_to_le64(*(uint64_t *)mem);
-        ptr_tag *= 0x1111111111111111ull;
-        break;
-
-    default: /* zva_blocksize 512, 1024, 2048 */
-        ptr_tag *= 0x1111111111111111ull;
-        i = 0;
-        do {
-            mem_tag = cpu_to_le64(*(uint64_t *)(mem + i));
-            if (unlikely(mem_tag != ptr_tag)) {
-                goto fail;
-            }
-            i += 8;
-            align_ptr += 16 * TAG_GRANULE;
-        } while (i < tag_bytes);
-        goto done;
-    }
-
-    if (likely(mem_tag == ptr_tag)) {
-        goto done;
-    }
-
- fail:
-    /* Locate the first nibble that differs. */
-    i = ctz64(mem_tag ^ ptr_tag) >> 4;
-    mte_check_fail(env, desc, align_ptr + i * TAG_GRANULE, ra);
-
- done:
-    return useronly_clean_ptr(ptr);
+    do_dczva_0(env, ptr, dcz_bytes, r.ptr_mem, mmu_idx, r.flags, ra);
 }
 
 uint64_t mte_mops_probe(CPUARMState *env, uint64_t ptr, uint64_t size,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c3ff46989a..cae8d6826f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3139,13 +3139,13 @@ static void handle_sys(DisasContext *s, bool isread,
         /* Writes clear the aligned block of memory which rt points into. */
         {
             TCGv_i32 desc = gen_mtedesc_zva(s);
+
+            tcg_rt = cpu_reg(s, rt);
             if (s->mte_active[0]) {
-                tcg_rt = tcg_temp_new_i64();
-                gen_helper_mte_check_zva(tcg_rt, tcg_env, desc, cpu_reg(s, rt));
+                gen_helper_dc_zva_mte(tcg_env, tcg_rt, desc);
             } else {
-                tcg_rt = cpu_reg(s, rt);
+                gen_helper_dc_zva(tcg_env, tcg_rt, desc);
             }
-            gen_helper_dc_zva(tcg_env, tcg_rt, desc);
         }
         return;
     case ARM_CP_DC_GVA:
-- 
2.43.0


