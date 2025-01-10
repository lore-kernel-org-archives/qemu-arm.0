Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp257371njn;
        Fri, 10 Jan 2025 08:04:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVjnljJ/E9xkyVk3amMozKQ86AtPAuxDGpPdHZhuIBtnICHN65nbZVozrb/nwTINcF+uQdnDEhxjNWIFw==@linaro.org
X-Google-Smtp-Source: AGHT+IFrCu49JIdJHLQTS+8Ltn+d+xZwMI/SZQk10VptRTNjFhTouRl9qLbUVFrdbVEZwkuhiqXB
X-Received: by 2002:ad4:5747:0:b0:6d8:accb:5a3d with SMTP id 6a1803df08f44-6df9b28378dmr187501496d6.34.1736525092501;
        Fri, 10 Jan 2025 08:04:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736525092; cv=none;
        d=google.com; s=arc-20240605;
        b=KU+KS+0dEpzh5th31MjN357rOnbU+BaCbpi3kL6vW2w9aVGynMEJxlrYCSbNyA2tld
         wGN5r0d3A12TNqusULRbxDU3GahxrmUQoX7/Qf3beyAXHW/enj6lbOZlh7P3HFL3qbbm
         ztJux6+v4rslssSJQeYDIuWMH42odaVSgcEFDXgGLX+/WHmGpQD6xvy6b+p2YMFSV6Fq
         2AeXPeHS/PmN7N2JXhDi75BkTMZURt2qedVI6/q0sCIj78Sr86Z5cDV4JPtdSmw9wFlM
         MDQsY7hhpRLai9pnoitVyki3hYAMSvbTJmMqKDGexOD55qUKU8urO1PTXLjF0gKhEmNB
         /1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9qvogJW6MPYSZINAUIbPGEHr3cB+ZObTGCx80VbT3Tk=;
        fh=ZgYiCaGIoAftiTQNl2UVKNfw69wd4MOS1zKQZkuvtQI=;
        b=IMkAaJ+1fdCD4LrjVBb/fdLQqXD0wfINsXhsvO+ABHfG6JBD3PD1gOClUSyk1nutks
         necKEbAGKWNUp+9MCRsKDmPQBL+A8pxugJuNOn59RoXaHtGicZwNtWVOh79dMzHA0pSU
         aRmmUODafmglkZFwIWGtJEIyAguz0z7avD6sa1AwWMTwMYgnkiz6wsAyk6nnLVGAfXx6
         7qY5chUlsqH2nNO+hV1+k086z22rYVvswAP8yfkSqlqKyh9mNGSDTcxQISldwbLSp9CY
         BhJEAQwlsrUpI5uXnhWpJMSa5Fhv5aCB6Fu2wIsdFfxUVZ1VDNMNwfFKXW6W6Kv3M5Cm
         j4Qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NnhSJ4EF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfadfa0d66si23281716d6.379.2025.01.10.08.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 08:04:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NnhSJ4EF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWHTn-0007ee-65; Fri, 10 Jan 2025 11:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHT9-0007KB-5e
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:49 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHT2-0004Gn-Dc
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:40 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385df53e559so1768319f8f.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 08:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736524953; x=1737129753; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qvogJW6MPYSZINAUIbPGEHr3cB+ZObTGCx80VbT3Tk=;
 b=NnhSJ4EFig71wywsBS1snCL2T8O6j3sCtHsLAs2zPd44Q/3imGPzQqIUEvyYdwwsty
 snsrffJ54wIkptJn+l2Qp6mY+thQysj6yBDt0o3F7tgd80PnU6PnEUuFh6yo3ZP+0prh
 IAWf9TCHcUGAZpzT2HR3JIMK+OWoDbGlFP5LOdp7WoA/Hmu5ohNnz5wYEoqUy5BJpWp2
 YvIJe4HZ8MHcr1OEf0yjHuGNDXaYKaMMlqi7tOwza4XSjlBaCgRi+9mmgtcoITgbKEW6
 JZGPvBMbdqqwb7xYeTLqnGOwR8MVEHneyVe8ImwPvXcUyiIYRj9Vm5D0j5vp3d0YK+eY
 mvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736524953; x=1737129753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qvogJW6MPYSZINAUIbPGEHr3cB+ZObTGCx80VbT3Tk=;
 b=Nrqxqd8HLBStTXbe8e9a/14skOeb7rxJCLLOoi8nGH5PL6l1vl8RFdYEqVC2gO3aXq
 iUU/eJ6QqqTq+8OWa7f/PenMTq9Bpya15R1LfkKGg0QWuABreAdY4lYYon/1FD3vXDWP
 pJ/V4BLU42OMuIVcJzvNalBwexDAPaW1+KVxKRNYNChtL7sziZwb96URY5Sr2+W6o+2G
 7iCXyhT+3GEdIBSWzRhALa9hrBVeJIwtkN+UQSodtl0w5QpJnh8YmaMwra7P6mbfQNs0
 N7thVLmMlmtht9qjTqwSgizIJ+s+nZHjNEb8/DupBu5lmRvD+ej2fsM6mi18vu8S0f96
 32eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXADkPiBnY9axN65qNaTFq0SKIP2NJifXHsPGBU4umtrAuItNt/VOpm4oEWj5CWtimlKRIU3lGGBA==@nongnu.org
