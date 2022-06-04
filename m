Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp6074358lfh;
        Fri, 3 Jun 2022 21:16:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUi5prcPpDa/vO+f5QXWY9/wapxuJ2i4qv55QMGwSwx3AcvdOL/z0xbT+Dw1r22yMdWYaH
X-Received: by 2002:a05:622a:6082:b0:2f1:1f9c:251e with SMTP id hf2-20020a05622a608200b002f11f9c251emr10521773qtb.230.1654316167927;
        Fri, 03 Jun 2022 21:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654316167; cv=none;
        d=google.com; s=arc-20160816;
        b=KLrdseO0MIPjoPghFIm+9vY56Pv/w4yA6YqoNgX1mdIwzCKXE4eke15/cGc7VQESCy
         mbtesw4huBypFeskd3tKOHbQn7mtKdJMgdm+H61Y5mAZxvyarsVUxXQtsCpNRnxMObqd
         z5u6MpnwMrblKgCafiw1KkQkdIHMRjyuOFIi8k9IFy/dHe1NCERbemMvqRqGto/wngvx
         lYgdP1qpM8/GYb+06gmO96FJbEZRkaXQUo4SPWUG6sIiAVZdIxP57edV1UqN7XKGee1a
         WtGdqhtgNPo89nmvTwcdfGZzzKHK+Cu8EBuNivT+dW+dRRd5umWWGpQ1RHa781eWUHoJ
         3Oig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VEJJ2C6mFESBNlktiX2W24iu4e0DcpTQfDtyrXSkg6s=;
        b=gn1Jld5LM936V26gKQ5BY9yKOeqgPmfxFwJVFr4ncgCLwAa8+iMe22KJP23+nU7IGg
         10HP4by7YrIWBUTwlGBtPgCShqVjNLp+O1OoqHB9l7wAXNsaviIlPN6uqON1mABWLG/c
         3HKGv75T/b3mHmr9npXyZ/EKap5+VO9Z7nSbBk+JbhHewtq5Nrtry6J5xQklDoKZ8yQO
         heYRSzjVEVhlaECOfAe257w/4ecUrtC81AmrmNPFpWbxExJqjA6E9kOxn3zVS++S7RCi
         JE6gLuLL0qqM41ZCX6uBctHcRIqJZSMpGRAZqu6net1FNROrH4/FvgapXwZFENMf4scK
         f4/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gU98MvMy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22-20020a05620a291600b0069f0c98d582si5643188qkp.466.2022.06.03.21.16.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:16:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gU98MvMy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLCp-0005Ab-Ad
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3N-0007jh-C6
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:21 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3L-00006A-9g
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:21 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so13537379pju.1
 for <qemu-arm@nongnu.org>; Fri, 03 Jun 2022 21:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VEJJ2C6mFESBNlktiX2W24iu4e0DcpTQfDtyrXSkg6s=;
 b=gU98MvMybyBvqxOZGfj/GvLTT+3jKFulN+zkpsC/+TYb4r0TJR5UQ1YZGVzm9GRCCg
 0kLwuF59jG6zowsicZSGvwEwcQlvOUpGfO+L48jYr5JCPW+hxgVU9O6ddfkiEaxCkqMc
 INQCylBErw+PjDzkpLYLHUQC9/EAePnHd6yhRcplbo4gHi/DvqcaiuDz/S+h+FfpQPoG
 37+T/9s0c4UVDFjVzfSGGHoRWfiyW84YmzY9GEI9k1V+0aekuFMEQ/yw/e6+IlRMyUkA
 9d5QJUPQz0O6eyApS2qZegdPJvLVlAC7OSIuxV54zSwZLXF5MByAtvCRX/IOjP6ABu73
 ZHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VEJJ2C6mFESBNlktiX2W24iu4e0DcpTQfDtyrXSkg6s=;
 b=WiBrfS4Zm3msWi8eBKhWIjCKQs3FmgaIbiOEdiF93Y0cnOOPueYZHxlvP20rSvj5Ul
 7Cqs+yUZ32qRams7I6VngYdQW5MAe3eZNqL0LRR73blatC36/2hzKdNy23jzUSyDTzmc
 WWkRmAHpQMSFRuzGGzdMkHo31uGFTY6mFY04gVw+RAvIxwna78Yvj8bbWJ8thoiEo4cn
 PdwJCZkrKV8GSMkdEsmFU+0XpdC/N3XkpuondqVGzIbm4GNndsCSMpGMS1Feypr2Utdt
 zSiBjrxMXmwo/EZwtCBHNeyyTjPVZYfbnd5X6NbHbM03x/zqfNElBciv44fy2j8a/B4Z
 CPmg==
X-Gm-Message-State: AOAM530F5DLjNgSJwdUkBNmw9V6kqNMKW7KiXqETGL7vgUvaPe3ccKcc
 H5A85JoeCqAYW7rv7Af4lbaPAA==
