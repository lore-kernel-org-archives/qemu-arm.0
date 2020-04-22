Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp194993lfm;
        Tue, 21 Apr 2020 21:36:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypLjZEhAEStEHwK/a/Mv+M+lM3Fx0ju63EsvyrGBj4GGb1/ux1mqGleB+WSDCH+SURz5naru
X-Received: by 2002:ae9:ebc8:: with SMTP id b191mr23689275qkg.1.1587530205974;
        Tue, 21 Apr 2020 21:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587530205; cv=none;
        d=google.com; s=arc-20160816;
        b=VDHJZNegzRLhXSY19wKZlr+T0Fz4g1Aky15GxfN3wDlEXReA65XmDaOpECbqIjYPyK
         LS1zJgT2mWkyQjpnc61DX9qFpnrm6vwceAeNkA7h6wTtcoMT/YZ6FV1L/yEBU713KSWG
         2QsvhtZ5SiNItp97H03/fZSTD9JhGSHVupfLEI32j/xeRvqaRwDdYzy9SliP3TpmxkSa
         R5KiTX3GpDO3G/8vxGJ6T4PQliIngPo5gl/v9WPI1Sgna5waXu8GKXrANSzdkjqSYQT9
         LJeMRO/AnDKO2eT+UGshwHwfLydD7rJCs/YayJ1axf6n+3qmCgrWLBMWmWyUDVkIpdC3
         xLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9amWqshE7k/NAq9a276bjEryeqReUJxYJNXk6wnm0Gs=;
        b=I2K3BisBfuM4FXjJ/5ddP/YAfVUk+lPxnUvrZVukQbMY/eUsC5rmMaI4NShFgmzUY0
         dYkvdAO3Tjo4bhbKON4qXy9ttUbUu8kM83/aGX66kQIcPB3WaNQzFaDxodmJL7mABHr5
         +vlCE+hGyd1fu+smiBhaqcInSIm+uiTRZvrWCbbcMgGWdQAUaI4sarTgnJgnJZMQvIK4
         +TtXJRfZ60e58b525OnYm5rX/1SbZlOC3W3kpSey/bOOn6RmhZlSeeD/wAr/LJeCLsBC
         Df6pvcxWoMs0YZkY4+TmAGW1+Sb0QkVGJBbxweDdgMi8lZU4wDTbjtq1dNHPQuyxaqai
         RY7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L6aI8/Aa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n25si2507480qkg.215.2020.04.21.21.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:36:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L6aI8/Aa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR77t-0005uU-5U
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50670)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74n-0000v0-Ik
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74k-0005la-VO
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:33 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:50661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR74k-0005Zb-Eq
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:30 -0400
Received: by mail-pj1-x1042.google.com with SMTP id t9so354584pjw.0
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9amWqshE7k/NAq9a276bjEryeqReUJxYJNXk6wnm0Gs=;
 b=L6aI8/AaePKUmLWkH5eJ5ORLDsUfOSxjqUkGmV1d5iecMehEqtqzbzVWEM0INGaFht
 b+hNdyq5yecu2WYRVpK7WcBSch99brb3memU+hc6J7LEurbG/VG6I8z/A3hyRVEgkR4r
 zp9d3r0cEwWfJbbtWbzSDFwGqN0piODENwe5pxaaGe3D29SB3BKx+511gZrZ0+PIpF0w
 J13qS15xS3xwXEJTO35S1I9Q2WLYB99UMnBsOmb4vIWETVUA5UcR6HuEwag4EQ0hs5eA
 gcJUpjdz4dqukuCameZY8vi8aoGkCu9FNvrGM6skhqkiF6uTREDSxuVAZ5/Zm8jftOBQ
 VHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9amWqshE7k/NAq9a276bjEryeqReUJxYJNXk6wnm0Gs=;
 b=eoPgOJqMEBHW7PLDD4eJDI0/KgEPYv/1JTbpsenxHRrQhOBXl8xKUqwG9y2CbPRzgn
 rAx9LOEk1lKg7Ki4sRZh6Ph8BlNHf5GVw1dYnaqPRfv3U/hVYqWmCLP8+0iqMWRfOMFD
 N58XNW6q3MpqHzh5Wpo4/v0sViPgUyWNNiLfn467rUtgE8jxVGaV3GtFFWlU8d91jmZR
 i8Chdeo5bJp3Ii1NNqhQRGRufnjtDzkieO7seg5TQpTqNjz8RMoW07p92bnvKCPDVx0s
 z0JBjQBTW6/cStFWD7/MC7fN2GTiNXubClY7+J+F+li4un2F+uLbJ0/dqGoFrz9Gvflx
 sqrQ==
