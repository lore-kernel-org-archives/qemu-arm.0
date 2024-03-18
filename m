Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp521906ejb;
        Mon, 18 Mar 2024 02:40:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXw2pbQ18xXPehL3CMFc7lGzy3M1BviSe8lBjxnlciL/9R/rpck0k2G+9mXsqZORmSzw0VLRv3O315aLE0S/wDii0d5erg1
X-Google-Smtp-Source: AGHT+IFPxQ1/28OZCCJk9deHxKNhsg1AnC6ADQIsNgtVo7OMTIzEXdpZcYhFQV82Rb3ExcWC7nUZ
X-Received: by 2002:a05:622a:150:b0:430:d9e8:f56c with SMTP id v16-20020a05622a015000b00430d9e8f56cmr744280qtw.30.1710754834714;
        Mon, 18 Mar 2024 02:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754834; cv=none;
        d=google.com; s=arc-20160816;
        b=Azkdu6qk+TQLW4zBtnm1RBeLvtqnbDcjKRSdFtEYSPXzq8jUfX9Z1SgOihaOKMfVzC
         fIARV8f6r9ancAd8vPJH+vXq0nh9iOavLlDxGDt5zt63eWI178/vWVEkvroaNQYVcX1o
         UaH+g7bTZzfPLFFkOpdTMclk9LHque/csJzxKB84XmMce+EXuMOxeIcDIvwebfEaUd/U
         Nu0RcrwJmVzdDkyru/vqe6ZQOUTHsXZs8wHlSPKkYji4+8v9h8Z7Hy2kCQ1v9gcrwmtq
         uvBSKSbAS7e7wcRM/yzPeNSjh3KBwbrSnhgUF/xTmhYmJVOeT2LJoaFoBgAVOtEgTwh0
         3gMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=PZcGnRfK5dGxpBvsMgCq2X4V1CxktYSqk4zeVWiqeBg=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=tLi84p92cUOuI9bSen3r/o2SbaNqPgkOX64+svY8D1wMrqDjwoAtIGq9+U8tEEhPpt
         4o4CN4vVbidkEN5+QOeumKp/YvK7Xt//ynKmvj8rSa6VGJqFYTOrCXxzKwJLkkiB5I1c
         i7lpVSPotC9gBaWGDSfDxidEppxnHAzBrlhdPFO/xBUz4OK8JRzlISK8MDTWfKcnkkvE
         mlITHCLtLKKkPYX+QvADSB5J9Dp7+Rl5DBY56Q3NopY4Rr5yZiWJaOddtayHhcDUTOYy
         GGakw0fezx++0/YsvqFoSwpYjprZTjgOg2qxll6SMuMa69+SqeaLHIL044m+TOAQ6zGM
         0kbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a05622a030900b0042e59e7b042si201042qtw.714.2024.03.18.02.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rm9R0-0003yW-FL; Mon, 18 Mar 2024 05:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qr-0003vZ-3w; Mon, 18 Mar 2024 05:37:26 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qj-0000vL-1F; Mon, 18 Mar 2024 05:37:24 -0400
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TyqSX0cTkz1h2jM;
 Mon, 18 Mar 2024 17:34:36 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 7EC4C1400CB;
 Mon, 18 Mar 2024 17:37:07 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:06 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 10/23] hw/arm/virt: Wire NMI and VNMI irq lines from
 GIC to CPU
Date: Mon, 18 Mar 2024 09:35:32 +0000
Message-ID: <20240318093546.2786144-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
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
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: wy4nZlfaIiuf

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
index e5cd935232..dc7959e164 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -821,7 +821,8 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
     /* Wire the outputs from each CPU's generic timer and the GICv3
      * maintenance interrupt signal to the appropriate GIC PPI inputs,
-     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
+     * and the GIC's IRQ/FIQ/VIRQ/VFIQ/NMI/VNMI interrupt outputs to the
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
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VNMI));
     }
 
     fdt_add_gic_node(vms);
-- 
2.34.1

