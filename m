Received: by 10.25.208.211 with SMTP id h202csp1239609lfg;
        Tue, 16 Feb 2016 03:12:43 -0800 (PST)
X-Received: by 10.55.74.14 with SMTP id x14mr26657664qka.70.1455621163059;
        Tue, 16 Feb 2016 03:12:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si39970875qhp.41.2016.02.16.03.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdYg-0007wr-Fx
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:12:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXq-0006o6-Sr
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXn-0006lq-2d
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:50 -0500
Received: from m12-13.163.com ([220.181.12.13]:48219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXm-0006k9-Ac; Tue, 16 Feb 2016 06:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=L5U1HRXCghktxGxcs3
	0ch/c24PM/AmMDhEd13jutnvM=; b=JqFm8qcrU3s6Wn9x+9PBJX697NRnXb2OM6
	g1u2Q4UbL3zT57BmxtAaFJfw1y8tRkxmEqwaWnQiqItlKRAZGjc1kFYJlq9gWqSG
	9ignOW2nWQsmeW0ChkrtlOa/lkltzgREKfrxR6BAKIRVbD+G8y8rSNYd+eAH8PNt
	PgsILOEM0=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowACHx6HMA8NWPNreBQ--.31323S4;
	Tue, 16 Feb 2016 19:11:16 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:09:34 +0800
Message-Id: <1455620981-13868-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
References: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DcCowACHx6HMA8NWPNreBQ--.31323S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWDuw4fKFykKw48GrW5GFg_yoWDXFc_Wa
	y8uF17Wr4kJrnxWay5Aa1Yyw12yr1jqr48A3WUGFWfuF18AF98Zwn7WFs29Fy8urZrZFy2
	qrW8Jry3C3WfGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjDPE3UUUUU==
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEBQRxlUL6veMCAAAsU
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 02/16] hw/timer: QOM'ify arm_timer (pass 2)
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
X-TUID: srOQnlvFheDO

assign DeviceClass::vmsd instead of using vmstate_register function

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/arm_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 5bd2d75..f1ede5f 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -296,7 +296,6 @@ static void sp804_realize(DeviceState *dev, Error **errp)
     s->timer[1] = arm_timer_init(s->freq1);
     s->timer[0]->irq = qemu_allocate_irq(sp804_set_irq, s, 0);
     s->timer[1]->irq = qemu_allocate_irq(sp804_set_irq, s, 1);
-    vmstate_register(dev, -1, &vmstate_sp804, s);
 }
 
 /* Integrator/CP timer module.  */
@@ -390,6 +389,7 @@ static void sp804_class_init(ObjectClass *klass, void *data)
 
     k->realize = sp804_realize;
     k->props = sp804_properties;
+    k->vmsd = &vmstate_sp804;
 }
 
 static const TypeInfo sp804_info = {
-- 
2.1.4


