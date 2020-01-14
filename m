Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5331894lff;
        Tue, 14 Jan 2020 02:37:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtV1tY/4sAmL0HskJ3GW5biF6YyMGdOo/lS2lMJWFImukOdN+q9czvjbC5HcjImQuclHDL
X-Received: by 2002:a17:906:b855:: with SMTP id ga21mr21734377ejb.186.1578998261575;
        Tue, 14 Jan 2020 02:37:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578998261; cv=none;
        d=google.com; s=arc-20160816;
        b=Fd4/7dUTEUvBYGgEbbZrvcQkZQaQcmOOR61BUzmHS8EiK9enOLGpekcUw5xBLhF0qw
         j2M7vMGPvi/h+lpS5JrYNJCfVuOvvkCAycDEiWa0wldfrPpRLsaFPk99zPaafsqI6vns
         ij8+TJPc571HUZSTqaPun379VkmMsoOm4Mw9McOzqhKxv75BKwo6rW7A4Lln2xO3sfD6
         jpqw8v9h2N4D6kw4c5/qELGCWb59dWVn+UkKfmssBKKSb/gQfQr37c3iQPbLQBkgRlks
         8ATScxSHMVdKUsYwwwL50EqO2CR7Qy5NtrT/HEtLP6haeBDAmgODy4dePcNDb06Ietjo
         H1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9kKEvjPus4aiFQHHTbI86Vi+GrVK2oJkjn0/O5nEDWs=;
        b=UTpwEm/tSCusn/U7S34Qiu+/P6mQy+YOPBav/tKQdrMWXCIL89Lm4V4xsdO179TfDz
         r8TvLZnExJB2zwrqwZ/lbxt17fosXPK+vuvFfIC8KiXMTnsevwr8UPa0DqdOy0NNErk2
         74sS3/UL4IxzMkMJvpf24Zw+iPmKHmjvLwYBLOSdUs0ML/dm1AN2SG+8LEIWfsh0AERB
         TA7FkQ/5BKpeHWd53cp90ntlTO8pYkE5Cm6kj1EE+a3B7g0L0/GlO+Y5b5TD3xPi8nyw
         L2TX7AxuBWkCqKq+7cKQhEjmptXacAjP2PVkOb8B/u80sequiYJ8TfdMmQS2hpQQZUam
         BUpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si8464395ejp.451.2020.01.14.02.37.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 02:37:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irJZs-0007S8-BI
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 05:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1irJXq-0005F4-Kq
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:35:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1irJXm-0003mW-SL
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:35:34 -0500
Received: from 6.mo173.mail-out.ovh.net ([46.105.43.93]:54067)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1irJXm-0003ln-Ik
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:35:30 -0500
Received: from player798.ha.ovh.net (unknown [10.108.57.188])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 124CA12C78A
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 11:35:29 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 65B0AE4D00C3;
 Tue, 14 Jan 2020 10:35:21 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 5/5] misc/pca9552: Add qom set and get
Date: Tue, 14 Jan 2020 11:34:33 +0100
Message-Id: <20200114103433.30534-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200114103433.30534-1-clg@kaod.org>
References: <20200114103433.30534-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11056337086092774161
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.43.93
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z8xS3PJCixxj

From: Joel Stanley <joel@jms.id.au>

Following the pattern of the work recently done with the ASPEED GPIO
model, this adds support for inspecting and modifying the PCA9552 LEDs
from the monitor.

 (qemu) qom-set  /machine/unattached/device[17] led0 on
 (qemu) qom-set  /machine/unattached/device[17] led0 off
 (qemu) qom-set  /machine/unattached/device[17] led0 pwm0
 (qemu) qom-set  /machine/unattached/device[17] led0 pwm1

Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: - removed the "qom-get" examples from the commit log
      - merged memory leak fixes from Joel ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/misc/pca9552.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index 73be28d9369c..efd961e04148 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -15,12 +15,16 @@
 #include "hw/misc/pca9552.h"
 #include "hw/misc/pca9552_regs.h"
 #include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
