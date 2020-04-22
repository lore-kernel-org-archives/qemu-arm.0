Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp200040lfm;
        Tue, 21 Apr 2020 21:45:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypJXuhw8Mb53pn8jgm/VZLAygshb4zDIQNNBAv7q3XwSUx7OduuHbCvXQGnz5Rw4hkrp9Y1/
X-Received: by 2002:a0c:8d44:: with SMTP id s4mr23152412qvb.168.1587530708545;
        Tue, 21 Apr 2020 21:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587530708; cv=none;
        d=google.com; s=arc-20160816;
        b=iu7n4gXGKl61/wr5OxvndZAbwLT5P3vpIUntoePxKkztKK0G70ZI86MjoKUqngsgDF
         jyl7tUviDFoq/j3joJozGthx/CJBVzFyqAh0VdvGUx0rrPO5Ic40xHXOS8f1R1I2mi6V
         zUvAFw82EX+an8tBQlrXwAA8eJIJHR/MNUNIpPkgeqvlisGSMYfuxJ5/eF/y8zUvaZRz
         5FiB7YQ/d54+eYEr6DMlVE+Ab3wp9h1QNflV540Ts5UIs/L27Urg3mf2ws64iQEqqNa/
         vXSd/vSkPUoQft/wjDpB4diP4PReoIX+/Kgnv4t1X1ettMujQXG6FehNisVr/FmvHKXV
         qS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=35NWN1irvYiuaoiJYNZapdYKg3V0iP81B2LwiXyBGUY=;
        b=g8qsmnX4oQdKJ4nXRgcQtWjJx8oWQUPmq2IDWzx2F4x/jAa7Dvn7yZh9a4o7PCv7jF
         eeKmykAQHPKfywnGy7voGFjVhseq2F2QZdrYAkl6e6HiUtkuHdo6noVCCKAVbNM/tKKN
         WFTWH7I+couoBlG+zeCnOfHQT3IbiyLJUNp5bfI3jn0ZzlCLx0jsjaCo4e+4RbDZ1xYs
         fby6eBQvqeT0boffwycxVm2e8nBZ5TP+jZXV3Qoex19QVeMmJvnPE9vKOaQAQ0LE+ysS
         Xgo85Lqgmi7YgEfWZUoBDG3MWXCkNs8r8S40C2q1Iv3qW65ZAFxA3thg+jhnsFul6oKl
         xbgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FZqbA0JU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2si2652626qkd.247.2020.04.21.21.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FZqbA0JU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41615 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR7Fz-00025k-P9
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74q-00012a-Sh
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74n-00061H-AQ
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:36 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:50663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR74m-0005tY-QX
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:32 -0400
Received: by mail-pj1-x1044.google.com with SMTP id t9so354634pjw.0
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35NWN1irvYiuaoiJYNZapdYKg3V0iP81B2LwiXyBGUY=;
 b=FZqbA0JUkwdhCxOIhLjbuQgHhmSCGJwX27BCr3k6fQE/42saBtMTFfrsnbGG4g6vFl
 0FRdORAVevp2wlHvlYNbjLasYWV7eVLTXPKdqpe89Ww2kkofb798WuPtcSKTKFhfpG66
 cUUUTIIZWIpff8lw+I4SlMM1VLWrxhMGoHhh11Jqeww6CqDzypOI4KeZ1TSu3MiF50DN
 iPVfZnDF0YZj9Z3Q/0gFy+4ELVqKGD5tpIo+OknxZzX76DZEO3egreqEC2byVpF9QrUF
 7Fwxb3vJB5A0RBOLBeYB3l49abdIicyMODqhyizvpTv6bknx1FpzXm4rAQ/HMJN4ZHqY
 APNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35NWN1irvYiuaoiJYNZapdYKg3V0iP81B2LwiXyBGUY=;
 b=s9NInvRBduvWJUfGn2sdHfvtQUwO2qMnOvGmfarAF2d21j0Vn42nQsoz6Kbo7S5eUn
 6EE/OcnbWLbul9PSpMpwoV5tebpoLYKZKCqQ9lkbluRoeG+QxlkaXUljKtbof2+t1gxB
 x+UxqJO3N+ppfLbAmRhm+y6XPAa4X1TWcD8ungxKu7/jLBM1uNGXN2OXkrdVrelZ8qIx
 Jt1L80hWu/d2sDBpbB0NCOuJH4VuqqE52g0iNH+mpvKPn4DnGL8tIoCKz/ev4kxA7HeY
 Mr2J40nyeY9dLWqcHg8NYMHPCFl/oE031GFIlIVrd7v2LezJbP6MiU91RdJy2Y+AAeFB
 Lp9w==
