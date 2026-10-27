Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D965606A320
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 19:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqY1GBEs
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLnDo-0002og-5r; Tue, 27 Oct 2026 15:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLnDj-0002mX-4t
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 15:52:31 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLnDh-0004pp-62
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 15:52:30 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so137952f8f.3
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 12:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793130747; x=1793735547; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+MHRJB5J5iOFxUMzNzx6BYiIhoUyWnvpT0Qsh+j+9P8=;
 b=CqY1GBEsnPngN5uP0GC0K5vJ1y7F10pp+Qb82u+5Lmb3GNh19/XthV9OCRbVolgbhq
 kPTiipmnpTnWy3dgujHbFCJjGoDv7KAWsfDievQ2bZ/toj93E2XKCGQweOqPCLwRwYmj
 AId1pFfa1lyj75Gc6OBioJFAOwcOHg8pNOx7r2KI0nUrqrExjTZLmP1gzz40QmatR94Y
 YT1CIL9Rv9+6bGN2VjKiMW+Ym5K86TdV2BbBDCmsIVodM9dUa736ZCixd3n5vYCc+aOZ
 bFFhSYSdDvTI/KIjUYD7Ky4YybIMEU6433O3dR9ngpX2Zin019TNNU2RZt7TCRLlrbcI
 9oLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793130747; x=1793735547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+MHRJB5J5iOFxUMzNzx6BYiIhoUyWnvpT0Qsh+j+9P8=;
 b=wWvOuCJIp39GQUp/rVO8O+ZKyohtyFcVle6jOnVSZuZVGCWaxkBfaj2O5dVpxdZUGQ
 NiQ3QeLyh6jRYWvHgpEwzsGGtGTslVhpRfNKNvOAUWFrBx03r2l8MhU0uEjPXAtJ7oas
 eagJtJgoidtrQMB1tRoMrNsDaxFT2CpYSdizZLyRPoRTIAB9PG5n5tvkbY4fnRZc1eck
 yQBFN2ee8c5fe2qVUWAV3ohkdXS2TEZUkjSHnDX9chmKRIBtn4KjSrylJcTJmM/ovWoe
 i3kbbB6iQ5T3pMngXFTMSOeQHB28aNT2sAe/9NZuwj1C68ogXL1g4JhDov9wCn8ql9Ez
 U6fg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxaQUGnxBdxe0cbwWQeTY5cnlaQ8TmXVtGtWTb1906ynNC8HQWFUlW67pQEECW43l0iSXWheFsVwg==@nongnu.org
X-Gm-Message-State: AFq9FYJd+aBPbbhFjRoZO9DLcnnTzYy6hGXOY96M/VLXAIxGO5u0WeG1
 PwMFkJDljRKMppshFAfKJ4k+Uvw+hTl/WVgEW9gNVwjGtSSGZoMHd18h
X-Gm-Gg: AYBFou1xCNbGPXJIuooiiPibKD+iXlI66eX7ZjPPk2EknC5m6+aRNH/JL/OXRwbXh1Z
 0f8XWKCiKMvtkyZf13CkU5bs9MsL+YSIx8ZHcQWHUEDy7WN3tnBGWnr+DrIfb+CnKlTk0StPyH0
 yFnGSm3ddGi5oKcmekWaNYKobAZy/kVZdepbtD7sOLeQA9K8gzhXnJNnHeatXfmsQkSDog7maN/
 uYZZ6rYZe8fgzSWE9NYkCnLVKYLiezr/Bb/aqeVJDSvtW2CpcwrOClCGFmg2ApoqjYSKGzYRle1
 7o7j19eCSppm0pr2SnjFXk8NBvqaeq6sAqC02cg0bYiepmQJF4Y5uhONrNobjjT+9gQ9lYlKgy0
 Pj+8LsDYAU7jgPD7o1SFRyElq5nIM2HTdB37OhCwe/NaWZohyh9MI9//C5B0r8UnQqWZsF1Sk8G
 1H68Xf1sTBvAgQhLDWyGcCafL49OjIF/uT8q6hqraEq4RE/q6SQOnjlR78HYdO5V84oDQGBXM/I
 V83YnUf00hINAWfExOGFRR2Y/WUnPRQS7zYB945TeQWhd3Skw8lWJ6h/v8HV9zcPNoVNAXmwR6Z
 ll94spLSPVU9ZUc=
X-Received: by 2002:a05:6000:4006:b0:487:72f:fb41 with SMTP id
 ffacd0b85a97d-48e5d5a4168mr965133f8f.39.1793130747034; 
 Tue, 27 Oct 2026 12:52:27 -0700 (PDT)
