Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp489167ejv;
        Thu, 21 Mar 2024 06:10:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSA77CNVy6JdIQeF39fXIK9ramk0nj2AmBRTiXSVVaDcYaBS6VnjAE3IHnTHd9u6KFHKdlHmEdSxoB2HygVK8tELD4DOci
X-Google-Smtp-Source: AGHT+IGMLW6snm752NMcsAZ1AHUdSgx66RrmNHxlUk0gwz7QhIMUw3QnkDd3uOe4N6twV6qT7P4E
X-Received: by 2002:a05:6870:e251:b0:221:8149:519a with SMTP id d17-20020a056870e25100b002218149519amr23450522oac.19.1711026656570;
        Thu, 21 Mar 2024 06:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711026656; cv=none;
        d=google.com; s=arc-20160816;
        b=OA0HdsQBL27u/6nBGiiBCr8lSZurbK44nnaNsdsGtzvMeiB4bu1qCVgAGyQxaxI9jj
         1pWnAGtwfrz7xc84f32qD6ptgUTTJxwWjJA0BAMFsLl5Q9joq9GFdSBw9/GjoR4mTH0C
         8JPIpDtbM3W5PUWxlLaRDFhBFSdFGtpgFxhvR1zKQ57Jv4Ww2X7O349CZChZzqXDzwnQ
         +lKn1SwfcObFIy2oL9rHE1uFzBUF5N1E5VvFOtWVuhx1GYApSN64Nvux89DZeehChf7t
         lz2j6GkQGUZNowuhUBknxX3Au/EVIhb4jUbVzE2PryYdH/Wbay0iGjyTi7rc5l/qblGz
         YQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=qqCqkPtPf6JTu6OskqUmZUQgSM4FtFmS2R6YRdTE+M8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=DHlXSgoEYBPyTj3VYtEXk2LPb3AeHFVh6X9LfFqBbOQeInoPNQs0gEQvamklDyEPNa
         8HrBb+q5IAdxbSAlpzHa3UYKk9orfK8ofhmbDDt39lfgmi79U/uLbSAZhM+H6jhCsm7v
         rO79jvzfSvZfzcJPEVrIefw5a7Q3RYW7Wgc47bWc1wISF+DDMLNfv0DC3caRp8EgB8Pv
         5lclQXUlIBbiePM4GunbMCtVzCvojjHnOdMItU33R0LUAaaS2dxAg+QzYbxx4qDe7J42
         z7DNJWPNXhGb2PC3YcX/GQ5nAiTDaU23PyFknp2ZLY7y+Y0NeRwAKerDCzbqw165XPiz
         8K/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi22-20020a056122189600b004bd77092f86si1878998vkb.227.2024.03.21.06.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rnIB5-0007Kh-41; Thu, 21 Mar 2024 09:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIB2-0007Iw-Sr; Thu, 21 Mar 2024 09:09:48 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIB0-0002us-Cj; Thu, 21 Mar 2024 09:09:48 -0400
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V0m2N6SGmz2BgZ7;
 Thu, 21 Mar 2024 21:07:08 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 43AD71402C6;
 Thu, 21 Mar 2024 21:09:43 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 21 Mar
 2024 21:09:39 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v9 18/23] hw/intc/arm_gicv3: Handle icv_nmiar1_read() for
 icc_nmiar1_read()
Date: Thu, 21 Mar 2024 13:08:07 +0000
Message-ID: <20240321130812.2983113-19-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YDiZVYkYU1u9

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
v9:
- Correct the INTID_NMI logic.
v8:
- Fix an unexpected interrupt bug when sending VNMI by running qemu VM.
v7:
- Add Reviewed-by.
v6:
- Implement icv_nmiar1_read().
---
 hw/intc/arm_gicv3_cpuif.c | 52 +++++++++++++++++++++++++++++++++++----
 hw/intc/gicv3_internal.h  |  3 +++
 hw/intc/trace-events      |  1 +
 3 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index df82a413c6..65e84bc013 100644
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
@@ -776,7 +781,11 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
         if (thisgrp == grp && icv_hppi_can_preempt(cs, lr)) {
             intid = ich_lr_vintid(lr);
             if (!gicv3_intid_is_special(intid)) {
-                icv_activate_irq(cs, idx, grp);
+                if (!(lr & ICH_LR_EL2_NMI)) {
+                    icv_activate_irq(cs, idx, grp, false);
+                } else {
+                    intid = INTID_NMI;
+                }
             } else {
                 /* Interrupt goes from Pending to Invalid */
                 cs->ich_lr_el2[idx] &= ~ICH_LR_EL2_STATE_PENDING_BIT;
@@ -797,8 +806,32 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
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
 
@@ -1403,6 +1436,11 @@ static int icv_drop_prio(GICv3CPUState *cs)
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
@@ -2552,7 +2590,11 @@ static void ich_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
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

