Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp6073089lfh;
        Fri, 3 Jun 2022 21:11:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkRXuuvoxTfHi5E5Zn9nvNj3GpYxBqDIOkKkbNXMsD350yOYc/Amqz8LmNdyD4O/0rfn0L
X-Received: by 2002:a05:622a:110b:b0:304:b800:7ca6 with SMTP id e11-20020a05622a110b00b00304b8007ca6mr10579514qty.264.1654315919307;
        Fri, 03 Jun 2022 21:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654315919; cv=none;
        d=google.com; s=arc-20160816;
        b=u6UD3dmhmbbdgwegTYhJXehLTFUFvb1boCIfK+62bUc7u62saC/bufvD0hzWPMsmBF
         1dhiffFmB58XzJroA46FVuGO6/KJSbk8WkhIGJROPQQHn3fEUooSShn07OLnywjMS6Za
         xmNUG2WvXeH+MOqKiyqVVdSPHydU7b7Eha3M9ll4yEqNOOmEEPwVoku2Wcf5l8ImqArM
         oEYNQjZrKI4lkaJczj5FxuYxO7KHWZS7vh632SCf+Yg3qaNsIqaA/cfQsylj9w5W0V+6
         9D0/32Z5Te2ylJwkAWK4H8AzSYgXnsIsI1/EdfLXuSJ00y0TFuFyE5qUaNk7i+DFsBpM
         Tsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gnR4IBqxCOqfpDMygtcCF64wR9vV6kPJ7YUAwjHoSb8=;
        b=IzeHTFex0JOp1PfZgIK5SPVCu6riEsRAcu7VyGc0IeWYyAYomTibZyqICF7a9u8mox
         zTK7b6YVhiVeKC8wIOXqVTjBlSpu0ci6whJ6YfvcY0pJAgana0UhbHdWLMQ2TYVNJSHq
         DTXCQtljPPlReoiARoSq5aQ6TLLkyEW2GHKFB7w3npzQrkxPr2GpqfREqaWM+V8S339U
         jx83bRTPpxYqzhJ5i82u9ShetU/6Mhdofbg0Ysc662Z9FpjELoR/0KhsQKgHFy06i9k9
         fBODk6Ooovvp6imS8eBPe+lMh85EJ3xhDTXP/c4z8N6Hub5/WmbR9pmOrmJIlZYhmxTO
         +GiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K72C18LG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx7-20020a0562142b0700b00467d736f34dsi2925784qvb.394.2022.06.03.21.11.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:11:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K72C18LG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxL8o-0006iZ-PP
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3J-0007au-TL
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:17 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3G-0008Vo-Tv
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:17 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so8471030pjb.3
 for <qemu-arm@nongnu.org>; Fri, 03 Jun 2022 21:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnR4IBqxCOqfpDMygtcCF64wR9vV6kPJ7YUAwjHoSb8=;
 b=K72C18LGtlrmbh2trvrBujjKRg1SA6OEUWlet02ug9gQXzWDgSBo4hvhLonwC1CN4L
 eN1YIMjk/bjlNJeRWxT1suo3SsYv2q3I3tE8W0iWA18C621Kqg/HNJBmLNwLp6let8kw
 O86D+vTRZj6QG9qjZfElIHVoMNgTEF5k8X7zUrLHa3L6ddhZxP2IVGDq8ZoPD32jTY9l
 qjD4P3vCSw82UefwffWtQ1eVnkBNOdB81g6f4dSPE0lvv1Bjq9UkIUoUwO9u0VQOJyVh
 itTNzy/lllA/mu3QlcLwR6UBc3Vj9iLOdnplcq2EFxdmSWDCGFok+YZTmUb8bPhCZ8QZ
 Jssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnR4IBqxCOqfpDMygtcCF64wR9vV6kPJ7YUAwjHoSb8=;
 b=gQbhuZojaurU17ccXyki7ZueoQ3qrBzDsZ/l1+j956UU7F93belbWAPXJJX3KHsDbD
 QDpHVbUHOQn2vXHJfXfwLzby/StuPXj0SAkQeOYXLF5SrleZBvcMKoIKwLiguESFcJZ/
 yRACjRettV+IeUZ7VzJPlF9ZrG4oKG2xtX/vJ3WKYgRl8yO6y/KZnFkSQuHtAdFTBNmm
 njCoUtBOT6cMLsnsoIrmPPJpW5LJ1G/iaCQK4rP4TgLVeDHA8d2VBYoR4IJ08/o78Dui
 TTOS9IknxHIi5LqUenm09xM6ljwxzF1jnKndHSeo/x0CeE4JsnVy3haMbwJrwoeH4pCr
 YhXg==
