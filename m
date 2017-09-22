Received: by 10.223.172.38 with SMTP id v35csp3279972wrc;
        Fri, 22 Sep 2017 09:13:48 -0700 (PDT)
X-Received: by 10.237.37.14 with SMTP id v14mr8552184qtc.116.1506096828294;
        Fri, 22 Sep 2017 09:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506096828; cv=none;
        d=google.com; s=arc-20160816;
        b=JyYHMNFXejwASLenGoK8YY6/kabtEqhPgECnk+vw7jWoOPlJovMMqVkHRd6GVzb6GB
         CuPevXHiUILdwnKTgIaC7Sf6hRPgHb6cnuq4pFc6Ef0CZaIdIIXanMNHQzRjeS4HLpjS
         4CNZrFxjJOOKVE3ViSTP5B+AtGqmEusazS+nAenhAAhxrYlPJQ4vNas+lKGAM+dpafq6
         ZILfL7c7Ew+DJy+AkHn50z/jZLoXunpbh6ILUbG8+Cd8msSIGnHb/PUCOdUN9bPY7g74
         vB/OS/jlke+5cQsJLHUEUNYqqxbmar6R7PspvzJmx2RQC+PrD+GyWRCkOtkCPDozwEcO
         49Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=a6h2NXEXKYQkP/pFrbML8x3vzg+ev/dvgMIczgNPBLg=;
        b=IUEbgZsQtPweY2fscOxkzEFvbIhI42BUNU09O3Z2d5ktYz8pDtWN5e5LD4piqz2zFO
         VXYVsWfP28nGXkRpMqmmGGCyCyJs0fuhZp9bpp3oESYg4O0XL5wX+c5HyfBg4RpFk3Vw
         CvdfDqaXJyrbv8i5pnw82FYy1r6+radvc885KuD0ol/L5cbcdGDKz5IBrG6YwAyG+1oJ
         sq3LfqxPDqJm8/jAi6nWRAnXpRRgLWJEHKC1vi0f12CIzadTQgUZAYSsXLp4j9jtrLUP
         zxMogkf0OObc0hoeIwBqQcZO5T+xwxS6lMaKrLNHzsvEO3AKa0e1ys0YgaUSl/AuHFVO
         5BRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SXC6poPB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c46si129464qte.452.2017.09.22.09.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 09:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SXC6poPB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvQaI-000893-13
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 12:13:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQP5-0006Tu-8M
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 12:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQP3-0000Dp-Du
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 12:02:11 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33382)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQP3-0000DP-8S; Fri, 22 Sep 2017 12:02:09 -0400
Received: by mail-qt0-x242.google.com with SMTP id b1so930600qtc.0;
	Fri, 22 Sep 2017 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a6h2NXEXKYQkP/pFrbML8x3vzg+ev/dvgMIczgNPBLg=;
	b=SXC6poPBdhNIWfw7/aaJXiVBe0EABun0rnOvD9EyY2lWf/CLEfOArQTtDxHEOFGJ3d
	h12uM0dq/j6E7bBK1TOvRrQBid1htN/AlqF4ouZ6laHTkJGD9al1VFl8KtzcjEBWozpW
	O6P6bIFNnrjBP4s3Vb7OCdnG+nrpVNIqUCLWIaZH+ApwoXH7WpsLu3M/0tO7nrC/gkLQ
	uGwZ6UCmh/4f3xdKCfib9kiQ27eyEQ715+UPIOUN0Gw/U26ZkmIrBe1nk7LnM/iKKFav
	7YnwpZD1Q5fFf3v6PGRn6wUOxRbNWvF6mdVU7TXX8X7i2mJHsQxqgNHLG5wyDz3rUbdy
	OS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=a6h2NXEXKYQkP/pFrbML8x3vzg+ev/dvgMIczgNPBLg=;
	b=CQOzIgjIiTUNZB4HCSf/ck9AVJfejlFgLQpAI+thFGrHmbC5OjIwwxf+EajAPln9A8
	rHAmbzNtfWBqDEcA78Gw5IvVRU/DwLtcP9UIOn/bPCjgSBbAlXEAo5MCuGAvFc/tBkwa
	HMEUFub9lS5W1y1ah29EB6GogtM4/FuU/8IHndm9TaICAZIVXiZSl8wuweKUxepVAJDF
	uEO1vBcL2Vqj2IQDXPAOqASoy9vyG2YQTXRIaHu4k5cxyUY1NufRFD1ji66Xc838lKky
	PhdPeKFiDbBRWCzV8s/rD0g7josoDmH9brr9OwCQn4HzrUUWpMqzbqvoIiAKVeB35ksP
	QS6Q==
X-Gm-Message-State: AHPjjUi7aOocHzur8fDFdZJxHmR3k8LYZ3ZXiEUc6pkZYL7UJyFQDzFq
	Q3CI5Q3wHZI130VyWVqXFc8=
