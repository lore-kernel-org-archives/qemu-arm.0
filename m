Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp112831ejc;
        Mon, 4 Mar 2024 23:08:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwR/y9rqIv3I1lmrBqXyLWxfBKWGAAXCTVtDYr1v2MB0T5v+o8CPVynnz8uykC6Ov1gfHO2Gva2f6YZoDJBTof7qhaJ+PO
X-Google-Smtp-Source: AGHT+IEcAFqqwFgKBCCH9xuKFFQf3KCWg/Q4MtqOAnqvynTP03t2P1HFlOMRoeWyDYgNJJcmctD1
X-Received: by 2002:a05:620a:4606:b0:788:2631:188b with SMTP id br6-20020a05620a460600b007882631188bmr1308378qkb.39.1709622520683;
        Mon, 04 Mar 2024 23:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622520; cv=none;
        d=google.com; s=arc-20160816;
        b=CcoKlpzlmVbcurF7v/NM2nh4zJJA4DkQ7aolbeDCecEk1qXhKdKEjR08gVIMfjlXny
         grBm+FtDh4b9z6N817V3RBMwgGli6Fy0dX+iUD4TUFvSlMCxgyBaUNg2cmzKJvsKHbm6
         V/kixFWmhXvodhajqgzfAqEhLcHQbKUs9h0pXnKGLRFoQdpfZK0e7mly9QW/IvtJTnHm
         F/YBSslpEOFFhNH/UUd3i/Z2rpQK3BrqEP+Log5Ez/69y9HjRiIwLpe3KSLbgXLOD1X6
         jcQ85k6z6O3V9bzaUmEVQNx1XP0CVJ7pdZ9LZNRvluoMwAnGaA0w2P5w7Vwuvunb5bPW
         fkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=eUv2z9KmY34SX56f6Q2Vdh1Bdsvd+iEMfpcSIQHA4Sc=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=MsStSpjGlG7FbP5odYjCDP4tOQFpMB+smcnIHiYQ8EuV05lUlAId30KVN2VYZC54PK
         qN9cdkHo9jhX+ez1MLwmz6uz9CEkYPmqC6mLrutN2nmBn3a3nxaTQOAFRfOBVycJrg0+
         R4fb9zwqEsdIPzaninnAjb0xDX3OFtCTo56SB3h3uRpG5IkHlXaM6lNcCQjPmORh5Gr/
         i55IiHV1ZuqjeYRY+OUwpNS48sORd7z4pr2Wj+sisdQnNUaQRz8RPZj6tR2L6Om61bWH
         WUAdp3VOtw6HRgsig8UDVWj9lTev+noF2vs4hP9xV1dGJHJ/NntNDYbD0mQ4ICG30662
         o66w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020a05620a148800b007882eef5651si2490697qkj.63.2024.03.04.23.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhOu9-0007yK-59; Tue, 05 Mar 2024 02:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOrC-0004DY-4q; Tue, 05 Mar 2024 02:04:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOrA-0008Ta-4s; Tue, 05 Mar 2024 02:04:57 -0500
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tpmlc4XQvz1FLcx;
 Tue,  5 Mar 2024 15:04:44 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 79B241A0172;
 Tue,  5 Mar 2024 15:04:51 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:50 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 20/23] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
Date: Tue, 5 Mar 2024 07:03:28 +0000
Message-ID: <20240305070331.2151131-21-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
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
X-TUID: oZQRhTRqZYeR

In CPU Interface, if the IRQ has the superpriority property, report
NMI to the corresponding PE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v6:
- Add Reviewed-by.
v4:
- Swap the ordering of the IFs.
v3:
- Remove handling nmi_is_irq flag.
---
 hw/intc/arm_gicv3_cpuif.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 9a7d089dea..483b1bc4a3 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -967,6 +967,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     /* Tell the CPU about its highest priority pending interrupt */
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
@@ -1005,6 +1006,8 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
         if (isfiq) {
             fiqlevel = 1;
+        } else if (cs->hppi.superprio) {
+            nmilevel = 1;
         } else {
             irqlevel = 1;
         }
@@ -1014,6 +1017,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
     qemu_set_irq(cs->parent_fiq, fiqlevel);
     qemu_set_irq(cs->parent_irq, irqlevel);
+    qemu_set_irq(cs->parent_nmi, nmilevel);
 }
 
 static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.34.1

