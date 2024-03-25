Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564733ejj;
        Mon, 25 Mar 2024 01:55:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV76pQkVN+LvryIC6+3t/uPjwdkZZG4MXRN3LCL9suMLK7ZxuUeeOFJl+dKM3rpyJ3Ik9WXVIPoRPcTjv7BMgS0tIKkRy7O
X-Google-Smtp-Source: AGHT+IGs0zFxl0yWDzKSUQbITFu203bRwzpLy0YvR06eN3F+q8Ny8awvJBi6iSSgVtQ6Yno2ZqAM
X-Received: by 2002:a81:7cd6:0:b0:610:fe15:a0a6 with SMTP id x205-20020a817cd6000000b00610fe15a0a6mr5283579ywc.43.1711356904238;
        Mon, 25 Mar 2024 01:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356904; cv=none;
        d=google.com; s=arc-20160816;
        b=ylupjw/7jtOgrT/gPpHvMCBNFIrTX8OxBxyaL+FN3NjG+H7W4GCDyG8mCTpYYWLfpY
         8mLKG1HQ4hmA3j1qYLJd7CIY6GCIRO+ugOG6k7l52sHVob4apZNTuEBbQ5i4e/PkUnPx
         IncIh/dVPmoNiYJdRhU8folDgUISy7IQ4aLYVPcgLyxfMChtIk5gVXFnU6jiljxETQH+
         tM7PBoIFE79N2mgNoNSfmIDSDSlz8Ou9EtRL2z6bbztlHRt/Z5LSq7g+p8Q/3jSG97v6
         1dm7kGGlTrwq+M7DkdkeWXQsvtaHoGlpFLCzI5xGXiV+9bhdHlaumvZZbICHZjEBNBNv
         T/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Q1vrLVYK0hYB+RiIhpi3ymSJcSGCBoUmxOnqYY9mklQ=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=jyOPtFEqMK9pyo0ZxWmHkhy4YBTC1WAo8dC9fEZJlxcUNRg28NShFsDFbq8sHBgdcg
         L+C5D6WCvDtgzjsryUzfImO/B6doIJWVLTAJajX7VfvHRS08B9ISGEvmx64WbiRWVg9y
         bFpVTxREqCxTs5Tf3OybGwyTY3UxnfTFTxR/3ZCZhux3UKUf2D1IcuseWi68BjwZ9Daw
         QiyBOmgS5NrozHf7NNZZdsNaAqfWLPvO1I8nGvGoXCCTga1nZIFYL23nnNsufNmCeskF
         Gcv8Iw9SfZ55eAlphgxxFFefGd7UIHpRYCdS55ya3CbPnlnwvcRXVzSB2w1I5uKAXZce
         q3Uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020a05622a1a8b00b004313acd2f44si4981355qtc.425.2024.03.25.01.55.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:55:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rog4a-0003To-0y; Mon, 25 Mar 2024 04:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3z-00034M-RQ; Mon, 25 Mar 2024 04:52:17 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3w-0007RK-4U; Mon, 25 Mar 2024 04:52:15 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V369l4C07z1GCyP;
 Mon, 25 Mar 2024 16:51:39 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 3052B1A016F;
 Mon, 25 Mar 2024 16:52:08 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:52:07 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 21/23] hw/intc/arm_gicv3: Report the VINMI interrupt
Date: Mon, 25 Mar 2024 08:48:52 +0000
Message-ID: <20240325084854.3010562-22-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ndXXJU+LgrrN

In vCPU Interface, if the vIRQ has the non-maskable property, report
vINMI to the corresponding vPE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v10:
- Update the commit message, superpriority -> non-maskable.
v9:
- Update the commit subject and message, vNMI -> vINMI.
v6:
- Add Reviewed-by.
---
 hw/intc/arm_gicv3_cpuif.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 4cd84b142e..cc5ff124d6 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -476,6 +476,7 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     int idx;
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
 
     idx = hppvi_index(cs);
     trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx,
@@ -493,9 +494,17 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
         uint64_t lr = cs->ich_lr_el2[idx];
 
         if (icv_hppi_can_preempt(cs, lr)) {
-            /* Virtual interrupts are simple: G0 are always FIQ, and G1 IRQ */
+            /*
+             * Virtual interrupts are simple: G0 are always FIQ, and G1 are
+             * IRQ or NMI which depends on the ICH_LR<n>_EL2.NMI to have
+             * non-maskable property.
+             */
             if (lr & ICH_LR_EL2_GROUP) {
-                irqlevel = 1;
+                if (cs->gic->nmi_support && (lr & ICH_LR_EL2_NMI)) {
+                    nmilevel = 1;
+                } else {
+                    irqlevel = 1;
+                }
             } else {
                 fiqlevel = 1;
             }
@@ -505,6 +514,7 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel, irqlevel);
     qemu_set_irq(cs->parent_vfiq, fiqlevel);
     qemu_set_irq(cs->parent_virq, irqlevel);
+    qemu_set_irq(cs->parent_vnmi, nmilevel);
 }
 
 static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
-- 
2.34.1

