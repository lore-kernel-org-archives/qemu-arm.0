Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp195311lfm;
        Tue, 21 Apr 2020 21:37:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypIq+klTFJtd57BJYjrDtdhxiIGn5p17mG5FKcZFqNgkJT/LbS9nLyO3NRTZhM5nbprPuPSr
X-Received: by 2002:a0c:a9c2:: with SMTP id c2mr10407731qvb.23.1587530240553;
        Tue, 21 Apr 2020 21:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587530240; cv=none;
        d=google.com; s=arc-20160816;
        b=p3khTp7m9Lc6jptiJYu3ekMXcq5MZZ7xTBuBQj2S+ysD/qfNisa0jHyIfN3nxLtAG/
         vPDvt8fiNZH49iWOdD8iQ2EDYGX3xhvLHpCOTkFFV0RiHg50ieVl1PEFYqkidM5QPzNW
         nSm7nO8YXSY4PyjiJgi2LT99M+ZPfuA2e5scNZJsfLHJJfi4C1U6uOT3z/zkmLdX8yWQ
         Kf+QL0RuK+z1xG1sLfRXX5enmRBQcNE+SL00pZUOfKQe9BXw5bW4PsTlEaBXKzRJY3As
         x85Pg4NWpTJKiw/Yv0A8tNNEjVY3U6PGSHkaQjd6Kqoec+Tye/sRAVk0W2ixRVoyKRZM
         RR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WM1aUyfyRs93urrEY6+L5X21LUQrhWBFyRqQaG2TVqs=;
        b=XPBLDWOMNwIDkWhn118XAhV2GhzcR7Ygq0dWFeSo5oEylofV+03Fv1EO2uYiKqEw4p
         awNnkK/VjmkyHJn0+3fMso7bCZK5Jn9nGD7RaYiaXMDv47+X9Jptd7lrBX8GBwJNTpau
         ZBkWCYBLV2LdI8s38kxTftCgCSx4ZJquQuBf5iRwAaiuCyZ8cs9x6h6pu9dGkYpHrrij
         zlD/Y+MZ/OeUzuIb3a5N/QMf/OPtsc7nMVxiKh+y2qwUk4C4uH2XSqUCUNyq+Z36Sb/c
         G0JRoXfBjo886rLCZXR+HZnyv/OweOwqfsYd64hgEOEdB/M0Obq/E2zKA6XKNW0i78ms
         OGcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPt7j29M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si2608583qke.231.2020.04.21.21.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:37:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPt7j29M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR78R-0006qI-QV
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74o-0000x0-MC
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74m-0005vc-EV
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:34 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:53000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR74l-0005m6-R0
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:31 -0400
Received: by mail-pj1-x1044.google.com with SMTP id a5so348908pjh.2
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WM1aUyfyRs93urrEY6+L5X21LUQrhWBFyRqQaG2TVqs=;
 b=iPt7j29Mm9xm7zu1akU3+XKCRrUKIjJmvmGmwrr71vTbgNgESFpHdwMwy69fsTspbs
 cWjZJfLAbo7uRmzmBqk+odhJKzx/V7Y8x3WJ69liKV8rVwrP6Ql26Ru78qsu9oe20NZa
 qiOlkpQj1j1PW+rsVPfaEeekMErAJypIM7re2fPYTNMnUcW1DH41yFCzW5A0dJHpwJXO
 7pQ4PqdtiO3yIQbZNMnBqR9YMLU6MaEwO9OG7KMYLalFuY/9k5e3iOiMVphMA6gCNiap
 KgC1yNtoCpqr9ky5oRAUhoAZ2Cd2u3uJbWJsfPnhmD4nmUBQByLxcvpOrY0yZHJzUXq6
 867Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WM1aUyfyRs93urrEY6+L5X21LUQrhWBFyRqQaG2TVqs=;
 b=KZa3WFbdqmxBdBGMbSlzia0CpVq1lWYLTC/9qqg1w/9exmjNRLOQ87javvg8wy+Lcq
 gnnVNuBMEN2tVDTEJWNXsRolAb+GpF3g6+t7qDU3klR+7s/zST6fI6zJK7TsFXVLU9LW
 1tGA/l0n+pHzAcftOIWhxF62uneYQ8wqqYMdsk9cjnPWUY/vi6Q1OIW1dFLyIGTk5RfA
 IspuuqCcM7b43PvS96BXTnQrJ4MlDIqjuCwdQHM4OFxiYBFTai397jJAUAahBiBo5ohP
 cqNpqHl3WpeU5Fh7xuWz58bkpsFRfy+SdV3Fa1umLgjOT8ubWJZ98lh2L2MaCYIsmwfH
 tPIA==
X-Gm-Message-State: AGi0PuZYlT3iL1aiMMvAoecC61LgVxLQZQr1uwmE0Yip4necPmajhGtw
 bmAcQP5JvbPUqdhBXv7JrHaUu/XPalM=
