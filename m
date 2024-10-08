Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2289924njb;
        Mon, 7 Oct 2024 18:23:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVB3WyEg+BoqmXQBA8JwmENm8xxyRDuao3Geo7JwPMqEw4jvFRZ6y/XInMHU/Xz0iwnulhY6ZCcOsw3yg==@linaro.org
X-Google-Smtp-Source: AGHT+IHJ7m8bX+qrEYEDyeQ0CP9w+vnTlFJz6yDCzlzuhlkK4KIPv8onDgbPpsrA9mjN33Vv7yai
X-Received: by 2002:a05:6214:5a08:b0:6cb:39f0:e5a5 with SMTP id 6a1803df08f44-6cb9a4636c9mr170503126d6.45.1728350636711;
        Mon, 07 Oct 2024 18:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350636; cv=none;
        d=google.com; s=arc-20240605;
        b=T92OvxV0Jh/2vR6FZbUj2pz2EJlhOYx9uWiUewhPSsSP9KLIGR81sU+Aa9CuPb1HX+
         /pBnbWEfl8ia70zmwzU7E8ZBocUEm2EQ+foGgorUIDWw9IGXixNJJe9vOGx1+1UrWjIG
         cwvOUrZGb/n75KnXivcDOjTUgpwj52pnK9MBHImVIxH5U6VjTZEGSDxP7dzODwyoWnuT
         Jg7zTtfefsDU5dmOysZGKzjDiQobQm6jTpsNe55znBCNgj90r6VivaJh1ZNrDKmkT5Au
         ijxuQGVCZjvV+R6QxodLkSn9f47ScZ/+3kacBMhey2FsiUtBC7eDVlXa7DqOkuXFbv9t
         WrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=YKQ9trFugufZOwGY7NmDfogxKbP5q2hRcs5m3sq43O4=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=Eti2sQk+qMg1jw6Zh5yHaOW7FaKEFgA7QTfkML/ot5G1CJYF3eA47we0Oa/2+TB6qP
         pJbAjLZ/aSYThulNmiSpI838n+jloNMtxhox82oZtpBQNgXUpZ2unP6RzUKogQpTC5Xm
         5mOpZlDsoBrAysTSo3LHccl83VttxDGREzWbgaI8Yf9T2N+g38UfM5h4oRWBszkOAEKB
         GHFIBWuAhASICfNTvTqSZovRAKxshHQ+598Qrdtvdzf6/XuYpkmg3Fy9sXnZW59FRsBX
         RySmsLKdWBmSopt2XDYs40XO2LFuoEjZjvXI6KpTUnYoKGYFcFPmkRoevQehz6Srjl4m
         Bibw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=F3C+IC6e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbbf08cb68si1783406d6.614.2024.10.07.18.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=F3C+IC6e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sxyuP-0006Mi-3e; Mon, 07 Oct 2024 21:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3pYgEZwUKCgg1i3qxowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--tavip.bounces.google.com>)
 id 1sxyt1-0008WK-H9
 for qemu-devel@nongnu.org; Mon, 07 Oct 2024 21:19:39 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3pYgEZwUKCgg1i3qxowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--tavip.bounces.google.com>)
 id 1sxysz-0000Fg-SG
 for qemu-devel@nongnu.org; Mon, 07 Oct 2024 21:19:39 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-7e9a3e3ec4fso3887702a12.2
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2024 18:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350376; x=1728955176; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=YKQ9trFugufZOwGY7NmDfogxKbP5q2hRcs5m3sq43O4=;
 b=F3C+IC6eC4epdm1kGJmbzRUBQVciVWYyA6WR++rji0yQXHhKvTj8/YBSgjztwcIfm1
 xIIsNyU50ibZzVecbd4jPj4RXIdVWQXe8A0ouXkbWVvDxoI6dP8kYjF5HaVd2bMiY43I
 O+y+XApvJMW3iCZ9XmhfHFrlySewGLHT4NQ6z+TXkZrtjZ/beakGCvKYgCBYsjcSm2Fo
 3wzesY3r5pavjGusJMRONqs8RevX99bWte05zFSWdB9takPn1q16Ys1fbrC8GxTRzxsM
 I/ckidQqFPOn5DH7KxCqXwKXx/kHoZ2XDjOvVKZiwLsVZfAEDpGZa1x9wA1iTp/cYhTy
 FKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350376; x=1728955176;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YKQ9trFugufZOwGY7NmDfogxKbP5q2hRcs5m3sq43O4=;
 b=Qh0vw1tZROxgVlD5uY5tUqG9NdnvH+ovBoeDACBMo9tzCeVjBfuQC5ITntXa5RKe14
 2TqIBwSRlafcx99MhJQR3/P+n3gEIN6VtvA/iFFp3+cprp8MeXZi/UI9MLQilBOrGC35
 ONSCdxUX/VrhOtlpP6YExucE77ScgKg72H8LppbaclUvgv8fMMXT6yYbTeytMwAyqXCI
 s1nOXD+ShbtWaEvjHo6wXm/b7vG2IbqGiKj4K2Zo3ViVikK2rGrLKoF8XppEcmfWFzoT
 xwGoJIU5DXBTY55wOa2h+xZvDvW5R5vYeJmGA1gpDAQullcVuob0yLISyGX8j0rCqxbC
 sIgg==
