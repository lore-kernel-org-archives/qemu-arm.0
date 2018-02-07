Received: by 10.28.71.27 with SMTP id u27csp238319wma;
        Tue, 6 Feb 2018 20:25:38 -0800 (PST)
X-Google-Smtp-Source: AH8x225hIHOgdc0X4ve9/pL9k4NE5XUrm0Zo/stTzQa78i+WgPv5bmHnAJ8SnLw77i34z3s6XzQS
X-Received: by 10.37.135.78 with SMTP id e14mr3182588ybn.38.1517977538417;
        Tue, 06 Feb 2018 20:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977538; cv=none;
        d=google.com; s=arc-20160816;
        b=wlwcqImI6nQii6aav5xE2IYQ8/i9LSZo//9XCWZ0iz/EfWPdKxd9oDeZ0oK7sUQm7y
         CC3LDk3i6GLqdMP1mcFBPBz+zeqG8Cqhj2pZkBmM4lf3U5rpFKO3ykPFs/80BoMS9H02
         iMniZcLpmnibk/bhRSjwN6PID4wY5mtMju167ELdVmlahVAiPS7QrrSg9m62jo212iUq
         B8iuTYsQ+zgTmpeaAF3t5bp4+dVQY+8Un9XQwRlB3tlW1vwTxZIQbIkSD5yjypPDIj+X
         /2KN5ak1PD2fsf/g/iFaHbl0UgI5BL7GyPFgR46LrTAqPLCWRN4PMDSpi7Xo2BXJZYd0
         lgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=SMMgHA4bgvKbgRuEX+Zt3WV5iE7JIAfsivE6bGQis84=;
        b=l7zqs0uTIWonN4QklxJok2KTNFAKaTLegdEXMp/evDPyj5VoLdmh9G+lzMjgU2uhkM
         iGpt/EzukcMsJE+3NRVHg0rAOg9rsWeTiY2cQAbVtQeVR1wiy7LZZHhqKoFv6LNlAbd6
         6mdHNFCcv5IIe7Q4LXElEy2xL2GxMIYIoB3LH9tt9Uvq69tKd3bCQiUi73xK2vNBMMvf
         miJgUqIqxlDOfh0ofpU8s0ZkdBAUtH5uuiUdNkZodcoqi2ZJGGo60WwUpVZ7W7bg0BvB
         MRng2ZWMLiMlLrzKiM2X2SoVejH3FdBhtTZiinZhuUiBf9NpQd7Lb6WPqIdl4Jtk3KxE
         +uVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hW1F5zke;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c25si117010ybe.156.2018.02.06.20.25.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:25:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hW1F5zke;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHIf-0000QC-Ln
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:25:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIC-0008WA-8J
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIA-00034I-GU
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:08 -0500
Received: from mail-pl0-x22b.google.com ([2607:f8b0:400e:c01::22b]:36903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHIA-000343-6y; Tue, 06 Feb 2018 23:25:06 -0500
Received: by mail-pl0-x22b.google.com with SMTP id ay8so2731237plb.4;
	Tue, 06 Feb 2018 20:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SMMgHA4bgvKbgRuEX+Zt3WV5iE7JIAfsivE6bGQis84=;
	b=hW1F5zkeX9/SNj06YWnrvQmQ3CEqR+INByFETT/wUn1k2pvb3d0D26BISjIgWRxCxW
	527mewM3LY1LBhilWGyYG461ijmA5fPFdfF6BlzZrH/k6D7eqgGmIXX1W+G9ka5LbFYs
	p0jVQEhh+eya7KhGrHM6cJii5Q1VYc1eFDEMhzDjVhcL2XOuFBi2V/ghAyOI8TUsna9A
	xGp0HHupQrCy303ipgRFfvyRmfrW15QuniV6AEdZG0fV6fWWOmJxhjXrkaSVrRRoVDGX
	g/qN7oZAffQ4lMmURRbCJDJmj9e2uCJiJMK6sZtofjUDPzdfzD09Ezegg40XeGau0MND
	7FaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SMMgHA4bgvKbgRuEX+Zt3WV5iE7JIAfsivE6bGQis84=;
	b=WZzHvvp3c9yeBwdCZy8y2gjNO5eYvX7X7bBhrhs/3V3RgSRm/o9TS6MEkwR/JH2TFG
	0SR14rFf5zY9Atwq8SFBUK37Nm3GIoz6jC+nTgQLe9kSAuDSU1/Hkp3xhdx2e7KW7s31
	g9LuH9l+Sdkq/aghFf/yYrKwiOJOg4zwLorbpl+1VCXpnVGW911swpTNLiv6VyObAZTn
	SH8DmH5c4QerAmSg4Y+P2BTOxeY5BYtISpQgrY87VtIUUpsXspRsUcMBjOC6y4SbhUq+
	StYyDUYa/I5yQ1pu8/WJUDotUfqaJp+VzHGdhuv6E/f0xO/PXl0qEK0EdEujWFe6gyKa
	fXbQ==
X-Gm-Message-State: APf1xPD+nreWYWbOG3RdidO8/tuH3gvVOKzkXOtvhtJrj4AV2dxluET2
	iU4ETMclSgwqnFhdvz0Sk3Zr8RrG
X-Received: by 2002:a17:902:6b49:: with SMTP id
	g9-v6mr4688708plt.9.1517977504849; 
	Tue, 06 Feb 2018 20:25:04 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:04 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:25 -0800
Message-Id: <20180207042438.15422-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22b
Subject: [Qemu-arm] [PATCH v5 01/14] sdhci: Add i.MX specific subtype of
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i7SMZ3HvC4Jr

IP block found on several generations of i.MX family does not use
vanilla SDHCI implementation and it comes with a number of quirks.

Introduce i.MX SDHCI subtype of SDHCI block to add code necessary to
support unmodified Linux guest driver.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/sd/sdhci-internal.h |  20 +++++
 hw/sd/sdhci.c          | 230 ++++++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/sd/sdhci.h  |  13 +++
 3 files changed, 262 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index fc807f08f3..f91b73af59 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -84,12 +84,18 @@
 
 /* R/W Host control Register 0x0 */
 #define SDHC_HOSTCTL                   0x28
+#define SDHC_CTRL_LED                  0x01
 #define SDHC_CTRL_DMA_CHECK_MASK       0x18
 #define SDHC_CTRL_SDMA                 0x00
 #define SDHC_CTRL_ADMA1_32             0x08
 #define SDHC_CTRL_ADMA2_32             0x10
 #define SDHC_CTRL_ADMA2_64             0x18
 #define SDHC_DMA_TYPE(x)               ((x) & SDHC_CTRL_DMA_CHECK_MASK)
+#define SDHC_CTRL_4BITBUS              0x02
+#define SDHC_CTRL_8BITBUS              0x20
+#define SDHC_CTRL_CDTEST_INS           0x40
+#define SDHC_CTRL_CDTEST_EN            0x80
+
 
 /* R/W Power Control Register 0x0 */
 #define SDHC_PWRCON                    0x29
@@ -226,4 +232,18 @@ enum {
     sdhc_gap_write  = 2   /* SDHC stopped at block gap during write operation */
 };
 
+extern const VMStateDescription sdhci_vmstate;
+
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
 #endif
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index fac7fa5c72..7c9683b47d 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -244,7 +244,8 @@ static void sdhci_send_command(SDHCIState *s)
             }
         }
 
