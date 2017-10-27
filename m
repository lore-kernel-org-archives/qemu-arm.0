Received: by 10.223.161.27 with SMTP id o27csp914061wro;
        Fri, 27 Oct 2017 09:30:02 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Seko5+7mT8DSWI6UjDNH255FpRnuz82uBPtHkFp8vbFdy6TR5p3mGCYOBnkld+4efkJlcR
X-Received: by 10.37.118.193 with SMTP id r184mr752540ybc.422.1509121802398;
        Fri, 27 Oct 2017 09:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509121802; cv=none;
        d=google.com; s=arc-20160816;
        b=GzyyycPBBzHExnCs9LU/pFL5t5SmNRMeT+UvGYPUozgJ9r9ufARGrUh6thOGMmeSSA
         OgjbFeEc2ePckDL0BfIfMEoAdGmgpm8YKEKJCqbNL54DDk7h2i/nILK/iCGf+eoeuA/P
         TG2VHMoN9MqQDIjOFsxbuZf1qmmtQuxm2IVAhe/j0IMYPgeDX5CYdXD6LcZGyDMq4mb0
         mKRRODZfluT39X5nRRjeD71mbkUqnyRksJZhy6UnZ7QqWvFsYxCn92PiUu98rIEwhPGh
         zfD6mceDp4phsMeYAQKDmXP3x/usKo7XdqfvAHdJBkoPFd1/kmwuDN7Kae57NShQi9FQ
         6ZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=lq+biR8V+T1Ga/peiP+z9hClB9uybuPk5QiInFAIq5Q=;
        b=yJpq3XGKhb7sO86cgqUF3syUhYd1AUl3MrbHC5CFY7OkoXAaWRinbPdj8+gjZH9jBu
         0wwfUHVEhQHYE8Xegq5l8PbOCVBNPMeaQ7OjDITNg0lNyzd6oWIPtZ4lRvsbVm91pWa3
         DPFzNlcSa0tncH5sbfOP8TscvTO8TAePQPrqVN1z0S0jCsS+o6Wz68y5BlIVxZ7egNcr
         eEfCEe39J8MXYRDw3ID/W2L5wZc8RVJYRulNAdIIpWJ0trNVrl6HhaA6ihGNKuFyyWGC
         lJeoGg/9SEFRvNnnl0FdMjcNA3rGRVRfij0cHG+AdmIg+28L7EpZzVtPFSo0PrXwtp8P
         mVcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bHak/dG6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y7si1271092ywe.261.2017.10.27.09.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Oct 2017 09:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bHak/dG6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e87WD-0007oE-Q8
	for alex.bennee@linaro.org; Fri, 27 Oct 2017 12:30:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e87V3-0006sL-Cs
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 12:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e87V1-00037w-JM
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 12:28:49 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:53028)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gabriel291075@gmail.com>)
	id 1e87Uy-00034t-2m; Fri, 27 Oct 2017 12:28:44 -0400
Received: by mail-qt0-x244.google.com with SMTP id 31so9096782qtz.9;
	Fri, 27 Oct 2017 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lq+biR8V+T1Ga/peiP+z9hClB9uybuPk5QiInFAIq5Q=;
	b=bHak/dG6LiFg3fO05CV2HxzZq5QDxD2dvVhV6zyutUnjTfCGQmZ1+lJD9dMGD3vA3q
	VsVmVci1r2lOlsfmB2TJZjWukcrfieiZqUnQzvagK26q7uM1cJPeZeWgMccch3eSxYR0
	1MfqE84BTC4cjHOVtTHMtDaNdg3Z6mIDUhESUlWQh3i+CvjvWelz9lFeSA/Hrg/zhHT4
	Bebr6Y0cyxE2ioUhA6ON7xUaRB1jVc3ExCOvu5JYG9doc3JILTAVI6KDTi5SjWR/M3zI
	DISy+emOaFgYn1SfEy8csYJgD3g9OwsH2mQC9VHsOB18E5DE76mn9ziC5ZQX7jgc/hBx
	u6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lq+biR8V+T1Ga/peiP+z9hClB9uybuPk5QiInFAIq5Q=;
	b=RFl/IZRvxC+4U6x5pr3LD4rQFiy1IznfVuTAe0GzmxYMkiDW71kQpwaJ1iTiU2VFhZ
	mUtJtxYPnnH1nHlCXocNFrWdU4ciYuxuY1jI9Mg5e+kNOQkis7eUnl7T1KNQM2gLVsdT
	8OePWuhC/DIFS1YOyMb1aFmhxyh/8uWeTD23TLhVoOIZ96FqDTY2gGXvrsrGWgPwk3Kb
	bpDpbdJf/PZRRiKVXcYzZTwTeGlNS8eWTwe8gRXlvZuYjKodiwRq4liAwpBo48a4tA1m
	VhXkLAL27/P38sq1lCEFMB0opiAlSOSqWZO32ybRHR72GW0HhyoBfETIxkAYY6AoV7oH
	fjIg==
