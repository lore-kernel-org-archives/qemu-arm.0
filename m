Received: by 10.25.208.211 with SMTP id h202csp1077645lfg;
        Mon, 22 Feb 2016 01:14:10 -0800 (PST)
X-Received: by 10.140.174.2 with SMTP id u2mr34354801qhu.85.1456132450299;
        Mon, 22 Feb 2016 01:14:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 188si28674239qhj.38.2016.02.22.01.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 01:14:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:47907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXmZF-0007Mc-KE
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 04:14:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXmZD-0007KQ-C2
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 04:14:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXmZC-0005Sn-Ev
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 04:14:07 -0500
Received: from m12-11.163.com ([220.181.12.11]:36601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXmZ7-0005RZ-If; Mon, 22 Feb 2016 04:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=qa+T9PcvPWR9Yw3Cj1
	r1r3wWv2HNUaeoHoG5tL+uJfA=; b=M1lIT9XhQ+qjnvtA5GbjBeFrCDAKZSCfEV
	1I6/IsutmWt/ViUFcCvwinimm46nvJQPC5cLIuTSC8m17qVOUoEX2GqQi4l2/oq8
	QhYxhn/zsStMxITWxvmV5EPdBYeIo6fqzKrydch2DznHoRQ3GJdMWhWU/Jdouwx9
	mMiLbkuWE=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp7 (Coremail) with SMTP id C8CowADnJh8X0cpW9b++Bw--.36068S2;
	Mon, 22 Feb 2016 17:13:16 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 17:11:50 +0800
Message-Id: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: C8CowADnJh8X0cpW9b++Bw--.36068S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4rtr1DAF4UJF1rZF4UCFg_yoW8GF4UpF
	Z3WF4kurZrXF4qqwsxGFyqq398X3WDJr47AanrGw4xC3WUJrn5XFn0v34avr4DGFZIvrWr
	ZayIywn8Ww4fCr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jo_M-UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOw0XxlXlR8FzqwAAsJ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.11
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-arm] [PATCH v4 5/9] hw/timer: QOM'ify m48txx_sysbus (pass 2)
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
X-TUID: /F2IaamRk2tv

assign DeviceClass::vmsd instead of using vmstate_register function

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/m48t59.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
index 3c683aa..b0cf79d 100644
--- a/hw/timer/m48t59.c
+++ b/hw/timer/m48t59.c
@@ -742,8 +742,6 @@ static void m48t59_realize_common(M48t59State *s, Error **errp)
         s->wd_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &watchdog_cb, s);
     }
     qemu_get_timedate(&s->alarm, 0);
-
-    vmstate_register(NULL, -1, &vmstate_m48t59, s);
 }
 
 static void m48t59_isa_realize(DeviceState *dev, Error **errp)
@@ -822,6 +820,7 @@ static void m48txx_isa_class_init(ObjectClass *klass, void *data)
     dc->realize = m48t59_isa_realize;
     dc->reset = m48t59_reset_isa;
     dc->props = m48t59_isa_properties;
+    dc->vmsd = &vmstate_m48t59;
     nc->read = m48txx_isa_read;
     nc->write = m48txx_isa_write;
     nc->toggle_lock = m48txx_isa_toggle_lock;
@@ -866,6 +865,7 @@ static void m48txx_sysbus_class_init(ObjectClass *klass, void *data)
     dc->realize = m48t59_realize;
     dc->reset = m48t59_reset_sysbus;
     dc->props = m48t59_sysbus_properties;
+    dc->vmsd = &vmstate_m48t59;
     nc->read = m48txx_sysbus_read;
     nc->write = m48txx_sysbus_write;
     nc->toggle_lock = m48txx_sysbus_toggle_lock;
-- 
2.1.4


