Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp476195ejf;
        Fri, 23 Feb 2024 02:37:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZ1vOFTgq3qbY9CbeAAkuU+YM2RbpwVIrJnL7gv/sGgcR842hxILYTWz1nF6l7ZueuSC/cvAg9t5TMn8doSDdCdAmM5h2L
X-Google-Smtp-Source: AGHT+IGsbJInfzU8QD7RKvpHFECGAWMwJlkmb4i4GUrMV92o9dOy/Hc09U+qdVHr9dBXJ+rjVl6w
X-Received: by 2002:a05:6808:e83:b0:3c1:63d0:5da5 with SMTP id k3-20020a0568080e8300b003c163d05da5mr1266445oil.52.1708684640940;
        Fri, 23 Feb 2024 02:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684640; cv=none;
        d=google.com; s=arc-20160816;
        b=rczxoXKG1OepwinV+jNFgGuwO3tOZXWIgsdnziCEpT4QEI2je+XpYqLpivYH318LUA
         9riT0B/AKhhEVW1jTK1ZdlTKpyHWMX2NuxD+szMT05YnPMVN/HGpG0fRgpDyNflMociM
         MnLmdNqip5QsZolFLwHL15pCMy0K7xNttP0NBwqNHc4BICxVM7pxDi7NrbquD9xMICOD
         yJrUYozR/EsWKvgYd9Eha09opPx9dyGdQ/EYB25sCup1JNyqsFBcUnIjWtSp5f51mewq
         2wpdKp2zQInX38OwhZ7mfMj6zIZr2t6YA4jnuUvVDVgMnvMV2PXzhYSCntiXpbpoM9g/
         9zDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=sGJNotD8Z/pBJjueZNRSD8XTkGW5a+lapeNARy6vWF0=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=PSR1/gM328KTqsftIvoyVdRiKVJhuITywDXGFPyZ3MblHinR6Zz3vZpC4n3y9s3W7A
         bACg8XgNlIQ5O0HrEuw/795IOFOjtmjOcG1MPPhHsorvuRfHWvmgjvtAzk1Oma46dBbY
         yGRRBACK8NguSbinqJ5OUVcW4b14m1B0sMEbBoWxMREFF99POpoLnjnpUkRyiKCkOay5
         8t061wydEkA2SomnSr4eDjKSCprWwT7hHQ7kDsjqvyVbI1KosIG9nzTbjzcMErDGPF9s
         vJBRGy39MBQisUD8zbnSrqHJIpjRs+RJqSlkFCe3DeoKkYnoHjUxE92QkE5nZRfftAoR
         hNhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020a05621420ea00b0068fd9fa7b83si591926qvk.25.2024.02.23.02.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdSts-0004Ps-Ao; Fri, 23 Feb 2024 05:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsS-0003bP-VT; Fri, 23 Feb 2024 05:34:02 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001wM-Jj; Fri, 23 Feb 2024 05:34:00 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Th5sq5zCpztQRr;
 Fri, 23 Feb 2024 18:31:59 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 04AEE1400CA;
 Fri, 23 Feb 2024 18:33:42 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:41 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 08/21] target/arm: Handle IS/FS in ISR_EL1 for NMI
Date: Fri, 23 Feb 2024 10:32:08 +0000
Message-ID: <20240223103221.1142518-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: QCu4I+zZQ/zP

Add IS and FS bit in ISR_EL1 and handle the read. With CPU_INTERRUPT_NMI, both
CPSR_I and ISR_IS must be set.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
--
v3:
- CPU_INTERRUPT_NMI do not set FIQ, so remove it.
- With CPU_INTERRUPT_NMI, both CPSR_I and ISR_IS must be set.
---
 target/arm/cpu.h    | 2 ++
 target/arm/helper.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b23be7fc24..ae9a75d717 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1476,6 +1476,8 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define CPSR_N (1U << 31)
 #define CPSR_NZCV (CPSR_N | CPSR_Z | CPSR_C | CPSR_V)
 #define CPSR_AIF (CPSR_A | CPSR_I | CPSR_F)
+#define ISR_FS (1U << 9)
+#define ISR_IS (1U << 10)
 
 #define CPSR_IT (CPSR_IT_0_1 | CPSR_IT_2_7)
 #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2f54413b01..eb97ce0356 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2022,6 +2022,11 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
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
-- 
2.34.1

