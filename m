Received: by 10.25.208.211 with SMTP id h202csp1450816lfg;
        Tue, 16 Feb 2016 10:16:21 -0800 (PST)
X-Received: by 10.140.175.134 with SMTP id v128mr30665728qhv.61.1455646581549;
        Tue, 16 Feb 2016 10:16:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g184si41670253qhd.51.2016.02.16.10.16.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:16:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVkAe-0003wf-U1
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:16:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4S-0001th-PH
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 13:09:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4R-0005rk-M5
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 13:09:56 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4R-0005rG-Eo; Tue, 16 Feb 2016 13:09:55 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4P-0003SB-50; Tue, 16 Feb 2016 18:09:53 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 18:09:44 +0000
Message-Id: <1455646193-13238-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-devel] [PATCH v3 02/10] hw/sd/sd.c: QOMify
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZFU5m9/GJf8X

Turn the SD card into a QOM device.
This conversion only changes the device itself; the various
functions which are effectively methods on the device are not
touched at this point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/sd/sd.c         | 99 ++++++++++++++++++++++++++++++++++++++++++------------
 include/hw/sd/sd.h |  3 ++
 2 files changed, 80 insertions(+), 22 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index dd614b0..1681728 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -34,6 +34,8 @@
 #include "sysemu/block-backend.h"
 #include "hw/sd/sd.h"
 #include "qemu/bitmap.h"
+#include "hw/qdev-properties.h"
+#include "qemu/error-report.h"
 
 //#define DEBUG_SD 1
 
@@ -78,6 +80,8 @@ enum SDCardStates {
 };
 
 struct SDState {
+    DeviceState parent_obj;
+
     uint32_t mode;    /* current card mode, one of SDCardModes */
     int32_t state;    /* current card state, one of SDCardStates */
     uint32_t ocr;
@@ -473,34 +477,26 @@ static const VMStateDescription sd_vmstate = {
     }
 };
 
-/* We do not model the chip select pin, so allow the board to select
-   whether card should be in SSI or MMC/SD mode.  It is also up to the
-   board to ensure that ssi transfers only occur when the chip select
-   is asserted.  */
+/* Legacy initialization function for use by non-qdevified callers */
 SDState *sd_init(BlockBackend *blk, bool is_spi)
 {
-    SDState *sd;
+    DeviceState *dev;
+    Error *err = NULL;
 
-    if (blk && blk_is_read_only(blk)) {
-        fprintf(stderr, "sd_init: Cannot use read-only drive\n");
+    dev = qdev_create(NULL, TYPE_SD_CARD);
+    qdev_prop_set_drive(dev, "drive", blk, &err);
+    if (err) {
+        error_report("sd_init failed: %s", error_get_pretty(err));
         return NULL;
     }
-
-    sd = (SDState *) g_malloc0(sizeof(SDState));
-    sd->buf = blk_blockalign(blk, 512);
-    sd->spi = is_spi;
-    sd->enable = true;
-    sd->blk = blk;
-    sd_reset(sd);
-    if (sd->blk) {
-        /* Attach dev if not already attached.  (This call ignores an
-         * error return code if sd->blk is already attached.) */
-        /* FIXME ignoring blk_attach_dev() failure is dangerously brittle */
-        blk_attach_dev(sd->blk, sd);
-        blk_set_dev_ops(sd->blk, &sd_block_ops, sd);
+    qdev_prop_set_bit(dev, "spi", is_spi);
+    object_property_set_bool(OBJECT(dev), true, "realized", &err);
+    if (err) {
+        error_report("sd_init failed: %s", error_get_pretty(err));
+        return NULL;
     }
-    vmstate_register(NULL, -1, &sd_vmstate, sd);
-    return sd;
+
+    return SD_CARD(dev);
 }
 
 void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
@@ -1769,3 +1765,62 @@ void sd_enable(SDState *sd, bool enable)
 {
     sd->enable = enable;
 }
+
+static void sd_instance_init(Object *obj)
+{
+    SDState *sd = SD_CARD(obj);
+
+    sd->enable = true;
+}
+
+static void sd_realize(DeviceState *dev, Error **errp)
+{
+    SDState *sd = SD_CARD(dev);
+
+    if (sd->blk && blk_is_read_only(sd->blk)) {
+        error_setg(errp, "Cannot use read-only drive as SD card");
+        return;
+    }
+
+    sd->buf = blk_blockalign(sd->blk, 512);
+
+    if (sd->blk) {
+        blk_set_dev_ops(sd->blk, &sd_block_ops, sd);
+    }
+
+    sd_reset(sd);
+}
+
+static Property sd_properties[] = {
+    DEFINE_PROP_DRIVE("drive", SDState, blk),
+    /* We do not model the chip select pin, so allow the board to select
+     * whether card should be in SSI or MMC/SD mode.  It is also up to the
+     * board to ensure that ssi transfers only occur when the chip select
+     * is asserted.  */
+    DEFINE_PROP_BOOL("spi", SDState, spi, false),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void sd_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = sd_realize;
+    dc->props = sd_properties;
+    dc->vmsd = &sd_vmstate;
+}
+
+static const TypeInfo sd_info = {
+    .name = TYPE_SD_CARD,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(SDState),
+    .class_init = sd_class_init,
+    .instance_init = sd_instance_init,
+};
+
+static void sd_register_types(void)
+{
+    type_register_static(&sd_info);
+}
+
+type_init(sd_register_types)
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 79adb5b..404d589 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -68,6 +68,9 @@ typedef struct {
 
 typedef struct SDState SDState;
 
+#define TYPE_SD_CARD "sd-card"
+#define SD_CARD(obj) OBJECT_CHECK(SDState, (obj), TYPE_SD_CARD)
+
 SDState *sd_init(BlockBackend *bs, bool is_spi);
 int sd_do_command(SDState *sd, SDRequest *req,
                   uint8_t *response);
-- 
1.9.1

