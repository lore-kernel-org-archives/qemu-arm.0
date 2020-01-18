Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp621804lff;
        Sat, 18 Jan 2020 08:45:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyt2subNCBj3igjURRmTB+SMeuHHStlw2lFV70uVIcPQMiEWt5G4Fc+0BqXHKB2suc8nHsk
X-Received: by 2002:aa7:cf86:: with SMTP id z6mr9715222edx.85.1579365910520;
        Sat, 18 Jan 2020 08:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579365910; cv=none;
        d=google.com; s=arc-20160816;
        b=NrZD6wTn9/CUcnFNufk/m6PJQMqQmtSY8YGWnGU7SnJh/OpsNadytnZ9NuRwC3eiiW
         CrhAKBNoaO5AbaoeD9tVhDP5T/qlbzVTnWtOG6+ND2FFnhWR/tnRT8IkGkhecniU1enS
         hD86PGWRYvVAiC9PV8FQZBwiM2N/IC9ltNLn5VE38dCe+GLVV2O4FQfZEFFPWAbxRQq1
         IkIYF9OJNRBznWbcCFkaRO6o+ok6rPW6eqrPb+Crby14/oJxVpKYWsuPDM/PquQdl+/P
         xlePC5B304Igyd2y016NAUx5IEQx4XBWlPIaoxfUycvTW7jMK0pu/cW04pdYWFV6HXg5
         aDsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=tRwDVw1z7dnvwBqcQOZ2x3vMeHUqSzC7MqSr7UW/FEw=;
        b=Ig9dQdx1VdhwRIBkBYjZf6xiysq66O21Rz65Ig9GKzhn4h0oBPXN5O6CaKf1SkB0L6
         s7Jnz17yKgHNmBRsXy18gxC4uTD/VO2bMd+X+VQr5bTZ9Ze94/NZrMxSXKaH+ESDxKOQ
         78HiFdfkyRSaVuGfWWIiNzpoDhEXzD8SgkUyWR2Qxi7CP9U+Q9+8g7hMkcD87jUQBnQd
         kM/iYtT9Ema5VFBswgb7tvoYBEtmCwKS1d28Ajf36ildWiuVVzuFgZjvM3x5kdttR+9n
         IOOYKjpXHAknFypS7uGM/Dx3nsE2aUDJvIdz91Nz6/4iMIQ+VtsfPLY7ozFFuUWIdNlG
         Pyhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ph+JP6lA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si21465804edf.335.2020.01.18.08.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 08:45:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ph+JP6lA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isrDg-0007Up-Si
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 11:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1isrBN-00049b-Ib
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 11:42:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1isrBM-0002Dd-9b
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 11:42:45 -0500
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:46325)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1isrBM-0002DL-5i; Sat, 18 Jan 2020 11:42:44 -0500
Received: by mail-yw1-xc41.google.com with SMTP id u139so15847854ywf.13;
 Sat, 18 Jan 2020 08:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tRwDVw1z7dnvwBqcQOZ2x3vMeHUqSzC7MqSr7UW/FEw=;
 b=ph+JP6lAQFQIZTaRhGOAaSeRyGCUSHGJ9MDiNca5pbVGF7eZvqLAYZyX50MLNcBg3o
 /KdA3BSgz/Onzf+hY9tYTcpeGpvtAXfuFHGcN9AevasonL1DAA+siwb6uNN/Gt2btFyd
 YdIGR00bXiY7dR/28494jezH23H11CbSTbiusolpVkYGmxRzScxJK4GkkeK9l3q8IJem
 AZcZ0yPu3xRHh0CzgE9VCoMZgSOHVu+gyNcbKwLMlqHRlfhKTfqCo3CyB1llD3eGkcGP
 xUNfb2thZZgbvHyrIVwvbuCaTXsBC+tWmxvL9R0UHQqqOjdtXrv06C9G10SQRGwlX6Nn
 gdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=tRwDVw1z7dnvwBqcQOZ2x3vMeHUqSzC7MqSr7UW/FEw=;
 b=QPMNhQwZXk1MgIo0Hxv1JyD4Kcoyw0tvHNtCBtprRZYJ71nRVpBYB+qFgOtAhPahat
 tJ3aAyOrossjytpUkfd1X67jvNQ+CdZVnf6QSvx4EIto9SJOsNffztod9IFmS68KV4/c
 K3Fih2J/pwRi+lcg2dATzCWA58AZii6LSpXBuygrlJVt7bj+PAGxKxYyXtgcwcqK/wVz
 O66a5+di2jdiSCLpxNN9e3+Az9N9e4ZrO2yt6QQ0c0Xh6LcMW49Ir1uHTFeQ5ZIYuMJ+
 q0A7UhyySbn0MmZAFtksn1zfe65CHQsmlG+1y+Q3gAnseU6Ug2HCVqeTraEpkUUHKE/U
 0iGQ==
X-Gm-Message-State: APjAAAX9kA5Z+pN3G+7kQo27sOz+BpQ5Jmk5QxEnemcYmsuuVqz5asbb
 EqeO2Hl0wlhyiqf7sP2bCtQ=
