Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A75B606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 04:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=spacecubics-com.20260707.gappssmtp.com header.i=@spacecubics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NINi8ODW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWnEc-0002LV-O3; Thu, 26 Nov 2026 23:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxz@spacecubics.com>)
 id 1xWlTZ-0001qA-Kl
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 21:14:15 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxz@spacecubics.com>)
 id 1xWlTX-0001Hq-L4
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 21:14:13 -0500
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-cdece95eca4so98062a12.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 18:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=spacecubics-com.20260707.gappssmtp.com; s=20260707; t=1795745650;
 x=1796350450; darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=arc4fQYrPi85JZTY7m7ZVwa59Sx4cfTLrYOonvv8yNY=;
 b=NINi8ODWEPANOXDQ11Im8ZxUYo4Kfea3gTWSVyol/2aHrisWIXLdNTEDdeIxyoifmr
 WoceGtBOLuXK2qM7Yiglz7DcehITo1NI+fUhQpBLUehiuVg59vs0oajsl1eyDIgIAx1h
 6dXwLQKdYAT8QUcHVLHEcrtS+NYxzSy5ZxzntKPKsk0paYY4pRhZimyXbLK+bxyVwTfS
 My7uSQr2S8e5WxQQzNnHFnJH5AVejtxSjpiv80lDxhFRZAoRYTMTSUtrkes5swvWC845
 RH1w+19DQZjPUifvgqnVeyfQI1SRV9L1oiHb7zJ/w71Ju0vIdlU+4ZycRTaoWOjAR/uY
 aT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795745650; x=1796350450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=arc4fQYrPi85JZTY7m7ZVwa59Sx4cfTLrYOonvv8yNY=;
 b=zHKBX+GN/6LxHfSSE8zs/TCF4sXFT+13TypgAMeWdsBn9bZgggbdn0eMuK4kIaTfuV
 S7Oa6/hiIbDRwNKYNdM9xZugVIgGCtV026mDNClPzxXd3QyeyRIOb6gRY4PmKNc4MHEF
 6N8dsFJTHJJzor2aw5UZ68l91cagrcpIQ9303IyniK4NfT3FYXQDYcjBo7uo0PfNtteL
 0A52pb47Rj/5s6UmRMK0izcM0ZLhXd1y/S+AOhQs+AyYhpb0p0dbnKL0GxdFsBR0RoLF
 Qd968rVrURl5nopZWdCDHs81BCdBj9vllGelyfRIcDfGs0Nu/6n0DJDbcocJmG9WwVt7
 JhiQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGTohByd8x6JzqpA5Loj0p2ZQ2FcwHzxcBQlGupLJgLPq1wrDK9C3CJ+HwNdUaqjN71Y4g8+X1g8w==@nongnu.org
X-Gm-Message-State: APuU4Z8hPQgTeU42bIDJ2Ny1n6t8AKEDj5fHXnHVe/UOzKoNP9v3Yoay
 x1LQKlNCXrBVjpbK7BJ0//Uazqm4Xx5EGDzc4Jf1oMAmzQsXOzJXZnFwYIvS9t+vlXl7DAVIp1u
 PgS1c89A=
X-Gm-Gg: AZFdTZeEiyUXX0lr456kToZbi3InQZ6pNbRh7OYMcYtAIimA/27gHVe5cc1fceTak+m
 jub2kFD/kpOisNQF7mCHDerpFWUNmrE/Ie5rgJNbSYVXeGs71Gv1r6s2/EmCObYiXycIzfOzUQB
 jFNEWn7xi9MmKIhjEJ9gUEfDiUG/NX7FwEycYcKTDOKmjrqTlWkW4Cfq6mOsqNvEfxsZs4Dd77O
 uF1UseT1byL5VOcKQBDXrtiw50lihukFvV1BdFoWyXbhJCoTQvQ2yTiJnkH1PigdbEQ/yXGhbeX
 oOe+Rg2AI3+epkRgYMVsPeKbSfEzfOybZ+aAC/7kwCrCs0amIWzvwD9YZGKyUnaPfIWpAp/lPez
 PYMUPrDdY3d98/W6WRF8INOWYzrgnKTLxf633kOFeCzO0wvfBtiClTOj98Uh5bhCqzhNSVuYelD
 62Ix8WsmJ9cvKLidP45StZ7/aw170MskfwghK0Yl8J+zdnzKaA7xZyfZFxs3XzXUnK6zYgdIZQY
 Bxw4SzNl+6CFWZpT6J5xChC9W2KwUcS0wTAATFd31sI0MjQLmC0HApJ4meuedlG0NqmuKxYfYDz
 Mhz2s2GHdQdSHpmc+LaInzG6ByUSam3ZKJikJbHCGfFUke8yo6AEIOaFJQgrtzj9ow==