X-Gm-Message-State: AOJu0YyDWlC7OtiU1+GXckA9GwQSDNSldUC84IDNMPSPKfndgeYEv8xF
 SHVAkkDnh2RdT/hh4RVKIHKt/veE0KG6eQ311tcIN0+6moLUBeO44cT5ajWlVUP7PWLroqr/WIT
 a1MjFjxcB4YvMrQn91EsdvuQDbwWYTdIita/xYoQIZLAJmzTy4rzMjqMmfnNEdikrH4Xf6MD52B
 +AAHktWwFIQtGmmNVm7igKitlE/A==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:90a:8a8c:b0:2c9:7616:dec5
 with SMTP id
 98e67ed59e1d1-2e1e620b95fmr18689a91.2.1728350373992; Mon, 07 Oct 2024
 18:19:33 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:48 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-23-tavip@google.com>
Subject: [PATCH v2 22/25] hw/misc: add spi-tester
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3pYgEZwUKCgg1i3qxowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--tavip.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qV2RFRrZxzEa

Add a simple SPI peripheral that echoes back received data. Useful for
testing SPI controllers.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/hw/misc/spi_tester.h | 32 +++++++++++++++++
 hw/misc/spi_tester.c         | 67 ++++++++++++++++++++++++++++++++++++
 hw/misc/Kconfig              |  5 +++
 hw/misc/meson.build          |  1 +
 4 files changed, 105 insertions(+)
 create mode 100644 include/hw/misc/spi_tester.h
 create mode 100644 hw/misc/spi_tester.c

diff --git a/include/hw/misc/spi_tester.h b/include/hw/misc/spi_tester.h
new file mode 100644
index 0000000000..8935f3f1af
--- /dev/null
+++ b/include/hw/misc/spi_tester.h
@@ -0,0 +1,32 @@
+/*
+ * Simple SPI peripheral device used for SPI controller testing.
+ *
+ * Copyright (c) 2024 Google LLC.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_SPI_TESTER_H
+#define HW_SPI_TESTER_H
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/bswap.h"
+#include "hw/irq.h"
+#include "hw/ssi/ssi.h"
+#include "qemu/timer.h"
+#include "hw/qdev-properties.h"
+
+#define TYPE_SPI_TESTER "spi-tester"
+#define SPI_TESTER(obj) OBJECT_CHECK(SpiTesterState, (obj), TYPE_SPI_TESTER)
+
+typedef struct {
+    SSIPeripheral ssidev;
+    bool cs;
+} SpiTesterState;
+
+#endif /* HW_SPI_TESTER_H */
diff --git a/hw/misc/spi_tester.c b/hw/misc/spi_tester.c
new file mode 100644
index 0000000000..2793ce52dc
--- /dev/null
+++ b/hw/misc/spi_tester.c
@@ -0,0 +1,67 @@
+/*
+ * Simple SPI peripheral echo device used for SPI controller testing.
+ *
+ * Copyright (c) 2024 Google LLC.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "migration/vmstate.h"
+#include "hw/misc/spi_tester.h"
+
+static uint32_t spi_tester_transfer(SSIPeripheral *dev, uint32_t value)
+{
+    SpiTesterState *s = SPI_TESTER(dev);
+
+    if (s->cs) {
+        return 0;
+    }
+
+    return value;
+}
+
+static int spi_tester_set_cs(SSIPeripheral *dev, bool select)
+{
+    SpiTesterState *s = SPI_TESTER(dev);
+
+    s->cs = select;
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_spi_tester = {
+    .name = "spi-tester",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_SSI_PERIPHERAL(ssidev, SpiTesterState),
+        VMSTATE_BOOL(cs, SpiTesterState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void spi_tester_class_init(ObjectClass *klass, void *data)
+{
+    SSIPeripheralClass *k = SSI_PERIPHERAL_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_spi_tester;
+    k->transfer    = spi_tester_transfer;
+    k->set_cs      = spi_tester_set_cs;
+    k->cs_polarity = SSI_CS_LOW;
+}
+
+static const TypeInfo spi_tester_types[] = {
+    {
+        .name          = TYPE_SPI_TESTER,
+        .parent        = TYPE_SSI_PERIPHERAL,
+        .instance_size = sizeof(SpiTesterState),
+        .class_init    = spi_tester_class_init,
+    },
+};
+
+DEFINE_TYPES(spi_tester_types);
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 3e93c12c8e..484ee3149f 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -218,6 +218,11 @@ config I2C_TESTER
     default y if TEST_DEVICES
     depends on I2C
 
+config SPI_TESTER
+    bool
+    default y if TEST_DEVICES
+    depends on SSI
+
 config FLEXCOMM
     bool
     select I2C
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index cd29db37d7..0cece9a964 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -153,6 +153,7 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
 
 system_ss.add(when: 'CONFIG_I2C_TESTER', if_true: files('i2c_tester.c'))
+system_ss.add(when: 'CONFIG_SPI_TESTER', if_true: files('spi_tester.c'))
 
 system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
 system_ss.add(when: 'CONFIG_RT500_CLKCTL', if_true: files('rt500_clkctl0.c', 'rt500_clkctl1.c'))
-- 
2.47.0.rc0.187.ge670bccf7e-goog

