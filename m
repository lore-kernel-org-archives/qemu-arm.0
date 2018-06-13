Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp629378wrq;
        Wed, 13 Jun 2018 05:33:30 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKItP7cKdi7XCnTG2fz41HD7Xh2QM4BIusfijeWnLUrG6V/f7WGyERe+l5QFze0TdD5HtKfy
X-Received: by 2002:a0c:8c4a:: with SMTP id o10-v6mr4197536qvb.87.1528893210870;
        Wed, 13 Jun 2018 05:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528893210; cv=none;
        d=google.com; s=arc-20160816;
        b=JQcW1aPaU2MELhkCGhsuVlnPa6/9MJValtrG6ZDJpYpHB70G8o8txBDBYm6gszH9kg
         5wVh9jpdRT7JKhovuil1qdV2ssex9Xn0uLk9fu5gBcU8TEzjFaxZZQfBrjzGWLfHBeiZ
         9xAkyFHBmy+RwYrQGjUhBk2OofpYKkisR1s9cNg/qZbrI+Z15MiVLIQkxQ2WMvEJ0IMG
         9N6a6/KptTGi1tbJsmRFCjj0M/F/c8r4xW6v8lQyLG+YoCGsuhCCElEXVRS2iiRyChmL
         HDI4xyyf8qwY5ZgtROJlSlH3y5LpoP3SrjC0XkU1EdaFO/HGerAoxFXfjdY9L+7QhD8+
         8GIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=z+I02w5NIYoUgefKkiEVXHFGv0w7l2/9PfeD8qLXXrQ=;
        b=my/ph3s4hz+DNwaDpehWpYthOyayfHyhXsJQgl0f+xPExuHKbqJmGXcI4wvksTfuRI
         YYTGpEylqdo+815bvHzF6jrcDG69ThTUHDQ/NLkt3d5FwlJFQHkgTOtQLDxJjo93qQW/
         zuyUwYAc2k+zw34VNCDXe2xJNjmP9/dNz3GZkgg4hfgZuNo8XaHx/gdkpk7WzItg3bMD
         L042j4/1w/S+OeqTnnB9DzB+uQLxLKlRD2Ibg63sJEpzQr6aFKl5EUf+NlCVE4F3t9K7
         P1Dz2pNz5S0PTKIpZ5e/XPYwUHdfXo/l9rI03KAIiLrvEnd9R/t/OWPgWYJ/jEZOVyA8
         bbcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q42-v6si2499544qte.348.2018.06.13.05.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 05:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT4xu-0005Ir-Ct
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 08:33:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT4uY-0002vM-Dp
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 08:30:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT4uX-0006JX-7f
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 08:30:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53116 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fT4uX-0006HZ-2w; Wed, 13 Jun 2018 08:30:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A181E8185331;
	Wed, 13 Jun 2018 12:30:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 262FB1C5AB;
	Wed, 13 Jun 2018 12:29:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id F2A193B6; Wed, 13 Jun 2018 14:29:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 Jun 2018 14:29:45 +0200
Message-Id: <20180613122948.18149-2-kraxel@redhat.com>
In-Reply-To: <20180613122948.18149-1-kraxel@redhat.com>
References: <20180613122948.18149-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 12:30:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 12:30:00 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v5 1/4] hw/display: add ramfb,
 a simple boot framebuffer living in guest ram
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iTp3mP1Wqm6t

The boot framebuffer is expected to be configured by the firmware, so it
uses fw_cfg as interface.  Initialization goes as follows:

  (1) Check whenever etc/ramfb is present.
  (2) Allocate framebuffer from RAM.
  (3) Fill struct RAMFBCfg, write it to etc/ramfb.

Done.  You can write stuff to the framebuffer now, and it should appear
automagically on the screen.

Note that this isn't very efficient because it does a full display
update on each refresh.  No dirty tracking.  Dirty tracking would have
to be active for the whole ram slot, so that wouldn't be very efficient
either.  For a boot display which is active for a short time only this
isn't a big deal.  As permanent guest display something better should be
used (if possible).

This is the ramfb core code.  Some windup is needed for display devices
which want have a ramfb boot display.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/display/ramfb.h |  9 +++++
 hw/display/ramfb.c         | 95 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/display/Makefile.objs   |  2 +
 3 files changed, 106 insertions(+)
 create mode 100644 include/hw/display/ramfb.h
 create mode 100644 hw/display/ramfb.c

