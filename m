Received: by 10.25.30.65 with SMTP id e62csp1251694lfe;
        Wed, 25 May 2016 04:30:55 -0700 (PDT)
X-Received: by 10.140.108.183 with SMTP id j52mr2856302qgf.90.1464175855814;
        Wed, 25 May 2016 04:30:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r32si7420168qtc.58.2016.05.25.04.30.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:30:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5X1b-0004Lb-56
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:30:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WX9-0000uk-4t
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:59:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WX1-0002U7-ML
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:59:27 -0400
Received: from m12-18.163.com ([220.181.12.18]:39503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b5WWj-0002K8-9e; Wed, 25 May 2016 06:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=lkqs7rl8xqESmc0DoW
	CT2bUua25z5/4c8TlWFxDb0Hc=; b=qTkgzGWbGJiU+xfHg3DH56bks1tzgGqmBB
	/tcdTJmPKr1WjgkPmQpAoem6fyRxB0v8xIQFcnHWmglqxZoqxvwVUvETBy5W5M5l
	QXqeES5FkWK8f3o+9G5TVey6l4e9beSmppWHYKgNlImfiquxX022CWrA85YAOtze
	4dasdF9r4=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZp0pKhUVXzcaKAA--.5553S6;
	Wed, 25 May 2016 18:58:52 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 18:58:14 +0800
Message-Id: <1464173896-4088-5-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZp0pKhUVXzcaKAA--.5553S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFykGF1fGr4kur4UCFW3ZFb_yoW8tw15p3
	W7GF47GrWa9asxXFW5GF409w18W3Wxury7Krn7Awn5uw1rWFy0qF9rKa1YkFWUGFWvya43
	u3Z3WF13AFWxGaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jc4SrUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiqAx0xlc64AUQzAAAsC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 4/6] hw/char: QOM'ify stm32f2xx_usart model
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
X-TUID: LJ01SZ+IqyKS

* drop qemu_char_get_next_serial and use chardev prop
* change affected board code to use the new way

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/stm32f205_soc.c    |  1 +
 hw/char/stm32f2xx_usart.c | 11 ++++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 9c1dafb..9d5bcd4 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -107,6 +107,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     /* Attach UART (uses USART registers) and USART controllers */
     for (i = 0; i < STM_NUM_USARTS; i++) {
         usartdev = DEVICE(&(s->usart[i]));
+        qdev_prop_set_chr(usartdev, "chardev", serial_hds[i]);
         object_property_set_bool(OBJECT(&s->usart[i]), true, "realized", &err);
         if (err != NULL) {
             error_propagate(errp, err);
diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 72305ec..9424abf 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -190,6 +190,11 @@ static const MemoryRegionOps stm32f2xx_usart_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static Property stm32f2xx_usart_properties[] = {
+    DEFINE_PROP_CHR("chardev", STM32F2XXUsartState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void stm32f2xx_usart_init(Object *obj)
 {
     STM32F2XXUsartState *s = STM32F2XX_USART(obj);
@@ -200,9 +205,6 @@ static void stm32f2xx_usart_init(Object *obj)
                           TYPE_STM32F2XX_USART, 0x2000);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
-    /* FIXME use a qdev chardev prop instead of qemu_char_get_next_serial() */
-    s->chr = qemu_char_get_next_serial();
-
     if (s->chr) {
         qemu_chr_add_handlers(s->chr, stm32f2xx_usart_can_receive,
                               stm32f2xx_usart_receive, NULL, s);
@@ -214,8 +216,7 @@ static void stm32f2xx_usart_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->reset = stm32f2xx_usart_reset;
-    /* Reason: instance_init() method uses qemu_char_get_next_serial() */
-    dc->cannot_instantiate_with_device_add_yet = true;
+    dc->props = stm32f2xx_usart_properties;
 }
 
 static const TypeInfo stm32f2xx_usart_info = {
-- 
2.1.4


