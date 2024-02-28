Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp109512dlb;
        Wed, 28 Feb 2024 01:31:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwTXsg4OpmzHZqQU0psrF9QQtsxPOlFhP5jZBUvQUfafXVs+/5+wHeTkeK8kz4oKZFynhn9prGJnhxvTNkXY1+0W0beuKi
X-Google-Smtp-Source: AGHT+IFFBwcGIbtLj6e0XlxgcC6UbAJvYEgB2KbKvopBl8BUgMS/KBsFnzoqt02lqC9URh0R8jSK
X-Received: by 2002:a05:6214:acf:b0:68f:2e5d:5d29 with SMTP id g15-20020a0562140acf00b0068f2e5d5d29mr5945471qvi.40.1709112709636;
        Wed, 28 Feb 2024 01:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112709; cv=none;
        d=google.com; s=arc-20160816;
        b=qZET+G1hft++3pVJPOTw+UGLFWhTA6y/zbUb3ylc3GzE6px/1cEGogW8iJP4uhY7MS
         cZWpV+XU8bOFXjYRzYDWuIsTzKZT/tz/qGi1ycrRZ4PkfrB8sycGroyc8EH9sJN8rwyy
         SCcxdPoUOeoy7H9ofks+UqCXgDZA/7DQycY/YYzyfen6BdTXh021iWJXIJY7Rku/5pWT
         C4ROX7Vjl7kdgHAD1z3hb+NDs8I4fcR+gY3DXf6ZWWZ2npeywuJuz7gdOz0WTaZRFOS2
         zDTCib3gFFrxp2DVSUKhtWVDNOC1XGPAZFZW6IP4Z7LHhJE+OdNfTkkc2fhZe8hxx80z
         VR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=D9+eaCHlIZJ8Ll/v48RTEaIv2xCj8Uuu/T5F1tDfbdY=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=kD2tG+YXRAE6DV7UwKWd5HaAG2qdarqf/uOUyhg9c9E6uFmFtQHTqcDWP3hCjDUYIY
         kD5NEqUQ64WuAbsEZo6zjhvh1jmR5AhZRk0RdZvrKfs0MOnTGIOYs75vN0xfyBiwHmjn
         Xvsve4iVRmFHbDPxj0QcxTNSqJODtu6fny1P2XlwN/S9vG87qnamQxMUzFoF37Lc0zMn
         AEGFNEJw6JsOXwXN+2Y8BroDgO3x0KuZD1AhzuExU7O2pPjh5UaGMgNyKMQx0qkqbwH+
         pnraz8o3h/eYEDOc9J64CXggY+bTgmqsl9Slb0XlZu4pvtspQhuKXvHSBiB/Oe0qOdlJ
         GZYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs5-20020a056214226500b006819a5a0c8fsi9252038qvb.150.2024.02.28.01.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:31:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHZ-0001BF-Ta; Wed, 28 Feb 2024 04:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHO-00012a-2N; Wed, 28 Feb 2024 04:31:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHK-0001WK-6w; Wed, 28 Feb 2024 04:31:09 -0500
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tl8DV1Lpjz2Bdwy;
 Wed, 28 Feb 2024 17:28:42 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 264291A016C;
 Wed, 28 Feb 2024 17:30:57 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:30:56 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 08/22] target/arm: Handle IS/FS in ISR_EL1 for NMI
Date: Wed, 28 Feb 2024 09:29:32 +0000
Message-ID: <20240228092946.1768728-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
X-TUID: mQZJT0AL5a29

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
index 8be978698d..22f0763e66 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1475,6 +1475,8 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
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

