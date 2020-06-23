Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4345316lfm;
        Tue, 23 Jun 2020 12:44:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylRNWl91Uc0akJZwY3bD7pbgBlfGBVjInhMrcBUf9t7YOgKl4l4YJbKfmMg08nrCN01A+U
X-Received: by 2002:a25:1f55:: with SMTP id f82mr38400848ybf.103.1592941484157;
        Tue, 23 Jun 2020 12:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941484; cv=none;
        d=google.com; s=arc-20160816;
        b=yXz88hNQKolITgfmEWAocGWJMrtH1Bz1FmRrahY24PPFKMcclM4+TRHegoql2u5z5L
         yALyt55gCDTfzi1att7EtrcvHotiFPlBIvuHfobriJNMyWORE23Eltp3lTOzIAlvkORB
         2LNWOvd+7V3qc82OWAbZrB3k8FfyQ0C7UwyttIYiqr74IliIUNopiYKo07YJi+KjGMOv
         t7cL1lw1ITPCN/aVAe9gVZicsPPLq3UEq9kkByZbqLOs3GdMhGPJhiW+jSMkazmwxLz7
         UmuE1fhsRnQq0GYhsiBW/6K+SEg/aipFno9grJnz4j31MgDB3HHlkuG4twE58XDbjudS
         U/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=U/osoVY2cvsT8TlettyawEwRpLG++nKPsyGP4nM5lYM=;
        b=d2t1vBwOyPWKSUBqGHSf4o1G3EVQbWr/765jSYQZbzHNnbQFhz8TVqzZcaagDOwO4k
         wFq33Frui9r0C4DwiNKi7vrlYxOK5/Q3mMqLMaxdi6KHmfEOB884g8KHG8Q+7fMwSDnH
         5uvGQnYGJ5RpvDFt+5wdPqA344sms1/Sq2HzhOO2DgwXs7/AZ/V+Pm589iOJ6BTYsACr
         CB8OJsPcvhtlefSDoj0IFd6CSKkhAcsULdZPjFoqzaBKdsl+P8MLCO0iF2g2epm696OH
         helzTehztVm2XYC9Jl4mE6caHJmMzDpMNzmEN7NlzmGT14fThOxwbR9VinihzWaVMBZn
         ZsjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=flHIFlX1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i24si14759994ybj.388.2020.06.23.12.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=flHIFlX1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnoqZ-00011C-HG
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojZ-0003w2-1y
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:29 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojX-0005iN-1Q
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:28 -0400
Received: by mail-pf1-x444.google.com with SMTP id b16so10534109pfi.13
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U/osoVY2cvsT8TlettyawEwRpLG++nKPsyGP4nM5lYM=;
 b=flHIFlX1pqd4Y9suzINtaevGpr6NVNvFa3joi85YcAbiTz22HHnbl25cdAKIDBf+e6
 IMR16j8bqywv1XyJgLLcnNTqg1fZlJddANOlkGQNs7EQpBsVAUIx9egnL19GLQi/0bth
 PiW2d+rK1audsV1hw+pEi2rP45QK8zllFzy7mqeqN4vup2bq+iNcZhmXcIKB3MSPuLMr
 uJg4ejgljRTkm96jeWD1hRfUHG9i4PDMiA7ErA/G1MjMnJHD32a6DhHyxGzfQl49lsKS
 I7r8+goU7HhidmKLtQm8CJByAo7zjeCncamcnvtAkt87A7yz0FQujynChVSppMTmYsn/
 OM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U/osoVY2cvsT8TlettyawEwRpLG++nKPsyGP4nM5lYM=;
 b=Zi794S8LJats5kk+QRot5OgcdD6MyYPt0vmsF4F1WS40V9O0JXF+EfLST25t9gQDDX
 /RkF7aVCsOKWf06Hdvy5l7G24XqFrga7+2ctbmRfVAl4OgD5MacIPqv2L5SDAl8o8eL+
 /zvdY+At55uLIPvb6STN0GJi7dn4GBkIppGw90a6m0ZRevYl2AO/ce5e7D2FdA9xr285
 Z7c6HR7UzDh0TlunY9KFT/UCqRwBivjgePveE/YFScAKzcCP8GFFRRS4BM4eDiQyJLF8
 XE26Hfis1evChYI18Syd0rco/Bpsc5XFrD7Paopyh8sVba9VTIWKtOHozjSzYHWKO4Yi
 jUfQ==
X-Gm-Message-State: AOAM532tb2PdBuMgbJhslSRyzADVV1+by6OTQHFIGBJ2jx+lBtQAWJX5
 CyrF0Y5t4yiMrZMVQ++qCeXKbA==
X-Received: by 2002:a05:6a00:84e:: with SMTP id
 q14mr26486265pfk.309.1592941045672; 
 Tue, 23 Jun 2020 12:37:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 18/45] target/arm: Simplify DC_ZVA
Date: Tue, 23 Jun 2020 12:36:31 -0700
Message-Id: <20200623193658.623279-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wZCv9SDbgi91

