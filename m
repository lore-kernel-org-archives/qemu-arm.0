Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1544228ejb;
        Mon, 23 Oct 2023 11:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsS/4jlf/2jYgxuPfMylpiYl3YiHS8jjg5d2amFu9Bpv2dPsA4H1XAdSRZbUsB2ElECzBK
X-Received: by 2002:a05:620a:40d3:b0:778:b3e5:f4b8 with SMTP id g19-20020a05620a40d300b00778b3e5f4b8mr8759949qko.47.1698084614003;
        Mon, 23 Oct 2023 11:10:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698084613; cv=none;
        d=google.com; s=arc-20160816;
        b=unx0mH5gnc7NOjiOye4vd8eHPYmv6PvPEmznZDIkDJbnCWuRKgVLtginruyaGR/gTa
         Z3yLDEFmF6GE0un3mcoywNfi3sCDz9aGMA+Cp5YnFMQ4yCI7n8MrWmcWbTepq5v2rlIS
         n2tBlvsMdAwdh/lTRxFXAEwre10B0Ncejm2VGtnlNpMxvVswrs13r2AU59hoa/PApQrU
         7bV1o71FHNBuovSimyHZTFEXTd7jwOhITU55qTy68OtRSqBK2IcN2/iMo2LthUBu8wkG
         Dj5iDBYm+syl3877GjljPbLWex9g8UiDejAJUw0WW6JFIFXkncpY/r+TlfyPKOf24yMs
         5u/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=AUxKt9rtkmU1sqptr4+quXh18WPX97kjAYR5TXil24M=;
        fh=q4lL/uJQlrYuciyVDC1dM88wZO52S7lbF1hOqFxq0Bk=;
        b=sd/NnVExkNPBfHsB0DLO9LQk3rjkcFbjC4H8K/HRMylSy1b1ZIid3pbtXo9Y0NjQZ+
         jKclDepFRXGXmxxlBrFKZKbzUHJlMfSemH2Oo4dE4rqHMt3VTCnFhnchdOEydtqHAaiY
         EmPbkCaRVyeZilXcvUWIW/1tUR3YfnEpZ1Czz0vHtwrVp0RnOl1Qjm54Nh99KoUPjb4y
         Im1it1Y8H/YNcuKQWCZGWWL3PGgefXSnkUY/MJYJB/nTXlsFi6pDNuDp7WLyvvXKdSsh
         OY7th9QchHCqzOGXzcVFjkmmh1q6BsHZ8TuImQN4PopKIA3xmhtp4qe0s1sNtvEeASr2
         0esA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GJzJQ1cg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20-20020a05620a24d400b00773c8bb497fsi5817518qkn.662.2023.10.23.11.10.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 11:10:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GJzJQ1cg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1quzMY-0005Ta-Pb; Mon, 23 Oct 2023 14:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3w7Y2ZQYKCjwrgrsqpemmejc.amkocks-bctcjlmlels.mpe@flex--titusr.bounces.google.com>)
 id 1quzMV-0005P8-5w
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 14:09:11 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3w7Y2ZQYKCjwrgrsqpemmejc.amkocks-bctcjlmlels.mpe@flex--titusr.bounces.google.com>)
 id 1quzMT-0006zY-GB
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 14:09:10 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d9ab79816a9so4478588276.3
 for <qemu-devel@nongnu.org>; Mon, 23 Oct 2023 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698084548; x=1698689348; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=AUxKt9rtkmU1sqptr4+quXh18WPX97kjAYR5TXil24M=;
 b=GJzJQ1cg8SjP8XJsVV6F+6Foz1HsmxGK24C1YL4WjLoQkL28M/TcO+YaeNBiLcP22Y
 1QDOJ2OoLOUCcwYbWNAVj5UdqT8VS6yptrQk2ZbzCVHMHdFuO3zYJ5tGMBMehByGPpx4
 +b/8x+McnxpzJpOb2nQAX3en0OPWEZmcinFjYMGMv6wZiOPSFG93z2X7q0Nc/kDoOJBT
 zHcZ2pkooBXgL60mWir7AbA2WfOksXIVpA4O7KnbfdNnAMy2sr0iS6/3HvNxIlQU9rbv
 2i5aejMFAXnbfpTFAzuMdlTZwP7+kQ/Uy3DWkWrGSX5cxZgoChkvJ95tS1WGAlSu05z6
 xuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698084548; x=1698689348;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AUxKt9rtkmU1sqptr4+quXh18WPX97kjAYR5TXil24M=;
 b=SG+cYbv1ZsPOFjnNWsaI6QTpXzJZUoQIytqP3smKLOO0nOwBF8nVVU/UUtUEplStgk
 MexO6fwpbCkVq5s3KL6+nIVPremGsYsRTozlLag1CkD0NAISVqqp7TvsI7De9Iej5CuJ
 vlVV2wiKuHHogavz6u/WMS2xXBWS+eIguBn4sa6bLHztUNoL5nSYklQxBZNulF8/MwWr
 V2pB1cN0znPaA6d9+VHmSRETwqgPFIJ7ySGycin+gXwU2KBiEu1xLEauY40NjXAaz8ME
 EvW3LBjEyw08/P+5l1D/4FF3rYSGTZnTXc5Ymx8jDPIpln93BkLALjax8ZVtoOjQXiWx
 UFaA==
X-Gm-Message-State: AOJu0YzcaVUs2h/U9chodHNkFj9gOaic98yZtVripbOZKJwIs3FhQfr5
 V1GPz8lPcywmdqvIFowbbcDdWuNetxY=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:544:b0:d13:856b:c10a with SMTP id
 z4-20020a056902054400b00d13856bc10amr218662ybs.3.1698084547762; Mon, 23 Oct
 2023 11:09:07 -0700 (PDT)
Date: Mon, 23 Oct 2023 18:08:35 +0000
In-Reply-To: <20231023180837.91785-1-titusr@google.com>
Mime-Version: 1.0
References: <20231023180837.91785-1-titusr@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231023180837.91785-7-titusr@google.com>
Subject: [PATCH v3 6/8] tests/qtest: add tests for ADM1266
From: Titus Rwantare <titusr@google.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 philmd@linaro.org
Cc: Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3w7Y2ZQYKCjwrgrsqpemmejc.amkocks-bctcjlmlels.mpe@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
X-TUID: 0/pLBPUCt8a9

  The ADM1266 can have string fields written by the driver, so
  it's worth specifically testing.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 tests/qtest/adm1266-test.c | 123 +++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build    |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 tests/qtest/adm1266-test.c

diff --git a/tests/qtest/adm1266-test.c b/tests/qtest/adm1266-test.c
new file mode 100644
index 0000000000..6431a21de6
--- /dev/null
+++ b/tests/qtest/adm1266-test.c
@@ -0,0 +1,123 @@
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
+
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index d6022ebd64..7899537e78 100644
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
2.42.0.758.gaed0368e0e-goog

