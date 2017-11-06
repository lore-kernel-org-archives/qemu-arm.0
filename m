Received: by 10.223.150.237 with SMTP id u100csp2787154wrb;
        Mon, 6 Nov 2017 07:52:57 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RtdzGw3B7jNI6R1X8pyoCHXrTcJwSduREtrg/inHq2jZcd3C5qwaSf9DTZHK3coVWjyR2e
X-Received: by 10.13.211.70 with SMTP id v67mr9875275ywd.406.1509983577664;
        Mon, 06 Nov 2017 07:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983577; cv=none;
        d=google.com; s=arc-20160816;
        b=Dc+J6yWE7Deo+ONFqro5ykItALapFzFW7A7Yw1G8KlZxQuxYj0BiOpKTb1IIjHwqSi
         qxwh+C8EmsQmzI9WE+iSGc5uOiq07FSSeA5uHiHGQqMuT35WbQD5Ogyt1YIFuZbrutT7
         6fcvazsExIxOrsbllEkAM3vNWnFi2CdfFLaLteWBL+NJMOcHZ8aOgz5FyOD37hAnhAMT
         QfY26ciuEsu41kxzykkTFFamBOH0mMH4Uu27TkCaIsCshUKEWJl2VEJCk7pWkT0Ae1/p
         n/fvgrgtHYf9tFJe6ub/rGrSsYBwlF/rXUN88p1BW+LoKdY6n5NwxXbOtuWAGY+3iUB1
         OetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=tleVG89WtlDFoYwGCol9/WxgRqfmM7zTDVbzR26R+oo=;
        b=dKB7dY8tE58WZZBj/gQUEnDLEazT52smrOIu8XlUVFbjLIVr24xg3n0Iok0/aA7DSN
         1tbD6+mlqrHuFNlyQmhQPEzXgpbN1FlngsjFDGFb1qRAj1Q+t/vjppksoedBfO0hyX1T
         9FYkxNwLEpcca/0vocbSUuzAAxLhsXrEuVw2eIx+CM7YCiO42Ml93Z2b7LdwovnZqeul
         /AkOP7vTYxyIwrh7P17nOJXH44hhOtxnY5Z4eH4aR0aEbN7O1535vKicxVBtGj8R8btZ
         M4NM21wpWN4Q84jEIhkfBD9Hz5ObB8APrVWJsyOoKp+69xFRN45mOl3VgocsUgorjkG2
         jYhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cGcD8QSt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f14si2688234ybk.534.2017.11.06.07.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:52:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cGcD8QSt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjhp-0002LZ-3j
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:52:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdj-00079V-78
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdh-0000U8-UW
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:43 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:50405)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdh-0000Tn-MS; Mon, 06 Nov 2017 10:48:41 -0500
Received: by mail-pf0-x242.google.com with SMTP id b6so8016747pfh.7;
	Mon, 06 Nov 2017 07:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tleVG89WtlDFoYwGCol9/WxgRqfmM7zTDVbzR26R+oo=;
	b=cGcD8QStnUYfrL7u2QTMMmXMVZTtumNuhm9KW7ypDWzVdCfKELaDeCIyysY/9wDXeT
	EVDYOkDCj+3pa0s+hzgM3J+VEuhVOWyqJyLr/qmD4r38W0qPZW7qc4TjjY5bOl+r1Sdj
	grrAKvpqsM4vOOj3/S7/SEqxoawZ+G2wxrDuR0ch3rDwvkxpcq6WvqtOZBtU2OxzxhEM
	xSngVbo+b9VBjBfg7W4Iw+pqkU7MiTSMioVZF6MR+n3TxyeZCVmTTyuEPLho+9oNay3S
	Fgjd7JOZh0sABqWC0bWJXteZvMAmvXxbu7hBkYBpeexOhg3LmknxwN/dRTB3LpWcHOwe
	sZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tleVG89WtlDFoYwGCol9/WxgRqfmM7zTDVbzR26R+oo=;
	b=ts/q1h9S8u65SO/FrNf02dnQNoQvk0YmdjEQTyO+A57WHP4KGnjRGRC24S7eQAWVvZ
	dlDunKqGg9pXnM5glKbUmlYaA7mlZEX5iP/GtygnjLfGiwYCkWD0ie4iUxX4tNYvBTHL
	G9XyuyOLW33N7QJdGQuAxnaAGcPFSZMIFNnffYQ9IIehq7ALcR3OY1KjjF/sNE6ntsrr
	KSFgbesb6ZEFf9OvS37uaLNj3DX7+vDSh9FcSId5oTtcPywt/vlSJL58gtJzTzGBe/ah
	TP0Jf2TtfUe81I4sOmQyNBlRbUvuF2f6vH1bNx9/yBnJt3GPvrFY1dOEykuuPF0Sx2EC
	TTKQ==
