Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp521279ejb;
        Mon, 18 Mar 2024 02:39:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0hHrH6Oxoo2h+HdbdiBvfGS1iU2rochmZNNF48SbcYIcAZEJ6xSv3z4b24Yqhs9LeDrhPnC3pvpNOCExxTSAQaJwbo9WS
X-Google-Smtp-Source: AGHT+IEURCsD5pd+E4lpO9Hfp/aJ26Wb9R6kFUndhYoMxqqF4yGjlXu1wBTcQhfvcmvp6CdQ150/
X-Received: by 2002:a05:620a:408b:b0:78a:74f:8a39 with SMTP id f11-20020a05620a408b00b0078a074f8a39mr805325qko.68.1710754747446;
        Mon, 18 Mar 2024 02:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754747; cv=none;
        d=google.com; s=arc-20160816;
        b=ltg4M7zdvFwA3Z6TTK+zRcecTwZ/bLimzy5y/8Gmdn+CuuhZoEYOATuTVV27G2smV4
         Ike1u3ISpoD0P8o3/QXd6GkOsTi9RWHjwJbU+AxtnSQIS6z9ZwpfSN7s+wL4msp/LopD
         6Uea8qCjkJ5cniiU/wpKqVK0TdQluX+A4kc7CnZtXcTk20Ac8qi9LmcH4L1OEjEEeWBd
         WblScOiHbxPR+4lTG8G/bsVzFwkUBvG3DB26yDPAHs5/7KmRxqnRexzrn9TGeapsiZYz
         2VrZY846/JBznDvZgUmAro3I3Th55l8dafY9ty7hxESFuCFbnYg3j7GtsSsaLY02eGgT
         Lm4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=bV2qmxVL6SODOmsM5SIrDQvwh6Zt7MiViQJJ7t0fqNg=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=tkc/gLFVHgbALWa9mBPH975p4d29rn+2Om9v7d9caWuQfa7cRAoYlU2HGgGp33RvHL
         cm7I2AOz9uWJz+hXxzDyzOJTWM+OLdJR5VqXHHUE5EyQCdvu+/XraKjxBY+7mNNJZyoC
         1YpPQdsTcF0XieuV6DLrwlSNXeNzKCCGYrJqSOHIiHdETBhGJFg8DC4/cBwSUrLJ8+S6
         MsWG6NyZhfI52jUIEJSz3eYXVQ1ghoffkOzNCH0awt+65+ogYFCO+nJ00Z4F6nDtz+F7
         +gZnVhF2XCmw4kJc6DwFBuwf1nB0cfYzF8kYVbdz+qnj3WAfkyvR0nGKedvq/khv9vY0
         J0Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vr28-20020a05620a55bc00b00789e6f7f6d6si6188379qkn.745.2024.03.18.02.39.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rm9R5-00042K-Qk; Mon, 18 Mar 2024 05:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qq-0003un-64; Mon, 18 Mar 2024 05:37:24 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qh-0000vQ-6L; Mon, 18 Mar 2024 05:37:23 -0400
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4TyqSX3p7Yz1Q9Wh;
 Mon, 18 Mar 2024 17:34:36 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 6F4C518002F;
 Mon, 18 Mar 2024 17:37:08 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:07 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 11/23] hw/intc/arm_gicv3: Add external IRQ lines for NMI
Date: Mon, 18 Mar 2024 09:35:33 +0000
Message-ID: <20240318093546.2786144-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
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
X-TUID: anWX4XUSi7MH

Augment the GICv3's QOM device interface by adding one
new set of sysbus IRQ line, to signal NMI to each CPU.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v4:
- Add Reviewed-by.
v3:
- Add support for VNMI.
---
 hw/intc/arm_gicv3_common.c         | 6 ++++++
 include/hw/intc/arm_gic_common.h   | 2 ++
 include/hw/intc/arm_gicv3_common.h | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index cb55c72681..c52f060026 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -299,6 +299,12 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
     for (i = 0; i < s->num_cpu; i++) {
         sysbus_init_irq(sbd, &s->cpu[i].parent_vfiq);
     }
+    for (i = 0; i < s->num_cpu; i++) {
+        sysbus_init_irq(sbd, &s->cpu[i].parent_nmi);
+    }
+    for (i = 0; i < s->num_cpu; i++) {
+        sysbus_init_irq(sbd, &s->cpu[i].parent_vnmi);
+    }
 
     memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
                           "gicv3_dist", 0x10000);
diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
index 7080375008..97fea4102d 100644
--- a/include/hw/intc/arm_gic_common.h
+++ b/include/hw/intc/arm_gic_common.h
@@ -71,6 +71,8 @@ struct GICState {
     qemu_irq parent_fiq[GIC_NCPU];
     qemu_irq parent_virq[GIC_NCPU];
     qemu_irq parent_vfiq[GIC_NCPU];
+    qemu_irq parent_nmi[GIC_NCPU];
+    qemu_irq parent_vnmi[GIC_NCPU];
     qemu_irq maintenance_irq[GIC_NCPU];
 
     /* GICD_CTLR; for a GIC with the security extensions the NS banked version
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 4e2fb518e7..7324c7d983 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -155,6 +155,8 @@ struct GICv3CPUState {
     qemu_irq parent_fiq;
     qemu_irq parent_virq;
     qemu_irq parent_vfiq;
+    qemu_irq parent_nmi;
+    qemu_irq parent_vnmi;
 
     /* Redistributor */
     uint32_t level;                  /* Current IRQ level */
-- 
2.34.1

