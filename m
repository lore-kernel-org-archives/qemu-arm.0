Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp396936lfc;
        Tue, 10 Mar 2020 23:57:17 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vubYFR9v3aAtyopB1K2o5K9DU2QeEFhGViILHFLGybLQ48F4kMGuLq9Qff2LCSYWG/hjDSB
X-Received: by 2002:a05:620a:1435:: with SMTP id k21mr1327713qkj.299.1583909837322;
        Tue, 10 Mar 2020 23:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583909837; cv=none;
        d=google.com; s=arc-20160816;
        b=FctsIl30G6a/Z8spoxkUjT8Zk2yJiuRhabWZ+Dg6T2d0pKkLx09pNF5Z5GXZzfAKL7
         VwKRIOItjTzjJCScu9hiGzLh7w3zvRq+uRfBQNAD4yzfLijPFh4PMifxQ6HhO6r0sM3c
         K5d9qxqLR+YekzMwLrH+Ixk+tR+YfsYT/el3jG69NjVDCm5UoHLUxnexShlcflRvyG/f
         72XGgsV1y4u2bqNccTxE3mARJCjU2at5+roOlT75XAC8pOvCbeh/Y6NYnF/R1QUWtIsZ
         UFgnkg56AP2/XYzik3OHxwhBYRfMakhgLxxPyhiHoVx8ziNj8csZN3c4WIoL8OgWmLI+
         qUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lMQ8Ls/5UNh2CeM9JrBjlxyyT05PO0oq+06rVR26ElQ=;
        b=vxSciQrFjdn2B3z44ZR9wRsFxDs3b/SJWThQ+CHv7PxnsTTRYBZ4h01rrjW8PMXCg8
         2dqc5izEEucAjoFYoesjzV4WFDl0FEJ1SrDLt9+kDLXRvtKb3AKRcwMOc5dd3gdz13Mn
         cGS18tVrWaKevfsRmhxTEuFUeBD51IDyejjIBFFjLaYC+pLP7NvDw0gHQLPIbTQg+LaL
         8bcMkWD01cB6TAdMswV+0YoxaXsWmKrz64N7be23HUTUlDy4Q+XRI3eXjByR1kLxPJPo
         g0EoW8H++H+rWvBJsuSyPR6T4U/4zZKe5gRzaN9vW24cV78fNh3A3c65f9rnr15EiqPo
         kpFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pnsSDz7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l30si528192qtd.382.2020.03.10.23.57.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 23:57:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pnsSDz7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBvIq-0001S2-NZ
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 02:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6j-0006Ua-Kk
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6h-000247-1H
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:45 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55054)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBv6f-00023A-MF
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:41 -0400
Received: by mail-pj1-x1041.google.com with SMTP id np16so476993pjb.4
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2020 23:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMQ8Ls/5UNh2CeM9JrBjlxyyT05PO0oq+06rVR26ElQ=;
 b=pnsSDz7uX7GhYBZZYMXEfjVFEGPwaQGv7iR7MVDt6XU0LW1Tc/eITVr8UjAcfxvK4V
 2B4Fu0DhX74i8csLOBBc+UDgPV85jn5k84zP86wz9JIuJ1V5T840XSH3obuDoTn/6Fbp
 tYzJOBB3QsLnT643Tp5+KdKKwjHOU+cNNHu2kh7Z37ZMteBQNAf8ah68jkLbsR9PGjK/
 f+A6jOioYsKWmdEAHaoK1u2yLyT+ID8FJFKXIgPhvDeTc8HpoN7smPU3NCHOolFjgmW4
 la7nrqjJmb6BQiW5r4AAPyoq602MxLUej4VkFpm2Lw410Poj3NiLhVHVxMEcjF9bl1ho
 3x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lMQ8Ls/5UNh2CeM9JrBjlxyyT05PO0oq+06rVR26ElQ=;
 b=uUdN80uvZ9f4BMedZ6Jp0MtzeaRIpTxDc0S6f7mrXwzvzGuzmkyXEpelstCmb1pTPI
 F3Ong/JmA4uBVD6TbfNACVwE4gRMfzULxI6RoZh04gA8rgaXgYW06xZyvrm4PYCRrE2p
 bw9/X6IZy2fEPsUfdy9FeSDf8goW2Q0pqSakvkX855wog3o7mCfJ89wXd+el/jvY7hC8
 ixKUxIpTBF9Ci7BdGRUIogLVhwjQBuYP7apjJ0qL9u9rexeNIKFCYWVZUQy3KsFpeRyP
 ctUacfzRj6UfLzBzlt9dZ7OF7TgSCV7UIQ6AkKO3eOECxEpNj7xD2sKCzoDHN2lJHS54
 1DpQ==
