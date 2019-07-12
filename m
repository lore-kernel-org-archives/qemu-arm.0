Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp919058wrv;
        Fri, 12 Jul 2019 06:40:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxV8LJIVXOyq/5kWcT+2Ez/TSIYi9PDiVmMXMWNOnm0fUDPX8EKlK2UPcR3IAawgaFPel1I
X-Received: by 2002:a50:922a:: with SMTP id i39mr9309909eda.219.1562938811823;
        Fri, 12 Jul 2019 06:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562938811; cv=none;
        d=google.com; s=arc-20160816;
        b=vKzDD/Xk0p7Xd8WC8oKRDBqO+BLNVsEiWtZN/FIXcU8CqrixXZGAZgJmM8ymHr17k4
         PS7ZY2z8Mw08a+4mAo6c5HGc+6kGMWKS0488wWTjEZYzt4JOsK8sTl2FL1zy+KzYRKO2
         pWnS/Cm3kfCPWqoWSOf0durMOE5VrvTcD/Mop697H1H7ntdG1LWJmQ4FvyoU/v3Hs7SH
         2Qx1DU6KwNayomj7nppxCV3jPyLhMinxAauKs1wXO5tdZztvjzntuQnxeK028pQaUwZG
         3QUULIuuERCfC6M1l+I6mPNpiZ6pxCoCkBDzUe2uuvUCK0j+ekUtZZ2ssZCOqhjFY5LI
         FBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=t8jCTGqgxNtL7v1RU7l/zGYwengLfozwjGS6vnXj5nk=;
        b=zuy4tse/jrJb7hXk/YUt2AMlhYdcnnHwR9ycAbRVKUdYNE5sluQKDO/7XC0vHm5FdI
         LU8+7CLqDZLZM4s8yMX/tcXjm3i5Mc31+zBA3LN2nC/Nk6ak4Bu9Nhc24OirPGYhAeAr
         FHUskXq804bOG2v7wHZ+8giKEP4gkNEYzTvjpAg9fzRRG1A3xS3X1UaaMAonnlM8GD8b
         zOq5ZRuITjJtGgNM+myXmfnNEmO8UWZ7HhGjWzrqjF5PBuTOAozdAXo9Dtw3UpjYV7Rk
         5U8a16/31iaLOCJnDL559tzpsm1TFAxTAQ57kZ0GbLqP8hAL1dxxBtoKVsULYhLgYy7Q
         lL4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si5071853edy.432.2019.07.12.06.40.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 06:40:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlvmU-0005L3-HS
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 09:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57541)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlvmL-00054m-TT
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:40:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlvmK-0006b9-Qd
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:40:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37876)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlvmI-0006YV-E7; Fri, 12 Jul 2019 09:39:58 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBFED81DE8;
 Fri, 12 Jul 2019 13:39:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8B6719C58;
 Fri, 12 Jul 2019 13:39:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:39:25 +0200
Message-Id: <20190712133928.21394-5-philmd@redhat.com>
In-Reply-To: <20190712133928.21394-1-philmd@redhat.com>
References: <20190712133928.21394-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 12 Jul 2019 13:39:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1? 4/7] vl: Fix 'braces' coding style
 issues
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iWYdKXLqdHrm

Since we'll move this code around, fix its style first:

  ERROR: braces {} are necessary for all arms of this statement style

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 vl.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/vl.c b/vl.c
index 5089fce6c5..96de4f74b9 100644
--- a/vl.c
+++ b/vl.c
@@ -920,8 +920,9 @@ static struct HCIInfo *hci_table[MAX_NICS];
=20
 struct HCIInfo *qemu_next_hci(void)
 {
-    if (cur_hci =3D=3D nb_hcis)
+    if (cur_hci =3D=3D nb_hcis) {
         return &null_hci;
+    }
=20
     return hci_table[cur_hci++];
 }
@@ -937,8 +938,9 @@ static int bt_hci_parse(const char *str)
     }
=20
     hci =3D hci_init(str);
-    if (!hci)
+    if (!hci) {
         return -1;
+    }
=20
     bdaddr.b[0] =3D 0x52;
     bdaddr.b[1] =3D 0x54;
@@ -957,9 +959,10 @@ static void bt_vhci_add(int vlan_id)
 {
     struct bt_scatternet_s *vlan =3D qemu_find_bt_vlan(vlan_id);
=20
-    if (!vlan->slave)
+    if (!vlan->slave) {
         warn_report("adding a VHCI to an empty scatternet %i",
                     vlan_id);
+    }
=20
     bt_vhci_init(bt_new_hci(vlan));
 }
@@ -984,12 +987,14 @@ static struct bt_device_s *bt_device_add(const char=
 *opt)
=20
     vlan =3D qemu_find_bt_vlan(vlan_id);
=20
-    if (!vlan->slave)
+    if (!vlan->slave) {
         warn_report("adding a slave device to an empty scatternet %i",
                     vlan_id);
+    }
=20
-    if (!strcmp(devname, "keyboard"))
+    if (!strcmp(devname, "keyboard")) {
         return bt_keyboard_init(vlan);
+    }
=20
     error_report("unsupported bluetooth device '%s'", devname);
     return 0;
@@ -1002,9 +1007,11 @@ static int bt_parse(const char *opt)
=20
     if (strstart(opt, "hci", &endp)) {
         if (!*endp || *endp =3D=3D ',') {
-            if (*endp)
-                if (!strstart(endp, ",vlan=3D", 0))
+            if (*endp) {
+                if (!strstart(endp, ",vlan=3D", 0)) {
                     opt =3D endp + 1;
+                }
+            }
=20
             return bt_hci_parse(opt);
        }
@@ -1021,14 +1028,16 @@ static int bt_parse(const char *opt)
                     error_report("bad parameter '%s'", endp + 1);
                     return 1;
                 }
-            } else
+            } else {
                 vlan =3D 0;
+            }
=20
             bt_vhci_add(vlan);
             return 0;
         }
-    } else if (strstart(opt, "device:", &endp))
+    } else if (strstart(opt, "device:", &endp)) {
         return !bt_device_add(endp);
+    }
=20
     error_report("bad bluetooth parameter '%s'", opt);
     return 1;
--=20
2.20.1