Received: from [127.0.1.1] (95-24-99-141.broadband.corbina.ru. [95.24.99.141])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb846sm24746368f8f.25.2026.10.27.12.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 12:52:26 -0700 (PDT)
From: Timur Maksimov <gessingate@gmail.com>
Date: Tue, 27 Oct 2026 22:50:42 +0300
Subject: [PATCH v2 1/6] hw/i2c: add dummy device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-aspeed-i2c-nonpkt-fix-v2-1-07deed1dff60@gmail.com>
References: <20261027-aspeed-i2c-nonpkt-fix-v2-0-07deed1dff60@gmail.com>
In-Reply-To: <20261027-aspeed-i2c-nonpkt-fix-v2-0-07deed1dff60@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Timur Maksimov <gessingate@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793130744; l=6354;
 i=gessingate@gmail.com; s=20261022; h=from:subject:message-id;
 bh=sEriCp2nS9mi03/fVztQOGEzJ6I4qYWCuM/TX7A3vm8=;
 b=diB2p7/QGG9sXsVTHSSJyqrabth7keLSd8LeUz9euUpTagc89sf7RnIBDhlscEJw1A59YBnVy
 CPeBp52KjC3BJt8M82xp0nWtHLphUJhFj7Pr7CRIP2ap8wcha00JWUf
X-Developer-Key: i=gessingate@gmail.com; a=ed25519;
 pk=xF4NKIzSbKMdte17nQ66S/q9m/A2gu6GiEWc8ZnyJmo=
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=gessingate@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Simple I2C device with QOM properties to access
transmit and receive buffers.
Can be used for testing or prototyping.

Signed-off-by: Timur Maksimov <gessingate@gmail.com>
---
 hw/i2c/Kconfig            |   5 ++
 hw/i2c/i2c-dummy-device.c | 168 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/i2c/meson.build        |   3 +-
 3 files changed, 175 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 0766130b59..04912671db 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -6,6 +6,11 @@ config I2C_DEVICES
     # to any board's i2c bus
     bool
 
+config I2C_DUMMY_DEVICE
+    bool
+    default y if TEST_DEVICES
+    depends on I2C
+
 config SMBUS
     bool
     select I2C
