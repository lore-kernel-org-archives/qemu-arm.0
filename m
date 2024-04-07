Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659111ejh;
        Sun, 7 Apr 2024 01:20:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKFCBDKaw4e4/LOEv62wfC+H/XZKt+ucyLcvxoXp6O/5HfZ152piI1g96EPXjHLbNyAl2bz40tgbvMjMVJhd1/pvC4WUB3
X-Google-Smtp-Source: AGHT+IHietdZl0g8V0a/A3t6PvnuqHbaQrXqMRrOk1F8y8aYlphF6Zd/PL+JnzmZCcwNSokccg5+
X-Received: by 2002:a05:620a:90f:b0:78d:3cc7:eea2 with SMTP id v15-20020a05620a090f00b0078d3cc7eea2mr5450631qkv.53.1712478042409;
        Sun, 07 Apr 2024 01:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478042; cv=none;
        d=google.com; s=arc-20160816;
        b=fG8FiQgr6ZqRNbQ22E+loHojPZHCQDXwWXd5QCfwYxK0ZZULzJwv6m29ancapSxG8D
         CzPP6w8K1K4tMJLos5+AsMw+j4voiO4I9AJIcOZcZFz+BNP4TdrUUwujpFF4bww7RHiL
         EhTu28MR0M3uAPs8Egs3WRxP9PvW2zA0q1N5aM5KMtgfnLTMrTjNdT60+7ISzQngwD1c
         BFgjgy2IOtAeCaBh3KF7zc/mONDTfM28UeMGFLPir+YoEjfIw3QQ+1Ean0n87X1N0xjO
         WH1X9bnw2YRlQPqBNhpIaoPKv4eTGHXhNcnHgCjYXLaR0t5SsISklL6u58hH5uzpt+tC
         T1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=B7pubt+kclP+8+EziMQ4ZlyyXgLY6s/1YP/EGNXuHGU=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=NljT1GQ6aAXE0lypqjRA/t7PlSk02oqRPH8257n7A1dM+aReUnXpGA+A7US08IMeKJ
         KgZQ9CR+JdmIm5jWh2HMh2dUBEa+SOCpJydVwHRM7ujYyRP2wA/noHZH9c42DWT15y+6
         ZuoOq7rN68hyn5BiL9m4qBWxSnES77gqOLiIMK3qSYodJIHctolIfCVLeoYxfoA94234
         +8Ae6BFEmHzzwYo/1uWVglrq3tNqRIC7mQ4MKlX4b2loE65OZhQ/ZDDqUOlicG3kE2VD
         Xc7pSP5AuymzsGP5DDUg6rdH5MKODtVm6DFGAxmbd/66zjCHkQmIo+aCmQBXtRVVFWK4
         KueA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020a05620a098e00b0078d61a46965si1139200qkx.211.2024.04.07.01.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rtNl6-0004K9-T4; Sun, 07 Apr 2024 04:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNku-0004Di-8R; Sun, 07 Apr 2024 04:20:00 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNkr-00021H-0Z; Sun, 07 Apr 2024 04:19:59 -0400
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VC4p22Yv6z1QCVZ;
 Sun,  7 Apr 2024 16:17:14 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 92F9E14010C;
 Sun,  7 Apr 2024 16:19:53 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:19:52 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 08/24] target/arm: Handle IS/FS in ISR_EL1 for NMI,
 VINMI and VFNMI
Date: Sun, 7 Apr 2024 08:17:17 +0000
Message-ID: <20240407081733.3231820-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=ruanjinjie@huawei.com; helo=szxga08-in.huawei.com
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
X-TUID: iNqSJGjALRKZ

Add IS and FS bit in ISR_EL1 and handle the read. With CPU_INTERRUPT_NMI or
CPU_INTERRUPT_VINMI, both CPSR_I and ISR_IS must be set. With
CPU_INTERRUPT_VFNMI, both CPSR_F and ISR_FS must be set.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v13:
- Add Reviewed-by.
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
index d9814433e1..0e7eefd7e5 100644
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

