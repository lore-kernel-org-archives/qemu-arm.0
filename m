Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CA4C44501
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 10:48:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whmJE-0007um-NR; Thu, 09 Jul 2026 06:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmJ8-0007oY-JP
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 06:48:43 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmJ3-0002nQ-MX
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 06:48:42 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493e8d4f4dcso9123735e9.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 03:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783594114; x=1784198914; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rqtLfoBh3sPx8aGTGZbZdz7/c1WiWr68tf4T0IZ5WmM=;
 b=R0HKsArP50u+KP51BWKk0wb0cKzH52DF3vwX9srwxFwXOvMepHob3HyIuaDBa1PLnE
 I3zL1BHreQfTthQMYD9lN0ASzbTrezEiP1jtb1MmajUMmlx/EzDLFidLvcx3qvYrAi6x
 1zOKBvHqps4MedTcYRDIow8BhTMVCvquYzpDxoRLIdxyeJnLfq46KthUPUsIHExKiZOL
 xWksRiaDMxo7vTV8jZUWgccme+03Bh4HOXeH7huJdIFUJxAX5NNoKweNuqigbC0XAuc1
 sAqkhnmA1quVgqCnAmL3e4Adv4JGmXJCWxTOZh1bpzjPcASCD/tmczor8B1ZsEMnIZig
 /r0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783594114; x=1784198914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rqtLfoBh3sPx8aGTGZbZdz7/c1WiWr68tf4T0IZ5WmM=;
 b=OQ6YDMCK8M0cjiNyJvuBReGPs2Y3Ac8muJyFauUGXMGg08fo8TiCYqHGcm+c7gPTo5
 zf/MnJnMeYsIuuCHFcty0WqqPQ3XFodZ/zE9P5YhLK8CcbsmFKwFfqWB23pA5VJ4Z8VQ
 ZNJcaDs4XYD9e4qtYKBi4m1t3E5gNadKBm399Dyb7geGdxgC3OSEOrrc60UcGLglGbZl
 fvxJp5OpEUTAQ7LBkS9TVZc2kzjUZbsrd0MywEWjYM62UgbAJLw6GWgHx5IkB+5X1oFZ
 STKcq07UYGDQ1IbVkOtfiuPwc8y8tWZNOae0Gsf++szloGr0eRkGXYz6YhYhVsQsWi3Z
 ilvw==
X-Gm-Message-State: AOJu0Yx7QUVLlohmitWbKP9o2mBs7mDbjOrRAxy/L9yBth9o5wAGHJIC
 UUJeOU/fujGyxzYcIV6sFr3QlgRVy0TLXdTLSF5otvEtMxX0sW3joXAh/hekF3VHWpaaNPNSzn5
 eOaXiISPrXQ==
X-Gm-Gg: AfdE7cnJcUU2k5ASJMfgLWy1i/BbBYqgc24QpIB1G8M07F3LNnw2wphmCbb8Wguo+ja
 LCKf/ejzxI2ePwBeic/MobUgKdgSAW0DYcCQh8/tTaYRhTSpfaQ1nwaEwSqhKwCBuCcYNcFCoAJ
 U68nS0zN3cV9oR1hsB8yoznJSI0uruPwtphEfwmazI/s7zMTDK0mpfuaQQLj0QGu8t0em16YKIe
 qiCsPg56mwzdC56Fsn92DrE9ApRFtGqzzMRCMQdLsoXCYZk9gKcJOodz0kekUoHk9uaTWWqJXnQ
 H0ToY2kn/gWLRDX+zS7ffCr/g7lN8Bn1WOuVTJS8Gh6r3GRHmyAxHyj2xN40JHctRm18rtv5igF
 I9xPcbXr6O3up8Q+vrEOA2eHG0yA2b4pyeBAvLttn0GovMDtV77Rryul9s6PFcnSmHESGZm8oth
 aBpPGqPiPB/wgAGfe3DePtDdo0K3JLwUVEXzMbTStM/9GajOgwE/3uVvHCIHISPqG+E46MLKRoK
 jRDTxEZXPvxZDb2aPqD+A==
X-Received: by 2002:a05:600c:3115:b0:493:c862:3f2d with SMTP id
 5b1f17b1804b1-493ed78e5bfmr16231385e9.5.1783594113761; 
 Thu, 09 Jul 2026 03:48:33 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f373csm89325445e9.14.2026.07.09.03.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 03:48:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] hw/misc/stm32_rcc: Correct offset-to-irq calculation
Date: Thu,  9 Jul 2026 11:48:32 +0100
Message-ID: <20260709104832.1989240-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In the STM32 RCC, there is a block of 5 "enable" registers, each of
which has 32 bits; each bit determines the level of one of the 5 * 32
= 160 enable_irq output lines.  The code calculates the irq to be
worked on using
  irq_offset = ((addr - STM32_RCC_AHB1_ENR) / 4) * 32;

