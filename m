Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564172ejj;
        Mon, 25 Mar 2024 01:53:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV61RqHTWX88ayzdeA/txEVHWFXiIWKlw9A3tk0VD2U0NfxphcS6V+SunQJfKxeuAbgmFiFaIKAKcZtOTyG0vBMJI9z+fUX
X-Google-Smtp-Source: AGHT+IHN6G1jsY1auHEPMDh0SIRPEZu5ajYTauwmLbLrgejjgPKPFPwL4evvNYfSJzz7VJa9MgtR
X-Received: by 2002:ac8:5990:0:b0:431:5f8c:f7a with SMTP id e16-20020ac85990000000b004315f8c0f7amr640261qte.3.1711356802336;
        Mon, 25 Mar 2024 01:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356802; cv=none;
        d=google.com; s=arc-20160816;
        b=v3Er7WQDdzYX1xyA9XRwPH6oolcflnfoXlOuQCuynUHSnxDJyBzxkPXcC9H2LPS8b2
         86XC54bJcoyPxT7r9vRHJS8OgQ3M2GucoE+6Xa/n8Rbys+dgkUuCJbrjkN8BvbzG/ha9
         97xGowKrSn737H5Datd2JwhEcLH0K/KrxQC3+KsBUGRMTLqFM6sMxjnPzSMOcPRbxU4n
         eo63ZFRMjNmhdEdoqiDaAtBxqb2enKGKK/K+E2NLwO1YKkH4KE9JlXz8EFKwm2y0sKtf
         iJ5F8S8wGemfvLb/0pp4vNcactyv+Zxe+EunkgI4HmkE3FeRCItAvGGe9anHyUN4LF1M
         3MEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=a60WJ2EU1hNFVfjzmSVnsoidxt3qePxyJEp32CRfbpU=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=VLkhULp6CFcDmbzjYnUYvjAOzq721+F8M3SUd6Q6wa1N3lVc7JzGll79giGDEg8HI7
         XmUfpuwtAyvSHxp7PddaSCvnOffJUCnwtZUrHYj3fOoN0rgya4kU17K5Bkl6DUEsOdgl
         o66lw1wh+jVQn4vdzDtIhpbvBf25ks1BSprk67krZdquXik7SJZvRLHDaDaj51MZKL7r
         1veoteSE8wIH5/ZcoJFKybzlfzoxNIIOqfhzN1rcx8m+tVlwysh82RahCdO9tB01oV0I
         hos3WAWegj19nFs9MJLUPwyBhOwJAmkwrvvCJ4H+kuPHaNfNmI1NYl0bAxwY/ktJH8bU
         uoiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ci7-20020a05622a260700b00430d71024cfsi5074728qtb.205.2024.03.25.01.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rog4J-0003Ca-Ho; Mon, 25 Mar 2024 04:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3v-00031A-64; Mon, 25 Mar 2024 04:52:12 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3k-0007Ok-9E; Mon, 25 Mar 2024 04:52:09 -0400
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V367245zCzwQ8Z;
 Mon, 25 Mar 2024 16:49:18 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 8CB3A18007B;
 Mon, 25 Mar 2024 16:51:56 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:51:55 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 08/23] target/arm: Handle IS/FS in ISR_EL1 for NMI,
 VINMI and VFNMI
Date: Mon, 25 Mar 2024 08:48:39 +0000
Message-ID: <20240325084854.3010562-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
X-TUID: M4dMFnficHO0

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

