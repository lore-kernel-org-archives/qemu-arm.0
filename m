Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475284ejf;
        Fri, 23 Feb 2024 02:34:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUoLnrejp6WNcuwSDR173B+jUa8G6i/74gC+hdfs8GYMC51mt/JFdkpT12/yFbfxq+RzrJgCE/efTJcHWb9VNwuRiLdrrLm
X-Google-Smtp-Source: AGHT+IF8IVWsMMG+lOj2K2Z2ZyOGStH/zGeuZFCVPdROvYu+m3eZM0DyfJdcHsgG2jxAgFUErvhE
X-Received: by 2002:a05:6102:5094:b0:470:5667:5d6a with SMTP id bl20-20020a056102509400b0047056675d6amr1733699vsb.27.1708684494665;
        Fri, 23 Feb 2024 02:34:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684494; cv=none;
        d=google.com; s=arc-20160816;
        b=fx13lhubfC9VFcB6XACaPZDNKLXk/6ZwQd4EnKwUCwcOrMHpTR4vJY8AGcF/wlLNzk
         6ikWmN2p0cio8moFcXLA7Q7aOdJeNlfQ4bs8ll3emOrMtMdjG1++Cf1Hd2ANR2dJF0xj
         RcbHJofKfOXUqBrOC9Mpx4qIwSmStI7YdG+0UdaWmNU7NSqxY+UAFE8UWpGDvwy9l/W/
         n4yakrOIQ3SjxMPj9POtZs8gIJ6mAtftQO6NGBc+L2Z2uIbuHvJjGgSNQyClGYQVHJgx
         y/gVkPWC4Jj0bLJWrjIuJnE8z3LtwY38mC8iVvdL2xCzGfiGR1Zh6B6sjREENejZqHhQ
         QjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=W/W+CQrihrdsZX1L9SgeTVyomAO8A2rbJBfwxNnxHts=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=ewQC2AW53NulJRElDNX/wvCOlCaV2iw1tR9vyXkpqNsT71fCsRMWTneLWZVrGW5Aqz
         PwQicRpfFX6yQtRutUJrJYmWId4e4G8tVChqVXf/PCr0KlemfkehLeal3Xv4mjYce1+j
         OfBi9wdqB+RKk53dPkcv4+/ftfhSz5ceYBWfK5pUyI9SzwrxztIEtFYddS05iw1kJ2sW
         vJ+440f0Wtbt6KfJkCyi/XB/8AE7pC+T4wCkP6JkEQmy4M/b5mwE/UZsIczNQAavQ+VO
         9sokGawfCSmV65thlj2p5au6jnz0RL9ELTcT9P7BDOwzTZ5Vf+B7XVUFKpPgnwsp5cX6
         CdWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id yf21-20020a05620a3bd500b00787ad2e6919si1481761qkn.411.2024.02.23.02.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:34:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSsg-0003iX-UG; Fri, 23 Feb 2024 05:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsT-0003bb-VH; Fri, 23 Feb 2024 05:34:02 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001xG-M0; Fri, 23 Feb 2024 05:34:01 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Th5sS23pTz1X33s;
 Fri, 23 Feb 2024 18:31:40 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 3D6FE1400CB;
 Fri, 23 Feb 2024 18:33:51 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:50 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 19/21] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
Date: Fri, 23 Feb 2024 10:32:19 +0000
Message-ID: <20240223103221.1142518-20-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
X-TUID: S0zGTQ6CW+Mn

In CPU Interface, if the IRQ has the superpriority property, report
NMI to the corresponding PE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Remove handling nmi_is_irq flag.
---
 hw/intc/arm_gicv3_cpuif.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index f5bf8df32b..3ffeb9543b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -931,6 +931,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     /* Tell the CPU about its highest priority pending interrupt */
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
@@ -967,7 +968,9 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
             g_assert_not_reached();
         }
 
-        if (isfiq) {
+        if (cs->hppi.superprio) {
+            nmilevel = 1;
+        } else if (isfiq) {
             fiqlevel = 1;
         } else {
             irqlevel = 1;
@@ -978,6 +981,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
     qemu_set_irq(cs->parent_fiq, fiqlevel);
     qemu_set_irq(cs->parent_irq, irqlevel);
+    qemu_set_irq(cs->parent_nmi, nmilevel);
 }
 
 static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.34.1