X-Gm-Message-State: AMCzsaVKpeUyGVCgzkWR85lsyfEqTUODQq7QckdNiswol4JV/GgGXWjq
	wEp3JfQtg4bMf1tXVbFWmioltNHh
X-Received: by 10.200.51.39 with SMTP id t36mr1738146qta.337.1509121723348;
	Fri, 27 Oct 2017 09:28:43 -0700 (PDT)
Received: from localhost.localdomain ([208.94.106.99])
	by smtp.googlemail.com with ESMTPSA id
	t126sm5152568qke.36.2017.10.27.09.28.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Oct 2017 09:28:42 -0700 (PDT)
From: Gabriel Costa <gabriel291075@gmail.com>
X-Google-Original-From: Gabriel Costa <costa@advantech.ca>
To: qemu-devel@nongnu.org
Date: Fri, 27 Oct 2017 08:24:12 -0400
Message-Id: <1509107055-21978-3-git-send-email-costa@advantech.ca>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1509107055-21978-1-git-send-email-costa@advantech.ca>
References: <1509107055-21978-1-git-send-email-costa@advantech.ca>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 2/5] arm: kinetis_k64_mcg
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, f4bug@amsat.org,
	Gabriel Augusto Costa <gabriel291075@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GzW0tMq+y2rR

This Patch include kinetis_k64_mcg.c/.h
mcg means Multipurpose Clock Generator (MCG)
More information about this peripheral can be found at:
pag 579, K64P144M120SF5RM.pdf.

Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
---
 hw/misc/kinetis_k64_mcg.c         | 208 ++++++++++++++++++++++++++++++++++++++
 include/hw/misc/kinetis_k64_mcg.h |  43 ++++++++
 2 files changed, 251 insertions(+)
 create mode 100644 hw/misc/kinetis_k64_mcg.c
 create mode 100644 include/hw/misc/kinetis_k64_mcg.h

