Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5418762lfp;
        Mon, 17 Feb 2020 12:48:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxC56jR2sSsbe2XR4N1Vxerqij/6Wn6TmEPJPv0OIYUpeZQjRQC8PUQILj1fOKiQHe5ct7u
X-Received: by 2002:a37:6c5:: with SMTP id 188mr15846195qkg.277.1581972510986;
        Mon, 17 Feb 2020 12:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581972510; cv=none;
        d=google.com; s=arc-20160816;
        b=te0G1LWv64tQGpdYV7LqM7rdqWkTo/tGky9e+965Uul85TGPynaSEz1hoWK3naF7Ph
         2Y4iOPTIB4m5KCBansCgZD2ZJ/dXkO1GnChGJu0hr75R0gCYwSw46LU3UzJi07bE3BOL
         l28BF5xc2O/JEZTNWj0GOYw3hoibkbkIYmLLWA7+IJAxNOR865e0Nxytnod9IhzgXRO3
         S8l6uNU50QeP8OMuOzxbhzpqGr9n2vbovqF3XNIp/ZYrG/VAW+TMkQKjUidMRoGFE8I2
         XKsBHqv4J/YtzaXbSNFJvOn7asH7ykCARUTMnecp+MDYH94+yzL1ci8/DO0EjfqyHwHP
         nZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=jUTT4M0L8QDIDF54nsaAa0WO27b/nakwYQvzOrU6Ztw=;
        b=fCTrSOxM3TpQfQGZAq2T+41xU9aV06hjq0/UXr/mHPoY3KclBzDsGQMN24KQr1Hd9E
         nw5rxrdb2pbiE3QF7yT+pLYRpLEATf89GpguLP4vQhpk36czadwAJ+g8IzsjXqcYqsAC
         C2ot7490viULhy8eq9qozTK8z5uM9+rqMAKBzGhExQ/LvmJlgRbp6UcZaJit+v/n87cf
         tjGXZ7AIESBfeyZbq7PyqY53PVKoXXndu4FKW5AMlHuDDonz1wC4XAJtIODmErNG2NUp
         hux0izHqeJC9KVB+Ri/Tiz402OIlUo5vdKCc2fAxe/UVpG2vS1VoB60PCiNysPj87WNl
         fhvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=phPSBihY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d40si795777qtk.235.2020.02.17.12.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 12:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=phPSBihY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3nJe-0005Z9-C3
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 15:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j3nJS-0005WW-Ax
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 15:48:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j3nJR-0007Pv-Bp
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 15:48:18 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43551)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j3nJR-0007Pd-6M; Mon, 17 Feb 2020 15:48:17 -0500
Received: by mail-pf1-x444.google.com with SMTP id s1so9507407pfh.10;
 Mon, 17 Feb 2020 12:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jUTT4M0L8QDIDF54nsaAa0WO27b/nakwYQvzOrU6Ztw=;
 b=phPSBihY8AJQIjrwsRfg0abA5X9X77YiZkwqdMrRCdzwDPTKiH7KXB77ryFCyFAFI1
 OlAo3z2JfUYoPbevHU+JOLabkT1Ez+SpR/6jVo4Z3DzkZH/XdAEK1fVMv/phRludrSDa
 SlCiTOfs45ZUQR8ByC+QDNI9781bwH75+Ai2IbOLCqf5QbmcAKHfWxA1LOIDI2wmzNtE
 NPNDhPFlUNIJ4fuzjqaIEpuAiisHOygj3/4BpVGb09z/Fv4eFvAQ7lQ9ucjwV86EMvg/
 Co/oOIhJ4ftHhnl8YV12hWk7Lt80C2lBVWFNmT61k88EVvSQPpuaUCP4GaYneDDWy+R+
 PZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=jUTT4M0L8QDIDF54nsaAa0WO27b/nakwYQvzOrU6Ztw=;
 b=an6Ldt3i86gjR+QOZ+jT7gu5Tg+v4zToGfkBR6DEh+ldESPlQAs7PDIvz7rcmtu3Nr
 B8PHvYV/0IUnDesyNwCWhF2CFyhJAvYEaxPNbTR2WTwOiFvUEW15P0tLHWb5PAf7359O
 io2h8mgIGOmQE/rYbpe9YFgvis60eXLAZfqgC09c5v22ZjEiYDsFDk0BCPYIAxCilBGN
 5G0xkYm+hBt5fqINBFVDA4YpNKVvnV2ZPvBnT7WXccjURMfmrdYsg7y9RVA/6yVuSAJy
 gnpzrWNgvJ57+qC3nfNmY0GRdJqfZlLccDAKaI2XBFWXF1W61g+fVGXSVhkH+voMIxjV
 fpbg==
X-Gm-Message-State: APjAAAXHsakbyHnLZZUhNGq6ssNjR/5bIfP3xrk0RtKgn8ZC4c1fk77z
 S/4bBkWqtFFiYGWZJU4iBHI=
X-Received: by 2002:aa7:8ec1:: with SMTP id b1mr18030005pfr.95.1581972496332; 
 Mon, 17 Feb 2020 12:48:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r14sm1327729pfh.10.2020.02.17.12.48.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Feb 2020 12:48:15 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 1/3] hw: usb: hcd-ohci: Move OHCISysBusState and
 TYPE_SYSBUS_OHCI to include file
Date: Mon, 17 Feb 2020 12:48:10 -0800
Message-Id: <20200217204812.9857-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217204812.9857-1-linux@roeck-us.net>
References: <20200217204812.9857-1-linux@roeck-us.net>
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
X-TUID: 3Azja0yYzWuY

We need to be able to use OHCISysBusState outside hcd-ohci.c, so move it
to its include file.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Rebased to master
    Added Gerd's Reviewed-by: tag
v2: no changes

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

