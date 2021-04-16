Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp629296lfr;
        Fri, 16 Apr 2021 11:31:16 -0700 (PDT)
X-Received: by 2002:aa7:87d5:0:b029:25a:b5f8:15ab with SMTP id i21-20020aa787d50000b029025ab5f815abmr2641359pfo.22.1618597876367;
        Fri, 16 Apr 2021 11:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618597876; cv=none;
        d=google.com; s=arc-20160816;
        b=kCApvy9WaY91cPZM6CGo5ioo7XriJ8AhtZLIQVjjUkgHzsm2oLO+WzVvVzmEKFiPYN
         ejY9/WTn0dMI9ZVTouXaWqqszqhYJFEcJoqtkGBNWWcN45NQLkeiTfFVOGrmiIMsLWyW
         uhVrcxCatwKNytR9hQg3msHw9mT8YfxqRShrbgvtlmSr6MY/vi+IsCiWWfQg/dI+rWuM
         mLU617p24VDXnbYt/OtJPxf9bBet/fR7ZdsKvYuDDkF4NaWd4lYpBwz51hNIAPTkNROj
         NLARo25UbvfboWsBbqjp0iOKAod/n3qXrhgScX+pYSx7l3Q+Nfm6noDQaGQ75XOvHDFZ
         dfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8Qvhuw34Dusu23xRHrsMIFmgKEs+N9tm6FJ3fDOSwZQ=;
        b=U1iGOuWMJ8Y1FgqRDPIhsTTNMIYtvNHD99WPWe7CHQZJaJJi7KtrOVtnHevFvuPl8q
         ddnG/Zfl4VBiLogczpkWcrafBY6BZbc7oYQjNVi04FoXaEYsGZGTDf41QjnNVj3rBhlM
         zvr1g7sTXnVk/rREp+jM6ESzM98uhT3c82ED4DQIFy8Buotn46bAZrxJdzFpnMSq4uuX
         FxpTXSl5FqHh/MSaYOp0zPD6uVTFJht7NbrsMQ7Lx4jE/Bx7WjcYG5zO/NiYDJJsACuV
         dn9XDnNd0TY3KcVlDJXrBTgF3L0hyUYHl/rHgzJS5/0PAq7CsziJQJP35v+022XWKoTi
         scvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r71H/evk";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t14sor3483502pgu.40.2021.04.16.11.31.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Apr 2021 11:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r71H/evk";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Qvhuw34Dusu23xRHrsMIFmgKEs+N9tm6FJ3fDOSwZQ=;
        b=r71H/evkjlmm7kTPZiLuLgY3lwkKHQ1aCYC3tJ4pj4Up0xJma1vrnDaKVfgPvMzgb0
         BxlSK14IeM6Ti0po4tti8Lck516zZL2mlXMYnQw3bMS2km1m9pT+1ZJhGyjkOY2HRA/e
         AJJ1lnjTOkHn3KfG8MroH8XS5fb+RmO3pv7AF3zonTBNKhuw+lZ8hhLKodEAHM+nsA1s
         BcY7k4GQQqg/wqkjCBNQ14s32IwAHmQ+E7GAFDx4v24bS5PzFn/IPxpMa3alR8CBMvI+
         CoASXtEAJMoKZrJGnRWsE0AZYS/zniS2S9onge19XLrFc8AJN70rPZHeBMPUjppu1cVN
         sqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Qvhuw34Dusu23xRHrsMIFmgKEs+N9tm6FJ3fDOSwZQ=;
        b=RrrMoM4DWSdVDhtwKGV9IItu5zmITSQipfL27d+8/j/dsfBdeSpx7qznZDFkbkyq8x
         GcEhOe59K04/knanAAw75XKlY9CxaIBNo/PVmDvvpW3ZWCsLGN5Sn0hUiH8E1aohQSPZ
         PVmNwtl7Q3c4OZVnphJsOy1O32qUNYDZ4sVuHRTrRj4N3XHg2Cfezc1P6XmxR3u8OSK4
         KFmTXfVW9iL7hTa3dhDaHOYN03lC7agya5LF3Cn28/xIYKBPGzbe6MvPohjSWFJnZUTQ
         u6vcHLN2MHWXHiI9yULBXX8PVybV8rMSQj/rY9yI+/7noAZokvaZbO17mwZRlvFx++pe
         H/Hg==
