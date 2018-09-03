Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2130015wrd;
        Sun, 2 Sep 2018 23:58:17 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vda1J0aaC2LO+p6HvRqmIpNtaITSjeDOImSbAdAbR1vu2JMmuPDOVm08RBVZN5A3+9aBjC+f
X-Received: by 2002:a37:ad0a:: with SMTP id f10-v6mr24088985qkm.186.1535957897762;
        Sun, 02 Sep 2018 23:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535957897; cv=none;
        d=google.com; s=arc-20160816;
        b=XY4I34ofPzJnaWC3PhZ2mpzk3LqTNXNzyIftMFBUxhGNSTpTDrryT5gnDhEaIOmnX0
         EZa6FSwI+ZZWvnkdUJAA4LIQxhd0OSshawiCpqGtGnj4bU2l8Cnoh91DcYyE3rDJdIHB
         UbHKL8mNUk++DYcUeQF7cne00KIvQltMnS/kiPggS0kI5POuy5jQQhKklFmJCix9CpVI
         DTh4x53hIhWo2J5HIP9MAILz6dD5MKyaWxxPNz9ynU8NKHp9aT6V7pa1p2fnxG5Ikemh
         s6lSsbnY5Qm4wddlMLG4EKs3rDz8oum6ivqyGK9moB3rT4sz/5Vg4OjNf4wCitYBCafU
         FQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ZFthR2QpkItZzpmgrhw7koDP8j/g/hAIyqEQnD7585A=;
        b=N4J5uhZBOSAWpCZOF6tZCpcq7NPNr/yGygqyVM7rAP97NFPePiZ81r0R1wMlAjsJ9j
         QjNt8I5HgY3aP2N8FMZtdlqUA2xtAeitGiq5QVDXNLi+HR3VH/lVZJUD3qQvkU6unSAe
         /40tz+Vt2UJVeLAkIdaXBR76Om2+YX/azOo6/P9UIQj+E8qEqrqnraA/qPswekt5lkX5
         zr5NVZXfEBeZbaQfofMa+SXFpYuIqTlf3IBFk2yXotef8s8JDkcQTf6K3UAkjHpiPe5q
         YU0XHIUqD9Hur9KM0e7mdSQcYXj+Xk9eUc0gncmUH+dVRefHg4EwFGEVygJFvtw9CARW
         LbCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m125-v6si5286189qkc.20.2018.09.02.23.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Sep 2018 23:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fwioT-0001uV-7H
	for alex.bennee@linaro.org; Mon, 03 Sep 2018 02:58:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio7-0001lS-I2
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio4-0008Cf-Bg
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50636 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fwio4-0008Bs-31; Mon, 03 Sep 2018 02:57:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97863801145A;
	Mon,  3 Sep 2018 06:57:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-66.ams2.redhat.com
	[10.36.116.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8DB12026D6B;
	Mon,  3 Sep 2018 06:57:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 17D879B1C; Mon,  3 Sep 2018 08:57:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Sep 2018 08:57:43 +0200
Message-Id: <20180903065745.23055-4-kraxel@redhat.com>
In-Reply-To: <20180903065745.23055-1-kraxel@redhat.com>
References: <20180903065745.23055-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 03 Sep 2018 06:57:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 03 Sep 2018 06:57:51 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 3/5] use dpy_gfx_update_full
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RXeMKTF5oAos

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20180810132856.22833-1-kraxel@redhat.com
---
 hw/display/exynos4210_fimd.c | 4 +---
 hw/display/g364fb.c          | 2 +-
 hw/display/jazz_led.c        | 3 +--
 hw/display/tc6393xb.c        | 4 ++--
 hw/display/vga.c             | 3 +--
 hw/display/virtio-gpu.c      | 2 +-
 hw/display/vmware_vga.c      | 5 +----
 hw/display/xlnx_dp.c         | 3 +--
 8 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index f011ea5b00..083b3172da 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1272,8 +1272,6 @@ static void exynos4210_fimd_update(void *opaque)
     uint8_t *host_fb_addr;
     bool is_dirty = false;
     const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
