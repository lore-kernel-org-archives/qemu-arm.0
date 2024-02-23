Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475971ejf;
        Fri, 23 Feb 2024 02:36:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRJlPLaqdCHvNVgf0wHe2vhp4EEdYTodFjJMR1OHhEBa6A0FqhW93e0EtauliyO4kiPx7mHTSyRwfH5gFPb7XWB3kGRAKs
X-Google-Smtp-Source: AGHT+IFeSa2be5662q1rtPTQOwLx2WC5FZmXnpvZGxdQbwsISdQ3MxWX+3wGXLjKSSVJDGbKPkbG
X-Received: by 2002:a37:c406:0:b0:787:9be3:933b with SMTP id d6-20020a37c406000000b007879be3933bmr2693762qki.37.1708684607799;
        Fri, 23 Feb 2024 02:36:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684607; cv=none;
        d=google.com; s=arc-20160816;
        b=VZBVm14/+NfDRLAFPzvJ1Pnp72BZ6f1haygZtLaTBXc2VbuF54gGEjspUUUxipFBy7
         7708jv9Pdtac9axDZJGRgkMO1a84oiyY6ekDzFHW+t9gFk4EBfIu8FInDeA9MOaual2K
         m2Z5tdOByt8crTwAAA0pdzw8Wk6wOmh3FmtTs5kQ4QIiLexXw13wTnee4XHht3ISqNJ9
         1cqnSs+p0HRMIyQRAiM+IMHTY8Ce7orJaGhWYX+ZjnL3E65WjeN2NsoprSCMFZ4y5h4/
         tDb2u+6zo1D5/O1aOIbmAnYqU7pC3E3KZ9D+FKlxcPzxiyM4jSuI0XRem/U2YuFkFDlt
         yYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Wgey5k0qxU1nxm9ocrburaN/2klHb/V08dv3mklhNgs=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=PxIJJREF804MOoI5ofwiU9pDuG/TX9KqBSUx5GqQopaf8rP9ZpgfCc8wY+hGWaMFPf
         f4STCiNHV6eqDzR/ybAfHoKgt1ay3UqvT/2uuEvOrJyZUc+oScB+s9h5SD5TGSLAFXLT
         HZYvPa6Kd+MIwp6N9BUU5KHmfilTneOrk87dXg6giY366mN3icjDzdjG9fk5J0iVWnum
         Ei0Dm/rJ0qavSsZmLuTPwu3UwVomuE8bj2HvJ28UTFHx+lyAL1tlFNI111/J/hYsz4zG
         fBgjZvwoC298a5F6mb1R5k/SBLtMvWM3gFmXghNpzRBF/PCsaN/15Pu13JR94emOCtBb
         td2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19-20020a05620a147300b0078741d4a738si14529245qkl.504.2024.02.23.02.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:36:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdSt4-00046K-6R; Fri, 23 Feb 2024 05:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsS-0003bR-Vr; Fri, 23 Feb 2024 05:34:02 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsO-0001wZ-VV; Fri, 23 Feb 2024 05:34:00 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Th5pB4YJrz1FL0c;
 Fri, 23 Feb 2024 18:28:50 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 7DB7E140485;
 Fri, 23 Feb 2024 18:33:44 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:43 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 11/21] hw/intc/arm_gicv3: Add external IRQ lines for NMI
Date: Fri, 23 Feb 2024 10:32:11 +0000
Message-ID: <20240223103221.1142518-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
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
X-TUID: s9fmMd0MCRRa

Augment the GICv3's QOM device interface by adding one
new set of sysbus IRQ line, to signal NMI to each CPU.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
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

