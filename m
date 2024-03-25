Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564304ejj;
        Mon, 25 Mar 2024 01:53:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWX4romhCi2wodQTDlECvDYzE97lNHjcIgOeHXQVm+aGeiNqFJVy1+Rgah3qX9WFQyVk2vk2OFsqEh8gTMDF40/UOMYEvGm
X-Google-Smtp-Source: AGHT+IGW5F9EVC/uAHcTSHW7fzlbCxhI6E0UuFEOx6MYluDOedonZlPLCZMRDOFJHmMgwIAnb0DS
X-Received: by 2002:ac8:5f84:0:b0:431:56b7:ec62 with SMTP id j4-20020ac85f84000000b0043156b7ec62mr3027216qta.21.1711356822302;
        Mon, 25 Mar 2024 01:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356822; cv=none;
        d=google.com; s=arc-20160816;
        b=aHXT/PnX6HVs8PBZFXJjExx2lHTJLxDe+nZNGwS+C1Koq38uN6ECxWcGk3O1K4ZP0c
         Wmie6HvoiEG2VVdVjQHzSgiK25LwBXVgjqVcTo39ta0hKt3qQ6V13Wa9VuW/uSRGeZR8
         eyXER65sso83I7IlzWW13Og2EQdSuAQTpjOenBjVbQ48s9PlMgZQAvgzavDnl7gg4G24
         zswLdW2lOff+8ODWiMrTTQrUZr5U7KZNBJonfIoRIasrUzs9ckdZQLXJH7kcFr+12hqu
         0/WtGkD0SPNsDJ8yEdpzMEtW2mnbGumVtQ5i8qg5cQMQUCQGqH83i9mL7BIeAYY2rND3
         FvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=28RRVaKLh/x6LTR0kRpLqMJLfdcWWzDGtiOf/xTvcn8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=abIA0M7dn/S2GpG5bRe//4R68SvRhNbsRkrRkdr0yuKtwU3hPF6E43BVxxwFsbm8BQ
         shm5qAteWrnZAKn8o0l6LclJ9S7ckkVM4R06v24xrT8tQW02bIteMLOmhWAeGZFPewnR
         eFzuVHebkDl363vsSePtTPTQAApGmK/v4jOAbdah8+qtG0SdbEzFcH351GpRFdHQHL7A
         ZFN5H4xSTITlrrMrYMdHjohdaUN5sf7MRr5gY2gqvgzlTUgYN6r21zXrDABBj0vNXcHF
         W2NnKHnF8gGRL0O0y366Csq2zXVax5rrMTBNhW5iWhxpmA/5tJMUoACMg8oquZslWo1S
         PZZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020ac859d6000000b00430eea7893asi4961619qtf.238.2024.03.25.01.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:53:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rog4C-0003A4-IA; Mon, 25 Mar 2024 04:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3p-000300-MI; Mon, 25 Mar 2024 04:52:06 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3l-0007P4-0r; Mon, 25 Mar 2024 04:52:04 -0400
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4V367q4sLKzNmMG;
 Mon, 25 Mar 2024 16:49:59 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 4E2C91402C7;
 Mon, 25 Mar 2024 16:51:58 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:51:57 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 10/23] hw/arm/virt: Wire NMI and VINMI irq lines from GIC
 to CPU
Date: Mon, 25 Mar 2024 08:48:41 +0000
Message-ID: <20240325084854.3010562-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9ZvPAHr5RfD8

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

