Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp920026wrv;
        Fri, 12 Jul 2019 06:41:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbOGBeHQstCrI7Lfhm7Cy8ETAi/D12lfuP2hG2wiIKhVgIr39x63NZUbBGF2m+003XgmcU
X-Received: by 2002:a17:906:af54:: with SMTP id ly20mr8167555ejb.194.1562938876025;
        Fri, 12 Jul 2019 06:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562938876; cv=none;
        d=google.com; s=arc-20160816;
        b=vasN7T5He6JBO9vvU57vt+oYxgxprV5oQb78W98tEsIFIZlG5TjS6eIfVlKX3hGcuh
         iKM5OTMwPPfoj3TmzL9FTNCteiJ1+deWprs5vwGBBHBEglplFYvZXq6JBX8u+QH9F9wd
         TZNmNCDEm2hcLVht8tT6p74n4YlNb8Ot2ZeVVWrh5KFH6ly4VdBh9QrEpjTfREczz1Fh
         5gH1Nslcn6webP+zsDiQY50i+AsMYddD21dLbC0UDlU4baKqptCiZhI6Zz0PzydtccLc
         6R8rzbag6rdx1KMbqV0/5/FPm4aUnEtm+htmF0lHrkASi6DKU3BaNlZPJQoBh82xONkk
         Ao7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=D65al7aAVQUoE60vck5d0SN3eroXBmItcTGoV7s20Fw=;
        b=BuYHcP8RUdUlyhHWuaR1HdvPZT1K5zqLOBeKbo9Mkq/mZ76BX28Pe/UEozVCLC6Ve3
         rwVkBUv44qFB3zJRNbjFOBlazlp6Pl2tjU2jP6T2K4vrfvJwnGfWV6x7xbnG0zrh8G4o
         Ot3PI6oQH9xHPFJvFb/F9MLnWk2SukUXkIbomtnmsSm86BJscOZBXMjUN7Hw22Rq81eZ
         jNpwRaBdRq7MW2QI7/Ll4Fd6bVoht53WD2AmXwGK0Mi2kdEnPeV/MXrcRAct5kP5bnJW
         v2YD9xpZcqIXndbqOqty3Yi0f/tMLIdTljK7JEgBxeigeeOlzGBXSVfve0nINajycKi0
         9AOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22si4580226eje.19.2019.07.12.06.41.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 06:41:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlvnX-0001GR-4Y
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 09:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57905)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlvnT-0001G3-Qh
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:41:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlvnS-0007YP-B6
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:41:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55362)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlvnS-0007Xf-38; Fri, 12 Jul 2019 09:41:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6457F30C34D4;
 Fri, 12 Jul 2019 13:41:09 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FF26196AB;
 Fri, 12 Jul 2019 13:40:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:39:27 +0200
Message-Id: <20190712133928.21394-7-philmd@redhat.com>
In-Reply-To: <20190712133928.21394-1-philmd@redhat.com>
References: <20190712133928.21394-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 12 Jul 2019 13:41:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1? 6/7] vl: Extract bt_parse() into its own
 file
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: El4Isemmj9P5

This is required to be able to compile vl.c with CONFIG_BLUETOOTH
disabled.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
2300 lines less for the C preprocessor :)
---
 Makefile.objs       |   2 +-
 bt-opts.c           | 140 ++++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/bt.h |   3 +
 vl.c                | 128 ----------------------------------------
 4 files changed, 144 insertions(+), 129 deletions(-)
 create mode 100644 bt-opts.c

diff --git a/Makefile.objs b/Makefile.objs
index 6a143dcd57..c2845a0efc 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -65,7 +65,7 @@ common-obj-y +=3D replay/
=20
 common-obj-y +=3D ui/
 common-obj-m +=3D ui/
-common-obj-y +=3D bt-host.o bt-vhci.o
+common-obj-y +=3D bt-host.o bt-vhci.o bt-opts.o
 bt-host.o-cflags :=3D $(BLUEZ_CFLAGS)
=20
 common-obj-y +=3D dma-helpers.o