=20
 #define PCA9552_LED_ON   0x0
 #define PCA9552_LED_OFF  0x1
 #define PCA9552_LED_PWM0 0x2
 #define PCA9552_LED_PWM1 0x3
=20
+static const char *led_state[] =3D {"on", "off", "pwm0", "pwm1"};
+
 static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin)
 {
     uint8_t reg   =3D PCA9552_LS0 + (pin / 4);
@@ -169,6 +173,82 @@ static int pca9552_event(I2CSlave *i2c, enum i2c_eve=
nt event)
     return 0;
 }
=20
+static void pca9552_get_led(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    PCA9552State *s =3D PCA9552(obj);
+    int led, rc, reg;
+    uint8_t state;
+
+    rc =3D sscanf(name, "led%2d", &led);
+    if (rc !=3D 1) {
+        error_setg(errp, "%s: error reading %s", __func__, name);
+        return;
+    }
+    if (led < 0 || led > s->nr_leds) {
+        error_setg(errp, "%s invalid led %s", __func__, name);
+        return;
+    }
+    /*
+     * Get the LSx register as the qom interface should expose the devic=
e
+     * state, not the modeled 'input line' behaviour which would come fr=
om
+     * reading the INPUTx reg
+     */
+    reg =3D PCA9552_LS0 + led / 4;
+    state =3D (pca9552_read(s, reg) >> (led % 8)) & 0x3;
+    visit_type_str(v, name, (char **)&led_state[state], errp);
+}
+
+/*
+ * Return an LED selector register value based on an existing one, with
+ * the appropriate 2-bit state value set for the given LED number (0-3).
+ */
+static inline uint8_t pca955x_ledsel(uint8_t oldval, int led_num, int st=
ate)
+{
+        return (oldval & (~(0x3 << (led_num << 1)))) |
+                ((state & 0x3) << (led_num << 1));
+}
+
+static void pca9552_set_led(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    PCA9552State *s =3D PCA9552(obj);
+    Error *local_err =3D NULL;
+    int led, rc, reg, val;
+    uint8_t state;
+    char *state_str;
+
+    visit_type_str(v, name, &state_str, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+    rc =3D sscanf(name, "led%2d", &led);
+    if (rc !=3D 1) {
+        error_setg(errp, "%s: error reading %s", __func__, name);
+        return;
+    }
+    if (led < 0 || led > s->nr_leds) {
+        error_setg(errp, "%s invalid led %s", __func__, name);
+        return;
+    }
+
+    for (state =3D 0; state < ARRAY_SIZE(led_state); state++) {
+        if (!strcmp(state_str, led_state[state])) {
+            break;
+        }
+    }
+    if (state >=3D ARRAY_SIZE(led_state)) {
+        error_setg(errp, "%s invalid led state %s", __func__, state_str)=
;
+        return;
+    }
+
+    reg =3D PCA9552_LS0 + led / 4;
+    val =3D pca9552_read(s, reg);
+    val =3D pca955x_ledsel(val, led % 4, state);
+    pca9552_write(s, reg, val);
+}
+
 static const VMStateDescription pca9552_vmstate =3D {
     .name =3D "PCA9552",
     .version_id =3D 0,
@@ -204,6 +284,7 @@ static void pca9552_reset(DeviceState *dev)
 static void pca9552_initfn(Object *obj)
 {
     PCA9552State *s =3D PCA9552(obj);
+    int led;
=20
     /* If support for the other PCA955X devices are implemented, these
      * constant values might be part of class structure describing the
@@ -211,6 +292,15 @@ static void pca9552_initfn(Object *obj)
      */
     s->max_reg =3D PCA9552_LS3;
     s->nr_leds =3D 16;
+
+    for (led =3D 0; led < s->nr_leds; led++) {
+        char *name;
+
+        name =3D g_strdup_printf("led%d", led);
+        object_property_add(obj, name, "bool", pca9552_get_led, pca9552_=
set_led,
+                            NULL, NULL, NULL);
+        g_free(name);
+    }
 }
=20
 static void pca9552_class_init(ObjectClass *klass, void *data)
--=20
2.21.1

