Received: by 10.25.159.19 with SMTP id i19csp271455lfe;
        Fri, 22 Jan 2016 08:21:09 -0800 (PST)
X-Received: by 10.140.251.11 with SMTP id w11mr4786097qhc.7.1453479669783;
        Fri, 22 Jan 2016 08:21:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j71si7773934qhc.93.2016.01.22.08.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 08:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54543 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMeST-0003y6-6z
	for alex.bennee@linaro.org; Fri, 22 Jan 2016 11:21:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMePT-0006Z4-S3
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:18:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMePP-000515-4Y
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:18:03 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeP9-0004xO-BB; Fri, 22 Jan 2016 11:17:43 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeOB-0003st-Dk; Fri, 22 Jan 2016 16:16:43 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jan 2016 16:16:41 +0000
Message-Id: <1453479402-14870-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
References: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, patches@linaro.org,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v2 09/10] hw/sd/pxa2xx_mmci: Convert to
	VMStateDescription
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
X-TUID: tRL+M1Wtx/eA

Convert the pxa2xx_mmci device from manual save/load
functions to a VMStateDescription structure.

This is a migration compatibility break.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/sd/pxa2xx_mmci.c | 156 +++++++++++++++++++++-------------------------------
 1 file changed, 64 insertions(+), 92 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 9690c69..5170d79 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -43,27 +43,72 @@ typedef struct PXA2xxMMCIState {
     uint32_t cmdat;
     uint32_t resp_tout;
     uint32_t read_tout;
-    int blklen;
-    int numblk;
+    int32_t blklen;
+    int32_t numblk;
     uint32_t intmask;
     uint32_t intreq;
-    int cmd;
+    int32_t cmd;
     uint32_t arg;
 
-    int active;
-    int bytesleft;
+    int32_t active;
+    int32_t bytesleft;
     uint8_t tx_fifo[64];
-    int tx_start;
-    int tx_len;
+    uint32_t tx_start;
+    uint32_t tx_len;
     uint8_t rx_fifo[32];
-    int rx_start;
-    int rx_len;
+    uint32_t rx_start;
+    uint32_t rx_len;
     uint16_t resp_fifo[9];
-    int resp_len;
+    uint32_t resp_len;
 
-    int cmdreq;
+    int32_t cmdreq;
 } PXA2xxMMCIState;
 
