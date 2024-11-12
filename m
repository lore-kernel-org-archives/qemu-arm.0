Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7480883njc;
        Tue, 12 Nov 2024 08:59:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBD/DJkfL8x0vgS3p1g5IK0e+EkXwYuKo4PspiO3QFSjP3FSatyUZ5qE9pehNnuSFQ1iyO9gkZ/hvqOg==@linaro.org
X-Google-Smtp-Source: AGHT+IG0+L7+GAYrZS2OY4BWSn3uyP6DCkVS7T6U3hA/geSwz0V9TDzXxb/jBaMtNyRO/jqjkEmo
X-Received: by 2002:a05:6358:9795:b0:1c3:94:8fe3 with SMTP id e5c5f4694b2df-1c641e9d114mr699641555d.4.1731430759605;
        Tue, 12 Nov 2024 08:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731430759; cv=none;
        d=google.com; s=arc-20240605;
        b=gMPb9btyzv/sntCcPSJlk3hIW8zl0EOBK2qkfW0WycOindkrztID9IV7A8RXivXCWl
         aAaQ7wowU8e+wEkRIpwodvjAuJsiJ5OQM0WwnhKTPA2a9AcXMW2hH8s3YYvoWM3zGDTN
         ktASUoy4gBvVm6NSzjiq2PuCsuAuoSghUJLQU5wIm4FW4PnsYR2AB8o33DMk7IXiYd9k
         m3cjOeFe1eJ6+aF66+x5m49EXpQrCVqC4mZQqDx3IiH/x/DXpmLVW82+g7CBub3+zBGP
         6DJuokNIjyfF3/yUotWUeTPnE6t6ylAvMlHnM6dL8DFEdTEXi6HSIFoKN04IcklS+t/J
         IZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wNLY6CBv3Vt54fe6xY1jCdrgvJkH83csJwvWMNPC39s=;
        fh=x0sv81P92osL35lla2Asqto2OFZI196YcPiYQHk7ndA=;
        b=BmyNcxtkA8eYC+R0Yp8p1ocTWeJ39QictymuQTHbSY2eNLCZpnZGYThT6xL4cM+Z4t
         EvzEXcoVUsz5sQWdmPQcC+CbASV0Ot/MfDnN8TlVoVIfg6x5ANur7r+OsApf/R3oervd
         c2wj51+5eSCyHnmLriX10LLZ/jx1Bl3XpO0UcVOvXnBh29e+Szqj2Jc/mEHHxblfU8qI
         UbW5lPIznhbhQfw3Ez+z5L8jOlCsb6czyLuTqrkL8rL6AEw7wbd4pdOnvnfPN8ndfFuJ
         cBOmXoIzTbcehaGKVTwC65yxFsJ21cFUbu/ZPLswZQpc/HRehh1ShwMc4cXguCVBtijd
         /rUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=OJtVbGBT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39664b88bsi153453046d6.179.2024.11.12.08.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 08:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=OJtVbGBT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAuC5-00037v-GH; Tue, 12 Nov 2024 11:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tAuC1-00036Y-5W; Tue, 12 Nov 2024 11:56:41 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1tAuBz-0000gC-Gx; Tue, 12 Nov 2024 11:56:40 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20c767a9c50so58172835ad.1; 
 Tue, 12 Nov 2024 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731430597; x=1732035397; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNLY6CBv3Vt54fe6xY1jCdrgvJkH83csJwvWMNPC39s=;
 b=OJtVbGBTYMQNf3UpBAdVGmQaSTZ4WEqk+Xdl94lPfTiY62bKX3X4N+VPehspJUMyQ+
 50Wx+vBBqreIsp1T3OrojXvHF9RBPt6yxA3TIDl2fw3upeRHsBgtFCXg2ZXahhfOXA20
 J+9DB3GGYpVDVD8YNmxXsgDob/TflDW3o7lE2+5XbdvSiJKjDQZAmucRKIHlyZFcCkaT
 kfdrJYsD7v4Nckj/FmcusJKF+hh8I4L0+AbPkqxqlyitIWN6Qk/g9RsXi7m2IyNTUiak
 Do5BPB5Wf0bnp9hRIUmmdimsMPPh3Hs9pcMnaJZmHrQvTKTS7ifFxp1JBjAgkk8Vqy2j
 OpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731430597; x=1732035397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wNLY6CBv3Vt54fe6xY1jCdrgvJkH83csJwvWMNPC39s=;
 b=DtlVEt1YraHtxQ85WlkJlDcmBL4kCVdjnh3ItiH0T5Y3RRXBBWoJ6SMPO13ahA1ZYq
 gBXO3on23sMpCDDKpQn6CwJOMYpXIKOem26HQ9a+9Ltl/X3Sf28bZycJwVuTrN1KofUO
 3t0QwRpgCNMF5BRVNaVUkXPBckOPaMdqJs1zoWJS2GrQdJ70FMUJIYMXe7rnkmXJjqe0
 rZWwkk++gT+wMmCiYQkHGqM8meRlHIK1O+dcb0dFdlXaIO0MIF+MEaJ8y4127uv1q7Qs
 dkzh/7xtsdNbMZkGMDTNILbKiRYMZrfYxgqstOguaSI4yas2zoCP2Ma9EEMM/5royxxR
 7OXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2hyxV1vIX7EGPHX2sd3yaEBZvK79qNCTQBFtiwV9bvo9UYznlXXP5EU94sIzqd/V6woWupXWNyQ==@nongnu.org
