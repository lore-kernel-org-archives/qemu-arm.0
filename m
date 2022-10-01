Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp471008ocs;
        Sat, 1 Oct 2022 09:56:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6d9N2XDDxOPmi0hxESh9HySLUAabT16BPXZfRCIgh8S+GADqWWQGQHhPYd/Hks7x5a+kVx
X-Received: by 2002:a05:6214:d61:b0:4ac:ad03:ba8 with SMTP id 1-20020a0562140d6100b004acad030ba8mr11321472qvs.79.1664643393392;
        Sat, 01 Oct 2022 09:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664643393; cv=none;
        d=google.com; s=arc-20160816;
        b=vN9BtZZHB1pCp1l0d1anEkBopuXfwCnZDqKCnZSHw8Wie1Yv+KyvwaID3jHJzJFZpt
         bWhyjHEfrOPBXJ4rYq4HOqNEcybtTzVDbLSQvJu2BFo57+mb1Y4Bv2FfWM7uo1TzfvPK
         VeHl8FsKA8eJI+jAXWktiX39BdLc2dJz6l9CwZHxmv3/oGFT58AoVycuDeejC4zHkrM+
         9zf6/P2f96KuQ0vGLCMYhfgqq0BqerkAwPf8KozZog8RICiYT9JGyOAQiIuCqZ+fn2DB
         l9OficHcTD8PreQWt+DUDywF6WBNwmtDjZZwtZlKl0U6jmvajpovMR+o9xzrc7mYFo41
         pHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ddXuP4NAsi4/7/1r07P/ZZueGAkWOaBdn4p1jeEw/4M=;
        b=mXChytGC+QHjaNn7fO5sHr5hpT142mJ3l8UKH5govSu6zc/WRN1m7FTuajoEhjyF6A
         jdITPmd1NfX+k2VpqF2FiTPZNvbR4bsiON93dZ2lIdNGvncYU3zTipQnYYdWTU4w61Xl
         eN64yJ5gSjmcFeHWNZQ8eauCN2MtE5SZgDCIEGsZ7AXgtrQwEQBnkZb7Kc984ZJk7QHq
         TU7RJ34a6y7iNowo3CyKVNJaAnXiUuWvXa7zT38mfrvxeCp/G7CFAYe51kZtMWKhlUrF
         hPzQsusJTG0JPbJnRtFgtIP1ZjCTzS173EJb3J892FrDr2GLdpGumoc80US3fOugSDb4
         DmeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iskyk8cl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020ac8718e000000b0035d019e0127si2411503qto.447.2022.10.01.09.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:56:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iskyk8cl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefmy-000404-Ps
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIE-00009O-CS
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:46 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:47039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIC-0006QI-KC
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:46 -0400
Received: by mail-qt1-x830.google.com with SMTP id b23so4323521qtr.13
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ddXuP4NAsi4/7/1r07P/ZZueGAkWOaBdn4p1jeEw/4M=;
 b=Iskyk8clX7kpEPtUqf4aj+vKy9wJKkfAN6ZRv0iUiXXjsuEldPAQdprxbgWjugIV2g
 R+cK1utM2cmCOSclNn6//OV8PffFTNsGtuuMIUlD+g/U2m0CkvMrYoxs3fMTWiJeElZ9
 5BNdW69hV7l6e5+ITU5wA+yJ0h9qxbeWPyw/UFLlh82+/cEGnqbm1Vs48xFgnn6IE9CH
 z6br7LRvYTCT48u4VDgBf/+6Cw7mRly0snlNEZIncCEfYhgbZJ0alLZpp3/W/8EFrfvA
 5/v3Tvr9bhNBYV5Laxse7MrCJz1hywwHMjCoh455ihTuXNWBuHeibzPjlgEzilGCtz/3
 Jj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ddXuP4NAsi4/7/1r07P/ZZueGAkWOaBdn4p1jeEw/4M=;
 b=uwYFi+pcFlow3v8CYBLK5DgVoap3No5hzC2IVnnjTy5+gc6WA1phh902DyI7cXgM9V
 htF6gbOpS1+Ali+gaiU0MjgFMKQq7HsT1kt4/NyAzQO6wM9uh57NCDG842OL/m197auR
 Hyit1PiGMJ1RLbTC/UgZNj6PPcCrINBZkBY1eUHudQm3td95idSyacQGJJ8GF91LKimA
 Z5W8Cl1KQBydQ1Zp2fKbI2vI8/ebEwj0pBhSTcSDCpGx1oKWiM8sBe/5j4ZiEQM+rTFD
 8uqO3oFW+4vCPcT97UocuZa2+pO2RHAXdLPhWFe3lAFvczIhMO/JJmhPH4+LBeSJM5ST
 Z91A==
X-Gm-Message-State: ACrzQf2a9iGl7n0Jh3PwyjcprGul0HcKzHFeCPiCXs2KCIZajZ9E4Rsx
 MhUdmUbPC97ixYyrsaortVeA9Q==
