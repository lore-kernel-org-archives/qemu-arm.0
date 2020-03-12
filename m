Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087574lfc;
        Thu, 12 Mar 2020 12:42:46 -0700 (PDT)
X-Received: by 2002:a63:be0f:: with SMTP id l15mr9182627pgf.451.1584042166284;
        Thu, 12 Mar 2020 12:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042166; cv=none;
        d=google.com; s=arc-20160816;
        b=E1TSNqX6/6ZvM52P3/WcLCpuBeV4DY6ADSyGFf9BCRdayEb1cqm4b/UBO1nlXRKatg
         1oIQ+fctIeokzB3tCEW4J1Wl61IP4CGrgisE5KyR6h12nqDr0KNMJ3L0xZdlTAOyeeTu
         NW+GSz1RFjI9TQViW5DGn8DAmB+4TrKAPP0WTueWfuNmNSDym6rk2Et+4XtZR/UE+tLa
         9TGJCkv4VwVL+fe2ZasBxUxZXir8UVfSfeqZnzAF5uHfl7JkCb6BJHg5ukIu9sxWjZOR
         6hUNbsnizCZzYBHXUNMly7cndAK1iIUy28xl2HFR7wPNg4jmQyewbPvu3+FQalhx16k1
         leXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OdUOrVG4+6fOcBEkk2TzuAIf4lO1j/SFFZ3HajmExks=;
        b=TJVpJ87Q0mL83HQ/lT7jgZPSQfx1kSxTHNmaQYWYLJQTo9/d6l8BvPG6K8lMuvM9EF
         CEeRgFWsndt+6ZpN7BA8lGShdddGTiKnTQvI91l7ich1EFajuC25aCG4+o6cs2NauVWu
         zc2sy987jsaJlh5mt7w+HBioblmAhPVuPCiRsNhCAlRPTz1zhHAMWZXG5yHxKAhO861G
         1ToNw3DgI1fE42acDGSkfuQY7CV8xv8OwwR70hw3kK/8v36c+rCy1o0yirM4bmD72j52
         VccuQ8f2EVgo5sYt/oEnZET4wQNdYxZCJxaKCCY0xnmB4widkseonRhbbGTuk6PYYfbc
         itgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NQm0MU3c;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id mu11sor6776110pjb.30.2020.03.12.12.42.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NQm0MU3c;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OdUOrVG4+6fOcBEkk2TzuAIf4lO1j/SFFZ3HajmExks=;
        b=NQm0MU3cApmQWVJ1p95QWuiOx5XAxifQxmDkUuQZ8Gw4Th1elugQeFMOt9PvfpGsiC
         U83e/TEiJcIYtY2ZLmPh8eZ3f/xH5sLnEeokLkaacqXXtPPFnxa4vgtrVrpGkXkN3cOG
         YNljKf6M2dl4yZ9DxitGrlR6B0PuRcCDclQLoWjbLpHUlnCjQPZ1PztoO2RGE1c8EZSU
         ehB/bFm3ExrQ+ayB4Z5ZRhjqU6HFqffb/q6z9eEA2afsbR2iwhkIZQMKARxmuDNbdS9O
         e34n7aYYRn3ArD2lad7SuhqeOBgtUbbxV5WT2GWWdA9TQoa/F8XTC4bWARhKHzIc7x/0
         +ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OdUOrVG4+6fOcBEkk2TzuAIf4lO1j/SFFZ3HajmExks=;
        b=VFpXrjwXR0h7nQdyTrtZJE3hf8ubSxoYTwUrsQ84ugpQX1l9joS/sRsmws0Ykls6k/
         kP0TwR+Dv0vEEQW+54fCnT9fhCgIi0YroQlmazTyYV2w3KmhHz5+3iOBw1ZsVlbvAGY/
         tedBBhfPxPM+NdE6jx3bUnOvogHdxS2etFk34j8+TDtPqkhs1elViTlWfll3ipKEVnD7
         F3lm45p6ZpWHnSL+GexXGbugfYpSQsJnDtQwbhaUgzn1NuxCTYYIpzobPFUfjbF1R9L5
         iVGO532O6X7ASS3U6829/vHKTaUNlqO827HhByDVre5Rf9zAdl+3QzOEKfxyCSZlQqXS
         XcGQ==
X-Gm-Message-State: ANhLgQ1R8/f5DQKn2v4sylUQmN7iR10NqMWP4qBO2gazon9H2nD8gW27
	u1bEq+ataTGe3tWXM2GUjl/aeyCfqHDv6w==
X-Google-Smtp-Source: ADFU+vu0oH21qXkYGhSbyxVN3lhjP0De7OnHEpOmfTReU/VfNdXwsSJEX5BYO735f5eY6gzE9Zl2/g==
X-Received: by 2002:a17:90b:94a:: with SMTP id dw10mr5787263pjb.89.1584042165705;
        Thu, 12 Mar 2020 12:42:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 18/42] target/arm: Simplify DC_ZVA
Date: Thu, 12 Mar 2020 12:41:55 -0700
Message-Id: <20200312194219.24406-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ekSiHwyGUSk9

Now that we know that the operation is on a single page,
we need not loop over pages while probing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 94 +++++++++++------------------------------
 1 file changed, 25 insertions(+), 69 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index bc0649a44a..60a04dc880 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1119,85 +1119,41 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
      * (which matches the usual QEMU behaviour of not implementing either
      * alignment faults or any memory attribute handling).
      */
+    int blocklen = 4 << env_archcpu(env)->dcz_blocksize;
+    uint64_t vaddr = vaddr_in & -blocklen;
+    int mmu_idx = cpu_mmu_index(env, false);
+    void *mem;
 
-    ARMCPU *cpu = env_archcpu(env);
-    uint64_t blocklen = 4 << cpu->dcz_blocksize;
-    uint64_t vaddr = vaddr_in & ~(blocklen - 1);
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
2.20.1