X-Received: by 2002:a17:90a:9f0b:: with SMTP id
 n11mr8347214pjp.99.1587530010318; 
 Tue, 21 Apr 2020 21:33:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm4129613pfd.107.2020.04.21.21.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 21:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/18] target/arm: Use SVEContLdSt for contiguous stores
Date: Tue, 21 Apr 2020 21:33:05 -0700
Message-Id: <20200422043309.18430-15-richard.henderson@linaro.org>
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
X-TUID: eo9ZU9ra+aO/

Follow the model set up for contiguous loads.  This handles
watchpoints correctly for contiguous stores, recognizing the
exception before any changes to memory.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 285 ++++++++++++++++++++++------------------
 1 file changed, 159 insertions(+), 126 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3473b53928..9389c7c76d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3995,6 +3995,10 @@ static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
     *(TYPEE *)(vd + H(reg_off)) = val;                                 \
 }
 
+#define DO_ST_HOST(NAME, H, TYPEE, TYPEM, HOST) \
+static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
+{ HOST(host, (TYPEM)*(TYPEE *)(vd + H(reg_off))); }
+
 #define DO_LD_TLB(NAME, H, TYPEE, TYPEM, TLB) \
 static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
                              target_ulong addr, uintptr_t ra)               \
@@ -4022,6 +4026,7 @@ DO_LD_PRIM_1(ld1bdu,     , uint64_t, uint8_t)
 DO_LD_PRIM_1(ld1bds,     , uint64_t,  int8_t)
 
 #define DO_ST_PRIM_1(NAME, H, TE, TM)                   \
