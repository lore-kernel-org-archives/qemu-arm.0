Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1490468njf;
        Sat, 17 Aug 2024 03:27:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVH3AF0KkdiRnKfGIMAWpFrcYkrvd+GNtPRYlLXpmvzDJ8epY2cpU39q9/RWowV2XpgOnHUvI278FCn+IXeugaOmtCrHNVR
X-Google-Smtp-Source: AGHT+IH6KJvaZQHV7gnpNoXsdrul053alVeeBRXRGQrvRFxR1BZAJos3eLoxMdTy4v++HBx6fnS7
X-Received: by 2002:a05:620a:4385:b0:7a6:4a55:a5d8 with SMTP id af79cd13be357-7a64a55ad02mr360926985a.38.1723890439411;
        Sat, 17 Aug 2024 03:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723890439; cv=none;
        d=google.com; s=arc-20160816;
        b=U4eHfzE3OP4Gy0cHVc/Srmghpud+EqCqBG3OdisFCu8IYyBRNelTbYa1gwp0rDetBc
         ZtHhY/jeXq0vU35TpMserYABl76C9GMk7ieKWo011g7flyFt1ckbsjBUUEFoCyncEolX
         zkmCesDoLjlmWROCBCEYFptSOTbh3mo6cghrMgmcPGjZcfBk+mvKyfSH/WKs0mAQi9Yo
         BbJ6W0fmi0yVOUPPQmb4M7dYrb77zg1IusNGZZ1ZHVD5urKEW1T4HzJ0IGYoCGOsYXzq
         Hqa9MtlsOdAdTMmujjD/fTqGqFzZQzS1BXD5EMFzRu5FViJwgc9SgNnZxYjrdbzQT7J4
         41Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=Upd9FeYdowY3IZShEUb1HXBlUbq++p8JkY3ix5d4D/M=;
        fh=pITIqJh0Z5XaT4QxI/zJAgHBZTuNeZPw20HbjxZRX7I=;
        b=TtVwqmLEfTjsY9uuBZvTIc1MtUOAwcTjkOBBw3zRzlVumowuGHPFjFnQocm2deocP0
         cfTmSpMB/eqRHAwO0qCskhKoj5Vn7ghCf7/+56ggFHmqSH9gESa9DjseQqFCPk8vg4xv
         ncwJcGKyVQOAAk1zNVipFyEfO2QCp2z5ML0jvO36161dxwa2jx5PcuR+wqpcGgRa04i0
         ajXVhyO85YU0l7hWPNhkf5FpWtwc+Kw4mykPckW3e0mmGk3gLpZqZ3p5tCfvb+xFWNhY
         9nzNlFaoR8nZgMkjHU/rh6xgW7Rk8NJTjxEdB0hGvBup02V7BApDF3Z6tm1YvOyGZTmG
         lAPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Y5b9lJ/x";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4ff0eb5b4si604765085a.500.2024.08.17.03.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2024 03:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Y5b9lJ/x";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sfGeK-00085d-5V; Sat, 17 Aug 2024 06:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33nrAZgUKChMCtE18z77z4x.v759x5D-wxEx4676z6D.7Az@flex--tavip.bounces.google.com>)
 id 1sfGdz-0006Y8-Je
 for qemu-devel@nongnu.org; Sat, 17 Aug 2024 06:26:48 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33nrAZgUKChMCtE18z77z4x.v759x5D-wxEx4676z6D.7Az@flex--tavip.bounces.google.com>)
 id 1sfGdw-0003J5-6l
 for qemu-devel@nongnu.org; Sat, 17 Aug 2024 06:26:46 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-6c8f99fef10so2830223a12.3
 for <qemu-devel@nongnu.org>; Sat, 17 Aug 2024 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723890399; x=1724495199; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Upd9FeYdowY3IZShEUb1HXBlUbq++p8JkY3ix5d4D/M=;
 b=Y5b9lJ/xid4nppwhvvusxDfP8VvZIqI3oFZq/ONkXKw7OxbhLxG3JA9dCZuAwcmJlj
 W+GNznWX1pUZDxlCN9/v8+7WHYZrYUafU1szE0pD/Uh6M7rZXTxcyb4c9yukqRp+O72i
 WEdr3yj8V8LqGIMuAhkvNSWTAPfN3zpCboHxuSHUeJvwbpPzA8ogR0nYI6H/72YcDf+d
 MavnxUxIqdvl2zcCj9Vq2Te1r46Sw4RUtNxD6sosjN0/KeztwcF7Sg/FY1tsfNDiKH4k
 4wPyAfGrN8gW2sBM0OfX2vSiE6V+DB0gaif7+UAqMrSxEpjhJZ8rY/1A5V+1TDO0NmRR
 CX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723890399; x=1724495199;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Upd9FeYdowY3IZShEUb1HXBlUbq++p8JkY3ix5d4D/M=;
 b=l6QuisLL2aSKXi0kOWCLStp5zpkCBuLXl2Se0je6AIA7JoutJ/BM40KJRwW5VUK1cp
 ui6JzJu5/7NmXCzNJ4ZjKC4+VkAeAy3O/B4LoDdR1YTr/VQLyAIGO3GrxWu/y1P1+5TG
 XuNhu/yKjNuhBQ6XKT0NnsUIAQhFtWrvlIAqBjejMyFElaY90cGfwiJq5HTqXG5qbToM
 /orges7aoqONnGRYUhEHHuUlhLqMKUOZrfTdrQzqL/9/DyTTZ/JSCW7XOq0WRbnk7zix
 ekCVxop9LhyjGcu6lxOpBinjx3hek/hwvhSqpkWFJSnLA4xrB4c/gdOVHdoFgTZqei/5
 Pz3Q==
