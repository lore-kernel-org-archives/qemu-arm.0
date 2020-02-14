Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1516651lfp;
        Thu, 13 Feb 2020 22:21:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxrYrrbvzZKS71ZhGKSIu4WE0Mqrt2OhswKCDTQsB3dnf3KidyLmyMZbZl2xTffxUJIdB6A
X-Received: by 2002:ad4:514e:: with SMTP id g14mr889639qvq.196.1581661291472;
        Thu, 13 Feb 2020 22:21:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581661291; cv=none;
        d=google.com; s=arc-20160816;
        b=CEfR3gppSGsoATS+3Hz07zo79pRaHKkXC7VNHG94ZB4R3ocOHZ4/1lkC43o9fk7Y9X
         CmkI7LzAnTJABEK/ue3R7Y4RRV8RAf+icijlWb9GX9rdocMUXL9wM2g+WGJ+kQnFX3wz
         ozAC3zTUkzcbCDJMwHY1AEcmHpc7DCgxT94jWxLLGwQbGNx5WmPxa6RG9IOdhkwm9afg
         o3pftm2MnyNSh95J21wTzC0/JbNd1OWb04FaN+CkZMKVK8EH+TamgJEIgMl2WdJDxxpM
         b6yzDI0r8QZonZtIzyX4OhT2bsoHojwjuQs6X0iejEulYjOQARsahMDYM44mrwffvmlU
         bbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=7v5rQyr9eTRNU0avUKqGOcoW+Bqm4weOk0U1hS1FOnM=;
        b=UUeZpQ5EZEEvCrugL7PZd6sWsmec8utZ/8RI2QbFBIl/NqaLy5777XQOIExFtVwexj
         rqBUlZsmckrmI+IoIx02gjI2yx7FcXslTYd7tja86yZLBEIakuH6cUydTW4eRZY4qxYP
         Zk2F3fs6Ba54Oy3jqv077fQSk44inGWRlQgiyMnhD/E7Tqg/i0sf4/PI4FGrdG/4zTod
         itB2UnhGhzJGjVvkZsQWi0vNk6HxcVVN4kDl9LlyHAEmlXpgjKBapy2u2gKNjnDNwMl1
         EWQLsaqshkk/0iRkgeVJ37Zc6gQK0GTTL2DgfU0soRINgj3Hn7hzRK3NR9z0A/rQMZxm
         45tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=un5RIDbG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si2346072qkh.86.2020.02.13.22.21.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 22:21:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=un5RIDbG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2ULy-0008Ru-VP
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 01:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j2ULn-0008Rf-4O
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 01:21:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j2ULm-0007sm-5X
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 01:21:19 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j2ULl-0007rz-Gg; Fri, 14 Feb 2020 01:21:17 -0500
Received: by mail-pf1-x444.google.com with SMTP id n7so4372388pfn.0;
 Thu, 13 Feb 2020 22:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=7v5rQyr9eTRNU0avUKqGOcoW+Bqm4weOk0U1hS1FOnM=;
 b=un5RIDbGYFFQSzIvXCU+nTx1tljAi22l6SCXVJdMIlvjV6NjzdNkJ8HYGr9xoHkXHt
 XmZSxfxvBeBQC6TLp2+NzE7ufDQB1/FFCKBaiooM1bT/g/AIbdLvtShBd2HNeAe31m6y
 //SKorWaEt55Q3CtwZv010K8NnYU//mX/jHUyAYUpjfmaKKHOS5PjHkEAPJRFLDSXMWY
 s0s3CGkj2FUnuCMvSLuQkhMpexHHSNAiz1flFVCCrPEMXlOC42HGFiNd3gdOovMI/Zn+
 T/3guhoygBJsZI9+YOnJe/E0JOiSq2ilNZNBXCXAvMP+2E0VPEndm4o6zClKV0vNDyQL
 R0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=7v5rQyr9eTRNU0avUKqGOcoW+Bqm4weOk0U1hS1FOnM=;
 b=WD8nf4phVo9KuMg6Ven7ZuQ26VkqzNuOVgq2dTQWoiPM54ltAGn8rOHVCRLX2dJGVX
 e6KzYMgFjfd+SNQKveWEoQr034Re19EDsciTLLurL/Edu0jMqcDVMZXjeBnVz3pZptRe
 iKB71U3Q4N+eXwjm5Qj6AF9diU/BCRnNhRy7so27LXH+38PbUjx2bBIORFYYHLQkfIPo
 SfefeuaeXmG91oRd0PGeheNf6yWRgFB+WIdGe584iDj9tw3alniFKN/wBIl1+k9siOsd
 oTV71inzXUiH9s8Gr76yTjRCmOhRah2sMkc8rbh+V0zu2KTUpcqFjX0DqWE4Evpl7KGh
 L0dQ==
