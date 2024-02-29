Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp375423eja;
        Thu, 29 Feb 2024 05:15:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVV878o5khdmts1AoJ5l9p/ms3o/P26iLyEulbQ2rBLPS9Pj95WIc+NIEdCsMXbOOBuD/v+Nc7BrQp0BVG8MhNThJn1CgnA
X-Google-Smtp-Source: AGHT+IHwmj+KO9IW9DRbRombVrtFAjoFFqXJKp0pG6Lxor0DlUOrjavyu4D/ZOmNF8AT/pNm2wdK
X-Received: by 2002:a05:6102:510f:b0:470:4933:8d55 with SMTP id bm15-20020a056102510f00b0047049338d55mr2225095vsb.11.1709212512579;
        Thu, 29 Feb 2024 05:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212512; cv=none;
        d=google.com; s=arc-20160816;
        b=A/+heuKHSoab1ikiBSWc4fgSU8HToLzMgzzqSFIu6pdXZtueLb3JI9KO1RtioyNPJQ
         +OlBRg449XnrFVWG1GiQcbfAQbuppi8OTP4dgmXLYxjrxlfZ8POwcBsMGy5hJ3O7DrlV
         H28NYUXlnWPeTRVVHllc3ITIlYHjdXRXN+hnEw73dqVWcX2UdL69KldsJEY8UsJdEFLE
         v3j3Hay2R405dy6wtoGthFtAdgYBp1Mpz4GxnR38HidtiCTMS8FJ/W7YNFC6ezMo4BrY
         LWBrs248DzVb8UkneDATKej21kalw4ua1BEL+fI5jCMMjdT62zED+8/oE2NIlGv1YoeO
         7XBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2RW/+KvOBHh3yEUeEQc3iAicwwZIHAdV3aHhkdOY+yk=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=dmgs5U7k0rKBWsv9uZnDWZA344ZvIwY1gaHb/LFOhm/SvkhrdVWG7Gxo7rwVA1cTDf
         /Z6BnAsdJl+E/PXZ/mMGoojfaX/9mHT+TTtP2bx+c3vJ4BphypAW+jOd6SFubEaIx8gS
         Od+Ps4chkNcDfJDbs9hgDbq9EuOJoU42O4KijQK0TukSrsRNSFtjMI5XjdkkGUZvxBvY
         CRGsw2aACoAUjkEp3IdzlC8S3T7+aqSqTL22arO2RaKRaDvsPI9VnM5F/dCvU9LhpEOF
         wOjAT92n+bg6qBp/F4sMypwC3VIbe+pC+cFUUvw+RLHkxrvT4TlrLiH/2RYyQJYzFm/I
         R0fQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a056102000b00b0047173a86774si124769vsp.305.2024.02.29.05.15.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:15:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfgDA-0005y5-1v; Thu, 29 Feb 2024 08:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCd-0005eu-Oa; Thu, 29 Feb 2024 08:11:59 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCa-0002eC-QG; Thu, 29 Feb 2024 08:11:59 -0500
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tls5h2MZMz1xpV6;
 Thu, 29 Feb 2024 21:10:16 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id A362C1A0172;
 Thu, 29 Feb 2024 21:11:47 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:46 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 08/22] target/arm: Handle IS/FS in ISR_EL1 for NMI
Date: Thu, 29 Feb 2024 13:10:25 +0000
Message-ID: <20240229131039.1868904-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: WNmlXBTtRUHn

Add IS and FS bit in ISR_EL1 and handle the read. With CPU_INTERRUPT_NMI or
CPU_INTERRUPT_VNMI, both CPSR_I and ISR_IS must be set. With
CPU_INTERRUPT_VFIQ and HCRX_EL2.VFNMI set, both CPSR_F and ISR_FS must be set.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
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
index 6aa9f1e9ba..4f9a8127f9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1474,6 +1474,8 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define CPSR_N (1U << 31)
 #define CPSR_NZCV (CPSR_N | CPSR_Z | CPSR_C | CPSR_V)
 #define CPSR_AIF (CPSR_A | CPSR_I | CPSR_F)
+#define ISR_FS (1U << 9)
+#define ISR_IS (1U << 10)
 
 #define CPSR_IT (CPSR_IT_0_1 | CPSR_IT_2_7)
 #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7cdc90e9e3..ac44498537 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2018,15 +2018,28 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
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
+            if (env->cp15.hcrx_el2 & HCRX_VFNMI) {
+                ret |= ISR_FS;
+            }
         }
     } else {
         if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
-- 
2.34.1

