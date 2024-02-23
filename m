Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp476402ejf;
        Fri, 23 Feb 2024 02:37:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUnB2fL2oV4nTrm0bJ/LeVe8YLSohAAGRaUjqVl5cajgIR9ms8LnN99w5uskKSA++G3sHoIKc7HQxXYSxA+3JJOowmEWuK5
X-Google-Smtp-Source: AGHT+IFpwTY4V+oYTUqO21fWz6KNUBqayyHB40VxWCjF+1JqiBzaYKAHp47ZtgLczS74V/x/wIX2
X-Received: by 2002:a05:622a:c8:b0:42e:5c72:ce12 with SMTP id p8-20020a05622a00c800b0042e5c72ce12mr3991592qtw.7.1708684676949;
        Fri, 23 Feb 2024 02:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684676; cv=none;
        d=google.com; s=arc-20160816;
        b=t+2vrSnHCmsVt4pACcoIr25H9oncZvf3mOhwcK2aop8EbS+x2zoV+8FEMvaH6Nn96b
         QUM5wayeanlalnG5Mn1JkpMbzNkycp0vGw/vHmfktz4pLsnMJDB+6Yo1j92cMpkrBQlg
         kGeXevUsGJ9fqCvZi/gg7YoA2jW/Dg9r46UsYKgKEBi08Py4sUkAjas+QOIa+62+VpF0
         wbEo0rD3SvTP090T3CK/1HJzDsF/zNuC+3INMtOyKK7HK012ptk8+8LBz+Jv3eXQMBF8
         rFzXoeiFR7k+U92ir1FCOUqbeOMPw0VsxovS951r2mBbbO5NTV1cJgkCuKi7D+aDTWVi
         TKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ehK8fRdQedNqYAzmbLEUvcMI7Wpmk4Zxk1V1mYXgXDM=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=Y9uIb1JuWfYKITSmbhstRtMHDPagttFhkMifjghfBIPiKMYgW7qN4+rXSY7EFduBxZ
         4i8vPFJNT24cc8Cu2BbYSSp7atzHSzB780YGqPUEKTND27x6kjPEraXyItN2Zy1o9VXO
         oDc1X06/5mQ46xAR/70tmEt7BU8BFWbv2BH055JHV4FmZvI59OgnDBk2Mxw3y+kS0SVP
         qcTPYJ9LOwmJwyswp3Y7Wc71GFzYk+GGB2gULfggErFW0u0wZ7EMCsM3qwoiT1IX1+o1
         oKT9HLaqztPhvfGWParbZVeipba7i6913gFJGVEkB7kkOMpNHtO0HNHr1ArxDMvBQD5K
         aKtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020a05622a131000b0042e39eafc4csi5586708qtk.677.2024.02.23.02.37.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:37:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdSu0-0004y3-Se; Fri, 23 Feb 2024 05:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsV-0003bz-90; Fri, 23 Feb 2024 05:34:05 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001wW-Rj; Fri, 23 Feb 2024 05:34:02 -0500
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Th5tB6Gxsz1xpGp;
 Fri, 23 Feb 2024 18:32:18 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 9E1341A016B;
 Fri, 23 Feb 2024 18:33:43 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:43 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 10/21] hw/arm/virt: Wire NMI and VNMI irq lines from
 GIC to CPU
Date: Fri, 23 Feb 2024 10:32:10 +0000
Message-ID: <20240223103221.1142518-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: JCbAU2SBybEP

Wire the new NMI and VNMI interrupt line from the GIC to each CPU.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
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

