Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp490509ejv;
        Thu, 21 Mar 2024 06:12:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6kHIby8qbDSnveKq7zxgvVZSNb0Lifqkk4Q4RRxR0IoC0hpaWSDK2R6zef9UfODOR+n9934jPEZrb6XFNwMe1iklvjARx
X-Google-Smtp-Source: AGHT+IHzBegatQvUDcL0tnq7+Un9eIC6qz/VnuTInsn5FanFAukWe/pCvN7uxSZM2FuotuIZSCNb
X-Received: by 2002:a05:620a:1018:b0:78a:9c0:9fab with SMTP id z24-20020a05620a101800b0078a09c09fabmr4995349qkj.68.1711026763199;
        Thu, 21 Mar 2024 06:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711026763; cv=none;
        d=google.com; s=arc-20160816;
        b=INb6aqio7nQ5fG/kaceWwQghKRx8jErHrACTAyXvNOu/MOgyo5rG6nPRYT5agx0688
         Ve1yNOsMR4OmO1CVcG1tlRyoOdpBfb588cP8lHrAd6U/W8IY/cyRL1DqJvMjHon5k8hZ
         7bYowachItIItbLf9ciCd53GLFyzyErGQgW9ZtACkJ4f5IIFYRNbGoQ2IV5GnaDOjXtm
         PtuU4+1D2gp4xJrVVXNDIuhq0fy9gOpGjDixw7Tok4I6pmCQfw/WTUL5jI2Entkxh3wl
         bNbRTBVireme5jWyr92cdsvhovKowBQ8SOq/eoGA2utox0k+pPVUKQ9bD6Oij/JQkE6C
         C1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Ow5feWawxVkNN9JX3Uqntt4tHXITGOuC/BC7CrPQZ/c=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=r50q/3HmNfIPz5fvtIXKYP8by1su+tkD0OBi9NyKnsrxr4/zXWDFu4HYDgCkQ+pxdx
         Cv/dv7eq93bmbIoU/ipEgRC1vnN2E7xrTiIsJhxqe3VN074TZtclVtqNZgVfQFR7gitT
         rUnm7X2OF/NIGE/dR68OWt7nKt/9Ygwh1tcF/zgT8BGesr5v8e09UtKRISUAP00PKfKo
         HGYXJL1OW+FxZZ59EXZgS5lLebYro/DyNXaJ1it1Zu6EMzCrfHarzxQTYImIYScrkLt9
         c7iSDKZHHkLBjBJBFEr8F3q4OF4ZGcq5qWfSMRX5BxZFw6F2RMVUTy3LT5gnv4G2J9bJ
         2Rig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a05620a248900b0078875079cfbsi17528250qkn.739.2024.03.21.06.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rnIAx-0007En-Ki; Thu, 21 Mar 2024 09:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAt-0007Ax-O5; Thu, 21 Mar 2024 09:09:39 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAr-0002rz-TA; Thu, 21 Mar 2024 09:09:39 -0400
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4V0m4H33sWz1vx4X;
 Thu, 21 Mar 2024 21:08:47 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 2B67B180060;
 Thu, 21 Mar 2024 21:09:34 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 21 Mar
 2024 21:09:33 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v9 12/23] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Date: Thu, 21 Mar 2024 13:08:01 +0000
Message-ID: <20240321130812.2983113-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
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
X-TUID: zW8e4p+YwKzd

According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
with superpriority is always IRQ, never FIQ, so the NMI exception trap entry
behave like IRQ. And VINMI(vIRQ with Superpriority) can be raised from the
GIC or come from the hcrx_el2.HCRX_VINMI bit, VFNMI(vFIQ with Superpriority)
come from the hcrx_el2.HCRX_VFNMI bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v9:
- Update the commit message.
- Handle VINMI and VFNMI.
v7:
- Add Reviewed-by.
v6:
- Not combine VFNMI with CPU_INTERRUPT_VNMI.
v4:
- Also handle VNMI in arm_cpu_do_interrupt_aarch64().
v3:
- Remove the FIQ NMI handle.
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 967e833ee8..eef37b801d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11650,10 +11650,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         break;
     case EXCP_IRQ:
     case EXCP_VIRQ:
+    case EXCP_NMI:
+    case EXCP_VINMI:
         addr += 0x80;
         break;
     case EXCP_FIQ:
     case EXCP_VFIQ:
+    case EXCP_VFNMI:
         addr += 0x100;
         break;
     case EXCP_VSERR:
-- 
2.34.1

