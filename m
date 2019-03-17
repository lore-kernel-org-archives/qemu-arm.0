Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp1396945wrt;
        Sun, 17 Mar 2019 07:13:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEaVKRtlbqdicbwCWNH/EoS8awsPSdKMRisiao/QrQcJyuw3S3DDtRQe/8nN/LwglXFwx/
X-Received: by 2002:a1c:ef0c:: with SMTP id n12mr8588822wmh.105.1552832009794;
        Sun, 17 Mar 2019 07:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552832009; cv=none;
        d=google.com; s=arc-20160816;
        b=kS20+/Q4L7ZR+5+YeduBpqJzI/5I7WrAzpCzTTgIZPDCqALVXM6PoFde7Cr+onivhh
         8NANkUZHsEA8CnV8+Hh6ejBXlciBvrYLGOrtQLuUo6fc/b7W02qb8j9i+xuHItE3WGCK
         2JkpY+WS21lRR+wx9b/SbQGwY0GJqgVgN0rwt11hiS05bEHFV2S09hngOBqlZXahI7AM
         wEf3LhuALM0iZyq0XRKYcskAiWl5RJTyZuvRrMs7QGgdEu6hiUtCdjylPtybe5lsWW1e
         99KfDVuiOchsQhBk+jVqU9tHdNwUGuU5OoxF6mohUtyEtBOvaU4MYsP2uxGsdBFj1Zzc
         dsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=qtZ17DeveKS5xTHm9QnBvdL8f3FGwO7Mt4wXQ5YTmAw=;
        b=lQsvPWFvKhUuS3/79+D8Zr++58t3ZlVJBh+daL6MlGvux5GH1TVvXDNEUWG+pO6xlT
         O5x4qEJ3hE8dSYb04Wk2P4mdFbvPdF9SZqtVeRQ7TLcdlc9Wj7Ox6A309WwMJoLOnRmd
         IhIqVtng69xfKHpB/qmKRL/PSxXijcrhNxPVZT08zPYrmCJR9nUOrBCGUsuItJqUsjUa
         nkUY0ifa/+J5hpZFcGaGceSaRmNN76k02jFhAmjZcKOKVjUP5PghNlhwKU+fnkWLa4mH
         G26gkat5gi8DwvtDMEXIwdAUeyZqnT8+aPCzfuj6ob6OQzeKi7PPh3K5MdlVhR14iXnw
         LLtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f77si4559957wme.16.2019.03.17.07.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Mar 2019 07:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5WXY-0001tB-OT
	for alex.bennee@linaro.org; Sun, 17 Mar 2019 10:13:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1h5WXD-0001pk-78
	for qemu-arm@nongnu.org; Sun, 17 Mar 2019 10:13:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1h5WUM-0006fm-U8
	for qemu-arm@nongnu.org; Sun, 17 Mar 2019 10:10:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1h5WUM-0006dN-Ig; Sun, 17 Mar 2019 10:10:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D933B3DE07;
	Sun, 17 Mar 2019 14:10:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.112.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5088E5C28F;
	Sun, 17 Mar 2019 14:10:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Mar 2019 15:10:01 +0100
Message-Id: <20190317141001.3346-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sun, 17 Mar 2019 14:10:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2] nrf51_gpio: reflect pull-up/pull-down to IRQs
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
Cc: contrib@steffen-goertz.de, qemu-arm@nongnu.org, stefanha@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2/MmqNHsVhN4

Some drivers do I2C bitbanging by keeping the output to 0 and flipping
the GPIO direction between input and output (see for example in Linux
gpio_set_open_drain_value_commit, in drivers/gpio/gpiolib.c).
When the GPIO is set to input, the pull-up resistor brings the output
to 1, while when the GPIO is set to output, the output driver brings
the output to 0.

Implement this for the nRF51 GPIO device model.  First, if both input and
output are floating, and there is a pull-up or pull-down resistor
configured, do not just set s->in, but also make any devices listening
on the output qemu_irq receive that value.  Second, if the pin is
driven both internally (output pin) and externally you don't get a
short circuit if both sides drive the pin to the same value.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
        v1->v2: fixed short circuit conditions, reordering the code accor=
