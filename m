Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3074299wru;
        Fri, 10 Aug 2018 06:29:42 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwF9uq8Nr3X3K1EFYDmcWEnHdy81EBQHvW+hp+hCVoj7iEMehUVyhJpVeZ5TTMtOvk7QVu1
X-Received: by 2002:ac8:fc9:: with SMTP id f9-v6mr6560261qtk.377.1533907782457;
        Fri, 10 Aug 2018 06:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533907782; cv=none;
        d=google.com; s=arc-20160816;
        b=d69W/UJQRnGMWvuR6XBfwQzcRnqmYPtataiRq1sa60jrkZPXyvp+Klix/hfSXFd3U+
         qA+f9iJWDTrfNReMUwLncuVUpHJi/x8fp8xerVa1RU5u+awA9OLfxQ2PhIhKe0CclEoA
         alMNfBT3UIFnvkSnzCl8F4+of1Do08MNctQM8laQFhZCjWX7MLqH1HGL9nXDbYlq68mE
         EkTNnrLSTYHtgEvCYtpfY+393xH+KhZWGAtSTJ9hcS1inCXbgsWvtddSIGYRWRUqaD6k
         DZ44FE4GDon+LUX543+BkPGYCpd7mwRt2eupiqcdWK1G0wlLfS0rq+AKMiDEexdFmgxs
         sTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Xfy66jt6qLxAthyZOTLPEBzibUsoC5UNBGOpFsJwVf8=;
        b=pDvU0DcBOSVVi7gKbh8AIjDEhiR66oYSF2qv9oGwIO9XuayBCAQk/QmevKYbEqa3pF
         P0FWV6ZKYc5KZRhjtiXTwVCo+9EZCz0b+UZ6tN0fo07zeoG6dZWM96FkImxlWj8sgw6v
         a+UjdPXbFmvwpXSrDoh8uQaQvfTCw+TatxtveEAF3uZysXxrE8qe31eiuu64ILUPmkrl
         HtvaHbO29gUQ3xSG+4NjFn9F7o9upk+bhrbkolzAC/Ux18uiCM9CwxPUhwLrZdAyJFla
         gZZtK57AY7O3AHXqdZFZKBRb3Aq+CzDGtyvE6ciixLOXWz6wBZPmSAOfU/UeveWMk6kr
         fRgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37-v6si939385qvb.268.2018.08.10.06.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Aug 2018 06:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fo7U6-0001LC-09
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 09:29:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fo7Ty-0001L5-NE
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 09:29:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fo7Tw-0007de-2A
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 09:29:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47552 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fo7Tv-0007dH-SY; Fri, 10 Aug 2018 09:29:31 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6ACCB40201C7;
	Fri, 10 Aug 2018 13:29:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-23.ams2.redhat.com
	[10.36.116.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A9ED10CD7E5;
	Fri, 10 Aug 2018 13:29:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 5BE279B33; Fri, 10 Aug 2018 15:29:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 10 Aug 2018 15:28:56 +0200
Message-Id: <20180810132856.22833-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 10 Aug 2018 13:29:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 10 Aug 2018 13:29:31 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] use dpy_gfx_update_full
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
	Alistair Francis <alistair@alistair23.me>,
	"open list:Exynos" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4az/E/Lv8sAl

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
index 3ddd29c0de..79bfef0b99 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1187,7 +1187,7 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
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

