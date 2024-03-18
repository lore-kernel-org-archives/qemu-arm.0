Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp522192ejb;
        Mon, 18 Mar 2024 02:41:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4IYRrQoXf/YA3HLpAOX2IqVF2LQVrtlXgQ9pqkku7RYPkYeFkjYtwbk7pj2Kt1VvKo6N4ra18PLAMKmrflGDuMhSOQmFz
X-Google-Smtp-Source: AGHT+IHMq/kNiZMflOtrMnjcTIyXDl9rQUFKLWok79Jwkcy9hYSoX3a2GgPXlr3gVd7gK9HmBjfU
X-Received: by 2002:a0d:ca92:0:b0:609:a14c:4281 with SMTP id m140-20020a0dca92000000b00609a14c4281mr12278472ywd.15.1710754872039;
        Mon, 18 Mar 2024 02:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754872; cv=none;
        d=google.com; s=arc-20160816;
        b=oI92ZVltYjpQKnJhg1ZgnxV+KFJT7vwf3UE01LvcAYAFe/kTbTAz0p3MwgUnf3NYFE
         Tn5vQbHA8e54MM0cyQPw+oECJ1PXKqPuaqIwceMjIkCJgq78RDCTZqQY5TfriEcXdT3Q
         tCydb/PvWvZZEgsjFNBstGoTKUqnZUCEP2oK53uSQcfMxPCAEIQJdY1iUfJIkbBa36Cm
         yhNL5IIFnQ+pPdB2sxIbcpjPzhz6k7ln6zbmhEBVK8x0orX/C7GoPBfgKk51vCy5ksVp
         8vR0hGsPlR+UHQxJURtq/BwHKVm/tJwjjwyYBZm/pDsjR5UYgNIpvMi55nuVIPgn8Qtq
         kYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=x+O9l9kSikpcYIoeeVpf9IRAo/GnEX+gOrbvmpzJkZU=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=eC757tf0AYhBFCYGst9Uw/78qUbvVWfu8BD+Z0u2BdzEeEIpLxnFkdkopLvZQ6elpQ
         RY3F+ykcmXnLz5A/vD07Nihd7Hup20BpgiZptdoXsx+BoJ650z57K1QMPVe55AGv7G18
         ZBfN44McQNJhZrO/hrGxzUa6xj7+XY00f1dP552B6iZBa0dnVGA9I+qWRmIFssZ1oT2v
         GfSrNhtUK1PD7VfHNG/FGDebGM4w28/FfoP4VEBLyTo3o5V9PEESL1jQg0PTfcBSrAHi
         Ry5PAKyPDg7j0aE62SLuvxWAdhPYnqGZrF+Q57NgFIembslNeLQ/LmEWVmYmWX0yTrnF
         XsYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a05622a170b00b0042f24c6b309si6343467qtk.575.2024.03.18.02.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9R4-000420-Pu; Mon, 18 Mar 2024 05:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qy-0003xi-6y; Mon, 18 Mar 2024 05:37:32 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Ql-0000xh-Oj; Mon, 18 Mar 2024 05:37:31 -0400
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TyqTR2r1lzNmC0;
 Mon, 18 Mar 2024 17:35:23 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 76C8D1400FD;
 Mon, 18 Mar 2024 17:37:14 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:13 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 18/23] hw/intc/arm_gicv3: Handle icv_nmiar1_read() for
 icc_nmiar1_read()
Date: Mon, 18 Mar 2024 09:35:40 +0000
Message-ID: <20240318093546.2786144-19-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tj5MnYxTsI5n

Implement icv_nmiar1_read() for icc_nmiar1_read(), so add definition for
ICH_LR_EL2.NMI and ICH_AP1R_EL2.NMI bit.

If FEAT_GICv3_NMI is supported, ich_ap_write() should consider ICH_AP1R_EL2.NMI
bit. In icv_activate_irq() and icv_eoir_write(), the ICH_AP1R_EL2.NMI bit
should be set or clear according to the Superpriority info.

By the way, add gicv3_icv_nmiar1_read trace event.

If the hpp irq is a NMI, the icv iar read should return 1022 and trap for
NMI again

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v8:
- Fix an unexpected interrupt bug when sending VNMI by running qemu VM.
v7:
- Add Reviewed-by.
v6:
- Implement icv_nmiar1_read().
---
 hw/intc/arm_gicv3_cpuif.c | 52 ++++++++++++++++++++++++++++++++++-----
 hw/intc/gicv3_internal.h  |  3 +++
 hw/intc/trace-events      |  1 +
 3 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index df82a413c6..d67d62359b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -728,7 +728,7 @@ static uint64_t icv_hppir_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return value;
 }
 
