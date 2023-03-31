Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp281487ejb;
        Thu, 30 Mar 2023 17:09:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350b807VQprgG+pdmAJ5VuWq32EW2dabsQ15C2rC3eBV7uJM+0adqtvw6gJ5dCXp3caO497lC
X-Received: by 2002:a05:6214:29e4:b0:5a9:ed32:1765 with SMTP id jv4-20020a05621429e400b005a9ed321765mr39309396qvb.23.1680221365944;
        Thu, 30 Mar 2023 17:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680221365; cv=none;
        d=google.com; s=arc-20160816;
        b=NKlOD+AENtBQ2CdYaISzpQruWBjMLhE6dMQm6wDgKoOfrP1VZcyobwsWfPL+S+eIKA
         IwEDwyCfULnLBHaAyV/GNGUkdEXEtgo4hPE5g06lW3LL1VTuNJG31GgeWlFxyO+iqEsM
         j8Gr50KGKkb1S6Jk9Dw4C8gEUArbCMZ8OgaIZWXo/7ZKFrmCKJVg0aDtQ92GnDUDv0ua
         k55falan5vmMoUQ1uuXnc6YFXCNqgUcQzRu7jwoXCwErT8FqIK//yDYOMId4gR4FXDx8
         RsNzxx5ase7HQDIadBQbv8TLZACMy6dRczVORH/tp6/2xLn5TN12zsSaBWICDJ6hIMBu
         PJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=8gvomdt3DUwUN4FoSBnJV4Ctxju8JwPTYOQalHBdVD4=;
        b=jbE20j1GX35g0s2XerNFXmDeT65bsZn2mYVKKNBDyYZ3eRw4J/IgYf0GWAv1slTy8/
         lcpg1R6VXnYTVFnNT/eyhdh9kYgbw+WLu9H1ZS/jX+pjT5k6/x3USdQRMKQJ5PxnqRII
         xIkeJjm34snkJcXBdld6NWGEu78PSkAWZXL/Lie34eBIFnvB4enlZq/4gEjXWExhNrpX
         8rk2HFwA8kBO1OyPuq8lTBr3n6DBeMHRYWM+FyiJ37C+XhNcVfHeOtGrHXi5qfUR8uLQ
         0FjyOlUKrKjudRj48IfWw065/rZLHCZHSAlnXc/zyTfgEAA+GcDnaaOXFEyeVQDlvcDh
         32Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=UEfgoMO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr7-20020a0562142a8700b005a5043f2802si524303qvb.265.2023.03.30.17.09.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 17:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=UEfgoMO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pi2KL-0007Nw-6J; Thu, 30 Mar 2023 20:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hyQmZAYKCJAD2DECB08805y.w86Ay6E-uB678707E.8B0@flex--titusr.bounces.google.com>)
 id 1pi2K9-0007Cc-IS
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 20:08:57 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hyQmZAYKCJAD2DECB08805y.w86Ay6E-uB678707E.8B0@flex--titusr.bounces.google.com>)
 id 1pi2K6-0005qR-BW
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 20:08:57 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 4-20020a251904000000b00b7f75c3cafdso5175571ybz.16
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 17:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221319;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8gvomdt3DUwUN4FoSBnJV4Ctxju8JwPTYOQalHBdVD4=;
 b=UEfgoMO4eZQeg9kuztrUq2cXxkWJmLL3WxzcUu/vTNNLbE7hASopSjKN9Lc5UAkL0e
 fhzkZPiq92TAWvBKIVZtmDOG+2CF+RjCWAhlDa1p/gaBLQzf9TvyMbuXfYtPvYs5DXJ6
 O2/S0gUXr6GAwLOjq8C3X/DJ+asKLUBeI6qQ9+KLMotSimFJOpWSkO9JDsqz57Oqk04C
 GlCByLNnK0sDDrj3+Sjy/ObynhFcYXnHIMZkTppUlX3pGU+95vPZwhSStRkxbH+QXmSK
 T+xSsh7O5Yg+AnBfF9jha6pPPEEOjU4ea7raDB4q+aGrCVh3ckrmdjR0D1qfHBxQnEjs
 EjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221319;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8gvomdt3DUwUN4FoSBnJV4Ctxju8JwPTYOQalHBdVD4=;
 b=n6I8dD3UYv7uI1BcEutUe/mAx+1x0/i3PFmf8Vsoki3zQ3SFLkdE31gNbD/bhwrHI6
 fK4+3s6DdMSDWEmnAxdgRjpY+wdU1ybS+UCa2dH20YalXm9hESuaKu/t8TK9pYGEtzFf
 d6vyABWJcFPiOuZpiSTQgw+AkFwrGKuxF2zqMx491G+hPAjJV7iGI5GsKt+1wW7NGxmu
 H00go0xNXVcEiuJMJM3dPqKxpzfen8/XcpYI/HtaxLSiDcRwD/MY+P0SDDrbVA/gF2lt
 Wp219JwjIlX3/49WNUwLpbhVl8dOwD1loJyzEwJUc+290TtZFvgAf8+ZdNLC1/lpVxfG
 j8xw==
X-Gm-Message-State: AAQBX9dZSR8z7rIBdTAJNlFss3veF53aXaQEFhFtqJmXSKqf+tb1wKGy
 SgquApjGUbajs8agtufOgWZgMtppOF8=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:18d5:b0:b75:3fd4:1b31 with SMTP id
 ck21-20020a05690218d500b00b753fd41b31mr17197516ybb.1.1680221319710; Thu, 30
 Mar 2023 17:08:39 -0700 (PDT)
Date: Fri, 31 Mar 2023 00:07:55 +0000
In-Reply-To: <20230331000756.1712787-1-titusr@google.com>
Mime-Version: 1.0
References: <20230331000756.1712787-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.423.gd6c402a77b-goog
Message-ID: <20230331000756.1712787-7-titusr@google.com>
Subject: [PATCH 6/7] hw/sensor: add ADM1266 device model
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3hyQmZAYKCJAD2DECB08805y.w86Ay6E-uB678707E.8B0@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 2UOwZlsfXYeV

  The ADM1266 is a cascadable super sequencer with margin control and
  fault recording.
  This commit adds basic support for its PMBus commands and models
  the identification registers that can be modified in a firmware
  update.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/Kconfig        |   1 +
 hw/sensor/Kconfig     |   5 +
 hw/sensor/adm1266.c   | 255 ++++++++++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build |   1 +
 4 files changed, 262 insertions(+)
 create mode 100644 hw/sensor/adm1266.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b5aed4aff5..4e44a7451d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -407,6 +407,7 @@ config XLNX_VERSAL
 config NPCM7XX
     bool
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
index 0000000000..0745b12b1d
--- /dev/null
+++ b/hw/sensor/adm1266.c
@@ -0,0 +1,255 @@
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
+#include <string.h>
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
index 9e9be602c3..4528ee6215 100644
--- a/hw/sensor/meson.build
+++ b/hw/sensor/meson.build
@@ -3,6 +3,7 @@ softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
 softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
 softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
+softmmu_ss.add(when: 'CONFIG_ADM1266', if_true: files('adm1266.c'))
 softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
 softmmu_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_mag.c'))
 softmmu_ss.add(when: 'CONFIG_ISL_PMBUS_VR', if_true: files('isl_pmbus_vr.c'))
-- 
2.40.0.423.gd6c402a77b-goog

