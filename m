Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp489334ejv;
        Thu, 21 Mar 2024 06:11:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUozC0mN7v4EGTz+zfNvM71wY5x/mDWkU+X6q8p57Xvo+W+QZzUOBuwRrczCNNFNFZIRb1DhJ5cpFVYmpot0P7S6CJIqpDr
X-Google-Smtp-Source: AGHT+IFfSYarxvk81V34UsyHV/cCpfOhZLBwVnbW7T+CWYp4sfEFj2OLUueDnVEMZayP9cmNDFYC
X-Received: by 2002:a05:620a:1a1d:b0:78a:3252:aa34 with SMTP id bk29-20020a05620a1a1d00b0078a3252aa34mr1244639qkb.2.1711026669059;
        Thu, 21 Mar 2024 06:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711026669; cv=none;
        d=google.com; s=arc-20160816;
        b=D+N0PUR0c1nc/z/iJxdn6axVKb+E7c2X4Ea7QrrpFuthl/9P421NbYneVUxMSKcNww
         V68kA/vhCeqgq/wP/olyGEpY9BL0xE4pj77BK3tbWEgVsFfbYHlWHKyyf276VhHmg1+E
         J+hAbVXRRB7fm2U+VSNzj1qMujmmPIjbbz28+KHc9l07GhCFu+V3BDf3nkmFkfW4jtys
         bk3KV83K0U/D1r3sdKzyT7zNUEt01VpRUJ0easAaBvDVX9QDPxfGTmRdw618YkG9B8cA
         WZe5trSkFREY6CIiO5XEizeDRQ/6GwnpIEmV6jPq4RYKcERdjfSH92OLTQtFthpblyr2
         kYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=28RRVaKLh/x6LTR0kRpLqMJLfdcWWzDGtiOf/xTvcn8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=QK70INac8aiZ4Jy0Cy6mbtQHrPj+dX1ma7Kx6J5M+vP5FlqjfH6EfM81Ud7UXlNN5n
         Wdk/abXZLS5ul+oTyHbgzGGX9mbO5Eoq10OsCJVbbRqTtKf+ScudaVVuWSOQ+2lvPeNC
         4GqluZTCHXZvfWZUPzkNTG6x8bQLLZ5Po4BAgcrB6Ee4ElAdLIdRl3FWLeVfHZNjRK7i
         sKq40XqGa18Ba02+stgbbwQ+hpesxffYpDoJTl4E0Or4mKGM+x2WBM++BgyBiI6Tnoah
         ZGd38M2iTFUf5LxN5Csh5JJdaP1K2wn0bU1wcdeNX2OqEQDUGk188hs/p1pDT4yxMWjr
         CArw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020a05620a21c700b00789f23e41cdsi10802469qka.196.2024.03.21.06.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rnIAw-0007Ci-4c; Thu, 21 Mar 2024 09:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAq-00078H-Un; Thu, 21 Mar 2024 09:09:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAp-0002rC-5L; Thu, 21 Mar 2024 09:09:36 -0400
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V0m4g5Zxwz1GCc0;
 Thu, 21 Mar 2024 21:09:07 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 3CD0A14011B;
 Thu, 21 Mar 2024 21:09:32 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 21 Mar
 2024 21:09:31 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v9 10/23] hw/arm/virt: Wire NMI and VINMI irq lines from
 GIC to CPU
Date: Thu, 21 Mar 2024 13:07:59 +0000
Message-ID: <20240321130812.2983113-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
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
X-TUID: eaXTz0iSXdpm

Wire the new NMI and VINMI interrupt line from the GIC to each CPU.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v9:
- Rename ARM_CPU_VNMI to ARM_CPU_VINMI.
- Update the commit message.
v4:
- Add Reviewed-by.
v3:
- Also add VNMI wire.
---
 hw/arm/virt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a9a913aead..ef2e6c2c4d 100644
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
@@ -865,6 +866,10 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                            qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+        sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
+        sysbus_connect_irq(gicbusdev, i + 5 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
     }
 
     fdt_add_gic_node(vms);
-- 
2.34.1

