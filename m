Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp375209eja;
        Thu, 29 Feb 2024 05:14:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVg4Cn6dqzkAG7D2cHg0ytXGH9JiVXi5wQBSQc17Mc0R6i/sAz9WKN0o0yCwpoDvvz5FMlq+fejzZ20dfcNlSTG+w/nJaSR
X-Google-Smtp-Source: AGHT+IEGL9AQc/niIu7O328sBnIOQ3h4qb+iPxUm2kx8JnC9jEQL1U0NrE+BzXzIS2+ypJ9W6hpj
X-Received: by 2002:a05:6102:5125:b0:470:411e:f823 with SMTP id bm37-20020a056102512500b00470411ef823mr979144vsb.10.1709212495098;
        Thu, 29 Feb 2024 05:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212495; cv=none;
        d=google.com; s=arc-20160816;
        b=o05XAIvJLKajw+77bCRmW8hStbJnV/GahWURFFrlrS3WWU8Gkkoi+n5iKbYk5wObxV
         P6sbeNXzGsJZoxB1ab/kfmOiX94FRDaAt23qLynQ7ZQvVXZIm4yn/SoEAxMQyNTu6mny
         qkh2xY50ucaYLgFO6tFRCpS4wZjHJWZi8c7a7Ea4Zs6guw1x5/SvNPEZ0GXniVzrwOb8
         PgrDUI1OvL/QSs0u1gB8SAgsSp/iBJEJtxRstiXNGtIbh8hsIchwnme0/uqt8QEE5rr5
         QldliO0v5q5uBkEsWtJm/CDTOZhyCIYGUqAHy5aTzFVruuQbQqDxd0CbyTu8GTswCN2w
         5Dzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=73/lLjUC7vy/VMSuYDHESMt2TDH58XTjVE/APL9O/JU=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=ake5cK2Ce5pWyPJNDWkdK2z/p9tN6V2HxebGX3MwiZUjitfyhxiqTm8vGgMgucqtze
         54CSKcU0AiAMrLPujTM5bIJnv+1FzFmThjY4Q5Lxd6mLFu+U/5j13EP0jJiFWNFGj1WS
         +vku6RnJC+M0MdCRBXGtzKJxO6pCVImw2wwok3ff6z1xmlYG9kb0IUlRVfndp27sAfzT
         7NdIyaWZv6C7PTD1NHnZ3rq2wBAG9MRPBmfxoirBBCFCa2bRv4mxktk5oXBJ97OLd2nh
         diG8Sy8/LNkcxKklL+YWlfKda4ZPtO7DzW/J6iRZiAFHZWqSK50JizFvKYq5hNQb7LEi
         v9zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020ab05b49000000b007cc2fadefe0si140726uae.16.2024.02.29.05.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:14:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfgCp-0005nv-Br; Thu, 29 Feb 2024 08:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCa-0005aG-R8; Thu, 29 Feb 2024 08:11:56 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCX-0002eK-5D; Thu, 29 Feb 2024 08:11:56 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Tls4y1mx6zvWDD;
 Thu, 29 Feb 2024 21:09:38 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 5F722140499;
 Thu, 29 Feb 2024 21:11:49 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:48 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 10/22] hw/arm/virt: Wire NMI and VNMI irq lines from
 GIC to CPU
Date: Thu, 29 Feb 2024 13:10:27 +0000
Message-ID: <20240229131039.1868904-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
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
X-TUID: +BdyijrGx7XZ

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

