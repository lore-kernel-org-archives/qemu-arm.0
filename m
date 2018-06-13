Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp397585wrq;
        Wed, 13 Jun 2018 01:42:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKLYJegbwrlVlDUg8q5USCDiZVRPirxiKeb+bnWjdEgHh3z+zx9Suawwdw5IaL0pUzbDT/b
X-Received: by 2002:a37:a08b:: with SMTP id j133-v6mr3578537qke.74.1528879330675;
        Wed, 13 Jun 2018 01:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528879330; cv=none;
        d=google.com; s=arc-20160816;
        b=aOWIFNcYlvAznMiL0+TSTNrO2ykAXT6HBDIoj9Z4oLGMT2Gp43HrNGD48Ps9P/rGyQ
         lhsdZv4wW/aPrVVIND4ne6EagmdExkA32dtgoRZSDyGz8WiWHCcbpbCfIc70nnyn076f
         fWtbIGzusUlVMWlriLHA4zrLR2FN2iB/96dJZkfKqSIQ4BFL1p37S4YKRK3tDWIV5BxP
         u3HP8RW54zNIJw0rcgSh8WhVUFBo463lkSNGyD91nLfZ+hvV6Zm3uJTLV7jA3nHqxIWZ
         QMmZRwmjVvKyCQ9ylM0oobJkQCDqivSj8GVCTgah+Gv0laoSK2TDuF6EDmBG+yO1Ph4x
         Ak2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=z+I02w5NIYoUgefKkiEVXHFGv0w7l2/9PfeD8qLXXrQ=;
        b=wjXuZVRonbykwQgfKkwnNpp46VhNhkg8T6eeHs8csySjHfbWjUdOQaQoS3S/QbvjpT
         HuyTA8lwgNx0juByw7RQM/EuWcae7iXD14NrOtKcvoiJHWXIb4VudPqSO6g+sdhgqzqm
         VI7DAhpX3bcew0LH+q8hNVaTML+3Bvu81lp9rDo0NnxbOCtJeJ19ijonXysgbtf6h/Rz
         DbQV3gYm3xK9t7KJAXy7DgySXdldr9Tb3GbAY8X+KOW0RcI9S62gimJEdsb0uqraslRS
         Bf5DiWvTvAh5AjDG6MU6oMeR7SMoSoSuWxC7uPSornv7ikZBC7YHAih85ykEKkB0CcLy
         C43g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l25-v6si2140941qtk.158.2018.06.13.01.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1M2-0005mD-42
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:42:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT1Lq-0005jX-Ri
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:42:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT1Lp-00018S-Oe
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:41:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50876 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fT1Lp-00018B-Ik; Wed, 13 Jun 2018 04:41:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D623401EF05;
	Wed, 13 Jun 2018 08:41:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B87C21C597;
	Wed, 13 Jun 2018 08:41:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 23E62204B7; Wed, 13 Jun 2018 10:41:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 Jun 2018 10:41:47 +0200
Message-Id: <20180613084149.14523-2-kraxel@redhat.com>
In-Reply-To: <20180613084149.14523-1-kraxel@redhat.com>
References: <20180613084149.14523-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 13 Jun 2018 08:41:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 13 Jun 2018 08:41:57 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 1/3] hw/display: add ramfb,
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
X-TUID: BUusrJ22V8BA

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