-    const int global_height = ((s->vidtcon[2] >> FIMD_VIDTCON2_VER_SHIFT) &
-            FIMD_VIDTCON2_SIZE_MASK) + 1;
 
     if (!s || !s->console || !s->enabled ||
         surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
@@ -1329,7 +1327,7 @@ static void exynos4210_fimd_update(void *opaque)
             fimd_copy_line_toqemu(global_width, s->ifb + global_width * line *
                     RGBA_SIZE, d + global_width * line * bpp);
         }
-        dpy_gfx_update(s->console, 0, 0, global_width, global_height);
+        dpy_gfx_update_full(s->console);
     }
     s->invalidate = false;
     s->vidintcon[1] |= FIMD_VIDINT_INTFRMPEND;
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index fbc2b2422d..8ad7e5d824 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -229,7 +229,7 @@ static void g364fb_draw_blank(G364State *s)
         d += surface_stride(surface);
     }
 
-    dpy_gfx_update(s->con, 0, 0, s->width, s->height);
+    dpy_gfx_update_full(s->con);
     s->blanked = 1;
 }
 
diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index 3c97d56434..eb7933d2a3 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -214,8 +214,7 @@ static void jazz_led_update_display(void *opaque)
     }
 
     s->state = REDRAW_NONE;
-    dpy_gfx_update(s->con, 0, 0,
-                   surface_width(surface), surface_height(surface));
+    dpy_gfx_update_full(s->con);
 }
 
 static void jazz_led_invalidate_display(void *opaque)
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 8392e59493..3360be6f84 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -461,7 +461,7 @@ static void tc6393xb_draw_graphic(TC6393xbState *s, int full_update)
             return;
     }
 
-    dpy_gfx_update(s->con, 0, 0, s->scr_width, s->scr_height);
+    dpy_gfx_update_full(s->con);
 }
 
 static void tc6393xb_draw_blank(TC6393xbState *s, int full_update)
@@ -480,7 +480,7 @@ static void tc6393xb_draw_blank(TC6393xbState *s, int full_update)
         d += surface_stride(surface);
     }
 
-    dpy_gfx_update(s->con, 0, 0, s->scr_width, s->scr_height);
+    dpy_gfx_update_full(s->con);
 }
 
 static void tc6393xb_update_display(void *opaque)
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 802cfd47db..3ba3f6853c 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -1745,8 +1745,7 @@ static void vga_draw_blank(VGACommonState *s, int full_update)
         memset(d, 0, w);
         d += surface_stride(surface);
     }
-    dpy_gfx_update(s->con, 0, 0,
-                   s->last_scr_width, s->last_scr_height);
+    dpy_gfx_update_full(s->con);
 }
 
 #define GMODE_TEXT     0
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 1cc953006f..410cf0c98a 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1182,7 +1182,7 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
         }
 
         dpy_gfx_replace_surface(scanout->con, scanout->ds);
-        dpy_gfx_update(scanout->con, 0, 0, scanout->width, scanout->height);
+        dpy_gfx_update_full(scanout->con);
         if (scanout->cursor.resource_id) {
             update_cursor(g, &scanout->cursor);
         }
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 0bbb78b9a6..afbf1c5973 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -1116,7 +1116,6 @@ static inline void vmsvga_check_size(struct vmsvga_state_s *s)
 static void vmsvga_update_display(void *opaque)
 {
     struct vmsvga_state_s *s = opaque;
-    DisplaySurface *surface;
 
     if (!s->enable || !s->config) {
         /* in standard vga mode */
@@ -1125,15 +1124,13 @@ static void vmsvga_update_display(void *opaque)
     }
 
     vmsvga_check_size(s);
-    surface = qemu_console_surface(s->vga.con);
 
     vmsvga_fifo_run(s);
     vmsvga_update_rect_flush(s);
 
     if (s->invalidated) {
         s->invalidated = 0;
-        dpy_gfx_update(s->vga.con, 0, 0,
-                   surface_width(surface), surface_height(surface));
+        dpy_gfx_update_full(s->vga.con);
     }
 }
 
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 6439bd05ef..cc0f9bc9cc 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1186,8 +1186,7 @@ static void xlnx_dp_update_display(void *opaque)
     /*
      * XXX: We might want to update only what changed.
      */
-    dpy_gfx_update(s->console, 0, 0, surface_width(s->g_plane.surface),
-                                     surface_height(s->g_plane.surface));
+    dpy_gfx_update_full(s->console);
 }
 
 static const GraphicHwOps xlnx_dp_gfx_ops = {
-- 
2.9.3

