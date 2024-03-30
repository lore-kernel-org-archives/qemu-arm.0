Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2319995ejv;
        Sat, 30 Mar 2024 03:34:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9Hna/icpeHRyBmLsZ3AME81KYlfZfckTbKMx34zqjZO/DTg2yRlz+eXMzD64EuAsKvUXxHjGaeAQaTA3dGxRg2eV10HQ3
X-Google-Smtp-Source: AGHT+IFQ9URFDFh4fsq6Ft9Xbt5inRCtrghNo18d6N5bx0BPIczh1S0VNBMSOhB/vWuY3xOnMexa
X-Received: by 2002:a05:622a:491:b0:431:7c36:7f86 with SMTP id p17-20020a05622a049100b004317c367f86mr5101617qtx.59.1711794840616;
        Sat, 30 Mar 2024 03:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794840; cv=none;
        d=google.com; s=arc-20160816;
        b=NMpsoTGlsOc8QSvTjY3x8Z+2n6hDB36b6Omj7c6W8ltUSsHBDrLlTiDj7wKHG+GfUf
         JN5Gou/tCi1ZwGBooB2USAEcnSyg/Es6v6YXL3yTRCmOxlj+mixTXpqPXt96Dg4Ehk5B
         8pqUzGKAVkQ8wemARlgUVeR/WDLvUGlQMrQKZBq3mSncWm/gyG0ZHCO0vKttVb/xoboR
         4bIh1CgNbRrcRZ+RHzX7AxCaCXzmZTqWsgKAr++geke2kNbYRlHIRHIe0/wjrwWXff7s
         IXzqcz+mJ9PN3761Ga2OjCJdL/UAm7y+FkgVp3eVmtpMMNp+EDGUV/0PWu4OnrlGuZyP
         J/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=a60WJ2EU1hNFVfjzmSVnsoidxt3qePxyJEp32CRfbpU=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=qijPeN0B8sRYQBRRtElvIZwwK4k+LENewQ0FE2VjN73q2zOcwbctDSvEmtWHd13SVN
         FzsG5FM/uJv5E6YxR+BGauYN0F5aaLYlkL7luo0lR/zrRrfBuhoVh941gRFAGhbHlQss
         dkOGS5bcyD3W6ampL8Vt/EyFTdTUlFQBKlqSrk+v60n2ZVcQJ0Z/jzdpQtRlZSmlSy1t
         h4joeAgyhCik9Im0IR05Ct0IrWOGjRfYihUtTGPMmOMWqsuJragFgIxe4NbzXafYzNn+
         pRx/utVtv48ikr/tOWJc6fpFzkTGW4dUvaw4wO7xKXrOKNO9cTvWvkUTSC0LjrfIkgbs
         KZgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12-20020ac85d8c000000b00431817cfe31si5647001qtx.269.2024.03.30.03.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rqW1J-0000I3-T4; Sat, 30 Mar 2024 06:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1G-0000Dp-EK; Sat, 30 Mar 2024 06:33:02 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1D-0000ki-Bn; Sat, 30 Mar 2024 06:33:02 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V6D7B5rTvz1h4QX;
 Sat, 30 Mar 2024 18:30:14 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id C5D411A0172;
 Sat, 30 Mar 2024 18:32:56 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:32:56 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 08/23] target/arm: Handle IS/FS in ISR_EL1 for NMI,
 VINMI and VFNMI
Date: Sat, 30 Mar 2024 10:31:13 +0000
Message-ID: <20240330103128.3185962-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TU1xjaiBGNoc

Add IS and FS bit in ISR_EL1 and handle the read. With CPU_INTERRUPT_NMI or
CPU_INTERRUPT_VINMI, both CPSR_I and ISR_IS must be set. With
CPU_INTERRUPT_VFNMI, both CPSR_F and ISR_FS must be set.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v9:
- CPU_INTERRUPT_VNMI -> CPU_INTERRUPT_VINMI.
- Handle CPSR_F and ISR_FS according to CPU_INTERRUPT_VFNMI instead of
  CPU_INTERRUPT_VFIQ and HCRX_EL2.VFNMI.
- Update the commit message.
v7:
- env->cp15.hcrx_el2 -> arm_hcrx_el2_eff().
- Add Reviewed-by.
v6:
- Verify that HCR_EL2.VF is set before checking VFNMI.
v4；
- Also handle VNMI.
v3:
- CPU_INTERRUPT_NMI do not set FIQ, so remove it.
- With CPU_INTERRUPT_NMI, both CPSR_I and ISR_IS must be set.
---
 target/arm/cpu.h    |  2 ++
 target/arm/helper.c | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 08a6bc50de..97997dbd08 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1398,6 +1398,8 @@ void pmu_init(ARMCPU *cpu);
 #define CPSR_N (1U << 31)
 #define CPSR_NZCV (CPSR_N | CPSR_Z | CPSR_C | CPSR_V)
 #define CPSR_AIF (CPSR_A | CPSR_I | CPSR_F)
+#define ISR_FS (1U << 9)
+#define ISR_IS (1U << 10)
 
 #define CPSR_IT (CPSR_IT_0_1 | CPSR_IT_2_7)
 #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 077c9a6923..b57114d35d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2021,16 +2021,29 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         if (cs->interrupt_request & CPU_INTERRUPT_VIRQ) {
             ret |= CPSR_I;
         }
+        if (cs->interrupt_request & CPU_INTERRUPT_VINMI) {
+            ret |= ISR_IS;
+            ret |= CPSR_I;
+        }
     } else {
         if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
             ret |= CPSR_I;
         }
+
+        if (cs->interrupt_request & CPU_INTERRUPT_NMI) {
+            ret |= ISR_IS;
+            ret |= CPSR_I;
+        }
     }
 
     if (hcr_el2 & HCR_FMO) {
         if (cs->interrupt_request & CPU_INTERRUPT_VFIQ) {
             ret |= CPSR_F;
         }
+        if (cs->interrupt_request & CPU_INTERRUPT_VFNMI) {
+            ret |= ISR_FS;
+            ret |= CPSR_F;
+        }
     } else {
         if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
             ret |= CPSR_F;
-- 
2.34.1

