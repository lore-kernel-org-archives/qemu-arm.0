Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4645932ejc;
        Wed, 18 Oct 2023 06:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERUpcQFkGiVRPQ3XUFiyuSssmyO5US+Dsebs8Qw8NhpxOq226ovebSeISW7aQ35tihspag
X-Received: by 2002:a05:620a:4589:b0:76f:1ead:e4f4 with SMTP id bp9-20020a05620a458900b0076f1eade4f4mr6138057qkb.15.1697636445606;
        Wed, 18 Oct 2023 06:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636445; cv=none;
        d=google.com; s=arc-20160816;
        b=XfSuDj7Hgsdpz6l+ESYyvzYLB6B3WaDe7bqFxkcCfPl+JIFGNGD0OO8ARsPb7XFZz9
         wiv+fP8+kM7lIliKYfIpYvzJD1YDzz9tWl+9JLBWYUvrzC5U7QOgE90yFQgB+qJNdBVT
         4C0KBNgPK64G/HMCcoQGv1JajP4G4oFFrNR2plvJA0afgiGR5f70QOesRKGgV81W0tp0
         NAn9CThBt0XoDWgj/0/WlZ5AYXFQyeg4EI9Y/RsALhM0Bz3uQsNSvFPh2WMBEiGMBA3h
         crKOHp45ekCrcoq+83b7wAr5bPadTcVsVl6C5yrncb5ekyOpnL/OojmZPNVf1VcYiaR9
         5lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wqmOM7rKyw7voqq+osQzrdnEyrMcVOyoluafJI8nvmY=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=vlonGyh5CoVr8OcxqBggmSYT0A2ESTAPE4k0SFgBS/wz3M4rIbVFQ0LPLx/axlwd/x
         COg0ZON3HAfSVn2qXmIGbBBt51gtF9cyVm7PtZn37Z09rnOkfxX6DoINfgNU/Xhx91GC
         FaU4DeCMJshoGcC5kgw3jIRugdelTpeZs8T/StzWdqLpvJ7DCqlw0k8Gbx2YYhuD6i7g
         l3eC01NmPZvgYeyH9BrWAvF+wgztJuJfqGTtWHJ6mehD17+Wj1hFY8Y/t17VzvFll+ho
         DwjkRS/LXiUMkYA1LTOM4eCjdSRxW03y/9Ce+pL58x2ihF87de21l0twO5v1kQuo/vqf
         rNyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VTIgvrTw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp39-20020a05620a45a700b0077433fe23b1si2695978qkb.277.2023.10.18.06.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VTIgvrTw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt6lz-0001q6-Nt; Wed, 18 Oct 2023 09:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lv-0001Mr-F6
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lt-0006KV-7k
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqmOM7rKyw7voqq+osQzrdnEyrMcVOyoluafJI8nvmY=;
 b=VTIgvrTwBgIX/NpGFCvCVIRhnXvQgv1rCMBqNrO42h1E2GnFT2zf5zStXI0m03spw1JkTg
 YP3YC6/5bChA7noUDQthW3wpFng2aRjot/C+vITF88scdcV777oedwKxUSPumO2tY0NYif
 HduOpfUxp0XBAcWIxbUNoMKF7KvU/Fk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-ue1TEnxwNuWU1joB0k1PSg-1; Wed, 18 Oct 2023 09:39:32 -0400
X-MC-Unique: ue1TEnxwNuWU1joB0k1PSg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B48C3C1ACD9;
 Wed, 18 Oct 2023 13:39:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A29F492BEE;
 Wed, 18 Oct 2023 13:39:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 15/19] ui/dbus: do not require PIXMAN
Date: Wed, 18 Oct 2023 17:38:16 +0400
Message-ID: <20231018133820.1556962-16-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oaJXxk/mY3is

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Implement a fallback path for region 2D update.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus-listener.c | 90 ++++++++++++++++++++++++++++++++--------------
 ui/meson.build     |  4 +--
 2 files changed, 65 insertions(+), 29 deletions(-)

diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index 36548a7f52..18f556aa73 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -26,9 +26,6 @@
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "dbus.h"
-#ifdef CONFIG_OPENGL
-#include <pixman.h>
-#endif
 #ifdef G_OS_UNIX
 #include <gio/gunixfdlist.h>
 #endif
@@ -41,6 +38,7 @@
 #include "ui/shader.h"
 #include "ui/egl-helpers.h"
 #include "ui/egl-context.h"
+#include "ui/qemu-pixman.h"
 #endif
 #include "trace.h"
 
@@ -62,9 +60,11 @@ struct _DBusDisplayListener {
 
     QemuDBusDisplay1Listener *proxy;
 
-#ifdef CONFIG_OPENGL
+#ifdef CONFIG_PIXMAN
     /* Keep track of the damage region */
     pixman_region32_t gl_damage;
+#else
+    int gl_damage;
 #endif
 
     DisplayChangeListener dcl;
@@ -545,6 +545,7 @@ static void dbus_gl_refresh(DisplayChangeListener *dcl)
         return;
     }
 
+#ifdef CONFIG_PIXMAN
     int n_rects = pixman_region32_n_rects(&ddl->gl_damage);
 
     for (int i = 0; i < n_rects; i++) {
@@ -555,6 +556,13 @@ static void dbus_gl_refresh(DisplayChangeListener *dcl)
                             box->x2 - box->x1, box->y2 - box->y1);
     }
     pixman_region32_clear(&ddl->gl_damage);
+#else
+    if (ddl->gl_damage) {
+        dbus_call_update_gl(dcl, 0, 0,
+                            surface_width(ddl->ds), surface_height(ddl->ds));
+        ddl->gl_damage = 0;
+    }
+#endif
 }
 #endif /* OPENGL */
 
