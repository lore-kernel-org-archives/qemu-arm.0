Received: by 10.223.172.38 with SMTP id v35csp4141839wrc;
        Mon, 18 Sep 2017 12:56:59 -0700 (PDT)
X-Received: by 10.55.143.129 with SMTP id r123mr21834478qkd.9.1505764618970;
        Mon, 18 Sep 2017 12:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764618; cv=none;
        d=google.com; s=arc-20160816;
        b=eqnrXv5qGE/VDpkEUUB2wvGkw5PN/68hMsulJN1x6rx5SGJhbpStlYS0Fl9f2cO/HY
         q+iFpW0JXIM6GevxeHPQWSwyqw8iNPSFi5zxA7b9yztl3AKjiMNwVWPJTL9bPeI38P/G
         GzI7U3Jts7vqkUa40hy/Nbx+DoQ+7d6IdDOqoy86FuVe3ZlNDIeqsD0llQsyz9vR7Fxu
         KOJ8t2S+Md71PJZ3UDG8uNa6dHl5Zez4BQqIEk4QNcrlPWqOoQvPlzVtE2nYG7wtF1NO
         ElEMZ7hHzSunohrXqTwwgQMTdaS+EakksRuKhvgkObN2ImOob8vFn0brMTJXpNgycJYs
         PZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=1FZYThZcvEKwD8CQazehQwvfTizUwANxhisZI+lJUFc=;
        b=NkTm9vbt6DUmICbPljfrR64DP/JGaEU3vWlMhiynJqN+B+mjoV0dFtyXCpWZEBZtA1
         mcgO7ebfIKDIz6q61LmsYCasZ87jCgjxw9IMJHW3fwOQ8f4iMU/IOUMl9tqWRZlvIUdw
         RLhIC1/oHmCixjHUj2mkbeStRkHZTNbiZJN4QjFVD3CxftDTwZc88dM40dCZiV+pLtyn
         0ayOa2X4tajP25+wPflbZXT3dHZLyB3TtSCVaiE7SeXc/36yx/35EzAvsN2yHhvICD6W
         l1NyeLHxFysyoU0TVFOZ6wulCUbpt5IjC3eEkDOKjczmmkm79RcjqqEhDd3tkaVuVSWi
         UMxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tqr68R1T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o7si1869500qkc.218.2017.09.18.12.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tqr68R1T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du2A4-0002jE-Is
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:56:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du250-00070D-EK
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 15:51:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24z-0006Na-5q
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 15:51:42 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:38193)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24t-0006Iw-UQ; Mon, 18 Sep 2017 15:51:36 -0400
Received: by mail-pg0-x242.google.com with SMTP id m30so769426pgn.5;
	Mon, 18 Sep 2017 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1FZYThZcvEKwD8CQazehQwvfTizUwANxhisZI+lJUFc=;
	b=tqr68R1T6fZEojpzsKidmWyKgXgk2CEfBcGaJdFbOYNIotZTr2lyuwF7vw2rr/2wM6
	1z0/WUfhggzPq6MBJkL72PExNYZ43XIPTFhxt9S+WtEeZsPmrWL51h29aZ6mi6aPbGhW
	k0PcD2+hGls+WDNta5YWsmciyRat72qrrzszAexsjcjW+FvRAts7FIvYnx5IbqZX8vSF
	7JGF4jN4GxfTtzMW8Tw4OMJGQHOFh4mRgOWrXQck1rMqCy3wADDQaibBjceFBuCqIrp7
	fZ5KzKdCssH24/UiEILAzgZKELo2P7pm54MXyr4gnZTkrKRO/C2oW4ym1z/Npf/x5HHf
	0OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1FZYThZcvEKwD8CQazehQwvfTizUwANxhisZI+lJUFc=;
	b=lgqXhMhGMXPhJiQHKhYn4XZo93bSwIwsw1Xdr8pz10LpFaDvkJk3wIeNrxw7ixNLI4
	z3VSpijnuhkC44/f9CbLMVwSngXNh5dRiBKndLcGjbgV3HwEPZtkXx9jObGFwYcVTdfp
	vONv3ZXleGvyjohmV8Rcb/VzAuki5Rg/cNYPLd0/BqEs0ROXc43AKa3a/NXITaCcKwHk
	jT0/CF9GjISzQPxoV4UwSlLtHoiMK7OOsRO9DZbau52rd4gY432l05oybYfh+F3F62b0
	YAFXKSQ5q1fcIi1XEjGFe/yKsCwZ4gNIaTwqJfTmQxm8Qv/6qfdpVOCBnQxHT82jyrLF
	K1Rg==
X-Gm-Message-State: AHPjjUi5pZJ5swsLbEMWC5Etf8kiwAFPnuujDyazAFoBnVryQzjMVdED
	x5C7INgoBVxEhsPxLMk=
X-Google-Smtp-Source: ADKCNb5PktKLumCB64gHHo+6o9FU8xZFFWeHbeidKX+0ewmHPj7Rgs+lqHD4bnCUgOIiX3oYk4okhw==
X-Received: by 10.84.234.197 with SMTP id i5mr37544648plt.184.1505764294770;
	Mon, 18 Sep 2017 12:51:34 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:33 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:53 -0700
Message-Id: <20170918195100.17593-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH 10/17] sdhci: Add i.MX specific subtype of SDHCI
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tuysltTWdbeB

IP block found on several generations of i.MX family does not use
vanilla SDHCI implementation and it comes with a number of quirks.

Introduce i.MX SDHCI subtype of SDHCI block to add code necessary to
support unmodified Linux guest driver.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/sd/sdhci-internal.h |  15 ++++++
 hw/sd/sdhci.c          | 123 ++++++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/sd/sdhci.h  |   8 ++++
 3 files changed, 144 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 161177cf39..7b9ed06c36 100644
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
+#define ESDHC_MIX_CTRL			0x48
+#define ESDHC_VENDOR_SPEC		0xc0
+#define ESDHC_DLL_CTRL			0x60
+
+#define ESDHC_TUNING_CTRL		0xcc
+#define ESDHC_TUNE_CTRL_STATUS		0x68
+#define ESDHC_WTMK_LVL			0x44
+
+#define ESDHC_CTRL_4BITBUS		(0x1 << 1)
+#define ESDHC_CTRL_8BITBUS		(0x2 << 1)
+
+
 #endif
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 6d6a791ee9..73e7910ba9 100644
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
@@ -1386,11 +1389,127 @@ static const TypeInfo sdhci_bus_info = {
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
+        if (s->hostctl & SDHC_CTRL_8BITBUS)
+            hostctl |= ESDHC_CTRL_8BITBUS;
+
+        if (s->hostctl & SDHC_CTRL_4BITBUS)
+            hostctl |= ESDHC_CTRL_4BITBUS;
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
+        if (value & ESDHC_CTRL_8BITBUS)
+            hostctl |= SDHC_CTRL_8BITBUS;
+
+        if (value & ESDHC_CTRL_4BITBUS)
+            hostctl |= ESDHC_CTRL_4BITBUS;
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
index 0f0c3f1e64..903472c901 100644
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
+#define SDHCI_QUIRK_NO_BUSY_IRQ				(1<<14)
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
2.13.5

