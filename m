Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp477886ocs;
        Sat, 1 Oct 2022 10:11:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4GhswQfv2pf2q9BC3jq4+UgRRq5oIeZj4QHvOw/OlQGbNtvOFx7DRfBroXqmhcEoa5NVj+
X-Received: by 2002:a05:622a:387:b0:35d:587b:48d9 with SMTP id j7-20020a05622a038700b0035d587b48d9mr11250158qtx.491.1664644273629;
        Sat, 01 Oct 2022 10:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664644273; cv=none;
        d=google.com; s=arc-20160816;
        b=D/a1yHR/CLskjZuGjGq1QWsUm+X7XaY0Ld3lvyiFfy7MnbJaVZUv470IHVMemgBMvu
         1IdzYxTj8uHuTZxcdU8fJ7Uei8vvPP2qhJTaqKrEC0AVIFH/roP63IZo4m1VYF+ly/af
         N4o8d7GWgsKo36O/GU4z+vRHCFAG9pjpMLtIg/++ylZlnGTIPW52DBKZPEyAf2DpdAYC
         i8I4L0zNrQsoh4tuGiuBFVdfFd7IW875/uGuzBSApSPSaQf98Y2DBiuDXyjYiUdZ2Zkw
         WD64Rt/8qodddsgpL1bv6YPXJ9pFRTueg7k3/0IFyAi4UhbBaZv3tmx10jGvVMahlj9C
         Gh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bV7kcmVq1B6RlQRM4hyx85LaGxM1dlmN2rlKELHByAI=;
        b=n7z7vTrSUdvd/noUtbX/zeBwqy7N5pTqBi2hHiURcSXnfUaKz0aRWv71fxeagsxC6Y
         45td0CpAtfYYjG+BZMiMfsXNmTynyjkINZW5HMERYsTmlYrZWamErgyKATGWvkC6Y5JX
         tDyuIaFr+9vO8adhwYRrbz/kPFNrcztXR0y/vJE5VLI/Pmc6r6uRcB20jGDPPeHk3jbS
         dbwG1PbtbnwYNAWuxraemZCpbXalC4bFbtYMBML5BnWGSCUITVjc24FERtGqeosTDGgT
         3WjmoheRLclU5ux9wLo95SmdObXAjdDhsTGECgOnbr6ng985eSYvScgPEcBlki2SMiRb
         t9tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wNO+RKhE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke18-20020a056214301200b004ad040f9767si2434803qvb.94.2022.10.01.10.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 10:11:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wNO+RKhE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeg1B-0002IV-6z
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 13:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefII-0000Mp-HZ
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:50 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIG-0006F8-Mp
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:50 -0400
Received: by mail-qk1-x729.google.com with SMTP id g2so4549593qkk.1
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bV7kcmVq1B6RlQRM4hyx85LaGxM1dlmN2rlKELHByAI=;
 b=wNO+RKhEOiier9Ja8cN2CqUhcHLfuUmXbtsHeOoaC7hIZcU61jqUaKlpbz5KZzdkkW
 XuT+oDXE6rBgd2fibngxBl1DDv4HOUack5fSmkOC06ltguzlb4syG8i8M5juC8EjUOZt
 q+oLySy+JElX3fSZgp0ih8SuX5Ax+B5TlseVVg35shiBV9jm28VrHnDCNUWCtbi4dFBz
 3f3xbnsiNCQX/hyv2n2N1KYCycLQg3QS7+RY/fn5+rzPdVevz4pZ2WehH0zxi+pHP8m+
 oluNMHQACcFJGWrHKOLr14qdhY9FSIH89ZC6XgqnvGJcfb5bXR21sdG24W37MOT3beTC
 XsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bV7kcmVq1B6RlQRM4hyx85LaGxM1dlmN2rlKELHByAI=;
 b=t3dHkPoHzhbH4t/kmdAPibdUTlh77ueX1Qa5zo79wXwvSazV64nJxlHntTpmldotR7
 TaHl0NUWBGO0PF5IvEp4KWWwyrgsVgtsNzMj5TSkck8oArFq9cH0jFaVc/Cl+0zuCVnr
 aQ2IVIpbRzIxvFdc1pUXGWj477QY615uMumxkNdGPqgLTq/7v6mB5/AVwiLjdDMRADCc
 YICSjHbvK8c74YuIkPqE/crt2Cwon7Bz5Z+RuwCdR3ZhOboHDx0yOIHS2ABNzdLE556n
 OE3KwzMaRh7dXk+SfCRHX9Jzy6DljNaXhnhmZbI9eNDPbEX1bMePGUxVUXk/s3zVIs5S
 Xlvg==
