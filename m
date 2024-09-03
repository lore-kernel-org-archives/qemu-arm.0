Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1499641njf;
        Tue, 3 Sep 2024 09:08:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVp0oQEuc+GCOAywg9OAhTiORF/m8FESziK+l6btkDGXHstaGfw4reazfQZ2Qdtf9PNKHFfvNH0evxPCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEaq/L1RECU47W/SpzpMt+nz0oVDqgSeksG1hA+n4aSoNbK/JnGyRph9AOd0NpTfyYHE9dY
X-Received: by 2002:a05:620a:44c3:b0:79f:433:6e7f with SMTP id af79cd13be357-7a81d67f6c1mr1457721385a.21.1725379689113;
        Tue, 03 Sep 2024 09:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379689; cv=none;
        d=google.com; s=arc-20160816;
        b=WiXFONS79zQc4JqiVyLfoRqX1FKvaXNtGXwXr2vRrHlKWd4P1gIMTkR33IOZxNziZy
         4uoCbS8tklVlNI2ZuZwKyQjTy8OMXb04+2obZ8ji+3qbYlaiLgwxHtsp4MCvaFvzQrEJ
         VFGKJg02o6IWKAS1bESshobqL6AyxoqanQ2A+9eubm0UVRgayN9s5EPCSow96kg8r+gu
         DsNjvr+adumJaDpVmczkWlmsusdXhyuNyWJ9Zj9J6ggxL07B2UmlQcWSLViahYmoxyRV
         yaUxf6n3RxMnk06rlUb6+JJNnGkfrZP6Nvn33MKQ4Q45KxhU/tRJHF6wFvxp8qVD//rJ
         obVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=REWeNOczEUu8BH+jrYSxe0zGnjLj2cnjciq59tS1KWA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=M/kRkMIvQjrXiNGt72ULhOwrp/9gVbKFGD5MxkwiXUNT7GMbVd9e2pcDkvpQDaL8K3
         ZSq6nlsvuILB9tW04pPIfFM0VAVQyaYiBOMPR057cgX4HYMfYHTC4oZqDdqEbUaA0lRn
         Aa3c0yeadgnOI7RI5xYk/51R4S6gyfVyx+CnETrbZQR02w+2ABlzBp3HkEtEwFWknRfe
         SPlUeWsL0/scdVb9E7onbuYk+PkSXCN4UyG4wWGf0xkjXvviRNvvGQBgBZ3/cGFbo3Uz
         JT6z4HMz8Q2jFttOXSW8i7BHwmpBZN9ykpyxYUW9vTNVdSou4Mm1xo32uSzOpefhY4e+
         jK2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vYsoeN2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a97802b573si273254085a.47.2024.09.03.09.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vYsoeN2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slW4X-0004aw-Tg; Tue, 03 Sep 2024 12:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW4W-0004V6-Ej
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:08:00 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW4S-0002eU-QH
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:08:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso45512305e9.0
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379675; x=1725984475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=REWeNOczEUu8BH+jrYSxe0zGnjLj2cnjciq59tS1KWA=;
 b=vYsoeN2d+IuTTJVeK5/Oob8Zmq4hzj7I3glv83e24eQ5AkT1lc9wNjz6FrypzTqb6+
 E/SyFMdBJ3D6IpUeF9ahMTHEmtRzgq36yfIAuT0KKIbUbwiZkva3LKSUlNnAQVO6AL4z
 /qAfYDXXk509cnNqa7GJHEbiwkCRFz3uGDFYNqoZbLJ7BevDhUpayksZTwkhGmImxlbU
 6k844XmLdFHR0OeS4yU0rpOYtm1krlGBLBVIcX9daP8DKID6Nva3lvCgkxHXT1fecbFB
 I/4Xr/81aXEI/BlgAVJ9MBTzgDPVZnL3QFMy6ZNV7B92hY3t1qpbfuc657Y6B+3gToCZ
 pJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379675; x=1725984475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=REWeNOczEUu8BH+jrYSxe0zGnjLj2cnjciq59tS1KWA=;
 b=uQ0D+XFtmemB9yhJ2JlWtz0ZISN7MVWtUmyZbUKfAZ6bGHSMV37XyY8efPtMMgU2r9
 CXD3qpCjK7E43lehxTOkLiB+EVPSDNDX0TtskpfjbgP8GLDGJTDxoPUw0srfVHFfHxhO
 BrPbbm3+AdyHKcA+ylFyhy3G5okOsgU861mQHsS3TYBrqBCsQI+GuJ5FCBO2XTDgyOmG
 VaaEFF3hvw6lMXuLNdB4TW8mKOR5Inj/IWzehRk2NCZI+YZ/uN32seyAS/1SIU3mpGbf
 q5tspQZtLlUgo6JR3XhprdA2zrew0Z+eRvpFT1ilnMvg0of55nMTdv+WM4hXxvAiNeG1
 QwEQ==