X-Gm-Message-State: AOAM531a0L1wTj+dD7gbyLSs7Iyv/SjtkI1pgSGXTPIsoA81PsBQtvpY
	Yv5G6yTPMaPSWYrASwUw8XTM4LWM9W02tYw9
X-Google-Smtp-Source: ABdhPJx3BLyE6y4Z8ZD3g9Lmj+KHGfgwRPNekzMcpoa4EgP55W2aklhQPoCTE/YPH8bQphdQIXvQOg==
X-Received: by 2002:a63:120e:: with SMTP id h14mr406926pgl.48.1618597875781;
        Fri, 16 Apr 2021 11:31:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:31:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 8/9] target/arm: Simplify sve mte checking
Date: Fri, 16 Apr 2021 11:31:05 -0700
Message-Id: <20210416183106.1516563-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RAVrr8RhwrYa

Now that mte_check1 and mte_checkN have been merged, we can
merge sve_cont_ldst_mte_check1 and sve_cont_ldst_mte_checkN.

Which means that we can eliminate the function pointer into
sve_ldN_r and sve_stN_r, calling sve_cont_ldst_mte_check directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 84 +++++++++++++----------------------------
 1 file changed, 26 insertions(+), 58 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 982240d104..c068dfa0d5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4382,13 +4382,9 @@ static void sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env,
 #endif
 }
 
-typedef uint64_t mte_check_fn(CPUARMState *, uint32_t, uint64_t, uintptr_t);
-
-static inline QEMU_ALWAYS_INLINE
-void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
-                                 uint64_t *vg, target_ulong addr, int esize,
-                                 int msize, uint32_t mtedesc, uintptr_t ra,
-                                 mte_check_fn *check)
+static void sve_cont_ldst_mte_check(SVEContLdSt *info, CPUARMState *env,
+                                    uint64_t *vg, target_ulong addr, int esize,
+                                    int msize, uint32_t mtedesc, uintptr_t ra)
 {
     intptr_t mem_off, reg_off, reg_last;
 
@@ -4405,7 +4401,7 @@ void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
             uint64_t pg = vg[reg_off >> 6];
             do {
                 if ((pg >> (reg_off & 63)) & 1) {
-                    check(env, mtedesc, addr, ra);
+                    mte_check(env, mtedesc, addr, ra);
                 }
                 reg_off += esize;
                 mem_off += msize;
@@ -4422,7 +4418,7 @@ void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
             uint64_t pg = vg[reg_off >> 6];
             do {
                 if ((pg >> (reg_off & 63)) & 1) {
-                    check(env, mtedesc, addr, ra);
+                    mte_check(env, mtedesc, addr, ra);
                 }
                 reg_off += esize;
                 mem_off += msize;
@@ -4431,30 +4427,6 @@ void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
     }
 }
 
-typedef void sve_cont_ldst_mte_check_fn(SVEContLdSt *info, CPUARMState *env,
-                                        uint64_t *vg, target_ulong addr,
-                                        int esize, int msize, uint32_t mtedesc,
-                                        uintptr_t ra);
-
-static void sve_cont_ldst_mte_check1(SVEContLdSt *info, CPUARMState *env,
-                                     uint64_t *vg, target_ulong addr,
-                                     int esize, int msize, uint32_t mtedesc,
-                                     uintptr_t ra)
-{
-    sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
-                                mtedesc, ra, mte_check);
-}
-
-static void sve_cont_ldst_mte_checkN(SVEContLdSt *info, CPUARMState *env,
-                                     uint64_t *vg, target_ulong addr,
-                                     int esize, int msize, uint32_t mtedesc,
-                                     uintptr_t ra)
-{
-    sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
-                                mtedesc, ra, mte_check);
-}
-
-
 /*
  * Common helper for all contiguous 1,2,3,4-register predicated stores.
  */