X-Gm-Message-State: AGi0PuZVfv8n9VKPye+QnlrEFG5uho8T5JfImAUV0O0hR/sIA6zQEPFb
 4PGUCecRNTvsfsnKXqpq4egCtw==
X-Received: by 2002:a17:90a:718c:: with SMTP id
 i12mr9646155pjk.142.1587530011413; 
 Tue, 21 Apr 2020 21:33:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm4129613pfd.107.2020.04.21.21.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 21:33:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/18] target/arm: Reuse sve_probe_page for gather
 first-fault loads
Date: Tue, 21 Apr 2020 21:33:06 -0700
Message-Id: <20200422043309.18430-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200422043309.18430-1-richard.henderson@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1044
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
X-TUID: jNIO48EDZfgT

This avoids the need for a separate set of helpers to implement
no-fault semantics, and will enable MTE in the future.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 323 ++++++++++++++++------------------------
 1 file changed, 127 insertions(+), 196 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9389c7c76d..6229ea65c0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5250,231 +5250,162 @@ DO_LD1_ZPZ_D(dd_be, zd)
 
 /* First fault loads with a vector index.  */
 
-/* Load one element into VD+REG_OFF from (ENV,VADDR) without faulting.
- * The controlling predicate is known to be true.  Return true if the
- * load was successful.
- */
-typedef bool sve_ld1_nf_fn(CPUARMState *env, void *vd, intptr_t reg_off,
-                           target_ulong vaddr, int mmu_idx);
-
-#ifdef CONFIG_SOFTMMU
-#define DO_LD_NF(NAME, H, TYPEE, TYPEM, HOST) \
-static bool sve_ld##NAME##_nf(CPUARMState *env, void *vd, intptr_t reg_off, \
-                              target_ulong addr, int mmu_idx)               \
-{                                                                           \
-    target_ulong next_page = -(addr | TARGET_PAGE_MASK);                    \
-    if (likely(next_page - addr >= sizeof(TYPEM))) {                        \
-        void *host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD, mmu_idx);  \
-        if (likely(host)) {                                                 \
-            TYPEM val = HOST(host);                                         \
-            *(TYPEE *)(vd + H(reg_off)) = val;                              \
-            return true;                                                    \
-        }                                                                   \
-    }                                                                       \
-    return false;                                                           \
-}
-#else
-#define DO_LD_NF(NAME, H, TYPEE, TYPEM, HOST) \
-static bool sve_ld##NAME##_nf(CPUARMState *env, void *vd, intptr_t reg_off, \
-                            target_ulong addr, int mmu_idx)                 \
-{                                                                           \
-    if (likely(page_check_range(addr, sizeof(TYPEM), PAGE_READ))) {         \
-        TYPEM val = HOST(g2h(addr));                                        \
-        *(TYPEE *)(vd + H(reg_off)) = val;                                  \
-        return true;                                                        \
-    }                                                                       \
-    return false;                                                           \
-}
-#endif
-
-DO_LD_NF(bsu, H1_4, uint32_t, uint8_t, ldub_p)
-DO_LD_NF(bss, H1_4, uint32_t,  int8_t, ldsb_p)
-DO_LD_NF(bdu,     , uint64_t, uint8_t, ldub_p)
-DO_LD_NF(bds,     , uint64_t,  int8_t, ldsb_p)
-
-DO_LD_NF(hsu_le, H1_4, uint32_t, uint16_t, lduw_le_p)
-DO_LD_NF(hss_le, H1_4, uint32_t,  int16_t, ldsw_le_p)
-DO_LD_NF(hsu_be, H1_4, uint32_t, uint16_t, lduw_be_p)
-DO_LD_NF(hss_be, H1_4, uint32_t,  int16_t, ldsw_be_p)
-DO_LD_NF(hdu_le,     , uint64_t, uint16_t, lduw_le_p)
-DO_LD_NF(hds_le,     , uint64_t,  int16_t, ldsw_le_p)
-DO_LD_NF(hdu_be,     , uint64_t, uint16_t, lduw_be_p)
-DO_LD_NF(hds_be,     , uint64_t,  int16_t, ldsw_be_p)
-
-DO_LD_NF(ss_le,  H1_4, uint32_t, uint32_t, ldl_le_p)
-DO_LD_NF(ss_be,  H1_4, uint32_t, uint32_t, ldl_be_p)
-DO_LD_NF(sdu_le,     , uint64_t, uint32_t, ldl_le_p)
-DO_LD_NF(sds_le,     , uint64_t,  int32_t, ldl_le_p)
-DO_LD_NF(sdu_be,     , uint64_t, uint32_t, ldl_be_p)
-DO_LD_NF(sds_be,     , uint64_t,  int32_t, ldl_be_p)
-
-DO_LD_NF(dd_le,      , uint64_t, uint64_t, ldq_le_p)
-DO_LD_NF(dd_be,      , uint64_t, uint64_t, ldq_be_p)
-
 /*
- * Common helper for all gather first-faulting loads.
+ * Common helpers for all gather first-faulting loads.
  */
