Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3721228wrq;
        Mon, 18 Jun 2018 02:59:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKDxfHlYaL1n7u8x3rh22hK7pS+rqnou3xpr5znn9/zYWTfrQkDczOfSMhpZxhZ95RStWXN
X-Received: by 2002:a37:2e46:: with SMTP id u67-v6mr9110484qkh.106.1529315940709;
        Mon, 18 Jun 2018 02:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529315940; cv=none;
        d=google.com; s=arc-20160816;
        b=H1MU1GYT5ALqheJnb1Auo+s/Tz7CvZFtXh7qrGXKV885C31E7MzDoUZ7b99Ibcm1SO
         UpfsSrn2CAs1O+NPuSSTcamsElzDO+ELkwwBvrzcqpQngm2XTJh99zBIIArxo/KXaCUM
         LYBQhFoJOx3cdPAXC12Mvxw75DZgDljtKfM+rb8bpr0JGIogGnrpY4WOJ6hq8p04zMvE
         kXwwwww06hyNOk30MYiInBUMyhIqqSO9cuLoxYHTeCqsUYvKIOGQKAW5fGgOwqkFz2Dx
         sM5kY2NiDQtcXj9XjjXagbUzwzsVAGNVrtjPNRpU+RZZZzA3BAu1gmvzzBagi6RKZ6Bz
         daTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ub0OT4BU1ACcRlvehk3Up8SCJMGVBg16/2VW6IfIExE=;
        b=KmPE8XqyAscOBA8wFDJbU/+ZlH0CqrWMAGYUSogAfX8zE9nf71p3wy90NCp7H0TfJC
         JnGJu+zWCp2kHfp6vcwpaxZuT5xkfVqWDipZpW0e94GCvY//czdgYpIpvv3j/9Syfi23
         R+fH14fUO9mmj7ESxaOIMdmL05y9VJKyiPFIFOWfDn1qoe+EJNbe1fznhYcsQd0EZfFL
         oZfQfcEex+2tc7j4fmQEHFvYHYlbNGTPygHELUmHURHWWRbt68RAThxJ774LQQShx6ZT
         p2A6VfZPsfuAZRRRRXQdhfsJs4b0nb1MRgkuU5bPmwOgc9bRjddhflPhTSIP4VPrQf2k
         yewQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188-v6si7212104qkb.204.2018.06.18.02.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jun 2018 02:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUqw8-0001ZW-6p
	for alex.bennee@linaro.org; Mon, 18 Jun 2018 05:59:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fUqvN-0001PT-60
	for qemu-devel@nongnu.org; Mon, 18 Jun 2018 05:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fUqvM-0003L1-33
	for qemu-devel@nongnu.org; Mon, 18 Jun 2018 05:58:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57158 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fUqvE-0003JH-Tl; Mon, 18 Jun 2018 05:58:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62C6A81663C3;
	Mon, 18 Jun 2018 09:58:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D29C7C4F;
	Mon, 18 Jun 2018 09:57:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7371624EF0F; Mon, 18 Jun 2018 11:57:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Jun 2018 11:57:56 +0200
Message-Id: <20180618095758.5006-3-kraxel@redhat.com>
In-Reply-To: <20180618095758.5006-1-kraxel@redhat.com>
References: <20180618095758.5006-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 18 Jun 2018 09:58:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 18 Jun 2018 09:58:04 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PULL 2/4] hw/display: add ramfb,
 a simple boot framebuffer living in guest ram
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ipbnh6sx30vk

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
Tested-by: Laszlo Ersek <lersek@redhat.com>
Message-id: 20180613122948.18149-2-kraxel@redhat.com
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

