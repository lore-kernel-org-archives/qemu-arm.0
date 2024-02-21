Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1985441ejb;
        Wed, 21 Feb 2024 07:21:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUoCSEYyw24JnEtorBkGIsgw0gL79J8s78cZgmJh9C5KQ1dRpPvnFPlch4YQiSGF1tPL0UKt3XssdaMAsIRmtYEh7joXuKM
X-Google-Smtp-Source: AGHT+IEn29p4pDVDY8mQIzwNV1U06ymTYk6WvdVZGDwA/J/1F415mXXfSmOicaajlSeEfYuejGAA
X-Received: by 2002:ac8:5acb:0:b0:42c:74ef:8f82 with SMTP id d11-20020ac85acb000000b0042c74ef8f82mr16669296qtd.67.1708528886394;
        Wed, 21 Feb 2024 07:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528886; cv=none;
        d=google.com; s=arc-20160816;
        b=XVKpI24wC/YQeudbQRcrIWpB61h4iVdFZijbvcnbFFtU5pNCVTFuoimmnK2aCqQ9cK
         kR1n5Q6DXz3zFR7ENgnxT4soQEPdp9TLF9YzmNKfb2Lo9sT2emcQsR4W5VW+5zvgG4e2
         pwhWRWzkYSDct4ptd7AcJmwQMXDSjau6RTMQhHhvwxPEfjP8hTgk2uY6ooFgN6d8ZuyQ
         1Uvv3eqqtT8JNxlLjtr1ZscKtN9WamG+tGdW1c/IYifEbk0yw7/onGxFSEO3n29tfU4z
         iYsqv3OfFEWsvelYOzGqqyjCZdiSBqjGDwSBMGTtzOiHExG4gtVAf3XgFZc/7qkzKvt9
         7hhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=eUfnPzbFkfuOK9qmzLKlfwA+htUNg8M5C4DrESHXj7Q=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=wHc9mLrsluOWwx2uF25qQv5lQke33J2DGFODXF2Sb7jiJ7XJw8hQIcaZkQpk1Mwqbh
         xdu55pd4D60fZoqxEEDecUSPwgrUdyB2PLvE+wZz4aXNEYEM8WJm4IRArBxW37khiX1k
         RdlBQX2xXredHBNrXAZLDYngVJq4nwvNKRu71elj2yjY1s0HrcyAhi1vbs2GXQvbEBAz
         8t0Mvz6dtQStJR0zY+xKqTAGZYTiy0gRq+r6iGqJi5KJOm84RuZESFs311V7MljByPN6
         Lo8hkJvqUHbzSqFvWI8R0Q90BY7dXex+1bGPv7ucvvSqjIp2qQm5q0078Bs4geos4DeD
         8ewQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a05622a190b00b0042c7c2aa989si11834959qtc.309.2024.02.21.07.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:21:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoNG-0005t6-Q9; Wed, 21 Feb 2024 10:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoJo-0000nB-Lg; Wed, 21 Feb 2024 10:15:32 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLz-0004q3-4m; Wed, 21 Feb 2024 08:09:40 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TfxQ62YsJzvVrj;
 Wed, 21 Feb 2024 21:07:26 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id D802D1404DB;
 Wed, 21 Feb 2024 21:09:28 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:28 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 08/22] target/arm: Handle IS/FS in ISR_EL1 for NMI
Date: Wed, 21 Feb 2024 13:08:09 +0000
Message-ID: <20240221130823.677762-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
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
X-TUID: 9uuMhiqnn6JR

Add IS and FS bit in ISR_EL1 and handle the read according to whether the
NMI is IRQ or FIQ.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 target/arm/cpu.h    | 2 ++
 target/arm/helper.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 051e589e19..e2d07e3312 100644
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
index 0bd7a87e51..62c8e5d611 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2022,6 +2022,10 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
             ret |= CPSR_I;
         }
+
+        if ((cs->interrupt_request & CPU_INTERRUPT_NMI) && env->nmi_is_irq) {
+            ret |= ISR_IS;
+        }
     }
 
     if (hcr_el2 & HCR_FMO) {
@@ -2032,6 +2036,11 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
             ret |= CPSR_F;
         }
+
+        if ((cs->interrupt_request & CPU_INTERRUPT_NMI) &&
+            (!env->nmi_is_irq)) {
+            ret |= ISR_FS;
+        }
     }
 
     if (hcr_el2 & HCR_AMO) {
-- 
2.34.1

