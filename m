Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp6072793lfh;
        Fri, 3 Jun 2022 21:11:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8Tap9gvBzQc9Y1WSjjdzpMxHzTSujzA4OPQNTRK8DRqcawBwoDI734R5Xs1WqJPvBzFMa
X-Received: by 2002:ad4:584c:0:b0:464:5904:998d with SMTP id de12-20020ad4584c000000b004645904998dmr20353403qvb.33.1654315865613;
        Fri, 03 Jun 2022 21:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654315865; cv=none;
        d=google.com; s=arc-20160816;
        b=Ue/JvQR2vy4ggf/v1QNJot5tnFP8SPTJ/NzzMGB+ErggqpkWgj2pVxuPwF6rAFdYy+
         NptGSbZQp6iVqf++TNBmfUSfZ5V3TsqWY/rf5TxNloT4wN5Et96CuW48dsAYC+bXeH1l
         hFSdW0RVoDs/m1M9MfQao1MccjyXk+5X3A+h8fCUoGgsGeMv2qmjJipyxQfJ/lgLcInu
         FpqaTS79PFx39CyJi15ePECZMLk9dRgG8vNaN+OUrbX204HfJ7Fk+0rgvK3lMIc1aLzI
         3148pyGYnF4rfU3Tt6zizZp4xJP30WhnNZwP//SDre1JekVSkfnEpACgTsJHVNw7dkFh
         TfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j4IKm5/6a1/dcANetGpDLVd36P90uuIasmbq4QESC+o=;
        b=v1uOx05ebKEOAUMZtpi3T80bfCVNJeIhiqA2H/ngcn2+wSZG6o6OQgNOaR7Dyb3eZf
         w4lbfY86oB7GoSaD+RX6QY+WGNgJP6o9cqK/OjorAVB1igmTifWdbyNS5yByWOc11xSI
         M/N9YUQQO2x7fNOZb93wdhyL2OuUkoRSk10Bx1tBMOdhJk3C6i6b1o7i1ZTUqYislBPX
         CSWJWQIyRy8Gp2SBe7CUUlnfpq96YI2zWfqc5SaqqGBrFQYIMhEP+GdLGeG0jp2wrcfu
         2BVxjVy2siJzpfna1T9lRlx1b16whgislG6cEM43zvSxO6tKRhiOvj9sXGw84XkYSZY7
         ySOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Blo+Deoi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4-20020a05620a290400b0069f462e0fa1si5516099qkp.552.2022.06.03.21.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Blo+Deoi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxL7v-0005bn-I8
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3L-0007ep-EZ
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:19 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3I-0008WU-Kq
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so13546760pjo.0
 for <qemu-arm@nongnu.org>; Fri, 03 Jun 2022 21:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j4IKm5/6a1/dcANetGpDLVd36P90uuIasmbq4QESC+o=;
 b=Blo+DeoiQ3IjHCO2/54jrU6SiQ+zmKnaa0809zl3p/loNdwM4dXpAsPkkfCrb9sePI
 TBU1A290/lxAKcsu7cEoDNBDUKYZsKfL943qEjwzAwDtg2DC9ijFEQlbrSfSuSuuUrhf
 CTBS3RQGtfzeS4ELxNnkCazKdboa8jWtZPnCLP8zNrNvXkPNuH45Ley7oyiaH3Tbjcmj
 OzHL383jYJCt5R/jpAa4xaZGgX8cNf7VduN7HoV742IIJORGvLbV6RPfpNxVV2emOEsg
 aVmLYFeoErdR15YClUSMevEvZ9MUFH7wRV4uZpuCMHep2PuQucLfyVTODyT3U30KzATn
 T1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4IKm5/6a1/dcANetGpDLVd36P90uuIasmbq4QESC+o=;
 b=E6BhxJGYt8qCiTfxX01F1yX1qvz4IScWwc6mUVMp8Ny+kNA7GQDSubVoasCbgyzgDh
 TnogGnMsnKhNVNfGozsFLDQRidtAkLwmwTJQHxcZ5GSpUAdcMsh6wK56rKc9VwzYAalZ
 P012RfgieeNMr5bhIHuOmYyDyg7uHgEMuKv/Xkf9NZVzV1+U3ZcQacLO+1qE9QfWLIz6
 6+bWMR0Tu0OtOYrDcL/18jocBEMJxc216X+9+GCX/dB+Cvugor3hF/F0NJF3saDqV+Aw
 tiygn0mdbUe5Dk1meoVFIuDPFI0vJct/UNZSCdfLpwqWZn2AcPSTdyJHhS4XGcYcGP46
 Pidg==
