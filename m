Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3769618wrq;
        Mon, 25 Jun 2018 05:47:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd8PmC1lx1jb09Rb6QO26jRLz9ikPngRkXBJue8CGDt4brRpqb1q2GyX7q3GqpDdrrCxT8M
X-Received: by 2002:aed:25f3:: with SMTP id y48-v6mr7374283qtc.199.1529930874797;
        Mon, 25 Jun 2018 05:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529930874; cv=none;
        d=google.com; s=arc-20160816;
        b=PrNW7Cx6KovkhTZgzA6IqWRJ5Lr1/Vj0HKAGV08e8j5jrFgXay5j1C3vq3J8KK+Fy7
         WGgyE7uhORPBRfm6FWHbi+q/lA18IbLxVQsa8xhjYpK+zkaIeFJG8VuKxMS6Gq/ulAjp
         CVR22L+xugEt3NrqJsj3R4+49SuzCSrsoPXpzSGkGcSGGFZbjIt9ffnfiB3/sop0H9nx
         U6mp4hUFipbrCXHvLHjOCnLhaxEF2/kPnW1l/VsU9ZF6aX0wJd2RS9sB77/fyDrUzpnW
         l71XzEhZeYjMDzicOCJ2n71aimO1dfMobhsQhxG1Yi6krmQeAh3uDYAa2qLJe3uxeKF9
         7RSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xfjZ3x+bJEw9boY4UIUJAoMrsb8RqVEjFmy9G1F2y38=;
        b=0vFP7MrEBwF5C2Oo7KBMH1BLdmnjD2ZscTYzDdpwgpFDJ6+Nm38GktZItOtqUYYaBU
         NR/c/tIW8d0L10ONe117s1aUSmTSWdjSUE9cNc8B1UhN4IvW/ovNBYA/z7PBsdUi5oVZ
         WvsBfDlvck/S8XY1Bi/qBQ1bHT+xCmPsLWMcy3XLcv+D3rlwfog81P0zPc1NHlaWs225
         SSnKTWbSQIrlk6Y6hBIvvzUmbuzS4wshpBmruQA3ku+XXvuIT9KqGF3wW4fmHDqVJB5E
         AH1+XqzRg6RX/ADmwODYjrBgZwRDHJfo1r656JuTbFTK+s26uYgYW6sw1NMWZ4OGhvsb
         Hbhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kCWE7YfV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c12-v6si1542430qkj.215.2018.06.25.05.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 05:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kCWE7YfV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXQuQ-0004KO-7r
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 08:47:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqX-0001VQ-UO
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 08:43:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqU-0007lH-8y
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 08:43:53 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46061)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqU-0007l3-48; Mon, 25 Jun 2018 08:43:50 -0400
Received: by mail-qt0-x241.google.com with SMTP id i18-v6so11720200qtp.12;
	Mon, 25 Jun 2018 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xfjZ3x+bJEw9boY4UIUJAoMrsb8RqVEjFmy9G1F2y38=;
	b=kCWE7YfVlcJLh72qKCzbj+Gjk5erwAgYDji+DhsY1R6JyCSamYnJ4NiIUfaZiGAzzW
	nzUYhHmS8c4jeLko/AD+yhzYRKCBGm3TSdUO37ls7Kbkhz7sxdMubGNWbW3ceJsHIhtv
	DJxyCSauxlVFj56hfcOBrpWXiC8NHVuSHCY6aaFuRE348AJCQtKfq+fhhwoG7wWArHUI
	C/G+zlDTdFZBA6UDjsKS8k8+c0z0qk450ajQBblx2EeHlaf/dDR66wbw5CYws6GuOKvh
	7dXxrluKwsKnBVje+fuPmc5tTpi/f4KAJwKG/5777mkUHw5J6TahhcPDU3Y/A2hpetwS
	aMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xfjZ3x+bJEw9boY4UIUJAoMrsb8RqVEjFmy9G1F2y38=;
	b=Dagvk7+g3jz1T3rkuJAQATBi3wClUPF5YxinKQYrsl/LvFKdNhI1X01eprPSykyqSF
	JWCyFKGqDoJ356hr0HQ7I/KyrljryuHSZEN6qWPSScI2NJjKeXCBUqHKNs4WEHZPYVH8
	DGGrQ7MVbXOWUYUut5gweduTUvd/Hw+cgfEhLIxNshUu3cenaUHO2vyHzBCZ6Gh8z/RW
	hUDeQyBqKAoSx7bsWGomPA8MEfQfFJkFjwLXaWfxdrzybpBVbHKPl3xyiRg15rq+Q6d7
	GrDkEdY0g0DqeV3RMAh1Tp/iapgOr06WbjQeYtT/EuzO7MTS8DBnAe5p1dMojDXAnxGd
	n3Cg==