ding
        to the schematic in the datasheet
---
 hw/gpio/nrf51_gpio.c | 64 +++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/hw/gpio/nrf51_gpio.c b/hw/gpio/nrf51_gpio.c
index 86e047d649..e061c58dd2 100644
--- a/hw/gpio/nrf51_gpio.c
+++ b/hw/gpio/nrf51_gpio.c
@@ -43,6 +43,17 @@ static bool is_connected(uint32_t config, uint32_t lev=
el)
     return state;
 }
=20
+static int pull_value(uint32_t config)
+{
+    int pull =3D extract32(config, 2, 2);
+    if (pull =3D=3D NRF51_GPIO_PULLDOWN) {
+        return 0;
+    } else if (pull =3D=3D NRF51_GPIO_PULLUP) {
+        return 1;
+    }
+    return -1;
+}
+
 static void update_output_irq(NRF51GPIOState *s, size_t i,
                               bool connected, bool level)
 {
@@ -61,43 +72,46 @@ static void update_output_irq(NRF51GPIOState *s, size=
_t i,
=20
 static void update_state(NRF51GPIOState *s)
 {
-    uint32_t pull;
+    int pull;
     size_t i;
-    bool connected_out, dir, connected_in, out, input;
+    bool connected_out, dir, connected_in, out, in, input;
=20
     for (i =3D 0; i < NRF51_GPIO_PINS; i++) {
-        pull =3D extract32(s->cnf[i], 2, 2);
+        pull =3D pull_value(s->cnf[i]);
         dir =3D extract32(s->cnf[i], 0, 1);
         connected_in =3D extract32(s->in_mask, i, 1);
         out =3D extract32(s->out, i, 1);
+        in =3D extract32(s->in, i, 1);
         input =3D !extract32(s->cnf[i], 1, 1);
         connected_out =3D is_connected(s->cnf[i], out) && dir;
=20
-        update_output_irq(s, i, connected_out, out);
-
-        /* Pin both driven externally and internally */
-        if (connected_out && connected_in) {
-            qemu_log_mask(LOG_GUEST_ERROR, "GPIO pin %zu short circuited=
\n", i);
-        }
-
-        /*
-         * Input buffer disconnected from internal/external drives, so
-         * pull-up/pull-down becomes relevant
-         */
-        if (!input || (input && !connected_in && !connected_out)) {
-            if (pull =3D=3D NRF51_GPIO_PULLDOWN) {
-                s->in =3D deposit32(s->in, i, 1, 0);
-            } else if (pull =3D=3D NRF51_GPIO_PULLUP) {
-                s->in =3D deposit32(s->in, i, 1, 1);
+        if (!input) {
+            if (pull >=3D 0) {
+                /* Input buffer disconnected from external drives */
+                s->in =3D deposit32(s->in, i, 1, pull);
+            }
+        } else {
+            if (connected_out && connected_in && out !=3D in) {
+                /* Pin both driven externally and internally */
+                qemu_log_mask(LOG_GUEST_ERROR, "GPIO pin %zu short circu=
ited\n", i);
+            }
+            if (!connected_in) {
+                /*
+                 * Floating input: the output stimulates IN if connected=
,
+                 * otherwise pull-up/pull-down resistors put a value on =
both
+                 * IN and OUT.
+                 */
+                if (pull >=3D 0 && !connected_out) {
+                    connected_out =3D true;
+                    out =3D pull;
+                }
+                if (connected_out) {
+                    s->in =3D deposit32(s->in, i, 1, out);
+                }
             }
         }
-
-        /* Self stimulation through internal output driver */
-        if (connected_out && !connected_in && input) {
-            s->in =3D deposit32(s->in, i, 1, out);
-        }
+        update_output_irq(s, i, connected_out, out);
     }
-
 }
=20
 /*
--=20
2.20.1