X-Gm-Message-State: AOJu0YwifC9lNMcjZuqNfd/nw3S0VD0GETi/ycqryEBTrCbA0+wuJ7gF
 HiVwAkUhRBoZC3BOaaajR2gYVBBnH2METbG14RZ+5kpS2LB7IzkRHZSTjQ==
X-Received: by 2002:a17:902:e843:b0:20c:ca83:31c7 with SMTP id
 d9443c01a7336-21183d7cc28mr231783165ad.54.1731430596869; 
 Tue, 12 Nov 2024 08:56:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e59dfesm95980155ad.181.2024.11.12.08.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 08:56:35 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, BALATON Zoltan <balaton@eik.bme.hu>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/10] usb/uhci: Add aspeed specific read and write functions
Date: Tue, 12 Nov 2024 08:56:15 -0800
Message-ID: <20241112165618.217454-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112165618.217454-1-linux@roeck-us.net>
References: <20241112165618.217454-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=groeck7@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HE9QIcu301yO

Aspeed uses non-standard UHCI register addresses. On top of that,
registers are 32 bit wide instead of 16 bit.

Map Aspeed UHCI addresses to standard UHCI addresses and where needed
combine/split 32 bit accesses to solve the problem.

In addition to that, Aspeed SoCs starting with AST2600 support and use EHCI
companion mode on the second EHCI interface. Support this by moving the
property initialization to the Aspeed class initialization code. Since the
USB ports are part of the SoC and always present, set user_creatable to
false for the Aspeed UHCI controller.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since RFC:
- Rebased to v9.1.0-1673-g134b443512
- Added support for EHCI companion mode

 hw/usb/hcd-uhci-sysbus.c | 104 ++++++++++++++++++++++++++++++++++++++-
 hw/usb/hcd-uhci-sysbus.h |  11 +++++
 2 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-uhci-sysbus.c b/hw/usb/hcd-uhci-sysbus.c
index 3a6c56c3df..628b6601a1 100644
--- a/hw/usb/hcd-uhci-sysbus.c
+++ b/hw/usb/hcd-uhci-sysbus.c
@@ -20,7 +20,9 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
+#include "hw/usb/uhci-regs.h"
 #include "qapi/error.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "hw/usb.h"
@@ -84,10 +86,104 @@ static void uhci_sysbus_class_init(ObjectClass *klass, void *data)
     dc->realize = uhci_sysbus_realize;
     set_bit(DEVICE_CATEGORY_USB, dc->categories);
     dc->desc = "UHCI USB Controller";
-    device_class_set_props(dc, uhci_sysbus_properties);
     device_class_set_legacy_reset(dc, uhci_sysbus_reset_sysbus);
 }
 