X-Received: by 2002:a17:902:9f96:b0:163:dc33:6b72 with SMTP id
 g22-20020a1709029f9600b00163dc336b72mr13240235plq.34.1654315577767; 
 Fri, 03 Jun 2022 21:06:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/28] target/arm: Move pmsav8_mpu_lookup to ptw.c
Date: Fri,  3 Jun 2022 21:05:48 -0700
Message-Id: <20220604040607.269301-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: nZY1opDNpMjF

This is the final user of get_phys_addr_pmsav7_default
within helper.c, so make it static within ptw.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |   3 -
 target/arm/helper.c | 136 -----------------------------------------
 target/arm/ptw.c    | 146 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 143 insertions(+), 142 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index d569507951..8d2e239714 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -36,9 +36,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 bool m_is_ppb_region(CPUARMState *env, uint32_t address);
 bool m_is_system_region(CPUARMState *env, uint32_t address);
 
-void get_phys_addr_pmsav7_default(CPUARMState *env,
-                                  ARMMMUIdx mmu_idx,
-                                  int32_t address, int *prot);
 bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user);
 
 bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c1d0726464..a8186ac138 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11798,142 +11798,6 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
     }
 }
 
-bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                              hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                              int *prot, bool *is_subpage,
-                              ARMMMUFaultInfo *fi, uint32_t *mregion)
-{
-    /* Perform a PMSAv8 MPU lookup (without also doing the SAU check
-     * that a full phys-to-virt translation does).
-     * mregion is (if not NULL) set to the region number which matched,
-     * or -1 if no region number is returned (MPU off, address did not
-     * hit a region, address hit in multiple regions).
-     * We set is_subpage to true if the region hit doesn't cover the
-     * entire TARGET_PAGE the address is within.
-     */
-    ARMCPU *cpu = env_archcpu(env);
-    bool is_user = regime_is_user(env, mmu_idx);
-    uint32_t secure = regime_is_secure(env, mmu_idx);
-    int n;
-    int matchregion = -1;
-    bool hit = false;
-    uint32_t addr_page_base = address & TARGET_PAGE_MASK;
-    uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
-
-    *is_subpage = false;
-    *phys_ptr = address;
-    *prot = 0;
-    if (mregion) {
-        *mregion = -1;
-    }
-
-    /* Unlike the ARM ARM pseudocode, we don't need to check whether this
-     * was an exception vector read from the vector table (which is always
-     * done using the default system address map), because those accesses
-     * are done in arm_v7m_load_vector(), which always does a direct
-     * read using address_space_ldl(), rather than going via this function.
-     */
-    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
-        hit = true;
-    } else if (m_is_ppb_region(env, address)) {
-        hit = true;
-    } else {
-        if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
-            hit = true;
-        }
-
-        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
-            /* region search */
-            /* Note that the base address is bits [31:5] from the register
-             * with bits [4:0] all zeroes, but the limit address is bits
-             * [31:5] from the register with bits [4:0] all ones.
-             */
-            uint32_t base = env->pmsav8.rbar[secure][n] & ~0x1f;
-            uint32_t limit = env->pmsav8.rlar[secure][n] | 0x1f;
-
-            if (!(env->pmsav8.rlar[secure][n] & 0x1)) {
-                /* Region disabled */
-                continue;
-            }
-
-            if (address < base || address > limit) {
-                /*
-                 * Address not in this region. We must check whether the
-                 * region covers addresses in the same page as our address.
-                 * In that case we must not report a size that covers the
-                 * whole page for a subsequent hit against a different MPU
-                 * region or the background region, because it would result in
-                 * incorrect TLB hits for subsequent accesses to addresses that
-                 * are in this MPU region.
-                 */
-                if (limit >= base &&
-                    ranges_overlap(base, limit - base + 1,
-                                   addr_page_base,
-                                   TARGET_PAGE_SIZE)) {
-                    *is_subpage = true;
-                }
-                continue;
-            }
-
-            if (base > addr_page_base || limit < addr_page_limit) {
-                *is_subpage = true;
-            }
-
-            if (matchregion != -1) {
-                /* Multiple regions match -- always a failure (unlike
-                 * PMSAv7 where highest-numbered-region wins)
-                 */
-                fi->type = ARMFault_Permission;
-                fi->level = 1;
-                return true;
-            }
-
-            matchregion = n;
-            hit = true;
-        }
-    }
-
-    if (!hit) {
-        /* background fault */
-        fi->type = ARMFault_Background;
-        return true;
-    }
-
-    if (matchregion == -1) {
-        /* hit using the background region */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
-    } else {
-        uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
-        uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
-        bool pxn = false;
-
-        if (arm_feature(env, ARM_FEATURE_V8_1M)) {
-            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
-        }
-
-        if (m_is_system_region(env, address)) {
-            /* System space is always execute never */
-            xn = 1;
-        }
-
-        *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (*prot && !xn && !(pxn && !is_user)) {
-            *prot |= PAGE_EXEC;
-        }
-        /* We don't need to look the attribute up in the MAIR0/MAIR1
-         * registers because that only tells us about cacheability.
-         */
-        if (mregion) {
-            *mregion = matchregion;
-        }
-    }
-
-    fi->type = ARMFault_Permission;
-    fi->level = 1;
-    return !(*prot & (1 << access_type));
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 28caa7a7ae..989e783cce 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -375,9 +375,8 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     return false;
 }
 
