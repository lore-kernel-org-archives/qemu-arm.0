Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4484236ejv;
        Wed, 3 Apr 2024 03:18:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZZ3K3OpsladjIYEAUmxcPra9a4gegRBif3xP3mrOl2ljy90/kXmxKfmYIdMHkMLSEUKHbaP0BA6psJtv/kZFwCytTi7ib
X-Google-Smtp-Source: AGHT+IHUgBY1CBRV7yQwBVtClDVfUaHlC8/ts1Is/gvyMWMBky96BuT4egCJNqjFhT0o/e/xmdKa
X-Received: by 2002:a05:6214:cc3:b0:696:a3f4:9c39 with SMTP id 3-20020a0562140cc300b00696a3f49c39mr3280171qvx.52.1712139533137;
        Wed, 03 Apr 2024 03:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139532; cv=none;
        d=google.com; s=arc-20160816;
        b=rMCc3cZczhb+hOgpmAqTeksKZTHsvEjX2EgQi53LDXPiF3ZKJGzZwji6+p2nsq0Xmt
         UbGgjnX3PPcc+XzYI2sk+y4lKHWtBCVQkGY326bhVGRVRzfA11QiIIgYS6b9abHVbssB
         0L+T24O2bY7wUJdCoCc9CwZm2rfd8uzQ69xklPOOyqEYXN3gaXwEJPMj/lptKcGDm68c
         kyWaEfqBNQfhc/wquKf+O+6DDGiogxo84hJQJa1rAUl3rFSgI9Uqaj06NvHB2p5f4JY2
         mv2vZeflaKilCuDhH0RXv1W2XHHfNi1/WGKMN9QzHLHxW4TksMsORbxuYAeELzIpv2dx
         zRow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=TI+quwqaX8FSSNBMBRbS9qsHZ6Y5Vgj26FL8EQeZU2k=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=JNLzC7VC6Q1tNkpmDiyeIau7kPm7n5LQj6lp5nlLhX+g+QsF0/ZJVft402NGVTo00p
         L2FDuwR11J1Ak7/ACqOstC1vpVVFUHjzulvApStudT1opi37ZYcE8zx8LjpaSP7WU6aR
         wcNJagyQ+c2dTKYwu4cYmYHg3KQy7bEF3Wj8kioXWHI/e/xSw2T2NlM4tUJO7TyyYuxd
         5JXuKCe8rVIoX/LG/c9arRKJQbKx33f8ifzp0BicU5Kl/zFtX+YBREERM71JFQsXJQIz
         DZC4/2EjxpJbljmuqRl3WgnTrBC8tiXw97oTaKro5ZJ/rtaYLv+alP5CTaqhpgi228jZ
         o0Qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu8-20020a056214260800b006992c6ffd91si193851qvb.76.2024.04.03.03.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:18:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxh1-0000wE-H8; Wed, 03 Apr 2024 06:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgz-0000uC-94; Wed, 03 Apr 2024 06:18:05 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgu-0006ga-Qh; Wed, 03 Apr 2024 06:18:05 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V8gbz0fpjz1R9Z4;
 Wed,  3 Apr 2024 18:15:11 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 234DF1A0188;
 Wed,  3 Apr 2024 18:17:57 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:56 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 21/23] hw/intc/arm_gicv3: Report the VINMI interrupt
Date: Wed, 3 Apr 2024 10:16:09 +0000
Message-ID: <20240403101611.3204086-22-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: ZvfFZ0kUopFY

In vCPU Interface, if the vIRQ has the non-maskable property, report
vINMI to the corresponding vPE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v12:
- Do not check nmi_support repetitively.
- Add Reviewed-by.
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
index 93476f4744..f54b3b45ec 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -480,6 +480,7 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     int idx;
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
 
     idx = hppvi_index(cs);
     trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx,
@@ -497,9 +498,17 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
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
+                if (lr & ICH_LR_EL2_NMI) {
+                    nmilevel = 1;
+                } else {
+                    irqlevel = 1;
+                }
             } else {
                 fiqlevel = 1;
             }
@@ -509,6 +518,7 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel, irqlevel);
     qemu_set_irq(cs->parent_vfiq, fiqlevel);
     qemu_set_irq(cs->parent_virq, irqlevel);
+    qemu_set_irq(cs->parent_vnmi, nmilevel);
 }
 
 static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
-- 
2.34.1

