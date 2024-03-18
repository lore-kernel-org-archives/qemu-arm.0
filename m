Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp522091ejb;
        Mon, 18 Mar 2024 02:41:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAmStAVwdBIM/cDM1PGOEuy2bpwkb0zWu+QTZpQRskhjtuh8mCVlNvH3se00pU9v4SqYnZQMGnXzUxVDxN/FKCO4rFRhga
X-Google-Smtp-Source: AGHT+IHcs603XkpOli3phK35VWqBqGdHMPkJiygif/IWJIaWRSkh+CkTQJPAHr4YUx5mvdNYepqk
X-Received: by 2002:a05:622a:14cb:b0:430:c05c:86eb with SMTP id u11-20020a05622a14cb00b00430c05c86ebmr6911768qtx.7.1710754862637;
        Mon, 18 Mar 2024 02:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754862; cv=none;
        d=google.com; s=arc-20160816;
        b=FfK4yP9ACOZ4Dco5LbbHJt+ZvCmxhEuS3cWrv1/ljLdvVrxqdq2KQ436l3Sp8RekMg
         Ssx8uJYrTFSwhbtGXrEf0odsZO11xq6OA8k9UtsgBb4vti0hKpFNoOZP67Qx1YMonFUZ
         WnJHMcTcrO6/Om/rKWJKE1V5xidrC2oDNQuFCKay3QOimOHSuEsaQoGMfXqz/izG06Vm
         EJDGAJemSDss1T3dj2ppLIfkzzysIwWWACdRAhL/JPJhC1y/0qqJX7grqAjnFb4+411e
         dtNKQy6qfPppbMq895GZUzfTEiU1R/qTe3mGHRP84TdWj0CKdbB2HyYKfF3ttR1kRUaO
         8eTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=lWMzl0a8GDHPo47y8Kd6TQUtK2CpYgPuYMQ985QCcI8=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=iVyDOPbwEO9wma5xRn27eqJvlnxrP0mMKbnI6AZ+TrUrdPX0hrLUMpculbnvJw1eym
         xYKsEMEbPTNsWH1GuHXfKTokSonws7tdnBWSljeiqQPkSP8ICqYG3wFkvBBb9S5ni/Bs
         GI70wdaYlsdpoLAxZckzmIsCJpPcZ2mhs2GhxUvm5NQ12M6k9n5wczmKkWSCW0r5Zznu
         E9rGutqkWbBHf85ipmTY9Y08Gk05KsBN0kA9co5BvJywBtGSEISYB4E+0YI2hY8ty63I
         A4UiMUe0RO7umywWxP7wgGjU7LnpZY2ap75HMyuNUlo7cwrymAZsb3vnO4S7EYWNtF8l
         Vg9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a05622a174c00b00430c6ac395esi3322044qtk.219.2024.03.18.02.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rm9R3-000414-8f; Mon, 18 Mar 2024 05:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qm-0003tO-DK; Mon, 18 Mar 2024 05:37:21 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qh-0000uw-IM; Mon, 18 Mar 2024 05:37:20 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TyqSV1sTjz1h2hj;
 Mon, 18 Mar 2024 17:34:34 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id A90DD1A016F;
 Mon, 18 Mar 2024 17:37:05 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:05 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 08/23] target/arm: Handle IS/FS in ISR_EL1 for NMI
Date: Mon, 18 Mar 2024 09:35:30 +0000
Message-ID: <20240318093546.2786144-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: Da/xzri/Xmjj

Add IS and FS bit in ISR_EL1 and handle the read. With CPU_INTERRUPT_NMI or
CPU_INTERRUPT_VNMI, both CPSR_I and ISR_IS must be set. With
CPU_INTERRUPT_VFIQ and HCRX_EL2.VFNMI set, both CPSR_F and ISR_FS must be set.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
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
 target/arm/helper.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 629221e1a9..fba0a364db 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1396,6 +1396,8 @@ void pmu_init(ARMCPU *cpu);
 #define CPSR_N (1U << 31)
 #define CPSR_NZCV (CPSR_N | CPSR_Z | CPSR_C | CPSR_V)
 #define CPSR_AIF (CPSR_A | CPSR_I | CPSR_F)
+#define ISR_FS (1U << 9)
+#define ISR_IS (1U << 10)
 
 #define CPSR_IT (CPSR_IT_0_1 | CPSR_IT_2_7)
 #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5c637f3413..4bc63bf7ca 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2021,15 +2021,29 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         if (cs->interrupt_request & CPU_INTERRUPT_VIRQ) {
             ret |= CPSR_I;
         }
+        if (cs->interrupt_request & CPU_INTERRUPT_VNMI) {
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
+
+            if ((arm_hcr_el2_eff(env) & HCR_VF) &&
+                (arm_hcrx_el2_eff(env) & HCRX_VFNMI)) {
+                ret |= ISR_FS;
+            }
         }
     } else {
         if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
-- 
2.34.1