X-Gm-Message-State: APt69E3jus9EkJ4RsCuaChocy3CSKz8tBFTxnMNT/wPaqaukVx2R/ogJ
	pTpxIT/0WiIQP2wcDAEamaY=
X-Received: by 2002:a0c:f806:: with SMTP id
	r6-v6mr10874791qvn.214.1529930629437; 
	Mon, 25 Jun 2018 05:43:49 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Mon, 25 Jun 2018 09:42:06 -0300
Message-Id: <20180625124238.25339-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v5 14/46] hw/display: Use the IEC binary prefix
 definitions
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J0QO4ROwOddQ

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/display/xlnx_dp.h |  5 +++--
 hw/display/bochs-display.c   |  9 +++++----
 hw/display/cirrus_vga.c      | 10 +++++-----
 hw/display/g364fb.c          |  4 ++--
 hw/display/qxl.c             | 30 ++++++++++++++----------------
 hw/display/vga-isa-mm.c      |  5 +++--
 hw/display/vga.c             |  5 +++--
 hw/display/virtio-gpu.c      |  4 ++--
 hw/display/vmware_vga.c      |  3 ++-
 hw/display/xenfb.c           |  3 ++-
 10 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index ee046a5fac..26b759cd44 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -29,14 +29,15 @@
 #include "hw/display/dpcd.h"
 #include "hw/i2c/i2c-ddc.h"
 #include "qemu/fifo8.h"
+#include "qemu/units.h"
 #include "hw/dma/xlnx_dpdma.h"
 #include "audio/audio.h"
 
 #ifndef XLNX_DP_H
 #define XLNX_DP_H
 
-#define AUD_CHBUF_MAX_DEPTH                 32768
-#define MAX_QEMU_BUFFER_SIZE                4096
+#define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
+#define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
 
 #define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
 #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 1187d77576..5e0c1f1914 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -5,6 +5,7 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "hw/display/bochs-vbe.h"
