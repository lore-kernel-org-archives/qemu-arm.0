Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4290659lff;
        Mon, 13 Jan 2020 07:46:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6PZn729SVozKmAvEDAwaDUBFb4eAaU13ikG+gJPT/KUslQf07s1cmS0KnPrKBeipSLJUH
X-Received: by 2002:a50:9e29:: with SMTP id z38mr18141131ede.62.1578930408273;
        Mon, 13 Jan 2020 07:46:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578930408; cv=none;
        d=google.com; s=arc-20160816;
        b=n5u90tLMkYv0LT/o9JKtF70zEpcRWGI4z5QjOSWXB+H+WnJqeQISwUx3UNJKx+zGxa
         x1c0ynK8OHl8rulip3j19iA5LP6eWqPZFl7pvpX7MEBr56il117kCuwqzuwWS4Bpp5cQ
         Dzc3GlSYrTA+6oTQIzGyDJuJid+fmSWrH/j6kKr1CKeYZjLAUdPPtjf5p9Bl1A0aw1Hi
         n83pl0kSsMcZn+QqmWDkhzAvjsY0557Mts0Z5/zvHLdcsvLAAbhk4qplmOUWPur4xUL1
         ZRmOMTYZwqDkp2Btz3lSAc1i/0/qY72oRLEO53Q943hFjtnRl7eP8yVRtmHCPAap7GMo
         JiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=UvV51rWqqElFPDA6dsEY2dah0Ws/5wZ1besb3EOGmoo=;
        b=PYdxI1arai9eqZ3C7hQ0hAfqM2zECBJfWekfNSfimtbc3oJzs4ynC6K8bvKXiaAn9Z
         nGiPjNNgqrcD/MTJ2U4N8QM8+GncM04XemvLkHY82uxpYwkljQ9O5SPnIUD5jw7qA6IK
         zwfDjUvrTa1RkiDZUtu3S8fx4lTp1Wuchti4jgT1hsZsUEErNt12Z8DpS8bY+p1MX5Zw
         ZSLtvQS4uTZD7DGz0Mz4jZmxrifRH0BQGBrWpK/HXX8u23jvu/lgjSD0I8eaJHrtj+9Y
         aA48DIdcJ9WRohGp8bPDQmK223sllJQMTzhwIVkMraIR2hjm5lHiobYv//Rr/Cq3DSrq
         WBBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si5460156ejk.476.2020.01.13.07.46.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 07:46:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ir1vS-0001WF-Sq
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 10:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1ir1v0-00018M-Nq
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 10:46:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1ir1uz-0001g5-K8
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 10:46:18 -0500
Received: from mail.dornerworks.com ([12.207.209.150]:20480
 helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>)
 id 1ir1uz-0001ZO-Fx; Mon, 13 Jan 2020 10:46:17 -0500
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: [PATCH] arm/gicv3: update virtual irq state after IAR register read
Date: Mon, 13 Jan 2020 10:46:07 -0500
Message-ID: <20200113154607.97032-1-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 12.207.209.150
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N88NnykqPrRu

The IAR0/IAR1 register is used to acknowledge an interrupt - a read of the
register activates the highest priority pending interrupt and provides its
interrupt ID. Activating an interrupt can change the CPU's virtual interrupt
state - this change makes sure the virtual irq state is updated.

Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
---
Hello,

I am using the ARMv8 version of QEMU configured with the gicv3 interrupt
controller to run the Xen hypervisor with RTEMS as a guest VM (AArch32). I
have noticed that when Xen injects a virtual irq to the guest VM, the guest
gets stuck in the interrupt handler.

The guest's interrupt handler does the following in order:
  - Reads IAR1 to acknowledge the interrupt and get the INTID
  - Unmasks interrupts by clearing the I bit in the CPSR register
  - Dispatches the interrupt to the appropriate driver
  - Restores the I bit in the CPSR state
  - Writes the INTID to EOIR1 to drop priority and deactivate the interrupt

However, when the I bit was cleared, QEMU immediately raised the same
virtual interrupt again. This process repeated itself indefinitely.

The read of the IAR1 register should activate the interrupt and prevent it
from firing again. However, the gicv3 device code wasn't updating the
irq_line_state, so the CPU_INTERRUPT_VIRQ flag remained set. Therefore, when
I bit was cleared, the CPU immediately switched to the exception handler.

I have tested this patch, and it works for Xen with both an AArch64 Linux
guest and an AArch32 RTEMS guest.

Sincerely,
Jeff Kubascik
---
 hw/intc/arm_gicv3_cpuif.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index a254b0ce87..08e000e33c 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -664,6 +664,9 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
     trace_gicv3_icv_iar_read(ri->crm == 8 ? 0 : 1,
                              gicv3_redist_affid(cs), intid);
+
+    gicv3_cpuif_virt_update(cs);
+
     return intid;
 }
 
-- 
2.17.1