X-Gm-Message-State: AOJu0YzjXbjsSFdiDWp7AlfGlbfPUfcS/bUYq74Fdw055ZZqFUSAG/9G
 JP7O6shSlxAwqfo6Ygx27SV8n4XqMSwqk29Lle5gGNrGK1QA+gRgZ5Kd9PNVRQEg+TPMtD4q8br
 Ony3boNRf58ZbpvzuCiLqBKQgixxQOJ5XPpGaYyW5Ky5qdL5jrHa/F1rUWoPwyzMLvnb/Iu9tfU
 r7uASPK3mE5b2jQvVqCmQ6CJSzwg==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:ecd1:b0:202:156:c4c6 with
 SMTP id
 d9443c01a7336-20203f1cdbamr5626085ad.9.1723890398382; Sat, 17 Aug 2024
 03:26:38 -0700 (PDT)
Date: Sat, 17 Aug 2024 03:25:59 -0700
In-Reply-To: <20240817102606.3996242-1-tavip@google.com>
Mime-Version: 1.0
References: <20240817102606.3996242-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240817102606.3996242-17-tavip@google.com>
Subject: [RFC PATCH v2 16/23] test/unit: add spi-tester
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 thuth@redhat.com, peter.maydell@linaro.org, marcandre.lureau@redhat.com, 
 alistair@alistair23.me, berrange@redhat.com, philmd@linaro.org, 
 jsnow@redhat.com, crosa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=33nrAZgUKChMCtE18z77z4x.v759x5D-wxEx4676z6D.7Az@flex--tavip.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: DBHeu6rg23L9

Add a simple SPI peripheral that echoes back received data. Useful for
testing SPI controllers.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/spi_tester.h | 32 +++++++++++++++++++++++
 tests/unit/spi_tester.c | 57 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 tests/unit/spi_tester.h
 create mode 100644 tests/unit/spi_tester.c

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
diff --git a/tests/unit/spi_tester.c b/tests/unit/spi_tester.c
new file mode 100644
index 0000000000..e055d25990
--- /dev/null
+++ b/tests/unit/spi_tester.c
@@ -0,0 +1,57 @@
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
-- 
2.46.0.184.g6999bdac58-goog

