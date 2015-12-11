Received: by 10.182.158.201 with SMTP id ww9csp179354obb;
        Fri, 11 Dec 2015 08:53:37 -0800 (PST)
X-Received: by 10.140.17.213 with SMTP id 79mr24761304qgd.49.1449852817064;
        Fri, 11 Dec 2015 08:53:37 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j10si3440863qge.77.2015.12.11.08.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Dec 2015 08:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7Qwq-00045h-R9
	for alex.bennee@linaro.org; Fri, 11 Dec 2015 11:53:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7QrJ-0003EL-9G
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 11:47:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7QrI-0000ov-2J
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 11:47:53 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59114)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7QrH-0000oF-Qs; Fri, 11 Dec 2015 11:47:52 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7Qgx-0001J9-O7; Fri, 11 Dec 2015 16:37:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 11 Dec 2015 16:37:10 +0000
Message-Id: <1449851831-4966-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Kevin O'Connor <kevin@koconnor.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	patches@linaro.org, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [Qemu-devel] [PATCH 09/10] hw/sd/pxa2xx_mmci: Convert to
	VMStateDescription
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
X-TUID: 5LyaEHUB4PBA

Convert the pxa2xx_mmci device from manual save/load
functions to a VMStateDescription structure.

This is a migration compatibility break.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 148 ++++++++++++++++++++--------------------------------
 1 file changed, 56 insertions(+), 92 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index a30be2b..81fec4d 100644
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
+    return s->tx_start < sizeof(s->tx_fifo)
+        && s->rx_start < sizeof(s->rx_fifo)
+        && s->tx_len <= sizeof(s->tx_fifo)
+        && s->rx_len <= sizeof(s->rx_fifo)
+        && s->resp_len <= sizeof(s->resp_fifo);
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
@@ -555,9 +522,6 @@ static void pxa2xx_mmci_instance_init(Object *obj)
     sysbus_init_irq(sbd, &s->rx_dma);
     sysbus_init_irq(sbd, &s->tx_dma);
 
-    register_savevm(NULL, "pxa2xx_mmci", 0, 0,
-                    pxa2xx_mmci_save, pxa2xx_mmci_load, s);
-
     qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
                         TYPE_PXA2XX_MMCI_BUS, DEVICE(obj), "sd-bus");
 }
-- 
1.9.1

