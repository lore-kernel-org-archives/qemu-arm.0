Received: by 10.223.159.74 with SMTP id f10csp3058824wrg;
        Mon, 11 Dec 2017 13:37:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBotCKVO3ym3VHAdnmuz0aMSRT4yyuFGBuhg6+vLEMY2TJVCSgVKn7Sabwfkg0l2RhLOIvCul
X-Received: by 10.129.138.4 with SMTP id a4mr1383219ywg.208.1513028273670;
        Mon, 11 Dec 2017 13:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513028273; cv=none;
        d=google.com; s=arc-20160816;
        b=UGYOUzxis8KTegPEM+diIy3ZG/gNJ6xrrI9TAgnD1A5oCyl94/JQhhHwoaKvi08Vh0
         5Ry+wJHxu4BSWZyRIhobk+m1i6xl9iwJ+RANlY1/CXvtKS+A6uH+1xbCk2pcWtLGqeqE
         ztj8SyKrnaha5PPK23OoCiFTeR1KHcIJuaUwbQhiedV5mZO639RfH9UCKwI9zaOcEgsi
         fNbRWMPwwgD93R2Ut6iYTeDW1GvtWfoKLwKAw2R6l9ECnUVegDnT7dAn30CcgDSZv3ps
         SqoES/9AIhJnl2XvsvVsPEa8Sg5/+dbUWLvmT6Vj6W5/omMJXWp45EGn7i+p0sto+MiG
         uE4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=kLkEoorDfNDUCXayBKQU01knduM+Q6nN0fHQ3lLZQbc=;
        b=iYoQWqdiNwJWzXdMkU48i2nSkmL58UP5H0jMoiSvhqz/XRQlAp58JaNMoR8ikWq0C+
         mKbttMs1iDTU0HeyFvRxSaMbW/tU0sXIEOgSMeRVid8dGJTSpkJHoF8JtSXl+UZgaGhE
         XtEiZ/MzHxoo13M8QPO1sepPjZy9h+SkqVemRJ3F/nqW7vWkj84PbAQzFXLfd+32bMPm
         UXtlEBzAH/rBL8ULb+7eZQiPy62z+AZaYddA/XaVJmKywKPsSpcLx36Rk6RTdkSVgPdx
         DN+gmrx94ADIBRu/mG6ykTEFzmyfO5J+NQe0Fy9Rem09edJhU1VAj1cx/Eu+1xN+UG9C
         0H8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ul/Qi4fD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e11si392742ybn.749.2017.12.11.13.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:37:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ul/Qi4fD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVlp-0008M2-1R
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:37:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVfF-0000sF-Gi
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:31:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVfD-0004Vw-7t
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:31:05 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:39141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVfC-0004TW-VD; Mon, 11 Dec 2017 16:31:03 -0500
Received: by mail-pf0-x242.google.com with SMTP id l24so12535943pfj.6;
	Mon, 11 Dec 2017 13:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kLkEoorDfNDUCXayBKQU01knduM+Q6nN0fHQ3lLZQbc=;
	b=Ul/Qi4fDv7uAtq2KqL6STDWXHZqQPZ4SQ9GP5bwucOSJ/fDT5xpwq21Si6zpWMgcI2
	gKmNfYb79Q4sCf8O2RL5LiJtkZwJa1DoER6wPZukw+sZ3eDt8eOrSDzzvFcx/CA04xhV
	YsxEuaL33YSlvjNZoSMHOQXidb1fu31nCTR+CtJsJ3At2y/nVd1iQcr0MzGu3m/g2zSi
	8Z/eahHD1qGbo7OzTp++LsMcz0untVtdn+Qii3VfgFNyXOharHyRIQz411SEtHyvZe9p
	5PC+zBsJKN2gelOVO8n+6LsW19i9CGKWv/ERfT+xzvbwTf8zbA+D7dlUr/jJD0Hua/qw
	KgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kLkEoorDfNDUCXayBKQU01knduM+Q6nN0fHQ3lLZQbc=;
	b=eTTv3S5s32q0IqWrLyPMgJQQTBleOMKQpjtQAmThKq8rY/rvtKMqwU9locMbuksacF
	A3YzQpiDClFeCyOt1m26R6swUou5py9L2CN0xh3wyEsZeo03Z1YvUuO9rBfMUOku/4B1
	gN0wiDlH5DTvBR2LEUEfFn9rxx/NOZPh+6/Iin8xajz6KyS7yLf5NkKqvRXTmp7Kw5BX
	Rtoh9BvDuG5T3UNU5yjsgF4jlUIu//Fth4einX5tIRe4aUtuURSErqQGdsf9A53E6vt+
	PzK88PDHBklJoYOz+EI15QuQDUr2L6qIZ8llkfFRxyJa9XxDg0nWVAKwv0TkFA5++jSG
	xhzQ==
X-Gm-Message-State: AKGB3mJ8W/9vAIiOwMBjI/DFh3wYqzAOERTbRNHE7gYCoSRjgVAiIyeh
	Rb1QIFVgHKF7VIK2tvP3tlSl+3hq
X-Received: by 10.159.250.148 with SMTP id k20mr1625072pls.149.1513027861667; 
	Mon, 11 Dec 2017 13:31:01 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.31.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:31:00 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:30:06 -0800
Message-Id: <20171211213007.7353-13-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH 12/13] sdhci: Add i.MX specific subtype of SDHCI
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
X-TUID: jaeyhcCbhaK4

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
 hw/sd/sdhci-internal.h |  19 +++++
 hw/sd/sdhci.c          | 228 ++++++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/sd/sdhci.h  |   8 ++
 3 files changed, 253 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 161177cf39..b86ac0791b 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -85,12 +85,18 @@
 
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
@@ -229,4 +235,17 @@ enum {
 
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
index 6d6a791ee9..758af067f9 100644
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
@@ -1386,11 +1389,232 @@ static const TypeInfo sdhci_bus_info = {
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
2.14.3

