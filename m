Received: by 10.223.197.9 with SMTP id q9csp811847wrf;
        Fri, 13 Oct 2017 07:37:16 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RgKDOj1e8fMXSUa6MPbbdQRm6i6kIaoyqJLHPPT14pl8ehXnTbPsjoJyLNyeJl4Xg7aajT
X-Received: by 10.55.127.70 with SMTP id a67mr2120856qkd.90.1507905436634;
        Fri, 13 Oct 2017 07:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507905436; cv=none;
        d=google.com; s=arc-20160816;
        b=n54+KPMNAZDC4ZhCSORo2dlNBSeoNu+HhkYJ7dCR5bf1Sue8FmI40x2aLPmHYwy53O
         K+Z6eCjyIs79RmP4UJ3eCAtMCNlS8QwCQb/A2sjWjde0ue1gwxCmDCCeRWLcX5jIAvG5
         /+K9umulX6K8ktYurfUuUJmKg5gRnuxaxwYrfSc1UJ3aAS/z1GrFcxhP0DwQYdYZj5BO
         letcnIEGG+KCEY9wi6u+cnGWeBCO/1qko9wHmsePfJo659vKXP2HTuIpvUZVr0uLp9dB
         uyKnMmAXuEXNb8OspzgxIsHQCt4WV15aQ2JXWYy/BS/uQ/KOsDbHZ8FgQPWTC1C/3BeQ
         MXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=hHyN/MgmXx7ZiIL37oBWwya1gl5QVR4rg5Fh7pXuyMc=;
        b=SX1LRK+UPpl4dJKD62NvcEvZwgdUaSk8e8iFtSWl1eNpnvWYYLFTcEsv2SuMXTiH7T
         9HYFEgABVWNxZYdgsJeSbB9HhV8EWuaFeBsBGboBPgHadDYtBJiEPKXcVv2KopmSxEOk
         BoOQdKiap04xGst3u41o0dhhO8pUNZi18uIW1wMg95X+4auM6futdG7Cckzx8Dcy7uIQ
         oJMga0X/7EQLEG2E3fllP58W25IFJDNBPYVhNZI2qZU7aRYuueKtq7f9OvYGtGQvx/q5
         FSffTKiTn0eEyM7W86dHEyRKGH4J4yaZlh4lVdbol3Y0QYna1oug7njQl8fujxsFMk6g
         NA8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t65si893677qkf.22.2017.10.13.07.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Oct 2017 07:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e315N-0002J7-WD
	for alex.bennee@linaro.org; Fri, 13 Oct 2017 10:37:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30yO-0005Oc-4d
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30yK-0000vz-3M
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:30:00 -0400
Received: from 11.mo4.mail-out.ovh.net ([46.105.34.195]:33089)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e30yJ-0000u9-RG
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:56 -0400
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 5E264E7873
	for <qemu-arm@nongnu.org>; Fri, 13 Oct 2017 16:29:54 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id A15CB48009F;
	Fri, 13 Oct 2017 16:29:46 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Oct 2017 16:28:51 +0200
Message-Id: <20171013142852.916-6-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171013142852.916-1-clg@kaod.org>
References: <20171013142852.916-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14835420124623112977
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtdeigdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.34.195
Subject: [Qemu-arm] [PATCH v3 5/6] misc: add pca9552 LED blinker model
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VW+HgZ9dc4zq

Specs are available here :

  https://www.nxp.com/docs/en/data-sheet/PCA9552.pdf

This is a simple model supporting the basic registers for led and GPIO
mode. The device also supports two blinking rates but not the model
yet.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v2:

 - removed comments on the I2C buffer size, but kept the array. I did
   not want to rewrite the buffer handling

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
index 5059d134c816..d868d1095a6c 100644
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
index e8f0a02f35af..e4e22880dbbc 100644
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
index 000000000000..6c66d4f69e9e
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
+    uint8_t buf[1];
+
+    uint8_t regs[PCA9552_NR_REGS];
+} PCA9552State;
+
+#endif
--=20
2.13.6

