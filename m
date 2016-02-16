Received: by 10.25.208.211 with SMTP id h202csp1451943lfg;
        Tue, 16 Feb 2016 10:18:36 -0800 (PST)
X-Received: by 10.140.102.14 with SMTP id v14mr28554884qge.48.1455646714398;
        Tue, 16 Feb 2016 10:18:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f20si41632225qhe.122.2016.02.16.10.18.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:18:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVkCn-0008Ol-Ku
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:18:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4c-0002Bs-JG
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:10:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4b-0005xA-4i
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:10:06 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4X-0005sC-LS; Tue, 16 Feb 2016 13:10:01 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4P-0003SN-Az; Tue, 16 Feb 2016 18:09:53 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 18:09:47 +0000
Message-Id: <1455646193-13238-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PATCH v3 05/10] hw/sd/sdhci.c: Update to use SDBus APIs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hSdJ5OABfVkg

Update the SDHCI code to use the new SDBus APIs.

This commit introduces the new command line options required
to connect a disk to sdhci-pci:

 -device sdhci-pci -drive id=mydrive,[...] -device sd,drive=mydrive

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/sdhci.c         | 97 ++++++++++++++++++++++++++++++++++++---------------
 include/hw/sd/sdhci.h |  3 +-
 2 files changed, 69 insertions(+), 31 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 3d1eb85..396dd10 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -55,6 +55,9 @@
         } \
     } while (0)
 
+#define TYPE_SDHCI_BUS "sdhci-bus"
+#define SDHCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SDHCI_BUS)
+
 /* Default SD/MMC host controller features information, which will be
  * presented in CAPABILITIES register of generic SD host controller at reset.
  * If not stated otherwise:
@@ -145,9 +148,9 @@ static void sdhci_raise_insertion_irq(void *opaque)
     }
 }
 
-static void sdhci_insert_eject_cb(void *opaque, int irq, int level)
+static void sdhci_set_inserted(DeviceState *dev, bool level)
 {
-    SDHCIState *s = (SDHCIState *)opaque;
+    SDHCIState *s = (SDHCIState *)dev;
     DPRINT_L1("Card state changed: %s!\n", level ? "insert" : "eject");
 
     if ((s->norintsts & SDHC_NIS_REMOVE) && level) {
@@ -172,9 +175,9 @@ static void sdhci_insert_eject_cb(void *opaque, int irq, int level)
     }
 }
 
-static void sdhci_card_readonly_cb(void *opaque, int irq, int level)
+static void sdhci_set_readonly(DeviceState *dev, bool level)
 {
-    SDHCIState *s = (SDHCIState *)opaque;
+    SDHCIState *s = (SDHCIState *)dev;
 
     if (level) {
         s->prnsts &= ~SDHC_WRITE_PROTECT;
@@ -186,6 +189,8 @@ static void sdhci_card_readonly_cb(void *opaque, int irq, int level)
 
 static void sdhci_reset(SDHCIState *s)
 {
+    DeviceState *dev = DEVICE(s);
+
     timer_del(s->insert_timer);
     timer_del(s->transfer_timer);
     /* Set all registers to 0. Capabilities registers are not cleared
@@ -194,8 +199,11 @@ static void sdhci_reset(SDHCIState *s)
     memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdmasysad);
 
     if (!s->noeject_quirk) {
-        sd_set_cb(s->card, s->ro_cb, s->eject_cb);
+        /* Reset other state based on current card insertion/readonly status */
+        sdhci_set_inserted(dev, sdbus_get_inserted(&s->sdbus));
+        sdhci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
     }
+
     s->data_count = 0;
     s->stopped_state = sdhc_not_stopped;
 }
@@ -213,7 +221,7 @@ static void sdhci_send_command(SDHCIState *s)
     request.cmd = s->cmdreg >> 8;
     request.arg = s->argument;
     DPRINT_L1("sending CMD%u ARG[0x%08x]\n", request.cmd, request.arg);
