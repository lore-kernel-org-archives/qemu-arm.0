Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp192973wrt;
        Fri, 11 Jan 2019 06:21:56 -0800 (PST)
X-Google-Smtp-Source: ALg8bN60Jf5Ub3B5ij4kF6ZVyB0YdfQdD/28r4Hajlp5wiZOzYfbT0fPRfIRP8A/hhjRyrO+rd99
X-Received: by 2002:a5d:6684:: with SMTP id l4mr14925527wru.154.1547216516919;
        Fri, 11 Jan 2019 06:21:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216516; cv=none;
        d=google.com; s=arc-20160816;
        b=lXP2FIlvqRZM8WpDqoU8z5eVdi+GEuO14rG1vtSXrznRKqGKcQ49M650wB6MAmDiqF
         5viG/Va21oWc7AWFtiPj8okDLe5PgeRDLXYqQO9hCAy6/gfz7DZQhNSLvFqlTBHd1ekg
         iM/sXx4n58ZaAXOXSCJNwUXOIEZHAE3NFaGvDz5IOz1dumMLZGmSyuWllHygEGJ8NJQH
         ta9lNWunNImuCe+SvTQ629UVV4PuFYvnJAKUT2mEYexC5KWcgjbtlVwaUzJr01xZJYqV
         GCc+gx2M5kFZ7yq1Q2Q8fC7gGUe4xqrwYQpE7k8RXe8FqbIxrj6C1DmcyPg8QuwG5Lki
         SoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+TTlIXlwsLtV610dCxywOILe0otOaPj9WQ309veFXDk=;
        b=WkWlq/Lmhnz07nlpNSf2Hg58Byv4PDAdey1eFsRA0dHneoD6FCWlzWIqELDKemeZVV
         xoJMMhQmzbgz3pM5gt6wQl1zJR0weAfWShvAxj9kB1u4ZOtSX+EL4lRZuH2siES35bTN
         2IDAN50gb4UYH1SgNWST6DmJpAw9CqbXHxuVlp3WrVhkY0x6+ZqyLRs4KtnRRw8o6hi5
         568wMN+iyrIRNqiH1LZFFQ4EXTeJbrVqRmNCCWw2A+UTHc9vRci8j5d0FGVvuXEUgC2w
         MW/o9+8/tHl6NJKETzJPtCrVEsmXUrhuCg0JejTa0aK0fBQtsEb2VgCLnR7aZagWXxV6
         aXXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k184si13422572wmk.43.2019.01.11.06.21.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:21:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxh5-0000Nw-QN
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxdq-0005j5-8E
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:18:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxXj-0007Gv-4j
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:12:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxXi-0007A5-St; Fri, 11 Jan 2019 09:12:15 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20D04C074116;
	Fri, 11 Jan 2019 14:12:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E4FA5D6A9;
	Fri, 11 Jan 2019 14:12:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:57 +0100
Message-Id: <20190111140857.4211-16-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 11 Jan 2019 14:12:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC PATCH 15/15] ui/console: Add "ui/pixelformat.h" to
 declare PixelFormat
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
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bKnEX8ze+Wld

PixelFormat is used by "ui/console.h" and by "ui/qemu-pixman.h".

Create the new header "ui/pixelformat.h" to declare this structure,
and remove the forward declaration from "qemu/typedefs.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
RFC because "ui/console.h" has on license, so I added a default one.
---
 include/qemu/typedefs.h  |  1 -
 include/ui/console.h     | 11 +----------
 include/ui/pixelformat.h | 31 +++++++++++++++++++++++++++++++
 include/ui/qemu-pixman.h |  2 ++
 4 files changed, 34 insertions(+), 11 deletions(-)
 create mode 100644 include/ui/pixelformat.h

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index af0dc6e065..b0f33aa065 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -67,7 +67,6 @@ typedef struct PCIExpressHost PCIExpressHost;
 typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
 typedef struct PCIHostState PCIHostState;
 typedef struct PCMachineState PCMachineState;
-typedef struct PixelFormat PixelFormat;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
 typedef struct PropertyInfo PropertyInfo;
diff --git a/include/ui/console.h b/include/ui/console.h
index aa9f975544..4fa2fa5c47 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -2,6 +2,7 @@
 #define CONSOLE_H
=20
 #include "ui/qemu-pixman.h"
+#include "ui/pixelformat.h"
 #include "qom/object.h"
 #include "qemu/notify.h"
 #include "qemu/error-report.h"
@@ -121,16 +122,6 @@ struct QemuConsoleClass {
=20
 #define QEMU_ALLOCATED_FLAG     0x01
=20
-struct PixelFormat {
-    uint8_t bits_per_pixel;
-    uint8_t bytes_per_pixel;
-    uint8_t depth; /* color depth in bits */
-    uint32_t rmask, gmask, bmask, amask;
-    uint8_t rshift, gshift, bshift, ashift;
-    uint8_t rmax, gmax, bmax, amax;
-    uint8_t rbits, gbits, bbits, abits;
-};
-
 typedef struct DisplaySurface {
     pixman_format_code_t format;
     pixman_image_t *image;
diff --git a/include/ui/pixelformat.h b/include/ui/pixelformat.h
new file mode 100644
index 0000000000..585097531f
--- /dev/null
+++ b/include/ui/pixelformat.h
@@ -0,0 +1,31 @@
+/*
+ * Copyright (C) 2019 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_PIXELFORMAT_H
+#define QEMU_PIXELFORMAT_H
+
+typedef struct PixelFormat {
+    uint8_t bits_per_pixel;
+    uint8_t bytes_per_pixel;
+    uint8_t depth; /* color depth in bits */
+    uint32_t rmask, gmask, bmask, amask;
+    uint8_t rshift, gshift, bshift, ashift;
+    uint8_t rmax, gmax, bmax, amax;
+    uint8_t rbits, gbits, bbits, abits;
+} PixelFormat;
+
+#endif
diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index b7c82d17fc..999a4aa770 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -16,6 +16,8 @@
 #pragma GCC diagnostic pop
 #endif
=20
+#include "ui/pixelformat.h"
+
 /*
  * pixman image formats are defined to be native endian,
  * that means host byte order on qemu.  So we go define
--=20
2.17.2

