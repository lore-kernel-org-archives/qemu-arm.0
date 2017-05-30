Received: by 10.25.0.6 with SMTP id 6csp1875377lfa;
        Tue, 30 May 2017 08:39:33 -0700 (PDT)
X-Received: by 10.55.82.7 with SMTP id g7mr11274560qkb.253.1496158773785;
        Tue, 30 May 2017 08:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496158773; cv=none;
        d=google.com; s=arc-20160816;
        b=CSKn4zeHaLxkWMwI799tMnW/zVmMaMCzcA0Pb0xI9iAi3JOEw+9ASkv7zl/eQZY4pN
         BxHR3mBgLrbfPRJKguSzPPfwuU4gJvz5Dom7LU9ITrzIVdfitPbBRv2tUeuI0EOx5xHs
         dExiBuAgK5EQHMUA+tcw1IKgjULFhS2f440RsGmARgIFMgvx8e1q/16WhTsrypJ8zoCT
         r/Jbyfmj6Etw01JBCNaU0S0H7iG6/pR9YFCZnMCjqgZZbJp8CwFXVcreh2D2qGd9bVI4
         2V/gqHW0X+hdh4yu/z6ax3umshhAcOK+AInLo5K3rYNaLCX+YpurtJcA52UFnh9j/WQZ
         jq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:to:date:dkim-signature
         :arc-authentication-results;
        bh=+rFl87kmDerctivNqjQIrJkKOx6qJ2kooHT4acvbxtI=;
        b=EcYfcYU3N24N4TsSAnCRz/Q1e+yv931Iu4aI/BsG5RSez10uDLOF8J8eq2JDbKwWDq
         5b7lLr8Y09nhUX5z92VVX1Z3MkeId2mnqG9g4h/gj0RSwq4FAhtkZh51twrucacHMNAV
         FQvzwR1pyJfgvBi3m/Lqqnvd4n19Idu48wkJvW5DHD+eLhM01czDJfQ2e5BTEpNGzASN
         X5qDotljSrMJBy9yIUHLjgW5ENtPQHEaAyNiET/jAWBukox449ygEVINSA5N1KV1wkKS
         mdCJCDltjGncS7I467iNUYGq3186opmmLpxYoenk/jqG3RquAVEwjhAXHcpQsrMmrIgX
         UyiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rocketmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l184si12963551qkb.270.2017.05.30.08.39.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 08:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rocketmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjF7-0007O7-3w
	for alex.bennee@linaro.org; Tue, 30 May 2017 11:39:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie@rocketmail.com>) id 1dFjCS-0005Vp-U0
	for qemu-devel@nongnu.org; Tue, 30 May 2017 11:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flypie@rocketmail.com>) id 1dFjCN-00077i-VS
	for qemu-devel@nongnu.org; Tue, 30 May 2017 11:36:48 -0400
Received: from nm5-vm1.bullet.mail.ir2.yahoo.com ([212.82.96.108]:40663)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <flypie@rocketmail.com>) id 1dFjCN-00076m-Hh
	for qemu-devel@nongnu.org; Tue, 30 May 2017 11:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
	t=1496158602; bh=+rFl87kmDerctivNqjQIrJkKOx6qJ2kooHT4acvbxtI=;
	h=Date:From:CC:To:Subject:From:Subject;
	b=hvc2HPSut4qH1FBiem0yI6aUSxwk8OUGVJdbH2CIsK9XxwbBF+NPdTzEahH3UkRVFf2mN6AKL8T1PkFSHQlg5GFXlfjeaXC17IPic7TBpXajMLxXfZ66GfiQlSWs1/tMk4BsLn/60JhixVXMUKiVUqTW+oo4mowK8YGJV6+lU4Qgl6E8oAiyXILBN22tT0tzy5V5sxAUn7VtrXG20Wxjrg2r0d4q2RfhKnALyGaSR04aLTFGMYj07BfSDSJq7vEZax6H2pxHzDC+pXDvc8dVRbIHvOnFvOt7Q5Ra1KLh7hvkenRnJvFHXwJgP7+Ft9E1132f8D4tRKDz+/WIJuNCUQ==
Received: from [212.82.98.56] by nm5.bullet.mail.ir2.yahoo.com with NNFMP;
	30 May 2017 15:36:42 -0000
Received: from [46.228.39.97] by tm9.bullet.mail.ir2.yahoo.com with NNFMP;
	30 May 2017 15:36:42 -0000
