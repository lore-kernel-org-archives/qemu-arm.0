Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4484412ejv;
        Wed, 3 Apr 2024 03:19:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+BqhL8xJGLZMfu9j01uQuy0CQXj4IlU9ZWr6qss+9imtMUyOlHwNljPndnCn6XzPLK8EyLBrV5QZ9q3J3er2wMDPBXt1x
X-Google-Smtp-Source: AGHT+IHuPo0w94vU43lU1R/bY7Iq0IM/aWupmkuTy/C7j1a4iUnDHr+xDAgcwQDfXEWTCiZDqxsZ
X-Received: by 2002:ad4:55ea:0:b0:699:2723:66a8 with SMTP id bu10-20020ad455ea000000b00699272366a8mr1242547qvb.55.1712139555773;
        Wed, 03 Apr 2024 03:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139555; cv=none;
        d=google.com; s=arc-20160816;
        b=yFpG25RzotvJY3B4qQ7POYmWVy1et4xcpYZTZyHH0inXrGHe470jObs8DmMYjUDVlx
         x/Kictf9BD72a8BDgFlPeYA2/kPJhPEV6UrqwtUF1ZOTCa3anz7GDgahU1L/6JRuYHsS
         VEEYqo8L2o6aOG+r1WYNHShrR3j14UQIiXil31JaIw10/f29cC8H3ssoPcDANm+w/PQA
         SVl1ABuCNbwcwO3np2eE6FkC3YfTmJ48cQtzjpTCtwtzFs91xcr5gwRwY2hphnF4Y1pO
         1QwO4lghI3EO5xkBw4IRIJZP3LER/7YHSbY+TIN6zD02S5QGqTtMcq7scN2uXGWsNZbL
         wFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=28RRVaKLh/x6LTR0kRpLqMJLfdcWWzDGtiOf/xTvcn8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=EwNdN+ysbHo1K+Z9x0/l9dMUx6g1C16AE6Vv8bzeppPePKplj15EXbKtmcs1PPV/nG
         PfSe3HZGAOI9y9fDRkTE2sl4K6ey4eKA/FjaJtpMNR7pmrNJWy6p8R6xQA9veDd7EGen
         mVbiA1cXW6HOtzJ/LMgKN/2ubXyATDvS7ljRPvcC9k9NnNtbubUd1wRKOXsVLBum5680
         UJ5mV/lCcWjTIcQsBCQADxvNarZFIvLjtQXSHXkP19dC1k0rxm4mrhg+PwM4jjLkTYMs
         GpEHtJXb4bByb0vcP/AGQuoo0zJqPL1BGt6CLlNNEhxTg4jfjhkpuDraaHpu0uP6EEKV
         taXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020a05620a081100b0078bcb61e380si11277234qks.352.2024.04.03.03.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:19:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rrxgt-0000pM-2G; Wed, 03 Apr 2024 06:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgq-0000nG-LC; Wed, 03 Apr 2024 06:17:56 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgm-0006cs-0h; Wed, 03 Apr 2024 06:17:55 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V8gfF4nLXz1GFbw;
 Wed,  3 Apr 2024 18:17:09 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 227681A016F;
 Wed,  3 Apr 2024 18:17:48 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:47 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 10/23] hw/arm/virt: Wire NMI and VINMI irq lines from GIC
 to CPU
Date: Wed, 3 Apr 2024 10:15:58 +0000
Message-ID: <20240403101611.3204086-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
X-TUID: gt2Gr4nvzDiZ

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

