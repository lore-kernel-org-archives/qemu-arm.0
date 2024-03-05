Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp113398ejc;
        Mon, 4 Mar 2024 23:10:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfqDe0RE70XgiBadke9pIUvSOnEJs+YnmkxTn5LqP3eUHhVr/3UYP766R8L4wu4+j4WbseM4MlBv3aZiDVKy6oTniGsNpb
X-Google-Smtp-Source: AGHT+IFQcTF7tF4iEe0FPHlpuPKdT8uRerBtFQ72z8zwWJh7S0JaL3TfsM8BlDKBlzKX98OXvoLa
X-Received: by 2002:ad4:55ea:0:b0:690:5289:bf9a with SMTP id bu10-20020ad455ea000000b006905289bf9amr1072291qvb.31.1709622608405;
        Mon, 04 Mar 2024 23:10:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622608; cv=none;
        d=google.com; s=arc-20160816;
        b=pKuaNha9062BfFvcxiS3cWwS2I3W5fXUVk9wwVNG0E6hpOYBRKUaNyT4iqI9B9XU0g
         PJmzwDrSlc4ZzSwYXHg873/imQLbZAeeItfeu4l8agTSUIeLtPjdSgvQf4ElQzn3Q0+x
         t9N214JquTHtuzBuc+VYmnNz/hRa+XWv7y/wuWjqfp/rL88UJBZd0Z9OUeSy4iRUEAwo
         SpeGxkJGZYK3Rfiieud6hsdbOTcSltiJqgRtdUnNMe3PxfjgiOar+6mZIVQCvNnisYCX
         5ItmJ3DjHcBDxBa96TdHYVLLlpTqDEneVSx/d3USdzi+5fQ5FYVo+ds7kShQFIPoAjQH
         6kKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=73/lLjUC7vy/VMSuYDHESMt2TDH58XTjVE/APL9O/JU=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=PIXtS/jLrQBNJe6c53liguMYQlsJ6af341k0MR8NQHU3xkRWc7wROkvajgrq6XmmD1
         oAISv+Ns4XSmAo5iaGE5k+Lx1IMKo0UvmaN7AFJ+feFHl3hCOwhtOXoceZy6WtYBBmVn
         LQg0yLaaASWEYTN7Mg0atL9i0XZvPKZ5faUxUx/ZEBwaf/vfdXrxrHL4h7A0i+xL/llg
         1QiyIu55sKaGdG00lOOAjed3qJrmxFmAryvkrzeELtT4JSXoCv3C10whDd1KoP+HRFRb
         DCFoMSxFF8w0ZfjuFinNnfv7qt5gxCaYOEAnbiu8eINFoouFjtmTKFn4ZZuaGuQLtDka
         YJuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a056214212400b006903735a9c5si12598788qvc.568.2024.03.04.23.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:10:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhOsn-0005u1-7d; Tue, 05 Mar 2024 02:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOrV-0004Qa-ND; Tue, 05 Mar 2024 02:05:27 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOrT-00006u-3O; Tue, 05 Mar 2024 02:05:17 -0500
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Tpmjk0J4yzNltB;
 Tue,  5 Mar 2024 15:03:06 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id E366B14037C;
 Tue,  5 Mar 2024 15:04:42 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:42 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 10/23] hw/arm/virt: Wire NMI and VNMI irq lines from
 GIC to CPU
Date: Tue, 5 Mar 2024 07:03:18 +0000
Message-ID: <20240305070331.2151131-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
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
X-TUID: VVkW8WK0B/xA

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