diff --git a/bt-opts.c b/bt-opts.c
new file mode 100644
index 0000000000..d14ae4836f
--- /dev/null
+++ b/bt-opts.c
@@ -0,0 +1,140 @@
+/*
+ * Bluetooth command line options.
+ *
+ * Copyright (C) 2008 Andrzej Zaborowski
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/cutils.h"
+#include "sysemu/bt.h"
+#include "net/net.h"
+#include "hw/bt.h"
+
+static int nb_hcis;
+static int cur_hci;
+static struct HCIInfo *hci_table[MAX_NICS];
+
+struct HCIInfo *qemu_next_hci(void)
+{
+    if (cur_hci =3D=3D nb_hcis) {
+        return &null_hci;
+    }
+
+    return hci_table[cur_hci++];
+}
+
+static int bt_hci_parse(const char *str)
+{
+    struct HCIInfo *hci;
+    bdaddr_t bdaddr;
+
+    if (nb_hcis >=3D MAX_NICS) {
+        error_report("too many bluetooth HCIs (max %i)", MAX_NICS);
+        return -1;
+    }
+
+    hci =3D hci_init(str);
+    if (!hci) {
+        return -1;
+    }
+
+    bdaddr.b[0] =3D 0x52;
+    bdaddr.b[1] =3D 0x54;
+    bdaddr.b[2] =3D 0x00;
+    bdaddr.b[3] =3D 0x12;
+    bdaddr.b[4] =3D 0x34;
+    bdaddr.b[5] =3D 0x56 + nb_hcis;
+    hci->bdaddr_set(hci, bdaddr.b);
+
+    hci_table[nb_hcis++] =3D hci;
+
+    return 0;
+}
+
+static void bt_vhci_add(int vlan_id)
+{
+    struct bt_scatternet_s *vlan =3D qemu_find_bt_vlan(vlan_id);
+
+    if (!vlan->slave) {
+        warn_report("adding a VHCI to an empty scatternet %i", vlan_id);
+    }
+
+    bt_vhci_init(bt_new_hci(vlan));
+}
+
+static struct bt_device_s *bt_device_add(const char *opt)
+{
+    struct bt_scatternet_s *vlan;
+    int vlan_id =3D 0;
+    char *endp =3D strstr(opt, ",vlan=3D");
+    int len =3D (endp ? endp - opt : strlen(opt)) + 1;
+    char devname[10];
+
+    pstrcpy(devname, MIN(sizeof(devname), len), opt);
+
+    if (endp) {
+        if (qemu_strtoi(endp + 6, (const char **)&endp, 0, &vlan_id) < 0=
) {
+            error_report("unrecognised bluetooth vlan Id");
+            return 0;
+        }
+    }
+
+    vlan =3D qemu_find_bt_vlan(vlan_id);
+
+    if (!vlan->slave) {
+        warn_report("adding a slave device to an empty scatternet %i",
+                    vlan_id);
+    }
+
+    if (!strcmp(devname, "keyboard")) {
+        return bt_keyboard_init(vlan);
+    }
+
+    error_report("unsupported bluetooth device '%s'", devname);
+    return 0;
+}
+
+int bt_parse(const char *opt)
+{
+    const char *endp, *p;
+    int vlan;
+
+    if (strstart(opt, "hci", &endp)) {
+        if (!*endp || *endp =3D=3D ',') {
+            if (*endp) {
+                if (!strstart(endp, ",vlan=3D", 0)) {
+                    opt =3D endp + 1;
+                }
+            }
+
+            return bt_hci_parse(opt);
+       }
+    } else if (strstart(opt, "vhci", &endp)) {
+        if (!*endp || *endp =3D=3D ',') {
+            if (*endp) {
+                if (strstart(endp, ",vlan=3D", &p)) {
+                    if (qemu_strtoi(p, &endp, 0, &vlan) < 0) {
+                        error_report("bad scatternet '%s'", p);
+                        return 1;
+                    }
+                } else {
+                    error_report("bad parameter '%s'", endp + 1);
+                    return 1;
+                }
+            } else {
+                vlan =3D 0;
+            }
+
+            bt_vhci_add(vlan);
+            return 0;
+        }
+    } else if (strstart(opt, "device:", &endp)) {
+        return !bt_device_add(endp);
+    }
+
+    error_report("bad bluetooth parameter '%s'", opt);
+    return 1;
+}
diff --git a/include/sysemu/bt.h b/include/sysemu/bt.h
index 2fd8c0f14b..5b73709c2d 100644
--- a/include/sysemu/bt.h
+++ b/include/sysemu/bt.h
@@ -17,4 +17,7 @@ typedef struct HCIInfo {
 struct HCIInfo *bt_host_hci(const char *id);
 struct HCIInfo *qemu_next_hci(void);
=20
+/* TODO Convert bt-opts.c to opts_init() and remove from here. */
+int bt_parse(const char *opt);
+
 #endif
