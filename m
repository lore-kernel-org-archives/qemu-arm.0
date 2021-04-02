Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1748525lfg;
        Fri, 2 Apr 2021 14:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy74y2Wp+yGD7oCKfxtHHdVbA5i2S3bqPEkNQc5s/582knX7twvIM9cyaI76GEbHHsrlPzr
X-Received: by 2002:a5e:db47:: with SMTP id r7mr12569496iop.47.1617400157127;
        Fri, 02 Apr 2021 14:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617400157; cv=none;
        d=google.com; s=arc-20160816;
        b=kC5sLE4CBrSWxz/o/zvp8HbmqlOYIUgdsTKhe6fuyz+TaoLikjsrbEt/SOwU9hvmJj
         xrcpNalE90G8J1QgUpX2rBG+guRaMTl8AzOLDsViAiNnUJyug1foQpTLGychfVZTrIi2
         D6rzXsK/HixKVPxj9w6JjCjQH9DLjmp2bbLGnizD4wzUycxpB2HFrvjBk4SuV6A223XQ
         bGHZGFIX27WY8XKlUyQws16YWiTgpWHWeRVylq/e0eY4A6uOx0svlBkvcCL14LgpKsl/
         uTtIZU/17njDBc4zd3BjpIsPQ6pAaiz00miicT44Zg7VBeMXfPUcYuzFoQZl3vImgIAc
         9NRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Xg0dHSSHbNndr4UE+t8eLAkBBwNMOnWRtx1WrZnfz3o=;
        b=P8w/rbeenA0iHwaCzlv6kjrnuikxGVnlmDnvzRc4vpie/8VbOZaTo7N5aaV81d25Zn
         0ZZ+kOIttT2a7t1x0KX/Ww6CkYCJqXhCvrf1g53kTNoH4mQsQmTSJZVlODrx2keCNQ8a
         sVqHYewzhIIY85ZZs3jMcfKpXAF5EO9S6+Exgp3frpbQIdqQ+eAEupC58e9Qi7CnmVW6
         XBUNvglR7CS/uXe7kSUTCEijtNz06zQ3IA10ui2ARm9KNVG7W/lakeCutQ1EnEWOBkEG
         yiPw3YOekhqufyV6n14K5XYXNvvHjamLwlz5Y2HIrt9ipqWjeZubq+GJ9bYEsQHc0tqA
         tAbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4nN8tfq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si8445341ios.96.2021.04.02.14.49.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 14:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4nN8tfq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSRfI-0002YH-Dc
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 17:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYq-0000fQ-Qo
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:36 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYo-0007nJ-FE
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:36 -0400
Received: by mail-pg1-x536.google.com with SMTP id w10so2688463pgh.5
 for <qemu-arm@nongnu.org>; Fri, 02 Apr 2021 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xg0dHSSHbNndr4UE+t8eLAkBBwNMOnWRtx1WrZnfz3o=;
 b=V4nN8tfqx/rSiR9iLKlwjOQHPdjl78jtPs5wRQnF6Tiku3AUKNiqYKGhVYnhaG7X3E
 OSbuln17PqYnR9ghcP2AGNyAdxllxKgFcdmrbBhPjaBLwQSw0nHVp94pdyux1tvWnWW+
 +yYp8OF0SXDN8E+4csO/+UwMpQ4FDpq8GohAGgoFMDtlKTzn+sDrpVmP8nHduASNIQBF
 nygM0yfbBvw5G3XnuBNEGbtjGlEMC+iqzG5CvCn89t/j6D1+0xi2f3SOjAbJiccDtl8v
 Yy4kZrnGye0MkfIMLaOOB2LAFwT7Q61qQotkTMzhNnDky9INZ9DcMCkNXUiBf1Ho0ypG
 JnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xg0dHSSHbNndr4UE+t8eLAkBBwNMOnWRtx1WrZnfz3o=;
 b=N+O+Ffr+9h5DqLW3nq+auAmQKuhxrwHf23WwqgdDfEYrCB6gzphMIyNxtY9Kh1248h
 BXXDjwKxGPLGhSZnI1wwrR4/qeHmuhqyjU75GcMeUZ4MupcqE45L7Wwndi75HosKvp8s
 Exo6ujI6y0epzZXgwEQLOFxWrn0xMz+kyz55ccQ56Au+6Owa/RPPdPRVJ0Ed7v0Pfz8c
 YQgYzI0ZjfhoxFmt6ODhurPd7CY+Ekn9J7EdKZqtBz21a+yJX2ty9rzsWt5na8TXQ8vH
 Wa7Qs0GNFNqNdX/NVJ20+jjrxjHDKpL6VLIsNUSqzge172yz9qRyfsc6jgVQJVzqA5/D
 33Kg==
X-Gm-Message-State: AOAM531GBOc10lP+M6KEcI54yAzGjuFUwwGwqAwugw7Q3lT/sX6+JWpN
 cBv9wcclccx1pTXCHZOn1+nd+Q==
X-Received: by 2002:a62:3706:0:b029:211:3d70:a55a with SMTP id
 e6-20020a6237060000b02902113d70a55amr13373684pfa.16.1617399753164; 
 Fri, 02 Apr 2021 14:42:33 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/11] target/arm: Simplify sve mte checking
Date: Fri,  2 Apr 2021 14:42:16 -0700
Message-Id: <20210402214217.422585-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /zljzsRhydeK

Now that mte_check1 and mte_checkN have been merged, we can
merge sve_cont_ldst_mte_check1 and sve_cont_ldst_mte_checkN.

Which means that we can eliminate the function pointer into
sve_ldN_r and sve_stN_r, calling sve_cont_ldst_mte_check directly.

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