X-Gm-Message-State: AGi0PuYZuYh1/dlfHWvlWs2DA2jjZJ9CvCRiJmtfbdIhEz9yTpHaR+mR
 xGimk4P0LPEHofOUkShizA8MLg==
X-Received: by 2002:a17:90a:1da6:: with SMTP id
 v35mr10044180pjv.44.1587530007896; 
 Tue, 21 Apr 2020 21:33:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm4129613pfd.107.2020.04.21.21.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 21:33:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/18] target/arm: Use SVEContLdSt for multi-register
 contiguous loads
Date: Tue, 21 Apr 2020 21:33:03 -0700
Message-Id: <20200422043309.18430-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200422043309.18430-1-richard.henderson@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1042
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
X-TUID: SrUWgozZkhqc

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 223 ++++++++++++++--------------------------
 1 file changed, 79 insertions(+), 144 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7992a569b0..9365e32646 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4449,27 +4449,28 @@ static inline bool test_host_page(void *host)
 }
 
 /*
- * Common helper for all contiguous one-register predicated loads.
+ * Common helper for all contiguous 1,2,3,4-register predicated stores.
  */
 static inline QEMU_ALWAYS_INLINE
-void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
+void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
                uint32_t desc, const uintptr_t retaddr,
-               const int esz, const int msz,
+               const int esz, const int msz, const int N,
                sve_ldst1_host_fn *host_fn,
                sve_ldst1_tlb_fn *tlb_fn)
 {
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    void *vd = &env->vfp.zregs[rd];
     const intptr_t reg_max = simd_oprsz(desc);
     intptr_t reg_off, reg_last, mem_off;
     SVEContLdSt info;
     void *host;
-    int flags;
+    int flags, i;
 
     /* Find the active elements.  */
-    if (!sve_cont_ldst_elements(&info, addr, vg, reg_max, esz, 1 << msz)) {
+    if (!sve_cont_ldst_elements(&info, addr, vg, reg_max, esz, N << msz)) {
         /* The entire predicate was false; no load occurs.  */
-        memset(vd, 0, reg_max);
+        for (i = 0; i < N; ++i) {
+            memset(&env->vfp.zregs[(rd + i) & 31], 0, reg_max);
+        }
         return;
     }
 
@@ -4477,7 +4478,7 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
     sve_cont_ldst_pages(&info, FAULT_ALL, env, addr, MMU_DATA_LOAD, retaddr);
 
     /* Handle watchpoints for all active elements. */
-    sve_cont_ldst_watchpoints(&info, env, vg, addr, 1 << esz, 1 << msz,
+    sve_cont_ldst_watchpoints(&info, env, vg, addr, 1 << esz, N << msz,
                               BP_MEM_READ, retaddr);
 
     /* TODO: MTE check. */
@@ -4493,9 +4494,8 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
          * which for ARM will raise SyncExternal.  Perform the load
          * into scratch memory to preserve register state until the end.
          */
-        ARMVectorReg scratch;
+        ARMVectorReg scratch[4] = { };
 
-        memset(&scratch, 0, reg_max);
         mem_off = info.mem_off_first[0];
         reg_off = info.reg_off_first[0];
         reg_last = info.reg_off_last[1];
@@ -4510,21 +4510,29 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
             uint64_t pg = vg[reg_off >> 6];
             do {
                 if ((pg >> (reg_off & 63)) & 1) {
-                    tlb_fn(env, &scratch, reg_off, addr + mem_off, retaddr);
+                    for (i = 0; i < N; ++i) {
+                        tlb_fn(env, &scratch[i], reg_off,
+                               addr + mem_off + (i << msz), retaddr);
+                    }
                 }
                 reg_off += 1 << esz;
-                mem_off += 1 << msz;
+                mem_off += N << msz;
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
 
-        memcpy(vd, &scratch, reg_max);
+        for (i = 0; i < N; ++i) {
+            memcpy(&env->vfp.zregs[(rd + i) & 31], &scratch[i], reg_max);
+        }
         return;
 #endif
     }
 
     /* The entire operation is in RAM, on valid pages. */
 
-    memset(vd, 0, reg_max);
+    for (i = 0; i < N; ++i) {
+        memset(&env->vfp.zregs[(rd + i) & 31], 0, reg_max);
+    }
+
     mem_off = info.mem_off_first[0];
     reg_off = info.reg_off_first[0];
     reg_last = info.reg_off_last[0];
@@ -4534,10 +4542,13 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
         uint64_t pg = vg[reg_off >> 6];
         do {
             if ((pg >> (reg_off & 63)) & 1) {
-                host_fn(vd, reg_off, host + mem_off);
+                for (i = 0; i < N; ++i) {
+                    host_fn(&env->vfp.zregs[(rd + i) & 31], reg_off,
+                            host + mem_off + (i << msz));
+                }
             }
             reg_off += 1 << esz;
-            mem_off += 1 << msz;
+            mem_off += N << msz;
         } while (reg_off <= reg_last && (reg_off & 63));
     }
 
@@ -4547,7 +4558,11 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
      */
     mem_off = info.mem_off_split;
     if (unlikely(mem_off >= 0)) {
-        tlb_fn(env, vd, info.reg_off_split, addr + mem_off, retaddr);
+        reg_off = info.reg_off_split;
+        for (i = 0; i < N; ++i) {
+            tlb_fn(env, &env->vfp.zregs[(rd + i) & 31], reg_off,
+                   addr + mem_off + (i << msz), retaddr);
+        }
     }
 
     mem_off = info.mem_off_first[1];
@@ -4560,10 +4575,13 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
             uint64_t pg = vg[reg_off >> 6];
             do {
                 if ((pg >> (reg_off & 63)) & 1) {
-                    host_fn(vd, reg_off, host + mem_off);
+                    for (i = 0; i < N; ++i) {
+                        host_fn(&env->vfp.zregs[(rd + i) & 31], reg_off,
+                                host + mem_off + (i << msz));
+                    }
                 }
                 reg_off += 1 << esz;
-                mem_off += 1 << msz;
+                mem_off += N << msz;
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
     }
@@ -4573,7 +4591,7 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
 void HELPER(sve_##NAME##_r)(CPUARMState *env, void *vg,        \
                             target_ulong addr, uint32_t desc)  \
 {                                                              \
-    sve_ld1_r(env, vg, addr, desc, GETPC(), ESZ, 0,            \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, 1,      \
               sve_##NAME##_host, sve_##NAME##_tlb);            \
 }
 
@@ -4581,159 +4599,76 @@ void HELPER(sve_##NAME##_r)(CPUARMState *env, void *vg,        \
 void HELPER(sve_##NAME##_le_r)(CPUARMState *env, void *vg,        \
                                target_ulong addr, uint32_t desc)  \
 {                                                                 \
-    sve_ld1_r(env, vg, addr, desc, GETPC(), ESZ, MSZ,             \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,          \
               sve_##NAME##_le_host, sve_##NAME##_le_tlb);         \
 }                                                                 \
 void HELPER(sve_##NAME##_be_r)(CPUARMState *env, void *vg,        \
                                target_ulong addr, uint32_t desc)  \
 {                                                                 \
-    sve_ld1_r(env, vg, addr, desc, GETPC(), ESZ, MSZ,             \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,          \
               sve_##NAME##_be_host, sve_##NAME##_be_tlb);         \
 }
 
-DO_LD1_1(ld1bb,  0)
-DO_LD1_1(ld1bhu, 1)
-DO_LD1_1(ld1bhs, 1)
-DO_LD1_1(ld1bsu, 2)
-DO_LD1_1(ld1bss, 2)
-DO_LD1_1(ld1bdu, 3)
-DO_LD1_1(ld1bds, 3)
+DO_LD1_1(ld1bb,  MO_8)
+DO_LD1_1(ld1bhu, MO_16)
+DO_LD1_1(ld1bhs, MO_16)
+DO_LD1_1(ld1bsu, MO_32)
+DO_LD1_1(ld1bss, MO_32)
+DO_LD1_1(ld1bdu, MO_64)
+DO_LD1_1(ld1bds, MO_64)
 
-DO_LD1_2(ld1hh,  1, 1)
-DO_LD1_2(ld1hsu, 2, 1)
-DO_LD1_2(ld1hss, 2, 1)
-DO_LD1_2(ld1hdu, 3, 1)
-DO_LD1_2(ld1hds, 3, 1)
+DO_LD1_2(ld1hh,  MO_16, MO_16)
+DO_LD1_2(ld1hsu, MO_32, MO_16)
+DO_LD1_2(ld1hss, MO_32, MO_16)
+DO_LD1_2(ld1hdu, MO_64, MO_16)
+DO_LD1_2(ld1hds, MO_64, MO_16)
 
-DO_LD1_2(ld1ss,  2, 2)
-DO_LD1_2(ld1sdu, 3, 2)
-DO_LD1_2(ld1sds, 3, 2)
+DO_LD1_2(ld1ss,  MO_32, MO_32)
+DO_LD1_2(ld1sdu, MO_64, MO_32)
+DO_LD1_2(ld1sds, MO_64, MO_32)
 
-DO_LD1_2(ld1dd,  3, 3)
+DO_LD1_2(ld1dd,  MO_64, MO_64)
 
 #undef DO_LD1_1
 #undef DO_LD1_2
 
-/*
- * Common helpers for all contiguous 2,3,4-register predicated loads.
- */
-static void sve_ld2_r(CPUARMState *env, void *vg, target_ulong addr,
-                      uint32_t desc, int size, uintptr_t ra,
-                      sve_ldst1_tlb_fn *tlb_fn)
-{
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    ARMVectorReg scratch[2] = { };
-
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
-        do {
-            if (pg & 1) {
-                tlb_fn(env, &scratch[0], i, addr, ra);
-                tlb_fn(env, &scratch[1], i, addr + size, ra);
-            }
-            i += size, pg >>= size;
-            addr += 2 * size;
-        } while (i & 15);
-    }
-
-    /* Wait until all exceptions have been raised to write back.  */
-    memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 1) & 31], &scratch[1], oprsz);
-}
-
-static void sve_ld3_r(CPUARMState *env, void *vg, target_ulong addr,
-                      uint32_t desc, int size, uintptr_t ra,
-                      sve_ldst1_tlb_fn *tlb_fn)
-{
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    ARMVectorReg scratch[3] = { };
-
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
-        do {
-            if (pg & 1) {
-                tlb_fn(env, &scratch[0], i, addr, ra);
-                tlb_fn(env, &scratch[1], i, addr + size, ra);
-                tlb_fn(env, &scratch[2], i, addr + 2 * size, ra);
-            }
-            i += size, pg >>= size;
-            addr += 3 * size;
-        } while (i & 15);
-    }
-
-    /* Wait until all exceptions have been raised to write back.  */
-    memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 1) & 31], &scratch[1], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 2) & 31], &scratch[2], oprsz);
-}
-
-static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
-                      uint32_t desc, int size, uintptr_t ra,
-                      sve_ldst1_tlb_fn *tlb_fn)
-{
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    ARMVectorReg scratch[4] = { };
-
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
-        do {
-            if (pg & 1) {
-                tlb_fn(env, &scratch[0], i, addr, ra);
-                tlb_fn(env, &scratch[1], i, addr + size, ra);
-                tlb_fn(env, &scratch[2], i, addr + 2 * size, ra);
-                tlb_fn(env, &scratch[3], i, addr + 3 * size, ra);
-            }
-            i += size, pg >>= size;
-            addr += 4 * size;
-        } while (i & 15);
-    }
-
-    /* Wait until all exceptions have been raised to write back.  */
-    memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 1) & 31], &scratch[1], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 2) & 31], &scratch[2], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 3) & 31], &scratch[3], oprsz);
-}
-
 #define DO_LDN_1(N) \