X-Gm-Message-State: ANhLgQ29tpPXen+8lotQYyj4jhO9U7gqgthvftEy5/+h3aABNieJgzJE
 FQu0XSW2UawTzYlUrK7y39LyvSMXTLM=
X-Received: by 2002:a17:90a:e7c8:: with SMTP id
 kb8mr1881923pjb.113.1583909080607; 
 Tue, 10 Mar 2020 23:44:40 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id z3sm50137807pfz.155.2020.03.10.23.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 23:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/16] target/arm: Reuse sve_probe_page for scatter stores
Date: Tue, 10 Mar 2020 23:44:18 -0700
Message-Id: <20200311064420.30606-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311064420.30606-1-richard.henderson@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-TUID: MDoPLhhf+5GB

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 182 ++++++++++++++++++++++++----------------
 1 file changed, 111 insertions(+), 71 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a33699adf8..e8b8f2560d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5414,94 +5414,134 @@ DO_LDFF1_ZPZ_D(dd_be, zd, MO_64)
 
 /* Stores with a vector index.  */
 
-static void sve_st1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
-                       target_ulong base, uint32_t desc, uintptr_t ra,
-                       zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn)
+static inline QEMU_ALWAYS_INLINE
+void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
+               target_ulong base, uint32_t desc, uintptr_t retaddr,
+               int esize, int msize, zreg_off_fn *off_fn,
+               sve_ldst1_host_fn *host_fn,
+               sve_ldst1_tlb_fn *tlb_fn)
 {
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
-    intptr_t i, oprsz = simd_oprsz(desc);
+    const int mmu_idx = cpu_mmu_index(env, false);
+    const intptr_t reg_max = simd_oprsz(desc);
+    void *host[ARM_MAX_VQ * 4];
+    intptr_t reg_off, i;
+    SVEHostPage info, info2;
 
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
+    /*
+     * Probe all of the elements for host addresses and flags.
+     */
+    i = reg_off = 0;
+    do {
+        uint64_t pg = vg[reg_off >> 6];
         do {
-            if (likely(pg & 1)) {
-                target_ulong off = off_fn(vm, i);
-                tlb_fn(env, vd, i, base + (off << scale), ra);
+            target_ulong addr = base + (off_fn(vm, reg_off) << scale);
+            target_ulong in_page = -(addr | TARGET_PAGE_MASK);
+
+            host[i] = NULL;
+            if (likely((pg >> (reg_off & 63)) & 1)) {
+                if (likely(in_page >= msize)) {
+                    sve_probe_page(&info, false, env, addr, 0, MMU_DATA_STORE,
+                                   mmu_idx, retaddr);
+                    host[i] = info.host;
+                } else {
+                    /*
+                     * Element crosses the page boundary.
+                     * Probe both pages, but do not record the host address,
+                     * so that we use the slow path.
+                     */
+                    sve_probe_page(&info, false, env, addr, 0,
+                                   MMU_DATA_STORE, mmu_idx, retaddr);
+                    sve_probe_page(&info2, false, env, addr + in_page, 0,
+                                   MMU_DATA_STORE, mmu_idx, retaddr);
+                    info.flags |= info2.flags;
+                }
+
+                if (unlikely(info.flags & TLB_WATCHPOINT)) {
+                    cpu_check_watchpoint(env_cpu(env), addr, msize,
+                                         info.attrs, BP_MEM_WRITE, retaddr);
+                }
+                /* TODO: MTE check. */
             }
-            i += 4, pg >>= 4;
-        } while (i & 15);
-    }
-}
+            i += 1;
+            reg_off += esize;
+        } while (reg_off & 63);
+    } while (reg_off < reg_max);
 