-static inline void sve_ldff1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
-                                target_ulong base, uint32_t desc, uintptr_t ra,
-                                zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn,
-                                sve_ld1_nf_fn *nonfault_fn)
+
+static inline QEMU_ALWAYS_INLINE
+void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
+                 target_ulong base, uint32_t desc, uintptr_t retaddr,
+                 const int esz, const int msz, zreg_off_fn *off_fn,
+                 sve_ldst1_host_fn *host_fn,
+                 sve_ldst1_tlb_fn *tlb_fn)
 {
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
-    const int mmu_idx = get_mmuidx(oi);
+    const int mmu_idx = cpu_mmu_index(env, false);
     const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
-    intptr_t reg_off, reg_max = simd_oprsz(desc);
-    target_ulong addr;
+    const int esize = 1 << esz;
+    const int msize = 1 << msz;
+    const intptr_t reg_max = simd_oprsz(desc);
+    intptr_t reg_off;
+    SVEHostPage info;
+    target_ulong addr, in_page;
 
     /* Skip to the first true predicate.  */
-    reg_off = find_next_active(vg, 0, reg_max, MO_32);
-    if (likely(reg_off < reg_max)) {
-        /* Perform one normal read, which will fault or not.  */
-        addr = off_fn(vm, reg_off);
-        addr = base + (addr << scale);
-        tlb_fn(env, vd, reg_off, addr, ra);
-
-        /* The rest of the reads will be non-faulting.  */
+    reg_off = find_next_active(vg, 0, reg_max, esz);
+    if (unlikely(reg_off >= reg_max)) {
+        /* The entire predicate was false; no load occurs.  */
+        memset(vd, 0, reg_max);
+        return;
     }
 
-    /* After any fault, zero the leading predicated false elements.  */
+    /*
+     * Probe the first element, allowing faults.
+     */
+    addr = base + (off_fn(vm, reg_off) << scale);
+    tlb_fn(env, vd, reg_off, addr, retaddr);
+
+    /* After any fault, zero the other elements. */
     swap_memzero(vd, reg_off);
+    reg_off += esize;
+    swap_memzero(vd + reg_off, reg_max - reg_off);
 
-    while (likely((reg_off += 4) < reg_max)) {
-        uint64_t pg = *(uint64_t *)(vg + (reg_off >> 6) * 8);
-        if (likely((pg >> (reg_off & 63)) & 1)) {
-            addr = off_fn(vm, reg_off);
-            addr = base + (addr << scale);
-            if (!nonfault_fn(env, vd, reg_off, addr, mmu_idx)) {
-                record_fault(env, reg_off, reg_max);
-                break;
+    /*
+     * Probe the remaining elements, not allowing faults.
+     */
+    while (reg_off < reg_max) {
+        uint64_t pg = vg[reg_off >> 6];
+        do {
+            if (likely((pg >> (reg_off & 63)) & 1)) {
+                addr = base + (off_fn(vm, reg_off) << scale);
+                in_page = -(addr | TARGET_PAGE_MASK);
+
+                if (unlikely(in_page < msize)) {
+                    /* Stop if the element crosses a page boundary. */
+                    goto fault;
+                }
+
+                sve_probe_page(&info, true, env, addr, 0, MMU_DATA_LOAD,
+                               mmu_idx, retaddr);
+                if (unlikely(info.flags & (TLB_INVALID_MASK | TLB_MMIO))) {
+                    goto fault;
+                }
+                if (unlikely(info.flags & TLB_WATCHPOINT) &&
+                    (cpu_watchpoint_address_matches
+                     (env_cpu(env), addr, msize) & BP_MEM_READ)) {
+                    goto fault;
+                }
+                /* TODO: MTE check. */
+
+                host_fn(vd, reg_off, info.host);
             }
-        } else {
-            *(uint32_t *)(vd + H1_4(reg_off)) = 0;
-        }
+            reg_off += esize;
+        } while (reg_off & 63);
     }
+    return;
+
+ fault:
+    record_fault(env, reg_off, reg_max);
 }
 
-static inline void sve_ldff1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
-                                target_ulong base, uint32_t desc, uintptr_t ra,
-                                zreg_off_fn *off_fn, sve_ldst1_tlb_fn *tlb_fn,
-                                sve_ld1_nf_fn *nonfault_fn)
-{
-    const TCGMemOpIdx oi = extract32(desc, SIMD_DATA_SHIFT, MEMOPIDX_SHIFT);
-    const int mmu_idx = get_mmuidx(oi);
-    const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
-    intptr_t reg_off, reg_max = simd_oprsz(desc);
-    target_ulong addr;
-
-    /* Skip to the first true predicate.  */
-    reg_off = find_next_active(vg, 0, reg_max, MO_64);
-    if (likely(reg_off < reg_max)) {
-        /* Perform one normal read, which will fault or not.  */
-        addr = off_fn(vm, reg_off);
-        addr = base + (addr << scale);
-        tlb_fn(env, vd, reg_off, addr, ra);
-
-        /* The rest of the reads will be non-faulting.  */
-    }
-
-    /* After any fault, zero the leading predicated false elements.  */
-    swap_memzero(vd, reg_off);
-
-    while (likely((reg_off += 8) < reg_max)) {
-        uint8_t pg = *(uint8_t *)(vg + H1(reg_off >> 3));
-        if (likely(pg & 1)) {
-            addr = off_fn(vm, reg_off);
-            addr = base + (addr << scale);
-            if (!nonfault_fn(env, vd, reg_off, addr, mmu_idx)) {
-                record_fault(env, reg_off, reg_max);
-                break;
-            }
-        } else {
-            *(uint64_t *)(vd + reg_off) = 0;
-        }
-    }
+#define DO_LDFF1_ZPZ_S(MEM, OFS, MSZ) \
+void HELPER(sve_ldff##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
+                                   void *vm, target_ulong base, uint32_t desc) \
+{                                                                              \
+    sve_ldff1_z(env, vd, vg, vm, base, desc, GETPC(), MO_32, MSZ,              \
+                off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
 }
 
-#define DO_LDFF1_ZPZ_S(MEM, OFS) \
-void HELPER(sve_ldff##MEM##_##OFS)                                      \
-    (CPUARMState *env, void *vd, void *vg, void *vm,                    \
-     target_ulong base, uint32_t desc)                                  \
-{                                                                       \
-    sve_ldff1_zs(env, vd, vg, vm, base, desc, GETPC(),                  \
-                 off_##OFS##_s, sve_ld1##MEM##_tlb, sve_ld##MEM##_nf);  \
+#define DO_LDFF1_ZPZ_D(MEM, OFS, MSZ) \
+void HELPER(sve_ldff##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
+                                   void *vm, target_ulong base, uint32_t desc) \
+{                                                                              \
+    sve_ldff1_z(env, vd, vg, vm, base, desc, GETPC(), MO_64, MSZ,              \
+                off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
 }
 
-#define DO_LDFF1_ZPZ_D(MEM, OFS) \
-void HELPER(sve_ldff##MEM##_##OFS)                                      \
-    (CPUARMState *env, void *vd, void *vg, void *vm,                    \
-     target_ulong base, uint32_t desc)                                  \
-{                                                                       \
-    sve_ldff1_zd(env, vd, vg, vm, base, desc, GETPC(),                  \
-                 off_##OFS##_d, sve_ld1##MEM##_tlb, sve_ld##MEM##_nf);  \
-}
+DO_LDFF1_ZPZ_S(bsu, zsu, MO_8)
+DO_LDFF1_ZPZ_S(bsu, zss, MO_8)
+DO_LDFF1_ZPZ_D(bdu, zsu, MO_8)
+DO_LDFF1_ZPZ_D(bdu, zss, MO_8)
+DO_LDFF1_ZPZ_D(bdu, zd, MO_8)
 
-DO_LDFF1_ZPZ_S(bsu, zsu)
-DO_LDFF1_ZPZ_S(bsu, zss)
-DO_LDFF1_ZPZ_D(bdu, zsu)
-DO_LDFF1_ZPZ_D(bdu, zss)
-DO_LDFF1_ZPZ_D(bdu, zd)
+DO_LDFF1_ZPZ_S(bss, zsu, MO_8)
+DO_LDFF1_ZPZ_S(bss, zss, MO_8)
+DO_LDFF1_ZPZ_D(bds, zsu, MO_8)
+DO_LDFF1_ZPZ_D(bds, zss, MO_8)
+DO_LDFF1_ZPZ_D(bds, zd, MO_8)
 
-DO_LDFF1_ZPZ_S(bss, zsu)
-DO_LDFF1_ZPZ_S(bss, zss)
-DO_LDFF1_ZPZ_D(bds, zsu)
-DO_LDFF1_ZPZ_D(bds, zss)
-DO_LDFF1_ZPZ_D(bds, zd)
+DO_LDFF1_ZPZ_S(hsu_le, zsu, MO_16)
+DO_LDFF1_ZPZ_S(hsu_le, zss, MO_16)
+DO_LDFF1_ZPZ_D(hdu_le, zsu, MO_16)
+DO_LDFF1_ZPZ_D(hdu_le, zss, MO_16)
+DO_LDFF1_ZPZ_D(hdu_le, zd, MO_16)
 
-DO_LDFF1_ZPZ_S(hsu_le, zsu)
-DO_LDFF1_ZPZ_S(hsu_le, zss)
-DO_LDFF1_ZPZ_D(hdu_le, zsu)
-DO_LDFF1_ZPZ_D(hdu_le, zss)
-DO_LDFF1_ZPZ_D(hdu_le, zd)
+DO_LDFF1_ZPZ_S(hsu_be, zsu, MO_16)
+DO_LDFF1_ZPZ_S(hsu_be, zss, MO_16)
+DO_LDFF1_ZPZ_D(hdu_be, zsu, MO_16)
+DO_LDFF1_ZPZ_D(hdu_be, zss, MO_16)
+DO_LDFF1_ZPZ_D(hdu_be, zd, MO_16)
 
-DO_LDFF1_ZPZ_S(hsu_be, zsu)
-DO_LDFF1_ZPZ_S(hsu_be, zss)
-DO_LDFF1_ZPZ_D(hdu_be, zsu)
-DO_LDFF1_ZPZ_D(hdu_be, zss)
-DO_LDFF1_ZPZ_D(hdu_be, zd)
+DO_LDFF1_ZPZ_S(hss_le, zsu, MO_16)
+DO_LDFF1_ZPZ_S(hss_le, zss, MO_16)
+DO_LDFF1_ZPZ_D(hds_le, zsu, MO_16)
+DO_LDFF1_ZPZ_D(hds_le, zss, MO_16)
+DO_LDFF1_ZPZ_D(hds_le, zd, MO_16)
 
-DO_LDFF1_ZPZ_S(hss_le, zsu)
-DO_LDFF1_ZPZ_S(hss_le, zss)
-DO_LDFF1_ZPZ_D(hds_le, zsu)
-DO_LDFF1_ZPZ_D(hds_le, zss)
-DO_LDFF1_ZPZ_D(hds_le, zd)
+DO_LDFF1_ZPZ_S(hss_be, zsu, MO_16)
+DO_LDFF1_ZPZ_S(hss_be, zss, MO_16)
+DO_LDFF1_ZPZ_D(hds_be, zsu, MO_16)
+DO_LDFF1_ZPZ_D(hds_be, zss, MO_16)
+DO_LDFF1_ZPZ_D(hds_be, zd, MO_16)
 
-DO_LDFF1_ZPZ_S(hss_be, zsu)
-DO_LDFF1_ZPZ_S(hss_be, zss)
-DO_LDFF1_ZPZ_D(hds_be, zsu)
-DO_LDFF1_ZPZ_D(hds_be, zss)
-DO_LDFF1_ZPZ_D(hds_be, zd)
+DO_LDFF1_ZPZ_S(ss_le,  zsu, MO_32)
+DO_LDFF1_ZPZ_S(ss_le,  zss, MO_32)
+DO_LDFF1_ZPZ_D(sdu_le, zsu, MO_32)
+DO_LDFF1_ZPZ_D(sdu_le, zss, MO_32)
+DO_LDFF1_ZPZ_D(sdu_le, zd, MO_32)
 
-DO_LDFF1_ZPZ_S(ss_le,  zsu)
-DO_LDFF1_ZPZ_S(ss_le,  zss)
-DO_LDFF1_ZPZ_D(sdu_le, zsu)
-DO_LDFF1_ZPZ_D(sdu_le, zss)
-DO_LDFF1_ZPZ_D(sdu_le, zd)
+DO_LDFF1_ZPZ_S(ss_be,  zsu, MO_32)
+DO_LDFF1_ZPZ_S(ss_be,  zss, MO_32)
+DO_LDFF1_ZPZ_D(sdu_be, zsu, MO_32)
+DO_LDFF1_ZPZ_D(sdu_be, zss, MO_32)
+DO_LDFF1_ZPZ_D(sdu_be, zd, MO_32)
 
-DO_LDFF1_ZPZ_S(ss_be,  zsu)
-DO_LDFF1_ZPZ_S(ss_be,  zss)
-DO_LDFF1_ZPZ_D(sdu_be, zsu)
-DO_LDFF1_ZPZ_D(sdu_be, zss)
-DO_LDFF1_ZPZ_D(sdu_be, zd)
+DO_LDFF1_ZPZ_D(sds_le, zsu, MO_32)
+DO_LDFF1_ZPZ_D(sds_le, zss, MO_32)
+DO_LDFF1_ZPZ_D(sds_le, zd, MO_32)
 
-DO_LDFF1_ZPZ_D(sds_le, zsu)
-DO_LDFF1_ZPZ_D(sds_le, zss)
-DO_LDFF1_ZPZ_D(sds_le, zd)
+DO_LDFF1_ZPZ_D(sds_be, zsu, MO_32)
+DO_LDFF1_ZPZ_D(sds_be, zss, MO_32)
+DO_LDFF1_ZPZ_D(sds_be, zd, MO_32)
 
-DO_LDFF1_ZPZ_D(sds_be, zsu)
-DO_LDFF1_ZPZ_D(sds_be, zss)
-DO_LDFF1_ZPZ_D(sds_be, zd)
+DO_LDFF1_ZPZ_D(dd_le, zsu, MO_64)
+DO_LDFF1_ZPZ_D(dd_le, zss, MO_64)
+DO_LDFF1_ZPZ_D(dd_le, zd, MO_64)
 
-DO_LDFF1_ZPZ_D(dd_le, zsu)
-DO_LDFF1_ZPZ_D(dd_le, zss)
-DO_LDFF1_ZPZ_D(dd_le, zd)
-
-DO_LDFF1_ZPZ_D(dd_be, zsu)
-DO_LDFF1_ZPZ_D(dd_be, zss)
-DO_LDFF1_ZPZ_D(dd_be, zd)
+DO_LDFF1_ZPZ_D(dd_be, zsu, MO_64)
+DO_LDFF1_ZPZ_D(dd_be, zss, MO_64)
+DO_LDFF1_ZPZ_D(dd_be, zd, MO_64)
 
 /* Stores with a vector index.  */
 
-- 
2.20.1

