Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986487njb;
        Mon, 5 Aug 2024 13:17:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEMRZjzLcGwh6Yimh1HfY/Ib/50HUbx/54+jgfDvM5Fn1CCS8AqM6Suy6nE81MmyGFTUl3TE/z7QaxGpvB4D9aWbaww8jg
X-Received: by 2002:a05:6902:228f:b0:e0b:f894:ac9a with SMTP id 3f1490d57ef6-e0bf894b001mr8562165276.18.1722889069774;
        Mon, 05 Aug 2024 13:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889069; cv=none;
        d=google.com; s=arc-20160816;
        b=1IAfPvCN9ko/3ZS2F6UVOTLOoJQgs/uJzjjMtTNxnGmZoHWm/7uvroF9Q8kRb2PhFy
         FZ+sGNk0Hy5BaUvJSSD/8Sesz/8ikss4KEGtDKC+o/FFVqAzC58oNqav7wHm055Q9JdF
         I93iA176aPVRpr9gq1IDfJZk6A9qrcukMX98rnlWR/yL1zkAKLMJ77kRNfsKRf5Wh8bs
         mR2oglapIAlbhNqZFyRgcDwK7VeOI1bnzF7B023lceXvCnpt00lSCqNdkN36b8qJ57+l
         dcOzcMVqVrvRxL0M3FudiW6f+s1wpYfaqJgYTpCh0RFPTJEqHjB9/2LYHfwz02jsA4nD
         rspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=HolQ6M2QNUE2ejhU+N0utPdQeOsLaCbhpFMvlfrSt68=;
        fh=ifO4kvvDk8nC7MbCIVmONTtnS/QY3pp6ElQu/oJwc7s=;
        b=x/Tg3/NPll9zm1vWipvz2cdRJTTGgXxlNu1hqBwOHkkTZYfGv89hXHHQfkekMA0+ej
         r92FmLJdtdhIp7RWCbr/VtCntLCa6Y3GH4J+tN/C7766Fqw6Nk5ZQhApdFeQyXOnkKnx
         ST97i29ZsoVJxW+OZH5aC7eNdtwr6sSYw+Q3FGTcimyVMB7lCVPWHS3nWYRYKOys4jC5
         ZxrYF0X3K+QxXi7Bp5XEiTwuhrKVhXMhLYZSFa2q7Gg69h6wMk1zCjCq4ZCpihgu3F1N
         xJX1NhTmr0wh2toqvmN0dTWVgSKHSDv0SecD9F2lLMgggsuLSjI3WJNPrxNHORS5oww8
         FCzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Uh4WUy57;
       spf=pass (google.com: domain of 3btoxzgukc9qj0l8f6ee6b4.2ec0b4n.14dd44b8d0he.eh6@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3bTOxZgUKC9QJ0L8F6EE6B4.2EC0B4N.14DD44B8D0HE.EH6@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3bTOxZgUKC9QJ0L8F6EE6B4.2EC0B4N.14DD44B8D0HE.EH6@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0be536d70esor5659309276.6.2024.08.05.13.17.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3btoxzgukc9qj0l8f6ee6b4.2ec0b4n.14dd44b8d0he.eh6@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Uh4WUy57;
       spf=pass (google.com: domain of 3btoxzgukc9qj0l8f6ee6b4.2ec0b4n.14dd44b8d0he.eh6@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3bTOxZgUKC9QJ0L8F6EE6B4.2EC0B4N.14DD44B8D0HE.EH6@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889069; x=1723493869; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HolQ6M2QNUE2ejhU+N0utPdQeOsLaCbhpFMvlfrSt68=;
        b=Uh4WUy57wfAkZJbg8Inqi7NRUWlZZCpDeDuHZl0U+DbgwtZ6LugdYVK9X80GI9Het/
         v9Vz8pnLuB69Hs6LhXKFvWU9AWYhmmixEYIv3tOsQtdPeuFdtGzvZqx/bBzPrCQN02FA
         /Ef53kY9lFRSFM6tv7VYa6WMS1xWyOeYcjAYpM4WlXTc5Z683q59QsRVMU+xy+KbNAxm
         WFVaEiNKOS5c3k5JsL4qbyfQMkc74TVniEWVS4mG+fRV5NOqZafCC7xEojTnO3KXiZv0
         Xcxq17mV/AbYh/amkK2xxvSi82GT+V92/Sjpwt1EG1+DVCrtWR/TDtbxN0OSlMrzEH3x
         ulQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889069; x=1723493869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HolQ6M2QNUE2ejhU+N0utPdQeOsLaCbhpFMvlfrSt68=;
        b=e5l9udXeBF7AkLTMSXcxC/Zgpoaf1H2yje+S1CsWA4NpiQlcqsnfSodJoQYXHuyABV
         t5kCCy5xsmOu1WWcr43ux+55w0vMJhaVNgNb2+qQW3BG48XVIBPeHoDMprWP4lMrrZrF
         r0JMUwPIhrtLQWZTdsE+bQHrQhZNmw5L91S8kZL2kY8DDIObByyKU7t+pYqDFYacDWPH
         QnCow6Fl6NMzbhQ1YmdlIUfRrs4AQH91tStLfYsoI0fFVHa0ObP0zCgrAiMC1BNdgOpo
         jGBaehafsfkJHdNeXqN1QPoeirC2n9o7Pe0/a0+t/eR3DzaIBM2YnroVyFyADuhF0jUV
         veIg==
X-Forwarded-Encrypted: i=1; AJvYcCViEX4NefyRIq8etvP2krQnoiwy9tfdA1WxRkvFzpvX7jVdLfCMLfDcSGvD+iDbRnb0YLHT5oFve+QPP/OomV3tah9510Gy
X-Gm-Message-State: AOJu0YzFDzS6YnNfNKjVHNxDLPHTBkbaD9MQ3L0p2mZCO6RD7+5Q1i32
	WZLKCdaPn/vVxBPCu4kMOZWtH8JMOuZxs9uA/sDcMP4f4If4MDmNO9K3xf782EtTqZOQabajBg=
	=
X-Google-Smtp-Source: AGHT+IHJ2yivBPbFmiyhK3hrpQuvMsngp9pP9WhL1UClne9zJKqUNbF4+KVclnzUr+aIx/QWIhVmtv/sfw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6902:100c:b0:e0b:c18c:ebfb with SMTP id
 3f1490d57ef6-e0bde1eca27mr94734276.2.1722889069374; Mon, 05 Aug 2024 13:17:49
 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:11 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-17-tavip@google.com>
Subject: [RFC PATCH 16/23] test/unit: add spi-tester
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: TvTXqCneQ6YX

Add a simple SPI peripheral that echoes back received data. Useful for
testing SPI controllers.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/spi_tester.c | 60 +++++++++++++++++++++++++++++++++++++++++
 tests/unit/spi_tester.h | 32 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 tests/unit/spi_tester.c
 create mode 100644 tests/unit/spi_tester.h

diff --git a/tests/unit/spi_tester.c b/tests/unit/spi_tester.c
new file mode 100644
index 0000000000..7bccc680cc
--- /dev/null
+++ b/tests/unit/spi_tester.c
@@ -0,0 +1,60 @@
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
+#include "spi_tester.h"
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
+static void spi_tester_realize(SSIPeripheral *d, Error **errp)
+{
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
+    k->realize     = spi_tester_realize;
+    k->transfer    = spi_tester_transfer;
+    k->set_cs      = spi_tester_set_cs;
+    k->cs_polarity = SSI_CS_LOW;
+}
+
+static const TypeInfo spi_tester_info = {
+    .name          = TYPE_SPI_TESTER,
+    .parent        = TYPE_SSI_PERIPHERAL,
+    .instance_size = sizeof(SpiTesterState),
+    .class_init    = spi_tester_class_init,
+};
+
+static void spi_tester_register_types(void)
+{
+    type_register_static(&spi_tester_info);
+}
+
+type_init(spi_tester_register_types)
diff --git a/tests/unit/spi_tester.h b/tests/unit/spi_tester.h
new file mode 100644
index 0000000000..16e08d2b5c
--- /dev/null
+++ b/tests/unit/spi_tester.h
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
+#ifndef TESTS_UNIT_SPI_TESTER_H
+#define TESTS_UNIT_SPI_TESTER_H
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
+#endif /* TESTS_UNIT_SPI_TESTER_H */
-- 
2.46.0.rc2.264.g509ed76dc8-goog