X-Gm-Message-State: AOJu0Yy2HQT6jMYX/V+wcx28poy40HppmzYWo82Z16JMM8gtARONOTJt
 Tpd/vlEotDOQRzqmRaqKe6PaIPE5DK9iZ3lUl2wRTKklGdRCIflChxLIcl+ZFoK5PNNEFNxCpWS
 F
X-Received: by 2002:a05:600c:46c6:b0:426:4978:65f0 with SMTP id
 5b1f17b1804b1-42c82f56727mr57670035e9.18.1725379675077; 
 Tue, 03 Sep 2024 09:07:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:07:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 03/53] hw/adc: Remove MAX111X device
Date: Tue,  3 Sep 2024 17:07:01 +0100
Message-Id: <20240903160751.4100218-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: lpNzoxWwTyyF

The MAX111X ADC device was used only by the XScale-based
Zaurus machine types. Now they have all been removed, we can
drop this device model too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS              |   2 -
 include/hw/adc/max111x.h |  56 ----------
 hw/adc/max111x.c         | 236 ---------------------------------------
 hw/adc/Kconfig           |   3 -
 hw/adc/meson.build       |   1 -
 5 files changed, 298 deletions(-)
 delete mode 100644 include/hw/adc/max111x.h
 delete mode 100644 hw/adc/max111x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f00c7a3427..7873350f6ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -930,8 +930,6 @@ F: hw/display/tc6393xb.c
 F: hw/gpio/max7310.c
 F: hw/gpio/zaurus.c
 F: hw/misc/mst_fpga.c
-F: hw/adc/max111x.c
-F: include/hw/adc/max111x.h
 F: include/hw/arm/pxa.h
 F: include/hw/arm/sharpsl.h
 F: include/hw/display/tc6393xb.h
