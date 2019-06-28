Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2344030wru;
        Fri, 28 Jun 2019 03:45:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+PG7YJqXpRsnlctlfnjdGuHkCi7U7Ng7T9nqqULQS/jgP3jw7y3hkXBfB1dkFSiV1rpPs
X-Received: by 2002:aa7:c692:: with SMTP id n18mr10264618edq.220.1561718735551;
        Fri, 28 Jun 2019 03:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561718735; cv=none;
        d=google.com; s=arc-20160816;
        b=xw6dz8aj4LoLVmNmW5DwJu/YsVmrjbSMo6NC1FcBM/Ge2qz5YkN2qIDaIixM4cbEQL
         DnldBEq+CF9hQ/iAnVgTt683alfkvIJXvU0KmPUDKV5TG3OrkqgZlx5TmiPVgVXtELSq
         zmY98CTZIKlZJaKLWlev95SV21MpJEY5KmRv1Ce5nQw1ecz6qrIPH3P1bUzqfJPw7TF/
         Pp0//1euVUalSdG2Ykhh1rEu7T7CyR7cRkCIgVn+SdNc8qIweAlRM//pGfv48mqXO6t9
         TeTgVIyvY5oSB0MKuI+XNT1Mt2A6ShVLznyOr7w0YY7Tl1FmfsQ+sX0bW8D52jzCeaGt
         acew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=wuKusJwZTcqx9bzJ0LODT8eQgIaZU1ab44k19nCbdmM=;
        b=n57lQ9OPIvng52p11j0p88uUeMGNLNpuv1z4aNZKDNr1piddszoZu7Rx4x+12vBV2l
         esXidlfAgF/quldEyl7n+Dz5LTrzHT4bdEghbbOyKnU7QJLEbP/TlNIfx0/TH1hvhxhD
         XK+5YLKdrNL8abMkCQFKFF9tUlf6Wny6F89bI7k19oTJZGAjqxwNqtXA7yrG1VldnVUJ
         RiA6m4O1weBuat4gvA3ez2HJSCdc/jp7Z4ff+DMkymEFCGdaOqnO9Stuv2i8E7lmeumU
         FvoEHrxSMIPIvo6ycy+avA36wRCcxv9cXbp0KDHGOhMzj7q/hw3F/jIS4udytO2modKs
         e9dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si1595760ede.349.2019.06.28.03.45.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 03:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hgoNq-0007yL-Ja
	for alex.bennee@linaro.org; Fri, 28 Jun 2019 06:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60693)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hgoIt-0002Sp-HF
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 06:40:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hgoIr-0006Cl-N5
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 06:40:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34280)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hgoIk-000627-Vh; Fri, 28 Jun 2019 06:40:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 861D7C03D478;
 Fri, 28 Jun 2019 10:40:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04C9F5DC18;
 Fri, 28 Jun 2019 10:39:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C95E17473; Fri, 28 Jun 2019 12:39:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Jun 2019 12:39:53 +0200
Message-Id: <20190628103957.9504-3-kraxel@redhat.com>
In-Reply-To: <20190628103957.9504-1-kraxel@redhat.com>
References: <20190628103957.9504-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 28 Jun 2019 10:40:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/6] ati-vga: Implement DDC and EDID info from
 monitor
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P3tiAQjadm/V

From: BALATON Zoltan <balaton@eik.bme.hu>

