Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp272924ejb;
        Tue, 5 Mar 2024 20:00:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVQwLHVEpTgjhVMevpun3NbGXqqnR0ce/mST0KFJmFpktP4LB5bHihneCQpsfT1UlnSn51wowlK07EisMD8N9RBj92Z8EQ6
X-Google-Smtp-Source: AGHT+IGzKmrLgGEsMJRlH5fNOfHjPDHCWEAfBjfnx0K1RAFAf6nIipdkQNhiYK0C9lCIaDg544DJ
X-Received: by 2002:ac8:7d10:0:b0:42e:b4fb:e55f with SMTP id g16-20020ac87d10000000b0042eb4fbe55fmr4207647qtb.61.1709697643325;
        Tue, 05 Mar 2024 20:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697643; cv=none;
        d=google.com; s=arc-20160816;
        b=SjIgYET+igNmipxODiAHFdX84X4SCTWX2kxLFCNA6jwwgqdw0QfdaK4CvthFvucCIV
         GVXAipJ88ek93cRh1/z1DSKPNrHpVabJEzCDhVEJ5o1mQnixu9I6/UXc72v3kRmLrVTa
         9oWD9ahIjsOuDPyGMi520ohfqGshDHL8BUHCYDFHeRLW2gOo3pUh56Z4XWqK4BBgxhiV
         UveMQuLwdJ19upJ2mSZKeMg18bKqW8ebP1/Tre52b3bXBbqK8fRZhnp211q9KOJtx+cF
         6hsJk6EbeQZcEG3S1R6jD7kAyNm7E2SJC6ufTxL1Yro80poaZ9PFCnP3etW9JCZwCN9L
         MvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=zAV8RlXbi69zrXtiow4CreyXgoNVEwvQdXsW6ZPaiMs=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=yt9sQV//mXdSUczWzMgwC9x7KXMKRpo1GoKb8l2s5D5hq94B7UaP+A6LbNq+Sj52Ua
         M48MuLctUQXa6RVxz5Z2ylA+Ev80Ca4ADtMTn1nrd0QKgrefnhDiEfneZ+VAczLmqxzD
         Aa1KXwy5SXBzwKovFcUPphhCUbzF9f3kXQYLxO7UPBegX1v7p72tECK3G2cjXj+1syS2
         MVecvs99OQ+mBy1eUJ4fEOtmwLtuyMw+E0gU6fvsO59QrfQlKH+YgKNXFvpIr3XQdwZf
         G83146SOwO2Qwm3w92+oh4bW5RasV7uRgdy9KlFNQaSJ67y8ilyGilkEQcEVsk3jk9bP
         /FfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020a05622a179100b0042e8062afe7si14230328qtk.122.2024.03.05.20.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 20:00:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhiQU-0000v8-Hp; Tue, 05 Mar 2024 22:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQQ-0000ow-2q; Tue, 05 Mar 2024 22:58:38 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQO-0006kw-Ef; Tue, 05 Mar 2024 22:58:37 -0500
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TqJWd1Zwtz1h1FS;
 Wed,  6 Mar 2024 11:56:13 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id DF1A118001B;
 Wed,  6 Mar 2024 11:58:33 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:33 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 08/23] target/arm: Handle IS/FS in ISR_EL1 for NMI
Date: Wed, 6 Mar 2024 03:57:06 +0000
Message-ID: <20240306035721.2333531-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: SzAJUOJE/se+

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
index de9446c68c..97f276559f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1467,6 +1467,8 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define CPSR_N (1U << 31)
 #define CPSR_NZCV (CPSR_N | CPSR_Z | CPSR_C | CPSR_V)
 #define CPSR_AIF (CPSR_A | CPSR_I | CPSR_F)
+#define ISR_FS (1U << 9)
+#define ISR_IS (1U << 10)
 
 #define CPSR_IT (CPSR_IT_0_1 | CPSR_IT_2_7)
 #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7cdc90e9e3..15f72fa425 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2018,15 +2018,29 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
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

