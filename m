Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp113003ejc;
        Mon, 4 Mar 2024 23:09:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWRxA7Hnrbc8nrZUllzGglx0eKorZ0wteB0gPGk3rbJLEO6uxHRoqhDenzKr+iUE1WArPDuCSPT5aKcs/HrmJObno9b/50H
X-Google-Smtp-Source: AGHT+IGkOhJOJEnfR6WSyu42bgDYr1ibajl6+3D06knyFMCTOltQ2ADUUlzCU1DP2VpC/uN6TaaK
X-Received: by 2002:a05:620a:1015:b0:788:2ff3:4973 with SMTP id z21-20020a05620a101500b007882ff34973mr1099658qkj.62.1709622547312;
        Mon, 04 Mar 2024 23:09:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622547; cv=none;
        d=google.com; s=arc-20160816;
        b=Jjxk+L6MBhSE7SSfPpIh9hceg9UEsRM7uQgy93lAu8S4J9j6gh3TYsC+tDyYnrs6Go
         cVRClHS5V4fQlsAIsVM2nLmN8BvFrw9wi4c2SCiRPnRDjSS0yIvjedTkhpTlmXHhYQZf
         OuOEZGl7QZyg408JM+Qz2QhhBCq27KVhzP10bc6ZrQbpyXMqcKYqEsRW5jzXv3KHFrEk
         Mhn4j5RDi2IenhNpAXwjll+JbMj2Zs0OYqHPaZy1x6Cg9ZAMR3V+rkHED4rgCu2XTQZX
         tKrd14drAhQWaU5e2POmbsMgqI5mv3wVRICiR1o6k3pGVLdj4apsj5BaLQr6zNRvNQ6B
         Ac3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=fMd6ow6ZvZCJX8FsqEBBTmkDma5TEgJ1sIhOMrQl8o8=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=0x6wYKN6x008H3X90h9vg6ZiAOQn8C8x/kmGoqVUrOwl4ulIk8rjuTXTH6bBljdbn3
         GQQunuUXln3FiwbLb0nGyCUWanIUS9sViRl4I7Q6AC5gtT4diFIqrxqh/Ozi1yxKsQHb
         5L5wWnRQp6ovWmwdxI+Nv6XE1OKmECAxhu+QnU3jCkH93yxNiNGxnyg14cCq45rv/pxz
         1rc0OsNyKxubD7QYcjL8YBTB6GtzakNIwAE+uR0ONDfc693JT6GCieWsgwLnuJnqfxfr
         CYKwtGjG0yR4k4/7gJhNCVY8uIJBBsWNH0HbGAcGP3nFmxoUNKufp4k8zKR69m7DveLw
         ioMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl33-20020a05620a1aa100b007882004f7d8si6790469qkb.406.2024.03.04.23.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:09:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhOst-0006IK-Ae; Tue, 05 Mar 2024 02:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOr3-00049i-AE; Tue, 05 Mar 2024 02:04:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOqz-0008R6-FE; Tue, 05 Mar 2024 02:04:48 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tpmjh5LVyz1xqFw;
 Tue,  5 Mar 2024 15:03:04 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 32C6214037E;
 Tue,  5 Mar 2024 15:04:41 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:40 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 08/23] target/arm: Handle IS/FS in ISR_EL1 for NMI
Date: Tue, 5 Mar 2024 07:03:16 +0000
Message-ID: <20240305070331.2151131-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
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
X-TUID: FoCs1Pf0oxPp

Add IS and FS bit in ISR_EL1 and handle the read. With CPU_INTERRUPT_NMI or
CPU_INTERRUPT_VNMI, both CPSR_I and ISR_IS must be set. With
CPU_INTERRUPT_VFIQ and HCRX_EL2.VFNMI set, both CPSR_F and ISR_FS must be set.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
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
index 7cdc90e9e3..7e73edfde3 100644
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
+                (env->cp15.hcrx_el2 & HCRX_VFNMI)) {
+                ret |= ISR_FS;
+            }
         }
     } else {
         if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
-- 
2.34.1