-    rlen = sd_do_command(s->card, &request, response);
+    rlen = sdbus_do_command(&s->sdbus, &request, response);
 
     if (s->cmdreg & SDHC_CMD_RESPONSE) {
         if (rlen == 4) {
@@ -269,7 +277,7 @@ static void sdhci_end_transfer(SDHCIState *s)
         request.cmd = 0x0C;
         request.arg = 0;
         DPRINT_L1("Automatically issue CMD%d %08x\n", request.cmd, request.arg);
-        sd_do_command(s->card, &request, response);
+        sdbus_do_command(&s->sdbus, &request, response);
         /* Auto CMD12 response goes to the upper Response register */
         s->rspreg[3] = (response[0] << 24) | (response[1] << 16) |
                 (response[2] << 8) | response[3];
@@ -301,7 +309,7 @@ static void sdhci_read_block_from_card(SDHCIState *s)
     }
 
     for (index = 0; index < (s->blksize & 0x0fff); index++) {
-        s->fifo_buffer[index] = sd_read_data(s->card);
+        s->fifo_buffer[index] = sdbus_read_data(&s->sdbus);
     }
 
     /* New data now available for READ through Buffer Port Register */
@@ -394,7 +402,7 @@ static void sdhci_write_block_to_card(SDHCIState *s)
     }
 
     for (index = 0; index < (s->blksize & 0x0fff); index++) {
-        sd_write_data(s->card, s->fifo_buffer[index]);
+        sdbus_write_data(&s->sdbus, s->fifo_buffer[index]);
     }
 
     /* Next data can be written through BUFFER DATORT register */
