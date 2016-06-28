Received: by 10.25.21.96 with SMTP id l93csp1963215lfi;
        Tue, 28 Jun 2016 21:02:48 -0700 (PDT)
X-Received: by 10.55.5.144 with SMTP id 138mr7897585qkf.196.1467172968635;
        Tue, 28 Jun 2016 21:02:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si515319qke.116.2016.06.28.21.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 21:02:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bI6i7-0005JK-UN
	for alex.bennee@linaro.org; Wed, 29 Jun 2016 00:02:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1bI0oc-00082p-2i
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 17:45:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1bI0oX-0001e5-5Y
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 17:45:05 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:33420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>)
	id 1bI0oW-0001e1-UL; Tue, 28 Jun 2016 17:45:01 -0400
Received: by mail-pf0-x241.google.com with SMTP id c74so2746408pfb.0;
	Tue, 28 Jun 2016 14:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5E0jvldEjWzKB3KLxCRjoXv4MLXc7YoqKsRoEys1lQ4=;
	b=amncH6AIa3Z6TIt7FFwptl+IF3/w5Dlqv9+ZJLzxtFlSBdqtdii9kqetbRGLWMghNJ
	DkP0cI+L5nSICrJsHbmUqTTIhuq/ZtXsWIFfygkS4I41pDpD9gRNM+b0c3kilVM25Rkq
	QSmyJJlrumjhStmuqUrTuOLw+MhNY/sCtVkSSHDa+g77+8oN8D6h80QXQKJPnd3R6t61
	bM83lnNck7HA3fVX0VVokrz+y0SVRZbSjFRUpSr7YMNA7D8FEjYDBm1AJprZPlM3T4Pj
	w4kYK1d9TTXu3Ohp3hQpnbm9/CHE6JctZIsPT3C7R0N9uS1pELwkN2M6oy+PIrfOuqE+
	TJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5E0jvldEjWzKB3KLxCRjoXv4MLXc7YoqKsRoEys1lQ4=;
	b=cAIw4ddZp1Vc3+LkWqKqoDdQHxH8kibtOiSnWMs15Ti8wnrByVQlQG7bUZH0uuftlO
	3IaP110mzvb2UYLhKENZQU11PP81axSwu2F5Z+gQ39tzXgeysqxibYBciIRWZjRgfwIY
	MpPVM9JW1srjvsTXSHclEUHSFT7XxkFq4E0sKQSZ6xyHxm0HC+vJZsZM3C2zGhXp/qaJ
	UX+GNzbwYdjsemxeIB0jomQ7v9WuBDT6tgCZInvZtHEBLRutBt2IgJxC9ECq9cRdIiEa
	hjkQVuSfLfJ+oHL88wDbDUB/fENQ3/WGaFWX8MxVzRtsSNy4KgEvefhHtdMuAEMi0D0d
	r6JA==
X-Gm-Message-State: ALyK8tIN+7/SKqSSvXO4Ghb4I2dBJDbuJS6f8vpcvwtIayGLa9vNkiWvAkL8+Y+CQ29pDA==
X-Received: by 10.98.36.130 with SMTP id k2mr5705696pfk.118.1467150299621;
	Tue, 28 Jun 2016 14:44:59 -0700 (PDT)
Received: from squirtle.localdomain.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id a87sm294596pfc.63.2016.06.28.14.44.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jun 2016 14:44:59 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue, 28 Jun 2016 14:44:27 -0700
Message-Id: <1467150268-11038-1-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
X-Mailman-Approved-At: Wed, 29 Jun 2016 00:02:41 -0400
Subject: [Qemu-arm] [RFC PATCH] armv7m_nvic: Use qemu_get_cpu(0) instead of
 current_cpu
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VAKzxB6elhyZ

Starting QEMU with -S results in current_cpu containing its initial
value of NULL. It is however possible to connect to such QEMU instance
and query various CPU registers, one example being CPUID, and doing that
results in QEMU segfaulting.

Using qemu_get_cpu(0) seem reasonable enough given that ARMv7M
architecture is a single core architecture.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/intc/armv7m_nvic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 890d5d7..06d8db6 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -187,11 +187,11 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
     case 0x1c: /* SysTick Calibration Value.  */
         return 10000;
     case 0xd00: /* CPUID Base.  */
-        cpu = ARM_CPU(current_cpu);
+        cpu = ARM_CPU(qemu_get_cpu(0));
         return cpu->midr;
     case 0xd04: /* Interrupt Control State.  */
         /* VECTACTIVE */
-        cpu = ARM_CPU(current_cpu);
+        cpu = ARM_CPU(qemu_get_cpu(0));
         val = cpu->env.v7m.exception;
         if (val == 1023) {
             val = 0;
@@ -222,7 +222,7 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
             val |= (1 << 31);
         return val;
     case 0xd08: /* Vector Table Offset.  */
-        cpu = ARM_CPU(current_cpu);
+        cpu = ARM_CPU(qemu_get_cpu(0));
         return cpu->env.v7m.vecbase;
     case 0xd0c: /* Application Interrupt/Reset Control.  */
         return 0xfa050000;
@@ -349,7 +349,7 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
         }
         break;
     case 0xd08: /* Vector Table Offset.  */
-        cpu = ARM_CPU(current_cpu);
+        cpu = ARM_CPU(qemu_get_cpu(0));
         cpu->env.v7m.vecbase = value & 0xffffff80;
         break;
     case 0xd0c: /* Application Interrupt/Reset Control.  */
-- 
2.5.5