X-Gm-Message-State: AOAM530ykyAST1h2+2aFl4aT//cKC90UrWpmNyJ8CJSY8wpvWQFOCOAs
 UsfmqH/ZlaRL+AGfEsy9N50CvOkZr/AHTw==
X-Received: by 2002:a17:90b:388f:b0:1e8:5df5:b2a3 with SMTP id
 mu15-20020a17090b388f00b001e85df5b2a3mr12445pjb.70.1654315573492; 
 Fri, 03 Jun 2022 21:06:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/28] target/arm: Move get_phys_addr_v6 to ptw.c
Date: Fri,  3 Jun 2022 21:05:43 -0700
Message-Id: <20220604040607.269301-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: NbqmzLlf0bf1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  11 +--
 target/arm/helper.c | 161 +-------------------------------------------
 target/arm/ptw.c    | 153 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+), 164 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 2dbd97b8cb..349b842d3c 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -25,15 +25,18 @@ bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                               uint32_t *table, uint32_t address);
 int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
                   int ap, int domain_prot);
+int simple_ap_to_rw_prot_is_user(int ap, bool is_user);
+
+static inline int
+simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
+{
+    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
+}
 
 bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, int *prot,
                           ARMMMUFaultInfo *fi);
-bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
-                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                      hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                      target_ulong *page_size, ARMMMUFaultInfo *fi);
 bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, int *prot,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 48294cb87c..fab91f823a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10595,7 +10595,7 @@ int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap, int domain_prot)
  * @ap:      The 2-bit simple AP (AP[2:1])
  * @is_user: TRUE if accessing from PL0
  */
-static inline int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
+int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
 {
     switch (ap) {
     case 0:
@@ -10611,12 +10611,6 @@ static inline int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
     }
 }
 