This assumes that the registers are all consecutive; however, there
is a gap between the AHB1/2/3 registers and the APB1/2 registers, so
for the APB1/2 registers we calculate a number that is 32 too high
and can index off the end of the enable_irq[] array.

The handling of the reset registers has an identical bug.

Adjust the calculation of irq_offset to cope with the gap, and fix
the case labels so accesses to the gap fall into the default
LOG_UNIMP rather than being treated as if they were an actual
register.

Coverity CID: 1663683, 1663686
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/stm32_rcc.c         | 31 +++++++++++++++++++++++++++----
 include/hw/misc/stm32_rcc.h |  6 +++++-
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/hw/misc/stm32_rcc.c b/hw/misc/stm32_rcc.c
index 74ea29b156..5cfb39e560 100644
--- a/hw/misc/stm32_rcc.c
+++ b/hw/misc/stm32_rcc.c
@@ -53,6 +53,27 @@ static uint64_t stm32_rcc_read(void *opaque, hwaddr addr, unsigned int size)
     return value;
 }
 
+static int reg_offset_to_irq_offset(hwaddr addr)
+{
+    /*
+     * The reset and enable registers aren't all consecutive. In getting the
+     * irq index from the register offset, we need to account for the gap
+     * between the AHB regs and the APB regs.
+     */
+    switch (addr) {
+    case STM32_RCC_AHB1_RSTR ... STM32_RCC_AHB3_RSTR:
+        return ((addr - STM32_RCC_AHB1_RSTR) / 4) * 32;
+    case STM32_RCC_APB1_RSTR ... STM32_RCC_APB2_RSTR:
+        return ((addr - STM32_RCC_APB1_RSTR) / 4) * 32 + STM32_RCC_N_AHB_IRQS;
+    case STM32_RCC_AHB1_ENR ... STM32_RCC_AHB3_ENR:
+        return ((addr - STM32_RCC_AHB1_ENR) / 4) * 32;
+    case STM32_RCC_APB1_ENR ... STM32_RCC_APB2_ENR:
+        return ((addr - STM32_RCC_APB1_ENR) / 4) * 32 + STM32_RCC_N_AHB_IRQS;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void stm32_rcc_write(void *opaque, hwaddr addr,
                             uint64_t val64, unsigned int size)
 {
@@ -69,11 +90,12 @@ static void stm32_rcc_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case STM32_RCC_AHB1_RSTR...STM32_RCC_APB2_RSTR:
+    case STM32_RCC_AHB1_RSTR ... STM32_RCC_AHB3_RSTR:
+    case STM32_RCC_APB1_RSTR ... STM32_RCC_APB2_RSTR:
         prev_value = s->regs[addr / 4];
         s->regs[addr / 4] = value;
 
-        irq_offset = ((addr - STM32_RCC_AHB1_RSTR) / 4) * 32;
+        irq_offset = reg_offset_to_irq_offset(addr);
         for (int i = 0; i < 32; i++) {
             new_value = extract32(value, i, 1);
             if (extract32(prev_value, i, 1) && !new_value) {
@@ -82,11 +104,12 @@ static void stm32_rcc_write(void *opaque, hwaddr addr,
             }
         }
         return;
-    case STM32_RCC_AHB1_ENR...STM32_RCC_APB2_ENR:
+    case STM32_RCC_AHB1_ENR ... STM32_RCC_AHB3_ENR:
+    case STM32_RCC_APB1_ENR ... STM32_RCC_APB2_ENR:
         prev_value = s->regs[addr / 4];
         s->regs[addr / 4] = value;
 
-        irq_offset = ((addr - STM32_RCC_AHB1_ENR) / 4) * 32;
+        irq_offset = reg_offset_to_irq_offset(addr);
         for (int i = 0; i < 32; i++) {
             new_value = extract32(value, i, 1);
             if (!extract32(prev_value, i, 1) && new_value) {
diff --git a/include/hw/misc/stm32_rcc.h b/include/hw/misc/stm32_rcc.h
index 4dccacc2db..a94781bf34 100644
--- a/include/hw/misc/stm32_rcc.h
+++ b/include/hw/misc/stm32_rcc.h
@@ -65,7 +65,11 @@
 
 #define STM32_RCC_NREGS ((STM32_RCC_DCKCFGR2 >> 2) + 1)
 #define STM32_RCC_PERIPHERAL_SIZE 0x400
-#define STM32_RCC_NIRQS (32 * 5) /* 32 bits per reg, 5 en/rst regs */
+
+/* 32 bits per reg, 3 AHB regs and 2 APB regs */
+#define STM32_RCC_N_AHB_IRQS (32 * 3)
+#define STM32_RCC_N_APB_IRQS (32 * 2)
+#define STM32_RCC_NIRQS (STM32_RCC_N_AHB_IRQS + STM32_RCC_N_APB_IRQS)
 
 #define STM32_RCC_GPIO_IRQ_OFFSET 0
 
-- 
2.43.0


