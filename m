Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp390764lfc;
        Tue, 10 Mar 2020 23:49:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vseGysRbvlSm45efRVUqlHPkaPu5FKuCl8mKiMWJPy+jx1WaW0Xkgn4veF2MrPJIgVJDN6H
X-Received: by 2002:a37:7cc5:: with SMTP id x188mr1456501qkc.390.1583909358053;
        Tue, 10 Mar 2020 23:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583909358; cv=none;
        d=google.com; s=arc-20160816;
        b=05JpLrvM7vmOMQYavRWd2pgjOCFqsE3Qg0D0Ryhnk0pXHjx4vIwpc105Xg0Gk/MtzI
         gCEfQPFJRTsdhq9nvIuaFELw/v2u/CuqDbJitaLL1kPg/9iNfNxnJOzSM0H2ll0nUVSH
         B5oAR8UfYD1ayN+fF1W6ea3L+LIgw2XmIWqgS4HrbpaRDQqNVSSVhKrDpqJ5Qji0/PiJ
         hyu20G6ytkpH9NFElKoW2P/QMTUMDa3AaFnpT2U9fAYEGnLxy20RItn0G1y/2Kkmpmis
         TY4bI7hnb2BT4ylY9Ai2/UeERSIVK7UzJCEV1Q5durwCAJ5bkqTtzvTtN4oZw9dmRLJS
         WjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3qRBHeH49omwqgoxg8Z+ZrefAQ7kYCLg+akntsfuZdA=;
        b=iLXZDj1lM+SBaOk29GoTG7iyUhe+VmEy/pxoYtjICL1XKUtAkEhX4WVXqKCakU+Kj1
         ndwPtoip6GIVcOOYsACDFvuAkP/8V0Hn0+aBPliIwItXnZnGTYzedjH2wTiJ8rifU1Zl
         foNsuXAa0Sc8YCv63YC1hIJV44CtFDgCYDTzYY2PrEMJLNLZeDeP4m+orRhheXmEFoA5
         SIWquD1IqgyhtGtCpy1HjXIG2mKzXeo9j2HWRIBMXGypIeF1mH/J0uw5OJs4mQSHjw46
         yQGkL7wEzQRdi4B5RpW8EB9YdUXxjeT5LosNRiG9MjWmVwARMLQqmCtqW0OugwKIBa0I
         JzSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QR0vyAfX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si278766qtr.337.2020.03.10.23.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 23:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QR0vyAfX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBvB7-0004Wi-En
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 02:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59459)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6Z-0006Cd-Og
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6X-0001vd-QZ
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:35 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43343)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBv6V-0001sR-Vj
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:33 -0400
Received: by mail-pl1-x632.google.com with SMTP id f8so610997plt.10
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2020 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3qRBHeH49omwqgoxg8Z+ZrefAQ7kYCLg+akntsfuZdA=;
 b=QR0vyAfXuvl8umdBF3mzlxvOCfvxsRghnY2q01fR0IaVMAMSiFnoy9QsH7BNhA652F
 MFLrDpP6DPCiSXowIJfoAgQHSdz7uZeNQz2DeY50VZFkuJghMXu5FsU5zzvW+j4cVoaD
 bXO45GF7RwA5i+Dmsu5bPT8Nrs2XRII0sVS6dSeQhbXapVNWF/JIgV/bt7MjV7gu6BmX
 FyAIiUn88NWN47ByGImQFIVw2gZP/cWrTPUgX6L88NY3f+86Iy26fxNP135MFGqDTIKg
 /VqZ7aqTlJ3YFTPVc8xnS/qLAfcQx+0qffx71PjMhsrHEnJTyrUDAMBM+YL1v/XkU7FO
 kULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3qRBHeH49omwqgoxg8Z+ZrefAQ7kYCLg+akntsfuZdA=;
 b=fMDZcJpwyyUCE8B4+MBEOtnfHDV2Z442UADrmmWEs5H5SVVYKVE7QNltssVjjfQx9p
 e6UIhhufblR0jx6KiN6PUL50Pj6kw6lwXmMBFgJVGTA4HclDGgMJ5VGE6dVwwNPlGnGF
 d6Unj+XmtwwldD4xC6uhQEqJIm8Nj7cLueLQrHrozgyTsHYmMs6r6O4YhFtpzv7GSxnE
 Syr0z0PQ2Oa36zBU78ES4b+ysphde394NElxcp3aKxr85StrJ5swGmrDNMO9sCM9M1qp
 cv3s5Mv73JyuuaKVNvUs9seiM5HihA8LLKuoT6R0Fp9ig/DOceThvmko7r0IwHtgfUtz
 S1Og==