Received: from [127.0.0.1] by smtp134.mail.ir2.yahoo.com with NNFMP;
	30 May 2017 15:36:42 -0000
X-Yahoo-Newman-Id: 202257.17305.bm@smtp134.mail.ir2.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: pjfPISIVM1lacN309vdflj39h48fFk1ppuQxvJF9BKKp8.J
	HYF9aQgFOD146DNnxp_wdeRW0BnKKqaAo8mWBVAvm8f1XGWiyxS9Y1GBiV5J
	YrZD8qpweXZV611bP3VxjSm01.nhUHLEuG5U8Y1f4hwdo5PVUYjgxG1yaiQP
	r7rOijLScLt8b64fJPPqu6A1LCNIzQRgR6Q7Yy0JNy6OfqbtHNW0kk_zFtC2
	eNqw5yVEbARv6os7T1C_1fyg4.hGZE2XMw15iTfn.5DlffklE6E8rHcWeAYE
	CWJhB11DQmS5yEcsio7NB2SuV_RtCB0wFvMmfV_qgCPbLqLhBUtQKJ2bsr2H
	q65iS4BIEG1yKWQ1Ia.X4EQcgwo5oTGKJ3HqDAq8irtGzkMxH1I1NqmBivVD
	VUef_ZZo.ASyube7RLU8.IzEqSA_k6n0LrxCDtsiOG22NedD.V4DbKYvyaNo
	9LWUqvX6ZiA2uQWMzQCMVwcb_zM5EBOdcUUoTwG_.JEV_P08PDQXlBLfTfUB
	Dduw7zb1wxMzuOLOIxq4ay5XyMp4DuHXpanRWrVw1bO4R8tsH3x0cTYnSu56
	XOvjaRf1Ul.wpE4Jy
X-Yahoo-SMTP: Zay5iG2swBBwBjVsWquSqCXzMrQnnj5rR6LdlZsQ7MCyug--
Date: Tue, 30 May 2017 16:36:37 +0000
To: <qemu-devel@nongnu.org> , <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>
Message-ID: <3a2acc21-d494-465c-bb33-6ca4d6c544b8@ONE.local>
X-Mailer: TortoiseGit
MIME-Version: 1.0
Content-Type: text/plain; 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 212.82.96.108
Subject: [Qemu-devel] [PATCH] Add code to connect to external panel, for ARM
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
From: John Bradley via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: John Bradley <flypie@rocketmail.com>
Cc: flypie@rocketmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WbE8fdyPYRx4

From 5f5c186162ef5f56872095318106e9fe360ae310 Mon Sep 17 00:00:00 2001
From: John Bradley <flypie@rocketmail.com>
Date: Tue, 23 May 2017 01:43:32 +0100
Subject: [PATCH] Add code to connect to external panel, for ARM

Has no effect if panel not found.

GDummyPanel Fix formating issues.

Add inital discussion of protocol version.

Add code to connect with https://github.com/flypie/GDummyPanel The code uses GNU Sockets & Windows
sockets as on MINGW GNU no available. This is inteded as a Demo for RFC.


Signed-off-by: John Bradley <flypie@rocketmail.com>
---
 hw/gpio/bcm2835_gpio.c         | 136 +++++++++++------
 include/hw/gpio/bcm2835_gpio.h |   4 +
 include/qemu/PanelEmu.h        |  53 +++++++
 util/Makefile.objs             |   1 +
 util/PanelEmu.c                | 326 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 479 insertions(+), 41 deletions(-)
 create mode 100644 include/qemu/PanelEmu.h
 create mode 100644 util/PanelEmu.c

diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
index acc2e3cf9e..5df3f4cddf 100644
--- a/hw/gpio/bcm2835_gpio.c
+++ b/hw/gpio/bcm2835_gpio.c
@@ -19,6 +19,8 @@
 #include "hw/sd/sd.h"
 #include "hw/gpio/bcm2835_gpio.h"
 
+
+
 #define GPFSEL0   0x00
 #define GPFSEL1   0x04
 #define GPFSEL2   0x08