@@ -569,20 +577,64 @@ static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
 
+#ifdef CONFIG_PIXMAN
     pixman_region32_t rect_region;
     pixman_region32_init_rect(&rect_region, x, y, w, h);
     pixman_region32_union(&ddl->gl_damage, &ddl->gl_damage, &rect_region);
     pixman_region32_fini(&rect_region);
+#else
+    ddl->gl_damage++;
+#endif
 }
 #endif
 
+static void dbus_gfx_update_sub(DBusDisplayListener *ddl,
+                                int x, int y, int w, int h)
+{
+    pixman_image_t *img;
+    size_t stride;
+    GVariant *v_data;
+
+    /* make a copy, since gvariant only handles linear data */
+    stride = w * DIV_ROUND_UP(PIXMAN_FORMAT_BPP(surface_format(ddl->ds)), 8);
+    img = pixman_image_create_bits(surface_format(ddl->ds),
+                                   w, h, NULL, stride);
+#ifdef CONFIG_PIXMAN
+    pixman_image_composite(PIXMAN_OP_SRC, ddl->ds->image, NULL, img,
+                           x, y, 0, 0, 0, 0, w, h);
+#else
+    {
+        uint8_t *src = (uint8_t *)pixman_image_get_data(ddl->ds->image);
+        uint8_t *dst = (uint8_t *)pixman_image_get_data(img);
+        int bp = PIXMAN_FORMAT_BPP(surface_format(ddl->ds)) / 8;
+        int hh;
+
+        for (hh = 0; hh < h; hh++) {
+            memcpy(&dst[stride * hh],
+                   &src[surface_stride(ddl->ds) * (hh + y) + x * bp],
+                   stride);
+        }
+    }
+#endif
+    v_data = g_variant_new_from_data(
+        G_VARIANT_TYPE("ay"),
+        pixman_image_get_data(img),
+        pixman_image_get_stride(img) * h,
+        TRUE,
+        (GDestroyNotify)pixman_image_unref,
+        img);
+    qemu_dbus_display1_listener_call_update(ddl->proxy,
+        x, y, w, h, pixman_image_get_stride(img), pixman_image_get_format(img),
+        v_data,
+        G_DBUS_CALL_FLAGS_NONE,
+        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+}
+
 static void dbus_gfx_update(DisplayChangeListener *dcl,
                             int x, int y, int w, int h)
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
-    pixman_image_t *img;
     GVariant *v_data;
-    size_t stride;
 
     assert(ddl->ds);
 
@@ -619,25 +671,7 @@ static void dbus_gfx_update(DisplayChangeListener *dcl,
         return;
     }
 
-    /* make a copy, since gvariant only handles linear data */
-    stride = w * DIV_ROUND_UP(PIXMAN_FORMAT_BPP(surface_format(ddl->ds)), 8);
-    img = pixman_image_create_bits(surface_format(ddl->ds),
-                                   w, h, NULL, stride);
-    pixman_image_composite(PIXMAN_OP_SRC, ddl->ds->image, NULL, img,
-                           x, y, 0, 0, 0, 0, w, h);
-
-    v_data = g_variant_new_from_data(
-        G_VARIANT_TYPE("ay"),
-        pixman_image_get_data(img),
-        pixman_image_get_stride(img) * h,
-        TRUE,
-        (GDestroyNotify)pixman_image_unref,
-        img);
-    qemu_dbus_display1_listener_call_update(ddl->proxy,
-        x, y, w, h, pixman_image_get_stride(img), pixman_image_get_format(img),
-        v_data,
-        G_DBUS_CALL_FLAGS_NONE,
-        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+    dbus_gfx_update_sub(ddl, x, y, w, h);
 }
 
 #ifdef CONFIG_OPENGL
@@ -751,8 +785,10 @@ dbus_display_listener_dispose(GObject *object)
     g_clear_object(&ddl->map_proxy);
     g_clear_object(&ddl->d3d11_proxy);
     g_clear_pointer(&ddl->peer_process, CloseHandle);
-#ifdef CONFIG_OPENGL
+#ifdef CONFIG_PIXMAN
     pixman_region32_fini(&ddl->gl_damage);
+#endif
+#ifdef CONFIG_OPENGL
     egl_fb_destroy(&ddl->fb);
 #endif
 #endif
@@ -787,7 +823,7 @@ dbus_display_listener_class_init(DBusDisplayListenerClass *klass)
 static void
 dbus_display_listener_init(DBusDisplayListener *ddl)
 {
-#ifdef CONFIG_OPENGL
+#ifdef CONFIG_PIXMAN
     pixman_region32_init(&ddl->gl_damage);
 #endif
 }
diff --git a/ui/meson.build b/ui/meson.build
index 7f806a6d48..bfa06b8c01 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -93,7 +93,7 @@ if dbus_display
                                           '--generate-c-code', '@BASENAME@'])
   dbus_display1_lib = static_library('dbus-display1', dbus_display1, dependencies: gio)
   dbus_display1_dep = declare_dependency(link_with: dbus_display1_lib, include_directories: include_directories('.'))
-  dbus_ss.add(when: [gio, pixman, dbus_display1_dep],
+  dbus_ss.add(when: [gio, dbus_display1_dep],
               if_true: [files(
                 'dbus-chardev.c',
                 'dbus-clipboard.c',
@@ -101,7 +101,7 @@ if dbus_display
                 'dbus-error.c',
                 'dbus-listener.c',
                 'dbus.c',
-              ), opengl, gbm])
+              ), opengl, gbm, pixman])
   ui_modules += {'dbus' : dbus_ss}
 endif
 
-- 
2.41.0