+    DO_ST_HOST(st1##NAME, H, TE, TM, stb_p)             \
     DO_ST_TLB(st1##NAME, H, TE, TM, cpu_stb_data_ra)
 
 DO_ST_PRIM_1(bb,   H1,  uint8_t, uint8_t)
@@ -4036,6 +4041,8 @@ DO_ST_PRIM_1(bd,     , uint64_t, uint8_t)
     DO_LD_TLB(ld1##NAME##_le, H, TE, TM, cpu_##LD##_le_data_ra)
 
 #define DO_ST_PRIM_2(NAME, H, TE, TM, ST) \
+    DO_ST_HOST(st1##NAME##_be, H, TE, TM, ST##_be_p)    \
+    DO_ST_HOST(st1##NAME##_le, H, TE, TM, ST##_le_p)    \
     DO_ST_TLB(st1##NAME##_be, H, TE, TM, cpu_##ST##_be_data_ra) \
     DO_ST_TLB(st1##NAME##_le, H, TE, TM, cpu_##ST##_le_data_ra)
 
@@ -4904,151 +4911,177 @@ DO_LDFF1_LDNF1_2(dd,  MO_64, MO_64)
 #undef DO_LDFF1_LDNF1_2
 
 /*
- * Common helpers for all contiguous 1,2,3,4-register predicated stores.
+ * Common helper for all contiguous 1,2,3,4-register predicated stores.
  */
-static void sve_st1_r(CPUARMState *env, void *vg, target_ulong addr,
-                      uint32_t desc, const uintptr_t ra,
-                      const int esize, const int msize,
-                      sve_ldst1_tlb_fn *tlb_fn)
+
+static inline QEMU_ALWAYS_INLINE
+void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr, uint32_t desc,
+               const uintptr_t retaddr, const int esz,
+               const int msz, const int N,
+               sve_ldst1_host_fn *host_fn,
+               sve_ldst1_tlb_fn *tlb_fn)
 {
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    void *vd = &env->vfp.zregs[rd];
+    const intptr_t reg_max = simd_oprsz(desc);
+    intptr_t reg_off, reg_last, mem_off;
+    SVEContLdSt info;
+    void *host;
+    int i, flags;
 
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
-        do {
-            if (pg & 1) {
-                tlb_fn(env, vd, i, addr, ra);
+    /* Find the active elements.  */
+    if (!sve_cont_ldst_elements(&info, addr, vg, reg_max, esz, N << msz)) {
+        /* The entire predicate was false; no store occurs.  */
+        return;
+    }
+
+    /* Probe the page(s).  Exit with exception for any invalid page. */
+    sve_cont_ldst_pages(&info, FAULT_ALL, env, addr, MMU_DATA_STORE, retaddr);
+
+    /* Handle watchpoints for all active elements. */
+    sve_cont_ldst_watchpoints(&info, env, vg, addr, 1 << esz, N << msz,
+                              BP_MEM_WRITE, retaddr);
+
+    /* TODO: MTE check. */
+
+    flags = info.page[0].flags | info.page[1].flags;
+    if (unlikely(flags != 0)) {
+#ifdef CONFIG_USER_ONLY
+        g_assert_not_reached();
+#else
+        /*
+         * At least one page includes MMIO.
+         * Any bus operation can fail with cpu_transaction_failed,
+         * which for ARM will raise SyncExternal.  We cannot avoid
+         * this fault and will leave with the store incomplete.
+         */
+        mem_off = info.mem_off_first[0];
+        reg_off = info.reg_off_first[0];
+        reg_last = info.reg_off_last[1];
+        if (reg_last < 0) {
+            reg_last = info.reg_off_split;
+            if (reg_last < 0) {
+                reg_last = info.reg_off_last[0];
             }
-            i += esize, pg >>= esize;
-            addr += msize;
-        } while (i & 15);
+        }
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    for (i = 0; i < N; ++i) {
+                        tlb_fn(env, &env->vfp.zregs[(rd + i) & 31], reg_off,
+                               addr + mem_off + (i << msz), retaddr);
+                    }
+                }
+                reg_off += 1 << esz;
+                mem_off += N << msz;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+        return;
+#endif
+    }
+
+    mem_off = info.mem_off_first[0];
+    reg_off = info.reg_off_first[0];
+    reg_last = info.reg_off_last[0];
+    host = info.page[0].host;
+
+    while (reg_off <= reg_last) {
+        uint64_t pg = vg[reg_off >> 6];
+        do {
+            if ((pg >> (reg_off & 63)) & 1) {
+                for (i = 0; i < N; ++i) {
+                    host_fn(&env->vfp.zregs[(rd + i) & 31], reg_off,
+                            host + mem_off + (i << msz));
+                }
+            }
+            reg_off += 1 << esz;
+            mem_off += N << msz;
+        } while (reg_off <= reg_last && (reg_off & 63));
+    }
+
+    /*
+     * Use the slow path to manage the cross-page misalignment.
+     * But we know this is RAM and cannot trap.
+     */
+    mem_off = info.mem_off_split;
+    if (unlikely(mem_off >= 0)) {
+        reg_off = info.reg_off_split;
+        for (i = 0; i < N; ++i) {
+            tlb_fn(env, &env->vfp.zregs[(rd + i) & 31], reg_off,
+                   addr + mem_off + (i << msz), retaddr);
+        }
+    }
+
+    mem_off = info.mem_off_first[1];
+    if (unlikely(mem_off >= 0)) {
+        reg_off = info.reg_off_first[1];
+        reg_last = info.reg_off_last[1];
+        host = info.page[1].host;
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    for (i = 0; i < N; ++i) {
+                        host_fn(&env->vfp.zregs[(rd + i) & 31], reg_off,
+                                host + mem_off + (i << msz));
+                    }
+                }
+                reg_off += 1 << esz;
+                mem_off += N << msz;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
     }
 }
 
-static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
-                      uint32_t desc, const uintptr_t ra,
-                      const int esize, const int msize,
-                      sve_ldst1_tlb_fn *tlb_fn)
-{
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    void *d1 = &env->vfp.zregs[rd];
-    void *d2 = &env->vfp.zregs[(rd + 1) & 31];
-
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
-        do {
-            if (pg & 1) {
-                tlb_fn(env, d1, i, addr, ra);
-                tlb_fn(env, d2, i, addr + msize, ra);
-            }
-            i += esize, pg >>= esize;
-            addr += 2 * msize;
-        } while (i & 15);
-    }
-}
-
-static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
-                      uint32_t desc, const uintptr_t ra,
-                      const int esize, const int msize,
-                      sve_ldst1_tlb_fn *tlb_fn)
-{
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    void *d1 = &env->vfp.zregs[rd];
-    void *d2 = &env->vfp.zregs[(rd + 1) & 31];
-    void *d3 = &env->vfp.zregs[(rd + 2) & 31];
-
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
-        do {
-            if (pg & 1) {
-                tlb_fn(env, d1, i, addr, ra);
-                tlb_fn(env, d2, i, addr + msize, ra);
-                tlb_fn(env, d3, i, addr + 2 * msize, ra);
-            }
-            i += esize, pg >>= esize;
-            addr += 3 * msize;
-        } while (i & 15);
-    }
-}
-
-static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
-                      uint32_t desc, const uintptr_t ra,
-                      const int esize, const int msize,
-                      sve_ldst1_tlb_fn *tlb_fn)
-{
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    void *d1 = &env->vfp.zregs[rd];
-    void *d2 = &env->vfp.zregs[(rd + 1) & 31];
-    void *d3 = &env->vfp.zregs[(rd + 2) & 31];
-    void *d4 = &env->vfp.zregs[(rd + 3) & 31];
-
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
-        do {
-            if (pg & 1) {
-                tlb_fn(env, d1, i, addr, ra);
-                tlb_fn(env, d2, i, addr + msize, ra);
-                tlb_fn(env, d3, i, addr + 2 * msize, ra);
-                tlb_fn(env, d4, i, addr + 3 * msize, ra);
-            }
-            i += esize, pg >>= esize;
-            addr += 4 * msize;
-        } while (i & 15);
-    }
-}
-
-#define DO_STN_1(N, NAME, ESIZE) \
-void QEMU_FLATTEN HELPER(sve_st##N##NAME##_r) \
-    (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)  \
+#define DO_STN_1(N, NAME, ESZ) \
+void HELPER(sve_st##N##NAME##_r)(CPUARMState *env, void *vg,        \
+                                 target_ulong addr, uint32_t desc)  \
 {                                                                   \
-    sve_st##N##_r(env, vg, addr, desc, GETPC(), ESIZE, 1,           \
-                  sve_st1##NAME##_tlb);                             \
+    sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, N,           \
+              sve_st1##NAME##_host, sve_st1##NAME##_tlb);           \
 }
 
-#define DO_STN_2(N, NAME, ESIZE, MSIZE) \
-void QEMU_FLATTEN HELPER(sve_st##N##NAME##_le_r) \
-    (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
+#define DO_STN_2(N, NAME, ESZ, MSZ) \
+void HELPER(sve_st##N##NAME##_le_r)(CPUARMState *env, void *vg,       \
+                                    target_ulong addr, uint32_t desc) \
 {                                                                     \
-    sve_st##N##_r(env, vg, addr, desc, GETPC(), ESIZE, MSIZE,         \
-                  sve_st1##NAME##_le_tlb);                            \
+    sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, N,              \
+              sve_st1##NAME##_le_host, sve_st1##NAME##_le_tlb);       \
 }                                                                     \
-void QEMU_FLATTEN HELPER(sve_st##N##NAME##_be_r)                      \
-    (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
+void HELPER(sve_st##N##NAME##_be_r)(CPUARMState *env, void *vg,       \
+                                    target_ulong addr, uint32_t desc) \
 {                                                                     \
-    sve_st##N##_r(env, vg, addr, desc, GETPC(), ESIZE, MSIZE,         \
-                  sve_st1##NAME##_be_tlb);                            \
+    sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, N,              \
+              sve_st1##NAME##_be_host, sve_st1##NAME##_be_tlb);       \
 }
 
-DO_STN_1(1, bb, 1)
-DO_STN_1(1, bh, 2)
-DO_STN_1(1, bs, 4)
-DO_STN_1(1, bd, 8)
-DO_STN_1(2, bb, 1)
-DO_STN_1(3, bb, 1)
-DO_STN_1(4, bb, 1)
+DO_STN_1(1, bb, MO_8)
+DO_STN_1(1, bh, MO_16)
+DO_STN_1(1, bs, MO_32)
+DO_STN_1(1, bd, MO_64)
+DO_STN_1(2, bb, MO_8)
+DO_STN_1(3, bb, MO_8)
+DO_STN_1(4, bb, MO_8)
 
-DO_STN_2(1, hh, 2, 2)
-DO_STN_2(1, hs, 4, 2)
-DO_STN_2(1, hd, 8, 2)
-DO_STN_2(2, hh, 2, 2)
-DO_STN_2(3, hh, 2, 2)
-DO_STN_2(4, hh, 2, 2)
+DO_STN_2(1, hh, MO_16, MO_16)
+DO_STN_2(1, hs, MO_32, MO_16)
+DO_STN_2(1, hd, MO_64, MO_16)
+DO_STN_2(2, hh, MO_16, MO_16)
+DO_STN_2(3, hh, MO_16, MO_16)
+DO_STN_2(4, hh, MO_16, MO_16)
 
-DO_STN_2(1, ss, 4, 4)
-DO_STN_2(1, sd, 8, 4)
-DO_STN_2(2, ss, 4, 4)
-DO_STN_2(3, ss, 4, 4)
-DO_STN_2(4, ss, 4, 4)
+DO_STN_2(1, ss, MO_32, MO_32)
+DO_STN_2(1, sd, MO_64, MO_32)
+DO_STN_2(2, ss, MO_32, MO_32)
+DO_STN_2(3, ss, MO_32, MO_32)
+DO_STN_2(4, ss, MO_32, MO_32)
 
-DO_STN_2(1, dd, 8, 8)
-DO_STN_2(2, dd, 8, 8)
-DO_STN_2(3, dd, 8, 8)
-DO_STN_2(4, dd, 8, 8)
+DO_STN_2(1, dd, MO_64, MO_64)
+DO_STN_2(2, dd, MO_64, MO_64)
+DO_STN_2(3, dd, MO_64, MO_64)
+DO_STN_2(4, dd, MO_64, MO_64)
 
 #undef DO_STN_1
 #undef DO_STN_2
-- 
2.20.1