diff --git a/vl.c b/vl.c
index c7f4d01c99..3a6dd3ba2b 100644
--- a/vl.c
+++ b/vl.c
@@ -60,7 +60,6 @@ int main(int argc, char **argv)
 #include "hw/isa/isa.h"
 #include "hw/scsi/scsi.h"
 #include "hw/display/vga.h"
-#include "hw/bt.h"
 #include "sysemu/watchdog.h"
 #include "hw/firmware/smbios.h"
 #include "hw/acpi/acpi.h"
@@ -913,133 +912,6 @@ static void configure_rtc(QemuOpts *opts)
 }
=20
 /***********************************************************/
-/* Bluetooth support */
-static int nb_hcis;
-static int cur_hci;
-static struct HCIInfo *hci_table[MAX_NICS];
-
-struct HCIInfo *qemu_next_hci(void)
-{
-    if (cur_hci =3D=3D nb_hcis) {
-        return &null_hci;
-    }
-
-    return hci_table[cur_hci++];
-}
-
-static int bt_hci_parse(const char *str)
-{
-    struct HCIInfo *hci;
-    bdaddr_t bdaddr;
-
-    if (nb_hcis >=3D MAX_NICS) {
-        error_report("too many bluetooth HCIs (max %i)", MAX_NICS);
-        return -1;
-    }
-
-    hci =3D hci_init(str);
-    if (!hci) {
-        return -1;
-    }
-
-    bdaddr.b[0] =3D 0x52;
-    bdaddr.b[1] =3D 0x54;
-    bdaddr.b[2] =3D 0x00;
-    bdaddr.b[3] =3D 0x12;
-    bdaddr.b[4] =3D 0x34;
-    bdaddr.b[5] =3D 0x56 + nb_hcis;
-    hci->bdaddr_set(hci, bdaddr.b);
-
-    hci_table[nb_hcis++] =3D hci;
-
-    return 0;
-}
-
-static void bt_vhci_add(int vlan_id)
-{
-    struct bt_scatternet_s *vlan =3D qemu_find_bt_vlan(vlan_id);
-
-    if (!vlan->slave) {
-        warn_report("adding a VHCI to an empty scatternet %i",
-                    vlan_id);
-    }
-
-    bt_vhci_init(bt_new_hci(vlan));
-}
-
-static struct bt_device_s *bt_device_add(const char *opt)
-{
-    struct bt_scatternet_s *vlan;
-    int vlan_id =3D 0;
-    char *endp =3D strstr(opt, ",vlan=3D");
-    int len =3D (endp ? endp - opt : strlen(opt)) + 1;
-    char devname[10];
-
-    pstrcpy(devname, MIN(sizeof(devname), len), opt);
-
-    if (endp) {
-        if (qemu_strtoi(endp + 6, (const char **)&endp, 0, &vlan_id) < 0=
) {
-            error_report("unrecognised bluetooth vlan Id");
-            return 0;
-        }
-    }
-
-    vlan =3D qemu_find_bt_vlan(vlan_id);
-
-    if (!vlan->slave) {
-        warn_report("adding a slave device to an empty scatternet %i",
-                    vlan_id);
-    }
-
-    if (!strcmp(devname, "keyboard")) {
-        return bt_keyboard_init(vlan);
-    }
-
-    error_report("unsupported bluetooth device '%s'", devname);
-    return 0;
-}
-
-static int bt_parse(const char *opt)
-{
-    const char *endp, *p;
-    int vlan;
-
-    if (strstart(opt, "hci", &endp)) {
-        if (!*endp || *endp =3D=3D ',') {
-            if (*endp) {
-                if (!strstart(endp, ",vlan=3D", 0)) {
-                    opt =3D endp + 1;
-                }
-            }
-
-            return bt_hci_parse(opt);
-       }
-    } else if (strstart(opt, "vhci", &endp)) {
-        if (!*endp || *endp =3D=3D ',') {
-            if (*endp) {
-                if (strstart(endp, ",vlan=3D", &p)) {
-                    if (qemu_strtoi(p, &endp, 0, &vlan) < 0) {
-                        error_report("bad scatternet '%s'", p);
-                        return 1;
-                    }
-                } else {
-                    error_report("bad parameter '%s'", endp + 1);
-                    return 1;
-                }
-            } else {
-                vlan =3D 0;
-            }
-
-            bt_vhci_add(vlan);
-            return 0;
-        }
-    } else if (strstart(opt, "device:", &endp)) {
-        return !bt_device_add(endp);
-    }
-
-    error_report("bad bluetooth parameter '%s'", opt);
-    return 1;
-}
=20
 static int parse_name(void *opaque, QemuOpts *opts, Error **errp)
 {
--=20
2.20.1

