Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp373972eja;
        Thu, 29 Feb 2024 05:13:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWccny8fShdFQsFnkN46FKGeAhLNzt5m3C0V+JFpOg47xkEyKr8abgqv6y8fLVGpcG6CuKBMunG0KBBdprvfyDu1BFTaI80
X-Google-Smtp-Source: AGHT+IEgdOEhi+T6FCtfhtk9ETAFDJqVjGlI6LErihIh85Exjb3gPZ6IQ0YxH9hhW34j9SvKaqLT
X-Received: by 2002:a05:6214:702:b0:68f:e46b:47f with SMTP id c2-20020a056214070200b0068fe46b047fmr1906021qvz.17.1709212380410;
        Thu, 29 Feb 2024 05:13:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212380; cv=none;
        d=google.com; s=arc-20160816;
        b=DEz7c8Yqf5yLUF54LeeSh6VUg1kNXcftpvEy7iqe6lDFc4/Uw8naL9ZTWyNSl5u2D7
         zLeCVBWpqERZsfJaGFN2SBpANL9S5g526Z/NHUM/ybPBYzG0FIsKOFlX0I3kmcP2pWU7
         enb6X6aCdNfPf+91bWHpo+j/8R+3gLWF+wpNpE3ixKbTzB8uO4angLRf15VVGIhONDCE
         Uq//lzwYFB8VVDb6d/5uVCfn2mnzYuEIZgjA7JuVdp6pQdkhNriUMYt07UHl1k2t7hON
         loZfY0yMk5AdTvizC71AkXHnrPZh+5yHSefYNBPpyljU1lyM9JbqclBSXEEA0EsSi6hc
         tTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=bV2qmxVL6SODOmsM5SIrDQvwh6Zt7MiViQJJ7t0fqNg=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=gpIS+6W2wbUUqpmQ6GlwRwlX7sP+sHccIHJunleMkJczlzVFDvrV05c9Xp60RGLNB4
         Knd1ARwmWsNI5vdAoECoJQu9xzUHrvuXoP16i2HUljSDDgIP6s9CRy/lFUxm4uJGVQau
         +BjrjtNe7M0DGbSrf9ywbzAWqqVKwil7/891UFOt4f2nbnIcLDF9Su4JOhIutoYTTbF3
         H3Xj020CPNhkI/8nWEJvSmeM8y9+Q7I+vWOe3xcPcC/WiHFfhmdzz21u0tzE8Tl5LB49
         +D0STtuKlfQfLru+cgMrEWzIjei4ABTmQMI/1B6SSjOL+O8KCE7M/gIZjqCn+c2hCS7I
         4isA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu4-20020ad45cc4000000b0068f7071cd09si1320716qvb.100.2024.02.29.05.13.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:13:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfgCa-0005a9-Mu; Thu, 29 Feb 2024 08:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCZ-0005YH-Cz; Thu, 29 Feb 2024 08:11:55 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCW-0002ec-Qn; Thu, 29 Feb 2024 08:11:55 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tls5k6MBWz1xpWB;
 Thu, 29 Feb 2024 21:10:18 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 398C01402CE;
 Thu, 29 Feb 2024 21:11:50 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:49 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 11/22] hw/intc/arm_gicv3: Add external IRQ lines for NMI
Date: Thu, 29 Feb 2024 13:10:28 +0000
Message-ID: <20240229131039.1868904-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
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
X-TUID: Nv/1E9czKv1x

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

