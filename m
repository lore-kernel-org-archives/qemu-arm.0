Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924D5CCF9E0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:07:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCN8b-0003KY-GD; Fri, 24 Oct 2025 15:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN8a-0003Gx-Ou
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:07:44 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN8L-0005Wk-1J
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:07:31 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-471066cfc2aso21798855e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761332844; x=1761937644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xe5v3lt1asWPn9kptHJk/kzV1sk/igz/mIMd9PS7E3M=;
 b=PkS+equjvbNLag/r/tIkF0Y5PkVhDqRx7rXFx9KHSOJeap5Yo+xoNh1hAi4WL7HTkG
 1Y/hgfpvIVl1pw4ytkVbjG4CMtHfgMmdV/RiPiiEt0SiPP5GadAYNaqkjf4Z36kKudqh
 uckBe3dm9DCjTVHb+7h8A4rpWdtblXxU0vMgy6DjV7W8MLFHKZlj8l/d3KRAsTO6q/BH
 zeUehWFaR3lBg8iN19DlG4dGh5EKBVjkRKaBfxsLpYZ64VqyBMwbGRltqx6yQtXOotoF
 n8rDvrK6FXBiw/T5j3xhGR/s0OmtiF1T2YtcCoBYDpK7JGmY2BdWPfca+QXTPls2byhy
 2+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761332844; x=1761937644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xe5v3lt1asWPn9kptHJk/kzV1sk/igz/mIMd9PS7E3M=;
 b=GeyuqXvF9VVB/HPG6xUcuxEVkWWIlOkw9px1vVUDHL7r43+1mzrgrnogjthB5iYlvZ
 iei8rmvger0bEAvKrwA8Ch0Jp+IUBf3cVZQSKwSyVQYCfOYucFEoJaldWv+YTRGrem4b
 dCitiGLCKwPtTYNVjUP2fdUwmCPDcDWAwLVlfxNobpryj02/V0vfrRVBHe+irbLfLe6t
 5/tsqWSSNpATHsrv19iBpZXMHBCxuQbJqH/O2WvbqnDdJ+tMSsiEePH9FPYyoO87yUFF
 8cCFmESABRre6tFsxOBXvOShcMcWizbYENGAe9TugIUFnM+2cSjYu5tBGO86KNviiVdD
 axcg==
X-Gm-Message-State: AOJu0YymDWcglaRoHg7ss2HeGicXh5IuhaNAklW3q/VsKNH5P3Eqi5c0
 M87QgtDBYQZXZgF0nwaqw/bAQwRDKDq2pxsWND8St+DHPbRk+dxE8V8z6cxCB+TzDpk=
X-Gm-Gg: ASbGncvI2OdkVZjBdBt5LGjwLrJobxOYB4mYjq190IdSKFtQZCWkMwIE8LL+J3TxFDH
 9D07DIc7+Jx7v67SqwvEnP6VNJeSMj8wTHGviouydKtsQZWLyJbLks9m1nM+BGRHCtqKbUpOw5b
 XHZdkUnDDIjWJyJwxc9bLDAz4QQOJcfu3ulBWFxHf7K3bkPzK3dsXOGtbK8iuNKKWJRFw/YIe+i
 Z0Af2jlqyaU+RLEUYe9Ga1p825/o/ixFoBZ6Rcp3QP5LJ8liCKGe3btVo48ANJe4gaXjUrEvnw8
 YpLgZibiQvT9jsfewGYEr5KLLo4NSxUIxf/F3WapxoUUBYf/5LCCIo7/0j/7fOhcPn62UbnUBdp
 4NvmsP5t2QKuLr0sS0eTCP7yW/cO8hKU5VvMPct431aStWeFHqF2RltQ0wQJ/vl8M+YpTlc5Mlk
 wpEsSJL+b/9CaddJ/bsRTa+gfkmr7VNwrkexSHxK0t0zZh+AZ7u8YhIAgF/cYk