X-Gm-Message-State: ANhLgQ3h+EqFavUrl2LW0d90sQZ1ZMCiD9Xf1YPDq0pmHx++fO65On87
 09c4q/QaGQ+q8lJzq1jw1mrcmQ==
X-Received: by 2002:a17:902:7b8d:: with SMTP id
 w13mr1795283pll.78.1583909070792; 
 Tue, 10 Mar 2020 23:44:30 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id z3sm50137807pfz.155.2020.03.10.23.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 23:44:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/16] target/arm: Adjust interface of sve_ld1_host_fn
Date: Tue, 10 Mar 2020 23:44:11 -0700
Message-Id: <20200311064420.30606-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311064420.30606-1-richard.henderson@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::632
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SKs+x5USa0UK

The current interface includes a loop; change it to load a
single element.  We will then be able to use the function
for ld{2,3,4} where individual vector elements are not adjacent.

Replace each call with the simplest possible loop over active
elements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 127 +++++++++++++++++++++-------------------
 1 file changed, 66 insertions(+), 61 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3f653e46a0..1397c2b634 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3972,20 +3972,10 @@ void HELPER(sve_fcmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
  */
 
 /*
- * Load elements into @vd, controlled by @vg, from @host + @mem_ofs.
- * Memory is valid through @host + @mem_max.  The register element
- * indicies are inferred from @mem_ofs, as modified by the types for
- * which the helper is built.  Return the @mem_ofs of the first element
- * not loaded (which is @mem_max if they are all loaded).
- *
- * For softmmu, we have fully validated the guest page.  For user-only,
- * we cannot fully validate without taking the mmap lock, but since we
- * know the access is within one host page, if any access is valid they
- * all must be valid.  However, when @vg is all false, it may be that
- * no access is valid.
+ * Load elements into @vd + @reg_off, from @host,
+ * or the reverse for stores.
  */
-typedef intptr_t sve_ld1_host_fn(void *vd, void *vg, void *host,
-                                 intptr_t mem_ofs, intptr_t mem_max);
+typedef void sve_ldst1_host_fn(void *vd, intptr_t reg_off, void *host);
 
 /*
  * Load one element into @vd + @reg_off from (@env, @vaddr, @ra).
@@ -4000,23 +3990,16 @@ typedef void sve_ldst1_tlb_fn(CPUARMState *env, void *vd, intptr_t reg_off,
  * For *_tlb, this uses the cpu_*_data_ra helpers.  There are not
  * endian-specific versions of these, so we must handle endianness
  * locally.
+ *
+ * For *_host, this is a trivial application of the <qemu/bswap.h>
+ * endian-specific access followed by a store into the vector register.
  */
 
 #define DO_LD_HOST(NAME, H, TYPEE, TYPEM, HOST) \
-static intptr_t sve_##NAME##_host(void *vd, void *vg, void *host,           \
-                                  intptr_t mem_off, const intptr_t mem_max) \
-{                                                                           \
-    intptr_t reg_off = mem_off * (sizeof(TYPEE) / sizeof(TYPEM));           \
-    uint64_t *pg = vg;                                                      \
-    while (mem_off + sizeof(TYPEM) <= mem_max) {                            \
-        TYPEM val = 0;                                                      \
-        if (likely((pg[reg_off >> 6] >> (reg_off & 63)) & 1)) {             \
-            val = HOST(host + mem_off);                                     \
-        }                                                                   \
-        *(TYPEE *)(vd + H(reg_off)) = val;                                  \
-        mem_off += sizeof(TYPEM), reg_off += sizeof(TYPEE);                 \
-    }                                                                       \
-    return mem_off;                                                         \
+static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
+{                                                                      \
+    TYPEM val = HOST(host);                                            \
+    *(TYPEE *)(vd + H(reg_off)) = val;                                 \
 }
 
 #define DO_LD_TLB(NAME, H, TYPEE, TYPEM, BSWAP, TLB) \
@@ -4414,7 +4397,7 @@ static inline bool test_host_page(void *host)
 static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
                       uint32_t desc, const uintptr_t retaddr,
                       const int esz, const int msz,
-                      sve_ld1_host_fn *host_fn,
+                      sve_ldst1_host_fn *host_fn,
                       sve_ldst1_tlb_fn *tlb_fn)
 {
     const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
@@ -4448,8 +4431,12 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
     if (likely(split == mem_max)) {
         host = tlb_vaddr_to_host(env, addr + mem_off, MMU_DATA_LOAD, mmu_idx);
         if (test_host_page(host)) {
-            mem_off = host_fn(vd, vg, host - mem_off, mem_off, mem_max);
-            tcg_debug_assert(mem_off == mem_max);
+            intptr_t i = reg_off;
+            host -= mem_off;
+            do {
+                host_fn(vd, i, host + (i >> diffsz));
+                i = find_next_active(vg, i + (1 << esz), reg_max, esz);
+            } while (i < reg_max);
             /* After having taken any fault, zero leading inactive elements. */
             swap_memzero(vd, reg_off);
             return;
@@ -4462,7 +4449,12 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
      */
 #ifdef CONFIG_USER_ONLY
     swap_memzero(&scratch, reg_off);
-    host_fn(&scratch, vg, g2h(addr), mem_off, mem_max);
+    host = g2h(addr);
+    do {
+        host_fn(&scratch, reg_off, host + (reg_off >> diffsz));
+        reg_off += 1 << esz;
+        reg_off = find_next_active(vg, reg_off, reg_max, esz);
+    } while (reg_off < reg_max);
 #else
     memset(&scratch, 0, reg_max);
     goto start;
@@ -4480,9 +4472,13 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
             host = tlb_vaddr_to_host(env, addr + mem_off,
                                      MMU_DATA_LOAD, mmu_idx);
             if (host) {
-                mem_off = host_fn(&scratch, vg, host - mem_off,
-                                  mem_off, split);
-                reg_off = mem_off << diffsz;
+                host -= mem_off;
+                do {
+                    host_fn(&scratch, reg_off, host + mem_off);
+                    reg_off += 1 << esz;
+                    reg_off = find_next_active(vg, reg_off, reg_max, esz);
+                    mem_off = reg_off >> diffsz;
+                } while (split - mem_off >= (1 << msz));
                 continue;
             }
         }
@@ -4709,7 +4705,7 @@ static void record_fault(CPUARMState *env, uintptr_t i, uintptr_t oprsz)
 static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                         uint32_t desc, const uintptr_t retaddr,
                         const int esz, const int msz,
-                        sve_ld1_host_fn *host_fn,
+                        sve_ldst1_host_fn *host_fn,
                         sve_ldst1_tlb_fn *tlb_fn)
 {
     const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
@@ -4719,7 +4715,7 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     const int diffsz = esz - msz;
     const intptr_t reg_max = simd_oprsz(desc);
     const intptr_t mem_max = reg_max >> diffsz;
-    intptr_t split, reg_off, mem_off;
+    intptr_t split, reg_off, mem_off, i;
     void *host;
 
     /* Skip to the first active element.  */
@@ -4742,28 +4738,18 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     if (likely(split == mem_max)) {
         host = tlb_vaddr_to_host(env, addr + mem_off, MMU_DATA_LOAD, mmu_idx);
         if (test_host_page(host)) {
-            mem_off = host_fn(vd, vg, host - mem_off, mem_off, mem_max);
-            tcg_debug_assert(mem_off == mem_max);
+            i = reg_off;
+            host -= mem_off;
+            do {
+                host_fn(vd, i, host + (i >> diffsz));
+                i = find_next_active(vg, i + (1 << esz), reg_max, esz);
+            } while (i < reg_max);
             /* After any fault, zero any leading inactive elements.  */
             swap_memzero(vd, reg_off);
             return;
         }
     }
 
-#ifdef CONFIG_USER_ONLY
-    /*
-     * The page(s) containing this first element at ADDR+MEM_OFF must
-     * be valid.  Considering that this first element may be misaligned
-     * and cross a page boundary itself, take the rest of the page from
-     * the last byte of the element.
-     */
-    split = max_for_page(addr, mem_off + (1 << msz) - 1, mem_max);
-    mem_off = host_fn(vd, vg, g2h(addr), mem_off, split);
-
-    /* After any fault, zero any leading inactive elements.  */
-    swap_memzero(vd, reg_off);
-    reg_off = mem_off << diffsz;
-#else
     /*
      * Perform one normal read, which will fault or not.
      * But it is likely to bring the page into the tlb.
@@ -4780,11 +4766,15 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     if (split >= (1 << msz)) {
         host = tlb_vaddr_to_host(env, addr + mem_off, MMU_DATA_LOAD, mmu_idx);
         if (host) {
-            mem_off = host_fn(vd, vg, host - mem_off, mem_off, split);
-            reg_off = mem_off << diffsz;
+            host -= mem_off;
+            do {
+                host_fn(vd, reg_off, host + mem_off);
+                reg_off += 1 << esz;
+                reg_off = find_next_active(vg, reg_off, reg_max, esz);
+                mem_off = reg_off >> diffsz;
+            } while (split - mem_off >= (1 << msz));
         }
     }
-#endif
 
     record_fault(env, reg_off, reg_max);
 }
@@ -4794,7 +4784,7 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
  */
 static void sve_ldnf1_r(CPUARMState *env, void *vg, const target_ulong addr,
                         uint32_t desc, const int esz, const int msz,
-                        sve_ld1_host_fn *host_fn)
+                        sve_ldst1_host_fn *host_fn)
 {
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
     void *vd = &env->vfp.zregs[rd];
@@ -4809,7 +4799,13 @@ static void sve_ldnf1_r(CPUARMState *env, void *vg, const target_ulong addr,
     host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD, mmu_idx);
     if (likely(page_check_range(addr, mem_max, PAGE_READ) == 0)) {
         /* The entire operation is valid and will not fault.  */
-        host_fn(vd, vg, host, 0, mem_max);
+        reg_off = 0;
+        do {
+            mem_off = reg_off >> diffsz;
+            host_fn(vd, reg_off, host + mem_off);
+            reg_off += 1 << esz;
+            reg_off = find_next_active(vg, reg_off, reg_max, esz);
+        } while (reg_off < reg_max);
         return;
     }
 #endif
@@ -4829,8 +4825,12 @@ static void sve_ldnf1_r(CPUARMState *env, void *vg, const target_ulong addr,
     if (page_check_range(addr + mem_off, 1 << msz, PAGE_READ) == 0) {
         /* At least one load is valid; take the rest of the page.  */
         split = max_for_page(addr, mem_off + (1 << msz) - 1, mem_max);
-        mem_off = host_fn(vd, vg, host, mem_off, split);
-        reg_off = mem_off << diffsz;
+        do {
+            host_fn(vd, reg_off, host + mem_off);
+            reg_off += 1 << esz;
+            reg_off = find_next_active(vg, reg_off, reg_max, esz);
+            mem_off = reg_off >> diffsz;
+        } while (split - mem_off >= (1 << msz));
     }
 #else
     /*
@@ -4851,8 +4851,13 @@ static void sve_ldnf1_r(CPUARMState *env, void *vg, const target_ulong addr,
     host = tlb_vaddr_to_host(env, addr + mem_off, MMU_DATA_LOAD, mmu_idx);
     split = max_for_page(addr, mem_off, mem_max);
     if (host && split >= (1 << msz)) {
-        mem_off = host_fn(vd, vg, host - mem_off, mem_off, split);
-        reg_off = mem_off << diffsz;
+        host -= mem_off;
+        do {
+            host_fn(vd, reg_off, host + mem_off);
+            reg_off += 1 << esz;
+            reg_off = find_next_active(vg, reg_off, reg_max, esz);
+            mem_off = reg_off >> diffsz;
+        } while (split - mem_off >= (1 << msz));
     }
 #endif
 
-- 
2.20.1

