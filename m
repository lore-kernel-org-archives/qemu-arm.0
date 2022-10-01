Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp465674ocs;
        Sat, 1 Oct 2022 09:41:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4KbzwrX4WcE0ysZMsXBcOwq69AjnM378h3S3PlIGiR5cHGYiUTXHsl4NKLsKLadtmKvaex
X-Received: by 2002:a0c:aa9a:0:b0:4b1:82b4:4934 with SMTP id f26-20020a0caa9a000000b004b182b44934mr1442884qvb.58.1664642466071;
        Sat, 01 Oct 2022 09:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642466; cv=none;
        d=google.com; s=arc-20160816;
        b=FI02PsWjoZ0jL7tdJEKtAj9vqaH2Pual/0a9CLtBUEnab9X5tLPhzZYPFJtsNngnB0
         1yKU26UfcUlfK4TR0mfcAdh8b1XTpPQm+Sr9y+9TpS2QqAMLeMshQ3cEEKNIMUT8lmBz
         vd36i3q5SEbwUzlwWUsVgMX9P61bcu15b0+DHJtctZWN3YJJZUjXIZnSuIrlOY3jlaet
         lFCmcsroipRj4WOEKsFx8fVyltI/GrpVJb3gdoHNC3+eRCJBQRQj1SaR3cCqqAwQSJd6
         KJWN9zh9DlnQHz+/bqx5FoZhOP+RjW6Qv677eZT5SI+eFguC0hcMh/ASyBJkXAu3jbg5
         X0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nVf0XoPBuFuQPXtT3jzdB8OzBoWMzBFYm3DKP93Thek=;
        b=l6Yu8Iy0wNFWjCnXKwkFHFCinpNNSeJl2mJ7re3f/Wscj1EIRHoDmFMPIQYWmeJdKR
         MbOU9ctkAjpjby1xJvcdG38kAeCiz8oLVoda03HURXvJcCw2BkEscrCJaRJJdLSv4rcc
         wN4MT5T7uI/hJCFN2TqAvlzCG+t150Sglapw77rnadyTIcxHSE5CWOnx8d89JEFq/mgh
         COEDOOd2WiYtiBsGCU0vnPBkJ2mUp0YaV20GFAxpQDCi1EYwoIkEly6S4Lm0CPwo89Jr
         F2FtC507vbtTHhqC0uv2HzcSxkG4Uru7bp6h/b7s2KOhUgddg4ue1Mui6847eFlv+2+Y
         S8rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nm8jHM29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gd9-20020a05622a5c0900b0035d4344ab43si2373841qtb.410.2022.10.01.09.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nm8jHM29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefY1-0007JK-Ff
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHg-0006q6-QN
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:13 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:34363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHe-0006JS-4M
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:12 -0400
Received: by mail-qt1-x82e.google.com with SMTP id e20so4204143qts.1
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nVf0XoPBuFuQPXtT3jzdB8OzBoWMzBFYm3DKP93Thek=;
 b=Nm8jHM29wOTokPOMRAZcF4uyA0asZGULi+kSEv5C5K6cwB6ccKk4yZqLI6yQZ54TiF
 lHYKjycZQbUYAaXO4ouVRgYiNJFWUalmkok3fMpvMunrVI9lu+9Sy92dfWVkpxKs8NB3
 koPa0dDJ1QjG2fyz4SpkXdX2lTZ2mp7O6h4q11XzKhDblKYlLXvD8F54y/idB4kU1Dyb
 Knaq5Rr8acvj4w6300Fax05kA6/VuQTkkb2KRSBLu0m9BxtsCeUcY38hhNc4ajoTRtGA
 ROh7b3ov8KKKjPRVginE0SIE3tG+OZ1BxK5CrURvh3w0w0apZ2+sRVJFCjdyRhryq2KW
 prnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nVf0XoPBuFuQPXtT3jzdB8OzBoWMzBFYm3DKP93Thek=;
 b=jMDK70iN/mm9uc0t/3GVUPL90SxN5193V9ZID0PONSD09plCP1UKQp0JIijJCXOiXX
 omOAOmQb4p7+jRfEAqwaVVNZbJisrDyw/yIuzvvlkOQxoqmjYUReLk9N0u+gedTEcKgj
 8N+TlahN5dKUVXlCoCbl3Uh/KdMMoo2SsGF+S2c8eRod/HRRJSnPGBaTE1iYZEHFr2AS
 APyZ8vkcxp3yqJgkpWPqNOq+/duPuIoQnTuO+/btfuc5I25Jf+0q9emMr9/2oQxz8Pvz
 Bv08vJZ1Rsh84MwHeG9UZ2+tyQbIenfvV3mQfyr7OjRlX2WpDnIf6YRCBuBc6g9QpAlh
 tvUw==
X-Gm-Message-State: ACrzQf24RU32tBvWRuNLTeFSRpUQg5++2hH8GuJengitS4t+YQPnvzsK
 D8yUl7jE5apOTTNdkLXG/5J0zw==
X-Received: by 2002:ac8:4e48:0:b0:35d:5831:af31 with SMTP id
 e8-20020ac84e48000000b0035d5831af31mr11204447qtw.188.1664641447117; 
 Sat, 01 Oct 2022 09:24:07 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 18/42] target/arm: Split out get_phys_addr_disabled
Date: Sat,  1 Oct 2022 09:22:54 -0700
Message-Id: <20221001162318.153420-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: RixDUFcpGhHk

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 138 +++++++++++++++++++++++++----------------------
 1 file changed, 74 insertions(+), 64 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7bf79779da..e494a9de67 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2272,6 +2272,78 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
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
 bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                bool is_secure, GetPhysAddrResult *result,
@@ -2432,71 +2504,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
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