X-Gm-Message-State: AMCzsaU+Bs7XZNzXeNAlBcknmzVNM13Rc17JN/9QSNvfHwMlYDZTqpuR
	weApxENsGyJvUxpZEa+j/+M5c3aS7Rs=
X-Received: by 10.159.195.7 with SMTP id bd7mr15331078plb.366.1509983320306;
	Mon, 06 Nov 2017 07:48:40 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:39 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:54 -0800
Message-Id: <20171106154813.19936-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v3 11/30] sdhci: Add i.MX specific subtype of
 SDHCI
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TKqihtfV9l0v

IP block found on several generations of i.MX family does not use
vanilla SDHCI implementation and it comes with a number of quirks.

Introduce i.MX SDHCI subtype of SDHCI block to add code necessary to
support unmodified Linux guest driver.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/sd/sdhci-internal.h |  15 ++++++
 hw/sd/sdhci.c          | 127 ++++++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/sd/sdhci.h  |   8 ++++
 3 files changed, 148 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 161177cf39..2a1b4b06ee 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -91,6 +91,8 @@
 #define SDHC_CTRL_ADMA2_32             0x10
 #define SDHC_CTRL_ADMA2_64             0x18
 #define SDHC_DMA_TYPE(x)               ((x) & SDHC_CTRL_DMA_CHECK_MASK)
+#define SDHC_CTRL_4BITBUS              0x02
+#define SDHC_CTRL_8BITBUS              0x20
 
 /* R/W Power Control Register 0x0 */
 #define SDHC_PWRCON                    0x29
@@ -229,4 +231,17 @@ enum {
 
 extern const VMStateDescription sdhci_vmstate;
 
+
+#define ESDHC_MIX_CTRL                  0x48
+#define ESDHC_VENDOR_SPEC               0xc0
+#define ESDHC_DLL_CTRL                  0x60
+
+#define ESDHC_TUNING_CTRL               0xcc
+#define ESDHC_TUNE_CTRL_STATUS          0x68
+#define ESDHC_WTMK_LVL                  0x44
+
+#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
+#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
+
+
 #endif
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 6d6a791ee9..f561cc44e3 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -265,7 +265,8 @@ static void sdhci_send_command(SDHCIState *s)
             }
         }
 
-        if ((s->norintstsen & SDHC_NISEN_TRSCMP) &&
+        if (!(s->quirks & SDHCI_QUIRK_NO_BUSY_IRQ) &&
+            (s->norintstsen & SDHC_NISEN_TRSCMP) &&
             (s->cmdreg & SDHC_CMD_RESPONSE) == SDHC_CMD_RSP_WITH_BUSY) {
             s->norintsts |= SDHC_NIS_TRSCMP;
         }
@@ -1191,6 +1192,8 @@ static void sdhci_initfn(SDHCIState *s)
 
     s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
+
+    s->io_ops = &sdhci_mmio_ops;
 }
 
 static void sdhci_uninitfn(SDHCIState *s)
@@ -1347,7 +1350,7 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
     sysbus_init_irq(sbd, &s->irq);
-    memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
+    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
             SDHC_REGISTERS_MAP_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
 }
@@ -1386,11 +1389,131 @@ static const TypeInfo sdhci_bus_info = {
     .class_init = sdhci_bus_class_init,
 };
 