X-Gm-Message-State: ACrzQf3OY3EaIDLo0Qqsb3LANKYgqWF+3xA0bJrCRIcqmD0tK62ozT4g
 GW2Cq+3EnWUH54++mArMGrosleAPbJhQHA==
X-Received: by 2002:a05:620a:2793:b0:6cb:c11a:130f with SMTP id
 g19-20020a05620a279300b006cbc11a130fmr9564402qkp.549.1664641487894; 
 Sat, 01 Oct 2022 09:24:47 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 35/42] target/arm: Move S1_ptw_translate outside
 arm_ld[lq]_ptw
Date: Sat,  1 Oct 2022 09:23:11 -0700
Message-Id: <20221001162318.153420-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
X-TUID: IHrVZdiX8jmx

Separate S1 translation from the actual lookup.
Will enable lpae hardware updates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 92 +++++++++++++++++++++++++-----------------------
 1 file changed, 48 insertions(+), 44 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d356b0b22d..84b55b640b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -315,38 +315,29 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
-                            bool debug, ARMMMUFaultInfo *fi)
+static uint32_t arm_ldl_ptw(CPUARMState *env, const S1TranslateResult *s1,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    S1TranslateResult s1;
     uint32_t data;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure,
-                          debug, &s1, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
-    if (likely(s1.hphys)) {
+    if (likely(s1->hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (s1.be) {
-            data = ldl_be_p(s1.hphys);
+        if (s1->be) {
+            data = ldl_be_p(s1->hphys);
         } else {
-            data = ldl_le_p(s1.hphys);
+            data = ldl_le_p(s1->hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = s1.is_secure };
+        MemTxAttrs attrs = { .secure = s1->is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (s1.be) {
-            data = address_space_ldl_be(as, s1.gphys, attrs, &result);
+        if (s1->be) {
+            data = address_space_ldl_be(as, s1->gphys, attrs, &result);
         } else {
-            data = address_space_ldl_le(as, s1.gphys, attrs, &result);
+            data = address_space_ldl_le(as, s1->gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -357,38 +348,29 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     return data;
 }
 
-static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
-                            bool debug, ARMMMUFaultInfo *fi)
+static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
+                            ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    S1TranslateResult s1;
     uint64_t data;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure,
-                          debug, &s1, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
-    if (likely(s1.hphys)) {
+    if (likely(s1->hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (s1.be) {
-            data = ldq_be_p(s1.hphys);
+        if (s1->be) {
+            data = ldq_be_p(s1->hphys);
         } else {
-            data = ldq_le_p(s1.hphys);
+            data = ldq_le_p(s1->hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = s1.is_secure };
+        MemTxAttrs attrs = { .secure = s1->is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (s1.be) {
-            data = address_space_ldq_be(as, s1.gphys, attrs, &result);
+        if (s1->be) {
+            data = address_space_ldq_be(as, s1->gphys, attrs, &result);
         } else {
-            data = address_space_ldq_le(as, s1.gphys, attrs, &result);
+            data = address_space_ldq_le(as, s1->gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -520,6 +502,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
     int domain = 0;
     int domain_prot;
     hwaddr phys_addr;
+    S1TranslateResult s1;
     uint32_t dacr;
 
     /* Pagetable walk.  */
@@ -529,7 +512,11 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                          is_secure, debug, &s1, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, &s1, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -567,7 +554,11 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                              is_secure, debug, &s1, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -643,6 +634,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
     int domain_prot;
     hwaddr phys_addr;
     uint32_t dacr;
+    S1TranslateResult s1;
     bool ns;
 
     /* Pagetable walk.  */
@@ -652,7 +644,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                          is_secure, debug, &s1, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, &s1, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -705,7 +701,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, debug, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                              is_secure, debug, &s1, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1281,14 +1281,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      */
     tableattrs = is_secure ? 0 : (1 << 4);
     for (;;) {
+        S1TranslateResult s1;
         uint64_t descriptor;
         bool nstable;
 
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx,
-                                 ptw_idx, debug, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, descaddr,
+                              !nstable, debug, &s1, fi)) {
+            goto do_fault;
+        }
+        descriptor = arm_ldq_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
-- 
2.34.1

