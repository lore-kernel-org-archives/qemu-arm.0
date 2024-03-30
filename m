Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2320685ejv;
        Sat, 30 Mar 2024 03:35:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVbihqnFSDoP4A68loY9gW/GToHehxZk2Qf8UKxWAdZhUbRWLvAM9JGSHdK9I3H9nj7fblRe8AYbSfpYVHVGEg9y8obYoa
X-Google-Smtp-Source: AGHT+IFkt8/i+FMMgCiolIz+8p9sOKIBsazQE5av2Q4v0Gxit1SB7SCLM2SrMmDat6MeN4Go0uhh
X-Received: by 2002:a05:622a:116:b0:432:93a:249a with SMTP id u22-20020a05622a011600b00432093a249amr5156968qtw.14.1711794941063;
        Sat, 30 Mar 2024 03:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794941; cv=none;
        d=google.com; s=arc-20160816;
        b=I4LUw1UBlZLFQpQ1sgiHRb8JC35aPpp+jEbaOxNpTzzYDGE7LZhybwp6RvowSaWxR2
         wszYGSJuG0waVG/8cNzLfjoSxvoAKepevMNG7+kBjaDc8m0HawPE56Nugsjk3JW/V1FR
         Q43XOuWmnFtbobCf8HBq1Jz6CO68apallNWMD1R0AX4oPDkkG9IA3Ocpk7S30afddfJl
         +Agajebd6ZRo03UAVd1tkZ9weEIfiV4cpaGYSkIJh2VfXwKKL/nH7BA6/CLfN256dYuZ
         GjQgYIE3yl5g0qifBxiy+j9fLQsf05xMqYEDqC+xMEKDILM/sTAauVc3VV7bitmzubIa
         Oxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=28RRVaKLh/x6LTR0kRpLqMJLfdcWWzDGtiOf/xTvcn8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=p9WKlmhHbV+SvQ6Lr/LlJfGbGEvs65lHqJL4pCBAsp23O298SDiZk+GmTu/7qYmdAX
         H8ebsHlXlaRS9+9bL99ylYyxSv1ZL7NJODMol5doP1Pf5aQsxJID26B6D6qFwYPMG56N
         zN9nUwZK7bp6j9LzKPG4xY6M52/w1t7MQz8Qt5qMWVyB1LTfw9OFTfbijvVTz12A0SeT
         4h3ubDhYSfsRfE2N7R8VX0x2ewwDNy/6o5fGQBQeC17+q/bna+bUXqQcBor4KLTbjUT8
         Vsid31E2B5CFo/3Hu7RxGlerGF2HtRpRF8UsaLwwdFcVhiIHU6frpncVooYVmZoULcyJ
         bMqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020ac85e0b000000b004313a129c15si5490476qtx.512.2024.03.30.03.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rqW1L-0000Je-JM; Sat, 30 Mar 2024 06:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1H-0000Fw-Rh; Sat, 30 Mar 2024 06:33:03 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1F-0000lt-0k; Sat, 30 Mar 2024 06:33:03 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V6D9h2Pf3z1GDs7;
 Sat, 30 Mar 2024 18:32:24 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 70B971A016F;
 Sat, 30 Mar 2024 18:32:58 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:32:57 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 10/23] hw/arm/virt: Wire NMI and VINMI irq lines from GIC
 to CPU
Date: Sat, 30 Mar 2024 10:31:15 +0000
Message-ID: <20240330103128.3185962-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
X-TUID: 7cQEr4WU0gZ7

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

