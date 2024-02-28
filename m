Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp110127dlb;
        Wed, 28 Feb 2024 01:33:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUM6R9LJQI1cSw/AkuDIUpJr1oLYMENgtFWAeXPDjzgOMyaJf2jM7cBAeYIlmZfLuj3sfHERuNb2QT+TCilOZhVQZX15EZP
X-Google-Smtp-Source: AGHT+IE31+KTf135Z++iJ1XCXRVjsd2D2grEqE4vdcaZ7cptRaq6ASlw14tN1JqsOJgF2cRtccol
X-Received: by 2002:a1f:c4c2:0:b0:4cd:44db:b24b with SMTP id u185-20020a1fc4c2000000b004cd44dbb24bmr7785768vkf.5.1709112788827;
        Wed, 28 Feb 2024 01:33:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112788; cv=none;
        d=google.com; s=arc-20160816;
        b=VWCmMKZrol+M7s1bLzDKl9VkDbq8OdDIqT5kTvcgvNGlf4/VggpP74G4kRpRY7R0cm
         gHqDgJesx0lFUIcXto0eGM1P90ulxN7AAUvYgbxc5KnqlboFAASznbb/AXQmXd+gyEi+
         4Lp41krJJ2jefN+PIhhEA899QZiQRls5NTWjywYDby7CMVynUPdHZetePVs5hlfjU8Si
         OKDK4LOma9kwygsda6lg3urCoQXkuVhco3qSiuGDSdbhzOJmUW/+a4Yrw1B7vec5HTvD
         wUMDcLqr3rt+l8wFEQN8IHm7MUOKVmQU7jVqvdvf5icallUGg2CNzVihjmzuPhDSJyKc
         J0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=uv64HG1jVdpzC89HUbnMNV9mkiZRVPERLXPKwljNfBs=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=IarjU+Q5PONf1QsKLIEqlBp9LBPum14Dj+vLCSNMsFmVPKz9eF0SLWw82SHyTGaHfY
         sA7IVijodibmzSmF4qEaa5dIVMG4Z87OHCrNZ3vgcNJMmpysNPx/3p+nm45Oo9O3idxF
         KyAOITJPfV1RVkXwUX99AZRe4zs4OY7UyKtNS2wNFv42CkVJToJDfpqIzPiWe8iH1hek
         HJzyGfVMXxirQdoJThxeplJ6zvTWua6qZk2f2gbEheguVeHGQFYEp9aI5FrKPcnfVPCD
         0nBsGZwWatjMmn2WRgkzV68WMsZlWmtqRK3Dwwlc/x3/Lvd08fDQ+IxvHJseyNLeAh2d
         r9iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05620a44d400b00787c4635c2fsi10128224qkp.337.2024.02.28.01.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:33:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHY-00019q-DS; Wed, 28 Feb 2024 04:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHQ-000159-V8; Wed, 28 Feb 2024 04:31:17 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHO-0001lS-7k; Wed, 28 Feb 2024 04:31:12 -0500
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Tl8Dg0vkDz1Q9P9;
 Wed, 28 Feb 2024 17:28:51 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 67E1E18002F;
 Wed, 28 Feb 2024 17:31:06 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:31:05 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 19/22] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
Date: Wed, 28 Feb 2024 09:29:43 +0000
Message-ID: <20240228092946.1768728-20-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
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
X-TUID: R0WmyleQRHEK

In CPU Interface, if the IRQ has the superpriority property, report
NMI to the corresponding PE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v4:
- Swap the ordering of the IFs.
v3:
- Remove handling nmi_is_irq flag.
---
 hw/intc/arm_gicv3_cpuif.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index df82a413c6..afba98ad87 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -938,6 +938,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     /* Tell the CPU about its highest priority pending interrupt */
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
@@ -976,6 +977,8 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
         if (isfiq) {
             fiqlevel = 1;
+        } else if (cs->hppi.superprio) {
+            nmilevel = 1;
         } else {
             irqlevel = 1;
         }
@@ -985,6 +988,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
     qemu_set_irq(cs->parent_fiq, fiqlevel);
     qemu_set_irq(cs->parent_irq, irqlevel);
+    qemu_set_irq(cs->parent_nmi, nmilevel);
 }
 
 static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.34.1

