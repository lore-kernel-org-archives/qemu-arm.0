Received: by 10.25.208.211 with SMTP id h202csp2729640lfg;
        Thu, 25 Feb 2016 02:32:43 -0800 (PST)
X-Received: by 10.140.97.227 with SMTP id m90mr55428871qge.60.1456396362681;
        Thu, 25 Feb 2016 02:32:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f185si7473318qkb.71.2016.02.25.02.32.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 02:32:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:41944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYtDu-0006EI-3V
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 05:32:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtDr-0006BW-EL
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:32:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtDq-0001Rj-Jp
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:32:39 -0500
Received: from m12-14.163.com ([220.181.12.14]:53007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aYtDj-0001Mm-Ts; Thu, 25 Feb 2016 05:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Y8KS/Vlpo+g0Cf+b9H
	+/P8ei6WJQwrol7mtt4X0ZWoM=; b=WX0pPoPe9dsF/EPKWl2koFeeLJyb5kfCqn
	6I58tT9+IIR18OUqStOjuNmf3gcycxg/J7aOdIjqHfIWQK2Zp2tmZ6NY+/sHemMy
	dddQl81r99yBXDJ00EV+zYTGYtFZ1kuXYWLpEphQtWcfDxeWT9ZP8hYjOdUpWPRZ
	4vbYVvSoQ=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp10 (Coremail) with SMTP id DsCowAB3JtoL2M5WrXOWCA--.37006S6;
	Thu, 25 Feb 2016 18:31:51 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Feb 2016 18:30:32 +0800
Message-Id: <1456396236-2759-5-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
References: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DsCowAB3JtoL2M5WrXOWCA--.37006S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4rtr4xGF1rAFyrWry8Zrb_yoW8uFykpF
	Z8XF1kWrW8WFsFqw4fGryDXay5Ww1kJr42ya9rGw4xC3WUJrn5tr1qy347Jr4kGr9FvrW3
	ZayIvr98Ww43Cr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOqXdUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0hgaxlUL9pVcogAAsV
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.14
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-arm] [PATCH v5 4/8] hw/timer: QOM'ify m48txx_sysbus (pass 2)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RDIe1E/IyAD8

assign DeviceClass::vmsd instead of using vmstate_register function

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/m48t59.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
index 3c683aa..f5897d8 100644
--- a/hw/timer/m48t59.c
+++ b/hw/timer/m48t59.c
@@ -637,6 +637,26 @@ static const VMStateDescription vmstate_m48t59 = {
     }
 };
 
+static const VMStateDescription vmstate_m48t59_isa = {
+    .name = "m48t59",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(state, M48txxISAState, 0, vmstate_m48t59, M48t59State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_m48t59_sys_bus = {
+    .name = "m48t59",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(state, M48txxSysBusState, 0, vmstate_m48t59, M48t59State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void m48t59_reset_common(M48t59State *NVRAM)
 {
     NVRAM->addr = 0;
@@ -742,8 +762,6 @@ static void m48t59_realize_common(M48t59State *s, Error **errp)
         s->wd_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &watchdog_cb, s);
     }
     qemu_get_timedate(&s->alarm, 0);
-
-    vmstate_register(NULL, -1, &vmstate_m48t59, s);
 }
 
 static void m48t59_isa_realize(DeviceState *dev, Error **errp)
@@ -822,6 +840,7 @@ static void m48txx_isa_class_init(ObjectClass *klass, void *data)
     dc->realize = m48t59_isa_realize;
     dc->reset = m48t59_reset_isa;
     dc->props = m48t59_isa_properties;
+    dc->vmsd = &vmstate_m48t59_isa;
     nc->read = m48txx_isa_read;
     nc->write = m48txx_isa_write;
     nc->toggle_lock = m48txx_isa_toggle_lock;
@@ -866,6 +885,7 @@ static void m48txx_sysbus_class_init(ObjectClass *klass, void *data)
     dc->realize = m48t59_realize;
     dc->reset = m48t59_reset_sysbus;
     dc->props = m48t59_sysbus_properties;
+    dc->vmsd = &vmstate_m48t59_sys_bus;
     nc->read = m48txx_sysbus_read;
     nc->write = m48txx_sysbus_write;
     nc->toggle_lock = m48txx_sysbus_toggle_lock;
-- 
2.1.4