X-Google-Smtp-Source: AOwi7QDwlEabJI6QFXq7PFcMgm5oC4jYl45dtOyhlX4FTHZurprHyoEOUqiBYoUo/QsKtGpK/sjyKQ==
X-Received: by 10.200.17.131 with SMTP id d3mr8428365qtj.329.1506096128611;
	Fri, 22 Sep 2017 09:02:08 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id y31sm108325qta.83.2017.09.22.09.02.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 09:02:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Magnus Damm <magnus.damm@gmail.com>,
	Jason Wang <jasowang@redhat.com>
Date: Fri, 22 Sep 2017 13:01:08 -0300
Message-Id: <20170922160111.31885-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH 31/34] hw/net/rtl8139: use TYPE_PCI_RTL8139
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kAkQ0JKtXE8p

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/net/pci.h    | 1 +
 hw/arm/realview.c       | 3 ++-
 hw/arm/versatilepb.c    | 3 ++-
 hw/mips/mips_fulong2e.c | 3 ++-
 hw/net/rtl8139.c        | 7 +++----
 hw/sh4/r2d.c            | 5 +++--
 6 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/include/hw/net/pci.h b/include/hw/net/pci.h
index 5ad5487a91..43ed3b0145 100644
--- a/include/hw/net/pci.h
+++ b/include/hw/net/pci.h
@@ -16,6 +16,7 @@
 #define TYPE_PCI_E1000      "e1000"
 #define TYPE_PCI_E1000E     "e1000e"
 #define TYPE_PCI_PCNET      "pcnet"
+#define TYPE_PCI_RTL8139    "rtl8139"
 
 PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
                                const char *default_model,
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 87cd1e583c..35f0da28e4 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -20,6 +20,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
+#include "hw/net/pci.h"
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
@@ -269,7 +270,7 @@ static void realview_init(MachineState *machine,
             done_nic = 1;
         } else {
             if (pci_bus) {
-                pci_nic_init_nofail(nd, pci_bus, "rtl8139", NULL);
+                pci_nic_init_nofail(nd, pci_bus, TYPE_PCI_RTL8139, NULL);
             }
         }
     }
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 418792cd02..297aad78e1 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -18,6 +18,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "hw/i2c/i2c.h"
+#include "hw/net/pci.h"
 #include "hw/boards.h"
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
@@ -271,7 +272,7 @@ static void versatile_init(MachineState *machine, int board_id)
             smc91c111_init(nd, 0x10010000, sic[25]);
             done_smc = 1;
         } else {
-            pci_nic_init_nofail(nd, pci_bus, "rtl8139", NULL);
+            pci_nic_init_nofail(nd, pci_bus, TYPE_PCI_RTL8139, NULL);
         }
     }
     if (machine_usb(machine)) {
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 7ebbffa8f2..fe618953c9 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -44,6 +44,7 @@
 #include "hw/timer/mc146818rtc.h"
 #include "hw/timer/i8254.h"
 #include "hw/input/i8042.h"
+#include "hw/net/pci.h"
 #include "sysemu/blockdev.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
@@ -253,7 +254,7 @@ static void network_init (PCIBus *pci_bus)
             default_devaddr = "07";
         }
 
-        pci_nic_init_nofail(nd, pci_bus, "rtl8139", default_devaddr);
+        pci_nic_init_nofail(nd, pci_bus, TYPE_PCI_RTL8139, default_devaddr);
     }
 }
 
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 3be24bbee7..0f952eceba 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -59,6 +59,7 @@
 #include "net/net.h"
 #include "net/eth.h"
 #include "hw/loader.h"
+#include "hw/net/pci.h"
 #include "sysemu/sysemu.h"
 #include "qemu/iov.h"
 
@@ -90,10 +91,8 @@ static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
 }
 #endif
 
-#define TYPE_RTL8139 "rtl8139"
-
 #define RTL8139(obj) \
-     OBJECT_CHECK(RTL8139State, (obj), TYPE_RTL8139)
+     OBJECT_CHECK(RTL8139State, (obj), TYPE_PCI_RTL8139)
 
 /* Symbolic offsets to registers. */
 enum RTL8139_registers {
@@ -3437,7 +3436,7 @@ static void rtl8139_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo rtl8139_info = {
-    .name          = TYPE_RTL8139,
+    .name          = TYPE_PCI_RTL8139,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(RTL8139State),
     .class_init    = rtl8139_class_init,
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 16b9ed2db2..dde60b2bc2 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -39,6 +39,7 @@
 #include "hw/ide.h"
 #include "hw/loader.h"
 #include "hw/usb.h"
+#include "hw/net/pci.h"
 #include "hw/block/flash.h"
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
@@ -303,8 +304,8 @@ static void r2d_init(MachineState *machine)
 
     /* NIC: rtl8139 on-board, and 2 slots. */
     for (i = 0; i < nb_nics; i++)
-        pci_nic_init_nofail(&nd_table[i], pci_bus,
-                            "rtl8139", i==0 ? "2" : NULL);
+        pci_nic_init_nofail(&nd_table[i], pci_bus, TYPE_PCI_RTL8139,
+                            i == 0 ? "2" : NULL);
 
     /* USB keyboard */
     usb_create_simple(usb_bus_find(-1), "usb-kbd");
-- 
2.14.1

