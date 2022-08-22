Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1052720ejc;
        Mon, 22 Aug 2022 10:53:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ObYBhJdKGmkIDHevAvdSZD2/37ieEypRxmV4l3yZ2FnYe9Kof7hceObSeRB1hxlpjR3Xo
X-Received: by 2002:a05:6214:29ea:b0:496:f4fe:cc9f with SMTP id jv10-20020a05621429ea00b00496f4fecc9fmr1947644qvb.69.1661190784436;
        Mon, 22 Aug 2022 10:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661190784; cv=none;
        d=google.com; s=arc-20160816;
        b=NNNzhG98EP3oLFDXnB6bqJ75sHZ7SffbUZYLJExSBLYitpSQmo4+0/vnU1967qanAm
         Ob/z02p4inAiHOZMtUYqokUJikvBvuBQvLu24rFLy7uJX8p9RkQest6+hwsdV+1RU0l+
         Vb/r5VfjdvdUd/Pur+5qh+egLBFxdFgaUUUScuTs9ykwK/tGiorJRKB2chGO4e7lmjTO
         G4PzHqHzGBXp19G75EqDMY1upJEjLZpHyEMXWM6SXd7hbZ+F4cRET5LJqFXGJ9dT+J5z
         GWGiYoflP4IxeBzFz3xqqKlVUvtxTeuieMxqIzYMAX0EBTinba8WRozUbTUPX+F1UafO
         redg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iXS0aJbutd/f8RQ8+U+qwbi40Uh9HNiJ8CeYjNnRgmU=;
        b=iBrrlpviyule8ONzVyMH/nVDS1yzqD9HVywfPbooqorIMprEl/mEMWD/VvcFd0utAV
         q3iaHwptJPa9i01Qzju5+tH+T20FWmU8DZ1/qZozheWIrA2lEdu8kXxDrnjb1dWDG8Z1
         xe9JD3FAtsPG1KFBd5lYTzAhW85hCVwRSCBQt49jEq6X1lU7O9T2Jz/aGh1KSwq1ptMx
         BNlMauvWqGIBYilBiktS+++rZ/4IN9+Gf4iYNt4bxZWQthOMEK2fugj8M4Z5nGQ7WOQJ
         JF0Gy1pBqotHh2o1TOGRmEB/bhnneaww1HO+/gtERWMVkJCrfzl7fRGAMKixMHLSn3VK
         ONdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r3R4MY7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020ac858c2000000b00304e3f118e0si5202754qta.224.2022.08.22.10.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r3R4MY7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQBbj-0006YV-RZ
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9M3-0000yd-R0
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:43 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lb-0000sD-Ae
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:43 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso11648869pjh.5
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=iXS0aJbutd/f8RQ8+U+qwbi40Uh9HNiJ8CeYjNnRgmU=;
 b=r3R4MY7A+vxIM8ux/FhZRt+x8nNWqlUZkim+nYjquB65yzGMh5WIqDjwLHm2lZkaVC
 FZkujjThzqt79bc2NOTD6xne4dV1fYyyvtPy0cLqrR8KpmfWj1T0ucd1tDC4InaSaytG
 O/B2FKFQGUgYN1tB0t76/rsz5815MPYHCC4uFl4jiaqRXIO75XImARPj/x7nu+cP4U3T
 qNRErMNFj8M8ZxQ41SCQ/1Ml9YmCwV6pR12N2akeBlNPZOz5wK2jhaJsszuO7t3NYc1j
 ALiRF/iwZm9g30AHWVdb57kZrMkF/7MvXMrKUlxVxTsim0ORQL69bhEdvsQ7W8YYgMxE
 Fi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=iXS0aJbutd/f8RQ8+U+qwbi40Uh9HNiJ8CeYjNnRgmU=;
 b=4maU4ol3A8uvlhWila0WIZUzRdOklwuhjj3ULyJTxd4Po82IWWO+lH5k12QSBjCgCu
 0rmQvt5zzJb2HoY22S7tpKkaU5tMtZSvTmZLDjF0CFvkZiM8hvz+tE5joIax+NPPZkM/
 AlkfwXM+bs1mtyLMKlWkxu+KTdbz0PrSZPtJ9TPkM5cBEV6BX3+9HcU5JaiFUFAVgrBb
 c14IyTnekrtECpQw+Qi3gwAVOchatARHHnmA4lSy6QBO+kn43QmdyCMr7RHIV/9Sbv6k
 qZLRFW56f3G4TszWPwmxtTrwFz/+1gkp7MB5dOF8a9etyyAE1dg9HMl1lJ8pm+bj9d9q
 Gh7Q==
X-Gm-Message-State: ACgBeo1m/fDJ2F7LHV0NooCJE2gPhCF1Rtj824RQd7apJTiXSOICo0Ca
 Ixi3/CfkYtr+hN1E6v8gRp63RaXjwY341w==
X-Received: by 2002:a17:902:a5cc:b0:170:d1cf:ac83 with SMTP id
 t12-20020a170902a5cc00b00170d1cfac83mr20431235plq.14.1661182094058; 
 Mon, 22 Aug 2022 08:28:14 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 35/66] target/arm: Split out get_phys_addr_disabled
Date: Mon, 22 Aug 2022 08:27:10 -0700
Message-Id: <20220822152741.1617527-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ZcfHKcRQevzu

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 138 +++++++++++++++++++++++++----------------------
 1 file changed, 74 insertions(+), 64 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4da932b464..c798b30db2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2271,6 +2271,78 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
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
+            uint64_t tcr = env->cp15.tcr_el[r_el];
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
@@ -2451,71 +2523,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
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
-                uint64_t tcr = env->cp15.tcr_el[r_el];
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