-static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
-                       target_ulong base, uint32_t desc, uintptr_t ra,
-                       zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn)
-{
-    const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
-    intptr_t i, oprsz = simd_oprsz(desc) / 8;
-
-    for (i = 0; i < oprsz; i++) {
-        uint8_t pg = *(uint8_t *)(vg + H1(i));
-        if (likely(pg & 1)) {
-            target_ulong off = off_fn(vm, i * 8);
-            tlb_fn(env, vd, i * 8, base + (off << scale), ra);
+    /*
+     * Now that we have recognized all exceptions except SyncExternal
+     * (from TLB_MMIO), which we cannot avoid, perform all of the stores.
+     *
+     * Note for the common case of an element in RAM, not crossing a page
+     * boundary, we have stored the host address in host[].  This doubles
+     * as a first-level check against the predicate, since only enabled
+     * elements have non-null host addresses.
+     */
+    i = reg_off = 0;
+    do {
+        void *h = host[i];
+        if (likely(h != NULL)) {
+            host_fn(vd, reg_off, h);
+        } else if ((vg[reg_off >> 6] >> (reg_off & 63)) & 1) {
+            target_ulong addr = base + (off_fn(vm, reg_off) << scale);
+            tlb_fn(env, vd, reg_off, addr, retaddr);
         }
-    }
+        i += 1;
+        reg_off += esize;
+    } while (reg_off < reg_max);
 }
 
-#define DO_ST1_ZPZ_S(MEM, OFS) \
-void QEMU_FLATTEN HELPER(sve_st##MEM##_##OFS) \
-    (CPUARMState *env, void *vd, void *vg, void *vm,         \
-     target_ulong base, uint32_t desc)                       \
-{                                                            \
-    sve_st1_zs(env, vd, vg, vm, base, desc, GETPC(),         \
-              off_##OFS##_s, sve_st1##MEM##_tlb);            \
+#define DO_ST1_ZPZ_S(MEM, OFS, MSZ) \
+void HELPER(sve_st##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
+                                 void *vm, target_ulong base, uint32_t desc) \
+{                                                                            \
+    sve_st1_z(env, vd, vg, vm, base, desc, GETPC(), 4, 1 << MSZ,             \
+              off_##OFS##_s, sve_st1##MEM##_host, sve_st1##MEM##_tlb);       \
 }
 
-#define DO_ST1_ZPZ_D(MEM, OFS) \
-void QEMU_FLATTEN HELPER(sve_st##MEM##_##OFS) \
-    (CPUARMState *env, void *vd, void *vg, void *vm,         \
-     target_ulong base, uint32_t desc)                       \
-{                                                            \
-    sve_st1_zd(env, vd, vg, vm, base, desc, GETPC(),         \
-               off_##OFS##_d, sve_st1##MEM##_tlb);           \
+#define DO_ST1_ZPZ_D(MEM, OFS, MSZ) \
+void HELPER(sve_st##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
+                                 void *vm, target_ulong base, uint32_t desc) \
+{                                                                            \
+    sve_st1_z(env, vd, vg, vm, base, desc, GETPC(), 8, 1 << MSZ,             \
+              off_##OFS##_d, sve_st1##MEM##_host, sve_st1##MEM##_tlb);       \
 }
 
-DO_ST1_ZPZ_S(bs, zsu)
-DO_ST1_ZPZ_S(hs_le, zsu)
-DO_ST1_ZPZ_S(hs_be, zsu)
-DO_ST1_ZPZ_S(ss_le, zsu)
-DO_ST1_ZPZ_S(ss_be, zsu)
+DO_ST1_ZPZ_S(bs, zsu, MO_8)
+DO_ST1_ZPZ_S(hs_le, zsu, MO_16)
+DO_ST1_ZPZ_S(hs_be, zsu, MO_16)
+DO_ST1_ZPZ_S(ss_le, zsu, MO_32)
+DO_ST1_ZPZ_S(ss_be, zsu, MO_32)
 
-DO_ST1_ZPZ_S(bs, zss)
-DO_ST1_ZPZ_S(hs_le, zss)
-DO_ST1_ZPZ_S(hs_be, zss)
-DO_ST1_ZPZ_S(ss_le, zss)
-DO_ST1_ZPZ_S(ss_be, zss)
+DO_ST1_ZPZ_S(bs, zss, MO_8)
+DO_ST1_ZPZ_S(hs_le, zss, MO_16)
+DO_ST1_ZPZ_S(hs_be, zss, MO_16)
+DO_ST1_ZPZ_S(ss_le, zss, MO_32)
+DO_ST1_ZPZ_S(ss_be, zss, MO_32)
 
-DO_ST1_ZPZ_D(bd, zsu)
-DO_ST1_ZPZ_D(hd_le, zsu)
-DO_ST1_ZPZ_D(hd_be, zsu)
-DO_ST1_ZPZ_D(sd_le, zsu)
-DO_ST1_ZPZ_D(sd_be, zsu)
-DO_ST1_ZPZ_D(dd_le, zsu)
-DO_ST1_ZPZ_D(dd_be, zsu)
+DO_ST1_ZPZ_D(bd, zsu, MO_8)
+DO_ST1_ZPZ_D(hd_le, zsu, MO_16)
+DO_ST1_ZPZ_D(hd_be, zsu, MO_16)
+DO_ST1_ZPZ_D(sd_le, zsu, MO_32)
+DO_ST1_ZPZ_D(sd_be, zsu, MO_32)
+DO_ST1_ZPZ_D(dd_le, zsu, MO_64)
+DO_ST1_ZPZ_D(dd_be, zsu, MO_64)
 
-DO_ST1_ZPZ_D(bd, zss)
-DO_ST1_ZPZ_D(hd_le, zss)
-DO_ST1_ZPZ_D(hd_be, zss)
-DO_ST1_ZPZ_D(sd_le, zss)
-DO_ST1_ZPZ_D(sd_be, zss)
-DO_ST1_ZPZ_D(dd_le, zss)
-DO_ST1_ZPZ_D(dd_be, zss)
+DO_ST1_ZPZ_D(bd, zss, MO_8)
+DO_ST1_ZPZ_D(hd_le, zss, MO_16)
+DO_ST1_ZPZ_D(hd_be, zss, MO_16)
+DO_ST1_ZPZ_D(sd_le, zss, MO_32)
+DO_ST1_ZPZ_D(sd_be, zss, MO_32)
+DO_ST1_ZPZ_D(dd_le, zss, MO_64)
+DO_ST1_ZPZ_D(dd_be, zss, MO_64)
 
-DO_ST1_ZPZ_D(bd, zd)
-DO_ST1_ZPZ_D(hd_le, zd)
-DO_ST1_ZPZ_D(hd_be, zd)
-DO_ST1_ZPZ_D(sd_le, zd)
-DO_ST1_ZPZ_D(sd_be, zd)
-DO_ST1_ZPZ_D(dd_le, zd)
-DO_ST1_ZPZ_D(dd_be, zd)
+DO_ST1_ZPZ_D(bd, zd, MO_8)
+DO_ST1_ZPZ_D(hd_le, zd, MO_16)
+DO_ST1_ZPZ_D(hd_be, zd, MO_16)
+DO_ST1_ZPZ_D(sd_le, zd, MO_32)
+DO_ST1_ZPZ_D(sd_be, zd, MO_32)
+DO_ST1_ZPZ_D(dd_le, zd, MO_64)
+DO_ST1_ZPZ_D(dd_be, zd, MO_64)
 
 #undef DO_ST1_ZPZ_S
 #undef DO_ST1_ZPZ_D
-- 
2.20.1

