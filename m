Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp374544eja;
        Thu, 29 Feb 2024 05:13:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVc9s96l4wH39C11ouY6k+AQWf+PoLg31630qyeO0iwMCXc4S4btJMrRZrg8s6xtUebWD0bqpkOPZAQCxbDVWQPpnzc6IuJ
X-Google-Smtp-Source: AGHT+IHyDGq6aOA5AztMs3OEGbJPmEfnZX98xiTuMopJ8JBriDcqk6kBELAqnpDuKOQ/Zgx13D9w
X-Received: by 2002:a05:620a:408a:b0:785:86e0:c3fc with SMTP id f10-20020a05620a408a00b0078586e0c3fcmr2456429qko.5.1709212431692;
        Thu, 29 Feb 2024 05:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212431; cv=none;
        d=google.com; s=arc-20160816;
        b=KNKESdF2trUjQvgN8eZEpEPS3DgRu4VH2FdnhR7UmfK1ckXEMx9+y8P4xeokWAt3qn
         O1sXwDQa6Idet9ASATEStM3SJxIqPZRmvCmBVXBwdSZGpMhTWpua9YYqc6vGWncXGlMl
         OIm/2M5BiohC1pA/vecbVKJ5E2YRZhhoqQNjpRPzCy8YJX4mqS5gtf3SJL4sFeO19x3v
         Omt5TZvp2ruv6LHocqBnz+o/+qY4gObh1lIeFXxu8fdiZ/2qmFmrFoRkvArrsHx0/BKl
         hB8mN9izwKyaJt2Ahuo1/3bblvnJg94m/K146XiPeHrkp4nDEaPjLA1pRFDOVVKdsDoD
         zOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=wwoXp4ZKfbuZ1Y5TSFJBpg/7n09+nWgd0J8+bi06jH0=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=bHZ8EzhWdoPHXtc3/97REpCMT6WndWRoo33L3uk/iQwVNTgZYzuZ4zjtju8odoYtnT
         DQk1D+qxq99+it9nGLID3Q7L+sXnfyl2M+E6BKB4b15y+6FEMr2Ml5dNx+hRazo88c11
         QmUtzM1idgkL0iB9qp4hGsoZdHbY1NltvpaYBRigh1OMC2/fbrcpb4EPbh9u+1iklLZ5
         Fs/Q/KeN4Sp0OaZ3qxr7DGpqvBU7yAaygzrz2eiLVSdUPbnKsNYZthrivok1A9nyf9Dg
         xivhm8Ws+U1g/zMhfzcFh1g2V/9DsfbEi7fw2YtJzGvfQ+HEj8CbggeBK+x2BbEPlLYb
         tyTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a05620a04c400b007871f7dff88si1334691qks.760.2024.02.29.05.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:13:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfgDD-0006F4-2n; Thu, 29 Feb 2024 08:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCi-0005kf-FH; Thu, 29 Feb 2024 08:12:05 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCg-0002ie-QN; Thu, 29 Feb 2024 08:12:04 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Tls6w2ycfzqjgr;
 Thu, 29 Feb 2024 21:11:20 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 15F9F140390;
 Thu, 29 Feb 2024 21:11:58 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:57 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 20/22] hw/intc/arm_gicv3: Report the VNMI interrupt
Date: Thu, 29 Feb 2024 13:10:37 +0000
Message-ID: <20240229131039.1868904-21-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ISx7AdKX/LYo

In vCPU Interface, if the vIRQ has the superpriority property, report
vNMI to the corresponding vPE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 hw/intc/arm_gicv3_cpuif.c | 14 ++++++++++++--
 hw/intc/gicv3_internal.h  |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index afba98ad87..0141d259e4 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -465,6 +465,7 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     int idx;
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
 
     idx = hppvi_index(cs);
     trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx,
@@ -482,9 +483,17 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
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
@@ -494,6 +503,7 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel, irqlevel);
     qemu_set_irq(cs->parent_vfiq, fiqlevel);
     qemu_set_irq(cs->parent_virq, irqlevel);
+    qemu_set_irq(cs->parent_vnmi, nmilevel);
 }
 
 static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 93e56b3726..b6cb0115e7 100644
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
-- 
2.34.1