@@ -4463,8 +4435,7 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
                uint32_t desc, const uintptr_t retaddr,
                const int esz, const int msz, const int N, uint32_t mtedesc,
                sve_ldst1_host_fn *host_fn,
-               sve_ldst1_tlb_fn *tlb_fn,
-               sve_cont_ldst_mte_check_fn *mte_check_fn)
+               sve_ldst1_tlb_fn *tlb_fn)
 {
     const unsigned rd = simd_data(desc);
     const intptr_t reg_max = simd_oprsz(desc);
@@ -4493,9 +4464,9 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
      * Handle mte checks for all active elements.
      * Since TBI must be set for MTE, !mtedesc => !mte_active.
      */
-    if (mte_check_fn && mtedesc) {
-        mte_check_fn(&info, env, vg, addr, 1 << esz, N << msz,
-                     mtedesc, retaddr);
+    if (mtedesc) {
+        sve_cont_ldst_mte_check(&info, env, vg, addr, 1 << esz, N << msz,
+                                mtedesc, retaddr);
     }
 
     flags = info.page[0].flags | info.page[1].flags;
@@ -4621,8 +4592,7 @@ void sve_ldN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
         mtedesc = 0;
     }
 
-    sve_ldN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn,
-              N == 1 ? sve_cont_ldst_mte_check1 : sve_cont_ldst_mte_checkN);
+    sve_ldN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn);
 }
 
 #define DO_LD1_1(NAME, ESZ)                                             \
@@ -4630,7 +4600,7 @@ void HELPER(sve_##NAME##_r)(CPUARMState *env, void *vg,                 \
                             target_ulong addr, uint32_t desc)           \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, 1, 0,            \
-              sve_##NAME##_host, sve_##NAME##_tlb, NULL);               \
+              sve_##NAME##_host, sve_##NAME##_tlb);                     \
 }                                                                       \
 void HELPER(sve_##NAME##_r_mte)(CPUARMState *env, void *vg,             \
                                 target_ulong addr, uint32_t desc)       \
@@ -4644,22 +4614,22 @@ void HELPER(sve_##NAME##_le_r)(CPUARMState *env, void *vg,              \
                                target_ulong addr, uint32_t desc)        \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1, 0,             \
-              sve_##NAME##_le_host, sve_##NAME##_le_tlb, NULL);         \
+              sve_##NAME##_le_host, sve_##NAME##_le_tlb);               \
 }                                                                       \
 void HELPER(sve_##NAME##_be_r)(CPUARMState *env, void *vg,              \
                                target_ulong addr, uint32_t desc)        \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1, 0,             \
-              sve_##NAME##_be_host, sve_##NAME##_be_tlb, NULL);         \
+              sve_##NAME##_be_host, sve_##NAME##_be_tlb);               \
 }                                                                       \
 void HELPER(sve_##NAME##_le_r_mte)(CPUARMState *env, void *vg,          \
-                                 target_ulong addr, uint32_t desc)      \
+                                   target_ulong addr, uint32_t desc)    \
 {                                                                       \
     sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,            \
                   sve_##NAME##_le_host, sve_##NAME##_le_tlb);           \
 }                                                                       \
 void HELPER(sve_##NAME##_be_r_mte)(CPUARMState *env, void *vg,          \
-                                 target_ulong addr, uint32_t desc)      \
+                                   target_ulong addr, uint32_t desc)    \
 {                                                                       \
     sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,            \
                   sve_##NAME##_be_host, sve_##NAME##_be_tlb);           \
@@ -4693,7 +4663,7 @@ void HELPER(sve_ld##N##bb_r)(CPUARMState *env, void *vg,                \
                              target_ulong addr, uint32_t desc)          \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), MO_8, MO_8, N, 0,           \
