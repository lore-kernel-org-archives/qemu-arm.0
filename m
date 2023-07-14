Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4360840eje;
        Fri, 14 Jul 2023 16:28:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGvzLDFM73Wmgh16nDttjJgmrvLcTW+qkMYBqvNTEfKoLpVAnEEFfYsatIfRsneNrl9zPvi
X-Received: by 2002:a05:620a:44c9:b0:765:7d7b:7197 with SMTP id y9-20020a05620a44c900b007657d7b7197mr6113958qkp.31.1689377318249;
        Fri, 14 Jul 2023 16:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689377318; cv=none;
        d=google.com; s=arc-20160816;
        b=qZqIxP0aHMfVNiikm09yMlj02+fM2kskmQ7NkXeNtBjnlNUV4605d5cYTU2zG6Ssb9
         L7oRFibSU8NQlSJePf2bQA4p970V4/S2q6Ql9cT7DBVHDhMTyOMJLz3eCtWBV6a8JyQs
         y+JZIqX4GP8jwwTbUpsCc0zBjcqkL0ajOpxwSBnMzCzPcuh8lvD64yXNLXXVeN+qm2ED
         GXGLofs6B/TvPuwtsBaAxT3H1W8aekknSlNi7fGHjCrEodQvdW7krGqrjSQ+zjN0Qjvh
         V+TxT7W2zsF4dXVI90ILpADV/b5+ZmRQ3Bwj1U3o0GoGtKkH1XULBhaDNRIToA2Mxfvx
         d/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=rBUVME81L2BwsoVmoHCIFwJeWfKSbWXNevI9b3imAvo=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=sYg0j94avlsEV7x3PBEaOLjOOOgX8u40X/3fl5W55kGxfBmDnKC+aCN4247OsGkP6d
         L01vnFBqLkOSEJ1MQhu8DjAfJFrVWqSZE40IbJ/eIzG0/lKBhSXcWj3R70y58APsKMDy
         8FaVytVZ4cvmmKxj0yyVoxKWMhVRtjiAgqZ1r1aUvYX62peiaJhPBTMquZQOAN3n0EkT
         GbUPbMzlIhX6NQI7tJADh0D5b7+TrcBkvCs1H7u8QNP8cT3Q944616hMkBeqJIUWd/wA
         zrwT66v7vESMeMSzPtcyZnNZjLAGomJOURsD5iA4h5XX+EuT4UKKA4rUOhZvoIE+hHRi
         1iBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=4nlMIzWN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm40-20020a05620a19a800b00767e5cd1515si4779309qkb.44.2023.07.14.16.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 16:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=4nlMIzWN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qKSCF-0000jS-Lr; Fri, 14 Jul 2023 19:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qKSCD-0000jF-QR
 for qemu-devel@nongnu.org; Fri, 14 Jul 2023 19:27:33 -0400
