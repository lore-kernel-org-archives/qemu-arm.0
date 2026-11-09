Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7000B606D806
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 13:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IiVW3Cx/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQP4Q-0006Du-OC; Mon, 09 Nov 2026 08:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hywei787@gmail.com>)
 id 1xQGRC-00015I-1s
 for qemu-arm@nongnu.org; Sun, 08 Nov 2026 22:52:54 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hywei787@gmail.com>)
 id 1xQGR9-0005ir-Ss
 for qemu-arm@nongnu.org; Sun, 08 Nov 2026 22:52:53 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-84e513877a3so351833a34.0
 for <qemu-arm@nongnu.org>; Sun, 08 Nov 2026 19:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794196370; x=1794801170; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5tT3MmR4q+0rta1wKDveu0mhIBtzJLEnod4gjnPgewc=;
 b=IiVW3Cx/6MWevs5pJ0k1kEvwrXN2Sj9Zz0dFS+IW7TscQpU/5+1Kc+sIdt/LOtSB3S
 iO1wnqpluXh2TcSYLzAzS3KNUtX4IQjgRtj7NZ6UY7LYe9+qtx57c5cwiKxMUYGqtqrj
 mxKL5uaL3OTY8b9EiNksdmv2EYj3d23oQU+BfFMCLakKE0vT4rfI9O+TGQDqJOVgVVUk
 6FjGN9yXlTGq0U0E2eOMq2wyoYJDFx0zFnz6aDWRTlPA7BvfbQWXq+15Km6iyfpiCW0S
 ji1MZMsrMoNDOtFnebH6mjJ3CdzKDjRX6zbXxnz+iF4SF11qER+UAqUXBJoAQkXtQirS
 +3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794196370; x=1794801170;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5tT3MmR4q+0rta1wKDveu0mhIBtzJLEnod4gjnPgewc=;
 b=lA6C1sfK7MNLmj9pHzTHK0lyxTdtx1OGN1J6K/k3xDXlvMf4L4ATFsYH6f8Sa3kX1c
 o7NbAMfg6TQoFehXPSdT1ShBd71isp6yNmihE0yIVyFAzGSdQNkzieiSFLjtbWRYTX9w
 JrJL9KV2he8H6He2nFSzKEZKCd5rts0+d/Ol4AvyDgqmmKP/sqr0nDFbHhg7dhU99W3T
 ZgQHzhOtH4B23l9ShmwlPu57vH+NWI4fgFE/6D6p0vgaxldGkZmEreD0rmfPT9SN/mRN
 BteQNwiauFXxwZA4UXkkwJJm2NzOxccYLAbexijaZmqyt7TQXsZwXpDtdEQUFfAxZiYu
 eQEQ==
X-Gm-Message-State: APuU4Z+YK/ijXDrndVj2kTIGPoAivDnEwmRv7HJmJctHooPYmA5LqziF
 nE4jJapqMKIWcPRGs/H+VFr9W0lSiSuPWm06hVkJEt2sEBA1DVt8SQlN
X-Gm-Gg: AYBFou3b74GeI81oANGelOjSUBGd3eENNgYKB7P/vvTne2GNZbpJip2/mmlld98h1Ji
 Oa0wWYhkTENm/XG7pF8Xk2Ik0Y1ji3aJ6EtH6IO6Sm5rZNy1FON7i0npqPY6LRKm8tjf2a2V3yk
 EsQOFsYE1eqwWFzEF7K99vhP6RmGcVSOj1w25yzK85L49NPOwd0VS9czXdFR0R3dHk8h81E/+4E
 06H1lQL2YJ9ILKZlPSMzwFfPmbFOljII8JAuhU8pN9md1OjMZiZwd1yhqq3kdL77k3Hjlx3rdxa
 KGnuJg2cOlFE9J4PF5aqrBYZF3zFdcNiVmjv6tuXnbq5Z9KEVE1dc0f/71k/+gClU8bG6nw5qDv
 FfKVhVuI5kf7nLTHFQu3+aVC9nw4mn0JgyflrDqoHvyi5ypI8ZOj6mJRixkEvK6g304TBQW1YYa
 PvYv0TQIEJRhOd9ltPqajfoR0BTNcrbyrbH7vv0nz7f6XKrGJws4sE13HAgCZ1dndjnIURDDIY2
 d+SpuXEkM1jQVKUzAKpTjNq1MxB6J7qIi73YEGQN6tuAi0axKNJhYe5QhsRqR/taioVjQR2VgI2
 0MJbZVGacCjOtnMDIQSR
X-Received: by 2002:a05:6830:7193:b0:85b:ddb8:d3fa with SMTP id
 46e09a7af769-85f341aaaf1mr2981079a34.2.1794196369676; 
 Sun, 08 Nov 2026 19:52:49 -0800 (PST)
