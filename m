Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1456378njl;
        Thu, 3 Oct 2024 07:01:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJZdIyLDgFLsJ7P3s0om0Jk/6Mj3kSp2vVhRnqZngwMuE8m2tjYcGBHB3W5B8Jd0aipmnB6VfMK1OtrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEUKjeTDnY5rirj8IpYEtpX8td1mF20UI4dhBday5DROssoL7+WNFudahb1sDEshG81jn8k
X-Received: by 2002:a05:690c:87:b0:6db:b5b2:53c with SMTP id 00721157ae682-6e2a309960cmr70793937b3.32.1727964068562;
        Thu, 03 Oct 2024 07:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727964068; cv=none;
        d=google.com; s=arc-20240605;
        b=R82UK3Qe1PAaO4kRkTw4h3C8qrROVoe79QuwCSuvk6/7s8sTebx13ddEN9P9bXkUx1
         pTG2EesVRRO1NIvEp++PVXKndUusr34xk3tKzy8i7FBvdMHlYdwkbDLwTkabkoQtdI/q
         E3ASipXFeSZo7c3AykrQTAdMCxqvJawFE0mkk+jWsMntaeaI+SeYQF5AbAqcKhhF7zRg
         q7ohCc/7kCLb/RnHFhO0ZU8T1Lsr0QLNk9cwXuSFquKcDm+hk8smp80oMaTart8ijOm5
         0vqptrKG185yJtxcz/ipdfALHLAFUK0PWC5WWESKBHKOpF54R/EAUrBE4ENltMv044K7
         4NLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GbrP9MmrJ0+K+HvI7PXjyGE5YoOWjRR/6vqiaVbTMdM=;
        fh=dLP/YLBjMZxhHfH1sS7Ziu5zNyswdPoi/by3dAcRF0o=;
        b=FxJTOGxWk4aOBhvSlimbQdF7c+akJKjme86P5k73j/9MTKgDp6ZHN5RZYrPniG6PPB
         Q5uJWUmBqt7+GheriFY0diOMgAlIQR2iJq9GZAnwOpHepCnaN9Hbpiw+O8NLngZGxxWP
         d0jW9lv+ArS8+FwMCyXHlRXuCIWNGNeJn5hvRe5Tp7DX7w7bloN+zCqZSax97/d99bEM
         0CjFbq4U49Rk5xxMmaGlMbzjeupZiPqqsAS4LEWGF9Ig/2klnkNOsKVrKfAKhy5+7e3V
         h8NyPWqxzFfgZCElRbUH7WOnFiIu7+ifNBRzHudix52n0L2UZJE45fmh7r0L6830w/jL
         hQMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bda4ATXe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-6e2bd65bf7asi5895137b3.388.2024.10.03.07.01.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 07:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bda4ATXe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swMO8-0004IV-Sm; Thu, 03 Oct 2024 10:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swMNQ-00046w-Hz
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 10:00:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swMNM-0002qs-Ov
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 10:00:18 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-37cc846fbc4so826672f8f.2
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2024 07:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727964014; x=1728568814; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbrP9MmrJ0+K+HvI7PXjyGE5YoOWjRR/6vqiaVbTMdM=;
 b=Bda4ATXeYCa0rgPOiGPzxlfkgvxo5RWqayLxF+4dN1MYBeEMnPTaXyrIi+iBTEIrM5
 4mp4ndwagFO+uA+/Atlw1TDqychVrYNxOfjwpMhaC9aLiShBcIFkv/kY5TCRPEWeHIWn
 f9wofnxAje5SF2IoSeQvOVKs1TpcfkO0LjOabMYwrLi8duzUweknLtDDBj/pZPEmpFog
 yGcwPp6wX84niAoyIxDaDlExID44BBckgSM3FIpJrTZq1D3J02J32/UX/1lZU/avakSi
 IPT/6E3ZUHkzAcabdhrt1E+CWNo2gqO9YEaAC8+GqYHApi92V0WsB8sDY2VFV4M8kjXv
 G1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727964014; x=1728568814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbrP9MmrJ0+K+HvI7PXjyGE5YoOWjRR/6vqiaVbTMdM=;
 b=N4R0SapoglPx+5kCbRCNGFEzTWmIahv19jRm9QDoThsyISYtnQ2HyDQluAcMO1q0ZT
 GtNE6B2eKCEyBNEqlP9Nz0xA3x79gDVBmB8EnuO1OIxOEQT9bVhvUQP93eW9nxVjUatX
 agSuvXcOaylLgYRBB+KnQtzoWLk9I8on5djdaeioaiOaQGj/v4L+kWmRWwy6EPFf31gH
 b09Ktgg8UuivUl2i0VxQAC9VnGYZzVQSAqfrU0pIFQ/stSK2PcObytF1upbadlwETFqe
 q/4u98YuXm1d5UQeZMrXRH2j7jDEPu/0Ln9R2dm0NTBXy1RgnoJTs8AU4z2Unt4jQUDF
 hRdw==
