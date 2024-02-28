Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp109559dlb;
        Wed, 28 Feb 2024 01:31:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXv/6O/XqeadgGE8gRnGOI5l6QdjWycGYsJYqoMGZIAEpCVCEDMWHkZNEW0FIGud0uhNAEyZOfQhU2bMagSSM+nI5EdTckR
X-Google-Smtp-Source: AGHT+IFY361qcRQy2OkDXLkWN6JgPIHBH1BHdk8PB5TD2PlF3sUW/8gJr068Rcdgl/REXC9BWiBK
X-Received: by 2002:a05:620a:45a0:b0:787:9d04:9528 with SMTP id bp32-20020a05620a45a000b007879d049528mr2901758qkb.21.1709112714707;
        Wed, 28 Feb 2024 01:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112714; cv=none;
        d=google.com; s=arc-20160816;
        b=h0MY0D0P1s6+8+jIVqrUB3DDA9Acp8apbELqG84Cg9Qd1hVco5NOUjesdhzBeWM47X
         Y6L8Hn0bmk7SBAwo1DlEN+3SQTgt9R/Zl+jIqjGep2nMR+CvKk+Ts9xnojKnJ9Q0jv0o
         cyWuDnl7ttFUjkqx6TnI8vKjJQulxG4ZQM+kj9d1P+aM7m3nfhE+3zrby7pfjgCI5Nzd
         F2PnyUxAblXaXnHMyr0eH4gYkk76KmBDmjuU5tMeC5OwWhJQuM3Gt1GWBE1w0Z5Sd8Ar
         QwCI9UdyIrfXDOK9tLcx5aQa55WhGMF/MAzH9D4heIKdvTa2F+IGXD1Jjso4/SMqI74A
         GaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=bV2qmxVL6SODOmsM5SIrDQvwh6Zt7MiViQJJ7t0fqNg=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=trshXNlJavQWMRq8VxJBr94wskAHSk/v7xEQy9WDIqHN7MCL9WBxyMYxOGImKobCdz
         EsNJYCYwxlbhmRs6JTTSs1hUA50criNEbYo6kVAmVxmmdOiMb4fXX4K8AQZtk6TXBt0J
         x+BQuoMUCWVwKyzbjLzLDYRf/Z35cRyg2LVxEG/snE7CLHNnHGbC6oOLqhCknik6ECyj
         D4dAj7mQ66J0nNgYuM1nRtuUhWvWUtY5GSizUuNmloi7hqpOhmG1sSeKmLJyThIrJGNM
         GIKar5t0+/PCd67zqEX0DQRAXEzTfVJvd/+Mu84GBlCgQ5vLf5x59GiwEwxrSTf+XIC8
         xwuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q23-20020a05620a0c9700b00787d4d630f9si5743588qki.315.2024.02.28.01.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:31:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHX-000194-5Y; Wed, 28 Feb 2024 04:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHQ-000158-Se; Wed, 28 Feb 2024 04:31:17 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHO-0001sQ-BX; Wed, 28 Feb 2024 04:31:12 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tl8DX5Rzvz2BdxH;
 Wed, 28 Feb 2024 17:28:44 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id B34AE1402CC;
 Wed, 28 Feb 2024 17:30:59 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:30:59 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 11/22] hw/intc/arm_gicv3: Add external IRQ lines for NMI
Date: Wed, 28 Feb 2024 09:29:35 +0000
Message-ID: <20240228092946.1768728-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7XF0MsF8IbiT

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

