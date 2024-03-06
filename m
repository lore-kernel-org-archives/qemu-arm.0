Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp273058ejb;
        Tue, 5 Mar 2024 20:00:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0dbqAH65RwWTumwAUKw78a3avI9EnJKh51r3bhk95lXwSEuO1gAxAQWaJgag/Fy+No+bSolrVBogjbCEcMpde5bB35Idc
X-Google-Smtp-Source: AGHT+IFVDsNTC0p0D2VkLfFWkgCaRCQXXIbR5H7C1CtM5CotLvfU9wscYEXngZsIn3rCdgIclv6d
X-Received: by 2002:a05:620a:1b:b0:787:a2f0:2fc2 with SMTP id j27-20020a05620a001b00b00787a2f02fc2mr4087777qki.76.1709697659551;
        Tue, 05 Mar 2024 20:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697659; cv=none;
        d=google.com; s=arc-20160816;
        b=XLmEN16J7xb8g6WzHBnHya1NOE2M19R4BdTxq7Z+mZmIt9LrLsBjxu/oDJlHtp9M9q
         edHhPTg3Y1P5exjhgmK+MY5Clk/yvGRVLlv2KjE5luOT03gsfpH5Z+vc6fWZVWMZolX7
         0XDiZkuA3nPWIbcVOIIdtn/nbRApxi/NjWEUFOnf0G545P5Cx8HKuifkk/nfhfC3RAwz
         G/7UrzPnrfa4yNSgALhNo7VTsSYYSwIHRRPy2MsUSuJoZvOotmkZ32RA+hCl4FVccc57
         fkqekhp0d2e9ibuyqU+xX3SXP2dBZ6umg0VFYSJx7gzVRyzf3ljxDc/rkQd4FSEPnB9K
         hA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=73/lLjUC7vy/VMSuYDHESMt2TDH58XTjVE/APL9O/JU=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=N1HZSWskvnIyAaaS/ivfdY82A7cOidJoq1ib6nkRyc/ipBQBMqzvSzvM297hAue8wT
         nZW9o2u2C67f4EvAGRX9252JKpzUlte94cWhkxP1rjnKWgKo6NI7fXJ2H1880COtWLg2
         C25w8AnAPW4nlAXWRzEx0ZZyu1Xty6PvyMoL1DF1RgMim89i+r6ffiVNMOyqvTukAbYW
         pe0Z40Mbah/lLgn0sOzI7OP2F6TFn9OyDdnNrb+AMj+bjs2tGHgaS6vrTh8tgWpgh1eh
         6JBgLuRXiooDrgoEU8s8Hk3WCxSzbYmeA8+uVVn8ACkkDuNiAGhIrUTM64wLyXQh7XFw
         5wmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wi1-20020a05620a570100b0078835210530si3026538qkn.676.2024.03.05.20.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 20:00:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhiQU-0000vC-SK; Tue, 05 Mar 2024 22:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQR-0000pg-QB; Tue, 05 Mar 2024 22:58:39 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQQ-0006lc-90; Tue, 05 Mar 2024 22:58:39 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TqJWk3GdlzwPFL;
 Wed,  6 Mar 2024 11:56:18 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id A07C9140257;
 Wed,  6 Mar 2024 11:58:35 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:35 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 10/23] hw/arm/virt: Wire NMI and VNMI irq lines from
 GIC to CPU
Date: Wed, 6 Mar 2024 03:57:08 +0000
Message-ID: <20240306035721.2333531-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 0VQdtNThecP9

Wire the new NMI and VNMI interrupt line from the GIC to each CPU.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v4:
- Add Reviewed-by.
v3:
- Also add VNMI wire.
---
 hw/arm/virt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0af1943697..2d4a187fd5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -804,7 +804,8 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
     /* Wire the outputs from each CPU's generic timer and the GICv3
      * maintenance interrupt signal to the appropriate GIC PPI inputs,
-     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
+     * and the GIC's IRQ/FIQ/VIRQ/VFIQ/NMI/VNMI interrupt outputs to the
+     * CPU's inputs.
      */
     for (i = 0; i < smp_cpus; i++) {
         DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
@@ -848,6 +849,10 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                            qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+        sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
+        sysbus_connect_irq(gicbusdev, i + 5 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VNMI));
     }
 
     fdt_add_gic_node(vms);
-- 
2.34.1