@@ -70,7 +71,7 @@ static uint64_t bochs_display_vbe_read(void *ptr, hwaddr addr,
     case VBE_DISPI_INDEX_ID:
         return VBE_DISPI_ID5;
     case VBE_DISPI_INDEX_VIDEO_MEMORY_64K:
-        return s->vgamem / (64 * 1024);
+        return s->vgamem / (64 * KiB);
     }
 
     if (index >= ARRAY_SIZE(s->vbe_regs)) {
@@ -258,10 +259,10 @@ static void bochs_display_realize(PCIDevice *dev, Error **errp)
 
     s->con = graphic_console_init(DEVICE(dev), 0, &bochs_display_gfx_ops, s);
 
-    if (s->vgamem < (4 * 1024 * 1024)) {
+    if (s->vgamem < 4 * MiB) {
         error_setg(errp, "bochs-display: video memory too small");
     }
-    if (s->vgamem > (256 * 1024 * 1024)) {
+    if (s->vgamem > 256 * MiB) {
         error_setg(errp, "bochs-display: video memory too big");
     }
     s->vgamem = pow2ceil(s->vgamem);
@@ -323,7 +324,7 @@ static void bochs_display_exit(PCIDevice *dev)
 }
 
 static Property bochs_display_properties[] = {
-    DEFINE_PROP_SIZE("vgamem", BochsDisplayState, vgamem, 16 * 1024 * 1024),
+    DEFINE_PROP_SIZE("vgamem", BochsDisplayState, vgamem, 16 * MiB),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 138ae961b9..5e44f00f3f 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -27,6 +27,7 @@
  *   available at http://home.worldonline.dk/~finth/
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "trace.h"
 #include "hw/hw.h"
@@ -2218,7 +2219,7 @@ static inline void cirrus_cursor_compute_yrange(CirrusVGAState *s)
     uint32_t content;
     int y, y_min, y_max;
 
-    src = s->vga.vram_ptr + s->real_vram_size - 16 * 1024;
+    src = s->vga.vram_ptr + s->real_vram_size - 16 * KiB;
     if (s->vga.sr[0x12] & CIRRUS_CURSOR_LARGE) {
         src += (s->vga.sr[0x13] & 0x3c) * 256;
         y_min = 64;
@@ -2347,7 +2348,7 @@ static void cirrus_cursor_draw_line(VGACommonState *s1, uint8_t *d1, int scr_y)
         return;
     }
 
-    src = s->vga.vram_ptr + s->real_vram_size - 16 * 1024;
+    src = s->vga.vram_ptr + s->real_vram_size - 16 * KiB;
     if (s->vga.sr[0x12] & CIRRUS_CURSOR_LARGE) {
         src += (s->vga.sr[0x13] & 0x3c) * 256;
         src += (scr_y - s->vga.hw_cursor_y) * 16;
@@ -2995,8 +2996,7 @@ static void cirrus_init_common(CirrusVGAState *s, Object *owner,
 
     /* I/O handler for LFB */
     memory_region_init_io(&s->cirrus_linear_io, owner, &cirrus_linear_io_ops, s,
-                          "cirrus-linear-io", s->vga.vram_size_mb
-                                              * 1024 * 1024);
+                          "cirrus-linear-io", s->vga.vram_size_mb * MiB);
     memory_region_set_flush_coalesced(&s->cirrus_linear_io);
 
     /* I/O handler for LFB */
@@ -3013,7 +3013,7 @@ static void cirrus_init_common(CirrusVGAState *s, Object *owner,
     memory_region_set_flush_coalesced(&s->cirrus_mmio_io);
 
     s->real_vram_size =
-        (s->device_id == CIRRUS_ID_CLGD5446) ? 4096 * 1024 : 2048 * 1024;
+        (s->device_id == CIRRUS_ID_CLGD5446) ? 4 * MiB : 2 * MiB;
 
     /* XXX: s->vga.vram_size must be a power of two */
     s->cirrus_addr_mask = s->real_vram_size - 1;
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 3d75394e77..fbc2b2422d 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "qemu/error-report.h"
 #include "ui/console.h"
@@ -510,8 +511,7 @@ static void g364fb_sysbus_reset(DeviceState *d)
 }
 
 static Property g364fb_sysbus_properties[] = {
-    DEFINE_PROP_UINT32("vram_size", G364SysBusState, g364.vram_size,
-    8 * 1024 * 1024),
+    DEFINE_PROP_UINT32("vram_size", G364SysBusState, g364.vram_size, 8 * MiB),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index a71714ccb4..b09a03997a 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include <zlib.h>
 
 #include "qapi/error.h"
@@ -2012,11 +2013,11 @@ static void qxl_init_ramsize(PCIQXLDevice *qxl)
     if (qxl->vgamem_size_mb > 256) {
         qxl->vgamem_size_mb = 256;
     }
-    qxl->vgamem_size = qxl->vgamem_size_mb * 1024 * 1024;
+    qxl->vgamem_size = qxl->vgamem_size_mb * MiB;
 
     /* vga ram (bar 0, total) */
     if (qxl->ram_size_mb != -1) {
-        qxl->vga.vram_size = qxl->ram_size_mb * 1024 * 1024;
+        qxl->vga.vram_size = qxl->ram_size_mb * MiB;
     }
     if (qxl->vga.vram_size < qxl->vgamem_size * 2) {
         qxl->vga.vram_size = qxl->vgamem_size * 2;
@@ -2024,7 +2025,7 @@ static void qxl_init_ramsize(PCIQXLDevice *qxl)
 
     /* vram32 (surfaces, 32bit, bar 1) */
     if (qxl->vram32_size_mb != -1) {
-        qxl->vram32_size = qxl->vram32_size_mb * 1024 * 1024;
+        qxl->vram32_size = qxl->vram32_size_mb * MiB;
     }
     if (qxl->vram32_size < 4096) {
         qxl->vram32_size = 4096;
@@ -2032,7 +2033,7 @@ static void qxl_init_ramsize(PCIQXLDevice *qxl)
 
     /* vram (surfaces, 64bit, bar 4+5) */
     if (qxl->vram_size_mb != -1) {
-        qxl->vram_size = (uint64_t)qxl->vram_size_mb * 1024 * 1024;
+        qxl->vram_size = (uint64_t)qxl->vram_size_mb * MiB;
     }
     if (qxl->vram_size < qxl->vram32_size) {
         qxl->vram_size = qxl->vram32_size;
@@ -2134,13 +2135,12 @@ static void qxl_realize_common(PCIQXLDevice *qxl, Error **errp)
     }
 
     /* print pci bar details */
-    dprint(qxl, 1, "ram/%s: %d MB [region 0]\n",
-           qxl->id == 0 ? "pri" : "sec",
-           qxl->vga.vram_size / (1024*1024));
-    dprint(qxl, 1, "vram/32: %" PRIx64 "d MB [region 1]\n",
-           qxl->vram32_size / (1024*1024));
-    dprint(qxl, 1, "vram/64: %" PRIx64 "d MB %s\n",
-           qxl->vram_size / (1024*1024),
+    dprint(qxl, 1, "ram/%s: %" PRId64 " MB [region 0]\n",
+           qxl->id == 0 ? "pri" : "sec", qxl->vga.vram_size / MiB);
+    dprint(qxl, 1, "vram/32: %" PRIx64 " MB [region 1]\n",
+           qxl->vram32_size / MiB);
+    dprint(qxl, 1, "vram/64: %" PRIx64 " MB %s\n",
+           qxl->vram_size / MiB,
            qxl->vram32_size < qxl->vram_size ? "[region 4]" : "[unmapped]");
 
     qxl->ssd.qxl.base.sif = &qxl_interface.base;
@@ -2167,7 +2167,7 @@ static void qxl_realize_primary(PCIDevice *dev, Error **errp)
     qxl->id = 0;
     qxl_init_ramsize(qxl);
     vga->vbe_size = qxl->vgamem_size;
-    vga->vram_size_mb = qxl->vga.vram_size >> 20;
+    vga->vram_size_mb = qxl->vga.vram_size / MiB;
     vga_common_init(vga, OBJECT(dev), true);
     vga_init(vga, OBJECT(dev),
              pci_address_space(dev), pci_address_space_io(dev), false);
@@ -2391,10 +2391,8 @@ static VMStateDescription qxl_vmstate = {
 };
 
 static Property qxl_properties[] = {
-        DEFINE_PROP_UINT32("ram_size", PCIQXLDevice, vga.vram_size,
-                           64 * 1024 * 1024),
-        DEFINE_PROP_UINT64("vram_size", PCIQXLDevice, vram32_size,
-                           64 * 1024 * 1024),
+        DEFINE_PROP_UINT32("ram_size", PCIQXLDevice, vga.vram_size, 64 * MiB),
+        DEFINE_PROP_UINT64("vram_size", PCIQXLDevice, vram32_size, 64 * MiB),
         DEFINE_PROP_UINT32("revision", PCIQXLDevice, revision,
                            QXL_DEFAULT_REVISION),
         DEFINE_PROP_UINT32("debug", PCIQXLDevice, debug, 0),
diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
index e887b45651..bd58141117 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -22,12 +22,13 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "hw/display/vga.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
 
-#define VGA_RAM_SIZE (8192 * 1024)
+#define VGA_RAM_SIZE (8 * MiB)
 
 typedef struct ISAVGAMMState {
     VGACommonState vga;
@@ -130,7 +131,7 @@ int isa_vga_mm_init(hwaddr vram_base,
 
     s = g_malloc0(sizeof(*s));
 
-    s->vga.vram_size_mb = VGA_RAM_SIZE >> 20;
+    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
     vga_common_init(&s->vga, NULL, true);
     vga_mm_init(s, vram_base, ctrl_base, it_shift, address_space);
 
diff --git a/hw/display/vga.c b/hw/display/vga.c
index ed476e4e80..d7599182a8 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/display/vga.h"
@@ -721,7 +722,7 @@ uint32_t vbe_ioport_read_data(void *opaque, uint32_t addr)
             val = s->vbe_regs[s->vbe_index];
         }
     } else if (s->vbe_index == VBE_DISPI_INDEX_VIDEO_MEMORY_64K) {
-        val = s->vbe_size / (64 * 1024);
+        val = s->vbe_size / (64 * KiB);
     } else {
         val = 0;
     }
@@ -2192,7 +2193,7 @@ void vga_common_init(VGACommonState *s, Object *obj, bool global_vmstate)
 
     s->vram_size_mb = uint_clamp(s->vram_size_mb, 1, 512);
     s->vram_size_mb = pow2ceil(s->vram_size_mb);
-    s->vram_size = s->vram_size_mb << 20;
+    s->vram_size = s->vram_size_mb * MiB;
 
     if (!s->vbe_size) {
         s->vbe_size = s->vram_size;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 2dd3c3481a..71a00718e6 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
 #include "qemu/iov.h"
 #include "ui/console.h"
@@ -1314,8 +1315,7 @@ static const VMStateDescription vmstate_virtio_gpu = {
 
 static Property virtio_gpu_properties[] = {
     DEFINE_PROP_UINT32("max_outputs", VirtIOGPU, conf.max_outputs, 1),
-    DEFINE_PROP_SIZE("max_hostmem", VirtIOGPU, conf.max_hostmem,
-                     256 * 1024 * 1024),
+    DEFINE_PROP_SIZE("max_hostmem", VirtIOGPU, conf.max_hostmem, 256 * MiB),
 #ifdef CONFIG_VIRGL
     DEFINE_PROP_BIT("virgl", VirtIOGPU, conf.flags,
                     VIRTIO_GPU_FLAG_VIRGL_ENABLED, true),
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index bd3e8b3586..08deb08783 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/loader.h"
@@ -565,7 +566,7 @@ static inline int vmsvga_fifo_length(struct vmsvga_state_s *s)
         s->fifo_next >= SVGA_FIFO_SIZE) {
         return 0;
     }
-    if (s->fifo_max < s->fifo_min + 10 * 1024) {
+    if (s->fifo_max < s->fifo_min + 10 * KiB) {
         return 0;
     }
 
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index f5afcc0358..180d205021 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -25,6 +25,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 
 #include "hw/hw.h"
 #include "ui/input.h"
@@ -889,7 +890,7 @@ static int fb_initialise(struct XenDevice *xendev)
 	return rc;
 
     fb_page = fb->c.page;
-    rc = xenfb_configure_fb(fb, videoram * 1024 * 1024U,
+    rc = xenfb_configure_fb(fb, videoram * MiB,
 			    fb_page->width, fb_page->height, fb_page->depth,
 			    fb_page->mem_length, 0, fb_page->line_length);
     if (rc != 0)
-- 
2.18.0