+static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
+{
+    SDHCIState *s = SYSBUS_SDHCI(opaque);
+    uint32_t ret;
+    uint16_t hostctl;
+
+    switch (offset) {
+    default:
+        return sdhci_read(opaque, offset, size);
+
+    case SDHC_HOSTCTL:
+        hostctl = SDHC_DMA_TYPE(s->hostctl) << 5;
+
+        if (s->hostctl & SDHC_CTRL_8BITBUS) {
+            hostctl |= ESDHC_CTRL_8BITBUS;
+        }
+
+        if (s->hostctl & SDHC_CTRL_4BITBUS) {
+            hostctl |= ESDHC_CTRL_4BITBUS;
+        }
+
+        ret = hostctl | (s->blkgap << 16) |
+            (s->wakcon << 24);
+
+        break;
+
+    case ESDHC_DLL_CTRL:
+    case ESDHC_TUNE_CTRL_STATUS:
+    case 0x6c:
+    case ESDHC_TUNING_CTRL:
+    case ESDHC_VENDOR_SPEC:
+    case ESDHC_MIX_CTRL:
+    case ESDHC_WTMK_LVL:
+        ret = 0;
+        break;
+    }
+
+    return ret;
+}
+
+static void
+usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+{
+    SDHCIState *s = SYSBUS_SDHCI(opaque);
+    uint8_t hostctl = 0;
+    uint32_t value = (uint32_t)val;
+
+    switch (offset) {
+    case ESDHC_DLL_CTRL:
+    case ESDHC_TUNE_CTRL_STATUS:
+    case 0x6c:
+    case ESDHC_TUNING_CTRL:
+    case ESDHC_WTMK_LVL:
+    case ESDHC_VENDOR_SPEC:
+        break;
+
+    case SDHC_HOSTCTL:
+        if (value & ESDHC_CTRL_8BITBUS) {
+            hostctl |= SDHC_CTRL_8BITBUS;
+        }
+
+        if (value & ESDHC_CTRL_4BITBUS) {
+            hostctl |= ESDHC_CTRL_4BITBUS;
+        }
+
+        hostctl |= SDHC_DMA_TYPE(value >> 5);
+
+        value &= ~0xFE;
+        value |= hostctl;
+        value &= ~0xFF00;
+        value |= s->pwrcon;
+
+        sdhci_write(opaque, offset, value, size);
+        break;
+
+    case ESDHC_MIX_CTRL:
+        /*
+         * The layout of the register is slightly different, but we
+         * don't care about those bits
+         */
+        s->trnmod = value & 0xFFFF;
+        break;
+    case SDHC_TRNMOD:
+        sdhci_write(opaque, offset, val | s->trnmod, size);
+        break;
+    case SDHC_BLKSIZE:
+        val |= 0x7 << 12;
+    default:                    /* FALLTHROUGH */
+        sdhci_write(opaque, offset, val, size);
+        break;
+    }
+}
+
+
+static const MemoryRegionOps usdhc_mmio_ops = {
+    .read = usdhc_read,
+    .write = usdhc_write,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+        .unaligned = false
+    },
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void imx_usdhc_init(Object *obj)
+{
+    SDHCIState *s = SYSBUS_SDHCI(obj);
+
+    s->io_ops = &usdhc_mmio_ops;
+    s->quirks = SDHCI_QUIRK_NO_BUSY_IRQ;
+}
+
+static const TypeInfo imx_usdhc_info = {
+    .name = TYPE_IMX_USDHC,
+    .parent = TYPE_SYSBUS_SDHCI,
+    .instance_init = imx_usdhc_init,
+};
+
 static void sdhci_register_types(void)
 {
     type_register_static(&sdhci_pci_info);
     type_register_static(&sdhci_sysbus_info);
     type_register_static(&sdhci_bus_info);
+    type_register_static(&imx_usdhc_info);
 }
 
 type_init(sdhci_register_types)
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 0f0c3f1e64..dc1856a33d 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -39,6 +39,7 @@ typedef struct SDHCIState {
     };
     SDBus sdbus;
     MemoryRegion iomem;
+    const MemoryRegionOps *io_ops;
 
     QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
     QEMUTimer *transfer_timer;
@@ -83,8 +84,13 @@ typedef struct SDHCIState {
     /* Force Event Auto CMD12 Error Interrupt Reg - write only */
     /* Force Event Error Interrupt Register- write only */
     /* RO Host Controller Version Register always reads as 0x2401 */
+
+    unsigned long quirks;
 } SDHCIState;
 
+/* Controller does not provide transfer-complete interrupt when not busy */
+#define SDHCI_QUIRK_NO_BUSY_IRQ    BIT(14)
+
 #define TYPE_PCI_SDHCI "sdhci-pci"
 #define PCI_SDHCI(obj) OBJECT_CHECK(SDHCIState, (obj), TYPE_PCI_SDHCI)
 
@@ -92,4 +98,6 @@ typedef struct SDHCIState {
 #define SYSBUS_SDHCI(obj)                               \
      OBJECT_CHECK(SDHCIState, (obj), TYPE_SYSBUS_SDHCI)
 
+#define TYPE_IMX_USDHC "imx-usdhc"
+
 #endif /* SDHCI_H */
-- 
2.13.6

