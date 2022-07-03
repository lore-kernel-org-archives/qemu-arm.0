Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2453631lft;
        Sun, 3 Jul 2022 02:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqZEw4fqg3rSbAWSLKPLCtHPRXeN9DUTSusL7hGEa8SNvQQ/v8NRQ30kfeKNVSUh9W9Gld
X-Received: by 2002:a25:ba4f:0:b0:669:5f4c:388 with SMTP id z15-20020a25ba4f000000b006695f4c0388mr24569074ybj.110.1656839825019;
        Sun, 03 Jul 2022 02:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656839825; cv=none;
        d=google.com; s=arc-20160816;
        b=ub2ZLaYF+7F8//YApQTrRhT8rFsHBf8OC6VGVxY2fySjmbUJP7ARKP+JvFEt6VEXEl
         ODXvcQ52X0DjLDmpL5uX8KJC2Kcvh4XnRdmJs5p4nxbt3wmtkTZ8t7M5aFmxqMv4M5WN
         vOXgOlRFA5uXF43qTpD0fknxGWg7nDMboUDVKackVQJoSr7/qfzvcGkg1xJ5718PNH5z
         MLxYafl9kSiQj23R9DeIrFnkC0Drx19uvqrdLjEPtGGfzJehvvZglSUJjjmKWqcTwAX2
         VS9XPiDrFJTnxRaY7ys0U3yRkPKzzj1u3sgEGTLh6MfOFnsluBSz6bJdBO5BWn2zjge9
         N3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AiWy/j3oKk4cigaisVDN3VGQJ/Lj1RcvwVUPj1j1dIE=;
        b=DmVab3cZ5FtAovgBHs9G7nPRFqeynn/axHMNzWqo579ZgvNzC2cD8oZBAKVU1/WNmJ
         TsIEGlHUbjFjPLzTfPnAUeA374xFF7na0kG+JAjMdqJrv4Yj1Qj58L0NxJxDW6xLObG8
         3Gu6BgoP5Zm1+LSNdFe0okB+L7yEhYxYGs7Ekg4WuPYD1NX6OwBTXE4EsIGDyowu0jVn
         rqkXJAesi/1JxQdzJ9hrFCOn4+4ghk6/1jlODpwxjAsVVWYIH01p/APBaCnNsYOX/48d
         2jCIFELfvv/ASU5GiK6l2ZWKtTJxHf/uBlFsOVaPYuyUXRe6HneMuTvQcNuJsJHCy/b/
         rnqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dptdrjwa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m83-20020a255856000000b0066e3a0f5b33si1185675ybb.144.2022.07.03.02.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:17:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dptdrjwa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7viy-0000Q5-DS
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz5-0008K0-IK
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:56191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz3-0006fa-Nj
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id w24so6566712pjg.5
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AiWy/j3oKk4cigaisVDN3VGQJ/Lj1RcvwVUPj1j1dIE=;
 b=dptdrjwa5wlZXSM+ceZ0joCwRmgA/1/RjlHH4vZF4y7QxU7YiBBqYQSygUWBvQox/4
 0M9+X8VUjaNfhOdB1YIiq4gxvvxWO3PhfBgyGd2LJcr7/tGOdXPdUE9LZLtCJhht9/em
 RnF2itpgdUCXRYJZP4wqhmWwI2vfteEr42lH5Lb1H1DDgn/baBXvcF7+Vkq3zKklgCbN
 rzN5GDAPanX7ZuYCe7zZT+hdZBmCVC9ilwkqd7nIlpfySjDL7nloXri2GcmikghDtRDD
 5JKLVsc9mtp8bcF1zgyKnmUX0ho0WRdODFz1EBWxL/4ilDNNtk8hfruAgEJQsCGJ3lDR
 BCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AiWy/j3oKk4cigaisVDN3VGQJ/Lj1RcvwVUPj1j1dIE=;
 b=sjDf+a1DJpnQCqky1kTVlJAOg9DGJ50leRUGkxOfSLjjo8ZNtncRIwtaWtOWVRBc3A
 KM+Xcra5qsHr4vNpmIjWjsE9LXKJyaiExdwPVc5QVEnt95anGaiXQQxD4ax/Hj4LcnTf
 AvI3tZUA25/b/Fh35bh8T7e6c0Cm7FpspS83dSKY7ZHLUQTMQ6bcrwqpyejqN5KsxhhN
 2KFw43c9M2JrLCYLd4DHbJe3ZqpD2mMGc7lvaRGfPhKwOOdCYAvfaOESo7hXB4z9Ndj7
 EDU/HHaZipA1402ubR4t/TqFp7lvttOgeuAI4i2FAwSh3qSUljZ6us8D0euD1NA0362y
 d8Yg==
X-Gm-Message-State: AJIora+8WW4eLpcLE2cMOAp3n8HUj5Ryv7HUFw/mmiPdwWEgm0GVf5Yf
 8r4dC7ixRFtWFHou1cYL+vSt+A==
X-Received: by 2002:a17:90a:fa01:b0:1ef:6e6a:4ff0 with SMTP id
 cm1-20020a17090afa0100b001ef6e6a4ff0mr8041156pjb.35.1656836976441; 
 Sun, 03 Jul 2022 01:29:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 42/62] target/arm: Split out get_phys_addr_disabled
