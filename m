Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4485738ejv;
        Wed, 3 Apr 2024 03:22:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDtAfFhLxn3gSZjsibnDjnXWqJsgJzGYRNTl4HbGD7BskFzQ0bnZ+glxdJOqRub6ty7ta9ZPTECHH6ixP6zWAykAxec/8A
X-Google-Smtp-Source: AGHT+IF4Gw1ugTSfzIL5hDSja7rKhUZyyLD2DDrO7bRj10ZWlE77C5kivDNvFV56Ec6farTDY0gF
X-Received: by 2002:a05:622a:2:b0:434:3f82:40e5 with SMTP id x2-20020a05622a000200b004343f8240e5mr2578379qtw.4.1712139741228;
        Wed, 03 Apr 2024 03:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139741; cv=none;
        d=google.com; s=arc-20160816;
        b=cj3SdbdYAHv+RaFlwIwRRclb8nmAYRAUV09no6TCkjR93+RVStYzxcPbG01RY3jr+G
         lV0C5/pScagtZU/ueL/Nt90uMQ2ZXIsqRhQS1qGXg3PECd5hhdxLvcFVF5O3GZm306pg
         pGjiiLJvgtS6+O456TmxmC6CnwqSHqS2ECOyp5uEn9TkrsvvLaOxQWXXxK4WZFkVUEpd
         pvMacy9JC83+KNl0QVzKVwPuoCgcD20AEEd/SbNIQcJCQ0BvIid043l9aDwZJujXrgut
         kVQRnG/F1+UsV+Eo22Woj0tYKzMLD3bMzv6mdtxlIVj6RwsonrEow4EQEMeUYgbU9sLo
         TEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=SNaopMjU5NW58hDXiCLMLS5k4V9trtjUDk+FLbNM52Y=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=BtuaabktWOHx6CDhASNgXtkwiz4SbYHZq8AGNYwxRsNwkIMJukCMDl8d4jhPhn3zul
         mH9ndVoGSdJgROH4YxZj8djtAYwfFtKAwV+xAGEFRNCbDi2RJcYkl6PKEKRFGuPKtlCM
         0S7m6DjuJHGxZBKz6xRrNjWrTtLyKJU8cU1fyFD+pC+/1ujaKAc6W/oIQeWCGRuhwgDw
         V8n3x3or2rRIuD8LnssWnL41QEXNAzXALhJoZzcZh7dORLj+aZHRx1sb7vHxsLfM4NAo
         8HV+eDinJ+fUFjdX5tQjBbi4ECLy0bAKi1sYuqNMXL8ok9JRW8nNojpFgZFQ/XqBujrX
         smJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18-20020a05622a05d200b00432bd6d156fsi12396363qtb.553.2024.04.03.03.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxhO-000167-ML; Wed, 03 Apr 2024 06:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxhA-00011F-FR; Wed, 03 Apr 2024 06:18:16 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgu-0006g7-27; Wed, 03 Apr 2024 06:18:16 -0400
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V8gch1vCJz1ylZ8;
 Wed,  3 Apr 2024 18:15:48 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 4F463140158;
 Wed,  3 Apr 2024 18:17:56 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:55 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 20/23] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
Date: Wed, 3 Apr 2024 10:16:08 +0000
Message-ID: <20240403101611.3204086-21-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: 5fRqF4FTAUNJ

In CPU Interface, if the IRQ has the non-maskable property, report NMI to
the corresponding PE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v12:
- Add Reviewed-by.
v10:
- superprio -> nmi.
- Update the commit message, superpriority -> non-maskable.
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
index 526740aa7e..93476f4744 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1037,6 +1037,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     /* Tell the CPU about its highest priority pending interrupt */
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
@@ -1075,6 +1076,8 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
         if (isfiq) {
             fiqlevel = 1;
+        } else if (cs->hppi.nmi) {
+            nmilevel = 1;
         } else {
             irqlevel = 1;
         }
@@ -1084,6 +1087,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
 
     qemu_set_irq(cs->parent_fiq, fiqlevel);
     qemu_set_irq(cs->parent_irq, irqlevel);
+    qemu_set_irq(cs->parent_nmi, nmilevel);
 }
 
 static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.34.1