+static bool pxa2xx_mmci_vmstate_validate(void *opaque, int version_id)
+{
+    PXA2xxMMCIState *s = opaque;
+
+    return s->tx_start < ARRAY_SIZE(s->tx_fifo)
+        && s->rx_start < ARRAY_SIZE(s->rx_fifo)
+        && s->tx_len <= ARRAY_SIZE(s->tx_fifo)
+        && s->rx_len <= ARRAY_SIZE(s->rx_fifo)
+        && s->resp_len <= ARRAY_SIZE(s->resp_fifo);
+}
+
+
+static const VMStateDescription vmstate_pxa2xx_mmci = {
+    .name = "pxa2xx-mmci",
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(status, PXA2xxMMCIState),
+        VMSTATE_UINT32(clkrt, PXA2xxMMCIState),
+        VMSTATE_UINT32(spi, PXA2xxMMCIState),
+        VMSTATE_UINT32(cmdat, PXA2xxMMCIState),
+        VMSTATE_UINT32(resp_tout, PXA2xxMMCIState),
+        VMSTATE_UINT32(read_tout, PXA2xxMMCIState),
+        VMSTATE_INT32(blklen, PXA2xxMMCIState),
+        VMSTATE_INT32(numblk, PXA2xxMMCIState),
+        VMSTATE_UINT32(intmask, PXA2xxMMCIState),
+        VMSTATE_UINT32(intreq, PXA2xxMMCIState),
+        VMSTATE_INT32(cmd, PXA2xxMMCIState),
+        VMSTATE_UINT32(arg, PXA2xxMMCIState),
+        VMSTATE_INT32(cmdreq, PXA2xxMMCIState),
+        VMSTATE_INT32(active, PXA2xxMMCIState),
+        VMSTATE_INT32(bytesleft, PXA2xxMMCIState),
+        VMSTATE_UINT32(tx_start, PXA2xxMMCIState),
+        VMSTATE_UINT32(tx_len, PXA2xxMMCIState),
+        VMSTATE_UINT32(rx_start, PXA2xxMMCIState),
+        VMSTATE_UINT32(rx_len, PXA2xxMMCIState),
+        VMSTATE_UINT32(resp_len, PXA2xxMMCIState),
+        VMSTATE_VALIDATE("fifo size incorrect", pxa2xx_mmci_vmstate_validate),
+        VMSTATE_UINT8_ARRAY(tx_fifo, PXA2xxMMCIState, 64),
+        VMSTATE_UINT8_ARRAY(rx_fifo, PXA2xxMMCIState, 32),
+        VMSTATE_UINT16_ARRAY(resp_fifo, PXA2xxMMCIState, 9),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 #define MMC_STRPCL	0x00	/* MMC Clock Start/Stop register */
 #define MMC_STAT	0x04	/* MMC Status register */
 #define MMC_CLKRT	0x08	/* MMC Clock Rate register */
@@ -405,84 +450,6 @@ static const MemoryRegionOps pxa2xx_mmci_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void pxa2xx_mmci_save(QEMUFile *f, void *opaque)
-{
-    PXA2xxMMCIState *s = (PXA2xxMMCIState *) opaque;
-    int i;
-
-    qemu_put_be32s(f, &s->status);
-    qemu_put_be32s(f, &s->clkrt);
-    qemu_put_be32s(f, &s->spi);
-    qemu_put_be32s(f, &s->cmdat);
-    qemu_put_be32s(f, &s->resp_tout);
-    qemu_put_be32s(f, &s->read_tout);
-    qemu_put_be32(f, s->blklen);
-    qemu_put_be32(f, s->numblk);
-    qemu_put_be32s(f, &s->intmask);
-    qemu_put_be32s(f, &s->intreq);
-    qemu_put_be32(f, s->cmd);
-    qemu_put_be32s(f, &s->arg);
-    qemu_put_be32(f, s->cmdreq);
-    qemu_put_be32(f, s->active);
-    qemu_put_be32(f, s->bytesleft);
-
-    qemu_put_byte(f, s->tx_len);
-    for (i = 0; i < s->tx_len; i ++)
-        qemu_put_byte(f, s->tx_fifo[(s->tx_start + i) & 63]);
-
-    qemu_put_byte(f, s->rx_len);
-    for (i = 0; i < s->rx_len; i ++)
-        qemu_put_byte(f, s->rx_fifo[(s->rx_start + i) & 31]);
-
-    qemu_put_byte(f, s->resp_len);
-    for (i = s->resp_len; i < 9; i ++)
-        qemu_put_be16s(f, &s->resp_fifo[i]);
-}
-
-static int pxa2xx_mmci_load(QEMUFile *f, void *opaque, int version_id)
-{
-    PXA2xxMMCIState *s = (PXA2xxMMCIState *) opaque;
-    int i;
-
-    qemu_get_be32s(f, &s->status);
-    qemu_get_be32s(f, &s->clkrt);
-    qemu_get_be32s(f, &s->spi);
-    qemu_get_be32s(f, &s->cmdat);
-    qemu_get_be32s(f, &s->resp_tout);
-    qemu_get_be32s(f, &s->read_tout);
-    s->blklen = qemu_get_be32(f);
-    s->numblk = qemu_get_be32(f);
-    qemu_get_be32s(f, &s->intmask);
-    qemu_get_be32s(f, &s->intreq);
-    s->cmd = qemu_get_be32(f);
-    qemu_get_be32s(f, &s->arg);
-    s->cmdreq = qemu_get_be32(f);
-    s->active = qemu_get_be32(f);
-    s->bytesleft = qemu_get_be32(f);
-
-    s->tx_len = qemu_get_byte(f);
-    s->tx_start = 0;
-    if (s->tx_len >= sizeof(s->tx_fifo) || s->tx_len < 0)
-        return -EINVAL;
-    for (i = 0; i < s->tx_len; i ++)
-        s->tx_fifo[i] = qemu_get_byte(f);
-
-    s->rx_len = qemu_get_byte(f);
-    s->rx_start = 0;
-    if (s->rx_len >= sizeof(s->rx_fifo) || s->rx_len < 0)
-        return -EINVAL;
-    for (i = 0; i < s->rx_len; i ++)
-        s->rx_fifo[i] = qemu_get_byte(f);
-
-    s->resp_len = qemu_get_byte(f);
-    if (s->resp_len > 9 || s->resp_len < 0)
-        return -EINVAL;
-    for (i = s->resp_len; i < 9; i ++)
-         qemu_get_be16s(f, &s->resp_fifo[i]);
-
-    return 0;
-}
-
 PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 hwaddr base,
                 BlockBackend *blk, qemu_irq irq,
@@ -556,13 +523,17 @@ static void pxa2xx_mmci_instance_init(Object *obj)
     qdev_init_gpio_out_named(dev, &s->rx_dma, "rx-dma", 1);
     qdev_init_gpio_out_named(dev, &s->tx_dma, "tx-dma", 1);
 
-    register_savevm(NULL, "pxa2xx_mmci", 0, 0,
-                    pxa2xx_mmci_save, pxa2xx_mmci_load, s);
-
     qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
                         TYPE_PXA2XX_MMCI_BUS, DEVICE(obj), "sd-bus");
 }
 
+static void pxa2xx_mmci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_pxa2xx_mmci;
+}
+
 static void pxa2xx_mmci_bus_class_init(ObjectClass *klass, void *data)
 {
     SDBusClass *sbc = SD_BUS_CLASS(klass);
@@ -576,6 +547,7 @@ static const TypeInfo pxa2xx_mmci_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PXA2xxMMCIState),
     .instance_init = pxa2xx_mmci_instance_init,
+    .class_init = pxa2xx_mmci_class_init,
 };
 
 static const TypeInfo pxa2xx_mmci_bus_info = {
-- 
1.9.1

