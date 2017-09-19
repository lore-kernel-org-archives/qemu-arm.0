Received: by 10.223.172.38 with SMTP id v35csp4814329wrc;
        Tue, 19 Sep 2017 04:27:45 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAtrSNXV+6hyCwzVVw/b0o2yUDq6JG/cECBdgpMkxqg6p0fkycHfilaLH4C4iAEjbw9/YYp
X-Received: by 10.55.49.9 with SMTP id x9mr1378276qkx.89.1505820465805;
        Tue, 19 Sep 2017 04:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505820465; cv=none;
        d=google.com; s=arc-20160816;
        b=VYN5X5VsDObfXCP0YVSN7FVDLgoAL/MVNC9zIWcgCiTx9GuJb0wpJivaWXavyYYvC2
         oc1vxuJSywzBzVKYSQxNQmIZMn+ZtS4PBpvudk1URzPnDYDc5yABaES8riiYZm0w7WBP
         7WKF7LtRH3ZWL32ZtFNNVyaT6kn1dsTWXrKJBV+ehQGCWFLQAGUgByb/w9xo/ntpf/un
         Kw7Q39ozlbkwZLZL24Akx/ymP6xKhDWiZxwzcDdzLdyocjt66dmb1m2UsGEAv3ytELzP
         60Ky49/2ZeL8o/HI92muDutzXBK/YHdtM5aSTFEwejPmUFw+MP6lHDvYtdmQ+4hJA1Tr
         AeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=BSzrynuO1iOo2CK6rQHNQDqzEoc17vUODS/ojoG1m+c=;
        b=vlMS8dsZzSnKygH7uHHtgW2WIbHS2kSVv75N3OQnQQfqhRdxjogQwo1O8mo0wb3oa7
         EVI31xn6b0WqeSfp63VBkuiMauq/MHXqIsKnEidW5iXGxnEW2G0YKNxRRdx+WpUD2nxG
         fQpCoqb8yFiJgxM+y19kEj4ge8OgdEsIz8k5pu6GnM0cm6lTZYp3RmanRQyqWA58BqpD
         tQeB3XS/i+I2UM8QPcFonJmnuBuOjmn6X/gsF10g68Cs1Qy4cEI41QvfMIbCNIEJne5w
         0940nSeJ2pTOxh3tHsdrHc8qY1twEiAn4ZaR8//6BeHScTW5XY9vkP1O9KndGSRoKNvd
         tOGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q25si9282043qtj.171.2017.09.19.04.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 04:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duGgp-0002LF-9h
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 07:27:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duGgZ-0002H2-DI
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duGgW-0006RY-86
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:27 -0400
Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175]:43235)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duGgW-0006Qx-0A
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:24 -0400
Received: from player716.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 00BE863797
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 13:27:22 +0200 (CEST)
Received: from zorba.kaod.org.com (deibp9eh1--blueice1n2.emea.ibm.com
	[195.212.29.164]) (Authenticated sender: clg@kaod.org)
	by player716.ha.ovh.net (Postfix) with ESMTPSA id 7B306560094;
	Tue, 19 Sep 2017 13:27:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Sep 2017 13:26:44 +0200
Message-Id: <20170919112645.8574-5-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170919112645.8574-1-clg@kaod.org>
References: <20170919112645.8574-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 18382004831648123665
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheejgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.251.175
Subject: [Qemu-arm] [PATCH 4/5] misc: add pca9552 LED blinker model
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DLj2mFuYVRs9

Specs are available here :

  https://www.nxp.com/docs/en/data-sheet/PCA9552.pdf

This is a simple model supporting the basic registers for led and GPIO
mode. The device also supports two blinking rates but not the model
yet.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/misc/Makefile.objs           |   1 +
 hw/misc/pca9552.c               | 212 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/misc/pca9552.h       |  32 ++++++
 4 files changed, 246 insertions(+)
 create mode 100644 hw/misc/pca9552.c
 create mode 100644 include/hw/misc/pca9552.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index bbdd3c1d8b7f..17b8fc323f27 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -16,6 +16,7 @@ CONFIG_TSC2005=3Dy
 CONFIG_LM832X=3Dy
 CONFIG_TMP105=3Dy
 CONFIG_TMP421=3Dy