diff --git a/include/hw/adc/max111x.h b/include/hw/adc/max111x.h
deleted file mode 100644
index beff59c815d..00000000000
--- a/include/hw/adc/max111x.h
+++ /dev/null
@@ -1,56 +0,0 @@
-/*
- * Maxim MAX1110/1111 ADC chip emulation.
- *
- * Copyright (c) 2006 Openedhand Ltd.
- * Written by Andrzej Zaborowski <balrog@zabor.org>
- *
- * This code is licensed under the GNU GPLv2.
- *
- * Contributions after 2012-01-13 are licensed under the terms of the
- * GNU GPL, version 2 or (at your option) any later version.
- */
-
-#ifndef HW_MISC_MAX111X_H
-#define HW_MISC_MAX111X_H
-
-#include "hw/ssi/ssi.h"
-#include "qom/object.h"
-
-/*
- * This is a model of the Maxim MAX1110/1111 ADC chip, which for QEMU
- * is an SSI slave device. It has either 4 (max1110) or 8 (max1111)
- * 8-bit ADC channels.
- *
- * QEMU interface:
- *  + GPIO inputs 0..3 (for max1110) or 0..7 (for max1111): set the value
- *    of each ADC input, as an unsigned 8-bit value
- *  + GPIO output 0: interrupt line
- *  + Properties "input0" to "input3" (max1110) or "input0" to "input7"
- *    (max1111): initial reset values for ADC inputs.
- *
- * Known bugs:
- *  + the interrupt line is not correctly implemented, and will never
- *    be lowered once it has been asserted.
- */
-struct MAX111xState {
-    SSIPeripheral parent_obj;
-
-    qemu_irq interrupt;
-    /* Values of inputs at system reset (settable by QOM property) */
-    uint8_t reset_input[8];
-
-    uint8_t tb1, rb2, rb3;
-    int cycle;
-
-    uint8_t input[8];
-    int inputs, com;
-};
-
-#define TYPE_MAX_111X "max111x"
-
-OBJECT_DECLARE_SIMPLE_TYPE(MAX111xState, MAX_111X)
-
-#define TYPE_MAX_1110 "max1110"
-#define TYPE_MAX_1111 "max1111"
-
-#endif
diff --git a/hw/adc/max111x.c b/hw/adc/max111x.c
deleted file mode 100644
index 957d177e1ce..00000000000
--- a/hw/adc/max111x.c
+++ /dev/null
@@ -1,236 +0,0 @@
-/*
- * Maxim MAX1110/1111 ADC chip emulation.
- *
- * Copyright (c) 2006 Openedhand Ltd.
- * Written by Andrzej Zaborowski <balrog@zabor.org>
- *
- * This code is licensed under the GNU GPLv2.
- *
- * Contributions after 2012-01-13 are licensed under the terms of the
- * GNU GPL, version 2 or (at your option) any later version.
- */
-
-#include "qemu/osdep.h"
-#include "hw/adc/max111x.h"
-#include "hw/irq.h"
-#include "migration/vmstate.h"
-#include "qemu/module.h"
-#include "hw/qdev-properties.h"
-
-/* Control-byte bitfields */
-#define CB_PD0		(1 << 0)
-#define CB_PD1		(1 << 1)
-#define CB_SGL		(1 << 2)
-#define CB_UNI		(1 << 3)
-#define CB_SEL0		(1 << 4)
-#define CB_SEL1		(1 << 5)
-#define CB_SEL2		(1 << 6)
-#define CB_START	(1 << 7)
-
-#define CHANNEL_NUM(v, b0, b1, b2)	\
-                        ((((v) >> (2 + (b0))) & 4) |	\
-                         (((v) >> (3 + (b1))) & 2) |	\
-                         (((v) >> (4 + (b2))) & 1))
-
-static uint32_t max111x_read(MAX111xState *s)
-{
-    if (!s->tb1)
-        return 0;
-
-    switch (s->cycle ++) {
-    case 1:
-        return s->rb2;
-    case 2:
-        return s->rb3;
-    }
-
-    return 0;
-}
-
-/* Interpret a control-byte */
-static void max111x_write(MAX111xState *s, uint32_t value)
-{
-    int measure, chan;
-
-    /* Ignore the value if START bit is zero */
-    if (!(value & CB_START))
-        return;
-
-    s->cycle = 0;
-
-    if (!(value & CB_PD1)) {
-        s->tb1 = 0;
-        return;
-    }
-
-    s->tb1 = value;
-
-    if (s->inputs == 8)
-        chan = CHANNEL_NUM(value, 1, 0, 2);
-    else
-        chan = CHANNEL_NUM(value & ~CB_SEL0, 0, 1, 2);
-
-    if (value & CB_SGL)
-        measure = s->input[chan] - s->com;
-    else
-        measure = s->input[chan] - s->input[chan ^ 1];
-
-    if (!(value & CB_UNI))
-        measure ^= 0x80;
-
-    s->rb2 = (measure >> 2) & 0x3f;
-    s->rb3 = (measure << 6) & 0xc0;
-
-    /* FIXME: When should the IRQ be lowered?  */
-    qemu_irq_raise(s->interrupt);
-}
-
-static uint32_t max111x_transfer(SSIPeripheral *dev, uint32_t value)
-{
-    MAX111xState *s = MAX_111X(dev);
-    max111x_write(s, value);
-    return max111x_read(s);
-}
-
-static const VMStateDescription vmstate_max111x = {
-    .name = "max111x",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (const VMStateField[]) {
-        VMSTATE_SSI_PERIPHERAL(parent_obj, MAX111xState),
-        VMSTATE_UINT8(tb1, MAX111xState),
-        VMSTATE_UINT8(rb2, MAX111xState),
-        VMSTATE_UINT8(rb3, MAX111xState),
-        VMSTATE_INT32_EQUAL(inputs, MAX111xState, NULL),
-        VMSTATE_INT32(com, MAX111xState),
-        VMSTATE_ARRAY_INT32_UNSAFE(input, MAX111xState, inputs,
-                                   vmstate_info_uint8, uint8_t),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void max111x_input_set(void *opaque, int line, int value)
-{
-    MAX111xState *s = MAX_111X(opaque);
-
-    assert(line >= 0 && line < s->inputs);
-    s->input[line] = value;
-}
-
-static int max111x_init(SSIPeripheral *d, int inputs)
-{
-    DeviceState *dev = DEVICE(d);
-    MAX111xState *s = MAX_111X(dev);
-
-    qdev_init_gpio_out(dev, &s->interrupt, 1);
-    qdev_init_gpio_in(dev, max111x_input_set, inputs);
-
-    s->inputs = inputs;
-
-    return 0;
-}
-
-static void max1110_realize(SSIPeripheral *dev, Error **errp)
-{
-    max111x_init(dev, 8);
-}
-
-static void max1111_realize(SSIPeripheral *dev, Error **errp)
-{
-    max111x_init(dev, 4);
-}
-
-static void max111x_reset(DeviceState *dev)
-{
-    MAX111xState *s = MAX_111X(dev);
-    int i;
-
-    for (i = 0; i < s->inputs; i++) {
-        s->input[i] = s->reset_input[i];
-    }
-    s->com = 0;
-    s->tb1 = 0;
-    s->rb2 = 0;
-    s->rb3 = 0;
-    s->cycle = 0;
-}
-
-static Property max1110_properties[] = {
-    /* Reset values for ADC inputs */
-    DEFINE_PROP_UINT8("input0", MAX111xState, reset_input[0], 0xf0),
-    DEFINE_PROP_UINT8("input1", MAX111xState, reset_input[1], 0xe0),
-    DEFINE_PROP_UINT8("input2", MAX111xState, reset_input[2], 0xd0),
-    DEFINE_PROP_UINT8("input3", MAX111xState, reset_input[3], 0xc0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static Property max1111_properties[] = {
-    /* Reset values for ADC inputs */
-    DEFINE_PROP_UINT8("input0", MAX111xState, reset_input[0], 0xf0),
-    DEFINE_PROP_UINT8("input1", MAX111xState, reset_input[1], 0xe0),
-    DEFINE_PROP_UINT8("input2", MAX111xState, reset_input[2], 0xd0),
-    DEFINE_PROP_UINT8("input3", MAX111xState, reset_input[3], 0xc0),
-    DEFINE_PROP_UINT8("input4", MAX111xState, reset_input[4], 0xb0),
-    DEFINE_PROP_UINT8("input5", MAX111xState, reset_input[5], 0xa0),
-    DEFINE_PROP_UINT8("input6", MAX111xState, reset_input[6], 0x90),
-    DEFINE_PROP_UINT8("input7", MAX111xState, reset_input[7], 0x80),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void max111x_class_init(ObjectClass *klass, void *data)
-{
-    SSIPeripheralClass *k = SSI_PERIPHERAL_CLASS(klass);
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    k->transfer = max111x_transfer;
-    dc->reset = max111x_reset;
-    dc->vmsd = &vmstate_max111x;
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-}
-
-static const TypeInfo max111x_info = {
-    .name          = TYPE_MAX_111X,
-    .parent        = TYPE_SSI_PERIPHERAL,
-    .instance_size = sizeof(MAX111xState),
-    .class_init    = max111x_class_init,
-    .abstract      = true,
-};
-
-static void max1110_class_init(ObjectClass *klass, void *data)
-{
-    SSIPeripheralClass *k = SSI_PERIPHERAL_CLASS(klass);
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    k->realize = max1110_realize;
-    device_class_set_props(dc, max1110_properties);
-}
-
-static const TypeInfo max1110_info = {
-    .name          = TYPE_MAX_1110,
-    .parent        = TYPE_MAX_111X,
-    .class_init    = max1110_class_init,
-};
-
-static void max1111_class_init(ObjectClass *klass, void *data)
-{
-    SSIPeripheralClass *k = SSI_PERIPHERAL_CLASS(klass);
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    k->realize = max1111_realize;
-    device_class_set_props(dc, max1111_properties);
-}
-
-static const TypeInfo max1111_info = {
-    .name          = TYPE_MAX_1111,
-    .parent        = TYPE_MAX_111X,
-    .class_init    = max1111_class_init,
-};
-
-static void max111x_register_types(void)
-{
-    type_register_static(&max111x_info);
-    type_register_static(&max1110_info);
-    type_register_static(&max1111_info);
-}
-
-type_init(max111x_register_types)
diff --git a/hw/adc/Kconfig b/hw/adc/Kconfig
index a825bd3d343..25d2229fb83 100644
--- a/hw/adc/Kconfig
+++ b/hw/adc/Kconfig
@@ -1,5 +1,2 @@
 config STM32F2XX_ADC
     bool
-
-config MAX111X
-    bool
diff --git a/hw/adc/meson.build b/hw/adc/meson.build
index a4f85b7d468..7f7acc16196 100644
--- a/hw/adc/meson.build
+++ b/hw/adc/meson.build
@@ -2,4 +2,3 @@ system_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_adc.c'))
 system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_adc.c'))
 system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
 system_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq-xadc.c'))
-system_ss.add(when: 'CONFIG_MAX111X', if_true: files('max111x.c'))
-- 
2.34.1

