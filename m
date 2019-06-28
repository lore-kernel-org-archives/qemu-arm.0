Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2339719wru;
        Fri, 28 Jun 2019 03:40:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyWa8Sww5S65aBf8BTA6ozp9nqU/pMLumKOHLzs58iIBCIm0TOJ2xrtEwjvmoIZ9Ui2lzv5
X-Received: by 2002:a50:94e6:: with SMTP id t35mr10442066eda.137.1561718437425;
        Fri, 28 Jun 2019 03:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561718437; cv=none;
        d=google.com; s=arc-20160816;
        b=QzN+jfbe2umivSyzYqFvc4RLKjLN/CZWsjl6xzBSNvRv1i70wga7jMjSelG4gbzOFX
         U1B/CqlvFdtCSQkG68lY9q8ob8Q6wunTA+5Sk9ytlltbEiny857FvEr5WKMOJCqtogw+
         7zFG037kxDFKv5KxkhjJ91G1c0tHqIRJMdp1+91r+BnA3rM4lK6eXcbWKTh6cVZ7eNKe
         oAupgUuzQIm3q+ZsUzSSPQIPRm+5k9+RjwfzdHBpunrX2V0yehBwU2jpjyTurUhQVv6W
         KEZroBnoxPi1KJqYRWz8RHVOrss6eWMAPimIZfVGXAVgne4cJkHYeaAWhdGYhrSpbsOM
         3ypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=B+DyBbBmmMhKOpo9GlTYddlc66ddg6hrK65ViUFNZi0=;
        b=gU6owj8LfW0e6TsrNsVME90SZw1pVEMXNKR1A0FzjiSX+APHKPHxY147DekP0wPKNL
         MEjPVUSmqVhnp5b4Q5D6N5KAf8cWAz44WVIlxDo82y5t9UHrednXBa74twWZGOJxHJ89
         U0TO2+ZvBwHKSV9dtlOZgxkqM1W8VYF4GKgNIeW5oXbUNVG+W5w9AwRIoRLGX6L49wp+
         rsM7YGO6vgPLvzuQ4jul22o3JzbcW/RCh/Jqa0j9CGLwqqSHsXrdOTj76RsfwueNcQY7
         Owm53avoIGRClpdZVH+XI5gQhnp/KzZDCO47/SmApVIy8ABK+nkEEhLYCF4lSNeGRX6c
         LycQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s35si1708572edb.411.2019.06.28.03.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 03:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hgoJ2-0002Ra-Ek
	for alex.bennee@linaro.org; Fri, 28 Jun 2019 06:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hgoIp-0002Ig-7t
 for qemu-arm@nongnu.org; Fri, 28 Jun 2019 06:40:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hgoIn-00067N-0x
 for qemu-arm@nongnu.org; Fri, 28 Jun 2019 06:40:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7357)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hgoIm-000626-OO; Fri, 28 Jun 2019 06:40:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6CAE53082137;
 Fri, 28 Jun 2019 10:40:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17A4060BE0;
 Fri, 28 Jun 2019 10:39:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 18BF017474; Fri, 28 Jun 2019 12:39:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Jun 2019 12:39:54 +0200
Message-Id: <20190628103957.9504-4-kraxel@redhat.com>
In-Reply-To: <20190628103957.9504-1-kraxel@redhat.com>
References: <20190628103957.9504-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 28 Jun 2019 10:40:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 3/6] ati-vga: Fixes to offset and pitch registers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tEqBzQkWttOz

From: BALATON Zoltan <balaton@eik.bme.hu>

Fix bit masks of registers for offset and pitch and also handle
default values for both R128P and RV100. This improves picture a bit
but does not resolve all problems yet so there might be some more bugs
somewhere.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-id: 20190624100005.7A1CA746395@zero.eik.bme.hu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ati_int.h  |  1 +
 hw/display/ati_regs.h |  4 ++--
 hw/display/ati.c      | 32 ++++++++++++++++++++++----------
 hw/display/ati_2d.c   | 26 ++++++++++++++++++--------
 4 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/hw/display/ati_int.h b/hw/display/ati_int.h