diff --git a/hw/i2c/i2c-dummy-device.c b/hw/i2c/i2c-dummy-device.c
new file mode 100644
index 0000000000..645525a572
--- /dev/null
+++ b/hw/i2c/i2c-dummy-device.c
@@ -0,0 +1,168 @@
+/*
+ * QEMU I2C Dummy Device
+ *
+ * Copyright (c) 2026 Timur Maksimov <gessingate@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i2c/i2c.h"
+#include "hw/core/qdev-properties.h"
+#include "migration/vmstate.h"
+
+#define TYPE_I2C_DUMMY_DEVICE "i2c-dummy-device"
+OBJECT_DECLARE_SIMPLE_TYPE(I2CDummyDeviceState, I2C_DUMMY_DEVICE)
+
+#define I2C_DUMMY_ARRAY_SIZE 64
+
+struct I2CDummyDeviceState {
+    I2CSlave parent_obj;
+
+    uint8_t tx[I2C_DUMMY_ARRAY_SIZE];
+    uint8_t rx[I2C_DUMMY_ARRAY_SIZE];
+
+    uint8_t tx_pos;
+    uint8_t rx_pos;
+    uint8_t event;
+};
+
+static void i2c_dummy_device_reset(DeviceState *dev)
+{
+    I2CDummyDeviceState *s = I2C_DUMMY_DEVICE(dev);
+
+    s->tx_pos = 0;
+    s->rx_pos = 0;
+    s->event = I2C_FINISH;
+    memset(s->tx, 0, sizeof s->tx);
+    /* Don't reset rx as it is a readonly parameter for the model */
+}
+
+static int i2c_dummy_device_event(I2CSlave *i2c, enum i2c_event event)
+{
+    I2CDummyDeviceState *s = I2C_DUMMY_DEVICE(i2c);
+
+    switch (event) {
+    case I2C_START_SEND:
+        s->tx_pos = 0;
+        break;
+
+    case I2C_START_RECV:
+        s->rx_pos = 0;
+        break;
+
+    default:
+        break;
+    }
+
+    s->event = event;
+    return 0;
+}
+
+static int i2c_dummy_device_send(I2CSlave *i2c, uint8_t data)
+{
+    I2CDummyDeviceState *s = I2C_DUMMY_DEVICE(i2c);
+
+    if (s->tx_pos >= I2C_DUMMY_ARRAY_SIZE) {
+        /*
+         * The TX buffer is full. NACK the byte.
+         */
+        return 1;
+    }
+
+    if (s->event == I2C_START_SEND) {
+        s->tx[s->tx_pos++] = data;
+    }
+
+    return 0;
+}
+
+static uint8_t i2c_dummy_device_recv(I2CSlave *i2c)
+{
+    I2CDummyDeviceState *s = I2C_DUMMY_DEVICE(i2c);
+
+    if (s->rx_pos >= I2C_DUMMY_ARRAY_SIZE || s->event != I2C_START_RECV) {
+        /*
+         * There is no more data available.
+         */
+        return 0xff;
+    }
+
+    return s->rx[s->rx_pos++];
+}
+
+static void i2c_dummy_device_init(Object *obj)
+{
+    I2CDummyDeviceState *s = I2C_DUMMY_DEVICE(obj);
+
+    for (int i = 0; i < I2C_DUMMY_ARRAY_SIZE; i++) {
+        g_autofree char *name = g_strdup_printf("tx[%d]", i);
+
+        object_property_add_uint8_ptr(
+            obj, name, &s->tx[i],
+            OBJ_PROP_FLAG_READWRITE);
+    }
+
+    for (int i = 0; i < I2C_DUMMY_ARRAY_SIZE; i++) {
+        g_autofree char *name = g_strdup_printf("rx[%d]", i);
+
+        object_property_add_uint8_ptr(
+            obj, name, &s->rx[i],
+            OBJ_PROP_FLAG_READWRITE);
+    }
+
+    object_property_add_uint8_ptr(
+            obj, "tx-pos", &s->tx_pos,
+            OBJ_PROP_FLAG_READWRITE);
+    object_property_add_uint8_ptr(
+            obj, "rx-pos", &s->rx_pos,
+            OBJ_PROP_FLAG_READWRITE);
+}
+
+static const VMStateDescription vmstate_i2c_dummy_device = {
+    .name = TYPE_I2C_DUMMY_DEVICE,
+    .version_id = 1,
+    .minimum_version_id = 1,
+
+    .fields = (const VMStateField[]) {
+        VMSTATE_I2C_SLAVE(parent_obj, I2CDummyDeviceState),
+
+        VMSTATE_UINT8_ARRAY(tx, I2CDummyDeviceState,
+                            I2C_DUMMY_ARRAY_SIZE),
+
+        VMSTATE_UINT8_ARRAY(rx, I2CDummyDeviceState,
+                            I2C_DUMMY_ARRAY_SIZE),
+
+        VMSTATE_UINT8(tx_pos, I2CDummyDeviceState),
+        VMSTATE_UINT8(rx_pos, I2CDummyDeviceState),
+        VMSTATE_UINT8(event, I2CDummyDeviceState),
+
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void i2c_dummy_device_class_init(ObjectClass *klass, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *isc = I2C_SLAVE_CLASS(klass);
+
+    device_class_set_legacy_reset(dc, i2c_dummy_device_reset);
+
+    dc->vmsd = &vmstate_i2c_dummy_device;
+
+    isc->event = i2c_dummy_device_event;
+    isc->send = i2c_dummy_device_send;
+    isc->recv = i2c_dummy_device_recv;
+}
+
+static const TypeInfo i2c_dummy_device_info[] = {
+    {
+        .name = TYPE_I2C_DUMMY_DEVICE,
+        .parent = TYPE_I2C_SLAVE,
+        .instance_size = sizeof(I2CDummyDeviceState),
+        .instance_init = i2c_dummy_device_init,
+        .class_init = i2c_dummy_device_class_init,
+    }
+};
+
+DEFINE_TYPES(i2c_dummy_device_info)
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index 88aea35662..4695cbcd28 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -1,5 +1,5 @@
 i2c_ss = ss.source_set()
-i2c_ss.add(when: 'CONFIG_I2C', if_true: files('core.c'))
+i2c_ss.add(when: 'CONFIG_I2C', if_true: files('core.c', 'i2c-dummy-device.c'))
 i2c_ss.add(when: 'CONFIG_SMBUS', if_true: files('smbus_slave.c', 'smbus_master.c'))
 i2c_ss.add(when: 'CONFIG_ACPI_SMBUS', if_true: files('pm_smbus.c'))
 i2c_ss.add(when: 'CONFIG_ACPI_ICH9', if_true: files('smbus_ich9.c'))
@@ -19,4 +19,5 @@ i2c_ss.add(when: 'CONFIG_PPC4XX', if_true: files('ppc4xx_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PCA954X', if_true: files('i2c_mux_pca954x.c'))
 i2c_ss.add(when: 'CONFIG_PMBUS', if_true: files('pmbus_device.c'))
 i2c_ss.add(when: 'CONFIG_BCM2835_I2C', if_true: files('bcm2835_i2c.c'))
+i2c_ss.add(when: 'CONFIG_I2C_DUMMY_DEVICE', if_true: files('i2c-dummy-device.c'))
 system_ss.add_all(when: 'CONFIG_I2C', if_true: i2c_ss)

-- 
2.53.0


