Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1704747ejb;
        Mon, 23 Oct 2023 16:47:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxJey/xyE6B5zGW/bHLbpov5q7XuWXXmTN+PDvw0CWssBswyB86lg6UB6VAfkxO4QJYYy/
X-Received: by 2002:ae9:e008:0:b0:778:92fb:a8c4 with SMTP id m8-20020ae9e008000000b0077892fba8c4mr10847790qkk.30.1698104854051;
        Mon, 23 Oct 2023 16:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698104854; cv=none;
        d=google.com; s=arc-20160816;
        b=liqhdJI3lxHcZANdYZ72Elt47iTLziq1mFNVf+Wi0ToI7n75EmXxJ19vFVHqt8+2uU
         Wlbbd5D3nDq2oJMU+ktwu+eo0MghkD6gvtx/4aoXCbagi0QmwJS9LOh2lUxdz8XbAfv1
         Km9G+BqZzCkrPGXuKRe0eD2c2OoXeOp/SDdhVlT5VmlzthuS3ZlJHa6SPGJPlaI0XoSP
         ooZj6CzyPjq8GmLEIr2zrDKjqyUKToOAlrLWcGk8XTEYYx4dGEeswMCP7fAdMdxYJ2PI
         4HIKGwkm4nz/rSRk84WlHSdFNGu0ydMVL+mxpwzOVnqseBJJn1cE4MLg7rOhJFVsU8+6
         tSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=n111QpLYBiuxWwpTUsiNF5S0AAgW3sqw1k0fiUG1aKk=;
        fh=Mz0v6aCc/GPSuGOAcNmOuoiwEqcNHc5EwzP8i2J+/2g=;
        b=AVwuZfgjcgbxj5idKESbHcTVY6EFADMQjad4rQFwzPkaQrM+RYeodOv5CAtyDkw9ZN
         EJQ35epo9YdhfyY1OlHpCYUT6wvOq5FruVZVbX/Hhg6HGYvogHT7FSkd/yyL4x3mTHq1
         k4kerpr47n7HIegiS8AF5a9dDOpR6n594iowOquJ5flJJuMEyaPdkSj1xeOds5CMVEaq
         tRAnQ+/rnwItvtSASjlRyvbYhlIpiEL7DP3pHqBoD48evs0hScz+nEcpCoWHxRv/Es5P
         6Nhzj9yHp5lt2bXflM1k47zKpZPu5cAAJb6pbp5jP2qyZVcA/IqVgbCIcK7FunkEmLt5
         FV8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=POQCtCsN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a05620a0bc300b00778a5de9072si6309259qki.750.2023.10.23.16.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 16:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=POQCtCsN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qv4dd-0002wN-CA; Mon, 23 Oct 2023 19:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <39gU3ZQYKCA88x8976v33v0t.r315t19-p61232v29.36v@flex--titusr.bounces.google.com>)
 id 1qv4da-0002up-60
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 19:47:10 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <39gU3ZQYKCA88x8976v33v0t.r315t19-p61232v29.36v@flex--titusr.bounces.google.com>)
 id 1qv4dU-0002mq-EB
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 19:47:09 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d9a5a16fa94so3915708276.0
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 16:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698104822; x=1698709622; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=n111QpLYBiuxWwpTUsiNF5S0AAgW3sqw1k0fiUG1aKk=;
 b=POQCtCsNcNmFe7ZLdmqDOMrNnO/NfRoYg4sm/BdZ1tqNwCio1LiRNax+D+x/mggV6F
 6Gt/dh+bnFukiMzyksNALXlIVqhXs/NX/vSJRICManocYBHHHOENF+aVO4C+o9zKbhKx
 T9xc6PMPH5Y+tnCuFbSV1Elhw9CfAd3Ik7FG4dtwhfIGrH1znpzp3uuIo9cknPHQypWp
 35By+2CWOQFyMfA+KWWLZP9yj7EAbaIQ7f6bfVHC+8EfwToibYwvH32r8bu3AKPwoDyF
 xDBaIvPzS57sp5mOkdWEM5p1Su0gTWHn/n46b70FuKGeAU9pU4lKJEzxBYUJwFRhUwqs
 M7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698104822; x=1698709622;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n111QpLYBiuxWwpTUsiNF5S0AAgW3sqw1k0fiUG1aKk=;
 b=MMtZquak1apg5y4/OMFLXdvAtoqjAx+ikvwfP2RFB/4vrS2Cb7L3WNwgeDNKZWu4pY
 kkdOfAoPAgAtwG3NeVVRHVGdxX4GP0lkLc46ux5D/quKJ7vjDb5Jj4YNc5eTjWtzAHRv
 Yj5oWhnenwFLrcIQ9TY9Z4TloBmJsFeHmChyKGQs8wGUIfnN8d0Xy1rJv5T8XboSYRsE
 SzgmoUiDNuNFx35h1+ryTfX6wpu+irts2cKBXCzFb2y3OpPNFuMadk7+ceL9ntFp6UkL
 42oP+WLoYi++uDjWvxejmAjqZ9CLUY8os5DotFWrTTsuGDtZK+jHvPJDwdbTnLNbj3AR
 hO0Q==
