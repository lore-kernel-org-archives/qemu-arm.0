Received: by 10.25.30.65 with SMTP id e62csp1245019lfe;
        Wed, 25 May 2016 04:16:35 -0700 (PDT)
X-Received: by 10.55.23.153 with SMTP id 25mr639530qkx.132.1464174995366;
        Wed, 25 May 2016 04:16:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c68si39482434qga.7.2016.05.25.04.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Wni-0007zn-ML
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:16:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WWr-0000aB-13
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WWp-0002RP-25
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:59:07 -0400
Received: from m12-18.163.com ([220.181.12.18]:39499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b5WWi-0002K5-Md; Wed, 25 May 2016 06:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=HMGAecyOZw4zk3RQce
	LQfM6YJuPWV/vK5REsk0y2XjM=; b=UXIoGhSbEEbo3EV79i4NFEv4+zInSdPqSJ
	k0Cnv4MfOQn/fAixCG7rHOZgFGZP1KpAitVHG/K8uSG58KHfoK/CcBL2zGFD5Zgf
	32R9TZI2cLB5sXg3Z7hLZ/FYb3FYc7oV/n4w1N3oIiaAJTuYLG6ecPVyTNDvKo8w
	U6BidAruI=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZp0pKhUVXzcaKAA--.5553S5;
	Wed, 25 May 2016 18:58:52 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 18:58:13 +0800
Message-Id: <1464173896-4088-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZp0pKhUVXzcaKAA--.5553S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFykGF1fGr4kZFy3Cw4xtFb_yoW8tr4UpF
	yDXF9xKrW7CrsrXFW3J3W0kF4UGF1rZw12kF17GwnruFy7G3Z5A3Z8KayY9Fy7urZ5ZFyY
	v3y7XFyDJF47t3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfVyxUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEAx0xlUL8osesAAAsn
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 3/6] hw/char: QOM'ify digic-uart model
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
Cc: robh@kernel.org, peter.maydell@linaro.org, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, antonynpavlov@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9sycayJOhlwa

* drop qemu_char_get_next_serial and use chardev prop
* change affected board code to use the new way

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/digic.c       |  2 ++
 hw/char/digic-uart.c | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index e0f9730..d60ea39 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -23,6 +23,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/arm/digic.h"
+#include "sysemu/sysemu.h"
 
 #define DIGIC4_TIMER_BASE(n)    (0xc0210000 + (n) * 0x100)
 
@@ -84,6 +85,7 @@ static void digic_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(sbd, 0, DIGIC4_TIMER_BASE(i));
     }
 
+    qdev_prop_set_chr(DEVICE(&s->uart), "chardev", serial_hds[0]);
     object_property_set_bool(OBJECT(&s->uart), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
index 0e44878..c7604e6 100644
--- a/hw/char/digic-uart.c
+++ b/hw/char/digic-uart.c
@@ -145,8 +145,6 @@ static void digic_uart_realize(DeviceState *dev, Error **errp)
 {
     DigicUartState *s = DIGIC_UART(dev);
 
-    /* FIXME use a qdev chardev prop instead of qemu_char_get_next_serial() */
-    s->chr = qemu_char_get_next_serial();
     if (s->chr) {
         qemu_chr_add_handlers(s->chr, uart_can_rx, uart_rx, uart_event, s);
     }
@@ -172,6 +170,11 @@ static const VMStateDescription vmstate_digic_uart = {
     }
 };
 
+static Property digic_uart_properties[] = {
+    DEFINE_PROP_CHR("chardev", DigicUartState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void digic_uart_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -179,8 +182,7 @@ static void digic_uart_class_init(ObjectClass *klass, void *data)
     dc->realize = digic_uart_realize;
     dc->reset = digic_uart_reset;
     dc->vmsd = &vmstate_digic_uart;
-    /* Reason: realize() method uses qemu_char_get_next_serial() */
-    dc->cannot_instantiate_with_device_add_yet = true;
+    dc->props = digic_uart_properties;
 }
 
 static const TypeInfo digic_uart_info = {
-- 
2.1.4


