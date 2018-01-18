Received: by 10.28.173.206 with SMTP id w197csp6876301wme;
        Thu, 18 Jan 2018 10:50:15 -0800 (PST)
X-Google-Smtp-Source: ACJfBosU0cQuhP9j8wIobkBri8goqRdNazLZ12KY3kpaEjLawqxF8cr+R4am0gCPODuxwFchJM8e
X-Received: by 10.129.138.197 with SMTP id a188mr6690484ywg.88.1516301415054;
        Thu, 18 Jan 2018 10:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516301415; cv=none;
        d=google.com; s=arc-20160816;
        b=cUfOXIvgFAAKvFi2I4Gp1mg6R3rh9scuEGG3Rs3wP+ce9h/ktM2JleOIAfymyCK4m0
         kdXz+cwCxfKF9ozXjt7ACPbX+r3lRarffOCX8YYlTXEQmj6hyeC9ltTFHtfydnCPfTeT
         A8e25fZEglr71WwBbuXw3GSiuSi0LyCCfrR3JoDCnNNIHTrF/yWpWOL9HrLhd9HZLDav
         tFWw1VqS5tbUpdIQAUHA7D0XgvO0QOeRye10deO9jyH2m6XyArcvrBpoWuVvq/sj4uuX
         PsFeriSaV03t0VwdavgWhCLRRnZRHVW5SpFtCs7mDamLHqL/VVJ8LoPG00t5nxrjoo4P
         DlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=706p23CmGXJmutKggO3aTbK3IIdxugDxcZunYN4pOjg=;
        b=F1lChACac6FA9d9CnFbL2JJVsA/FC3W/RfE+XK9BE3eu2mKwea8xJhj/MLBRRqmllO
         LgvKTBGGv2sZQf4+joIVxVSeQ/3R1Q9WLsAdgNhY6owabdOYjvSZO/psk+Rn0haVVNKN
         Pbvut2NAnLvoj7ZUfvnKyuXYu1HLivh/CB+aQVJsucC1n2Gkef1+MVBg4VbEh9bpJYFE
         3qSWrxNwP7aOJKbVXQlgd6Tx87QdA4n4E+ItjLkEl7A6EwPv45BewFYWU4rZkeaKrq+U
         6Y8qygnfZ0/fX9JS/ZKZemK8+ybYUQUJirzX2ibxSwAzWa/HJOGlHwthHw3gm+eeXy67
         A+9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XpMFQtzx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r6si241116ybg.709.2018.01.18.10.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XpMFQtzx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecFGQ-0005Fb-CD
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:50:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF94-0007lK-Kz
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:42:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF93-0003BI-AQ
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:42:38 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:35166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecF93-0003Ax-4L; Thu, 18 Jan 2018 13:42:37 -0500
Received: by mail-pg0-x243.google.com with SMTP id d6so15007839pgv.2;
	Thu, 18 Jan 2018 10:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=706p23CmGXJmutKggO3aTbK3IIdxugDxcZunYN4pOjg=;
	b=XpMFQtzxOW8J1XoH42qVIcYws1EIf0AhyDuzz4DGZV5SzIgSQh8wnUOXda9W/dK9b5
	EsY+yH7IhFoWdLYroK79gRvIwODzyuGpvWJTSFXGTqkequNfC1wMd1QNecNMCo/G4GFT
	lO1R1UJMffIoZN3vwQudg26m/peDSJKzhJAZxxizhMd36iLP1Yl/SlhL1bd6FLVLKRW+
	AIR/pDqBCSjvIH5AdocGVnL43DUSUFAjApa96Lmp2U92u8+l2v4XwZcpsquTXnOF8wEK
	eu5zx3u/m5DSNHOLfWNiWN6AYkqx3ACRSgdtbfPXMNr2GfNkKFoaqTSNK37ew4DMyN0e
	pqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=706p23CmGXJmutKggO3aTbK3IIdxugDxcZunYN4pOjg=;
	b=n88Av1pw0KBZQBHr4cRfU9ucR+aHMy2jIlfOf11hsd6aQPR6WOLsFGDxY+4ajzDUZl
	GG5s5oWqkLjepI/EyJyKsyOAsf/Z4NzCVOOJAriHgZAWtPwQFv1tLJ21A9lycHHOOpYn
	2eUQ+Vr6PvHLsSOJ4vTVR7c+ZW1MKdixUdeKYMZTBpoWCprtZFgfrXZnEKwZfC7fShZK
	Gf/MpC3ROCJvzq/x0tNxs7NUrL+01d9ffCDyj7YEpn4q+XgoqcuXdN343QzTKIsxk9pw
	DjorvOIaR7wtrDuRekebwb8FRkK/PYGv1ZJQExux9vLoyNDDq2NKEPoO2wKbGqW3olkM
	B9dg==
X-Gm-Message-State: AKwxyteiRN4jRA/7s1tyCa/e2BHPtd92Wh/7fzW9Ze0VZJTfMgrI3em0
	e7O4tiBhLU8JYntXunEbe1rNCHJJ1Jc=
X-Received: by 2002:a17:902:8f8b:: with SMTP id
	z11-v6mr242270plo.43.1516300955901; 
	Thu, 18 Jan 2018 10:42:35 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	v9sm15790836pfj.88.2018.01.18.10.42.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 10:42:34 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Thu, 18 Jan 2018 10:38:10 -0800
Message-Id: <01de185b273b999f1a4df07cb0e4b2e8216689f0.1516300623.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516300623.git.alistair.francis@xilinx.com>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH v6 6/9] xlnx-zynqmp-pmu: Connect the PMU
 interrupt controller
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AYdfI1HcFAiY

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

 hw/microblaze/xlnx-zynqmp-pmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 145837b372..7312bfe23e 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,6 +24,8 @@
 #include "cpu.h"
 #include "boot.h"
 
+#include "hw/intc/xlnx-pmu-iomod-intc.h"
+
 /* Define the PMU device */
 
 #define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
@@ -34,14 +36,18 @@
 #define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
 #define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
 
+#define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;
 
     /*< public >*/
     MicroBlazeCPU cpu;
+    XlnxPMUIOIntc intc;
 }  XlnxZynqMPPMUSoCState;
 
+
 static void xlnx_zynqmp_pmu_soc_init(Object *obj)
 {
     XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(obj);
@@ -50,6 +56,9 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
                       TYPE_MICROBLAZE_CPU);
     object_property_add_child(obj, "pmu-cpu", OBJECT(&s->cpu),
                               &error_abort);
+
+    object_initialize(&s->intc, sizeof(s->intc), TYPE_XLNX_PMU_IO_INTC);
+    qdev_set_parent_bus(DEVICE(&s->intc), sysbus_get_default());
 }
 
 static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
@@ -80,6 +89,21 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
+
+    object_property_set_uint(OBJECT(&s->intc), 0x10, "intc-intr-size",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0x0, "intc-level-edge",
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->intc), 0xffff, "intc-positive",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->intc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->intc), 0, XLNX_ZYNQMP_PMU_INTC_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->intc), 0,
+                       qdev_get_gpio_in(DEVICE(&s->cpu), MB_CPU_IRQ));
 }
 
 static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
-- 
2.14.1

