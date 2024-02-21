Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1995536ejb;
        Wed, 21 Feb 2024 07:38:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXGVnfzLcdTq4DX208qgNzq9F1bnrXnl1bYaCAm5rcfXpUSJR4WOixN9iUYvy04ngD2kS6wJmTjEpPuNFEVZFGg8LxWQEOY
X-Google-Smtp-Source: AGHT+IFRnggj+3yeaqXlqZFXSRXiHKHD0T6SjbpAVOSUyWBRyBa09GjggBP0ViSLJ1aFBi8THmyi
X-Received: by 2002:a05:620a:148e:b0:787:1cfc:73e3 with SMTP id w14-20020a05620a148e00b007871cfc73e3mr20466667qkj.54.1708529905280;
        Wed, 21 Feb 2024 07:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529905; cv=none;
        d=google.com; s=arc-20160816;
        b=pp629gTBgFGDQoFYvi7R409os0g/QHEewLuGYxYynkKCyiArYI0s85TvzP6RYcX+a0
         8KJ4W4jy6vvGlXlRHa776HiQcu5ENSXcQVHkJaTmcZRddEPHXndIFfLuh4iIcRkUUzDA
         LuoZY0SCFXldb7Il+boZhqSBdwQNP3jlzwhr/pDYrxFaZq73sFp+N7DA7iZZ6Sq0drGG
         hnQsjqArRJPevb+SjdJdtYKEwCrBF0+riDGUHoLq21FzAF0uiDYePe8zRdnzUdNOV+A8
         xn8ODAxDYas2UwRbFQ4mhc76hGZdPj+pMomyPYl/iWNqCwUGZ+c4HETUb+7hoWeTCFg7
         YE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=T2tHN8saFSr4L9MZ2aqAIMcAisD2Omx0vZ3SJ7Tgs60=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=uCt2CdTHbOka+GQdkCPI3hGMabqrXQD5G8RS08HjpJXn36fz0KeQYSofutbuOiIufl
         x73TiJH5TsN2gqp2zkrwEkQ2Wx3XroTwx5H0PkrIf2J95NxkOwZn4XQWTn5oCZBNW5Md
         aw6A1Cv0b2gTDpcD9qNw9hom7Gw4KdFuRXP+5kZZx1i5lfVyBS2A3bjh7++UFSGBz8wN
         a5cMXmdzMaGLlww6/HywRnfIRO1MhXQZsvg3oGXPfBmRALokeTkEwhnOykMwWtbLcoCf
         BowujqRfU50fVpQt6+MV0qKzVx2ZWBlX9f8h1uxK8P92eNifDfHzBAmjTzHg4mziZWJa
         PaCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z25-20020a05620a101900b0078716472ccesi10732246qkj.646.2024.02.21.07.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:38:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoZg-0003H6-Eg; Wed, 21 Feb 2024 10:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoPq-0006qP-Mi; Wed, 21 Feb 2024 10:21:46 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLw-0004qf-TO; Wed, 21 Feb 2024 08:09:39 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TfxQK4zbyzWk4Q;
 Wed, 21 Feb 2024 21:07:37 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 45AFD1404DB;
 Wed, 21 Feb 2024 21:09:32 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:31 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 12/22] hw/arm/virt: Wire NMI irq line from GIC to CPU
Date: Wed, 21 Feb 2024 13:08:13 +0000
Message-ID: <20240221130823.677762-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
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
X-TUID: lsckhzSwhZkg

Wire the new NMI interrupt line from the GIC to each CPU.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 hw/arm/virt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0af1943697..c442652d0f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -804,7 +804,8 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
     /* Wire the outputs from each CPU's generic timer and the GICv3
      * maintenance interrupt signal to the appropriate GIC PPI inputs,
-     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
+     * and the GIC's IRQ/FIQ/VIRQ/VFIQ/NMI interrupt outputs to the CPU's
+     * inputs.
      */
     for (i = 0; i < smp_cpus; i++) {
         DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
@@ -848,6 +849,8 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                            qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+        sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
     }
 
     fdt_add_gic_node(vms);
-- 
2.34.1