X-Gm-Message-State: AOJu0Yzk+qYDGa3WD6TE30BlWcX66VZMqnoyGnn4XG9qNfwpPJ/f8K2D
 FBbxyjuMFLyPi1BZRHqJzishlq7r2W9NpEzkjn5Zm1Fj67WI088hDdEfe6bAOX0PKRyaLkbeu95
 c
X-Received: by 2002:adf:a2de:0:b0:37c:c5fc:89f4 with SMTP id
 ffacd0b85a97d-37cfba139a9mr4222227f8f.51.1727964013556; 
 Thu, 03 Oct 2024 07:00:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d0822bc38sm1340255f8f.45.2024.10.03.07.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:00:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 2/6] hw/gpio: Remove MAX7310 device
Date: Thu,  3 Oct 2024 15:00:06 +0100
Message-Id: <20241003140010.1653808-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003140010.1653808-1-peter.maydell@linaro.org>
References: <20241003140010.1653808-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: juveMc7VRUQD

The MAX7310 GPIO controller was used only by the XScale-based Zaurus
machine types.  Now they have been removed we can remove this device
model as well.

Because this device is an I2C device, in theory it could be created
by users on the command line for boards with a different I2c
controller, but we don't believe users are doing this -- it would be
impossible on the command line to connect up the GPIO inputs/outputs.
The only example a web search produces for "device max7310" is a user
trying to create this because they didn't realize that there was no
way to manipulate the GPIO lines.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/max7310.c   | 217 --------------------------------------------
 hw/gpio/Kconfig     |   4 -
 hw/gpio/meson.build |   1 -
 3 files changed, 222 deletions(-)
 delete mode 100644 hw/gpio/max7310.c

diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
deleted file mode 100644
index 43a92b8db97..00000000000
--- a/hw/gpio/max7310.c
+++ /dev/null
@@ -1,217 +0,0 @@
-/*
- * MAX7310 8-port GPIO expansion chip.
- *
- * Copyright (c) 2006 Openedhand Ltd.
- * Written by Andrzej Zaborowski <balrog@zabor.org>
- *
- * This file is licensed under GNU GPL.
- */
-
-#include "qemu/osdep.h"
-#include "hw/i2c/i2c.h"
-#include "hw/irq.h"
-#include "migration/vmstate.h"
-#include "qemu/log.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-
-#define TYPE_MAX7310 "max7310"
-OBJECT_DECLARE_SIMPLE_TYPE(MAX7310State, MAX7310)
-
-struct MAX7310State {
-    I2CSlave parent_obj;
-
-    int i2c_command_byte;
-    int len;
-
-    uint8_t level;
-    uint8_t direction;
-    uint8_t polarity;
-    uint8_t status;
-    uint8_t command;
-    qemu_irq handler[8];
-    qemu_irq *gpio_in;
-};
-
-static void max7310_reset(DeviceState *dev)
-{
-    MAX7310State *s = MAX7310(dev);
-
-    s->level &= s->direction;
-    s->direction = 0xff;
-    s->polarity = 0xf0;
-    s->status = 0x01;
-    s->command = 0x00;
-}
-
-static uint8_t max7310_rx(I2CSlave *i2c)
-{
-    MAX7310State *s = MAX7310(i2c);
-
-    switch (s->command) {
-    case 0x00:  /* Input port */
-        return s->level ^ s->polarity;
-
-    case 0x01:  /* Output port */
-        return s->level & ~s->direction;
-
-    case 0x02:  /* Polarity inversion */
-        return s->polarity;
-
-    case 0x03:  /* Configuration */
-        return s->direction;
-
-    case 0x04:  /* Timeout */
-        return s->status;
-
-    case 0xff:  /* Reserved */
-        return 0xff;
-
-    default:
-        qemu_log_mask(LOG_UNIMP, "%s: Unsupported register 0x02%" PRIx8 "\n",
-                      __func__, s->command);
-        break;
-    }
-    return 0xff;
-}
-
-static int max7310_tx(I2CSlave *i2c, uint8_t data)
-{
-    MAX7310State *s = MAX7310(i2c);
-    uint8_t diff;
-    int line;
-
-    if (s->len ++ > 1) {
-#ifdef VERBOSE
-        printf("%s: message too long (%i bytes)\n", __func__, s->len);
-#endif
-        return 1;
-    }
-
-    if (s->i2c_command_byte) {
-        s->command = data;
-        s->i2c_command_byte = 0;
-        return 0;
-    }
-
-    switch (s->command) {
-    case 0x01:  /* Output port */
-        for (diff = (data ^ s->level) & ~s->direction; diff;
-                        diff &= ~(1 << line)) {
-            line = ctz32(diff);
-            if (s->handler[line])
-                qemu_set_irq(s->handler[line], (data >> line) & 1);
-        }
-        s->level = (s->level & s->direction) | (data & ~s->direction);
-        break;
-
-    case 0x02:  /* Polarity inversion */
-        s->polarity = data;
-        break;
-
-    case 0x03:  /* Configuration */
-        s->level &= ~(s->direction ^ data);
-        s->direction = data;
-        break;
-
-    case 0x04:  /* Timeout */
-        s->status = data;
-        break;
-
-    case 0x00:  /* Input port - ignore writes */
-        break;
-    default:
-        qemu_log_mask(LOG_UNIMP, "%s: Unsupported register 0x02%" PRIx8 "\n",
-                      __func__, s->command);
-        return 1;
-    }
-
-    return 0;
-}
-
-static int max7310_event(I2CSlave *i2c, enum i2c_event event)
-{
-    MAX7310State *s = MAX7310(i2c);
-    s->len = 0;
-
-    switch (event) {
-    case I2C_START_SEND:
-        s->i2c_command_byte = 1;
-        break;
-    case I2C_FINISH:
-#ifdef VERBOSE
-        if (s->len == 1)
-            printf("%s: message too short (%i bytes)\n", __func__, s->len);
-#endif
-        break;
-    default:
-        break;
-    }
-
-    return 0;
-}
-
-static const VMStateDescription vmstate_max7310 = {
-    .name = "max7310",
-    .version_id = 0,
-    .minimum_version_id = 0,
-    .fields = (const VMStateField[]) {
-        VMSTATE_INT32(i2c_command_byte, MAX7310State),
-        VMSTATE_INT32(len, MAX7310State),
-        VMSTATE_UINT8(level, MAX7310State),
-        VMSTATE_UINT8(direction, MAX7310State),
-        VMSTATE_UINT8(polarity, MAX7310State),
-        VMSTATE_UINT8(status, MAX7310State),
-        VMSTATE_UINT8(command, MAX7310State),
-        VMSTATE_I2C_SLAVE(parent_obj, MAX7310State),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void max7310_gpio_set(void *opaque, int line, int level)
-{
-    MAX7310State *s = (MAX7310State *) opaque;
-    assert(line >= 0 && line < ARRAY_SIZE(s->handler));
-
-    if (level)
-        s->level |= s->direction & (1 << line);
-    else
-        s->level &= ~(s->direction & (1 << line));
-}
-
-/* MAX7310 is SMBus-compatible (can be used with only SMBus protocols),
- * but also accepts sequences that are not SMBus so return an I2C device.  */
-static void max7310_realize(DeviceState *dev, Error **errp)
-{
-    MAX7310State *s = MAX7310(dev);
-
-    qdev_init_gpio_in(dev, max7310_gpio_set, ARRAY_SIZE(s->handler));
-    qdev_init_gpio_out(dev, s->handler, ARRAY_SIZE(s->handler));
-}
-
-static void max7310_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
-
-    dc->realize = max7310_realize;
-    k->event = max7310_event;
-    k->recv = max7310_rx;
-    k->send = max7310_tx;
-    device_class_set_legacy_reset(dc, max7310_reset);
-    dc->vmsd = &vmstate_max7310;
-}
-
-static const TypeInfo max7310_info = {
-    .name          = TYPE_MAX7310,
-    .parent        = TYPE_I2C_SLAVE,
-    .instance_size = sizeof(MAX7310State),
-    .class_init    = max7310_class_init,
-};
-
-static void max7310_register_types(void)
-{
-    type_register_static(&max7310_info);
-}
-
-type_init(max7310_register_types)
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index 843630d4f5f..c423e10f59f 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -1,7 +1,3 @@
-config MAX7310
-    bool
-    depends on I2C
-
 config PL061
     bool
 
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 089b24802ef..74840619c01 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -1,7 +1,6 @@
 system_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
 system_ss.add(when: 'CONFIG_GPIO_MPC8XXX', if_true: files('mpc8xxx.c'))
 system_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
-system_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
 system_ss.add(when: 'CONFIG_PCA9552', if_true: files('pca9552.c'))
 system_ss.add(when: 'CONFIG_PCA9554', if_true: files('pca9554.c'))
 system_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
-- 
2.34.1