diff --git a/include/hw/display/ramfb.h b/include/hw/display/ramfb.h
new file mode 100644
index 0000000000..a3d4c79942
--- /dev/null
+++ b/include/hw/display/ramfb.h
@@ -0,0 +1,9 @@
+#ifndef RAMFB_H
+#define RAMFB_H
+
+/* ramfb.c */
+typedef struct RAMFBState RAMFBState;
+void ramfb_display_update(QemuConsole *con, RAMFBState *s);
+RAMFBState *ramfb_setup(Error **errp);
+
+#endif /* RAMFB_H */
diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
new file mode 100644
index 0000000000..6867bce8ae
--- /dev/null
+++ b/hw/display/ramfb.c
@@ -0,0 +1,95 @@
+/*
+ * early boot framebuffer in guest ram
+ * configured using fw_cfg
+ *
+ * Copyright Red Hat, Inc. 2017
+ *
+ * Author:
+ *     Gerd Hoffmann <kraxel@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/loader.h"
+#include "hw/display/ramfb.h"
+#include "ui/console.h"
+#include "sysemu/sysemu.h"
+
+struct QEMU_PACKED RAMFBCfg {
+    uint64_t addr;
+    uint32_t fourcc;
+    uint32_t flags;
+    uint32_t width;
+    uint32_t height;
+    uint32_t stride;
+};
+
+struct RAMFBState {
+    DisplaySurface *ds;
+    uint32_t width, height;
+    struct RAMFBCfg cfg;
+};
+
+static void ramfb_fw_cfg_write(void *dev, off_t offset, size_t len)
+{
+    RAMFBState *s = dev;
+    void *framebuffer;
+    uint32_t stride, fourcc, format;
+    hwaddr addr, length;
+
+    s->width  = be32_to_cpu(s->cfg.width);
+    s->height = be32_to_cpu(s->cfg.height);
+    stride    = be32_to_cpu(s->cfg.stride);
+    fourcc    = be32_to_cpu(s->cfg.fourcc);
+    addr      = be64_to_cpu(s->cfg.addr);
+    length    = stride * s->height;
+    format    = qemu_drm_format_to_pixman(fourcc);
+
+    fprintf(stderr, "%s: %dx%d @ 0x%" PRIx64 "\n", __func__,
+            s->width, s->height, addr);
+    framebuffer = address_space_map(&address_space_memory,
+                                    addr, &length, false,
+                                    MEMTXATTRS_UNSPECIFIED);
+    if (!framebuffer || length < stride * s->height) {
+        s->width = 0;
+        s->height = 0;
+        return;
+    }
+    s->ds = qemu_create_displaysurface_from(s->width, s->height,
+                                            format, stride, framebuffer);
+}
+
+void ramfb_display_update(QemuConsole *con, RAMFBState *s)
+{
+    if (!s->width || !s->height) {
+        return;
+    }
+
+    if (s->ds) {
+        dpy_gfx_replace_surface(con, s->ds);
+        s->ds = NULL;
+    }
+
+    /* simple full screen update */
+    dpy_gfx_update_full(con);
+}
+
+RAMFBState *ramfb_setup(Error **errp)
+{
+    FWCfgState *fw_cfg = fw_cfg_find();
+    RAMFBState *s;
+
+    if (!fw_cfg || !fw_cfg->dma_enabled) {
+        error_setg(errp, "ramfb device requires fw_cfg with DMA");
+        return NULL;
+    }
+
+    s = g_new0(RAMFBState, 1);
+
+    fw_cfg_add_file_callback(fw_cfg, "etc/ramfb",
+                             NULL, ramfb_fw_cfg_write, s,
+                             &s->cfg, sizeof(s->cfg), false);
+    return s;
+}
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index b5d97ab26d..0af04985d2 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -1,3 +1,5 @@
+common-obj-y += ramfb.o
+
 common-obj-$(CONFIG_ADS7846) += ads7846.o
 common-obj-$(CONFIG_VGA_CIRRUS) += cirrus_vga.o
 common-obj-$(CONFIG_G364FB) += g364fb.o
-- 
2.9.3