+CONFIG_PCA9552=3Dy
 CONFIG_STELLARIS=3Dy
 CONFIG_STELLARIS_INPUT=3Dy
 CONFIG_STELLARIS_ENET=3Dy
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 29fb922cefc6..33ba1d6642f9 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -7,6 +7,7 @@ common-obj-$(CONFIG_SGA) +=3D sga.o
 common-obj-$(CONFIG_ISA_TESTDEV) +=3D pc-testdev.o
 common-obj-$(CONFIG_PCI_TESTDEV) +=3D pci-testdev.o
 common-obj-$(CONFIG_EDU) +=3D edu.o
+common-obj-$(CONFIG_PCA9552) +=3D pca9552.o
=20
 common-obj-y +=3D unimp.o
=20
diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
new file mode 100644
index 000000000000..22460f4c14fe
--- /dev/null
+++ b/hw/misc/pca9552.c
@@ -0,0 +1,212 @@
+/*
+ * PCA9552 I2C LED blinker
+ *
+ * Copyright (c) 2017, IBM Corporation.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later. See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/hw.h"
+#include "hw/misc/pca9552.h"
+
+#define PCA9552_INPUT0   0 /* read only input register 0 */
+#define PCA9552_INPUT1   1 /* read only input register 1  */
+#define PCA9552_PSC0     2 /* read/write frequency prescaler 0 */
+#define PCA9552_PWM0     3 /* read/write PWM register 0 */
+#define PCA9552_PSC1     4 /* read/write frequency prescaler 1 */
+#define PCA9552_PWM1     5 /* read/write PWM register 1 */
+#define PCA9552_LS0      6 /* read/write LED0 to LED3 selector */
+#define PCA9552_LS1      7 /* read/write LED4 to LED7 selector */
+#define PCA9552_LS2      8 /* read/write LED8 to LED11 selector */
+#define PCA9552_LS3      9 /* read/write LED12 to LED15 selector */
+
+#define PCA9552_LED_ON   0x0
+#define PCA9552_LED_OFF  0x1
+#define PCA9552_LED_PWM0 0x2
+#define PCA9552_LED_PWM1 0x3
+
+static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin)
+{
+    uint8_t reg   =3D PCA9552_LS0 + (pin / 4);
+    uint8_t shift =3D (pin % 4) << 1;
+
+    return (s->regs[reg] >> shift) & 0x3;
+}
+
+static void pca9552_update_pin_input(PCA9552State *s)
+{
+    int i;
+
+    for (i =3D 0; i < 16; i++) {
+        uint8_t input_reg =3D PCA9552_INPUT0 + (i / 8);
+        uint8_t input_shift =3D (i % 8);
+        uint8_t config =3D pca9552_pin_get_config(s, i);
+
+        switch (config) {
+        case PCA9552_LED_ON:
+            s->regs[input_reg] |=3D 1 << input_shift;
+            break;
+        case PCA9552_LED_OFF:
+            s->regs[input_reg] &=3D ~(1 << input_shift);
+            break;
+        case PCA9552_LED_PWM0:
+        case PCA9552_LED_PWM1:
+            /* ??? */
+        default:
+            break;
+        }
+    }
+}
+
+static void pca9552_read(PCA9552State *s)
+{
+    uint8_t reg =3D s->pointer & 0xf;
+
+    s->len =3D 0;
+
+    switch (reg) {
+    case PCA9552_INPUT0:
+    case PCA9552_INPUT1:
+    case PCA9552_PSC0:
+    case PCA9552_PWM0:
+    case PCA9552_PSC1:
+    case PCA9552_PWM1:
+    case PCA9552_LS0:
+    case PCA9552_LS1:
+    case PCA9552_LS2:
+    case PCA9552_LS3:
+        s->buf[s->len++] =3D s->regs[reg];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: unexpected read to register =
%d\n",
+                      __func__, reg);
+    }
+}
+
+static void pca9552_write(PCA9552State *s)
+{
+    uint8_t reg =3D s->pointer & 0xf;
+
+    switch (reg) {
+    case PCA9552_PSC0:
+    case PCA9552_PWM0:
+    case PCA9552_PSC1:
+    case PCA9552_PWM1:
+        s->regs[reg] =3D s->buf[0];
+        break;
+
+    case PCA9552_LS0:
+    case PCA9552_LS1:
+    case PCA9552_LS2:
+    case PCA9552_LS3:
+        s->regs[reg] =3D s->buf[0];
+        pca9552_update_pin_input(s);
+        break;
+
+    case PCA9552_INPUT0:
+    case PCA9552_INPUT1:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: unexpected write to register=
 %d\n",
+                      __func__, reg);
+    }
+}
+
+static int pca9552_recv(I2CSlave *i2c)
+{
+    PCA9552State *s =3D PCA9552(i2c);
+
+    if (s->len < sizeof(s->buf)) {
+        return s->buf[s->len++];
+    } else {
+        return 0xff;
+    }
+}
+
+static int pca9552_send(I2CSlave *i2c, uint8_t data)
+{
+    PCA9552State *s =3D PCA9552(i2c);
+
+    if (s->len =3D=3D 0) {
+        s->pointer =3D data;
+        s->len++;
+    } else {
+        if (s->len <=3D sizeof(s->buf)) {
+            s->buf[s->len - 1] =3D data;
+        }
+        s->len++;
+        pca9552_write(s);
+    }
+
+    return 0;
+}
+
+static int pca9552_event(I2CSlave *i2c, enum i2c_event event)
+{
+    PCA9552State *s =3D PCA9552(i2c);
+
+    if (event =3D=3D I2C_START_RECV) {
+        pca9552_read(s);
+    }
+
+    s->len =3D 0;
+    return 0;
+}
+
+static const VMStateDescription pca9552_vmstate =3D {
+    .name =3D "PCA9552",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT8(len, PCA9552State),
+        VMSTATE_UINT8(pointer, PCA9552State),
+        VMSTATE_UINT8_ARRAY(buf, PCA9552State, 1),
+        VMSTATE_UINT8_ARRAY(regs, PCA9552State, PCA9552_NR_REGS),
+        VMSTATE_I2C_SLAVE(i2c, PCA9552State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void pca9552_reset(DeviceState *dev)
+{
+    PCA9552State *s =3D PCA9552(dev);
+
+    s->regs[PCA9552_PSC0] =3D 0xFF;
+    s->regs[PCA9552_PWM0] =3D 0x80;
+    s->regs[PCA9552_PSC1] =3D 0xFF;
+    s->regs[PCA9552_PWM1] =3D 0x80;
+    s->regs[PCA9552_LS0] =3D 0x55; /* all OFF */
+    s->regs[PCA9552_LS1] =3D 0x55;
+    s->regs[PCA9552_LS2] =3D 0x55;
+    s->regs[PCA9552_LS3] =3D 0x55;
+
+    pca9552_update_pin_input(s);
+}
+
+static void pca9552_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
+
+    k->event =3D pca9552_event;
+    k->recv =3D pca9552_recv;
+    k->send =3D pca9552_send;
+    dc->reset =3D pca9552_reset;
+    dc->vmsd =3D &pca9552_vmstate;
+}
+
+static const TypeInfo pca9552_info =3D {
+    .name          =3D TYPE_PCA9552,
+    .parent        =3D TYPE_I2C_SLAVE,
+    .instance_size =3D sizeof(PCA9552State),
+    .class_init    =3D pca9552_class_init,
+};
+
+static void pca9552_register_types(void)
+{
+    type_register_static(&pca9552_info);
+}
+
+type_init(pca9552_register_types)
diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
new file mode 100644
index 000000000000..875467725526
--- /dev/null
+++ b/include/hw/misc/pca9552.h
@@ -0,0 +1,32 @@
+/*
+ * PCA9552 I2C LED blinker
+ *
+ * Copyright (c) 2017, IBM Corporation.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later. See the COPYING file in the top-level directory.
+ */
+#ifndef PCA9552_H
+#define PCA9552_H
+
+#include "hw/i2c/i2c.h"
+
+#define TYPE_PCA9552 "pca9552"
+#define PCA9552(obj) OBJECT_CHECK(PCA9552State, (obj), TYPE_PCA9552)
+
+
+#define PCA9552_NR_REGS 10
+
+typedef struct PCA9552State {
+    /*< private >*/
+    I2CSlave i2c;
+    /*< public >*/
+
+    uint8_t len;
+    uint8_t pointer;
+    uint8_t buf[1]; /* just to remember how to handle a larger buffer */
+
+    uint8_t regs[PCA9552_NR_REGS];
+} PCA9552State;
+
+#endif
--=20
2.13.5