X-Gm-Message-State: AOJu0YwShZIjUjhIo46vOmybcIKq5MrSBC9nJHw9Epz8lc13CccXUHDw
 TP7Q19TBhQpLLXXjEMZOF9KMPs1rW+79uv0Z0186Ft9/mSQ1QvZUhnL5AHvgFt8=
X-Gm-Gg: ASbGncuKtU4ZAgSLjxVD4eAqQ95/S8uPjGXgIxc/zqfCGQtbLIZFEF4PAuLY4kfHOuM
 gsN0Do+eunF7ljzU7CYRJUkuEZgUpSaHDl6sIhIJIyq7YYgetdsnvIy4EK/LwsssvaSgBEcxT8Q
 qihgFfjhF8Ikr8Si5VR6RP9m4vvXDAZnJkYGAg8ceS44g2cFiuhR5YWPuw/iIX8chmgOrzUWezT
 8yTstHdFa0b1e+yK90Y4i+EWXAVmRM4PkBZTUZ5qUkKiIk/bwnXurltUX7wOBFCWbDFT8a5W0XD
 7iVMginI4+boXqWmpy+35zWPvdu3HQk=
X-Received: by 2002:a5d:5f44:0:b0:385:fa33:29ed with SMTP id
 ffacd0b85a97d-38a8730fa63mr9349216f8f.47.1736524949045; 
 Fri, 10 Jan 2025 08:02:29 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66e6sm91520325e9.4.2025.01.10.08.02.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jan 2025 08:02:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/9] hw/arm/stellaris: Use DEVCAP macro to access
 DeviceCapability registers
Date: Fri, 10 Jan 2025 17:02:00 +0100
Message-ID: <20250110160204.74997-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110160204.74997-1-philmd@linaro.org>
References: <20250110160204.74997-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2c2L+ni7JtGW

Add definitions (DCx_periph) for the DeviceCapability bits,
replace direct bitmask checks with the DEV_CAP() macro,
which use the extract/deposit API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index b4c3412c490..64e6797553a 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "qapi/error.h"
 #include "hw/core/split-irq.h"
 #include "hw/sysbus.h"
@@ -54,6 +55,26 @@
 #define NUM_GPTM    4
 #define NUM_I2C     2
 
