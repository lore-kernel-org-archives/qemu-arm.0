Received: by 10.223.161.27 with SMTP id o27csp236350wro;
        Mon, 23 Oct 2017 13:20:29 -0700 (PDT)
X-Received: by 10.129.230.7 with SMTP id u7mr1602791ywl.256.1508790029562;
        Mon, 23 Oct 2017 13:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790029; cv=none;
        d=google.com; s=arc-20160816;
        b=gKAMHcWoDDeRTxfWuoJF0lfElYH+pLs0QpChvH/31u0sFB6vSyHUPsjerqZHRxU1rO
         ENJQ3X/hAiCOIJVjc+4+D2f0FByaZlFf5RULcae5OPnVMaXCkM5aG8SLvSHBElt4dkg/
         uMvVxCiDxqoYMCyId5Y7QAoxgjMGrkVkrlbdc/i+C3uFkQP6XzM/TRyj7eTtKeehTtwg
         KBLjK/YZ9PPqHnEszvNxpP08qfuwNk+BFrwmeYE0OyVIxWqYrY9ISw0cl4S625m/QWLF
         xtQLroMj3ueWM+QLda693XqvXvCBSh2mTHLogZEupyms79WHXUfJRWfvBAnuUgHXtRE4
         9DVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=UpS13s4/84eJT9cGCxasFbn8z0/uatZWg8ODcZLEM/Q=;
        b=LlKAH0xbmNUS8x8vs0v45yZguRdpHOeS2x0Htypc++r3yMTRc5U4Hch860Zt3XvhqB
         hvmIkD0s1/sqAQO3FF3Cm3X3oim5AB4WFXwS7g2Ov2ZEuAHrdN6pbUq2/v3/3Ja8/3I2
         URexqfdK8CFHFRFYvCT+m+oiy9PkBtb28xwKM3Fcb/SMXiTeaobnJysK33B+2oZ4+3KY
         7akCZId8OfkTrLnqQ0oxmm6lPtem0PZZC9PQ0PsYK6KBxlAO4boLy3lwgogVzoNWsGuY
         TxA2VdRcz8qeiL91BDr89s9cOYl0Ps3QP1gt41Cqc1JS7kh9ELKiT5coLVdyZkgu0yWU
         PtDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a57QoLUf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x9si1414327ywg.147.2017.10.23.13.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:20:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a57QoLUf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40421 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jD2-0007ov-QA
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:20:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4L-0000I9-Vf
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4K-0002W7-HL
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:29 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:48417)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4K-0002Vc-9l; Mon, 23 Oct 2017 16:11:28 -0400
Received: by mail-pf0-x241.google.com with SMTP id b79so17925656pfk.5;
	Mon, 23 Oct 2017 13:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UpS13s4/84eJT9cGCxasFbn8z0/uatZWg8ODcZLEM/Q=;
	b=a57QoLUfef1KgJXhxhnjRJ1n0qYP6DmexWoOB4NpbPdIflB4qsGS2uNfmRg6VVb8xx
	kFRAlUv1k7D/SF9voaFCKBzKDm+/vjECE1nzTkgWEB1+zOAb6g0Oal7R9uQ+VJY7qmxM
	wcjnwYC2dxZZyCpw5SYrNSIVxPnU6hP5eyW3lgys6Rf/ZMdCTkaZx4sHeapBjrwsISii
	HTH9codZ+2vATWmCo8htbYFnvi7oYFvP/R66zQnB6/GimdnD64NlPf+1Og5TlzjHAZm4
	rMiyidUm0ZVJDe9SbdL+q9bWxg6sEXtLqpOXlcA84+9QqOqzy1HWbtBtZ1BpzJ8CqGNt
	bCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UpS13s4/84eJT9cGCxasFbn8z0/uatZWg8ODcZLEM/Q=;
	b=PTOUVZab2R+zkZ6a7eKmb3rBtAHUdjmoFlZk3iG/x+yelq4YTMrF54N5sVx9DlkH48
	fPqZx0V0c0WngXVtbsAiilIayyOUEPmyvHYop+0aqWdvyoFq0n5ABxelFFmyKO5w2iZg
	Jh54fPeNaWgLc45o2mChwWfDhP/D43+29gVt+hoe/qX6/3nfTJKrn/sCsT9lMH6X2QIZ
	zUePKQ2twFUuOAPELn3XF6AWGDJAWIEafPXur0r72yCf9ztzTgev9bGMdGGczNUjWnnt
	Xqa7h2EFl23mtZPu9rJVseC8Cm11/zFUxKJTqYgie4yvhOn35vlCvV8RCv3zHA4B0BBI
	Cfyw==
X-Gm-Message-State: AMCzsaX2Iq87Dm+KH2K8QoF5uU3Fs52EsUjJJiD8tOQAOWeJIdl4CK/A
	SfiKsl66+Q9nD/I6lZimHfRK6qc/
X-Google-Smtp-Source: ABhQp+Q1I+Xf7iLwnVQrbbtcoERxflP952bd0puHh4w7DwETpQEKWu4Up6e+8VdUl6aiggrVK2honQ==
X-Received: by 10.98.207.71 with SMTP id b68mr14082780pfg.125.1508789487211;
	Mon, 23 Oct 2017 13:11:27 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:26 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:39 -0700
Message-Id: <20171023201055.21973-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 11/27] sdhci: Add i.MX specific subtype of
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
X-TUID: DodIRMKcWhNj

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
2.13.5