-void QEMU_FLATTEN HELPER(sve_ld##N##bb_r) \
-    (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)  \
-{                                                                   \
-    sve_ld##N##_r(env, vg, addr, desc, 1, GETPC(), sve_ld1bb_tlb);  \
+void HELPER(sve_ld##N##bb_r)(CPUARMState *env, void *vg,        \
+                             target_ulong addr, uint32_t desc)  \
+{                                                               \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), MO_8, MO_8, N,      \
+              sve_ld1bb_host, sve_ld1bb_tlb);                   \
 }
 
-#define DO_LDN_2(N, SUFF, SIZE)                                       \
-void QEMU_FLATTEN HELPER(sve_ld##N##SUFF##_le_r)                      \
-    (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
+#define DO_LDN_2(N, SUFF, ESZ) \
+void HELPER(sve_ld##N##SUFF##_le_r)(CPUARMState *env, void *vg,       \
+                                    target_ulong addr, uint32_t desc) \
 {                                                                     \
-    sve_ld##N##_r(env, vg, addr, desc, SIZE, GETPC(),                 \
-                  sve_ld1##SUFF##_le_tlb);                            \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,              \
+              sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb);       \
 }                                                                     \
-void QEMU_FLATTEN HELPER(sve_ld##N##SUFF##_be_r)                      \
-    (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
+void HELPER(sve_ld##N##SUFF##_be_r)(CPUARMState *env, void *vg,       \
+                                    target_ulong addr, uint32_t desc) \
 {                                                                     \
-    sve_ld##N##_r(env, vg, addr, desc, SIZE, GETPC(),                 \
-                  sve_ld1##SUFF##_be_tlb);                            \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,              \
+              sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb);       \
 }
 
 DO_LDN_1(2)
 DO_LDN_1(3)
 DO_LDN_1(4)
 
-DO_LDN_2(2, hh, 2)
-DO_LDN_2(3, hh, 2)
-DO_LDN_2(4, hh, 2)
+DO_LDN_2(2, hh, MO_16)
+DO_LDN_2(3, hh, MO_16)
+DO_LDN_2(4, hh, MO_16)
 
-DO_LDN_2(2, ss, 4)
-DO_LDN_2(3, ss, 4)
-DO_LDN_2(4, ss, 4)
+DO_LDN_2(2, ss, MO_32)
+DO_LDN_2(3, ss, MO_32)
+DO_LDN_2(4, ss, MO_32)
 
-DO_LDN_2(2, dd, 8)
-DO_LDN_2(3, dd, 8)
-DO_LDN_2(4, dd, 8)
+DO_LDN_2(2, dd, MO_64)
+DO_LDN_2(3, dd, MO_64)
+DO_LDN_2(4, dd, MO_64)
 
 #undef DO_LDN_1
 #undef DO_LDN_2
-- 
2.20.1

