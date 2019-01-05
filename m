Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1709024wrt;
        Sat, 5 Jan 2019 07:02:21 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7dSkBTCBxK3Sdz9Wz1RiZqLIEPrqnAPymKWy9ITMO/Xuj6ezC3A9MacXP8hJyWkxNsyxP3
X-Received: by 2002:a1c:58ce:: with SMTP id m197mr4420192wmb.31.1546700541769;
        Sat, 05 Jan 2019 07:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546700541; cv=none;
        d=google.com; s=arc-20160816;
        b=QfZ+HLrU6u8aZste0gvDcoTlCh6y/wA1zt7JghElsZzZCS0dpPCg7jlU9xoCcbqQ6d
         Ts2noCtDm7OiEPg2d1jLUKkrkh8RlL7gkiI3CuI9/Vp7CfZbp6t5VLkcMFKXBlouqyOW
         k20pzWx8m4+jBkB/UzBFm++pNKFqC8w3IiDuhPphtqqx3XsTvV4GvblFIzOyR57jDa2F
         dSJNLa6YL8eOdiExGrSIq7vbAIExhhqRTHl1LvWVgD3XvnjL7VMyauw1iEMMWMvNSR2d
         NuM9u4u2WRz7gwZbzsAqIwh8RcSbpO87PXnyvtnwCnFALADUcMGbmA++GQIzk98ZUOpy
         TdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=kf7w0ccGqxOuDU0Cum2rNWgCy+94BGLbIu2gbye0vls=;
        b=TqSZlTbjF1qw5+v3fVWrDWRnoHuAA/ceHnEGQUgm8o/VjkgOlp8WbUX1pyU4KXVY1+
         3Kx4c0XOqjWPu5WPw8Ezb7I4OCXO9ugTE7P8fTBr8xTEwDjfWHTvN+7iN9+vtq/68Pam
         BvuswxfpQnrj3+hlPc3dT2vC/6DRuicCmQimlO921DhPJYCxMMsLcqP8QCk/Ua0HC9CN
         cUDV/HSQ4VRxr3HKYbTWhjvKBjDEYgi8WgbZ9mwGWXDiH7ChDUlq9G9xgn4q9TafFxrs
         fBBVTikUFVgyvmXzRFmOfNkYYnxZk/a4ov8dByPVn/GhmEruoDVYmD0LAsspW0jKf6wj
         90nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si32872920wrw.25.2019.01.05.07.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 05 Jan 2019 07:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfnSu-0005hu-TE
	for alex.bennee@linaro.org; Sat, 05 Jan 2019 10:02:20 -0500
Received: from eggsout.gnu.org ([209.51.188.92]:43259 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gfnSh-0005ff-Gl
	for qemu-arm@nongnu.org; Sat, 05 Jan 2019 10:02:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gfnSe-0000ea-6L
	for qemu-arm@nongnu.org; Sat, 05 Jan 2019 10:02:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43864)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gfnSd-0000cv-Un; Sat, 05 Jan 2019 10:02:04 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FA40859FF;
	Sat,  5 Jan 2019 15:02:01 +0000 (UTC)