@@ -75,24 +77,24 @@ static void gpfsel_set(BCM2835GpioState *s, uint8_t reg, uint32_t value)
 
     /* SD controller selection (48-53) */
     if (s->sd_fsel != 0
-            && (s->fsel[48] == 0) /* SD_CLK_R */
-            && (s->fsel[49] == 0) /* SD_CMD_R */
-            && (s->fsel[50] == 0) /* SD_DATA0_R */
-            && (s->fsel[51] == 0) /* SD_DATA1_R */
-            && (s->fsel[52] == 0) /* SD_DATA2_R */
-            && (s->fsel[53] == 0) /* SD_DATA3_R */
-            ) {
+        && (s->fsel[48] == 0) /* SD_CLK_R */
+        && (s->fsel[49] == 0) /* SD_CMD_R */
+        && (s->fsel[50] == 0) /* SD_DATA0_R */
+        && (s->fsel[51] == 0) /* SD_DATA1_R */
+        && (s->fsel[52] == 0) /* SD_DATA2_R */
+        && (s->fsel[53] == 0) /* SD_DATA3_R */
+        ) {
         /* SDHCI controller selected */
         sdbus_reparent_card(s->sdbus_sdhost, s->sdbus_sdhci);
         s->sd_fsel = 0;
     } else if (s->sd_fsel != 4
-            && (s->fsel[48] == 4) /* SD_CLK_R */
-            && (s->fsel[49] == 4) /* SD_CMD_R */
-            && (s->fsel[50] == 4) /* SD_DATA0_R */
-            && (s->fsel[51] == 4) /* SD_DATA1_R */
-            && (s->fsel[52] == 4) /* SD_DATA2_R */
-            && (s->fsel[53] == 4) /* SD_DATA3_R */
-            ) {
+               && (s->fsel[48] == 4) /* SD_CLK_R */
+               && (s->fsel[49] == 4) /* SD_CMD_R */
+               && (s->fsel[50] == 4) /* SD_DATA0_R */
+               && (s->fsel[51] == 4) /* SD_DATA1_R */
+               && (s->fsel[52] == 4) /* SD_DATA2_R */
+               && (s->fsel[53] == 4) /* SD_DATA3_R */
+               ) {
         /* SDHost controller selected */
         sdbus_reparent_card(s->sdbus_sdhci, s->sdbus_sdhost);
         s->sd_fsel = 4;
@@ -108,7 +110,7 @@ static int gpfsel_is_out(BCM2835GpioState *s, int index)
 }
 
 static void gpset(BCM2835GpioState *s,
-        uint32_t val, uint8_t start, uint8_t count, uint32_t *lev)
+                  uint32_t val, uint8_t start, uint8_t count, uint32_t *lev)
 {
     uint32_t changes = val & ~*lev;
     uint32_t cur = 1;
@@ -125,7 +127,7 @@ static void gpset(BCM2835GpioState *s,
 }
 
 static void gpclr(BCM2835GpioState *s,
-        uint32_t val, uint8_t start, uint8_t count, uint32_t *lev)
+                  uint32_t val, uint8_t start, uint8_t count, uint32_t *lev)
 {
     uint32_t changes = val & *lev;
     uint32_t cur = 1;
@@ -141,11 +143,12 @@ static void gpclr(BCM2835GpioState *s,
     *lev &= ~val;
 }
 
-static uint64_t bcm2835_gpio_read(void *opaque, hwaddr offset,
-        unsigned size)
+static uint64_t bcm2835_gpio_read(void *opaque, hwaddr offset, unsigned size)
 {
     BCM2835GpioState *s = (BCM2835GpioState *)opaque;
 
+    uint64_t Data;
+
     switch (offset) {
     case GPFSEL0:
     case GPFSEL1:
@@ -163,8 +166,20 @@ static uint64_t bcm2835_gpio_read(void *opaque, hwaddr offset,
         /* Write Only */
         return 0;
     case GPLEV0:
+        if (s->panel.socket != -1) {
+            if (panel_read(&s->panel, &Data)) {
+                s->lev0 = (uint32_t)Data;
+                s->lev1 = (uint32_t)(Data >> 32);
+            }
+        }
         return s->lev0;
     case GPLEV1:
+        if (s->panel.socket != -1) {
+            if (panel_read(&s->panel, &Data)) {
+                s->lev0 = (uint32_t)Data;
+                s->lev1 = (uint32_t)(Data >> 32);
+            }
+        }
         return s->lev1;
     case GPEDS0:
     case GPEDS1:
@@ -187,7 +202,7 @@ static uint64_t bcm2835_gpio_read(void *opaque, hwaddr offset,
         return 0;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
-                __func__, offset);
+                      __func__, offset);
         break;
     }
 
@@ -195,9 +210,11 @@ static uint64_t bcm2835_gpio_read(void *opaque, hwaddr offset,
 }
 
 static void bcm2835_gpio_write(void *opaque, hwaddr offset,
-        uint64_t value, unsigned size)
+                               uint64_t value, unsigned size)
 {
     BCM2835GpioState *s = (BCM2835GpioState *)opaque;
+    uint64_t Data;
+
 
     switch (offset) {
     case GPFSEL0:
@@ -210,15 +227,37 @@ static void bcm2835_gpio_write(void *opaque, hwaddr offset,
         break;
     case GPSET0:
         gpset(s, value, 0, 32, &s->lev0);
+        if (s->panel.socket != -1) {
+            Data = value;
+            /* John Bradley dummy GPIO Panel */
+            senddatatopanel(&s->panel, Data, true);
+        }
         break;
     case GPSET1:
         gpset(s, value, 32, 22, &s->lev1);
+        if (s->panel.socket != -1) {
+            Data = value;
+            Data <<= 32;
+            /* John Bradley dummy GPIO Panel */
+            senddatatopanel(&s->panel, Data, true);
+        }
         break;
     case GPCLR0:
         gpclr(s, value, 0, 32, &s->lev0);
+        if (s->panel.socket != -1) {
+            Data = value;
+            /* John Bradley dummy GPIO Panel */
+            senddatatopanel(&s->panel, Data, false);
+        }
         break;
     case GPCLR1:
         gpclr(s, value, 32, 22, &s->lev1);
+        if (s->panel.socket != -1) {
+            Data = value;
+            Data <<= 32;
+            /* John Bradley dummy GPIO Panel */
+            senddatatopanel(&s->panel, Data, false);
+        }
         break;
     case GPLEV0:
     case GPLEV1:
@@ -250,7 +289,7 @@ static void bcm2835_gpio_write(void *opaque, hwaddr offset,
 
 err_out:
     qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
-            __func__, offset);
+                  __func__, offset);
 }
 
 static void bcm2835_gpio_reset(DeviceState *dev)
@@ -272,21 +311,22 @@ static void bcm2835_gpio_reset(DeviceState *dev)
 }
 
 static const MemoryRegionOps bcm2835_gpio_ops = {
-    .read = bcm2835_gpio_read,
-    .write = bcm2835_gpio_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+        .read = bcm2835_gpio_read,
+        .write = bcm2835_gpio_write,
+        .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
 static const VMStateDescription vmstate_bcm2835_gpio = {
-    .name = "bcm2835_gpio",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT8_ARRAY(fsel, BCM2835GpioState, 54),
-        VMSTATE_UINT32(lev0, BCM2835GpioState),
-        VMSTATE_UINT32(lev1, BCM2835GpioState),
-        VMSTATE_UINT8(sd_fsel, BCM2835GpioState),
-        VMSTATE_END_OF_LIST()
+        .name = "bcm2835_gpio",
+        .version_id = 1,
+        .minimum_version_id = 1,
+        .fields = (VMStateField[])
+    {
+     VMSTATE_UINT8_ARRAY(fsel, BCM2835GpioState, 54),
+     VMSTATE_UINT32(lev0, BCM2835GpioState),
+     VMSTATE_UINT32(lev1, BCM2835GpioState),
+     VMSTATE_UINT8(sd_fsel, BCM2835GpioState),
+     VMSTATE_END_OF_LIST()
     }
 };
 
@@ -300,9 +340,23 @@ static void bcm2835_gpio_init(Object *obj)
                         TYPE_SD_BUS, DEVICE(s), "sd-bus");
 
     memory_region_init_io(&s->iomem, obj,
-            &bcm2835_gpio_ops, s, "bcm2835_gpio", 0x1000);
+                          &bcm2835_gpio_ops, s, "bcm2835_gpio", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     qdev_init_gpio_out(dev, s->out, 54);
+
+    /* Get access to the GPIO panel, program will quit on fail */
+    if (panel_open(&s->panel)) {
+        /* PI Has 54 Pins */
+        sendpincount(&s->panel, 54);
+        /* Pins 0 & 1 are I2C so disable */
+        sendenabledmap(&s->panel, 0x003FFFFFFFFFFFFC);
+        /* There are no dedicated input pins I know of */
+        sendinputmap(&s->panel, 0x0000000000000000);
+        /* Pin 53 is dedicated output LED */
+        sendoutputmap(&s->panel, 0x0000800000000000);
+    } else {
+        printf("Couldn't connect to a GPIO panel\n");
+    }
 }
 
 static void bcm2835_gpio_realize(DeviceState *dev, Error **errp)