X-Google-Smtp-Source: AGHT+IHHL42jq+kWv7bwkbCqhqJl6wI5+ZAIN94rhWy0oYxeiCcmfQP/ob7ihjyIdvV26ky8WlaCOg==
X-Received: by 2002:a05:600c:3488:b0:459:e398:ed89 with SMTP id
 5b1f17b1804b1-4711786c586mr210976455e9.1.1761332843600; 
 Fri, 24 Oct 2025 12:07:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428f709sm165005335e9.8.2025.10.24.12.07.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:07:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 02/27] hw/sysbus: Have various helpers take a const
 SysBusDevice argument
Date: Fri, 24 Oct 2025 21:03:49 +0200
Message-ID: <20251024190416.8803-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

These getters don't update any SysBusDevice internal fields,
make the argument const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sysbus.h | 10 +++++-----
 hw/core/sysbus.c    | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 18fde8a7b48..69eb62e29c8 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -70,17 +70,17 @@ struct SysBusDevice {
 typedef void FindSysbusDeviceFunc(SysBusDevice *sbdev, void *opaque);
 
 void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory);
-MemoryRegion *sysbus_mmio_get_region(SysBusDevice *dev, int n);
+MemoryRegion *sysbus_mmio_get_region(const SysBusDevice *dev, int n);
 void sysbus_init_irq(SysBusDevice *dev, qemu_irq *p);
 void sysbus_pass_irq(SysBusDevice *dev, SysBusDevice *target);
 void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size);
 
 
-bool sysbus_has_irq(SysBusDevice *dev, int n);
-bool sysbus_has_mmio(SysBusDevice *dev, unsigned int n);
+bool sysbus_has_irq(const SysBusDevice *dev, int n);
+bool sysbus_has_mmio(const SysBusDevice *dev, unsigned int n);
 void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
-bool sysbus_is_irq_connected(SysBusDevice *dev, int n);
-qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
+bool sysbus_is_irq_connected(const SysBusDevice *dev, int n);
+qemu_irq sysbus_get_connected_irq(const SysBusDevice *dev, int n);
 void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
 int sysbus_mmio_map_name(SysBusDevice *dev, const char*name, hwaddr addr);
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ec69e877a2c..ae447c1196a 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -80,7 +80,7 @@ static void system_bus_class_init(ObjectClass *klass, const void *data)
 }
 
 /* Check whether an IRQ source exists */
-bool sysbus_has_irq(SysBusDevice *dev, int n)
+bool sysbus_has_irq(const SysBusDevice *dev, int n)
 {
     char *prop = g_strdup_printf("%s[%d]", SYSBUS_DEVICE_GPIO_IRQ, n);
     ObjectProperty *r;
@@ -91,12 +91,12 @@ bool sysbus_has_irq(SysBusDevice *dev, int n)
     return (r != NULL);
 }
 
-bool sysbus_is_irq_connected(SysBusDevice *dev, int n)
+bool sysbus_is_irq_connected(const SysBusDevice *dev, int n)
 {
     return !!sysbus_get_connected_irq(dev, n);
 }
 
-qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n)
+qemu_irq sysbus_get_connected_irq(const SysBusDevice *dev, int n)
 {
     DeviceState *d = DEVICE(dev);
     return qdev_get_gpio_out_connector(d, SYSBUS_DEVICE_GPIO_IRQ, n);
@@ -114,7 +114,7 @@ void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq)
 }
 
 /* Check whether an MMIO region exists */
-bool sysbus_has_mmio(SysBusDevice *dev, unsigned int n)
+bool sysbus_has_mmio(const SysBusDevice *dev, unsigned int n)
 {
     return (n < dev->num_mmio);
 }
@@ -190,7 +190,7 @@ void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory)
     dev->mmio[n].memory = memory;
 }
 
-MemoryRegion *sysbus_mmio_get_region(SysBusDevice *dev, int n)
+MemoryRegion *sysbus_mmio_get_region(const SysBusDevice *dev, int n)
 {
     assert(n >= 0 && n < QDEV_MAX_MMIO);
     return dev->mmio[n].memory;
-- 
2.51.0