Now that we know that the operation is on a single page,
we need not loop over pages while probing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 94 +++++++++++------------------------------
 1 file changed, 25 insertions(+), 69 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index bc0649a44a..8682630ff6 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1119,85 +1119,41 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
      * (which matches the usual QEMU behaviour of not implementing either
      * alignment faults or any memory attribute handling).
      */
-
-    ARMCPU *cpu = env_archcpu(env);
-    uint64_t blocklen = 4 << cpu->dcz_blocksize;
+    int blocklen = 4 << env_archcpu(env)->dcz_blocksize;
     uint64_t vaddr = vaddr_in & ~(blocklen - 1);
+    int mmu_idx = cpu_mmu_index(env, false);
+    void *mem;
+
+    /*
+     * Trapless lookup.  In addition to actual invalid page, may
+     * return NULL for I/O, watchpoints, clean pages, etc.
+     */
+    mem = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
 
 #ifndef CONFIG_USER_ONLY
-    {
+    if (unlikely(!mem)) {
+        uintptr_t ra = GETPC();
+
         /*
-         * Slightly awkwardly, QEMU's TARGET_PAGE_SIZE may be less than
-         * the block size so we might have to do more than one TLB lookup.
-         * We know that in fact for any v8 CPU the page size is at least 4K
-         * and the block size must be 2K or less, but TARGET_PAGE_SIZE is only
-         * 1K as an artefact of legacy v5 subpage support being present in the
-         * same QEMU executable. So in practice the hostaddr[] array has
-         * two entries, given the current setting of TARGET_PAGE_BITS_MIN.
+         * Trap if accessing an invalid page.  DC_ZVA requires that we supply
+         * the original pointer for an invalid page.  But watchpoints require
+         * that we probe the actual space.  So do both.
          */
-        int maxidx = DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
-        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];
-        int try, i;
-        unsigned mmu_idx = cpu_mmu_index(env, false);
-        TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+        (void) probe_write(env, vaddr_in, 1, mmu_idx, ra);
+        mem = probe_write(env, vaddr, blocklen, mmu_idx, ra);
 
-        assert(maxidx <= ARRAY_SIZE(hostaddr));
-
-        for (try = 0; try < 2; try++) {
-
-            for (i = 0; i < maxidx; i++) {
-                hostaddr[i] = tlb_vaddr_to_host(env,
-                                                vaddr + TARGET_PAGE_SIZE * i,
-                                                1, mmu_idx);
-                if (!hostaddr[i]) {
-                    break;
-                }
-            }
-            if (i == maxidx) {
-                /*
-                 * If it's all in the TLB it's fair game for just writing to;
-                 * we know we don't need to update dirty status, etc.
-                 */
-                for (i = 0; i < maxidx - 1; i++) {
-                    memset(hostaddr[i], 0, TARGET_PAGE_SIZE);
-                }
-                memset(hostaddr[i], 0, blocklen - (i * TARGET_PAGE_SIZE));
-                return;
-            }
+        if (unlikely(!mem)) {
             /*
-             * OK, try a store and see if we can populate the tlb. This
-             * might cause an exception if the memory isn't writable,
-             * in which case we will longjmp out of here. We must for
-             * this purpose use the actual register value passed to us
-             * so that we get the fault address right.
+             * The only remaining reason for mem == NULL is I/O.
+             * Just do a series of byte writes as the architecture demands.
              */
-            helper_ret_stb_mmu(env, vaddr_in, 0, oi, GETPC());
-            /* Now we can populate the other TLB entries, if any */
-            for (i = 0; i < maxidx; i++) {
-                uint64_t va = vaddr + TARGET_PAGE_SIZE * i;
-                if (va != (vaddr_in & TARGET_PAGE_MASK)) {
-                    helper_ret_stb_mmu(env, va, 0, oi, GETPC());
-                }
+            for (int i = 0; i < blocklen; i++) {
+                cpu_stb_mmuidx_ra(env, vaddr + i, 0, mmu_idx, ra);
             }
-        }
-
-        /*
-         * Slow path (probably attempt to do this to an I/O device or
-         * similar, or clearing of a block of code we have translations
-         * cached for). Just do a series of byte writes as the architecture
-         * demands. It's not worth trying to use a cpu_physical_memory_map(),
-         * memset(), unmap() sequence here because:
-         *  + we'd need to account for the blocksize being larger than a page
-         *  + the direct-RAM access case is almost always going to be dealt
-         *    with in the fastpath code above, so there's no speed benefit
-         *  + we would have to deal with the map returning NULL because the
-         *    bounce buffer was in use
-         */
-        for (i = 0; i < blocklen; i++) {
-            helper_ret_stb_mmu(env, vaddr + i, 0, oi, GETPC());
+            return;
         }
     }
-#else
-    memset(g2h(vaddr), 0, blocklen);
 #endif
+
+    memset(mem, 0, blocklen);
 }
-- 
2.25.1