-void get_phys_addr_pmsav7_default(CPUARMState *env,
-                                  ARMMMUIdx mmu_idx,
-                                  int32_t address, int *prot)
+static void get_phys_addr_pmsav7_default(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                         int32_t address, int *prot)
 {
     if (!arm_feature(env, ARM_FEATURE_M)) {
         *prot = PAGE_READ | PAGE_WRITE;
@@ -605,6 +604,147 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
+bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                       int *prot, bool *is_subpage,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion)
+{
+    /*
+     * Perform a PMSAv8 MPU lookup (without also doing the SAU check
+     * that a full phys-to-virt translation does).
+     * mregion is (if not NULL) set to the region number which matched,
+     * or -1 if no region number is returned (MPU off, address did not
+     * hit a region, address hit in multiple regions).
+     * We set is_subpage to true if the region hit doesn't cover the
+     * entire TARGET_PAGE the address is within.
+     */
+    ARMCPU *cpu = env_archcpu(env);
+    bool is_user = regime_is_user(env, mmu_idx);
+    uint32_t secure = regime_is_secure(env, mmu_idx);
+    int n;
+    int matchregion = -1;
+    bool hit = false;
+    uint32_t addr_page_base = address & TARGET_PAGE_MASK;
+    uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
+
+    *is_subpage = false;
+    *phys_ptr = address;
+    *prot = 0;
+    if (mregion) {
+        *mregion = -1;
+    }
+
+    /*
+     * Unlike the ARM ARM pseudocode, we don't need to check whether this
+     * was an exception vector read from the vector table (which is always
+     * done using the default system address map), because those accesses
+     * are done in arm_v7m_load_vector(), which always does a direct
+     * read using address_space_ldl(), rather than going via this function.
+     */
+    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
+        hit = true;
+    } else if (m_is_ppb_region(env, address)) {
+        hit = true;
+    } else {
+        if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+            hit = true;
+        }
+
+        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
+            /* region search */
+            /*
+             * Note that the base address is bits [31:5] from the register
+             * with bits [4:0] all zeroes, but the limit address is bits
+             * [31:5] from the register with bits [4:0] all ones.
+             */
+            uint32_t base = env->pmsav8.rbar[secure][n] & ~0x1f;
+            uint32_t limit = env->pmsav8.rlar[secure][n] | 0x1f;
+
+            if (!(env->pmsav8.rlar[secure][n] & 0x1)) {
+                /* Region disabled */
+                continue;
+            }
+
+            if (address < base || address > limit) {
+                /*
+                 * Address not in this region. We must check whether the
+                 * region covers addresses in the same page as our address.
+                 * In that case we must not report a size that covers the
+                 * whole page for a subsequent hit against a different MPU
+                 * region or the background region, because it would result in
+                 * incorrect TLB hits for subsequent accesses to addresses that
+                 * are in this MPU region.
+                 */
+                if (limit >= base &&
+                    ranges_overlap(base, limit - base + 1,
+                                   addr_page_base,
+                                   TARGET_PAGE_SIZE)) {
+                    *is_subpage = true;
+                }
+                continue;
+            }
+
+            if (base > addr_page_base || limit < addr_page_limit) {
+                *is_subpage = true;
+            }
+
+            if (matchregion != -1) {
+                /*
+                 * Multiple regions match -- always a failure (unlike
+                 * PMSAv7 where highest-numbered-region wins)
+                 */
+                fi->type = ARMFault_Permission;
+                fi->level = 1;
+                return true;
+            }
+
+            matchregion = n;
+            hit = true;
+        }
+    }
+
+    if (!hit) {
+        /* background fault */
+        fi->type = ARMFault_Background;
+        return true;
+    }
+
+    if (matchregion == -1) {
+        /* hit using the background region */
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+    } else {
+        uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
+        uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
+        bool pxn = false;
+
+        if (arm_feature(env, ARM_FEATURE_V8_1M)) {
+            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
+        }
+
+        if (m_is_system_region(env, address)) {
+            /* System space is always execute never */
+            xn = 1;
+        }
+
+        *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (*prot && !xn && !(pxn && !is_user)) {
+            *prot |= PAGE_EXEC;
+        }
+        /*
+         * We don't need to look the attribute up in the MAIR0/MAIR1
+         * registers because that only tells us about cacheability.
+         */
+        if (mregion) {
+            *mregion = matchregion;
+        }
+    }
+
+    fi->type = ARMFault_Permission;
+    fi->level = 1;
+    return !(*prot & (1 << access_type));
+}
+
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, MemTxAttrs *txattrs,
-- 
2.34.1