Received: from localhost (ovpn-116-33.ams2.redhat.com [10.36.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C4205D6A9;
	Sat,  5 Jan 2019 15:01:57 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat,  5 Jan 2019 14:44:29 +0000
Message-Id: <20190105144429.8702-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 05 Jan 2019 15:02:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] arm: Stub out NRF51 TWI
 magnetometer/accelerometer detection
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	contrib@steffen-goertz.de, qemu-arm@nongnu.org, joel@jms.id.au,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 54XYpaHgZPh6

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Recent microbit firmwares panic if the TWI magnetometer/accelerometer
devices are not detected during startup.  We don't implement TWI (I2C)
so let's stub out these devices just to let the firmware boot.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Based-on: <20190103091119.9367-1-stefanha@redhat.com>
---
Steffen: Please post your Signed-off-by.  I did some minor cleanups so
your patch can be merged.  Thanks!

 include/hw/arm/nrf51.h     |  1 +
 include/hw/arm/nrf51_soc.h |  1 +
 hw/arm/nrf51_soc.c         | 62 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/include/hw/arm/nrf51.h b/include/hw/arm/nrf51.h
index 175bb6c301..5411121b66 100644
--- a/include/hw/arm/nrf51.h
+++ b/include/hw/arm/nrf51.h
@@ -25,6 +25,7 @@
 #define NRF51_IOMEM_SIZE      0x20000000
=20
 #define NRF51_UART_BASE       0x40002000
+#define NRF51_TWI_BASE        0x40003000
 #define NRF51_TIMER_BASE      0x40008000
 #define NRF51_TIMER_SIZE      0x00001000
 #define NRF51_RNG_BASE        0x4000D000
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index e06f0304b4..fbdefc07e4 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -39,6 +39,7 @@ typedef struct NRF51State {
     MemoryRegion sram;
     MemoryRegion flash;
     MemoryRegion clock;
+    MemoryRegion twi;
=20
     uint32_t sram_size;
     uint32_t flash_size;
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 1630c27594..265438f916 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -32,6 +32,11 @@
 #define NRF51822_FLASH_SIZE     (256 * NRF51_PAGE_SIZE)
 #define NRF51822_SRAM_SIZE      (16 * NRF51_PAGE_SIZE)
=20
+#define NRF51_TWI_EVENT_STOPPED 0x104
+#define NRF51_TWI_EVENT_RXDREADY 0x108
+#define NRF51_TWI_EVENT_TXDSENT 0x11c
+#define NRF51_TWI_REG_RXD 0x518
+
 #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
=20
 static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int size)
@@ -53,6 +58,58 @@ static const MemoryRegionOps clock_ops =3D {
     .write =3D clock_write
 };
=20
+/* Two-Wire Interface (TWI) is not implemented but the microbit-dal firm=
ware
+ * panics if the TWI accelerometer and magnetometer WHO_AM_I registers c=
annot
+ * be read.  Stub out this read sequence so microbit-dal starts up.
+ */
+static uint32_t twi_read_sequence[] =3D {0x5A, 0x5A, 0x40};
+static uint32_t twi_regs[0x1000 / 4];
+
+static uint64_t twi_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    static int i;
+    uint64_t data =3D 0x00;
+
+    switch (addr) {
+    case NRF51_TWI_EVENT_STOPPED:
+        data =3D 0x01;
+        break;
+    case NRF51_TWI_EVENT_RXDREADY:
+        data =3D 0x01;
+        break;
+    case NRF51_TWI_EVENT_TXDSENT:
+        data =3D 0x01;
+        break;
+    case NRF51_TWI_REG_RXD:
+        data =3D twi_read_sequence[i];
+        if (i < ARRAY_SIZE(twi_read_sequence)) {
+            i++;
+        }
+        break;
+    default:
+        data =3D twi_regs[addr / 4];
+        break;
+    }
+
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u] =3D %" PRIx32 =
"\n",
+                  __func__, addr, size, (uint32_t)data);
+
+
+    return data;
+}
+
+static void twi_write(void *opaque, hwaddr addr, uint64_t data,
+                      unsigned int size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n",
+                  __func__, addr, data, size);
+    twi_regs[addr / 4] =3D data;
+}
+
+static const MemoryRegionOps twi_ops =3D {
+    .read =3D twi_read,
+    .write =3D twi_write
+};
=20
 static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
 {
@@ -156,6 +213,11 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
Error **errp)
     memory_region_add_subregion_overlap(&s->container,
                                         NRF51_IOMEM_BASE, &s->clock, -1)=
;
=20
+    memory_region_init_io(&s->twi, NULL, &twi_ops, NULL,
+                          "nrf51_soc.twi", 0x1000);
+    memory_region_add_subregion_overlap(&s->container,
+                                        NRF51_TWI_BASE, &s->twi, -1);
+
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
     create_unimplemented_device("nrf51_soc.ficr", NRF51_FICR_BASE,
--=20
2.20.1

