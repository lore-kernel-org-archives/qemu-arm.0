Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3825072lfa;
        Mon, 2 Nov 2020 03:03:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMch/t2pVuFie12rwqWFeLa6zr7+Fnji/vF2YATGScfCBEjaIkF7yDYmCM58cYq/6acgLk
X-Received: by 2002:a37:5904:: with SMTP id n4mr13940761qkb.364.1604315015097;
        Mon, 02 Nov 2020 03:03:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604315015; cv=none;
        d=google.com; s=arc-20160816;
        b=HXIFB0OJDigouggfKDmwjVl2TyDt6nrEZXcAgjuls9ELG8TJ4WrTanI/4Qi13clEah
         eQp/R9J1URjBUz0B+EaRHBtM0e3YXO3MuIH2pms5KJTb7mT+Cc0tr8qYnbLadNRPqYaD
         pD4epDqO80cTe9rumMpbkiz4wCq4Yrkhf2RBajEH3scshO3Ch6gc7ou4vvijaiW10Hqa
         E2rR+jE4YCLVKvjYDtf5pzkpIrTZdMs4anx4M9c1lWghJ2IzjnOSicGf4rQDuOQXKYTw
         S2qJaN34Az+8myhaujdZrz9pMzbs+8vBozlSWEAPehD2PvzprDrWYHNWJS/4MkOqTuN0
         bR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=/O6whqyZGzqhwEdvakL+z1MDAcOObLvONikcTRy/0XQ=;
        b=0VIoOdLCLLZdqtFvizgiyDjoAeEVDRh50X0V1ujNmsHyQoCYKSNGxQVDkSWM2jhhiO
         OHmpJnMefLESe74dd2mV1AAWdRwnYhQXqURvtEWEVha7bvAxb+EhNUNNbB1tNnbCwhtA
         6lsmbUlDCZvDJXqdKGHc/303C5+9Fyy4foiI95H6aEvtYNHQ1W2lPBNHNA8Ms5RwECNu
         ScoCUJigB1OS+zWSl6/Z9qQ7/arVxX4MKR6Yr/4tQ0RYnUcePygsIycs3B+avsTjInhq
         o3HNsDhlu4NekldyNyIyY+tldyQSOubZxjchDMl5erLUNVC8iDFIR4GMkEe9D7MpNLNh
         Oz2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si8820921qtm.5.2020.11.02.03.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 03:03:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZXcc-0006Ug-HN
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 06:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kZXXR-0007XL-9k; Mon, 02 Nov 2020 05:58:13 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:39570
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kZXXP-0006mw-LW; Mon, 02 Nov 2020 05:58:12 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 46BA66053E;
 Mon,  2 Nov 2020 11:58:05 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 12/14] target/arm: set HPFAR_EL2.NS on secure stage 2 faults
Date: Mon,  2 Nov 2020 12:58:00 +0200
Message-Id: <20201102105802.39332-12-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <2172054.ElGaqSPkdT@basile.remlab.net>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:57:15
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQLxt+A9RWQK

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h        | 2 ++
 target/arm/helper.c     | 6 ++++++
 target/arm/internals.h  | 2 ++
 target/arm/tlb_helper.c | 3 +++
 4 files changed, 13 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a5ee7452d9..495acf2d0a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1482,6 +1482,8 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_TWEDEN    (1ULL << 59)
 #define HCR_TWEDEL    MAKE_64BIT_MASK(60, 4)
 
+#define HPFAR_NS      (1ULL << 63)
+
 #define SCR_NS                (1U << 0)
 #define SCR_IRQ               (1U << 1)
 #define SCR_FIQ               (1U << 2)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a2bc6801e0..74fd759d48 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3447,6 +3447,9 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                 target_el = 3;
             } else {
                 env->cp15.hpfar_el2 = extract64(fi.s2addr, 12, 47) << 4;
+                if (fi.s1ns) {
+                    env->cp15.hpfar_el2 |= HPFAR_NS;
+                }
                 target_el = 2;
             }
             take_exc = true;
@@ -10453,6 +10456,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
+            fi->s1ns = !*is_secure;
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) && (cacheattrs.attrs & 0xf0) == 0) {
@@ -10464,6 +10468,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
+            fi->s1ns = !*is_secure;
             return ~0;
         }
         addr = s2pa;
@@ -11360,6 +11365,7 @@ do_fault:
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
     fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
                                mmu_idx == ARMMMUIdx_Stage2_S);
+    fi->s1ns = mmu_idx == ARMMMUIdx_Stage2_S;
     return true;
 }
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index d53b0c22fe..188997c701 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -593,6 +593,7 @@ typedef enum ARMFaultType {
  * @s2addr: Address that caused a fault at stage 2
  * @stage2: True if we faulted at stage 2
  * @s1ptw: True if we faulted at stage 2 while doing a stage 1 page-table walk
+ * @s1ns: True if we faulted on a non-secure IPA while in secure state
  * @ea: True if we should set the EA (external abort type) bit in syndrome
  */
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
@@ -603,6 +604,7 @@ struct ARMMMUFaultInfo {
     int domain;
     bool stage2;
     bool s1ptw;
+    bool s1ns;
     bool ea;
 };
 
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index b35dc8a011..450969a742 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -63,6 +63,9 @@ static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
     if (fi->stage2) {
         target_el = 2;
         env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
+        if (fi->s1ns) {
+            env->cp15.hpfar_el2 |= HPFAR_NS;
+        }
     }
     same_el = (arm_current_el(env) == target_el);
 
-- 
2.29.1