-        if ((s->norintstsen & SDHC_NISEN_TRSCMP) &&
+        if (!(s->quirks & SDHCI_QUIRK_NO_BUSY_IRQ) &&
+            (s->norintstsen & SDHC_NISEN_TRSCMP) &&
             (s->cmdreg & SDHC_CMD_RESPONSE) == SDHC_CMD_RSP_WITH_BUSY) {
             s->norintsts |= SDHC_NIS_TRSCMP;
         }
@@ -1189,6 +1190,8 @@ static void sdhci_initfn(SDHCIState *s)
 
     s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
+
+    s->io_ops = &sdhci_mmio_ops;
 }
 
 static void sdhci_uninitfn(SDHCIState *s)
@@ -1396,6 +1399,10 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
     }
 
     sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
+            SDHC_REGISTERS_MAP_SIZE);
+
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
@@ -1447,11 +1454,232 @@ static const TypeInfo sdhci_bus_info = {
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
+        /*
+         * For a detailed explanation on the following bit
+         * manipulation code see comments in a similar part of
+         * usdhc_write()
+         */
+        hostctl = SDHC_DMA_TYPE(s->hostctl) << (8 - 3);
+
+        if (s->hostctl & SDHC_CTRL_8BITBUS) {
+            hostctl |= ESDHC_CTRL_8BITBUS;
+        }
+
+        if (s->hostctl & SDHC_CTRL_4BITBUS) {
+            hostctl |= ESDHC_CTRL_4BITBUS;
+        }
+
+        ret  = hostctl;
+        ret |= (uint32_t)s->blkgap << 16;
+        ret |= (uint32_t)s->wakcon << 24;
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
+    uint8_t hostctl;
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
+        /*
+         * Here's What ESDHCI has at offset 0x28 (SDHC_HOSTCTL)
+         *
+         *       7         6     5      4      3      2        1      0
+         * |-----------+--------+--------+-----------+----------+---------|
+         * | Card      | Card   | Endian | DATA3     | Data     | Led     |
+         * | Detect    | Detect | Mode   | as Card   | Transfer | Control |
+         * | Signal    | Test   |        | Detection | Width    |         |
+         * | Selection | Level  |        | Pin       |          |         |
+         * |-----------+--------+--------+-----------+----------+---------|
+         *
+         * and 0x29
+         *
+         *  15      10 9    8
+         * |----------+------|
+         * | Reserved | DMA  |
+         * |          | Sel. |
+         * |          |      |
+         * |----------+------|
+         *
+         * and here's what SDCHI spec expects those offsets to be:
+         *
+         * 0x28 (Host Control Register)
+         *
+         *     7        6         5       4  3      2         1        0
+         * |--------+--------+----------+------+--------+----------+---------|
+         * | Card   | Card   | Extended | DMA  | High   | Data     | LED     |
+         * | Detect | Detect | Data     | Sel. | Speed  | Transfer | Control |
+         * | Signal | Test   | Transfer |      | Enable | Width    |         |
+         * | Sel.   | Level  | Width    |      |        |          |         |
+         * |--------+--------+----------+------+--------+----------+---------|
+         *
+         * and 0x29 (Power Control Register)
+         *
+         * |----------------------------------|
+         * | Power Control Register           |
+         * |                                  |
+         * | Description omitted,             |
+         * | since it has no analog in ESDHCI |
+         * |                                  |
+         * |----------------------------------|
+         *
+         * Since offsets 0x2A and 0x2B should be compatible between
+         * both IP specs we only need to reconcile least 16-bit of the
+         * word we've been given.
+         */
+
+        /*
+         * First, save bits 7 6 and 0 since they are identical
+         */
+        hostctl = value & (SDHC_CTRL_LED |
+                           SDHC_CTRL_CDTEST_INS |
+                           SDHC_CTRL_CDTEST_EN);
+        /*
+         * Second, split "Data Transfer Width" from bits 2 and 1 in to
+         * bits 5 and 1
+         */
+        if (value & ESDHC_CTRL_8BITBUS) {
+            hostctl |= SDHC_CTRL_8BITBUS;
+        }
+
+        if (value & ESDHC_CTRL_4BITBUS) {
+            hostctl |= ESDHC_CTRL_4BITBUS;
+        }
+
+        /*
+         * Third, move DMA select from bits 9 and 8 to bits 4 and 3
+         */
+        hostctl |= SDHC_DMA_TYPE(value >> (8 - 3));
+
+        /*
+         * Now place the corrected value into low 16-bit of the value
+         * we are going to give standard SDHCI write function
+         *
+         * NOTE: This transformation should be the inverse of what can
+         * be found in drivers/mmc/host/sdhci-esdhc-imx.c in Linux
+         * kernel
+         */
+        value &= ~UINT16_MAX;
+        value |= hostctl;
+        value |= (uint16_t)s->pwrcon << 8;
+
+        sdhci_write(opaque, offset, value, size);
+        break;
+
+    case ESDHC_MIX_CTRL:
+        /*
+         * So, when SD/MMC stack in Linux tries to write to "Transfer
+         * Mode Register", ESDHC i.MX quirk code will translate it
+         * into a write to ESDHC_MIX_CTRL, so we do the opposite in
+         * order to get where we started
+         *
+         * Note that Auto CMD23 Enable bit is located in a wrong place
+         * on i.MX, but since it is not used by QEMU we do not care.
+         *
+         * We don't want to call sdhci_write(.., SDHC_TRNMOD, ...)
+         * here becuase it will result in a call to
+         * sdhci_send_command(s) which we don't want.
+         *
+         */
+        s->trnmod = value & UINT16_MAX;
+        break;
+    case SDHC_TRNMOD:
+        /*
+         * Similar to above, but this time a write to "Command
+         * Register" will be translated into a 4-byte write to
+         * "Transfer Mode register" where lower 16-bit of value would
+         * be set to zero. So what we do is fill those bits with
+         * cached value from s->trnmod and let the SDHCI
+         * infrastructure handle the rest
+         */
+        sdhci_write(opaque, offset, val | s->trnmod, size);
+        break;
+    case SDHC_BLKSIZE:
+        /*
+         * ESDHCI does not implement "Host SDMA Buffer Boundary", and
+         * Linux driver will try to zero this field out which will
+         * break the rest of SDHCI emulation.
+         *
+         * Linux defaults to maximum possible setting (512K boundary)
+         * and it seems to be the only option that i.MX IP implements,
+         * so we artificially set it to that value.
+         */
+        val |= 0x7 << 12;
+        /* FALLTHROUGH */
+    default:
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
index 1cf70f8c23..f8d1ba3538 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -44,6 +44,7 @@ typedef struct SDHCIState {
     AddressSpace sysbus_dma_as;
     AddressSpace *dma_as;
     MemoryRegion *dma_mr;
+    const MemoryRegionOps *io_ops;
 
     QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
     QEMUTimer *transfer_timer;
@@ -91,8 +92,18 @@ typedef struct SDHCIState {
 
     /* Configurable properties */
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
+    uint32_t quirks;
 } SDHCIState;
 
+/*
+ * Controller does not provide transfer-complete interrupt when not
+ * busy.
+ *
+ * NOTE: This definition is taken out of Linux kernel and so the
+ * original bit number is preserved
+ */
+#define SDHCI_QUIRK_NO_BUSY_IRQ    BIT(14)
+
 #define TYPE_PCI_SDHCI "sdhci-pci"
 #define PCI_SDHCI(obj) OBJECT_CHECK(SDHCIState, (obj), TYPE_PCI_SDHCI)
 
@@ -100,4 +111,6 @@ typedef struct SDHCIState {
 #define SYSBUS_SDHCI(obj)                               \
      OBJECT_CHECK(SDHCIState, (obj), TYPE_SYSBUS_SDHCI)
 
+#define TYPE_IMX_USDHC "imx-usdhc"
+
 #endif /* SDHCI_H */
-- 
2.14.3

