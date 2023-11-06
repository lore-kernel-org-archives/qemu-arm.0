Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2679494eja;
        Mon, 6 Nov 2023 03:09:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL0afhetVsK83uSPofyLoxiAJedeVbQMW1jWAD2qQsEkvNZD2lvBUbT3PdInMMjt/2piaq
X-Received: by 2002:a17:902:f34d:b0:1ca:7086:60ec with SMTP id q13-20020a170902f34d00b001ca708660ecmr23802995ple.65.1699268997233;
        Mon, 06 Nov 2023 03:09:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268997; cv=none;
        d=google.com; s=arc-20160816;
        b=coXhAcTIgI0Vx72fZTnz0hQtQnMovScJnbJ4fx6zyN/pgU/j3VSyTIbkNLzSBJBrzL
         M8Ncnfyeh19wI4Jw+PGI7eWEvqCggsY6rm+bT2TAvksITgiB8vsEqGAIAKCFMsed5Dmd
         cOS9xH59ehirkeM1ClNZzSGgIO9jkCGy8MoRtTr1303y5U0N6DJdIJAAK1A6A8zNHN8I
         1GYov6c4HcYgib9j5/+d8WRztie3gk1l4UXigRMZ2EB3E9gaeTPkbGJ2DmXBgTm9yaIi
         igf/rdbcGULnyuWPONuI/Pef2mE/F0xPwgPBYWuC0jh0gm0KEHagwX7GTyfeCd8BAMAF
         HCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=41ppFX+7R6F7tVGh9dGaG+2Fh2vMVrU15YTc5GYKvbI=;
        fh=PMj2e77/QzuZ4GIY8Lg46qGCWMmjecOfyXNOmGVjVW0=;
        b=H/jHj8TwtUR8QqxPT1NY8tPSV1Q+qwRLXa9dlABajQwEghE84GzKvH6vYQWkGqp/I5
         0jg29v/MCf8kEcfRfJqZY0tywVzCugK5TvM9+2yeqoF+CJfxAjq+uGKvCgBrVtGKccrT
         R++IfOYUw5QJOB3kre37Gli82RRWMvfkR2Gqh3UwXm4gbhl/EppGIzAkjGN/UoUJTcAl
         ajfuqDhcshNEB31mMbCCI/SEkkpQ3LwK3sc6YR/zi09+C7kV4IUw0yPZ1eP2jljWwwAI
         WAHUzfQlpH9Nzo92/G5nBIMRKLhl/VbV6ikBYU2qPvFijUQbJO6hjpHPG5R5ZUYZzlNX
         nKhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DJRyY/s0";
       spf=pass (google.com: domain of kvm+bounces-723-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-723-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-723-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id u14-20020a170903124e00b001c45291b6ebsi8173845plh.272.2023.11.06.03.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:09:57 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-723-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DJRyY/s0";
       spf=pass (google.com: domain of kvm+bounces-723-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-723-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4538280C21
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846491A71D;
	Mon,  6 Nov 2023 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJRyY/s0"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1691A701
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:09:50 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4525A98
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:09:48 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so61029191fa.3
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268986; x=1699873786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41ppFX+7R6F7tVGh9dGaG+2Fh2vMVrU15YTc5GYKvbI=;
        b=DJRyY/s0uhyhws4h1d4Cg6rGUk6oorX4w0Uz9Kb1o/wXamDDZIxklChhweHJLrhpCy
         2EScU4y+bfe0Z6Pcxgq+iYA+0mvbOCh0HaPmJEmoZ17zqU9f1n0kTPjIYwgyvVbkVlev
         6EMdQ+gyjjiMAq0y05DGOMitpMWlRwgtuvQSRzQcGenvI8Ak04ciMQkSD4fXRBQ0JC6z
         MZ1D1b1YBeDd1RXKoJNV5nLLIN31LCKNT1wcZhMvROAJt1OlUMGBmcPqtr/Oz5u9CVtY
         o3DH1YGxVNEmLsgRO0c5GwzyCmr4hN+MqHzTSfniDK/pfJeOPC6LTBsmdzrSXqpAvi0x
         Cgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268986; x=1699873786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41ppFX+7R6F7tVGh9dGaG+2Fh2vMVrU15YTc5GYKvbI=;
        b=qVOdH2Y+n6FA796NAY+ARsVcf/r4n8ePmI/fu6dURTe51q7d/JbaLaI/lrwspMKdVR
         eRXeHkS6vO/5JL0rxct3H5g1u1NV1zszjncXUHOe6Ya+mWsYLJnoVYexaoKZv0j1Nsfl
         wfjJGyLIhnf4jxbJ1OKObiHXu6rAo9QchtNMFIXbiqPpqqqaDK/x2DISPlmSfd4AGZie
         upWVbLziISEHBjIh2YIsOzbXBqN4//lYanrDBpo9M8VXwSf6M6frUkJPOsTj7UpW/WDw
         eA3ON6+JNGgE/On9E1QGnIn3TpuF+EwPoy5IDix4W3LpbFgoLIYIDkcU6RPXNy0g43kV
         cPrA==
X-Gm-Message-State: AOJu0YzH/7uDOdhIOhBfaPKFOrBYknS9RjpZkHOmu9Cl61XWyN5eizMP
	FdQL82A1CShtrbZgl+99ra0dCw==
X-Received: by 2002:a05:651c:3dc:b0:2c5:14d3:f295 with SMTP id f28-20020a05651c03dc00b002c514d3f295mr19960731ljp.35.1699268986606;
        Mon, 06 Nov 2023 03:09:46 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id l4-20020adfa384000000b0032d2489a399sm9245951wrb.49.2023.11.06.03.09.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:09:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Titus Rwantare <titusr@google.com>,
	Hao Wu <wuhaotsh@google.com>,
	Corey Minyard <cminyard@mvista.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Tyrone Ting <kfting@nuvoton.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 54/60] tests/qtest: add tests for ADM1266
Date: Mon,  6 Nov 2023 12:03:26 +0100
Message-ID: <20231106110336.358-55-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9VW5DhdWNETH

From: Titus Rwantare <titusr@google.com>

The ADM1266 can have string fields written by the driver, so
it's worth specifically testing.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
[PMD: Cover file in MAINTAINERS]
Message-ID: <20231023-staging-pmbus-v3-v4-6-07a8cb7cd20a@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                |   1 +
 tests/qtest/adm1266-test.c | 122 +++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build    |   1 +
 3 files changed, 124 insertions(+)
 create mode 100644 tests/qtest/adm1266-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e6a2f57442..c01c2e6ec0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -862,6 +862,7 @@ F: hw/*/npcm*
 F: hw/sensor/adm1266.c
 F: include/hw/*/npcm*
 F: tests/qtest/npcm*
+F: tests/qtest/adm1266-test.c
 F: pc-bios/npcm7xx_bootrom.bin
 F: roms/vbootrom
 F: docs/system/arm/nuvoton.rst
diff --git a/tests/qtest/adm1266-test.c b/tests/qtest/adm1266-test.c
new file mode 100644
index 0000000000..6c312c499f
--- /dev/null
+++ b/tests/qtest/adm1266-test.c
@@ -0,0 +1,122 @@
+/*
+ * Analog Devices ADM1266 Cascadable Super Sequencer with Margin Control and
+ * Fault Recording with PMBus
+ *
+ * Copyright 2022 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include <math.h>
+#include "hw/i2c/pmbus_device.h"
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "qemu/bitops.h"
+
+#define TEST_ID "adm1266-test"
+#define TEST_ADDR (0x12)
+
+#define ADM1266_BLACKBOX_CONFIG                 0xD3
+#define ADM1266_PDIO_CONFIG                     0xD4
+#define ADM1266_READ_STATE                      0xD9
+#define ADM1266_READ_BLACKBOX                   0xDE
+#define ADM1266_SET_RTC                         0xDF
+#define ADM1266_GPIO_SYNC_CONFIGURATION         0xE1
+#define ADM1266_BLACKBOX_INFORMATION            0xE6
+#define ADM1266_PDIO_STATUS                     0xE9
+#define ADM1266_GPIO_STATUS                     0xEA
+
+/* Defaults */
+#define ADM1266_OPERATION_DEFAULT               0x80
+#define ADM1266_CAPABILITY_DEFAULT              0xA0
+#define ADM1266_CAPABILITY_NO_PEC               0x20
+#define ADM1266_PMBUS_REVISION_DEFAULT          0x22
+#define ADM1266_MFR_ID_DEFAULT                  "ADI"
+#define ADM1266_MFR_ID_DEFAULT_LEN              32
+#define ADM1266_MFR_MODEL_DEFAULT               "ADM1266-A1"
+#define ADM1266_MFR_MODEL_DEFAULT_LEN           32
+#define ADM1266_MFR_REVISION_DEFAULT            "25"
+#define ADM1266_MFR_REVISION_DEFAULT_LEN        8
+#define TEST_STRING_A                           "a sample"
+#define TEST_STRING_B                           "b sample"
+#define TEST_STRING_C                           "rev c"
+
+static void compare_string(QI2CDevice *i2cdev, uint8_t reg,
+                           const char *test_str)
+{
+    uint8_t len = i2c_get8(i2cdev, reg);
+    char i2c_str[SMBUS_DATA_MAX_LEN] = {0};
+
+    i2c_read_block(i2cdev, reg, (uint8_t *)i2c_str, len);
+    g_assert_cmpstr(i2c_str, ==, test_str);
+}
+
+static void write_and_compare_string(QI2CDevice *i2cdev, uint8_t reg,
+                                     const char *test_str, uint8_t len)
+{
+    char buf[SMBUS_DATA_MAX_LEN] = {0};
+    buf[0] = len;
+    strncpy(buf + 1, test_str, len);
+    i2c_write_block(i2cdev, reg, (uint8_t *)buf, len + 1);
+    compare_string(i2cdev, reg, test_str);
+}
+
+static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, ==, ADM1266_OPERATION_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, ==, ADM1266_PMBUS_REVISION_DEFAULT);
+
+    compare_string(i2cdev, PMBUS_MFR_ID, ADM1266_MFR_ID_DEFAULT);
+    compare_string(i2cdev, PMBUS_MFR_MODEL, ADM1266_MFR_MODEL_DEFAULT);
+    compare_string(i2cdev, PMBUS_MFR_REVISION, ADM1266_MFR_REVISION_DEFAULT);
+}
+
+/* test r/w registers */
+static void test_rw_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    /* empty strings */
+    i2c_set8(i2cdev, PMBUS_MFR_ID, 0);
+    compare_string(i2cdev, PMBUS_MFR_ID, "");
+
+    i2c_set8(i2cdev, PMBUS_MFR_MODEL, 0);
+    compare_string(i2cdev, PMBUS_MFR_MODEL, "");
+
+    i2c_set8(i2cdev, PMBUS_MFR_REVISION, 0);
+    compare_string(i2cdev, PMBUS_MFR_REVISION, "");
+
+    /* test strings */
+    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_A,
+                             sizeof(TEST_STRING_A));
+    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_B,
+                             sizeof(TEST_STRING_B));
+    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_C,
+                             sizeof(TEST_STRING_C));
+}
+
+static void adm1266_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x12"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
+
+    qos_node_create_driver("adm1266", i2c_device_create);
+    qos_node_consumes("adm1266", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "adm1266", test_defaults, NULL);
+    qos_add_test("test_rw_regs", "adm1266", test_rw_regs, NULL);
+}
+
+libqos_init(adm1266_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c9945e69b1..47dabf91d0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -241,6 +241,7 @@ qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
   'adm1272-test.c',
+  'adm1266-test.c',
   'ds1338-test.c',
   'e1000-test.c',
   'eepro100-test.c',
-- 
2.41.0