index 51465f563066..9b67d0022ad9 100644
--- a/hw/display/ati_int.h
+++ b/hw/display/ati_int.h
@@ -74,6 +74,7 @@ typedef struct ATIVGARegs {
     uint32_t dp_write_mask;
     uint32_t default_offset;
     uint32_t default_pitch;
+    uint32_t default_tile;
     uint32_t default_sc_bottom_right;
 } ATIVGARegs;
 
diff --git a/hw/display/ati_regs.h b/hw/display/ati_regs.h
index 1ec3498b731c..d7155c93d53b 100644
--- a/hw/display/ati_regs.h
+++ b/hw/display/ati_regs.h
@@ -370,8 +370,8 @@
 #define BRUSH_SOLIDCOLOR                        0x00000d00
 
 /* DP_GUI_MASTER_CNTL bit constants */
-#define GMC_SRC_PITCH_OFFSET_DEFAULT            0x00000000
-#define GMC_DST_PITCH_OFFSET_DEFAULT            0x00000000
+#define GMC_SRC_PITCH_OFFSET_CNTL               0x00000001
+#define GMC_DST_PITCH_OFFSET_CNTL               0x00000002
 #define GMC_SRC_CLIP_DEFAULT                    0x00000000
 #define GMC_DST_CLIP_DEFAULT                    0x00000000
 #define GMC_BRUSH_SOLIDCOLOR                    0x000000d0
diff --git a/hw/display/ati.c b/hw/display/ati.c
index 25d5077ba077..e1bde5e0b1e3 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -419,9 +419,15 @@ static uint64_t ati_mm_read(void *opaque, hwaddr addr, unsigned int size)
         break;
     case DEFAULT_OFFSET:
         val = s->regs.default_offset;
+        if (s->dev_id != PCI_DEVICE_ID_ATI_RAGE128_PF) {
+            val >>= 10;
+            val |= s->regs.default_pitch << 16;
+            val |= s->regs.default_tile << 30;
+        }
         break;
     case DEFAULT_PITCH:
         val = s->regs.default_pitch;
+        val |= s->regs.default_tile << 16;
         break;
     case DEFAULT_SC_BOTTOM_RIGHT:
         val = s->regs.default_sc_bottom_right;
