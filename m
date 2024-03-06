Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp272492ejb;
        Tue, 5 Mar 2024 19:59:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkRvdazx641zVYwEbGNxDvivTunviLULVR7giF9PzGpexQhe3AGlOkLAXljyEU7x0lZtyV9YCXnmHNYtdccRma0uJqMAxv
X-Google-Smtp-Source: AGHT+IGwU1b0QDmHf1REWMEUdAZqfqseu/quiYijNvbEDQZeWQiRwMAnZqHXvRG3U24dlHYLvcIw
X-Received: by 2002:a05:6102:2a59:b0:472:7535:2ab8 with SMTP id gt25-20020a0561022a5900b0047275352ab8mr3539082vsb.19.1709697586812;
        Tue, 05 Mar 2024 19:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697586; cv=none;
        d=google.com; s=arc-20160816;
        b=buBn+qBjGBcJrB71zWCd90Gtdq+b6L41MwJKSFJEqC0ykbI4cmkcPU3TYopY/P5Y0s
         pEptylyT+tkUPmttizxWzJXfc9eAR9B5PzYZIlHtyuTXJVqhMTscojoqXjudP0UdugiR
         1Ndkv9DuNysWSUM0L+0OMco1eGvvtdO6tT7FxfNzM0odl8be193uxdPs9YWQCJpv5hrM
         KERbnvyqsUSCrR2J5CtDeRdin2SDWoO8FSqWHcBqLCUhXUq8vMb2EOhHRLSOfP+P4LSB
         k5mSWjenBhWUnERbpORPVLJ2xe0KLdGyHRrGt4zBHkP9vNy6WH+dL9GBcgJJQBfar9PY
         pHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=eUv2z9KmY34SX56f6Q2Vdh1Bdsvd+iEMfpcSIQHA4Sc=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=kXrEQ+ytj2xt7Q93xaTOgzl3v6JdAq+/WT/JQAzQitvCBBV53W8HkhJ6aRREiGdgXl
         pliopVW2XxT7EtnIZvPTYjH54bWztYMVWEAOp75p4dyySmhWkZes/MbravehKRY2ctM+
         7KjAKK1dSO5O0uo1g0pJBP7Zb3wcy8CtnIamn9PpS/qucQXgRQ3FHtMynxADYuZ9Dyqz
         V/6JbgDVVPazAz/lLCg2IkOZFCpvZs9Fknen4WMyp8clR+m2ElSkyn2R4K5iNS4QJ2h+
         Cy/PhJb+GltsH1CdZ6vyXTRWtnwsFCoAeUajGnVxtLnYz8+6pMzCrL7KfC4GRrBW1yZO
         SoTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020a05620a22c700b0078832f5c06asi3410457qki.664.2024.03.05.19.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 19:59:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhiQe-00014h-ML; Tue, 05 Mar 2024 22:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQd-00013F-3u; Tue, 05 Mar 2024 22:58:51 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQa-0006p0-Hr; Tue, 05 Mar 2024 22:58:50 -0500
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4TqJXH071mz1Q9Kn;
 Wed,  6 Mar 2024 11:56:47 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 534DE18007B;
 Wed,  6 Mar 2024 11:58:44 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:43 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 20/23] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
Date: Wed, 6 Mar 2024 03:57:18 +0000
Message-ID: <20240306035721.2333531-21-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=ruanjinjie@huawei.com; helo=szxga08-in.huawei.com
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
X-TUID: d8oEsRUMCFKF

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