@@ -476,7 +484,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
         while (s->blkcnt) {
             if (s->data_count == 0) {
                 for (n = 0; n < block_size; n++) {
-                    s->fifo_buffer[n] = sd_read_data(s->card);
+                    s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
                 }
             }
             begin = s->data_count;
@@ -517,7 +525,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
             s->sdmasysad += s->data_count - begin;
             if (s->data_count == block_size) {
                 for (n = 0; n < block_size; n++) {
-                    sd_write_data(s->card, s->fifo_buffer[n]);
+                    sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
                 }
                 s->data_count = 0;
                 if (s->trnmod & SDHC_TRNS_BLK_CNT_EN) {
@@ -549,7 +557,7 @@ static void sdhci_sdma_transfer_single_block(SDHCIState *s)
 
     if (s->trnmod & SDHC_TRNS_READ) {
         for (n = 0; n < datacnt; n++) {
-            s->fifo_buffer[n] = sd_read_data(s->card);
+            s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
         }
         dma_memory_write(&address_space_memory, s->sdmasysad, s->fifo_buffer,
                          datacnt);
@@ -557,7 +565,7 @@ static void sdhci_sdma_transfer_single_block(SDHCIState *s)
         dma_memory_read(&address_space_memory, s->sdmasysad, s->fifo_buffer,
                         datacnt);
         for (n = 0; n < datacnt; n++) {
-            sd_write_data(s->card, s->fifo_buffer[n]);
+            sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
         }
     }
 
@@ -661,7 +669,7 @@ static void sdhci_do_adma(SDHCIState *s)
                 while (length) {
                     if (s->data_count == 0) {
                         for (n = 0; n < block_size; n++) {
-                            s->fifo_buffer[n] = sd_read_data(s->card);
+                            s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
                         }
                     }
                     begin = s->data_count;
@@ -702,7 +710,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     dscr.addr += s->data_count - begin;
                     if (s->data_count == block_size) {
                         for (n = 0; n < block_size; n++) {
-                            sd_write_data(s->card, s->fifo_buffer[n]);
+                            sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
                         }
                         s->data_count = 0;
                         if (s->trnmod & SDHC_TRNS_BLK_CNT_EN) {
@@ -816,7 +824,7 @@ static void sdhci_data_transfer(void *opaque)
             break;
         }
     } else {
-        if ((s->trnmod & SDHC_TRNS_READ) && sd_data_ready(s->card)) {
+        if ((s->trnmod & SDHC_TRNS_READ) && sdbus_data_ready(&s->sdbus)) {
             s->prnsts |= SDHC_DOING_READ | SDHC_DATA_INHIBIT |
                     SDHC_DAT_LINE_ACTIVE;
             sdhci_read_block_from_card(s);
@@ -1153,15 +1161,10 @@ static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
     }
 }
 
-static void sdhci_initfn(SDHCIState *s, BlockBackend *blk)
+static void sdhci_initfn(SDHCIState *s)
 {
-    s->card = sd_init(blk, false);
-    if (s->card == NULL) {
-        exit(1);
-    }
-    s->eject_cb = qemu_allocate_irq(sdhci_insert_eject_cb, s, 0);
-    s->ro_cb = qemu_allocate_irq(sdhci_card_readonly_cb, s, 0);
-    sd_set_cb(s->card, s->ro_cb, s->eject_cb);
+    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
+                        TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
 
     s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
@@ -1231,7 +1234,7 @@ static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
     SDHCIState *s = PCI_SDHCI(dev);
     dev->config[PCI_CLASS_PROG] = 0x01; /* Standard Host supported DMA */
     dev->config[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin A */
-    sdhci_initfn(s, s->blk);
+    sdhci_initfn(s);
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
     s->irq = pci_allocate_irq(dev);
@@ -1279,11 +1282,8 @@ static Property sdhci_sysbus_properties[] = {
 static void sdhci_sysbus_init(Object *obj)
 {
     SDHCIState *s = SYSBUS_SDHCI(obj);
-    DriveInfo *di;
 
-    /* FIXME use a qdev drive property instead of drive_get_next() */
-    di = drive_get_next(IF_SD);
-    sdhci_initfn(s, di ? blk_by_legacy_dinfo(di) : NULL);
+    sdhci_initfn(s);
 }
 
 static void sdhci_sysbus_finalize(Object *obj)
@@ -1296,6 +1296,29 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
 {
     SDHCIState *s = SYSBUS_SDHCI(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    DriveInfo *di;
+    BlockBackend *blk;
+    DeviceState *carddev;
+    Error *err = NULL;
+
+    /* Create and plug in the sd card.
+     * FIXME: this should be done by the users of this device so we
+     * do not use drive_get_next() here.
+     */
+    di = drive_get_next(IF_SD);
+    blk = di ? blk_by_legacy_dinfo(di) : NULL;
+
+    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
+    qdev_prop_set_drive(carddev, "drive", blk, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
@@ -1325,10 +1348,26 @@ static const TypeInfo sdhci_sysbus_info = {
     .class_init = sdhci_sysbus_class_init,
 };
 
+static void sdhci_bus_class_init(ObjectClass *klass, void *data)
+{
+    SDBusClass *sbc = SD_BUS_CLASS(klass);
+
+    sbc->set_inserted = sdhci_set_inserted;
+    sbc->set_readonly = sdhci_set_readonly;
+}
+
+static const TypeInfo sdhci_bus_info = {
+    .name = TYPE_SDHCI_BUS,
+    .parent = TYPE_SD_BUS,
+    .instance_size = sizeof(SDBus),
+    .class_init = sdhci_bus_class_init,
+};
+
 static void sdhci_register_types(void)
 {
     type_register_static(&sdhci_pci_info);
     type_register_static(&sdhci_sysbus_info);
+    type_register_static(&sdhci_bus_info);
 }
 
 type_init(sdhci_register_types)
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index ffd1f80..607a83e 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -37,9 +37,8 @@ typedef struct SDHCIState {
         PCIDevice pcidev;
         SysBusDevice busdev;
     };
-    SDState *card;
+    SDBus sdbus;
     MemoryRegion iomem;
-    BlockBackend *blk;
 
     QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
     QEMUTimer *transfer_timer;
-- 
1.9.1

