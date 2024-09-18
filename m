Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp978046njg;
        Wed, 18 Sep 2024 12:23:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX27br1nbOyIoDhYhSc9ZUH43hzeWsrXRHwG53lHzjZ43bt997kMXGeJD3WFB4iSFNUsyNg32SRi5LTzg==@linaro.org
X-Google-Smtp-Source: AGHT+IFIgEeck63g6B6PnrD5X3Rv1G6gHg3m8+aTHk4HKbKq9BWyqKNulC3/Ynudq7qa7k9e/VJp
X-Received: by 2002:a05:620a:28d0:b0:7a1:62ad:9d89 with SMTP id af79cd13be357-7a9e5f9c47cmr3687434985a.64.1726687436908;
        Wed, 18 Sep 2024 12:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687436; cv=none;
        d=google.com; s=arc-20240605;
        b=J9QTIQEtuq/BxE812CdT2NRrhGYKy6eAnSxd8QqOEmThEETzgkKIrOfvuIk1PryC7m
         3QsABvLgKRSEViVcY6Wo+eUwhFoCT7p2uIkZj76ErJ+G6xM5qHbmw1Q7NKL3b2sM/Yqq
         CYrKoC6M+Ccue5L9xc6ESDmMFdQw245Xhq8tGqBIucsNfgRgLg+w3U/PKby3Yvxk2/A9
         3s/7xSDddtbjjpyEhw5pGbt8pnvO/sSA9cs0PyLwo8cOmjIefuz2sLIW+yAk+xZn9bSO
         4MdZQTMbQu1kJawgEMQ/L3zDx6FiS9D9aikGRTBS7JmEevf8grIcotwVDR/wPgNWG8L+
         Egtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=mcht1UrN4o7a748za6EPwH1dmZHR+9K1RZ6hCAmN+lI=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=T9SdxGNOsJRz2gfZRUWIqNCkVCqxD6dAtIicGhPgf5r0fFtDNygx4+pfkbFnpzQwnD
         8EGrTO+7XaF/R8JgVTCfIrK03tzW39ii0jBvM+BJPU0ZTbQ6vuY5hCPpCkWBNM9O8KCV
         l02DV5ihTbeb/zc4zwv+0jS/Z2Mhu4ms3RXyUwYIQ5YwPvGCKkH3om2OeLVV65Mrl+rD
         6ajxGjK3dxs4pm020Wx4dTSjTjvfqxLXvUttovgFs+Y/bk0kHG9Giu6fqTOLOwufFsUs
         l1lv4vnFwrDfq5+K/h5NSkC8ypkOfKD5SduQKkxlgWUzb0SUVdmbxqpwep1fKcAHWSpi
         dB8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PcbMY0b3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acb08f5d8bsi9626685a.580.2024.09.18.12.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PcbMY0b3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0H9-0006JR-Kq; Wed, 18 Sep 2024 15:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3uSjrZgUKCPQpWrelckkcha.Ykimaiq-Wnijkjcjq.knc@flex--tavip.bounces.google.com>)
 id 1sr0H7-0006Bu-Sr
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:42 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3uSjrZgUKCPQpWrelckkcha.Ykimaiq-Wnijkjcjq.knc@flex--tavip.bounces.google.com>)
 id 1sr0H6-0007Qn-40
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:41 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-5e4df21f22dso84118a12.0
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687418; x=1727292218; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mcht1UrN4o7a748za6EPwH1dmZHR+9K1RZ6hCAmN+lI=;
 b=PcbMY0b3oWLmzpHgJGAXjzl94AReM7H3L0uh15kqKZbuXB8D9mH/qsPrkYBaSc3lvp
 I82VYiTbPSHjtZ/eoAKo/ImoER64myZC8FVoDSv/BxoEkir9Lq95KX5s/UdfQDIe4kHg
 vwgTV9xEDRUt8I8RL4VTdK9ygSCs010iSkk2tbQBluXY5eBSxMIbyKWl8jPDYhvu/pvi
 VNB3DObxpQ914MmgiHzkNR1Lbd7LrGeb7WsLm297WB1HBuOg4TPJiq2LwxKnrSheBMbF
 A04E3xq/DxOOEeowxMJ5jvKD1J4AucMsldqDTOW1p8oQjEssFlOZnUACwxyBRaXIaBD2
 IJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687418; x=1727292218;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mcht1UrN4o7a748za6EPwH1dmZHR+9K1RZ6hCAmN+lI=;
 b=Ro9MFF5TrflqfjgFZh++XbXlXukkJSS+OeCw7bo8XuxIcZ/Yv4ktBtaURGMqdRU1DT
 HXyWj+/do2Igj6H9LluHOZgvQJ0XRXZomQ0kPPI9t4IyszUEReem5J1Fcfvcb07uPlRV
 iywGhx9AbX3uFCdYbFphFi6K5ZSa0cpiQfhJ3oz1vMYtfFdZj8jG7M54CoYh+w//M9oJ
 u6HC/4TkooWtVGsppVgHn4rfV5GiozBLvbIs4SLJooPomVYBpn+Rq7XIlQLiBv843HpK
 EJAnseAOQaP8oNSEGJajSfyXtpcqTsRvUeSa6GeXJt78jmnMe7j2G743aRcwetKkSIjs
 fZDA==
X-Gm-Message-State: AOJu0Yw9rSFwl7Je28G/nR4iRalLCEUohPlG54Q3cA3DN1ZhSpTNEzqp
 dwvIEFzmbOhIFY0GKdGCBQq8sI9+XK9DJ/W1j/Soa5S9UYvC2eEdUoqIqLviVwamaLYOk12FXw=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:e204:b0:1fb:1658:926 with
 SMTP id
 d9443c01a7336-208cc3b9e48mr3785ad.6.1726687417742; Wed, 18 Sep 2024 12:23:37
 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:50 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-23-tavip@google.com>
Subject: [PATCH 22/25] hw/misc: add spi-tester
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3uSjrZgUKCPQpWrelckkcha.Ykimaiq-Wnijkjcjq.knc@flex--tavip.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: cflQyXEmcJth

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
index 4f22231fa3..413171f379 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -159,6 +159,7 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
 
 system_ss.add(when: 'CONFIG_I2C_TESTER', if_true: files('i2c_tester.c'))
+system_ss.add(when: 'CONFIG_SPI_TESTER', if_true: files('spi_tester.c'))
 
 system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
 system_ss.add(when: 'CONFIG_RT500_CLKCTL', if_true: files('rt500_clkctl0.c', 'rt500_clkctl1.c'))
-- 
2.46.0.662.g92d0881bb0-goog

