Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24332156lff;
        Mon, 6 Jan 2020 23:54:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwIjVxJveybwXjQ+r2vBADQZOGrmhM15Ls4pS8LYDNMtANs16AKGz+6UX39/FhCCxG7pTh6
X-Received: by 2002:aa7:d3cb:: with SMTP id o11mr114741772edr.145.1578383658263;
        Mon, 06 Jan 2020 23:54:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578383658; cv=none;
        d=google.com; s=arc-20160816;
        b=uBGC/zgSesG6K7kQeP7qToRu5GjCcV76eiGU7FKwzOcYBrai9hv4zIY/EY9tskPSo9
         0SsG5XG2q32ErRq2jOcQ1KWe9jkX8hWc56zqCVU03YaTOOtzvzzcJftZF8jIe18DAPkg
         swxyxPCJZIRA8kJjmVnpEUaD/74hvOxjwdkKQN3k2s6MCudwUKmvsARU0blUU777naxS
         B6WW8aaRh+gnH/IXuBJhvPe2pw19vBOY+L/VwPjA9iNlYMN9oeO+zsKmeJ0abDnnnoQP
         uqpZXZFtUwmVLaXVcs0o3NrhixN/JmO7UqSXiNPtTzZd3dj9byrZdiaPwfgy4ccPbCi1
         uCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9kKEvjPus4aiFQHHTbI86Vi+GrVK2oJkjn0/O5nEDWs=;
        b=Tne1Ylwp6DPdOcJoExhb2MkIbQ3wLOhdRE/ytTJQnlwTFsiaublyBVVMLXMqPH+u9I
         ipOGrbOxY/Oou5TLyOPfbg6JvwoAlW1YiDqFZ8XIJDdRfagtnqbDFndrWcIqr09MW7pF
         dACpZSpBNMuzQh+RAEECtRDsNdR08GDS2CMW/Pbtc720U6MO2ji8TCdctqatoWOK/6Tp
         egNpoLG/1zDavMHa+DJUZsi3yQt6MaIv63eu+h9112fvLlvw+veN2ytbcUUxPTgncioG
         2di7QsyI8Mj1yVAtCB2VlehfPBPJgz3OvkhXL9eMGN1h+UWMu5lGetfX9zMp4j6IesGx
         ByCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lu19si46955328ejb.80.2020.01.06.23.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 23:54:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44139 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iojbv-0005zC-3v
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 02:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iojOS-0003I8-5F
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:35:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iojOQ-00072a-Ff
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:35:11 -0500
Received: from 3.mo69.mail-out.ovh.net ([188.165.52.203]:59830)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iojOQ-00071Q-A6
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:35:10 -0500
Received: from player755.ha.ovh.net (unknown [10.108.42.168])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 80E2F78B70
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 08:35:08 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player755.ha.ovh.net (Postfix) with ESMTPSA id 04052DFE0E58;
 Tue,  7 Jan 2020 07:35:00 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 5/5] misc/pca9552: Add qom set and get
Date: Tue,  7 Jan 2020 08:34:23 +0100
Message-Id: <20200107073423.30043-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200107073423.30043-1-clg@kaod.org>
References: <20200107073423.30043-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3795408588335713041
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehuddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgephe
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.52.203
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tNTpTEUp894q

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

