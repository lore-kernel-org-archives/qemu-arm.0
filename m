Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659708ejh;
        Sun, 7 Apr 2024 01:22:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+oqTtxJUK9l5nWGhVU8r4rPXg8zI1CrDi/NnBP8kLNZNfymc1s5THfL0MytXfuO6d/sRlekzOZEZo82CcpsKK22R9FW5B
X-Google-Smtp-Source: AGHT+IF3i8f1I02zWCAr++9vlpLZThE1Imqr0Q5uADUfmqaRRz/4qUQK3jPVWBsZfZEWqEPLft3a
X-Received: by 2002:a05:6214:4017:b0:699:2cd8:4d83 with SMTP id kd23-20020a056214401700b006992cd84d83mr7769460qvb.29.1712478169315;
        Sun, 07 Apr 2024 01:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478169; cv=none;
        d=google.com; s=arc-20160816;
        b=BkDWfVkLtWpmYK7LHE7btWXnW3xqvF3UlSLM+uVddgY/9rKmouMv1mS6h+G/x81ySm
         ZIBcBeZSoFZNtI22pOL/hb0I4/MAXNELMOhlr3dIipnUv/Y/PAyNSqz5QhxzvEKW0y1O
         CQsoCUnPxrRLclIC0isd9eS1MRHid/1QohZkuVFe8QspblKdMV3aK2hFSiyUScLMHQoY
         j4oI+4rn1u/WFHbfMN2qvadzFoOW0sY1FTgjpyZIe528w+0oN1XWoSgNIYZt0DyyAM+d
         P8z8oOxXCXwG14dkbGfZCQU9gwfOMGE4jHbgKqEvoM5zRn2B+Js8ZYEn4X5HjPOzzCZc
         tb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=CykbHqLjKi0/xFU629U7bbJBLM2Sqstp7hZsj221A5U=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=tO1Nqcv3zuKZGYFw4POeN9o80KtOIQnaKF5bUjehAz9UFtbRZpchdyOUSfJaXv/FPs
         qair4NxPrfpdbHNIbkFvdoDhSDNBuwre3C2xuqRfKu0WFXtpyD08mS5yMYlxtdHh7rvL
         hqc0vk5/VswifyVDYqQJY1jqd7I7bsFn5dAaZz5eahCvVqiu1424ttozxOD3V8PB8T8U
         6n7qxVmtFDBB4BZTjifR9IS8SKAQMlFRlXyZymyn3afjd1jhNsTuvgfnR0yKu2Ux+K1m
         oFKhXIrLMGYtlr7+bfr6AlK4n+HvXdPeO6nTS/hx458So/wzzXxG7FNLnsCJA2kacB1u
         GDBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a056214164600b00699132af4b4si5615489qvw.614.2024.04.07.01.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rtNlP-0004gT-KH; Sun, 07 Apr 2024 04:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl7-0004KX-Rk; Sun, 07 Apr 2024 04:20:15 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl2-0002HA-Pe; Sun, 07 Apr 2024 04:20:10 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VC4p15qpmzwRQc;
 Sun,  7 Apr 2024 16:17:13 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id E39BD140154;
 Sun,  7 Apr 2024 16:20:05 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:20:05 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 21/24] hw/intc/arm_gicv3: Report the NMI interrupt in
 gicv3_cpuif_update()
Date: Sun, 7 Apr 2024 08:17:30 +0000
Message-ID: <20240407081733.3231820-22-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TJxGcNiTTMZc

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
index dff88c4283..60e2d9ec9c 100644
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

