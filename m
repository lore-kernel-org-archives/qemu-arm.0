Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3413806lfq;
        Sat, 10 Oct 2020 13:38:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsbBadRdoTylM0HM3hl8Q5kAWZakuLT1EZ6q8pzbx/kxGAzPOrB3T4GVU/CHb7x9LXhVyE
X-Received: by 2002:a25:4289:: with SMTP id p131mr25840692yba.257.1602362284297;
        Sat, 10 Oct 2020 13:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602362284; cv=none;
        d=google.com; s=arc-20160816;
        b=EVp6njdz6j6Q9qIfumUc1qxd8tM4aF/MfXepdZwjR1CS1jodreofi9jdJqvQr6A/mO
         THhlR3HeowdwlDwBaZ0MroysRiw4qvFShoxG8f6oTbdrBLAcnW0YfELJjzcemsndu1gZ
         Ng1VE3aiZ/rKrrcLCe+7pbppasCd6wVh346UrSQNXLAZl1tI5ANlH8vZwuTH4bABBv6x
         faQxautneK68vlQ9uWOaSaEd8946ca4+PL+B6rtIMNrnv9NqX44wL4uldk3kpHT/E8ni
         Us+ncPyIMBCVSL91/aq8Fwr5+SrsTtDOX8E2nPV/oGDu3lGhsShaIvt6Rqs/h9iA8A0A
         rZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lr9XWjXVDUSEQoFZSyyozoh2chXy3lHKAs9QRDzRDc8=;
        b=TSWMdgWFx9z92jGPdzWQrwhw1cdd7zA45i00gR6RJ0D++XlvpmFvpxQ4JKdyOi5gWC
         f9rNEYT2KAGE2p0W3a/w/JUkC0HjLoMlV8sEvqiDb5NH9SyIe4+Pkf1fpYpOZW3G8yyF
         F9CosoE6r/eFpN4ANC4Tz29EW6hgevP6f+Ihfzv+AO8mHlZw1FxJwhkXMhQ8/rEVi3fe
         1H4Df/yjbPC1zXCdeSGvxDkyp+JilhNffvWAhyiCiHtsIiBPJkqCM9RWuw8NfNQwGnQy
         6T1fv+T8noklTSbwal0PCvtJ3WygYfZtkoFUdhUsMAZiu3zJpkowi/jcu7SJ3hI5E042
         bTLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DsT3sSq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si331497ybd.269.2020.10.10.13.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Oct 2020 13:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DsT3sSq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRLcx-0002Bb-Mm
	for alex.bennee@linaro.org; Sat, 10 Oct 2020 16:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRLcG-0001zg-L9; Sat, 10 Oct 2020 16:37:21 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRLcE-0006dg-Ur; Sat, 10 Oct 2020 16:37:20 -0400
Received: by mail-wm1-x341.google.com with SMTP id e2so13274641wme.1;
 Sat, 10 Oct 2020 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lr9XWjXVDUSEQoFZSyyozoh2chXy3lHKAs9QRDzRDc8=;
 b=DsT3sSq4ds8A8NxhET9nOPv7HkTLCGhv833G1LL/5aT5bKU3CcMuCohAb0Qo6CyFEy
 B+oTHKeBSanWFJcssx8Ax3bJbIMB1G8xkF1MuUunI6X40BdRWnY7gE1DCgCQAdlIy45m
 qgaAQHw6xVXjDq+Xxq4rkJj6VFsBxUfaOJuGLLo2Fw7xOi3gb6CSEsoyIBhdvuVcqOqf
 IoLCOWrOiRcTlsnNPHjbOloIuGaa3zArYBmbujm3kbw2iX0k6wgRmhhk0N8r9rjfHlJK
 4vhuea1ZWwL8TonOjtLGcZfUyYRijmi1w2pLiXmUcnIe86dWGjBUzg43pJ31vMKEIGCa
 IQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lr9XWjXVDUSEQoFZSyyozoh2chXy3lHKAs9QRDzRDc8=;
 b=a2u7sa4NjYxoNEEAYyvzTXZgBmeNdXBX9z+BEnoFUoqfeiVfP4ocQ1jjf3zOXocZQY
 ykl1/qBlFLUAUgKv8C01OwSIYfTkD3hUs4xBvIvcNyM7jvMCkq88cYhff4rBtS4w/r16
 OWS5ihi3OpY/KeeAPd1mtVQuYkfYr3gehkl9SnzJHA3VY7zTosIA9S6pdbemKvzDnOjc
 C+PpIjoJP0OQ4BgBg3O5/qmtvzEj0D+bqqmziYd4opkFspXQn8xT77wUOuzNcG51xu5c
 D0fF56NMyY41X7Ck/V5czoESulXDpADdADzSLxDAqqbEPkyq/0MuY3cJvNOPhC2lRAWk
 eksg==
X-Gm-Message-State: AOAM531poVQasVChoJsLob292QAXZWaws6tgLilPQb3uwJAI89o0xdrE
 X2mU4+bOASO4UJEI/RE7ARQ/5xzx7Tg=
X-Received: by 2002:a1c:4056:: with SMTP id n83mr3953706wma.186.1602362237181; 
 Sat, 10 Oct 2020 13:37:17 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id v17sm5661341wru.44.2020.10.10.13.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 13:37:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/4] hw/arm/bcm2835_peripherals: Correctly wire the
 SYS_timer IRQs
Date: Sat, 10 Oct 2020 22:37:09 +0200
Message-Id: <20201010203709.3116542-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201010203709.3116542-1-f4bug@amsat.org>
References: <20201010203709.3116542-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLQr9B8N0Si/

The SYS_timer is not directly wired to the ARM core, but to the
SoC (peripheral) interrupt controller.

Fixes: 0e5bbd74064 ("hw/arm/bcm2835_peripherals: Use the SYS_timer")
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 15c5c72e465..48909a43c32 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -171,8 +171,17 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
-        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
-                               INTERRUPT_ARM_TIMER));
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_TIMER0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 1,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_TIMER1));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 2,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_TIMER2));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 3,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_TIMER3));
 
     /* UART0 */
     qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
-- 
2.26.2

