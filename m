Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp578053ejb;
        Fri, 28 Jul 2023 09:10:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGtPO9CSX3J0Gtn7MwQOsyi02B4nU1EbpbxlH5LfJiaGscBRdgXw6Vtzs7OjcXN4SXfZZar
X-Received: by 2002:a0c:b3d7:0:b0:631:e696:7b6 with SMTP id b23-20020a0cb3d7000000b00631e69607b6mr2782307qvf.53.1690560655844;
        Fri, 28 Jul 2023 09:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690560655; cv=none;
        d=google.com; s=arc-20160816;
        b=Qrbsr9mfCpbw5hz/T0/YPCqQ6SBarva9Zq4hdeOSPq2ANmi+FCQUo+iSEpS/Enh3Vt
         wh8jbjJtYgExuNe+H2RTJBwIcKOhNC6MmEIOrUCF1ALcMLWy8PETCZ306CFO/3qMelX8
         EgOzTyj5y9v3RLr+0J4H6Imk95mxv2/zQ2rXOVRIAFF70RG3IWNFyP1/IbMmjb9bOasA
         K+/DJ8GrP/3CTbI/vygqOJosmrsrtoBQm11rByof95B8bGJsWpgG+PJJB2PznOGHTULt
         jrde6j5ZAf5e5L6oZ/96v5yQSvYkn09J/iXZbXxjkCovmdwivNsFnVAy3Iz/BpQ0n3sn
         h+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=zTjLq+zc91w1jiR1LPwIgyvKj+dT7Pr54R8PgUtkI0A=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=DBkz+eRFm2Zsi4umgrX0LJCN6i0CBqNs5JsFbs0Kr87E+oh2oA5it3ZCIW7zFFZAmC
         Qduaw4C6+o5SWuU89r1w0TUUHtYkYD9DWWNozLtMQupj6DFIzI+M69UnS1S2VasMt5Ui
         TazZfnakjwOWCQCqmZJEtF1Ub9UKVwo797RXXzZzD4Uo2r4RLSlGFaXNtJvJvT62ZZ87
         bGT5HxCxF6hc0h7G2nzqzALL1cp9rYIttOrlludECFw+2MamPRJlumIc1JsdDjqNjfcY
         1439FHewQ85f7muQ20DAwStMRScIER5f1p2w+waCdt3X+FGjRAWzSDl4SipMl9edAwCP
         psRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b="kD3/sLge";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020a0caa8e000000b0063cb1b4f795si2248325qvb.448.2023.07.28.09.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jul 2023 09:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b="kD3/sLge";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qPPxi-0004sn-IM; Fri, 28 Jul 2023 12:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qPPxh-0004sA-7b
 for qemu-devel@nongnu.org; Fri, 28 Jul 2023 12:05:05 -0400
Received: from mail-4317.proton.ch ([185.70.43.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qPPxe-0004NM-VA
 for qemu-devel@nongnu.org; Fri, 28 Jul 2023 12:05:04 -0400
Date: Fri, 28 Jul 2023 16:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690560300; x=1690819500;
 bh=zTjLq+zc91w1jiR1LPwIgyvKj+dT7Pr54R8PgUtkI0A=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=kD3/sLgeNbtK+qZ7wfsRkxWl6CK9ROeLmmOU37tRXlztnFTgfFxi/bzgnSxfWLoIM
 U7KgNXa/zq+uzPb0Est8/LLWylJ5FLe/b6h/r3h/dl/L1i2Q0nMd0GjFTPYLzwcrXc
 O1ShU+QHpumMGYKJ2Vab8uxT2y5GqQ3oN4KWNtPWSzW9CL+sVASMyLuuQSlsZSyxk5
 nswFQbQrSacArTpab/coLAditxadWEDvWXve0g1SvMgLm3mw7jG8o7fMsG9vSsQKYC
 elrjD9lhoJUeWDbI7Ow9i1IK6VcS1hH7L59zQHkSyZNYvRKWxtiN5LKgV4k8g6f/ZI
 B/A2kiC5r9SmA==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH v3 1/6] hw/gpio/nrf51: implement DETECT signal
Message-ID: <20230728160324.1159090-2-chris@laplante.io>
In-Reply-To: <20230728160324.1159090-1-chris@laplante.io>
References: <20230728160324.1159090-1-chris@laplante.io>
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
X-TUID: /GDz07HI6pQX

Implement nRF51 DETECT signal in the GPIO peripheral.

The reference manual makes mention of a per-pin DETECT signal, but these
are not exposed to the user. See https://devzone.nordicsemi.com/f/nordic-q-=
a/39858/gpio-per-pin-detect-signal-available
for more information. Currently, I don't see a reason to model these.

Signed-off-by: Chris Laplante <chris@laplante.io>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/nrf51_gpio.c         | 14 +++++++++++++-
 include/hw/gpio/nrf51_gpio.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

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
2.41.0