@@ -314,7 +368,7 @@ static void bcm2835_gpio_realize(DeviceState *dev, Error **errp)
     obj = object_property_get_link(OBJECT(dev), "sdbus-sdhci", &err);
     if (obj == NULL) {
         error_setg(errp, "%s: required sdhci link not found: %s",
-                __func__, error_get_pretty(err));
+                   __func__, error_get_pretty(err));
         return;
     }
     s->sdbus_sdhci = SD_BUS(obj);
@@ -322,7 +376,7 @@ static void bcm2835_gpio_realize(DeviceState *dev, Error **errp)
     obj = object_property_get_link(OBJECT(dev), "sdbus-sdhost", &err);
     if (obj == NULL) {
         error_setg(errp, "%s: required sdhost link not found: %s",
-                __func__, error_get_pretty(err));
+                   __func__, error_get_pretty(err));
         return;
     }
     s->sdbus_sdhost = SD_BUS(obj);
@@ -338,11 +392,11 @@ static void bcm2835_gpio_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo bcm2835_gpio_info = {
-    .name          = TYPE_BCM2835_GPIO,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(BCM2835GpioState),
-    .instance_init = bcm2835_gpio_init,
-    .class_init    = bcm2835_gpio_class_init,
+                                           .name = TYPE_BCM2835_GPIO,
+                                           .parent = TYPE_SYS_BUS_DEVICE,
+                                           .instance_size = sizeof(BCM2835GpioState),
+                                           .instance_init = bcm2835_gpio_init,
+                                           .class_init = bcm2835_gpio_class_init,
 };
 
 static void bcm2835_gpio_register_types(void)