X-Received: by 2002:ac8:57cc:0:b0:35c:b5d1:9024 with SMTP id
 w12-20020ac857cc000000b0035cb5d19024mr11071935qta.214.1664641483531; 
 Sat, 01 Oct 2022 09:24:43 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 33/42] target/arm: Split out S1TranslateResult type
Date: Sat,  1 Oct 2022 09:23:09 -0700
Message-Id: <20221001162318.153420-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bROcN3AY9q3+

Consolidate the results of S1_ptw_translate in one struct.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 70 +++++++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7a77bea2c7..99ad894180 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -220,13 +220,18 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
     }
 }
 
+typedef struct {
+    bool is_secure;
+    void *hphys;
+    hwaddr gphys;
+} S1TranslateResult;
+
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                              ARMMMUIdx s2_mmu_idx, hwaddr addr,
-                             bool *is_secure_ptr, void **hphys, hwaddr *gphys,
-                             bool debug, ARMMMUFaultInfo *fi)
+                             bool is_secure, bool debug,
+                             S1TranslateResult *res, ARMMMUFaultInfo *fi)
 {
-    bool is_secure = *is_secure_ptr;
     uint8_t pte_attrs;
     bool s2_phys, pte_secure;
 
@@ -238,7 +243,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
          * state of the cpu at all, including softmmu tlb contents.
          */
         if (s2_phys) {
-            *gphys = addr;
+            res->gphys = addr;
             pte_attrs = 0;
             pte_secure = is_secure;
         } else {
@@ -251,11 +256,11 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                     &s2, fi)) {
                 goto fail;
             }
-            *gphys = s2.f.phys_addr;
+            res->gphys = s2.f.phys_addr;
             pte_attrs = s2.cacheattrs.attrs;
             pte_secure = s2.f.attrs.secure;
         }
-        *hphys = NULL;
+        res->hphys = NULL;
     } else {
         CPUTLBEntryFull *full;
         int flags;
@@ -263,13 +268,13 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         env->tlb_fi = fi;
         flags = probe_access_full(env, addr, MMU_DATA_LOAD,
                                   arm_to_core_mmu_idx(s2_mmu_idx),
-                                  true, hphys, &full, 0);
+                                  true, &res->hphys, &full, 0);
         env->tlb_fi = NULL;
 
         if (unlikely(flags & TLB_INVALID_MASK)) {
             goto fail;
         }
-        *gphys = full->phys_addr;
+        res->gphys = full->phys_addr;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
     }
@@ -291,12 +296,11 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
     }
 
-    if (is_secure) {
-        /* Check if page table walk is to secure or non-secure PA space. */
-        *is_secure_ptr = !(pte_secure
-                           ? env->cp15.vstcr_el2 & VSTCR_SW
-                           : env->cp15.vtcr_el2 & VTCR_NSW);
-    }
+    /* Check if page table walk is to secure or non-secure PA space. */
+    res->is_secure = (is_secure &&
+                      !(pte_secure
+                        ? env->cp15.vstcr_el2 & VSTCR_SW
+                        : env->cp15.vtcr_el2 & VTCR_NSW));
     return true;
 
  fail:
@@ -314,36 +318,35 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             bool debug, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    void *hphys;
-    hwaddr gphys;
+    S1TranslateResult s1;
     uint32_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
-                          &hphys, &gphys, debug, fi)) {
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure,
+                          debug, &s1, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
         return 0;
     }
 
     be = regime_translation_big_endian(env, mmu_idx);
-    if (likely(hphys)) {
+    if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
         if (be) {
-            data = ldl_be_p(hphys);
+            data = ldl_be_p(s1.hphys);
         } else {
-            data = ldl_le_p(hphys);
+            data = ldl_le_p(s1.hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = is_secure };
+        MemTxAttrs attrs = { .secure = s1.is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
         if (be) {
-            data = address_space_ldl_be(as, gphys, attrs, &result);
+            data = address_space_ldl_be(as, s1.gphys, attrs, &result);
         } else {
-            data = address_space_ldl_le(as, gphys, attrs, &result);
+            data = address_space_ldl_le(as, s1.gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -359,36 +362,35 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             bool debug, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    void *hphys;
-    hwaddr gphys;
+    S1TranslateResult s1;
     uint64_t data;
     bool be;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, &is_secure,
-                          &hphys, &gphys, debug, fi)) {
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure,
+                          debug, &s1, fi)) {
         /* Failure. */
         assert(fi->s1ptw);
         return 0;
     }
 
     be = regime_translation_big_endian(env, mmu_idx);
-    if (likely(hphys)) {
+    if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
         if (be) {
-            data = ldq_be_p(hphys);
+            data = ldq_be_p(s1.hphys);
         } else {
-            data = ldq_le_p(hphys);
+            data = ldq_le_p(s1.hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = is_secure };
+        MemTxAttrs attrs = { .secure = s1.is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
         if (be) {
-            data = address_space_ldq_be(as, gphys, attrs, &result);
+            data = address_space_ldq_be(as, s1.gphys, attrs, &result);
         } else {
-            data = address_space_ldq_le(as, gphys, attrs, &result);
+            data = address_space_ldq_le(as, s1.gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
-- 
2.34.1