-static void icv_activate_irq(GICv3CPUState *cs, int idx, int grp)
+static void icv_activate_irq(GICv3CPUState *cs, int idx, int grp, bool nmi)
 {
     /* Activate the interrupt in the specified list register
      * by moving it from Pending to Active state, and update the
@@ -742,7 +742,12 @@ static void icv_activate_irq(GICv3CPUState *cs, int idx, int grp)
 
     cs->ich_lr_el2[idx] &= ~ICH_LR_EL2_STATE_PENDING_BIT;
     cs->ich_lr_el2[idx] |= ICH_LR_EL2_STATE_ACTIVE_BIT;
-    cs->ich_apr[grp][regno] |= (1 << regbit);
+
+    if (cs->gic->nmi_support) {
+        cs->ich_apr[grp][regno] |= (1 << regbit) | (nmi ? ICH_AP1R_EL2_NMI : 0);
+    } else {
+        cs->ich_apr[grp][regno] |= (1 << regbit);
+    }
 }
 
 static void icv_activate_vlpi(GICv3CPUState *cs)
@@ -775,8 +780,10 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
         if (thisgrp == grp && icv_hppi_can_preempt(cs, lr)) {
             intid = ich_lr_vintid(lr);
-            if (!gicv3_intid_is_special(intid)) {
-                icv_activate_irq(cs, idx, grp);
+            if (!gicv3_intid_is_special(intid) && !(lr & ICH_LR_EL2_NMI)) {
+                icv_activate_irq(cs, idx, grp, false);
+            } else if (lr & ICH_LR_EL2_NMI) {
+                intid = INTID_NMI;
             } else {
                 /* Interrupt goes from Pending to Invalid */
                 cs->ich_lr_el2[idx] &= ~ICH_LR_EL2_STATE_PENDING_BIT;
@@ -797,8 +804,32 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
 static uint64_t icv_nmiar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    /* todo */
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int idx = hppvi_index(cs);
     uint64_t intid = INTID_SPURIOUS;
+
+    if (idx >= 0 && idx != HPPVI_INDEX_VLPI) {
+        uint64_t lr = cs->ich_lr_el2[idx];
+        int thisgrp = (lr & ICH_LR_EL2_GROUP) ? GICV3_G1NS : GICV3_G0;
+
+        if ((thisgrp == GICV3_G1NS) && (lr & ICH_LR_EL2_NMI)) {
+            intid = ich_lr_vintid(lr);
+            if (!gicv3_intid_is_special(intid)) {
+                icv_activate_irq(cs, idx, GICV3_G1NS, true);
+            } else {
+                /* Interrupt goes from Pending to Invalid */
+                cs->ich_lr_el2[idx] &= ~ICH_LR_EL2_STATE_PENDING_BIT;
+                /* We will now return the (bogus) ID from the list register,
+                 * as per the pseudocode.
+                 */
+            }
+        }
+    }
+
+    trace_gicv3_icv_nmiar1_read(gicv3_redist_affid(cs), intid);
+
+    gicv3_cpuif_virt_update(cs);
+
     return intid;
 }
 
@@ -1403,6 +1434,11 @@ static int icv_drop_prio(GICv3CPUState *cs)
             return (apr0count + i * 32) << (icv_min_vbpr(cs) + 1);
         } else {
             *papr1 &= *papr1 - 1;
+
+            if (cs->gic->nmi_support && (*papr1 & ICH_AP1R_EL2_NMI)) {
+                *papr1 &= ~ICH_AP1R_EL2_NMI;
+            }
+
             return (apr1count + i * 32) << (icv_min_vbpr(cs) + 1);
         }
     }
@@ -2552,7 +2588,11 @@ static void ich_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     trace_gicv3_ich_ap_write(ri->crm & 1, regno, gicv3_redist_affid(cs), value);
 
-    cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
+    if (cs->gic->nmi_support) {
+        cs->ich_apr[grp][regno] = value & (0xFFFFFFFFU | ICH_AP1R_EL2_NMI);
+    } else {
+        cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
+    }
     gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 93e56b3726..5e2b32861d 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -242,6 +242,7 @@ FIELD(GICR_VPENDBASER, VALID, 63, 1)
 #define ICH_LR_EL2_PRIORITY_SHIFT 48
 #define ICH_LR_EL2_PRIORITY_LENGTH 8
 #define ICH_LR_EL2_PRIORITY_MASK (0xffULL << ICH_LR_EL2_PRIORITY_SHIFT)
+#define ICH_LR_EL2_NMI (1ULL << 59)
 #define ICH_LR_EL2_GROUP (1ULL << 60)
 #define ICH_LR_EL2_HW (1ULL << 61)
 #define ICH_LR_EL2_STATE_SHIFT 62
@@ -273,6 +274,8 @@ FIELD(GICR_VPENDBASER, VALID, 63, 1)
 #define ICH_VTR_EL2_PREBITS_SHIFT 26
 #define ICH_VTR_EL2_PRIBITS_SHIFT 29
 
+#define ICH_AP1R_EL2_NMI (1ULL << 63)
+
 /* ITS Registers */
 
 FIELD(GITS_BASER, SIZE, 0, 8)
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 94030550d5..47340b5bc1 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -152,6 +152,7 @@ gicv3_icv_rpr_read(uint32_t cpu, uint64_t val) "GICv3 ICV_RPR read cpu 0x%x valu
 gicv3_icv_hppir_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_HPPIR%d read cpu 0x%x value 0x%" PRIx64
 gicv3_icv_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICV_DIR write cpu 0x%x value 0x%" PRIx64
 gicv3_icv_iar_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IAR%d read cpu 0x%x value 0x%" PRIx64
+gicv3_icv_nmiar1_read(uint32_t cpu, uint64_t val) "GICv3 ICV_NMIAR1 read cpu 0x%x value 0x%" PRIx64
 gicv3_icv_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_EOIR%d write cpu 0x%x value 0x%" PRIx64
 gicv3_cpuif_virt_update(uint32_t cpuid, int idx, int hppvlpi, int grp, int prio) "GICv3 CPU i/f 0x%x virt HPPI update LR index %d HPPVLPI %d grp %d prio %d"
 gicv3_cpuif_virt_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting FIQ %d IRQ %d"
-- 
2.34.1

