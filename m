Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2319919ejv;
        Sat, 30 Mar 2024 03:33:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSZxdFX9bG3fIJRHCz1M0TkYJjjEjJQuTR0GG4Ir2CieuTSnQfPv6+tUj+dJW4w/wdQNl1kWKXN9PEuXuPhzVrybGYA6zU
X-Google-Smtp-Source: AGHT+IEmE/y+1xx4do4DQqcdf4SoJvtjmBpAfbiW+WVgakKMmN67B5nRUeJMYAKWBEZhCcZQcVsH
X-Received: by 2002:a05:622a:1890:b0:432:939:dd84 with SMTP id v16-20020a05622a189000b004320939dd84mr5510269qtc.5.1711794829923;
        Sat, 30 Mar 2024 03:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794829; cv=none;
        d=google.com; s=arc-20160816;
        b=JhmAzI1Ymh2/oaQ0te5pltUyJFwmEzISr2/IIvJ/b9l4W9HQoZwB9htAzVp54H43eq
         YBVVEbduOcWDDt2ywr3GttfzY9AAQ2PuPfjGl3uozqN7/OHZ4/JfpCYwBB1Rre0lFhcP
         rPDv3hYPsgGQ2pZB0scwKRyvSKyFbthv3fzAv4+ZBwRSTBY/kPqPLWt39RfYmj7l4S2A
         L73vkDpDzpA+KgJ/GmD928wBKhgBgxbdHKLBHZMP1ZAQL+1JJVJ39uV0kbYqHbFEtcwe
         nXUx1H4UG2ZpCjEjZpy9hz8bfwXiKXZ7w8XtRcbhgTUf71RdXI5cmyLniVe2VFltoCS3
         l/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Aszug6JwbQBgiY+69erEAF/c0I5z5DjKtl7itpRRB78=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=rMUjx0iTsfFqowpACHModX1t60/ItF00cj20j71S3KyTNjKy/sd64o6jCEbDhSytBD
         YQTWLLZZGr4PZR2JbTd6iBuVMlSDxn9IdETWkB6q+fyfdqenmNw8HqCj89fP2m7niXW/
         otWCjzwffjSJ5LgN0s/q7nWdkQiplqZtcT/YW1ZuzSCHBGssQw0O60OzlNDiuIVR/DTY
         TZyvl9sRLQNSVRytqx4MBuHzMvEviEthkhmRwwsRnQVxypt3CDREWkxYCFmu5yIfnigN
         PfuNr+qQ1KzXxwzIJN1LP4fc5pEFPF3ARI9EjvBq6eJsqGwJtGbQ3n/8XrE7PtgQg1c9
         ofaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020a05622a059000b004315aa1b5f5si5433293qtb.187.2024.03.30.03.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:33:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rqW1k-0000X3-HP; Sat, 30 Mar 2024 06:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1R-0000Om-99; Sat, 30 Mar 2024 06:33:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1O-0000rz-5A; Sat, 30 Mar 2024 06:33:11 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4V6D9X75BPz1wp4n;
 Sat, 30 Mar 2024 18:32:16 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 989691A016C;
 Sat, 30 Mar 2024 18:33:07 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:33:06 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 21/23] hw/intc/arm_gicv3: Report the VINMI interrupt
Date: Sat, 30 Mar 2024 10:31:26 +0000
Message-ID: <20240330103128.3185962-22-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
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
X-TUID: N02muGEw+2hC

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
index 6a2491b2a6..fb811b856d 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -485,6 +485,7 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     int idx;
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
 
     idx = hppvi_index(cs);
     trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx,
@@ -502,9 +503,17 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
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
@@ -514,6 +523,7 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel, irqlevel);
     qemu_set_irq(cs->parent_vfiq, fiqlevel);
     qemu_set_irq(cs->parent_virq, irqlevel);
+    qemu_set_irq(cs->parent_vnmi, nmilevel);
 }
 
 static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
-- 
2.34.1