Received: from CI4.lan ([136.49.141.80]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f4fb29857sm2839267a34.11.2026.11.08.19.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2026 19:52:49 -0800 (PST)
From: Hanyu <hywei787@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hanyu <hywei737@utexas.edu>
Subject: [PATCH] hw/arm/bcm2838: Route SPI0 interrupt to GIC
Date: Sun,  8 Nov 2026 21:52:34 -0600
Message-ID: <20261109035234.722952-1-hywei787@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=hywei787@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 Nov 2026 08:05:57 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hanyu <hywei737@utexas.edu>

On raspi4b, SPI0's interrupt is connected only to the legacy interrupt
controller. Linux guests whose device trees use the GIC therefore
can't detect an SPI0 interrupt.

This patch adds a two-output IRQ splitter to deliver SPI0's interrupt
to both the legacy controller and GIC SPI 118. This follows commit
fb3e0557a4cb ("hw/arm/bcm2838: Route I2C interrupts to GIC").

Testing

Add these options to the QEMU invocation:

  -device m25p80,bus=spi,drive=flash0 \
  -blockdev node-name=flash0,driver=file,filename=flash.bin

Before the change, probing fails and /proc/mtd contains no devices:

  spi-nor spi0.0: SPI transfer timed out
  spi_master spi0: failed to transfer one message from queue
  spi-nor: probe of spi0.0 failed with error -2

After the change, the flash is detected:

  spi-nor spi0.0: m25p80 (1024 Kbytes)
  # cat /proc/mtd
  dev:    size   erasesize  name
  mtd0: 00100000 00010000 "spi0.0"

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3013
Signed-off-by: Hanyu <hywei737@utexas.edu>
---
 hw/arm/bcm2835_peripherals.c         | 14 +++++++++++---
 hw/arm/bcm2838.c                     |  4 ++++
 include/hw/arm/bcm2835_peripherals.h |  1 +
 include/hw/arm/bcm2838_peripherals.h |  1 +
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 558c180df9..be40c6b92a 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -166,6 +166,8 @@ static void raspi_peripherals_base_init(Object *obj)
     /* SPI */
     object_initialize_child(obj, "bcm2835-spi0", &s->spi[0],
                             TYPE_BCM2835_SPI);
+    object_initialize_child(obj, "spi-irq-splitter",
+                            &s->spi_irq_splitter, TYPE_SPLIT_IRQ);
 
     /* I2C */
     object_initialize_child(obj, "bcm2835-i2c0", &s->i2c[0],
@@ -480,10 +482,16 @@ void bcm_soc_peripherals_common_realize(DeviceState *dev, Error **errp)
 
     memory_region_add_subregion(&s->peri_mr, SPI0_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->spi[0]), 0));
+    qdev_prop_set_uint32(DEVICE(&s->spi_irq_splitter), "num-lines", 2);
+    if (!qdev_realize(DEVICE(&s->spi_irq_splitter), NULL, errp)) {
+        return;
+    }
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[0]), 0,
-                       qdev_get_gpio_in_named(DEVICE(&s->ic),
-                                              BCM2835_IC_GPU_IRQ,
-                                              INTERRUPT_SPI));
+                       qdev_get_gpio_in(DEVICE(&s->spi_irq_splitter), 0));
+    qdev_connect_gpio_out(DEVICE(&s->spi_irq_splitter), 0,
+                          qdev_get_gpio_in_named(DEVICE(&s->ic),
+                                                 BCM2835_IC_GPU_IRQ,
+                                                 INTERRUPT_SPI));
 
     /* I2C */
     for (n = 0; n < 3; n++) {
diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
index 650b1fe8f4..1bde9e68af 100644
--- a/hw/arm/bcm2838.c
+++ b/hw/arm/bcm2838.c
@@ -188,6 +188,10 @@ static void bcm2838_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out(DEVICE(&ps_base->orgated_i2c_irq_splitter), 1,
                           qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_I2C));
 
+    /* Connect the SPI interrupt to the interrupt controller */
+    qdev_connect_gpio_out(DEVICE(&ps_base->spi_irq_splitter), 1,
+                          qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_SPI));
+
     /* Connect VC mailbox to the interrupt controller */
     sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->mboxes), 0,
                        qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_MBOX));
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 4f356f4643..cd66a734e7 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -71,6 +71,7 @@ struct BCMSocPeripheralBaseState {
     BCM2835SDHostState sdhost;
     UnimplementedDeviceState i2s;
     BCM2835SPIState spi[1];
+    SplitIRQ spi_irq_splitter;
     BCM2835I2CState i2c[3];
     OrIRQState orgated_i2c_irq;
     SplitIRQ orgated_i2c_irq_splitter;
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 60bfacdce4..f9279daa4d 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -27,6 +27,7 @@
 #define GIC_SPI_INTERRUPT_DMA_9_10     88
 #define GIC_SPI_INTERRUPT_AUX_UART1    93
 #define GIC_SPI_INTERRUPT_I2C          117
+#define GIC_SPI_INTERRUPT_SPI          118
 #define GIC_SPI_INTERRUPT_SDHOST       120
 #define GIC_SPI_INTERRUPT_UART0        121
 #define GIC_SPI_INTERRUPT_RNG200       125
-- 
2.43.0


