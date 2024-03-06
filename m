Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp272844ejb;
        Tue, 5 Mar 2024 20:00:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAtO9tMbznCztFrWKJOEo8S+/x8szVfnRAo8Kl+PPTtEpJfRFSiQtdm07fnyWc4eWEwnHx95bVM4wCDwn/FZ3qKB+uIAKZ
X-Google-Smtp-Source: AGHT+IE5H4kewtIM7g1i9o+jfNEyBS+o6ScVS/rqaiXtrrz7CWA47Jy8KURDtXQh47US6lzXeQjo
X-Received: by 2002:ad4:4d86:0:b0:68f:6be:9f94 with SMTP id cv6-20020ad44d86000000b0068f06be9f94mr3886464qvb.12.1709697632423;
        Tue, 05 Mar 2024 20:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697632; cv=none;
        d=google.com; s=arc-20160816;
        b=wsC/P2EKRtPYAistg7+7NLLaDwz+qr6N6csjKCL+vmYmPTElJuKGlzxhGzsQloX9RU
         +44yl60FosioSvpjPGjJQj/VJ4Q+F3aPrr+SKfHTgmAiw0NQdU9vjJ/SKR4ppZAvDpE2
         AlrZfWSLdRH93mUKlnXFKJ6aMu5dhOZsIuCqwNF9UZS8eihmxUUkuSMx2kmPGKyzJDJ0
         qQrl6p7nCo30wqnj31EycQ8hrnLvW56EMNFM9AmdJKz8A9WvYxg84f3NjnnCt74Zjr32
         KYnLcG7QlX5NGcb2oobnDhD8DS9UMwSteuHwgYdrmBYYTlJjj5kI8FeBQPVRp4s8XIao
         ECsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=yw32tk0Hy800OxMJj7H+wb+EnX78GUSqgRaFwDDHsKY=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=jBO3+pWwpORJXZzDfljyYxYtJadyD5gWf1xjrxZf6L2BffFsxJ/CQpoxFWtcUIwUHu
         bw8QxCODuplGvUiHcnmUiFQpgqb8PUGXnMgxntTlQaFYD/n0iYfwbsrJzcPAi9CVZKQ3
         ex0Rg8TNUnKhQ4w+x2dRH8BCej2R/C1/2fBGCexmyUGRXvkEBv7CZG2gyPlM2LEz0cnE
         qccn7ZMuTMv61lR5tLuYnXUtnqEN9ViXxbXCkL5HJtd+iEf66TnfFxQ9lAmeDTXIiDwl
         j+tYcaP9zOxqsNhGLiX3J/g3WnaO8zMQOMZtBFarnuJFuG31vulPh95Yi+oEod5SD8Ab
         VJ8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020ad45b84000000b0068fc839406csi13679921qvp.378.2024.03.05.20.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 20:00:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhiQl-0001Di-Qh; Tue, 05 Mar 2024 22:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQk-0001DI-1S; Tue, 05 Mar 2024 22:58:58 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQa-0006ov-Kr; Tue, 05 Mar 2024 22:58:57 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TqJXg2MKDzNls2;
 Wed,  6 Mar 2024 11:57:07 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 282A9140257;
 Wed,  6 Mar 2024 11:58:45 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:44 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 21/23] hw/intc/arm_gicv3: Report the VNMI interrupt
Date: Wed, 6 Mar 2024 03:57:19 +0000
Message-ID: <20240306035721.2333531-22-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
X-TUID: 1navjHHP09Tg

In vCPU Interface, if the vIRQ has the superpriority property, report
vNMI to the corresponding vPE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v6:
- Add Reviewed-by.
---
 hw/intc/arm_gicv3_cpuif.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 483b1bc4a3..f55e8fd277 100644
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
-- 
2.34.1

