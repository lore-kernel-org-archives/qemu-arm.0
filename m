Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253E0ECD99C
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 20:00:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo5VC-0006b4-DX; Thu, 05 Feb 2026 14:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5VA-0006Z4-F2
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:58:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5V8-00033f-LO
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:58:56 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so884835f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 11:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770321533; x=1770926333; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JeekGzv+w1I6deqskFXYc4GF+MRuiD3S4EOMsfhWNfc=;
 b=nA3ZbbGeybPRw2tvZP164jpg4rWwqnCWTmOH3deTNnuyLmmg7bEvuhkzDR+BL2ZkFU
 MoxRmQ+8sgI/q3RNsAUDisSLjTfUsoP6R+R+4NXVh1ztxFBqexZxJCHPYf4WKUbO3u0P
 PDCGaRn4KUtIgAqSgpvwSorT+jGgZBcbdUvEaPbrIAPCLl4sp59tiB3E5YOdCZKJqrsY
 rLSxKEDW8Xu4/n0QAAifEGkxzOMyREF+/XX3F6hG8SIoOFnZ2/waxONLr+sac7siZuqs
 z2Dr2xii/nKNxTeT8VqlfbaDWpPo0xc+6Y+jKptG9gg8UkS3aMl9hfYJQqiVSrnaAfCc
 r6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770321533; x=1770926333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JeekGzv+w1I6deqskFXYc4GF+MRuiD3S4EOMsfhWNfc=;
 b=XRRzjT/Kj4Lhzv5DJ0FQVCycT215aUdutqmYodZjDOeei2TPD4Va8Ofnc262DmEKVw
 pVck7dWobS+XyOqOVuc6VGp5eRV8jB6NyiwC8Vij0OQtDnf0l6xwOUX5EDlO8Z018RFa
 sMT3vL+AQPBuhWc3+1pxyypsz2+ALhEzu0f82ZPXey3xs4LITh+XLYw/ESMbc5JELT2S
 eZ/OCScHjBdWSUxBklh2Gh6vQRVU88mqShEm5EW84ufgJLCxWwWWZLz7fQhCNpD6kc6d
 n5fGGDm/UdQ9YGYrYWiOeEbW/hEzfel0U57L0vY8eb05jN++Uyywi7K/qB7qewPZN+pD
 0qpw==
X-Gm-Message-State: AOJu0Yz+5dOK1+i7Pc39Y+RgicAPpRoBIUtDAiEzrvR6/ALs80Nsf2WN
 LnAGPdlPWoJXzEd7XA4fAA17389zTb/mxdgV8AmBb6FBILBu0zGXbi75
X-Gm-Gg: AZuq6aIlu34i9wioy15im19Cal2Le5v9ZvBCIMvkve68gH98mOVYKg81Kpzdl0YvlN4
 frldxmECk/W1g5rzOdGd6VUEu3trmYWMTvukd+mwuiWH3IJ6eYNkJntgRysOobYiHOG64j9g+2/
 /59eusYS+Wpj9WJkVtKbaT3x/vR1oYWxBoidx5pubOXsRKwamLlM8x6WKySIPZsLD0rMcjtjHhR
 Gnh7QrcPEBuY7BWgKYmqlZt34Ob8ZyptQDSos/UExjXAM4fgNL5QjhCBXFqrlMx1Su/jqtmcyZ0
 CQB9K3KNtZ8/6MoPIKW0AqJW434Mp5GJ8VS1spbYKuDENv/zEWtV3g09BlRuLAs+2MYyqhQ0Em6
 UXK/dQA6qPKCnNyNcqvChEReeq5oUBM0lyFveyk0yookYz8RFE0Wp+6keGdn7ug5OhA2TnlYTQo
 g7CDmpHBWe57/eqWoqCMs=