+/*
+ * See Stellaris Data Sheet chapter 5.2.5 "System Control",
+ * Register 13 .. 17: Device Capabilities 0 .. 4 (DC0 .. DC4).
+ */
+#define DC1_WDT          3
+#define DC1_HIB          6
+#define DC1_MPU          7
+#define DC1_ADC          16
+#define DC1_PWM          20
+#define DC2_UART(n)     (n)
+#define DC2_SSI          4
+#define DC2_QEI(n)      (8 + n)
+#define DC2_I2C(n)      (12 + 2 * n)
+#define DC2_GPTM(n)     (16 + n)
+#define DC2_COMP(n)     (24 + n)
+#define DC4_GPIO(n)     (n)
+#define DC4_EMAC         28
+
+#define DEV_CAP(_dc, _cap) extract32(board->dc##_dc, DC##_dc##_##_cap, 1)
+
 typedef const struct {
     const char *name;
     uint32_t did0;
@@ -1117,7 +1138,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     sysbus_mmio_map(SYS_BUS_DEVICE(ssys_dev), 0, 0x400fe000);
     sysbus_connect_irq(SYS_BUS_DEVICE(ssys_dev), 0, qdev_get_gpio_in(nvic, 28));
 
-    if (board->dc1 & (1 << 16)) {
+    if (DEV_CAP(1, ADC)) {
         dev = sysbus_create_varargs(TYPE_STELLARIS_ADC, 0x40038000,
                                     qdev_get_gpio_in(nvic, 14),
                                     qdev_get_gpio_in(nvic, 15),
@@ -1129,7 +1150,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
         adc = NULL;
     }
     for (i = 0; i < NUM_GPTM; i++) {
-        if (board->dc2 & (0x10000 << i)) {
+        if (DEV_CAP(2, GPTM(i))) {
             SysBusDevice *sbd;
 
             dev = qdev_new(TYPE_STELLARIS_GPTM);
@@ -1146,7 +1167,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
         }
     }
 
-    if (board->dc1 & (1 << 3)) { /* watchdog present */
+    if (DEV_CAP(1, WDT)) {
         dev = qdev_new(TYPE_LUMINARY_WATCHDOG);
         object_property_add_child(soc_container, "wdg", OBJECT(dev));
         qdev_connect_clock_in(dev, "WDOGCLK",
@@ -1163,7 +1184,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
 
 
     for (i = 0; i < NUM_GPIO; i++) {
-        if (board->dc4 & (1 << i)) {
+        if (DEV_CAP(4, GPIO(i))) {
             gpio_dev[i] = sysbus_create_simple("pl061_luminary", gpio_addr[i],
                                                qdev_get_gpio_in(nvic,
                                                                 gpio_irq[i]));
@@ -1174,7 +1195,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
         }
     }
 
-    if (board->dc2 & (1 << 12)) {
+    if (DEV_CAP(2, I2C(0))) {
         dev = sysbus_create_simple(TYPE_STELLARIS_I2C, 0x40020000,
                                    qdev_get_gpio_in(nvic, 8));
         i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
@@ -1184,7 +1205,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     }
 
     for (i = 0; i < NUM_UART; i++) {
-        if (board->dc2 & (1 << i)) {
+        if (DEV_CAP(2, UART(i))) {
             SysBusDevice *sbd;
 
             dev = qdev_new("pl011_luminary");
@@ -1196,7 +1217,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(nvic, uart_irq[i]));
         }
     }
-    if (board->dc2 & (1 << 4)) {
+    if (DEV_CAP(2, SSI)) {
         dev = sysbus_create_simple("pl022", 0x40008000,
                                    qdev_get_gpio_in(nvic, 7));
         if (board->peripherals & BP_OLED_SSI) {
@@ -1305,7 +1326,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             qemu_irq_raise(gpio_out[GPIO_D][0]);
         }
     }
-    if (board->dc4 & (1 << 28)) {
+    if (DEV_CAP(4, EMAC)) {
         DeviceState *enet;
 
         enet = qdev_new("stellaris_enet");
-- 
2.47.1

