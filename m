Received: by 10.25.208.211 with SMTP id h202csp1242640lfg;
        Tue, 16 Feb 2016 03:19:08 -0800 (PST)
X-Received: by 10.140.240.87 with SMTP id l84mr28165961qhc.69.1455621548186;
        Tue, 16 Feb 2016 03:19:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19si40126935qgf.103.2016.02.16.03.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:19:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdet-0002AI-I2
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:19:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdY1-00076S-49
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXy-0006rm-Iq
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:01 -0500
Received: from m12-12.163.com ([220.181.12.12]:36130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXy-0006rD-89; Tue, 16 Feb 2016 06:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Jqvc8SIPdmyh6+Etrt
	zr/TYQp92Pzg0rW+dsUadcEAM=; b=JJi8XQ6a2lTFgX7xs/ZOYvnnP70fIIyzzP
	Ixharz/HqhtPPZXKlb4QEJ3z30opqBmL1dt060V/IXxl+NlBu73mBefRFMgg18OG
	eeRq0GWx9LophdAH+r+tLHB1C4dU1IW4JVqQO1kXiFoq79LgWe8Z/dDHMVlQkC3v
	E18T4cAQM=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXn_PgA8NWODCxBQ--.25459S2;
	Tue, 16 Feb 2016 19:11:33 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:10:21 +0800
Message-Id: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: DMCowABXn_PgA8NWODCxBQ--.25459S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4DCr1xWry3Zr4fuF1xKrg_yoW8Xr1UpF
	Z3WF4kurZrXF4qqwsxGFyvq3yDX3WDJr47JanrGw4xC3WUJrn5JFn0q34avr4DGFZIvrWr
	ZayIk3s8Ww43Cr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRJ8n5UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0gYRxlUL9fb7KwAAsO
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 10/16] hw/timer: QOM'ify m48txx_sysbus (pass
	2)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bNXecZRmgeBS

assign DeviceClass::vmsd instead of using vmstate_register function

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