X-Received: by 2002:a05:6000:420e:b0:435:a9ad:d21a with SMTP id
 ffacd0b85a97d-43629380f81mr723561f8f.40.1770321532712; 
 Thu, 05 Feb 2026 11:58:52 -0800 (PST)
Received: from thinkpad-t470s.. ([93.140.16.93])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-436297450b4sm514079f8f.34.2026.02.05.11.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 11:58:52 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 francisco.iglesias@amd.com, Ruslan_Ruslichenko@epam.com,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH 07/29] hw/core: Add Remote Port object skeleton
Date: Thu,  5 Feb 2026 20:58:02 +0100
Message-ID: <20260205195824.2610192-8-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
References: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Introduce the QOM skeleton for the Remote Port subsystem.
This patch adds main types required for co-simulation:

- remote-port: An object that manages the lifecycle of the
co-simulation session and will handle the character device
backend in future patches.

- remote-port-device: An interface that allows other QEMU
devices to be connected to the Remote Port.

This infrastructure enables QEMU to be linked with external
simulators (e.g. SystemC).

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/remote-port.c         | 140 ++++++++++++++++++++++++++++++++++
 include/hw/core/remote-port.h |  67 ++++++++++++++++
 2 files changed, 207 insertions(+)
 create mode 100644 hw/core/remote-port.c
 create mode 100644 include/hw/core/remote-port.h