This adds DDC support to ati-vga and connects i2c-ddc to it. This
allows at least MacOS with an ATI ndrv, Linux radeonfb and MorphOS to
get monitor EDID info (although MorphOS splash screen is not displayed
and radeonfb needs additional tables from vgabios-rv100). Xorg needs
additional support from VESA vgabios, it's missing INT10 0x4F15
function (see
https://gitlab.freedesktop.org/xorg/xserver/blob/master/hw/xfree86/vbe/vbe.c)
without which no DDC is available that also prevents loading the
accelerated X driver.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-id: 046ddebb7ec8db48c4e877ee444ec1c41e385a74.1561028123.git.balaton@eik.bme.hu

ati-vga: Clarify comment

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-id: 20190620195213.C54127461AE@zero.eik.bme.hu

ati-vga: Add DDC reg names for debug

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-id: 20190621181459.2F8207462AA@zero.eik.bme.hu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ati_int.h  |  5 ++++
 hw/display/ati_regs.h |  2 ++
 hw/display/ati.c      | 65 +++++++++++++++++++++++++++++++++++++++++--
 hw/display/ati_dbg.c  |  2 ++
 hw/display/Kconfig    |  2 ++
 5 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/hw/display/ati_int.h b/hw/display/ati_int.h
index 2f426064cf7d..51465f563066 100644
--- a/hw/display/ati_int.h
+++ b/hw/display/ati_int.h
@@ -10,6 +10,7 @@
 #define ATI_INT_H
 
 #include "hw/pci/pci.h"
+#include "hw/i2c/bitbang_i2c.h"
 #include "vga_int.h"
 
 /*#define DEBUG_ATI*/
@@ -35,6 +36,9 @@ typedef struct ATIVGARegs {
     uint32_t crtc_gen_cntl;
     uint32_t crtc_ext_cntl;
     uint32_t dac_cntl;
+    uint32_t gpio_vga_ddc;
+    uint32_t gpio_dvi_ddc;
+    uint32_t gpio_monid;
     uint32_t crtc_h_total_disp;
     uint32_t crtc_h_sync_strt_wid;
     uint32_t crtc_v_total_disp;
@@ -83,6 +87,7 @@ typedef struct ATIVGAState {
     uint16_t cursor_size;
     uint32_t cursor_offset;
     QEMUCursor *cursor;
+    bitbang_i2c_interface *bbi2c;
     MemoryRegion io;
     MemoryRegion mm;
     ATIVGARegs regs;
diff --git a/hw/display/ati_regs.h b/hw/display/ati_regs.h
index 923bfd33ceb7..1ec3498b731c 100644
--- a/hw/display/ati_regs.h
+++ b/hw/display/ati_regs.h
@@ -37,6 +37,8 @@
 #define CRTC_GEN_CNTL                           0x0050
 #define CRTC_EXT_CNTL                           0x0054
 #define DAC_CNTL                                0x0058
+#define GPIO_VGA_DDC                            0x0060
+#define GPIO_DVI_DDC                            0x0064
 #define GPIO_MONID                              0x0068
 #define I2C_CNTL_1                              0x0094
 #define PALETTE_INDEX                           0x00b0
diff --git a/hw/display/ati.c b/hw/display/ati.c
index 76595d951181..25d5077ba077 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "ui/console.h"
+#include "hw/display/i2c-ddc.h"
 #include "trace.h"
 
 #define ATI_DEBUG_HW_CURSOR 0
@@ -215,6 +216,24 @@ static void ati_cursor_draw_line(VGACommonState *vga, uint8_t *d, int scr_y)
     }
 }
 
+static uint64_t ati_i2c(bitbang_i2c_interface *i2c, uint64_t data, int base)
+{
+    bool c = (data & BIT(base + 17) ? !!(data & BIT(base + 1)) : 1);
+    bool d = (data & BIT(base + 16) ? !!(data & BIT(base)) : 1);
+
+    bitbang_i2c_set(i2c, BITBANG_I2C_SCL, c);
+    d = bitbang_i2c_set(i2c, BITBANG_I2C_SDA, d);
+
+    data &= ~0xf00ULL;
+    if (c) {
+        data |= BIT(base + 9);
+    }
+    if (d) {
+        data |= BIT(base + 8);
+    }
+    return data;
+}
+
 static inline uint64_t ati_reg_read_offs(uint32_t reg, int offs,
                                          unsigned int size)
 {
@@ -266,7 +285,16 @@ static uint64_t ati_mm_read(void *opaque, hwaddr addr, unsigned int size)
     case DAC_CNTL:
         val = s->regs.dac_cntl;
         break;
-/*    case GPIO_MONID: FIXME hook up DDC I2C here */
+    case GPIO_VGA_DDC:
+        val = s->regs.gpio_vga_ddc;
+        break;
+    case GPIO_DVI_DDC:
+        val = s->regs.gpio_dvi_ddc;
+        break;
+    case GPIO_MONID ... GPIO_MONID + 3:
+        val = ati_reg_read_offs(s->regs.gpio_monid,
+                                addr - GPIO_MONID, size);
+        break;
     case PALETTE_INDEX:
         /* FIXME unaligned access */
         val = vga_ioport_read(&s->vga, VGA_PEL_IR) << 16;
@@ -497,7 +525,33 @@ static void ati_mm_write(void *opaque, hwaddr addr,
         s->regs.dac_cntl = data & 0xffffe3ff;
         s->vga.dac_8bit = !!(data & DAC_8BIT_EN);
         break;
-/*    case GPIO_MONID: FIXME hook up DDC I2C here */
+    case GPIO_VGA_DDC:
+        if (s->dev_id != PCI_DEVICE_ID_ATI_RAGE128_PF) {
+            /* FIXME: Maybe add a property to select VGA or DVI port? */
+        }
+        break;
+    case GPIO_DVI_DDC:
+        if (s->dev_id != PCI_DEVICE_ID_ATI_RAGE128_PF) {
+            s->regs.gpio_dvi_ddc = ati_i2c(s->bbi2c, data, 0);
+        }
+        break;
+    case GPIO_MONID ... GPIO_MONID + 3:
+        /* FIXME What does Radeon have here? */
+        if (s->dev_id == PCI_DEVICE_ID_ATI_RAGE128_PF) {
+            ati_reg_write_offs(&s->regs.gpio_monid,
+                               addr - GPIO_MONID, data, size);
+            /*
+             * Rage128p accesses DDC used to get EDID via these bits.
+             * Only touch i2c when write overlaps 3rd byte because some
+             * drivers access this reg via multiple partial writes and
+             * without this spurious bits would be sent.
+             */
+            if ((s->regs.gpio_monid & BIT(25)) &&
+                addr <= GPIO_MONID + 2 && addr + size > GPIO_MONID + 2) {
+                s->regs.gpio_monid = ati_i2c(s->bbi2c, s->regs.gpio_monid, 1);
+            }
+        }
+        break;
     case PALETTE_INDEX ... PALETTE_INDEX + 3:
         if (size == 4) {
             vga_ioport_write(&s->vga, VGA_PEL_IR, (data >> 16) & 0xff);
@@ -788,6 +842,12 @@ static void ati_vga_realize(PCIDevice *dev, Error **errp)
         vga->cursor_draw_line = ati_cursor_draw_line;
     }
 
+    /* ddc, edid */
+    I2CBus *i2cbus = i2c_init_bus(DEVICE(s), "ati-vga.ddc");
+    s->bbi2c = bitbang_i2c_init(i2cbus);
+    I2CSlave *i2cddc = I2C_SLAVE(qdev_create(BUS(i2cbus), TYPE_I2CDDC));
+    i2c_set_slave_address(i2cddc, 0x50);
+
     /* mmio register space */
     memory_region_init_io(&s->mm, OBJECT(s), &ati_mm_ops, s,
                           "ati.mmregs", 0x4000);
@@ -813,6 +873,7 @@ static void ati_vga_exit(PCIDevice *dev)
     ATIVGAState *s = ATI_VGA(dev);
 
     graphic_console_close(s->vga.con);
+    g_free(s->bbi2c);
 }
 
 static Property ati_vga_properties[] = {
diff --git a/hw/display/ati_dbg.c b/hw/display/ati_dbg.c
index b045f81d0602..88b3a11315d8 100644
--- a/hw/display/ati_dbg.c
+++ b/hw/display/ati_dbg.c
@@ -19,6 +19,8 @@ static struct ati_regdesc ati_reg_names[] = {
     {"CRTC_GEN_CNTL", 0x0050},
     {"CRTC_EXT_CNTL", 0x0054},
     {"DAC_CNTL", 0x0058},
+    {"GPIO_VGA_DDC", 0x0060},
+    {"GPIO_DVI_DDC", 0x0064},
     {"GPIO_MONID", 0x0068},
     {"I2C_CNTL_1", 0x0094},
     {"PALETTE_INDEX", 0x00b0},
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 910dccb2f7a5..cbdf7b1a675b 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -130,3 +130,5 @@ config ATI_VGA
     default y if PCI_DEVICES
     depends on PCI
     select VGA
+    select BITBANG_I2C
+    select DDC
-- 
2.18.1