-static inline int
-simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
-{
-    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
-}
-
 /* Translate S2 section/page access permissions to protection flags
  *
  * @env:     CPUARMState
@@ -10903,159 +10897,6 @@ uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     return 0;
 }
 
-bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
-                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                      hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                      target_ulong *page_size, ARMMMUFaultInfo *fi)
-{
-    CPUState *cs = env_cpu(env);
-    ARMCPU *cpu = env_archcpu(env);
-    int level = 1;
-    uint32_t table;
-    uint32_t desc;
-    uint32_t xn;
-    uint32_t pxn = 0;
-    int type;
-    int ap;
-    int domain = 0;
-    int domain_prot;
-    hwaddr phys_addr;
-    uint32_t dacr;
-    bool ns;
-
-    /* Pagetable walk.  */
-    /* Lookup l1 descriptor.  */
-    if (!get_level1_table_address(env, mmu_idx, &table, address)) {
-        /* Section translation fault if page walk is disabled by PD0 or PD1 */
-        fi->type = ARMFault_Translation;
-        goto do_fault;
-    }
-    desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
-    if (fi->type != ARMFault_None) {
-        goto do_fault;
-    }
-    type = (desc & 3);
-    if (type == 0 || (type == 3 && !cpu_isar_feature(aa32_pxn, cpu))) {
-        /* Section translation fault, or attempt to use the encoding
-         * which is Reserved on implementations without PXN.
-         */
-        fi->type = ARMFault_Translation;
-        goto do_fault;
-    }
-    if ((type == 1) || !(desc & (1 << 18))) {
-        /* Page or Section.  */
-        domain = (desc >> 5) & 0x0f;
-    }
-    if (regime_el(env, mmu_idx) == 1) {
-        dacr = env->cp15.dacr_ns;
-    } else {
-        dacr = env->cp15.dacr_s;
-    }
-    if (type == 1) {
-        level = 2;
-    }
-    domain_prot = (dacr >> (domain * 2)) & 3;
-    if (domain_prot == 0 || domain_prot == 2) {
-        /* Section or Page domain fault */
-        fi->type = ARMFault_Domain;
-        goto do_fault;
-    }
-    if (type != 1) {
-        if (desc & (1 << 18)) {
-            /* Supersection.  */
-            phys_addr = (desc & 0xff000000) | (address & 0x00ffffff);
-            phys_addr |= (uint64_t)extract32(desc, 20, 4) << 32;
-            phys_addr |= (uint64_t)extract32(desc, 5, 4) << 36;
-            *page_size = 0x1000000;
-        } else {
-            /* Section.  */
-            phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
-            *page_size = 0x100000;
-        }
-        ap = ((desc >> 10) & 3) | ((desc >> 13) & 4);
-        xn = desc & (1 << 4);
-        pxn = desc & 1;
-        ns = extract32(desc, 19, 1);
-    } else {
-        if (cpu_isar_feature(aa32_pxn, cpu)) {
-            pxn = (desc >> 2) & 1;
-        }
-        ns = extract32(desc, 3, 1);
-        /* Lookup l2 entry.  */
-        table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
-        if (fi->type != ARMFault_None) {
-            goto do_fault;
-        }
-        ap = ((desc >> 4) & 3) | ((desc >> 7) & 4);
-        switch (desc & 3) {
-        case 0: /* Page translation fault.  */
-            fi->type = ARMFault_Translation;
-            goto do_fault;
-        case 1: /* 64k page.  */
-            phys_addr = (desc & 0xffff0000) | (address & 0xffff);
-            xn = desc & (1 << 15);
-            *page_size = 0x10000;
-            break;
-        case 2: case 3: /* 4k page.  */
-            phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-            xn = desc & 1;
-            *page_size = 0x1000;
-            break;
-        default:
-            /* Never happens, but compiler isn't smart enough to tell.  */
-            g_assert_not_reached();
-        }
-    }
-    if (domain_prot == 3) {
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-    } else {
-        if (pxn && !regime_is_user(env, mmu_idx)) {
-            xn = 1;
-        }
-        if (xn && access_type == MMU_INST_FETCH) {
-            fi->type = ARMFault_Permission;
-            goto do_fault;
-        }
-
-        if (arm_feature(env, ARM_FEATURE_V6K) &&
-                (regime_sctlr(env, mmu_idx) & SCTLR_AFE)) {
-            /* The simplified model uses AP[0] as an access control bit.  */
-            if ((ap & 1) == 0) {
-                /* Access flag fault.  */
-                fi->type = ARMFault_AccessFlag;
-                goto do_fault;
-            }
-            *prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
-        } else {
-            *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
-        }
-        if (*prot && !xn) {
-            *prot |= PAGE_EXEC;
-        }
-        if (!(*prot & (1 << access_type))) {
-            /* Access permission fault.  */
-            fi->type = ARMFault_Permission;
-            goto do_fault;
-        }
-    }
-    if (ns) {
-        /* The NS bit will (as required by the architecture) have no effect if
-         * the CPU doesn't support TZ or this is a non-secure translation
-         * regime, because the attribute will already be non-secure.
-         */
-        attrs->secure = false;
-    }
-    *phys_ptr = phys_addr;
-    return false;
-do_fault:
-    fi->domain = domain;
-    fi->level = level;
-    return true;
-}
-
 /*
  * check_s2_mmu_setup
  * @cpu:        ARMCPU
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 09c4472628..6a1f4b549d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -136,6 +136,159 @@ do_fault:
     return true;
 }
 
+static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                             hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
+                             target_ulong *page_size, ARMMMUFaultInfo *fi)
+{
+    CPUState *cs = env_cpu(env);
+    ARMCPU *cpu = env_archcpu(env);
+    int level = 1;
+    uint32_t table;
+    uint32_t desc;
+    uint32_t xn;
+    uint32_t pxn = 0;
+    int type;
+    int ap;
+    int domain = 0;
+    int domain_prot;
+    hwaddr phys_addr;
+    uint32_t dacr;
+    bool ns;
+
+    /* Pagetable walk.  */
+    /* Lookup l1 descriptor.  */
+    if (!get_level1_table_address(env, mmu_idx, &table, address)) {
+        /* Section translation fault if page walk is disabled by PD0 or PD1 */
+        fi->type = ARMFault_Translation;
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+                       mmu_idx, fi);
+    if (fi->type != ARMFault_None) {
+        goto do_fault;
+    }
+    type = (desc & 3);
+    if (type == 0 || (type == 3 && !cpu_isar_feature(aa32_pxn, cpu))) {
+        /* Section translation fault, or attempt to use the encoding
+         * which is Reserved on implementations without PXN.
+         */
+        fi->type = ARMFault_Translation;
+        goto do_fault;
+    }
+    if ((type == 1) || !(desc & (1 << 18))) {
+        /* Page or Section.  */
+        domain = (desc >> 5) & 0x0f;
+    }
+    if (regime_el(env, mmu_idx) == 1) {
+        dacr = env->cp15.dacr_ns;
+    } else {
+        dacr = env->cp15.dacr_s;
+    }
+    if (type == 1) {
+        level = 2;
+    }
+    domain_prot = (dacr >> (domain * 2)) & 3;
+    if (domain_prot == 0 || domain_prot == 2) {
+        /* Section or Page domain fault */
+        fi->type = ARMFault_Domain;
+        goto do_fault;
+    }
+    if (type != 1) {
+        if (desc & (1 << 18)) {
+            /* Supersection.  */
+            phys_addr = (desc & 0xff000000) | (address & 0x00ffffff);
+            phys_addr |= (uint64_t)extract32(desc, 20, 4) << 32;
+            phys_addr |= (uint64_t)extract32(desc, 5, 4) << 36;
+            *page_size = 0x1000000;
+        } else {
+            /* Section.  */
+            phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
+            *page_size = 0x100000;
+        }
+        ap = ((desc >> 10) & 3) | ((desc >> 13) & 4);
+        xn = desc & (1 << 4);
+        pxn = desc & 1;
+        ns = extract32(desc, 19, 1);
+    } else {
+        if (cpu_isar_feature(aa32_pxn, cpu)) {
+            pxn = (desc >> 2) & 1;
+        }
+        ns = extract32(desc, 3, 1);
+        /* Lookup l2 entry.  */
+        table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
+        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+                           mmu_idx, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+        ap = ((desc >> 4) & 3) | ((desc >> 7) & 4);
+        switch (desc & 3) {
+        case 0: /* Page translation fault.  */
+            fi->type = ARMFault_Translation;
+            goto do_fault;
+        case 1: /* 64k page.  */
+            phys_addr = (desc & 0xffff0000) | (address & 0xffff);
+            xn = desc & (1 << 15);
+            *page_size = 0x10000;
+            break;
+        case 2: case 3: /* 4k page.  */
+            phys_addr = (desc & 0xfffff000) | (address & 0xfff);
+            xn = desc & 1;
+            *page_size = 0x1000;
+            break;
+        default:
+            /* Never happens, but compiler isn't smart enough to tell.  */
+            g_assert_not_reached();
+        }
+    }
+    if (domain_prot == 3) {
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    } else {
+        if (pxn && !regime_is_user(env, mmu_idx)) {
+            xn = 1;
+        }
+        if (xn && access_type == MMU_INST_FETCH) {
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
+
+        if (arm_feature(env, ARM_FEATURE_V6K) &&
+                (regime_sctlr(env, mmu_idx) & SCTLR_AFE)) {
+            /* The simplified model uses AP[0] as an access control bit.  */
+            if ((ap & 1) == 0) {
+                /* Access flag fault.  */
+                fi->type = ARMFault_AccessFlag;
+                goto do_fault;
+            }
+            *prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
+        } else {
+            *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+        }
+        if (*prot && !xn) {
+            *prot |= PAGE_EXEC;
+        }
+        if (!(*prot & (1 << access_type))) {
+            /* Access permission fault.  */
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
+    }
+    if (ns) {
+        /* The NS bit will (as required by the architecture) have no effect if
+         * the CPU doesn't support TZ or this is a non-secure translation
+         * regime, because the attribute will already be non-secure.
+         */
+        attrs->secure = false;
+    }
+    *phys_ptr = phys_addr;
+    return false;
+do_fault:
+    fi->domain = domain;
+    fi->level = level;
+    return true;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.34.1