diff --git a/hw/misc/kinetis_k64_mcg.c b/hw/misc/kinetis_k64_mcg.c
new file mode 100644
index 0000000..37f4201
--- /dev/null
+++ b/hw/misc/kinetis_k64_mcg.c
@@ -0,0 +1,208 @@
+/*
+ * Kinetis K64 peripheral microcontroller emulation.
+ *
+ * Copyright (c) 2017 Advantech Wireless
+ * Written by Gabriel Costa <gabriel291075@gmail.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "qemu/log.h"
+#include "hw/misc/kinetis_k64_mcg.h"
+
+static const VMStateDescription vmstate_kinetis_k64_mcg = {
+    .name = TYPE_KINETIS_K64_MCG,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(C1, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(C2, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(C3, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(C4, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(C5, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(C6, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(S, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(SC, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(ATCVH, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(ATCVL, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(C7, kinetis_k64_mcg_state),
+        VMSTATE_UINT8(C8, kinetis_k64_mcg_state),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void kinetis_k64_mcg_reset(DeviceState *dev)
+{
+    kinetis_k64_mcg_state *s = KINETIS_K64_MCG(dev);
+
+    s->C1 = 0x04;
+    s->C2 = 0x80;
+    s->C3 = 0x00;
+    s->C4 = 0x00;
+    s->C5 = 0x00;
+    s->C6 = 0x00;
+    s->S = 0x10;
+    s->SC = 0x02;
+    s->ATCVH = 0x00;
+    s->ATCVL = 0x00;
+    s->C7 = 0x00;
+    s->C8 = 0x80;
+}
+
+static void kinetis_k64_mcg_write(void *opaque, hwaddr offset, uint64_t value,
+        unsigned size)
+{
+    kinetis_k64_mcg_state *s = (kinetis_k64_mcg_state *)opaque;
+
+    value &= 0xFF;
+
+    switch (offset) {
+    case 0x00:
+        if (value & 1 << 2) { /*IREFS*/
+            s->S = 0;
+            s->S |= 1 << 3; /*10 Enconding 2 - External ref clk is selected*/
+        }
+        if ((s->C1 & 0x80) && (value >> 6 == 0)) {
+            s->S |= 1 << 2; /*11 Enconding 3 - Output of the PLL is selected*/
+        }
+        s->C1 = value;
+        break;
+    case 0x01:
+        s->C2 = value;
+        break;
+    case 0x02:
+        s->C3 = value;
+        break;
+    case 0x03:
+        s->C4 = value;
+        break;
+    case 0x04:
+        s->C5 = value;
+        if (s->C5 & 1 << 6) { /*PLLCLKEN0*/
+            s->S |= 1 << 6;  /*LOCK0*/
+        }
+        break;
+    case 0x05:
+        s->C6 = value;
+        if (s->C6 & 1 << 6) { /*PLLS*/
+            s->S |= 1 << 5;  /*PLLST*/
+        }
+        break;
+    case 0x06:
+        s->S = value;
+        break;
+    case 0x08:
+        s->SC = value;
+        break;
+    case 0x0A:
+        s->ATCVH = value;
+        break;
+    case 0x0B:
+        s->ATCVL = value;
+        break;
+    case 0x0C:
+        s->C7 = value;
+        break;
+    case 0x0D:
+        s->C8 = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "kinetis_k64_mcg: write at bad offset %"HWADDR_PRIx"\n", offset);
+    }
+}
+
+static uint64_t kinetis_k64_mcg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    kinetis_k64_mcg_state *s = (kinetis_k64_mcg_state *)opaque;
+    uint8_t value;
+
+    switch (offset) {
+    case 0x00:
+        value = s->C1;
+        break;
+    case 0x01:
+        value = s->C2;
+        break;
+    case 0x02:
+        value = s->C3;
+        break;
+    case 0x03:
+        value = s->C4;
+        break;
+    case 0x04:
+        value = s->C5;
+        break;
+    case 0x05:
+        value = s->C6;
+        break;
+    case 0x06:
+        value = s->S;
+        break;
+    case 0x08:
+        value = s->SC;
+        break;
+    case 0x0A:
+        value = s->ATCVH;
+        break;
+    case 0x0B:
+        value = s->ATCVL;
+        break;
+    case 0x0C:
+        value = s->C7;
+        break;
+    case 0x0D:
+        value = s->C8;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "kinetis_k64_mcg: read at bad offset %"HWADDR_PRIx"\n", offset);
+        return 0;
+    }
+    return value;
+}
+
+static const MemoryRegionOps kinetis_k64_mcg_ops = {
+    .read = kinetis_k64_mcg_read,
+    .write = kinetis_k64_mcg_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void kinetis_k64_mcg_init(Object *obj)
+{
+    kinetis_k64_mcg_state *s = KINETIS_K64_MCG(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->iomem, obj, &kinetis_k64_mcg_ops, s,
+            TYPE_KINETIS_K64_MCG, 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void kinetis_k64_mcg_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_kinetis_k64_mcg;
+    dc->reset = kinetis_k64_mcg_reset;
+    dc->desc = "Kinetis K64 series MCG";
+}
+
+static const TypeInfo kinetis_k64_mcg_info = {
+    .name          = TYPE_KINETIS_K64_MCG,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(kinetis_k64_mcg_state),
+    .instance_init = kinetis_k64_mcg_init,
+    .class_init    = kinetis_k64_mcg_class_init,
+};
+
+static void kinetis_k64_mcg_register_types(void)
+{
+    type_register_static(&kinetis_k64_mcg_info);
+}
+
+type_init(kinetis_k64_mcg_register_types)
diff --git a/include/hw/misc/kinetis_k64_mcg.h b/include/hw/misc/kinetis_k64_mcg.h
new file mode 100644
index 0000000..3f105c5
--- /dev/null
+++ b/include/hw/misc/kinetis_k64_mcg.h
@@ -0,0 +1,43 @@
+/*
+ * Kinetis K64 peripheral microcontroller emulation.
+ *
+ * Copyright (c) 2017 Advantech Wireless
+ * Written by Gabriel Costa <gabriel291075@gmail.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+#ifndef KINETIS_MCG_H
+#define KINETIS_MCG_H
+
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+
+#define TYPE_KINETIS_K64_MCG "kinetis_k64_mcg"
+#define KINETIS_K64_MCG(obj) \
+    OBJECT_CHECK(kinetis_k64_mcg_state, (obj), TYPE_KINETIS_K64_MCG)
+
+typedef struct {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
+    uint8_t C1;
+    uint8_t C2;
+    uint8_t C3;
+    uint8_t C4;
+    uint8_t C5;
+    uint8_t C6;
+    uint8_t S;
+    uint8_t SC;
+    uint8_t ATCVH;
+    uint8_t ATCVL;
+    uint8_t C7;
+    uint8_t C8;
+
+    qemu_irq irq;
+} kinetis_k64_mcg_state;
+
+#endif
-- 
2.1.4

