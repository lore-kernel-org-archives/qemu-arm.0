Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659219ejh;
        Sun, 7 Apr 2024 01:21:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVe7fLfPJeydsnfgPU4vzhBYbdiW7oVuX7xl9ZD3f0yWbVvffO6wQo3ZceGu1LGLsbSMIfiffk/HKY9DmyxFEa032SCJOO7
X-Google-Smtp-Source: AGHT+IE7JMZ1ZAbRmC4XqpFp2PkhsGaywNT0yo3DWH/f5qNgFSRcVTGJnWCcZCh6BanzNgXbID50
X-Received: by 2002:ad4:5f0e:0:b0:69b:12a0:296f with SMTP id fo14-20020ad45f0e000000b0069b12a0296fmr1578299qvb.54.1712478066454;
        Sun, 07 Apr 2024 01:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478066; cv=none;
        d=google.com; s=arc-20160816;
        b=BK8kYEblddoODmm/6S5tQNEsudt3zoBo6+dQve3LRHd0oUlqJmwZfNz1Zn+3BbzpDU
         UK9te1Q6tY4IzYXXGqZPhhoD9G/MWsZsfordb/WYeM92oaRv7nEA5WL9Y9mBvAEH8vMr
         QtaUnnINLnC6yT92eddLJI/WWmMAT9eJzVVLtF07KO9CXEqQdPY7+LKpXIAtvUL3CqBU
         72tadJvzefxJ/IT9f8DC2jbzCX1NFtu7ljFNBxle4izWLYMNHacmsdPMWkdD5TdxNWTp
         Z/vmvuqEYMrSljmDxvCW2Vz8DJBF4alxhHOKYvtkOZi29uTZ6BVcD+7mEXzKEFHt8IJi
         mbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=y9A70Ewp82xuQF0Nqa+GECXWxMOALjWmx+EAq7d/vng=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=cCGuubEskt1GtoVkgbcSQB6rlTMe8/uSLR9tBTWqvwDBvc7UgIZNGbgy3Bs7XE8e0H
         YDm46ipCg7K4Q+ZMHwrFDKzuFRhzEJK5wUCUb8LNJfxJ7/vN3odV/XcIfcuhgtDd1++y
         vuJgQ5jtFKYcMvMkj8A5axn3xFLkPzTRC+zlnrsCrBCeTEAfXpJ6Qa/q3yT1RpxwIjUJ
         XyBEJXFNC270aGSIoaskANpcVo6qqH6CDV7xVLA/BvDxKhfryDFBSpO6EH6K5qg1AKJI
         ZUijRRV9CI5a/JnAoAW5MPf8m71mfM7za+UJ0gHwCmF5Y9/Xvo3fWZjb0aFbjB//WVeb
         xGdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2-20020a056214028200b0069b11022fc0si1594096qvv.140.2024.04.07.01.21.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:21:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtNlJ-0004Sq-1z; Sun, 07 Apr 2024 04:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl7-0004KU-Rf; Sun, 07 Apr 2024 04:20:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl0-000241-Rz; Sun, 07 Apr 2024 04:20:10 -0400
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4VC4rC2wyPz1wqQL;
 Sun,  7 Apr 2024 16:19:07 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 7756218005F;
 Sun,  7 Apr 2024 16:20:01 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:20:00 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 11/24] hw/arm/virt: Wire NMI and VINMI irq lines from GIC
 to CPU
Date: Sun, 7 Apr 2024 08:17:20 +0000
Message-ID: <20240407081733.3231820-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
X-TUID: tp9hkRyvXJ1J

Wire the new NMI and VINMI interrupt line from the GIC to each CPU if it
is not GICv2.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v13:
- Adjust to after "hw/intc/arm_gicv3: Add external IRQ lines for NMI" to fix
  the unexpected error with patchseries at this point.
- Only connect these up if vms->gic_version is not VIRT_GIC_VERSION_2 to fix
  the gic-version=2 unexpected error.
v9:
- Rename ARM_CPU_VNMI to ARM_CPU_VINMI.
- Update the commit message.
v4:
- Add Reviewed-by.
v3:
- Also add VNMI wire.
---
 hw/arm/virt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a9a913aead..dca509d082 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -821,7 +821,8 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
     /* Wire the outputs from each CPU's generic timer and the GICv3
      * maintenance interrupt signal to the appropriate GIC PPI inputs,
-     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
+     * and the GIC's IRQ/FIQ/VIRQ/VFIQ/NMI/VINMI interrupt outputs to the
+     * CPU's inputs.
      */
     for (i = 0; i < smp_cpus; i++) {
         DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
@@ -865,6 +866,13 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                            qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+
+        if (vms->gic_version != VIRT_GIC_VERSION_2) {
+            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
+                               qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
+            sysbus_connect_irq(gicbusdev, i + 5 * smp_cpus,
+                               qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
+        }
     }
 
     fdt_add_gic_node(vms);
-- 
2.34.1

