Received: by 10.25.208.211 with SMTP id h202csp1237247lfg;
        Sun, 6 Mar 2016 23:10:15 -0800 (PST)
X-Received: by 10.140.169.9 with SMTP id p9mr27899859qhp.50.1457334615858;
        Sun, 06 Mar 2016 23:10:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e32si15678437qgf.67.2016.03.06.23.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:10:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:54022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpJ1-0007My-9M
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:10:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGc-00033e-TF
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGa-0004Fo-Kj
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:46 -0500
Received: from m12-15.163.com ([220.181.12.15]:47931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1acpGa-0004Ae-0Q; Mon, 07 Mar 2016 02:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=x9AKNWBkDEMC+JVpMk
	s1FnzHeqYvd6IOkfNv8rwnoyg=; b=W/bk7f+4O0lj+1K0e5i9WcrAznEoWxPgQt
	XnZJCWbY1xpzFS+BTt61QvhkZrczhXRXUoRdUPcUTibWCIlpKxZlngYK9OeMt+tp
	EDz2n9u0mo8/wUD9yuykyvTzQLyU8CWu0fdMM7p9RbmbI0clvTuU2S6wcICROFfb
	XnScm4j8A=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowED5XEaRKN1WjMdtAA--.46751S7;
	Mon, 07 Mar 2016 15:07:07 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 15:05:46 +0800
Message-Id: <1457334350-5675-6-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: D8CowED5XEaRKN1WjMdtAA--.46751S7
X-Coremail-Antispam: 1Uf129KBjvdXoWruw4rGr15JFW5Jr4UZw4UCFg_yoW3urgEv3
	Wayan7Xw1xCw1jk3W5Ja1Yvr15ta17Xa1kXa15Ga1IvF4xArs8Jw17ur9rZ34fuayIkry7
	ta9rXF9rZ3ySgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU04SoPUUUUU==
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEBwlxlUL7Fyv+gAAsU
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: robh@kernel.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH 5/9] hw/arm: QOM'ify pxa2xx_pic.c
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
X-TUID: x1hos+yHpUc5

Remove the empty 'pxa2xx_pic_initfn' and it's
setup code in the 'pxa2xx_pic_class_init'

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/pxa2xx_pic.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 8a39b1c..9e08c55 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -308,17 +308,10 @@ static VMStateDescription vmstate_pxa2xx_pic_regs = {
     },
 };
 
-static int pxa2xx_pic_initfn(SysBusDevice *dev)
-{
-    return 0;
-}
-
 static void pxa2xx_pic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = pxa2xx_pic_initfn;
     dc->desc = "PXA2xx PIC";
     dc->vmsd = &vmstate_pxa2xx_pic_regs;
 }
-- 
2.1.4


