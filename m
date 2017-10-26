Received: by 10.223.161.27 with SMTP id o27csp786513wro;
        Thu, 26 Oct 2017 07:44:01 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RIukWNiBWZKmDG+PtiKJxqfcMBXwOCWCY1djaexmauSh8o/QlAtbBgY60iPpAZPXA/zE7V
X-Received: by 10.37.108.6 with SMTP id h6mr3606293ybc.133.1509029041649;
        Thu, 26 Oct 2017 07:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509029041; cv=none;
        d=google.com; s=arc-20160816;
        b=U5Qez+dAsAMg9732jBjCQQUSLd+bd1Go0oEqlj95tsmn9aiPK77ZHvZ58/7zEVN3yy
         PrLvSUFcHPdpROsbUQxIKs7m7jl1c1Q9AcGnN+5eymjez5/k9lYQDYDXkvOYh21ztoxI
         KauFYU+9+Odi8qqHdWnJtseC5S0Vq+MCN1ZWPOHX+YomZTDete0HXxOBaV24+meohGam
         Dpq7vIcQnr7yWYovq4NdDVN22cy43D3JioAI/9GSy/3V9Y5opBCCxxau5Pm4doh1eTA3
         Mthmatgv0klIouT9n+z4ClRvCtj3I2/FfsAodOAN9hJO0k6af0qffGiN6XLNO0qLMbXD
         lRwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rDz89zOwRmjxf+oNbPPbLgDHu+OxWTE245l01eTy6zY=;
        b=hVPp0XXCY7A9EONApbtpiFn0eLudBywKLyA3bAXWC611FIeV8JXu3WIVf5MTipj089
         VWPQfuSUsYkqSYF0UxQKMZ48P5yE0kIbTdPNP8k2vR8TJFdnIbwltWkTziZsKrmRC4nh
         DGimNZJuD5BB/mu04SVsabG8WU72YvXbnB7rd1PCoPm38MBX3A4pl3wCvlqnvaTZrjjp
         dnrEDOCOEZH1lChSr5gx8D5ALV59POeAqtcqVCDdkQyJnCe5h2GUKeM3v6zAYLS4DY6c
         LN0t9EwHshMhYFPySprNoBCfu9uDpgvQptT/y9+IprZCDfvELqDsQVzRDYe6R43QAF2Y
         o2aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kGNorcvl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2si502238ywl.229.2017.10.26.07.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 07:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kGNorcvl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7jO5-0002va-2z
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 10:44:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e7jIv-0007G2-Bl
	for qemu-devel@nongnu.org; Thu, 26 Oct 2017 10:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e7jIs-0007eL-Uy
	for qemu-devel@nongnu.org; Thu, 26 Oct 2017 10:38:41 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:50374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gabriel291075@gmail.com>)
	id 1e7jIs-0007dW-QE; Thu, 26 Oct 2017 10:38:38 -0400
Received: by mail-qk0-x243.google.com with SMTP id o187so4526638qke.7;
	Thu, 26 Oct 2017 07:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rDz89zOwRmjxf+oNbPPbLgDHu+OxWTE245l01eTy6zY=;
	b=kGNorcvlYcdntCgQ8vizHtBx+blHX9SZ0b2zK9PcknKtssvJqHOAttLPIoFgwbGI0g
	lMs88/peJ8eBwFIaQyZZpZIDdK6+lkX3VSjmardp/RnZy7Qe8p30Fy+578MLZBCQ2q1d
	VFCjvMY4MOkk66tdQqii8vvE7eIPZ/NoM2V6NJfimTcg1BIia7K3aPwynborRoMzlaoP
	pvue6yN9AreuEU7asscNLBhajRgddMRvU+BFr8upLWW1+iJPqL2+fyE6BTP4bE/MEwfe
	3kHTfYIltSgSFdym8/UY+9joxd3Y3QylFZDRyRl2VxDVF9QiF9HMNlYpj9gEOhMQ7GE+
	JepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rDz89zOwRmjxf+oNbPPbLgDHu+OxWTE245l01eTy6zY=;
	b=Z1PRwzeXofTUwqvlAFxGBrZB3T0Z9GpFhD3m6P3P1mP1HNBvj4XwGnB31pJB7635mG
	+Vy//67SUzfe7wHSrqcM61vjNQhF2p+6mBBn7liXzSZlxlboESt/bM/z8/eOj6BymYI+
	ukRGx694ZQ6qDaG5q7x/QmbPcOKCheNZ3p9dv5RzBy7rRav4cJlt9wO4njR7KN2Tpdoe
	dl7ygpPV2GkoPNKXqUIp/mWpb9aKoQwBNob7fNv52f6bLZO4+GnP30sw/QL53hhk8+Ip
	6LZcbo9dy7BgGgX4peUPOOnJvdBTbG/gcAKpvJokidaMtdckOrARHmdSCRBZlqD0ic3V
	2Lzw==
X-Gm-Message-State: AMCzsaVwF8DtulwkzcQBbkXP2i+aNqpbRBIgjO4l8K0fgsmElLpL6Tkx
	6NgF2yMkgKnsbcVM1FZCYWtdsud3
X-Received: by 10.55.195.145 with SMTP id r17mr7824468qkl.120.1509028717961;
	Thu, 26 Oct 2017 07:38:37 -0700 (PDT)
Received: from localhost.localdomain ([208.94.106.99])
	by smtp.googlemail.com with ESMTPSA id
	l126sm3352746qkf.96.2017.10.26.07.38.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Oct 2017 07:38:37 -0700 (PDT)
From: Gabriel Costa <gabriel291075@gmail.com>
X-Google-Original-From: Gabriel Costa <costa@advantech.ca>
To: qemu-devel@nongnu.org
Date: Thu, 26 Oct 2017 06:34:08 -0400
Message-Id: <1509014053-28134-2-git-send-email-costa@advantech.ca>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1509014053-28134-1-git-send-email-costa@advantech.ca>
References: <1509014053-28134-1-git-send-email-costa@advantech.ca>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v5 1/5]arm: kinetis_k64_mcg
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, f4bug@amsat.org,
	Gabriel Augusto Costa <gabriel291075@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uLOhKoA69Jk7

From: Gabriel Augusto Costa <gabriel291075@gmail.com>

This Patch include kinetis_k64_mcg.c and .h
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
index 0000000..654f96b
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
+                "kinetis_k64_mcg: write at bad offset 0x%x\n", (int)offset);
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
+                "kinetis_k64_mcg: read at bad offset 0x%x\n", (int)offset);
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