X-Received: by 2002:a17:90b:4a06:b0:3a4:9dd7:296f with SMTP id
 98e67ed59e1d1-3b41caec8a1mr21263215a91.40.1795745650002; 
 Thu, 26 Nov 2026 18:14:10 -0800 (PST)
Received: from [127.0.0.2] (182-166-200-88f1.hyg1.eonet.ne.jp.
 [182.166.200.88]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b53479b149sm1368372a91.6.2026.11.26.18.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 18:14:09 -0800 (PST)
From: Maximilian Zimmermann <maxz@spacecubics.com>
Date: Fri, 27 Nov 2026 11:13:35 +0900
Subject: [PATCH 2/3] hw/arm/scobc_a1: Add mission bus UARTs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-add-scobc-a1-board-v1-2-b572280dcde1@spacecubics.com>
References: <20261127-add-scobc-a1-board-v1-0-b572280dcde1@spacecubics.com>
In-Reply-To: <20261127-add-scobc-a1-board-v1-0-b572280dcde1@spacecubics.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Maximilian Zimmermann <maxz@spacecubics.com>
X-Mailer: b4 0.15.2
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=maxz@spacecubics.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Nov 2026 23:06:53 -0500
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT,WEIRD_QUOTING autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The default FPGA image provides six Xilinx UART Lite instances on the
mission bus, which firmware uses to talk to devices on the base I/O
board and the rest of the spacecraft.

Replace the unimplemented devices with UART Lite models at 0x5000_0000
to 0x5005_0000, connected to IRQ 16 to 21. Factor out the UART creation
into a helper shared with the console UART. The mission UARTs are
connected to serial1 to serial6, after the console UART on serial0.

Signed-off-by: Maximilian Zimmermann <maxz@spacecubics.com>
---
 docs/system/arm/scobc-a1.rst | 12 +++++++++++-
 hw/arm/scobc_a1.c            | 42 ++++++++++++++++++++++++++++--------------
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/docs/system/arm/scobc-a1.rst b/docs/system/arm/scobc-a1.rst
index 0f4f3a757a..68c46af05e 100644
--- a/docs/system/arm/scobc-a1.rst
+++ b/docs/system/arm/scobc-a1.rst
@@ -21,6 +21,7 @@ Supported devices
 - 4 MiB HRMEM main memory
 - HRMEM mirror (``0x6000_0000``)
 - Xilinx UART Lite console UART (``0x4f01_0000``)
+- 6 Xilinx UART Lite mission bus UARTs (``0x5000_0000`` - ``0x5005_0000``)
 
 Missing devices
 """""""""""""""
@@ -35,7 +36,16 @@ The following devices are present in the memory map but not implemented:
 - System monitor (FPGA watchdog, SEM controller, XADC and board health
   monitor)
 - General purpose timer
-- Mission bus UARTs, I2C, SPI and GPIO controllers
+- Mission bus I2C, SPI and GPIO controllers
+
+Serial ports
+""""""""""""
+
+The UARTs are connected to the ``-serial`` options in the following order:
+
+- ``serial0``: console UART (``0x4f01_0000``)
+- ``serial1`` - ``serial6``: mission bus UART 1 - 6 (``0x5000_0000`` -
+  ``0x5005_0000``)
 
 Boot options
 """"""""""""
diff --git a/hw/arm/scobc_a1.c b/hw/arm/scobc_a1.c
index 877bc2e41f..e7bec640a4 100644
--- a/hw/arm/scobc_a1.c
+++ b/hw/arm/scobc_a1.c
@@ -43,11 +43,29 @@ OBJECT_DECLARE_SIMPLE_TYPE(SCOBCA1MachineState, SCOBC_A1_MACHINE)
 #define SCOBC_A1_UART_BASE    0x4f010000
 #define SCOBC_A1_UART_IRQ     0
 
+/* Mission bus UARTs of the default FPGA image */
+#define SCOBC_A1_NUM_MISSION_UARTS 6
+#define SCOBC_A1_MISSION_UART_BASE 0x50000000
+#define SCOBC_A1_MISSION_UART_IRQ  16
+
+static void scobc_a1_create_uart(DeviceState *armv7m, hwaddr base, int irq,
+                                 Chardev *chr)
+{
+    DeviceState *uart;
+
+    uart = qdev_new(TYPE_XILINX_UARTLITE);
+    qdev_prop_set_enum(uart, "endianness", ENDIAN_MODE_LITTLE);
+    qdev_prop_set_chr(uart, "chardev", chr);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(uart), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(uart), 0, base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(uart), 0,
+                       qdev_get_gpio_in(armv7m, irq));
+}
+
 static void scobc_a1_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     SCOBCA1MachineState *s = SCOBC_A1_MACHINE(machine);
-    DeviceState *uart;
 
     /* Check the amount of memory is compatible with the board */
     if (machine->ram_size != mc->default_ram_size) {
@@ -79,13 +97,9 @@ static void scobc_a1_init(MachineState *machine)
                              OBJECT(get_system_memory()), &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_fatal);
 
-    uart = qdev_new(TYPE_XILINX_UARTLITE);
-    qdev_prop_set_enum(uart, "endianness", ENDIAN_MODE_LITTLE);
-    qdev_prop_set_chr(uart, "chardev", serial_hd(0));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(uart), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(uart), 0, SCOBC_A1_UART_BASE);
-    sysbus_connect_irq(SYS_BUS_DEVICE(uart), 0,
-                       qdev_get_gpio_in(DEVICE(&s->armv7m), SCOBC_A1_UART_IRQ));
+    /* Console UART */
+    scobc_a1_create_uart(DEVICE(&s->armv7m), SCOBC_A1_UART_BASE,
+                         SCOBC_A1_UART_IRQ, serial_hd(0));
 
     /* System peripherals */
     create_unimplemented_device("scobc-a1.qspi-config", 0x40000000, 0x10000);
@@ -99,12 +113,12 @@ static void scobc_a1_init(MachineState *machine)
     create_unimplemented_device("scobc-a1.timer", 0x4f050000, 0x10000);
 
     /* Mission AXI bus peripherals (as defined in standard FPGA image) */
-    create_unimplemented_device("scobc-a1.uartlite1", 0x50000000, 0x10000);
-    create_unimplemented_device("scobc-a1.uartlite2", 0x50010000, 0x10000);
-    create_unimplemented_device("scobc-a1.uartlite3", 0x50020000, 0x10000);
-    create_unimplemented_device("scobc-a1.uartlite4", 0x50030000, 0x10000);
-    create_unimplemented_device("scobc-a1.uartlite5", 0x50040000, 0x10000);
-    create_unimplemented_device("scobc-a1.uartlite6", 0x50050000, 0x10000);
+    for (int i = 0; i < SCOBC_A1_NUM_MISSION_UARTS; i++) {
+        scobc_a1_create_uart(DEVICE(&s->armv7m),
+                             SCOBC_A1_MISSION_UART_BASE + i * 0x10000,
+                             SCOBC_A1_MISSION_UART_IRQ + i,
+                             serial_hd(1 + i));
+    }
     create_unimplemented_device("scobc-a1.i2c1", 0x50060000, 0x10000);
     create_unimplemented_device("scobc-a1.i2c2", 0x50070000, 0x10000);
     create_unimplemented_device("scobc-a1.qspi", 0x50080000, 0x10000);

-- 
2.55.0