+static hwaddr aspeed_uhci_chip_to_uhci(hwaddr addr)
+{
+    switch (addr) {
+    case 0x00:
+        return UHCI_USBCMD;
+    case 0x04:
+        return UHCI_USBSTS;
+    case 0x08:
+        return UHCI_USBINTR;
+    case 0x0c:
+        return UHCI_USBFLBASEADD;
+    case 0x80:
+        return UHCI_USBFRNUM;
+    case 0x84:
+        return UHCI_USBSOF;
+    case 0x88:
+        return UHCI_USBPORTSC1;
+    case 0x8c:
+        return UHCI_USBPORTSC2;
+    case 0x90:
+        return UHCI_USBPORTSC3;
+    case 0x94:
+        return UHCI_USBPORTSC4;
+    default:        /* unimplemented */
+        qemu_log_mask(LOG_UNIMP, "Unimplemented Aspeed UHCI register 0x%lx\n",
+                      addr);
+        return 0x20;
+    }
+}
+
+/*
+ * Aspeed UHCI registers are 32 bit wide.
+ * Convert to 16 bit to access standard UHCI code.
+ */
+static uint64_t aspeed_uhci_port_read(void *opaque, hwaddr addr, unsigned size)
+{
+    UHCIState *uhci = opaque;
+    MemoryRegion *mr = &uhci->mem;
+    hwaddr uaddr = aspeed_uhci_chip_to_uhci(addr);
+
+    if (uaddr == UHCI_USBFLBASEADD) {
+        return mr->ops->read(opaque, uaddr, 2) |
+               mr->ops->read(opaque, uaddr + 2, 2) << 16;
+    }
+    return mr->ops->read(opaque, uaddr, 2);
+}
+
+static void aspeed_uhci_port_write(void *opaque, hwaddr addr, uint64_t val,
+                                   unsigned size)
+{
+    UHCIState *uhci = opaque;
+    MemoryRegion *mr = &uhci->mem;
+    hwaddr uaddr = aspeed_uhci_chip_to_uhci(addr);
+
+    if (uaddr == UHCI_USBFLBASEADD) {
+        mr->ops->write(opaque, uaddr, val & 0xffff, 2);
+        mr->ops->write(opaque, uaddr + 2, val >> 16, 2);
+    } else {
+        mr->ops->write(opaque, uaddr, val, 2);
+    }
+}
+
+static const MemoryRegionOps aspeed_uhci_mmio_ops = {
+    .read = aspeed_uhci_port_read,
+    .write = aspeed_uhci_port_write,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void uhci_sysbus_aspeed_realize(DeviceState *dev, Error **errp)
+{
+    UHCISysBusState *s = SYSBUS_UHCI(dev);
+    ASPEEDUHCIState *f = ASPEED_UHCI(dev);
+    UHCIState *uhci = &s->uhci;
+
+    uhci_sysbus_realize(dev, errp);
+
+    memory_region_init_io(&f->mem_aspeed, OBJECT(f), &aspeed_uhci_mmio_ops,
+                          uhci, "aspeed", 0x100);
+    memory_region_add_subregion(&uhci->mem, 0, &f->mem_aspeed);
+}
+
+static void uhci_sysbus_aspeed_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = uhci_sysbus_aspeed_realize;
+    set_bit(DEVICE_CATEGORY_USB, dc->categories);
+    dc->desc = "ASPEED UHCI USB Controller";
+    device_class_set_legacy_reset(dc, uhci_sysbus_reset_sysbus);
+    device_class_set_props(dc, uhci_sysbus_properties);
+    dc->user_creatable = false;
+}
+
 static const TypeInfo uhci_sysbus_types[] = {
     {
         .name          = TYPE_SYSBUS_UHCI,
@@ -95,6 +191,12 @@ static const TypeInfo uhci_sysbus_types[] = {
         .instance_size = sizeof(UHCISysBusState),
         .class_init    = uhci_sysbus_class_init,
     },
+    {
+        .name          = TYPE_ASPEED_UHCI,
+        .parent        = TYPE_SYSBUS_UHCI,
+        .instance_size = sizeof(ASPEEDUHCIState),
+        .class_init    = uhci_sysbus_aspeed_class_init,
+    },
 };
 
 DEFINE_TYPES(uhci_sysbus_types);
diff --git a/hw/usb/hcd-uhci-sysbus.h b/hw/usb/hcd-uhci-sysbus.h
index c491b9fc92..75c4716c40 100644
--- a/hw/usb/hcd-uhci-sysbus.h
+++ b/hw/usb/hcd-uhci-sysbus.h
@@ -4,6 +4,7 @@
 #include "hcd-uhci.h"
 
 #define TYPE_SYSBUS_UHCI "sysbus-uhci"
+#define TYPE_ASPEED_UHCI "aspeed-uhci"
 
 OBJECT_DECLARE_SIMPLE_TYPE(UHCISysBusState, SYSBUS_UHCI)
 
@@ -20,4 +21,14 @@ struct UHCISysBusState {
     uint32_t num_ports;
 };
 
+OBJECT_DECLARE_SIMPLE_TYPE(ASPEEDUHCIState, ASPEED_UHCI)
+
+struct ASPEEDUHCIState {
+    /*< private >*/
+    UHCISysBusState parent_obj;
+    /*< public >*/
+
+    MemoryRegion mem_aspeed;
+};
+
 #endif /* HW_USB_HCD_UHCI_SYSBUS_H */
-- 
2.45.2

