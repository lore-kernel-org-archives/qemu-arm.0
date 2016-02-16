Received: by 10.25.208.211 with SMTP id h202csp1240430lfg;
        Tue, 16 Feb 2016 03:14:34 -0800 (PST)
X-Received: by 10.55.31.20 with SMTP id f20mr13318479qkf.42.1455621274010;
        Tue, 16 Feb 2016 03:14:34 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s131si39979471qhs.77.2016.02.16.03.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdaT-0002vN-Eo
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:14:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXv-0006uo-2Y
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXt-0006q0-V4
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:54 -0500
Received: from m12-13.163.com ([220.181.12.13]:48567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXt-0006oF-5k; Tue, 16 Feb 2016 06:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=HHFnFFU0ptouABYOjP
	yJeiYesKYAPksHcWnK4AC5oeo=; b=Ju8B4EIM5RN3A9ue2wtt+Fekz+CC0mLVoP
	XlnV7g1/2Fm+1u3koYmcf6FG9t+VmV6PbxVJ1dm0HKpXrYxDx7Xdpafw1vGLM/lM
	NzFPSKhyDp7hSDewyGkCwYluVqCqW+/LU4lWSa2Ka7YVQhE4iXR5QirOf3s7jGVr
	OSRkwJPMc=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowACHx6HMA8NWPNreBQ--.31323S7;
	Tue, 16 Feb 2016 19:11:16 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:09:37 +0800
Message-Id: <1455620981-13868-6-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
References: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DcCowACHx6HMA8NWPNreBQ--.31323S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw45tFyfJF1xZFy7XF4Utwb_yoW8Cry7pF
	ZruF17Jw43J3ykAa1IyFn29F1DCFnYkrsagrZ3Cryvkr9rKFy2qa4kJFW8Ja4UJa95AF1r
	AF1xtFy3Aw1UG3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U02NtUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0hURxlUL9fb6RgAAsx
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 05/16] hw/timer: QOM'ify exynos4210_pwm
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
X-TUID: T4mhHpw1JPEz

assign exynos4210_pwm_init to exynos4210_pwm_info.instance_init
and drop the SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/exynos4210_pwm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 38f941f..0e9e2e9 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -380,9 +380,10 @@ static const MemoryRegionOps exynos4210_pwm_ops = {
 /*
  * PWM timer initialization
  */
-static int exynos4210_pwm_init(SysBusDevice *dev)
+static void exynos4210_pwm_init(Object *obj)
 {
-    Exynos4210PWMState *s = EXYNOS4210_PWM(dev);
+    Exynos4210PWMState *s = EXYNOS4210_PWM(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     int i;
     QEMUBH *bh;
 
@@ -394,19 +395,15 @@ static int exynos4210_pwm_init(SysBusDevice *dev)
         s->timer[i].parent = s;
     }
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &exynos4210_pwm_ops, s,
+    memory_region_init_io(&s->iomem, obj, &exynos4210_pwm_ops, s,
                           "exynos4210-pwm", EXYNOS4210_PWM_REG_MEM_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
 }
 
 static void exynos4210_pwm_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = exynos4210_pwm_init;
     dc->reset = exynos4210_pwm_reset;
     dc->vmsd = &vmstate_exynos4210_pwm_state;
 }
@@ -415,6 +412,7 @@ static const TypeInfo exynos4210_pwm_info = {
     .name          = TYPE_EXYNOS4210_PWM,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210PWMState),
+    .instance_init = exynos4210_pwm_init,
     .class_init    = exynos4210_pwm_class_init,
 };
 
-- 
2.1.4