X-Gm-Message-State: AOAM533dw1UAZuonMkoyojZPboFDm987iockk8kYvOeSqJNlLew+iwrX
 1kl3AJen4nIuh2/2nnVB81S9BA==
X-Received: by 2002:a17:902:9b8a:b0:163:d0ad:f9e8 with SMTP id
 y10-20020a1709029b8a00b00163d0adf9e8mr12889714plp.79.1654315575256; 
 Fri, 03 Jun 2022 21:06:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/28] target/arm: Move get_phys_addr_pmsav7_default to ptw.c
Date: Fri,  3 Jun 2022 21:05:45 -0700
Message-Id: <20220604040607.269301-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: qcmU5GQoG/GA

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  3 +++
 target/arm/helper.c | 41 -----------------------------------------
 target/arm/ptw.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 41 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 324a9dde14..d6e3fee152 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -33,6 +33,9 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
+void get_phys_addr_pmsav7_default(CPUARMState *env,
+                                  ARMMMUIdx mmu_idx,
+                                  int32_t address, int *prot);
 bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, int *prot,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 31abcf6fc9..7dd54c1863 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11642,47 +11642,6 @@ do_fault:
     return true;
 }
 
-static inline void get_phys_addr_pmsav7_default(CPUARMState *env,
-                                                ARMMMUIdx mmu_idx,
-                                                int32_t address, int *prot)
-{
-    if (!arm_feature(env, ARM_FEATURE_M)) {
-        *prot = PAGE_READ | PAGE_WRITE;
-        switch (address) {
-        case 0xF0000000 ... 0xFFFFFFFF:
-            if (regime_sctlr(env, mmu_idx) & SCTLR_V) {
-                /* hivecs execing is ok */
-                *prot |= PAGE_EXEC;
-            }
-            break;
-        case 0x00000000 ... 0x7FFFFFFF:
-            *prot |= PAGE_EXEC;
-            break;
-        }
-    } else {
-        /* Default system address map for M profile cores.
-         * The architecture specifies which regions are execute-never;
-         * at the MPU level no other checks are defined.
-         */
-        switch (address) {
-        case 0x00000000 ... 0x1fffffff: /* ROM */
-        case 0x20000000 ... 0x3fffffff: /* SRAM */
-        case 0x60000000 ... 0x7fffffff: /* RAM */
-        case 0x80000000 ... 0x9fffffff: /* RAM */
-            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-            break;
-        case 0x40000000 ... 0x5fffffff: /* Peripheral */
-        case 0xa0000000 ... 0xbfffffff: /* Device */
-        case 0xc0000000 ... 0xdfffffff: /* Device */
-        case 0xe0000000 ... 0xffffffff: /* System */
-            *prot = PAGE_READ | PAGE_WRITE;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    }
-}
-
 static bool pmsav7_use_background_region(ARMCPU *cpu,
                                          ARMMMUIdx mmu_idx, bool is_user)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5c32648a16..74650c6c52 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -374,6 +374,47 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     return false;
 }
 
+void get_phys_addr_pmsav7_default(CPUARMState *env,
+                                  ARMMMUIdx mmu_idx,
+                                  int32_t address, int *prot)
+{
+    if (!arm_feature(env, ARM_FEATURE_M)) {
+        *prot = PAGE_READ | PAGE_WRITE;
+        switch (address) {
+        case 0xF0000000 ... 0xFFFFFFFF:
+            if (regime_sctlr(env, mmu_idx) & SCTLR_V) {
+                /* hivecs execing is ok */
+                *prot |= PAGE_EXEC;
+            }
+            break;
+        case 0x00000000 ... 0x7FFFFFFF:
+            *prot |= PAGE_EXEC;
+            break;
+        }
+    } else {
+        /* Default system address map for M profile cores.
+         * The architecture specifies which regions are execute-never;
+         * at the MPU level no other checks are defined.
+         */
+        switch (address) {
+        case 0x00000000 ... 0x1fffffff: /* ROM */
+        case 0x20000000 ... 0x3fffffff: /* SRAM */
+        case 0x60000000 ... 0x7fffffff: /* RAM */
+        case 0x80000000 ... 0x9fffffff: /* RAM */
+            *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+            break;
+        case 0x40000000 ... 0x5fffffff: /* Peripheral */
+        case 0xa0000000 ... 0xbfffffff: /* Device */
+        case 0xc0000000 ... 0xdfffffff: /* Device */
+        case 0xe0000000 ... 0xffffffff: /* System */
+            *prot = PAGE_READ | PAGE_WRITE;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.34.1

