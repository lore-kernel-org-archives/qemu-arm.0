Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp20385nji;
        Mon, 26 Aug 2024 23:52:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJbXatgzgqCQnkRuq7hRkrMFdc908N0EB5dJo5WBX47SSH9jzuPZ5mxE9wTpzLmkDhCF3o0oafykJpSg==@linaro.org
X-Google-Smtp-Source: AGHT+IH4KrBLU4INZzElcBpb1xpa1RCgrwZ3Qot4+eASTCqGOF0xpvqwHVj12uzTgtWa20LIw+uH
X-Received: by 2002:a05:622a:53c4:b0:450:9:a427 with SMTP id d75a77b69052e-45660929a8emr17684291cf.48.1724741532166;
        Mon, 26 Aug 2024 23:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724741532; cv=none;
        d=google.com; s=arc-20160816;
        b=ItuMcx6EMa4gGZkBkJO8Epm5qmgxp5eoWWU/k/c8G1bLk7IUIY8A8bKgCrn4vcafEu
         8uGeFZsWAm4+RKpvfFrJxG7wJUau3jhHRnPIjPfVYvvmpp2zMtKJmKy7i8xRM7/ohO1w
         nEXjZZR8IWax7YKpouOuqF3R86G0uheevDFctvr7aBUkY9SgzFOOhhD4CnKrwxATMQZ9
         WDBd1hhkvPnloJEsEMi99GbXSyq7Yz54EJU+9XkE6khkG8r4uHKh+NvzDddOC9zq18eG
         x6gNPJdxeGufAkQeH/iVCgjfaj+gSakl9YTcroIbZIOXnUH2P+JP8ip+GjMaeBNQuw8H
         F2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=X2yHlfFCVO0YfF3xgHCRZ6c8oJqo6hQZyjUxPy9WUWU=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=UzuCHvhfUg/TS8um+zsJt3mY6LkAWknKCgq3YNdThCjCRR+ux8lwe6kBhaRMzEUedW
         1E6q0EZS9DakCWQKLjeo1Ct+PlLid9S3D8L6y3M6SZGd7FvsyAdp/pzPenWJBP7bmkoR
         US3U4nxm4YdmLrVit14R0D0yXUuCmKHFM+Wju7PGie0hFwKgJp29kj6UYGdqO+9a19Ub
         YIAsfa8Kyum3vgMstmlE7bSA8tGk5uQ9+jywo2zGzYmT/XmerFHb/Az4Jf41gZlxxBgO
         gQFwyTDqmnAxd3JgO2+rhetzH5Pk2xVXm/CQ8Ie5YZx8zxLgL2CjDb/lcYjtKflUbXDi
         q5YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=oodlVf+v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe1acac2si125435681cf.238.2024.08.26.23.52.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 23:52:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=oodlVf+v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sipyY-0005Y6-Pj; Tue, 27 Aug 2024 02:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MnbNZgUKCJEEvG3A19916z.x97Bz7F-vC789818F.9C1@flex--tavip.bounces.google.com>)
 id 1sipyL-0004LM-0S
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 02:46:33 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MnbNZgUKCJEEvG3A19916z.x97Bz7F-vC789818F.9C1@flex--tavip.bounces.google.com>)
 id 1sipyE-0006BS-L9
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 02:46:32 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-201e94a71a0so43743425ad.1
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 23:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724741170; x=1725345970; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=X2yHlfFCVO0YfF3xgHCRZ6c8oJqo6hQZyjUxPy9WUWU=;
 b=oodlVf+vTVtRe7C3O9bAmfm7AiCj2/Wvyby3rn2cM2oOIRmmMf7rcrk8XF+ZIPWqsO
 fSJuXMfGJ6TDWf5SBXbvhvxQ4IOMME4dGvl95Rl1QRZ6vR+PjgLXG+G/pXwy91CcjU7H
 QAoVZUWzaGlvc86k7YKGdX0pQgcbUPYupY6gJwFf5ZCCflyrCBwgGv4PIcd1Vmanlm0H
 aFWaikStSkgJKptxU3LX/J/i6J30pX5VcToPilcZeyzCGJejVHR1eramwy56JVSNDD5u
 F1DdChvsqKG3pDrBnudPFA+fYLXZXyzf+JdzRVkrOo66xb/p2fA+B7BZHXzV3JAKyn2u
 7QXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724741170; x=1725345970;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X2yHlfFCVO0YfF3xgHCRZ6c8oJqo6hQZyjUxPy9WUWU=;
 b=r91Hk+/XTV8hs9lqo0ZpM75GbpHAAYfne3az//KM1d9LDFWUP6REZxxrS32WhWosPK
 BZDGz3LuWzyLopuCgk8igLm1+eSuRD656Qw2Pk6fGXvmRI/DFE+G8cOjcYikqdzxS45G
 uZHX+N1lT1LMATy+Urc4Zg7gn+7HLYxhORsy3DIa+nx009cA20sV6PWHpdsM/ZopcQtw
 PWbeTEUR1Pj93va8cDGduNERDHibqbD5es+mC1PRA8Fw2PDPaBkuoo9PRROwV1lWRnjj
 PUt4cFU5xmR6cMKI4HJN9gP5R8qxZ3vqwKvHdc074I2i3qm6u1ZkXxYFevI1m7CTR38d
 rKQg==
X-Gm-Message-State: AOJu0YwJHhEJiyCpkqxTTZxBzGnViX8kdduHBgHSzCZ7gpIS1+5G2ypd
 KRl/s5MFURjw6fYWE4l0Led3E79Z/qw9fC5xvIM7/T1tZJdW3RASqKIDPz+pZsVZMSvTdE/tUQ=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:903:23c1:b0:1fb:bd8:f83e with
 SMTP id
 d9443c01a7336-204dddf1032mr30155ad.4.1724741170323; Mon, 26 Aug 2024 23:46:10
 -0700 (PDT)
Date: Mon, 26 Aug 2024 23:45:25 -0700
In-Reply-To: <20240827064529.1246786-1-tavip@google.com>
Mime-Version: 1.0
References: <20240827064529.1246786-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240827064529.1246786-22-tavip@google.com>
Subject: [RFC PATCH v3 21/24] hw/misc: add spi-tester
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3MnbNZgUKCJEEvG3A19916z.x97Bz7F-vC789818F.9C1@flex--tavip.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: EW4HGTlDpPA0

Add a simple SPI peripheral that echoes back received data. Useful for
testing SPI controllers.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/hw/misc/spi_tester.h | 32 ++++++++++++++++++++++
 hw/misc/spi_tester.c         | 52 ++++++++++++++++++++++++++++++++++++
 hw/misc/Kconfig              |  5 ++++
 hw/misc/meson.build          |  1 +
 4 files changed, 90 insertions(+)
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
index 0000000000..86599d1184
--- /dev/null
+++ b/hw/misc/spi_tester.c
@@ -0,0 +1,52 @@
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
+static void spi_tester_class_init(ObjectClass *klass, void *data)
+{
+    SSIPeripheralClass *k = SSI_PERIPHERAL_CLASS(klass);
+
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
index a0f7a52a23..c804237712 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -158,6 +158,7 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
 
 system_ss.add(when: 'CONFIG_I2C_TESTER', if_true: files('i2c_tester.c'))
+system_ss.add(when: 'CONFIG_SPI_TESTER', if_true: files('spi_tester.c'))
 
 system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
 system_ss.add(when: 'CONFIG_RT500_CLKCTL', if_true: files('rt500_clkctl0.c', 'rt500_clkctl1.c'))
-- 
2.46.0.295.g3b9ea8a38a-goog

