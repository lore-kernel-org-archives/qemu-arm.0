Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5246770wrm;
        Tue, 8 Oct 2019 07:38:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/YIANZzTuV+BFFdCnqqSIjbeACN8YSWFXayj/cxlIh44KD7hB9sut+tSWBcpDPDi9yETR
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr33713511qvo.146.1570545486086;
        Tue, 08 Oct 2019 07:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570545486; cv=none;
        d=google.com; s=arc-20160816;
        b=NpvddXk8GoDK0mfDTFnUrtdpNr5KXFOuv4Csjt/mdEzUIacwytj3gymvmKzCLvsELI
         rO+vX69zTNrJToDDnoPna01b/HWf8LLDc/bEkTYeuQl7ljAp98rZMniIQVRhzB0DcW3M
         zYm9h7t7SQh4w9zW8CX+CDUzTA9hKlTx9DaKcytZm6kN6XY3Cr73PI4rgqrOONItI7ss
         R7JkCFW9rlFN+3o/9oKxmGnK24tAHdHspUvSplhuJnl21fjNZOgkkPUKlC5A+B6B5gja
         9BNkPs71jRGFD1QpIIHD3CqKQbf/S9yD/LoV5Mw1HFU6TG9+1Y3vtcvw+eWFHCNR+TKp
         TkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ItpvhK3WUozobL+A3JSampil82oOOwX67ygqDnwkABk=;
        b=1D3Cmb8iHNGdtoCUh96W6C+J4n3xUG3IXlgSDEnUbTYVdivnourW1WkJZgO/KgRobZ
         p9S7wpL+aw+IotsSdqqD9HahqdAX2aSiJ9Ao6J9cLMKi8wrVAs4YYvVVylL3nNlE3xTh
         4w1PQVUFR8IiCCi5++c4OG2MR0khV2Drvsh8Y3a7PTgOHKVaoXdg4QvnO+1MRw+CETll
         8jLHJ1EvkFbZJJ2lZzUpVe8TXvnnvXn3nlR+LxI8m49Waer6W+4jSYfAuQ6XRPYTEYqZ
         ZbmE4UOBusJgWcunbfwFbUXJZB4YbNKJpdbDtif8OtnmYtEVU34wghgdnJkFBRxnCE/C
         gMDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z26si15416902qkj.171.2019.10.08.07.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 07:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHqcm-0000Hs-Q4
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 10:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHqSi-0007YN-34
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:27:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHqSg-0000Yx-T1
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:27:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10585)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iHqSY-0000Vm-2x; Tue, 08 Oct 2019 10:27:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 322477F75C;
 Tue,  8 Oct 2019 14:27:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-43.brq.redhat.com [10.40.204.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07D3919C69;
 Tue,  8 Oct 2019 14:27:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] hw/input/lm832x: Convert reset handler to DeviceReset
Date: Tue,  8 Oct 2019 16:25:38 +0200
Message-Id: <20191008142539.7793-8-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-1-philmd@redhat.com>
References: <20191008142539.7793-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 08 Oct 2019 14:27:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KeoQEPVDjtgt

The LM8323 key-scan controller is a I2C device, it will be reset
when the I2C bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/input/lm832x.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index a37eb854b9..aa629ddbf1 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -24,7 +24,6 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
-#include "sysemu/reset.h"
 #include "ui/console.h"
=20
 #define TYPE_LM8323 "lm8323"
@@ -94,8 +93,10 @@ static void lm_kbd_gpio_update(LM823KbdState *s)
 {
 }
=20
-static void lm_kbd_reset(LM823KbdState *s)
+static void lm_kbd_reset(DeviceState *dev)
 {
+    LM823KbdState *s =3D LM8323(dev);
+
     s->config =3D 0x80;
     s->status =3D INT_NOINIT;
     s->acttime =3D 125;
@@ -273,7 +274,7 @@ static void lm_kbd_write(LM823KbdState *s, int reg, i=
nt byte, uint8_t value)
=20
     case LM832x_CMD_RESET:
         if (value =3D=3D 0xaa)
-            lm_kbd_reset(s);
+            lm_kbd_reset(DEVICE(s));
         else
             lm_kbd_error(s, ERR_BADPAR);
         s->reg =3D LM832x_GENERAL_ERROR;
@@ -476,10 +477,6 @@ static void lm8323_realize(DeviceState *dev, Error *=
*errp)
     s->pwm.tm[1] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, lm_kbd_pwm1_tick, =
s);
     s->pwm.tm[2] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, lm_kbd_pwm2_tick, =
s);
     qdev_init_gpio_out(dev, &s->nirq, 1);
-
-    lm_kbd_reset(s);
-
-    qemu_register_reset((void *) lm_kbd_reset, s);
 }
=20
 void lm832x_key_event(DeviceState *dev, int key, int state)
@@ -507,6 +504,7 @@ static void lm8323_class_init(ObjectClass *klass, voi=
d *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
=20
+    dc->reset =3D lm_kbd_reset;
     dc->realize =3D lm8323_realize;
     k->event =3D lm_i2c_event;
     k->recv =3D lm_i2c_rx;
--=20
2.21.0