X-Gm-Message-State: AOJu0YwKpQJZXdNTni9PbnJ8BFm9aEfQjsdcnRxPuaBAyY3Y9aHBmkvj
 BOlZEzAJJKMIGOFdkpu7teEsjH0+QqY=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:fc20:0:b0:d89:42d7:e72d with SMTP id
 v32-20020a25fc20000000b00d8942d7e72dmr362043ybd.3.1698104822610; Mon, 23 Oct
 2023 16:47:02 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:46:44 +0000
In-Reply-To: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
Mime-Version: 1.0
References: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
X-Developer-Key: i=titusr@google.com; a=openpgp;
 fpr=228BD42BAD6A2BCD3865AEA6C41200175CD21E30
X-Developer-Signature: v=1; a=openpgp-sha256; l=10300; i=titusr@google.com;
 h=from:subject:message-id; bh=Pvp88ipg4wcQkca0LNqgx1eKliwgonl8N8UN0HK+lbA=;
 b=owEB7QES/pANAwAKAcQSABdc0h4wAcsmYgBlNwXuePa9xpXCH/ST7bsMs54GMg0wk0f8+ZB0o
 ACAB+s5El+JAbMEAAEKAB0WIQQii9QrrWorzThlrqbEEgAXXNIeMAUCZTcF7gAKCRDEEgAXXNIe
 MOePC/0UAxd70rwS5JqB+nLqUc8T6FvS9ICMhMAico+y0n3VfnqAWbLKf8x+G58giZZW8YA3fDZ
 AxRPQi3RS0LhQlClswOC6oLk2vHktNQgyrMLbl6M9R134mBV3cHH5d8AqD24YEyBAZLd5onClSq
 foZbGjm5AGOsPtvAUAfbhBo9q4nJOpMrBloZud+44PJ4LfQXshh/n+OMjqIc4e2kPxH+yj8ajfz
 X/GgXjn6L+l+sAFGIycN8zSfXBC+muP8s8AqLW51jqcaKLtdDBZzRXN6VBkNMunU081Y/HH1UYe
 ynXJM92h8T/ECpWRDuhuOKNXU4YtI8Rhs6HT+y7NswM/Vmm6XY2ejC1NwmTfzClvpFfq7Gmet5Q
 12ieZ0ooPH7bMF/yBfpp1Eik1ll6Cdk2wZbR/3zgd/bpmKi7wkfBbiKTaIFy9o9o/cfvVERR8w4
 /sGEdcm9rWbw+7dqAZ/1UbaqdD9B6U2SCovO31vO0RDTprSmiZt/j7/+UC4Ie9dr0cZM4=
X-Mailer: b4 0.12.2
Message-ID: <20231023-staging-pmbus-v3-v4-5-07a8cb7cd20a@google.com>
Subject: [PATCH v4 5/8] hw/sensor: add ADM1266 device model
From: titusr@google.com
To: philmd@linaro.org, minyard@acm.org
Cc: Titus Rwantare <titusr@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=39gU3ZQYKCA88x8976v33v0t.r315t19-p61232v29.36v@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01,
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
X-TUID: DyLDAwwxRf/l

  The ADM1266 is a cascadable super sequencer with margin control and
  fault recording.
  This commit adds basic support for its PMBus commands and models
  the identification registers that can be modified in a firmware
  update.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/Kconfig        |   1 +
 hw/sensor/Kconfig     |   5 +
 hw/sensor/adm1266.c   | 254 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build |   1 +
 4 files changed, 261 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7e68348440..b1e8c0e2ac 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -488,6 +488,7 @@ config NPCM7XX
     default y
     depends on TCG && ARM
     select A9MPCORE
+    select ADM1266
     select ADM1272
     select ARM_GIC
     select SMBUS
diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index e03bd09b50..bc6331b4ab 100644
--- a/hw/sensor/Kconfig
+++ b/hw/sensor/Kconfig
@@ -22,6 +22,11 @@ config ADM1272
     bool
     depends on I2C
 
+config ADM1266
+    bool
+    depends on PMBUS
+    default y if PMBUS
+
 config MAX34451
     bool
     depends on I2C
diff --git a/hw/sensor/adm1266.c b/hw/sensor/adm1266.c
new file mode 100644
index 0000000000..5ae4f82ba1
--- /dev/null
+++ b/hw/sensor/adm1266.c
@@ -0,0 +1,254 @@
+/*
+ * Analog Devices ADM1266 Cascadable Super Sequencer with Margin Control and
+ * Fault Recording with PMBus
+ *
+ * https://www.analog.com/media/en/technical-documentation/data-sheets/adm1266.pdf
+ *
+ * Copyright 2023 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i2c/pmbus_device.h"
+#include "hw/irq.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+#define TYPE_ADM1266 "adm1266"
+OBJECT_DECLARE_SIMPLE_TYPE(ADM1266State, ADM1266)
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
+
+#define ADM1266_NUM_PAGES               17
+/**
+ * PAGE Index
+ * Page 0 VH1.
+ * Page 1 VH2.
+ * Page 2 VH3.
+ * Page 3 VH4.
+ * Page 4 VP1.
+ * Page 5 VP2.
+ * Page 6 VP3.
+ * Page 7 VP4.
+ * Page 8 VP5.
+ * Page 9 VP6.
+ * Page 10 VP7.
+ * Page 11 VP8.
+ * Page 12 VP9.
+ * Page 13 VP10.
+ * Page 14 VP11.
+ * Page 15 VP12.
+ * Page 16 VP13.
+ */
+typedef struct ADM1266State {
+    PMBusDevice parent;
+
+    char mfr_id[32];
+    char mfr_model[32];
+    char mfr_rev[8];
+} ADM1266State;
+
+static const uint8_t adm1266_ic_device_id[] = {0x03, 0x41, 0x12, 0x66};
+static const uint8_t adm1266_ic_device_rev[] = {0x08, 0x01, 0x08, 0x07, 0x0,
+                                                0x0, 0x07, 0x41, 0x30};
+
+static void adm1266_exit_reset(Object *obj)
+{
+    ADM1266State *s = ADM1266(obj);
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+
+    pmdev->page = 0;
+    pmdev->capability = ADM1266_CAPABILITY_NO_PEC;
+
+    for (int i = 0; i < ADM1266_NUM_PAGES; i++) {
+        pmdev->pages[i].operation = ADM1266_OPERATION_DEFAULT;
+        pmdev->pages[i].revision = ADM1266_PMBUS_REVISION_DEFAULT;
+        pmdev->pages[i].vout_mode = 0;
+        pmdev->pages[i].read_vout = pmbus_data2linear_mode(12, 0);
+        pmdev->pages[i].vout_margin_high = pmbus_data2linear_mode(15, 0);
+        pmdev->pages[i].vout_margin_low = pmbus_data2linear_mode(3, 0);
+        pmdev->pages[i].vout_ov_fault_limit = pmbus_data2linear_mode(16, 0);
+        pmdev->pages[i].revision = ADM1266_PMBUS_REVISION_DEFAULT;
+    }
+
+    strncpy(s->mfr_id, ADM1266_MFR_ID_DEFAULT, 4);
+    strncpy(s->mfr_model, ADM1266_MFR_MODEL_DEFAULT, 11);
+    strncpy(s->mfr_rev, ADM1266_MFR_REVISION_DEFAULT, 3);
+}
+
+static uint8_t adm1266_read_byte(PMBusDevice *pmdev)
+{
+    ADM1266State *s = ADM1266(pmdev);
+
+    switch (pmdev->code) {
+    case PMBUS_MFR_ID:                    /* R/W block */
+        pmbus_send_string(pmdev, s->mfr_id);
+        break;
+
+    case PMBUS_MFR_MODEL:                 /* R/W block */
+        pmbus_send_string(pmdev, s->mfr_model);
+        break;
+
+    case PMBUS_MFR_REVISION:              /* R/W block */
+        pmbus_send_string(pmdev, s->mfr_rev);
+        break;
+
+    case PMBUS_IC_DEVICE_ID:
+        pmbus_send(pmdev, adm1266_ic_device_id, sizeof(adm1266_ic_device_id));
+        break;
+
+    case PMBUS_IC_DEVICE_REV:
+        pmbus_send(pmdev, adm1266_ic_device_rev, sizeof(adm1266_ic_device_rev));
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: reading from unimplemented register: 0x%02x\n",
+                      __func__, pmdev->code);
+        return 0xFF;
+    }
+
+    return 0;
+}
+
+static int adm1266_write_data(PMBusDevice *pmdev, const uint8_t *buf,
+                              uint8_t len)
+{
+    ADM1266State *s = ADM1266(pmdev);
+
+    switch (pmdev->code) {
+    case PMBUS_MFR_ID:                    /* R/W block */
+        pmbus_receive_block(pmdev, (uint8_t *)s->mfr_id, sizeof(s->mfr_id));
+        break;
+
+    case PMBUS_MFR_MODEL:                 /* R/W block */
+        pmbus_receive_block(pmdev, (uint8_t *)s->mfr_model,
+                            sizeof(s->mfr_model));
+        break;
+
+    case PMBUS_MFR_REVISION:               /* R/W block*/
+        pmbus_receive_block(pmdev, (uint8_t *)s->mfr_rev, sizeof(s->mfr_rev));
+        break;
+
+    case ADM1266_SET_RTC:   /* do nothing */
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: writing to unimplemented register: 0x%02x\n",
+                      __func__, pmdev->code);
+        break;
+    }
+    return 0;
+}
+
+static void adm1266_get(Object *obj, Visitor *v, const char *name, void *opaque,
+                        Error **errp)
+{
+    uint16_t value;
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+    PMBusVoutMode *mode = (PMBusVoutMode *)&pmdev->pages[0].vout_mode;
+
+    if (strcmp(name, "vout") == 0) {
+        value = pmbus_linear_mode2data(*(uint16_t *)opaque, mode->exp);
+    } else {
+        value = *(uint16_t *)opaque;
+    }
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static void adm1266_set(Object *obj, Visitor *v, const char *name, void *opaque,
+                        Error **errp)
+{
+    uint16_t *internal = opaque;
+    uint16_t value;
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+    PMBusVoutMode *mode = (PMBusVoutMode *)&pmdev->pages[0].vout_mode;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    *internal = pmbus_data2linear_mode(value, mode->exp);
+    pmbus_check_limits(pmdev);
+}
+
+static const VMStateDescription vmstate_adm1266 = {
+    .name = "ADM1266",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]){
+        VMSTATE_PMBUS_DEVICE(parent, ADM1266State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void adm1266_init(Object *obj)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+    uint64_t flags = PB_HAS_VOUT_MODE | PB_HAS_VOUT | PB_HAS_VOUT_MARGIN |
+                     PB_HAS_VOUT_RATING | PB_HAS_STATUS_MFR_SPECIFIC;
+
+    for (int i = 0; i < ADM1266_NUM_PAGES; i++) {
+        pmbus_page_config(pmdev, i, flags);
+
+        object_property_add(obj, "vout[*]", "uint16",
+                            adm1266_get,
+                            adm1266_set, NULL, &pmdev->pages[i].read_vout);
+    }
+}
+
+static void adm1266_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
+
+    dc->desc = "Analog Devices ADM1266 Hot Swap controller";
+    dc->vmsd = &vmstate_adm1266;
+    k->write_data = adm1266_write_data;
+    k->receive_byte = adm1266_read_byte;
+    k->device_num_pages = 17;
+
+    rc->phases.exit = adm1266_exit_reset;
+}
+
+static const TypeInfo adm1266_info = {
+    .name = TYPE_ADM1266,
+    .parent = TYPE_PMBUS_DEVICE,
+    .instance_size = sizeof(ADM1266State),
+    .instance_init = adm1266_init,
+    .class_init = adm1266_class_init,
+};
+
+static void adm1266_register_types(void)
+{
+    type_register_static(&adm1266_info);
+}
+
+type_init(adm1266_register_types)
diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
index 30e20e27b8..420fdc3359 100644
--- a/hw/sensor/meson.build
+++ b/hw/sensor/meson.build
@@ -2,6 +2,7 @@ system_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
 system_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
 system_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
 system_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
+system_ss.add(when: 'CONFIG_ADM1266', if_true: files('adm1266.c'))
 system_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
 system_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
 system_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_mag.c'))

-- 
2.42.0.758.gaed0368e0e-goog