diff --git a/include/hw/gpio/bcm2835_gpio.h b/include/hw/gpio/bcm2835_gpio.h
index 9f8e0c720c..f7d7c79aa2 100644
--- a/include/hw/gpio/bcm2835_gpio.h
+++ b/include/hw/gpio/bcm2835_gpio.h
@@ -15,6 +15,7 @@
 #define BCM2835_GPIO_H
 
 #include "hw/sd/sd.h"
+#include "qemu/PanelEmu.h"
 
 typedef struct BCM2835GpioState {
     SysBusDevice parent_obj;
@@ -30,6 +31,9 @@ typedef struct BCM2835GpioState {
     uint32_t lev0, lev1;
     uint8_t sd_fsel;
     qemu_irq out[54];
+
+    panel_connection_t panel;
+
 } BCM2835GpioState;
 
 #define TYPE_BCM2835_GPIO "bcm2835_gpio"
diff --git a/include/qemu/PanelEmu.h b/include/qemu/PanelEmu.h
new file mode 100644
index 0000000000..1d97a80492
--- /dev/null
+++ b/include/qemu/PanelEmu.h
@@ -0,0 +1,53 @@
+/*
+ * To change this license header, choose License Headers in Project Properties.
+ * To change this template file, choose Tools | Templates
+ * and open the template in the editor.
+ */
+
+/*
+ * File:   PanelEmu.h
+ * Author: John Bradley
+ *
+ * Created on 22 April 2017, 22:26
+ */
+
+#ifndef PANELEMU_H
+#define PANELEMU_H
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+
+#define DRIVER_NAME "RDC-GPIO: "
+#define PANEL_NAME "GPIO panel: "
+
+
+#define DEFAULT_PORT 0xb1ff       /*45567*/
+
+#define PANEL_PINS 54
+
+    typedef struct panel_connection {
+        int socket; /* socket we'll connect to the panel with */
+        fd_set fds; /* list of descriptors (only the above socket */
+        char last[PANEL_PINS / 8]; /* we don't want to send updates to the panel
+                                   unless something changed */
+        int ProtocolInUse; /*What version of the protocol are we using. */
+    } panel_connection_t;
+
+    bool panel_open(panel_connection_t *h);
+
+    bool panel_read(panel_connection_t *h, uint64_t *pinS);
+    void senddatatopanel(panel_connection_t *h, uint64_t pinS, bool Value);
+    void panel_send_read_command(panel_connection_t *h);
+    void sendpincount(panel_connection_t *h, int Num);
+    void sendenabledmap(panel_connection_t *h, uint64_t pins);
+    void sendinputmap(panel_connection_t *h, uint64_t pins);
+    void sendoutputmap(panel_connection_t *h, uint64_t pins);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* PANELEMU_H */
+
diff --git a/util/Makefile.objs b/util/Makefile.objs
index c6205ebf86..8316ed79ba 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -43,3 +43,4 @@ util-obj-y += qdist.o
 util-obj-y += qht.o
 util-obj-y += range.o
 util-obj-y += systemd.o
+util-obj-y += PanelEmu.o
\ No newline at end of file
diff --git a/util/PanelEmu.c b/util/PanelEmu.c
new file mode 100644
index 0000000000..1aa29c6479
--- /dev/null
+++ b/util/PanelEmu.c
@@ -0,0 +1,326 @@
+/*
+ * Emulation for Rasp PI GPIO via Server connected to via Socket
+ *
+ */
+#include "qemu/osdep.h"
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <memory.h>
+#include <errno.h>
+#include <string.h>
+#include <sys/types.h>
+#ifdef __MINGW32__
+#include <winsock2.h>
+#else
+#include <sys/socket.h>
+#include <arpa/inet.h>
+#include <netinet/in.h>
+#endif
+
+#include "qemu/PanelEmu.h"
+
+typedef enum {
+    PROTOCOLDESCFROMQEMU = 0,
+    PROTOCOLDESCFROMPANEL = 1,
+    PINSTOPANEL = 2,
+    READREQ = 3,
+    PINCOUNT = 4,
+    ENABLEMAP = 5,
+    INPUTMAP = 6,
+    OUTPUTMAP = 7,
+    PINSTOQEMU = 8
+} PacketType;
+
+#define MINPROTOCOL 0
+#define MAXPROTOCOL 0
+
+#define MAXPACKET   255
+
+#define PACKETLEN   0  /* Includes Packet Length */
+#define PACKETTYPE  1
+
+typedef struct {
+    unsigned short int Data[MAXPACKET];
+} CommandPacket;
+
+static void panel_command(panel_connection_t *h, CommandPacket *Pkt);
+
+static void panel_send_protocol_command(panel_connection_t *h)
+{
+    CommandPacket Pkt;
+
+    Pkt.Data[PACKETLEN] = 8;
+    Pkt.Data[PACKETTYPE] = PROTOCOLDESCFROMQEMU;
+    Pkt.Data[2] = MINPROTOCOL;
+    Pkt.Data[3] = MAXPROTOCOL;
+
+    panel_command(h, &Pkt);
+}
+
+void panel_send_read_command(panel_connection_t *h)
+{
+    CommandPacket Pkt;
+
+    Pkt.Data[PACKETLEN] = 4;
+    Pkt.Data[PACKETTYPE] = READREQ;
+
+    panel_command(h, &Pkt);
+}
+
+/* Set a pin to a specified value */
+void senddatatopanel(panel_connection_t *h, uint64_t pin, bool val)
+{
+    CommandPacket Pkt;
+
+    Pkt.Data[PACKETLEN] = (char *)&Pkt.Data[6 + 1] - (char *)&Pkt.Data[0];
+    Pkt.Data[PACKETTYPE] = PINSTOPANEL;
+    Pkt.Data[2] = (unsigned short int)(pin & 0xFFFF);
+    Pkt.Data[3] = (unsigned short int)((pin >> 16) & 0xFFFF);
+    Pkt.Data[4] = (unsigned short int)(pin >> 32 & 0xFFFF);
+    Pkt.Data[5] = (unsigned short int)((pin >> 48) & 0xFFFF);
+    Pkt.Data[6] = val;
+
+    panel_command(h, &Pkt);
+}
+
+void sendpincount(panel_connection_t *h, int val)
+{
+    CommandPacket Pkt;
+
+    Pkt.Data[PACKETLEN] = (char *)&Pkt.Data[2 + 1] - (char *)&Pkt.Data[0];
+    Pkt.Data[PACKETTYPE] = PINCOUNT;
+    Pkt.Data[2] = val;
+
+    panel_command(h, &Pkt);
+}
+
+void sendenabledmap(panel_connection_t *h, uint64_t pin)
+{
+    CommandPacket Pkt;
+
+    Pkt.Data[PACKETLEN] = (char *)&Pkt.Data[5 + 1] - (char *)&Pkt.Data[0];
+    Pkt.Data[PACKETTYPE] = ENABLEMAP;
+    Pkt.Data[2] = (unsigned short int)(pin & 0xFFFF);
+    Pkt.Data[3] = (unsigned short int)((pin >> 16) & 0xFFFF);
+    Pkt.Data[4] = (unsigned short int)(pin >> 32 & 0xFFFF);
+    Pkt.Data[5] = (unsigned short int)((pin >> 48) & 0xFFFF);
+
+    panel_command(h, &Pkt);
+}
+
+void sendinputmap(panel_connection_t *h, uint64_t pin)
+{
+    CommandPacket Pkt;
+
+    Pkt.Data[PACKETLEN] = (char *)&Pkt.Data[5 + 1] - (char *)&Pkt.Data[0];
+    Pkt.Data[PACKETTYPE] = INPUTMAP;
+    Pkt.Data[2] = (unsigned short int)(pin & 0xFFFF);
+    Pkt.Data[3] = (unsigned short int)((pin >> 16) & 0xFFFF);
+    Pkt.Data[4] = (unsigned short int)(pin >> 32 & 0xFFFF);
+    Pkt.Data[5] = (unsigned short int)((pin >> 48) & 0xFFFF);
+
+    panel_command(h, &Pkt);
+}
+
+void sendoutputmap(panel_connection_t *h, uint64_t pin)
+{
+    CommandPacket Pkt;
+
+    Pkt.Data[PACKETLEN] = (char *)&Pkt.Data[5 + 1] - (char *)&Pkt.Data[0];
+    Pkt.Data[PACKETTYPE] = OUTPUTMAP;
+    Pkt.Data[2] = (unsigned short int)(pin & 0xFFFF);
+    Pkt.Data[3] = (unsigned short int)((pin >> 16) & 0xFFFF);
+    Pkt.Data[4] = (unsigned short int)(pin >> 32 & 0xFFFF);
+    Pkt.Data[5] = (unsigned short int)((pin >> 48) & 0xFFFF);
+
+    panel_command(h, &Pkt);
+}
+
+static void panel_command(panel_connection_t *h, CommandPacket *Pkt)
+{
+    if (send(h->socket, (char *)Pkt, Pkt->Data[PACKETLEN], 0) == -1) {
+        perror(PANEL_NAME "send");
+#ifdef __MINGW32__
+        closesocket(h->socket);
+#else
+        close(h->socket);
+#endif
+        h->socket = -1; /* act like we never connected */
+    }
+}
+
+/* Wait for values to be read back from panel */
+bool panel_read(panel_connection_t *h, uint64_t* Data)
+{
+    fd_set rfds, efds;
+    int LengthInBuffer;
+    int select_res = 0;
+
+    CommandPacket *PktPtr = (CommandPacket *)malloc(sizeof(CommandPacket));
+    CommandPacket *Pkt;
+    bool NoError = true;
+    bool NewData = false;
+    bool NoData = false;
+    struct timeval timeout;
+
+    int ReadStart = 0;
+    int i , j;
+
+    timeout.tv_sec = 0;
+    timeout.tv_usec = 0;
+
+    if (h->socket != -1) {
+        rfds = h->fds;
+        efds = h->fds;
+
+        Pkt = PktPtr;
+        while (NoError && !NoData) {
+            select_res = select(h->socket + 1, &rfds, NULL, &efds, &timeout);
+            if (select_res > 0) {
+                if (FD_ISSET(h->socket, &rfds)) {
+                    /* receive more data */
+                    LengthInBuffer = recv(h->socket, (char *)&Pkt[ReadStart],
+                                    sizeof(*Pkt) - ReadStart, 0);
+                    if (LengthInBuffer > 0) {
+                        LengthInBuffer += ReadStart;
+                        for (i = 0; LengthInBuffer > 0; i++) {
+                            if (LengthInBuffer >= Pkt->Data[i + PACKETLEN]) {
+                                switch (Pkt->Data[i + PACKETTYPE]) {
+                                case PINSTOQEMU:
+                                    *Data = (uint64_t)Pkt->Data[i + 2];
+                                    *Data |= ((uint64_t)Pkt->Data[i + 3]) << 16;
+                                    *Data |= ((uint64_t)Pkt->Data[i + 4]) << 32;
+                                    *Data |= ((uint64_t)Pkt->Data[i + 5]) << 48;
+
+                                    NewData = true;
+                                    break;
+
+                                case PROTOCOLDESCFROMPANEL:
+                                    h->ProtocolInUse = (int)Pkt->Data[i + 2];
+                                    if (h->ProtocolInUse != -1) {
+                                        printf(PANEL_NAME "Protocol %d\n",
+                                               h->ProtocolInUse);
+                                    } else {
+                                        printf(PANEL_NAME "No Common Pcol\n");
+                                    }
+                                    break;
+
+                                default:
+                                    printf(PANEL_NAME "Invalid data receive\n");
+                                    break;
+                                }
+                                LengthInBuffer -= Pkt->Data[PACKETLEN];
+                                i += Pkt->Data[PACKETLEN];
+                            } else {
+                                ReadStart = LengthInBuffer;
+                                for (j = 0; j < LengthInBuffer; j++) {
+                                    Pkt->Data[j] = Pkt->Data[i + j];
+                                }
+                                printf(PANEL_NAME "Partial Packet Read");
+                            }
+                        }
+                    } else {
+                        if (LengthInBuffer < 0) {
+                            if (errno != EINTR) {
+                                printf(PANEL_NAME "recv");
+                                NoError = FALSE;
+                            }
+                        } else {
+                            printf(PANEL_NAME "closed connection\n");
+                            NoError = FALSE;
+                        }
+                    }
+                }
+            } else if (select_res == 0) {
+                NoData = true;
+            } else if (errno != EINTR) {
+#ifdef __MINGW32__
+                closesocket(h->socket);
+#else
+                close(h->socket);
+#endif
+                h->socket = -1; /* act like we never connected */
+                perror(PANEL_NAME "select error");
+                NoError = FALSE;
+            }
+        }
+    }
+
+    free(PktPtr);
+
+    return NewData;
+}
+
+bool panel_open(panel_connection_t *h)
+{
+    int rv;
+#ifdef __MINGW32__
+    struct sockaddr_in remote;
+#else
+    struct sockaddr_in remote;
+#endif
+
+    bool returnval = false;
+
+#ifdef __MINGW32__
+    printf("__MINGW32__\n");
+#else
+    printf("NOT __MINGW32__\n");
+#endif
+
+    h->socket = -1;
+    h->ProtocolInUse = -1;
+
+#ifdef __MINGW32__
+    WSADATA wsadata;
+    if (WSAStartup(MAKEWORD(1, 1), &wsadata) == SOCKET_ERROR) {
+        printf("Error creating socket.\n");
+    } else {
+#endif
+        h->socket = socket(AF_INET, SOCK_STREAM, 0);
+        if (h->socket != -1) {
+#ifdef __MINGW32__
+            memset((char *)&remote, 0, sizeof(remote));
+            remote.sin_family = AF_INET;
+            remote.sin_port = htons(DEFAULT_PORT);
+            remote.sin_addr.s_addr = inet_addr("127.0.0.1");
+#else
+            memset((char *)&remote, 0, sizeof(remote));
+            remote.sin_family = AF_INET;
+            remote.sin_port = htons(DEFAULT_PORT);
+            remote.sin_addr.s_addr = inet_addr("127.0.0.1");
+#endif
+            rv = connect(h->socket,
+                            (struct sockaddr *)&remote, sizeof(remote));
+            if (rv != -1) {
+#ifdef __MINGW32__
+                char value = 1;
+                setsockopt(h->socket, IPPROTO_TCP, TCP_NODELAY,
+                           &value, sizeof(value));
+#endif
+                FD_ZERO(&h->fds);
+
+                /* Set our connected socket */
+                FD_SET(h->socket, &h->fds);
+
+                printf(PANEL_NAME "Connected OK %d\n", rv);
+
+                panel_send_protocol_command(h);
+
+                returnval = true;
+            } else {
+                printf(PANEL_NAME "connection Fails %d\n", rv);
+#ifdef __MINGW32__
+                closesocket(h->socket);
+#else
+                close(h->socket);
+#endif
+                h->socket = -1;
+            }
+        }
+#ifdef __MINGW32__
+    }
+#endif
+    return returnval;
+}
-- 
2.13.0.windows.1