diff --git a/hw/core/remote-port.c b/hw/core/remote-port.c
new file mode 100644
index 0000000000..c909a825f3
--- /dev/null
+++ b/hw/core/remote-port.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * QEMU remote attach
+ *
+ * Copyright (c) 2013 Xilinx Inc
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ *
+ * This code is licensed under the GNU GPL.
+ */
+
+#include "qemu/osdep.h"
+#include "system/system.h"
+#include "chardev/char.h"
+#include "system/cpus.h"
+#include "system/cpu-timers.h"
+#include "system/reset.h"
+#include "hw/core/sysbus.h"
+#include "hw/core/hw-error.h"
+#include "qemu/sockets.h"
+#include "qemu/thread.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "migration/vmstate.h"
+#include "hw/core/qdev-properties.h"
+#include "hw/core/qdev-properties-system.h"
+#include "qemu/cutils.h"
+
+#ifndef _WIN32
+#include <sys/mman.h>
+#endif
+
+#include "hw/core/remote-port-proto.h"
+#include "hw/core/remote-port.h"
+
+#define D(x)
+#define SYNCD(x)
+
+#ifndef REMOTE_PORT_ERR_DEBUG
+#define REMOTE_PORT_DEBUG_LEVEL 0
+#else
+#define REMOTE_PORT_DEBUG_LEVEL 1
+#endif
+
+#define DB_PRINT_L(level, ...) do { \
+    if (REMOTE_PORT_DEBUG_LEVEL > level) { \
+        fprintf(stderr,  ": %s: ", __func__); \
+        fprintf(stderr, ## __VA_ARGS__); \
+    } \
+} while (0)
+
+#define REMOTE_PORT_CLASS(klass)    \
+     OBJECT_CLASS_CHECK(RemotePortClass, (klass), TYPE_REMOTE_PORT)
+
+
+static void rp_reset(DeviceState *dev)
+{
+    RemotePort *s = REMOTE_PORT(dev);
+
+    if (s->reset_done) {
+        return;
+    }
+
+    s->reset_done = true;
+}
+
+static void rp_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static void rp_unrealize(DeviceState *dev)
+{
+    RemotePort *s = REMOTE_PORT(dev);
+
+    s->finalizing = true;
+}
+
+static const VMStateDescription vmstate_rp = {
+    .name = TYPE_REMOTE_PORT,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void rp_prop_allow_set_link(const Object *obj, const char *name,
+                                   Object *val, Error **errp)
+{
+}
+
+static void rp_init(Object *obj)
+{
+    RemotePort *s = REMOTE_PORT(obj);
+    int i;
+
+    for (i = 0; i < REMOTE_PORT_MAX_DEVS; ++i) {
+        char *name = g_strdup_printf("remote-port-dev%d", i);
+        object_property_add_link(obj, name, TYPE_REMOTE_PORT_DEVICE,
+                             (Object **)&s->devs[i],
+                             rp_prop_allow_set_link,
+                             OBJ_PROP_LINK_STRONG);
+        g_free(name);
+    }
+}
+
+static void rp_class_init(ObjectClass *klass, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->legacy_reset = rp_reset;
+    dc->realize = rp_realize;
+    dc->unrealize = rp_unrealize;
+    dc->vmsd = &vmstate_rp;
+}
+
+static const TypeInfo rp_info = {
+    .name          = TYPE_REMOTE_PORT,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(RemotePort),
+    .instance_init = rp_init,
+    .class_init    = rp_class_init,
+    .interfaces    = (InterfaceInfo[]) {
+        { },
+    },
+};
+
+static const TypeInfo rp_device_info = {
+    .name          = TYPE_REMOTE_PORT_DEVICE,
+    .parent        = TYPE_INTERFACE,
+    .class_size    = sizeof(RemotePortDeviceClass),
+};
+
+static void rp_register_types(void)
+{
+    type_register_static(&rp_info);
+    type_register_static(&rp_device_info);
+}
+
+type_init(rp_register_types)
diff --git a/include/hw/core/remote-port.h b/include/hw/core/remote-port.h
new file mode 100644
index 0000000000..db71071c8e
--- /dev/null
+++ b/include/hw/core/remote-port.h
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * QEMU remote port.
+ *
+ * Copyright (c) 2013 Xilinx Inc
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ *
+ * This code is licensed under the GNU GPL.
+ */
+#ifndef REMOTE_PORT_H__
+#define REMOTE_PORT_H__
+
+#include <stdbool.h>
+#include "hw/core/remote-port-proto.h"
+#include "chardev/char.h"
+#include "chardev/char-fe.h"
+#include "qobject/qdict.h"
+
+#define TYPE_REMOTE_PORT_DEVICE "remote-port-device"
+
+#define REMOTE_PORT_DEVICE_CLASS(klass) \
+     OBJECT_CLASS_CHECK(RemotePortDeviceClass, (klass), TYPE_REMOTE_PORT_DEVICE)
+#define REMOTE_PORT_DEVICE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(RemotePortDeviceClass, (obj), TYPE_REMOTE_PORT_DEVICE)
+#define REMOTE_PORT_DEVICE(obj) \
+     INTERFACE_CHECK(RemotePortDevice, (obj), TYPE_REMOTE_PORT_DEVICE)
+
+typedef struct RemotePort RemotePort;
+
+typedef struct RemotePortDevice {
+    /*< private >*/
+    Object parent_obj;
+} RemotePortDevice;
+
+typedef struct RemotePortDeviceClass {
+    /*< private >*/
+    InterfaceClass parent_class;
+
+    /*< public >*/
+    /**
+     * ops - operations to perform when remote port packets are recieved for
+     * this device. Function N will be called for a remote port packet with
+     * cmd == N in the header.
+     *
+     * @obj - Remote port device to recieve packet
+     * @pkt - remote port packets
+     */
+
+    void (*ops[RP_CMD_max + 1])(RemotePortDevice *obj, struct rp_pkt *pkt);
+
+} RemotePortDeviceClass;
+
+#define TYPE_REMOTE_PORT "remote-port"
+#define REMOTE_PORT(obj) OBJECT_CHECK(RemotePort, (obj), TYPE_REMOTE_PORT)
+
+struct RemotePort {
+    DeviceState parent;
+
+    bool finalizing;
+
+    bool reset_done;
+
+#define REMOTE_PORT_MAX_DEVS 1024
+    RemotePortDevice *devs[REMOTE_PORT_MAX_DEVS];
+};
+
+#endif
-- 
2.43.0