Received: from mail-4317.proton.ch ([185.70.43.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qKSCB-0003zD-Tg
 for qemu-devel@nongnu.org; Fri, 14 Jul 2023 19:27:33 -0400
Date: Fri, 14 Jul 2023 23:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1689377250; x=1689636450;
 bh=rBUVME81L2BwsoVmoHCIFwJeWfKSbWXNevI9b3imAvo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=4nlMIzWN4aI85nB+6I9Ri5h1X/gigg4/Xrc3izw1w3YEKdUSaHKLkUrSbiuDX56pT
 yczaDdNyHnyVuJWcNFqWlW+mYw86fjiLl2As/Z6DKhb4wZM22dNQIkOfob2UJP7A7A
 3M1UMn1SoZw9yTEf70t1pYdYZiRKXq4se2fY4HGQ/4w7QmIxM0QN1huoUkJk6QUhDa
 fI9JXEXbjZPWQXgblt7wutwsSJkXFzuCkCd6o7G8vAmezLaLL3kb7C3spikOZ4nJrX
 xcwey0DLbZlqwJ8I4VElttXlfqzcOfYlr8GUZOvf944YaZXIS1O2xtgevPjk4iMCmz
 2qP4CJbuGQEEA==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH 1/6] hw/gpio/nrf51: implement DETECT signal
Message-ID: <20230714232659.76434-2-chris@laplante.io>
In-Reply-To: <20230714232659.76434-1-chris@laplante.io>
References: <20230714232659.76434-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.17; envelope-from=chris@laplante.io;
 helo=mail-4317.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DcthBZ89l52L

Implement nRF51 DETECT signal in the GPIO peripheral.

The reference manual makes mention of a per-pin DETECT signal, but these
are not exposed to the user. See https://devzone.nordicsemi.com/f/nordic-q-=
a/39858/gpio-per-pin-detect-signal-available
for more information. Currently, I don't see a reason to model these.

Signed-off-by: Chris Laplante <chris@laplante.io>
---
 hw/arm/nrf51_soc.c           |  1 +
 hw/gpio/nrf51_gpio.c         | 14 +++++++++++++-
 include/hw/gpio/nrf51_gpio.h |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 34da0d62f0..7ae54e18be 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -150,6 +150,7 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Err=
or **errp)
=20
     /* Pass all GPIOs to the SOC layer so they are available to the board =
*/
     qdev_pass_gpios(DEVICE(&s->gpio), dev_soc, NULL);
+    qdev_pass_gpios(DEVICE(&s->gpio), dev_soc, "detect");
=20
     /* TIMER */
     for (i =3D 0; i < NRF51_NUM_TIMERS; i++) {
diff --git a/hw/gpio/nrf51_gpio.c b/hw/gpio/nrf51_gpio.c
index b47fddf4ed..08396c69a4 100644
--- a/hw/gpio/nrf51_gpio.c
+++ b/hw/gpio/nrf51_gpio.c
@@ -78,6 +78,7 @@ static void update_state(NRF51GPIOState *s)
     int pull;
     size_t i;
     bool connected_out, dir, connected_in, out, in, input;
+    bool assert_detect =3D false;
=20
     for (i =3D 0; i < NRF51_GPIO_PINS; i++) {
         pull =3D pull_value(s->cnf[i]);
@@ -99,7 +100,15 @@ static void update_state(NRF51GPIOState *s)
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "GPIO pin %zu short circuited\n", i);
             }
-            if (!connected_in) {
+            if (connected_in) {
+                uint32_t detect_config =3D extract32(s->cnf[i], 16, 2);
+                if ((detect_config =3D=3D 2) && (in =3D=3D 1)) {
+                    assert_detect =3D true;
+                }
+                if ((detect_config =3D=3D 3) && (in =3D=3D 0)) {
+                    assert_detect =3D true;
+                }
+            } else {
                 /*
                  * Floating input: the output stimulates IN if connected,
                  * otherwise pull-up/pull-down resistors put a value on bo=
th
@@ -116,6 +125,8 @@ static void update_state(NRF51GPIOState *s)
         }
         update_output_irq(s, i, connected_out, out);
     }
+
+    qemu_set_irq(s->detect, assert_detect);
 }
=20
 /*
@@ -291,6 +302,7 @@ static void nrf51_gpio_init(Object *obj)
=20
     qdev_init_gpio_in(DEVICE(s), nrf51_gpio_set, NRF51_GPIO_PINS);
     qdev_init_gpio_out(DEVICE(s), s->output, NRF51_GPIO_PINS);
+    qdev_init_gpio_out_named(DEVICE(s), &s->detect, "detect", 1);
 }
=20
 static void nrf51_gpio_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/gpio/nrf51_gpio.h b/include/hw/gpio/nrf51_gpio.h
index 8f9c2f86da..fcfa2bac17 100644
--- a/include/hw/gpio/nrf51_gpio.h
+++ b/include/hw/gpio/nrf51_gpio.h
@@ -64,6 +64,7 @@ struct NRF51GPIOState {
     uint32_t old_out_connected;
=20
     qemu_irq output[NRF51_GPIO_PINS];
+    qemu_irq detect;
 };
=20
=20
--=20
2.39.2