X-Gm-Message-State: APjAAAViuPDI4tQZmWxv1mhEROhfoHIAbPFbZOBGZ04f5Ojwix84if9P
 faE0+cbWby/jjLS1OMSHsQQ=
X-Received: by 2002:a62:e318:: with SMTP id g24mr1787610pfh.218.1581661276355; 
 Thu, 13 Feb 2020 22:21:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id x8sm5193838pfr.104.2020.02.13.22.21.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Feb 2020 22:21:15 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/3] hw: usb: hcd-ohci: Move OHCISysBusState and
 TYPE_SYSBUS_OHCI to include file
Date: Thu, 13 Feb 2020 22:21:07 -0800
Message-Id: <20200214062109.24494-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XVhAEZA78FNt

We need to be able to use OHCISysBusState outside hcd-ohci.c, so move it
to its include file.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/usb/hcd-ohci.c | 15 ---------------
 hw/usb/hcd-ohci.h | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 8a94bd004a..1e6e85e86a 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1870,21 +1870,6 @@ void ohci_sysbus_die(struct OHCIState *ohci)
     ohci_bus_stop(ohci);
 }
 
-#define TYPE_SYSBUS_OHCI "sysbus-ohci"
-#define SYSBUS_OHCI(obj) OBJECT_CHECK(OHCISysBusState, (obj), TYPE_SYSBUS_OHCI)
-
-typedef struct {
-    /*< private >*/
-    SysBusDevice parent_obj;
-    /*< public >*/
-
-    OHCIState ohci;
-    char *masterbus;
-    uint32_t num_ports;
-    uint32_t firstport;
-    dma_addr_t dma_offset;
-} OHCISysBusState;
-
 static void ohci_realize_pxa(DeviceState *dev, Error **errp)
 {
     OHCISysBusState *s = SYSBUS_OHCI(dev);
diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 16e3f1e13a..5c8819aedf 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -22,6 +22,7 @@
 #define HCD_OHCI_H
 
 #include "sysemu/dma.h"
+#include "hw/usb.h"
 
 /* Number of Downstream Ports on the root hub: */
 #define OHCI_MAX_PORTS 15
@@ -90,6 +91,21 @@ typedef struct OHCIState {
     void (*ohci_die)(struct OHCIState *ohci);
 } OHCIState;
 
+#define TYPE_SYSBUS_OHCI "sysbus-ohci"
+#define SYSBUS_OHCI(obj) OBJECT_CHECK(OHCISysBusState, (obj), TYPE_SYSBUS_OHCI)
+
+typedef struct {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    OHCIState ohci;
+    char *masterbus;
+    uint32_t num_ports;
+    uint32_t firstport;
+    dma_addr_t dma_offset;
+} OHCISysBusState;
+
 extern const VMStateDescription vmstate_ohci_state;
 
 void usb_ohci_init(OHCIState *ohci, DeviceState *dev, uint32_t num_ports,
-- 
2.17.1