-              sve_ld1bb_host, sve_ld1bb_tlb, NULL);                     \
+              sve_ld1bb_host, sve_ld1bb_tlb);                           \
 }                                                                       \
 void HELPER(sve_ld##N##bb_r_mte)(CPUARMState *env, void *vg,            \
                                  target_ulong addr, uint32_t desc)      \
@@ -4707,13 +4677,13 @@ void HELPER(sve_ld##N##SUFF##_le_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N, 0,             \
-              sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb, NULL);   \
+              sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb);         \
 }                                                                       \
 void HELPER(sve_ld##N##SUFF##_be_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N, 0,             \
-              sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb, NULL);   \
+              sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb);         \
 }                                                                       \
 void HELPER(sve_ld##N##SUFF##_le_r_mte)(CPUARMState *env, void *vg,     \
                                         target_ulong addr, uint32_t desc) \
@@ -5090,8 +5060,7 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
                uint32_t desc, const uintptr_t retaddr,
                const int esz, const int msz, const int N, uint32_t mtedesc,
                sve_ldst1_host_fn *host_fn,
-               sve_ldst1_tlb_fn *tlb_fn,
-               sve_cont_ldst_mte_check_fn *mte_check_fn)
+               sve_ldst1_tlb_fn *tlb_fn)
 {
     const unsigned rd = simd_data(desc);
     const intptr_t reg_max = simd_oprsz(desc);
@@ -5117,9 +5086,9 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
      * Handle mte checks for all active elements.
      * Since TBI must be set for MTE, !mtedesc => !mte_active.
      */
-    if (mte_check_fn && mtedesc) {
-        mte_check_fn(&info, env, vg, addr, 1 << esz, N << msz,
-                     mtedesc, retaddr);
+    if (mtedesc) {
+        sve_cont_ldst_mte_check(&info, env, vg, addr, 1 << esz, N << msz,
+                                mtedesc, retaddr);
     }
 
     flags = info.page[0].flags | info.page[1].flags;
@@ -5233,8 +5202,7 @@ void sve_stN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
         mtedesc = 0;
     }
 
-    sve_stN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn,
-              N == 1 ? sve_cont_ldst_mte_check1 : sve_cont_ldst_mte_checkN);
+    sve_stN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn);
 }
 
 #define DO_STN_1(N, NAME, ESZ)                                          \
@@ -5242,7 +5210,7 @@ void HELPER(sve_st##N##NAME##_r)(CPUARMState *env, void *vg,            \
                                  target_ulong addr, uint32_t desc)      \
 {                                                                       \
     sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, N, 0,            \
-              sve_st1##NAME##_host, sve_st1##NAME##_tlb, NULL);         \
+              sve_st1##NAME##_host, sve_st1##NAME##_tlb);               \
 }                                                                       \
 void HELPER(sve_st##N##NAME##_r_mte)(CPUARMState *env, void *vg,        \
                                      target_ulong addr, uint32_t desc)  \
@@ -5256,13 +5224,13 @@ void HELPER(sve_st##N##NAME##_le_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
     sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, N, 0,             \
-              sve_st1##NAME##_le_host, sve_st1##NAME##_le_tlb, NULL);   \
+              sve_st1##NAME##_le_host, sve_st1##NAME##_le_tlb);         \
 }                                                                       \
 void HELPER(sve_st##N##NAME##_be_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
     sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, N, 0,             \
-              sve_st1##NAME##_be_host, sve_st1##NAME##_be_tlb, NULL);   \
+              sve_st1##NAME##_be_host, sve_st1##NAME##_be_tlb);         \
 }                                                                       \
 void HELPER(sve_st##N##NAME##_le_r_mte)(CPUARMState *env, void *vg,     \
                                         target_ulong addr, uint32_t desc) \
-- 
2.25.1