X-Received: by 2002:a0d:ea86:: with SMTP id
 t128mr32647511ywe.213.1579365763583; 
 Sat, 18 Jan 2020 08:42:43 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k5sm13220872ywa.80.2020.01.18.08.42.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 Jan 2020 08:42:43 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 6/7] hw/char/exynos4210_uart: Add receive DMA support
Date: Sat, 18 Jan 2020 08:42:28 -0800
Message-Id: <20200118164229.22539-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200118164229.22539-1-linux@roeck-us.net>
References: <20200118164229.22539-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NzigdZrjfiWR

To support receive DMA, we need to inform the DMA controller if receive data
is available. Otherwise the DMA controller keeps requesting data, causing
receive errors.

Implement this using an interrupt line. The instantiating code then needs
to connect the interrupt with the matching DMA controller GPIO pin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 hw/char/exynos4210_uart.c | 24 ++++++++++++++++++++++++
 hw/char/trace-events      |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 63ea9663f2..6fe38fad3e 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -154,6 +154,7 @@ typedef struct Exynos4210UartState {
 
     CharBackend       chr;
     qemu_irq          irq;
+    qemu_irq          dmairq;
 
     uint32_t channel;
 
@@ -261,6 +262,24 @@ exynos4210_uart_Rx_FIFO_trigger_level(const Exynos4210UartState *s)
     return exynos4210_uart_FIFO_trigger_level(s->channel, reg);
 }
 
+/*
+ * Update Rx DMA busy signal if Rx DMA is enabled. For simplicity,
+ * mark DMA as busy if DMA is enabled and the receive buffer is empty.
+ */
+static void exynos4210_uart_update_dmabusy(Exynos4210UartState *s)
+{
+    bool rx_dma_enabled = (s->reg[I_(UCON)] & 0x03) == 0x02;
+    uint32_t count = fifo_elements_number(&s->rx);
+
+    if (rx_dma_enabled && !count) {
+        qemu_irq_raise(s->dmairq);
+        trace_exynos_uart_dmabusy(s->channel);
+    } else {
+        qemu_irq_lower(s->dmairq);
+        trace_exynos_uart_dmaready(s->channel);
+    }
+}
+
 static void exynos4210_uart_update_irq(Exynos4210UartState *s)
 {
     /*
@@ -282,10 +301,12 @@ static void exynos4210_uart_update_irq(Exynos4210UartState *s)
         count = fifo_elements_number(&s->rx);
         if ((count && !(s->reg[I_(UCON)] & 0x80)) ||
             count >= exynos4210_uart_Rx_FIFO_trigger_level(s)) {
+            exynos4210_uart_update_dmabusy(s);
             s->reg[I_(UINTSP)] |= UINTSP_RXD;
             timer_del(s->fifo_timeout_timer);
         }
     } else if (s->reg[I_(UTRSTAT)] & UTRSTAT_Rx_BUFFER_DATA_READY) {
+        exynos4210_uart_update_dmabusy(s);
         s->reg[I_(UINTSP)] |= UINTSP_RXD;
     }
 
@@ -311,6 +332,7 @@ static void exynos4210_uart_timeout_int(void *opaque)
         (s->reg[I_(UCON)] & (1 << 11))) {
         s->reg[I_(UINTSP)] |= UINTSP_RXD;
         s->reg[I_(UTRSTAT)] |= UTRSTAT_Rx_TIMEOUT;
+        exynos4210_uart_update_dmabusy(s);
         exynos4210_uart_update_irq(s);
     }
 }
@@ -499,6 +521,7 @@ static uint64_t exynos4210_uart_read(void *opaque, hwaddr offset,
             s->reg[I_(UTRSTAT)] &= ~UTRSTAT_Rx_BUFFER_DATA_READY;
             res = s->reg[I_(URXH)];
         }
+        exynos4210_uart_update_dmabusy(s);
         trace_exynos_uart_read(s->channel, offset,
                                exynos4210_uart_regname(offset), res);
         return res;
@@ -666,6 +689,7 @@ static void exynos4210_uart_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 
     sysbus_init_irq(dev, &s->irq);
+    sysbus_init_irq(dev, &s->dmairq);
 }
 
 static void exynos4210_uart_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/trace-events b/hw/char/trace-events
index cb73fee6a9..6f938301d9 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -79,6 +79,8 @@ nrf51_uart_read(uint64_t addr, uint64_t r, unsigned int size) "addr 0x%" PRIx64
 nrf51_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx64 " size %u"
 
 # exynos4210_uart.c
+exynos_uart_dmabusy(uint32_t channel) "UART%d: DMA busy (Rx buffer empty)"
+exynos_uart_dmaready(uint32_t channel) "UART%d: DMA ready"
 exynos_uart_irq_raised(uint32_t channel, uint32_t reg) "UART%d: IRQ raised: 0x%08"PRIx32
 exynos_uart_irq_lowered(uint32_t channel) "UART%d: IRQ lowered"
 exynos_uart_update_params(uint32_t channel, int speed, uint8_t parity, int data, int stop, uint64_t wordtime) "UART%d: speed: %d, parity: %c, data bits: %d, stop bits: %d wordtime: %"PRId64"ns"
-- 
2.17.1