Date: Sun,  3 Jul 2022 13:53:59 +0530
Message-Id: <20220703082419.770989-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: fKtVFlpJTrOa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 138 +++++++++++++++++++++++++----------------------
 1 file changed, 74 insertions(+), 64 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 43a82c3c7f..0f4b9b0166 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2268,6 +2268,78 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
     return ret;
 }
 
+/*
+ * MMU disabled.  S1 addresses within aa64 translation regimes are
+ * still checked for bounds -- see AArch64.S1DisabledOutput().
+ */
+static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
+                                   MMUAccessType access_type,
+                                   ARMMMUIdx mmu_idx, bool is_secure,
+                                   GetPhysAddrResult *result,
+                                   ARMMMUFaultInfo *fi)
+{
+    uint64_t hcr;
+    uint8_t memattr;
+
+    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
+        int r_el = regime_el(env, mmu_idx);
+        if (arm_el_is_aa64(env, r_el)) {
+            int pamax = arm_pamax(env_archcpu(env));
+            uint64_t tcr = env->cp15.tcr_el[r_el].raw_tcr;
+            int addrtop, tbi;
+
+            tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+            if (access_type == MMU_INST_FETCH) {
+                tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+            }
+            tbi = (tbi >> extract64(address, 55, 1)) & 1;
+            addrtop = (tbi ? 55 : 63);
+
+            if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
+                fi->type = ARMFault_AddressSize;
+                fi->level = 0;
+                fi->stage2 = false;
+                return 1;
+            }
+
+            /*
+             * When TBI is disabled, we've just validated that all of the
+             * bits above PAMax are zero, so logically we only need to
+             * clear the top byte for TBI.  But it's clearer to follow
+             * the pseudocode set of addrdesc.paddress.
+             */
+            address = extract64(address, 0, 52);
+        }
+    }
+
+    result->phys = address;
+    result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    result->page_size = TARGET_PAGE_SIZE;
+
+    /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
+    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+    result->cacheattrs.shareability = 0;
+    result->cacheattrs.is_s2_format = false;
+    if (hcr & HCR_DC) {
+        if (hcr & HCR_DCT) {
+            memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
+        } else {
+            memattr = 0xff;  /* Normal, WB, RWA */
+        }
+    } else if (access_type == MMU_INST_FETCH) {
+        if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
+            memattr = 0xee;  /* Normal, WT, RA, NT */
+        } else {
+            memattr = 0x44;  /* Normal, NC, No */
+        }
+        result->cacheattrs.shareability = 2; /* outer sharable */
+    } else {
+        memattr = 0x00;      /* Device, nGnRnE */
+    }
+    result->cacheattrs.attrs = memattr;
+    return 0;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
@@ -2448,71 +2520,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     /* Definitely a real MMU, not an MPU */
 
     if (regime_translation_disabled(env, mmu_idx, is_secure)) {
-        uint64_t hcr;
-        uint8_t memattr;
-
-        /*
-         * MMU disabled.  S1 addresses within aa64 translation regimes are
-         * still checked for bounds -- see AArch64.TranslateAddressS1Off.
-         */
-        if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-            int r_el = regime_el(env, mmu_idx);
-            if (arm_el_is_aa64(env, r_el)) {
-                int pamax = arm_pamax(env_archcpu(env));
-                uint64_t tcr = env->cp15.tcr_el[r_el].raw_tcr;
-                int addrtop, tbi;
-
-                tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
-                if (access_type == MMU_INST_FETCH) {
-                    tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
-                }
-                tbi = (tbi >> extract64(address, 55, 1)) & 1;
-                addrtop = (tbi ? 55 : 63);
-
-                if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
-                    fi->type = ARMFault_AddressSize;
-                    fi->level = 0;
-                    fi->stage2 = false;
-                    return 1;
-                }
-
-                /*
-                 * When TBI is disabled, we've just validated that all of the
-                 * bits above PAMax are zero, so logically we only need to
-                 * clear the top byte for TBI.  But it's clearer to follow
-                 * the pseudocode set of addrdesc.paddress.
-                 */
-                address = extract64(address, 0, 52);
-            }
-        }
-        result->phys = address;
-        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        result->page_size = TARGET_PAGE_SIZE;
-
-        /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-        result->cacheattrs.shareability = 0;
-        result->cacheattrs.is_s2_format = false;
-        if (hcr & HCR_DC) {
-            if (hcr & HCR_DCT) {
-                memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
-            } else {
-                memattr = 0xff;  /* Normal, WB, RWA */
-            }
-        } else if (access_type == MMU_INST_FETCH) {
-            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
-                memattr = 0xee;  /* Normal, WT, RA, NT */
-            } else {
-                memattr = 0x44;  /* Normal, NC, No */
-            }
-            result->cacheattrs.shareability = 2; /* outer sharable */
-        } else {
-            memattr = 0x00;      /* Device, nGnRnE */
-        }
-        result->cacheattrs.attrs = memattr;
-        return 0;
+        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
+                                      is_secure, result, fi);
     }
-
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx,
                                   is_secure, false, result, fi);
-- 
2.34.1

