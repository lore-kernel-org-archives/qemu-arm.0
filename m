Received: by 10.25.27.66 with SMTP id b63csp616590lfb;
        Sat, 4 Jun 2016 01:17:01 -0700 (PDT)
X-Received: by 10.237.58.137 with SMTP id o9mr7133262qte.83.1465028220967;
        Sat, 04 Jun 2016 01:17:00 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3si5905824qhd.80.2016.06.04.01.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Jun 2016 01:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b96lQ-0002EM-9c
	for alex.bennee@linaro.org; Sat, 04 Jun 2016 04:17:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b96jo-00017x-2o
	for qemu-devel@nongnu.org; Sat, 04 Jun 2016 04:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b96jf-00024w-I6
	for qemu-devel@nongnu.org; Sat, 04 Jun 2016 04:15:18 -0400
Received: from m12-18.163.com ([220.181.12.18]:58672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b96jd-0001x0-NL; Sat, 04 Jun 2016 04:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=CGdndbKk57lFEqT807
	/2s9gugt5rPhHzx5E1DtT7cbI=; b=HAD3bqeC3x8exYeygUzEtSBQpIZZaMQSI5
	xbFhKrg7APAdLMtSxOyFkx/duBZW/uq9721wzeFn/qolg6qra+owHjL9ayvMIgDd
	2vyuIXMMV5UVjT8IqA7QIfrz4glxdo+TBapbex0UZM1qLYNO7R+uTcWsBi6e3+q6
	ov/ZFgFMo=
Received: from debian.lan (unknown [114.111.167.200])
	by smtp14 (Coremail) with SMTP id EsCowECpfUbfjVJXKXU9AA--.28040S6;
	Sat, 04 Jun 2016 16:14:36 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sat,  4 Jun 2016 16:14:23 +0800
Message-Id: <1465028065-5855-5-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
References: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECpfUbfjVJXKXU9AA--.28040S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxur4kXFWktw1rtFWUWrWDCFg_yoW5Jw1xpa
	47WF43GrWaq3ZxXFW3Gr409w18WFn7ury7Grs7Awn5Cw18WFyrtF9rKa1YkFyUGFyvy3W3
	CF93XF13AFW7GaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bOUDXUUUUU=
X-Originating-IP: [114.111.167.200]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTAt+xlSIPd4vCwABsl
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH v2 4/6] hw/char: QOM'ify stm32f2xx_usart model
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
Cc: robh@kernel.org, peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	armbru@redhat.com, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, antonynpavlov@gmail.com,
	pbonzini@redhat.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hn87gG5rA9uR

* drop qemu_char_get_next_serial and use chardev prop
* change affected board code to use the new way

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/stm32f205_soc.c    |  1 +
 hw/char/stm32f2xx_usart.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 9c1dafb..de26b8c 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -107,6 +107,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     /* Attach UART (uses USART registers) and USART controllers */
     for (i = 0; i < STM_NUM_USARTS; i++) {
         usartdev = DEVICE(&(s->usart[i]));
+        qdev_prop_set_chr(usartdev, "chardev", i < MAX_SERIAL_PORTS ? serial_hds[i] : NULL);
         object_property_set_bool(OBJECT(&s->usart[i]), true, "realized", &err);
         if (err != NULL) {
             error_propagate(errp, err);
diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 72305ec..15657ab 100644
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
@@ -199,9 +204,11 @@ static void stm32f2xx_usart_init(Object *obj)
     memory_region_init_io(&s->mmio, obj, &stm32f2xx_usart_ops, s,
                           TYPE_STM32F2XX_USART, 0x2000);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
 
-    /* FIXME use a qdev chardev prop instead of qemu_char_get_next_serial() */
-    s->chr = qemu_char_get_next_serial();
+static void stm32f2xx_usart_realize(DeviceState *dev, Error **errp)
+{
+    STM32F2XXUsartState *s = STM32F2XX_USART(dev);
 
     if (s->chr) {
         qemu_chr_add_handlers(s->chr, stm32f2xx_usart_can_receive,
@@ -214,8 +221,8 @@ static void stm32f2xx_usart_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->reset = stm32f2xx_usart_reset;
-    /* Reason: instance_init() method uses qemu_char_get_next_serial() */
-    dc->cannot_instantiate_with_device_add_yet = true;
+    dc->props = stm32f2xx_usart_properties;
+    dc->realize = stm32f2xx_usart_realize;
 }
 
 static const TypeInfo stm32f2xx_usart_info = {
-- 
2.8.1