@@ -682,22 +688,22 @@ static void ati_mm_write(void *opaque, hwaddr addr,
         break;
     case SRC_PITCH_OFFSET:
         if (s->dev_id == PCI_DEVICE_ID_ATI_RAGE128_PF) {
-            s->regs.src_offset = (data & 0x1fffff) << 5;
-            s->regs.src_pitch = (data >> 21) & 0x3ff;
+            s->regs.src_offset = (data & 0x1fffff) << 4;
+            s->regs.src_pitch = (data & 0x7fe00000) >> 21;
             s->regs.src_tile = data >> 31;
         } else {
-            s->regs.src_offset = (data & 0x3fffff) << 11;
+            s->regs.src_offset = (data & 0x3fffff) << 10;
             s->regs.src_pitch = (data & 0x3fc00000) >> 16;
             s->regs.src_tile = (data >> 30) & 1;
         }
         break;
     case DST_PITCH_OFFSET:
         if (s->dev_id == PCI_DEVICE_ID_ATI_RAGE128_PF) {
-            s->regs.dst_offset = (data & 0x1fffff) << 5;
-            s->regs.dst_pitch = (data >> 21) & 0x3ff;
+            s->regs.dst_offset = (data & 0x1fffff) << 4;
+            s->regs.dst_pitch = (data & 0x7fe00000) >> 21;
             s->regs.dst_tile = data >> 31;
         } else {
-            s->regs.dst_offset = (data & 0x3fffff) << 11;
+            s->regs.dst_offset = (data & 0x3fffff) << 10;
             s->regs.dst_pitch = (data & 0x3fc00000) >> 16;
             s->regs.dst_tile = data >> 30;
         }
@@ -777,13 +783,19 @@ static void ati_mm_write(void *opaque, hwaddr addr,
         s->regs.dp_write_mask = data;
         break;
     case DEFAULT_OFFSET:
-        data &= (s->dev_id == PCI_DEVICE_ID_ATI_RAGE128_PF ?
-                 0x03fffc00 : 0xfffffc00);
-        s->regs.default_offset = data;
+        if (s->dev_id == PCI_DEVICE_ID_ATI_RAGE128_PF) {
+            s->regs.default_offset = data & 0xfffffff0;
+        } else {
+            /* Radeon has DEFAULT_PITCH_OFFSET here like DST_PITCH_OFFSET */
+            s->regs.default_offset = (data & 0x3fffff) << 10;
+            s->regs.default_pitch = (data & 0x3fc00000) >> 16;
+            s->regs.default_tile = data >> 30;
+        }
         break;
     case DEFAULT_PITCH:
         if (s->dev_id == PCI_DEVICE_ID_ATI_RAGE128_PF) {
-            s->regs.default_pitch = data & 0x103ff;
+            s->regs.default_pitch = data & 0x3fff;
+            s->regs.default_tile = (data >> 16) & 1;
         }
         break;
     case DEFAULT_SC_BOTTOM_RIGHT:
diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
index d83c29c6d933..2dbf53f03936 100644
--- a/hw/display/ati_2d.c
+++ b/hw/display/ati_2d.c
@@ -51,8 +51,9 @@ void ati_2d_blt(ATIVGAState *s)
             s->vga.vbe_start_addr, surface_data(ds), surface_stride(ds),
             surface_bits_per_pixel(ds),
             (s->regs.dp_mix & GMC_ROP3_MASK) >> 16);
-    DPRINTF("%d %d, %d %d, (%d,%d) -> (%d,%d) %dx%d\n", s->regs.src_offset,
-            s->regs.dst_offset, s->regs.src_pitch, s->regs.dst_pitch,
+    DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d\n",
+            s->regs.src_offset, s->regs.dst_offset, s->regs.default_offset,
+            s->regs.src_pitch, s->regs.dst_pitch, s->regs.default_pitch,
             s->regs.src_x, s->regs.src_y, s->regs.dst_x, s->regs.dst_y,
             s->regs.dst_width, s->regs.dst_height);
     switch (s->regs.dp_mix & GMC_ROP3_MASK) {
@@ -60,10 +61,16 @@ void ati_2d_blt(ATIVGAState *s)
     {
         uint8_t *src_bits, *dst_bits, *end;
         int src_stride, dst_stride, bpp = ati_bpp_from_datatype(s);
-        src_bits = s->vga.vram_ptr + s->regs.src_offset;
-        dst_bits = s->vga.vram_ptr + s->regs.dst_offset;
-        src_stride = s->regs.src_pitch;
-        dst_stride = s->regs.dst_pitch;
+        src_bits = s->vga.vram_ptr +
+                   (s->regs.dp_gui_master_cntl & GMC_SRC_PITCH_OFFSET_CNTL ?
+                    s->regs.src_offset : s->regs.default_offset);
+        dst_bits = s->vga.vram_ptr +
+                   (s->regs.dp_gui_master_cntl & GMC_DST_PITCH_OFFSET_CNTL ?
+                    s->regs.dst_offset : s->regs.default_offset);
+        src_stride = (s->regs.dp_gui_master_cntl & GMC_SRC_PITCH_OFFSET_CNTL ?
+                      s->regs.src_pitch : s->regs.default_pitch);
+        dst_stride = (s->regs.dp_gui_master_cntl & GMC_DST_PITCH_OFFSET_CNTL ?
+                      s->regs.dst_pitch : s->regs.default_pitch);
 
         if (s->dev_id == PCI_DEVICE_ID_ATI_RAGE128_PF) {
             src_bits += s->regs.crtc_offset & 0x07ffffff;
@@ -111,8 +118,11 @@ void ati_2d_blt(ATIVGAState *s)
         uint8_t *dst_bits, *end;
         int dst_stride, bpp = ati_bpp_from_datatype(s);
         uint32_t filler = 0;
-        dst_bits = s->vga.vram_ptr + s->regs.dst_offset;
-        dst_stride = s->regs.dst_pitch;
+        dst_bits = s->vga.vram_ptr +
+                   (s->regs.dp_gui_master_cntl & GMC_DST_PITCH_OFFSET_CNTL ?
+                    s->regs.dst_offset : s->regs.default_offset);
+        dst_stride = (s->regs.dp_gui_master_cntl & GMC_DST_PITCH_OFFSET_CNTL ?
+                      s->regs.dst_pitch : s->regs.default_pitch);
 
         if (s->dev_id == PCI_DEVICE_ID_ATI_RAGE128_PF) {
             dst_bits += s->regs.crtc_offset & 0x07ffffff;
-- 
2.18.1

