Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B95B606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:29:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtlm-0006kY-8I; Thu, 05 Nov 2026 04:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtlY-0006ef-QL
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:17 -0500
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtlV-0006vJ-G1
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:16 -0500
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2e9d7791b00so13733985ad.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:28:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870892; x=1794475692;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=retw+hCi5vVKjipTQvsUltaajOcauTJ+Xp/W71jLDVc=;
 b=keJ/XVt2CiKXyYPkuJwNzjynMjomzdwJQ0msCfHYZGOw1dvpaH0/g/LHfsVwNjqGqX
 hCmDmb17Zlr+VAcXm8qjuxoTfJxg5QZ2Q+O8tkaPc2EakMfITtIzKTjSx2CTEQ0XxyCG
 I4ffQUtbhhTjmoLBOWT/BMhPryxRomIPY8PkrHWyoisjHYfpr+N87888e8fvBx6hcPO2
 rkpvjd4GCyV94RXsL3cNS7brF3EbXAPQQnGV6hxbO12VxbNdWI4j74a7fN3OgOQG+2Iu
 mu1pPKHmab4oq+y23Pv4/zm3gccWs8kcHu6QmctCLint6dRwmplmsJ01yaiwWlCzjGGU
 7ypw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz2xSJt4h4eRYPefI6Aq8fUW3HoYsifw7R/8didgn/IqFcuUAgqdbO6Ap5vqQO5J5YPW3CuI3DEfw==@nongnu.org
X-Gm-Message-State: APuU4Z/dttkHhiXcPlioUyLO6o7S/72+TcBmLfg34QtX+1MhuIFx8j8Z
 4AHRbJ1WuF2PrxTKFE6ynoCFf4NJo9Er9qCiW0fK3LFLT4H96YUnoKPx
X-Gm-Gg: AYBFou2quwMu4z6PbktaLEwEubRK03q6puHeWTWHeEQGkUnSa7vH9KcNOBx81XKzhwl
 n7gtbLLK572GS4sCv2loxj3Qu9oDoz30mZEs15SM7i25G8HXQ2ER5juHAYR/1OYZHjiuWTdxaJh
 K7SA1MqPnMsWR9ci1L6MhHabnKCjRnwAuWTs8Q9GDkpWK7UZ/zWJidqu3Hs1cTYzNPyhS7Vb1wm
 GNhlu0lBmeRj3kc8h5rr+OxJuMnqxOJSFsXAYgEbQU/JEQq791cDH03jhsyfBqrVBoiNCkb7pcB
 9Wo+RGgcv2VrgHzoFPxlyo6AWfYyPAPkQOmT9VKuMeqBxyKvrGZevu6XXtR1fFzEVz+5pXaiaHD
 jPBFSImTq+Szj5P34lw7GqNvueruWMuj8Zm5mL9W2k9iqXJxvsEcaigAiz9k235K9oghWMO2xI8
 ZsV97wYOdyuQDgYYIaf6Cz3VZTmaqRMxl80f8RFjcXW+3xO6SgCzsFnbguswxDcxwOUqk/oKyIL
 WuGqPqc8FRcbO/JU70PjqZ5acKy9pe1ZpEoToqJk73HKlo1Oi9pTk6YBWHCXcjmLwtSklduJM4x
 /0ep3vfdskHPGoPY7jLgCvzlIQ5wZNML/magqt7OVzvSkuKzT9N0HONwdfoTy7Yhj7iTjQ4QkO8
 9
X-Received: by 2002:a17:902:ce05:b0:2dd:ad73:5b6f with SMTP id
 d9443c01a7336-2eb364b55camr171857535ad.31.1793870891693; 
 Thu, 05 Nov 2026 01:28:11 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ed2c79ea15sm3709255ad.63.2026.11.05.01.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:28:11 -0800 (PST)
Date: Thu, 05 Nov 2026 17:25:42 +0800
Subject: [PATCH 03/16] hw/sensor: tmp421: implement Resettable reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-tmp421-v1-3-c46853f5e1f0@free.fr>
References: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
In-Reply-To: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, eblot@meta.com, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793870742; l=2741;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=jjLzkdYMOkO0VP5ki4S9XNixanshbfj1QWCH+5pzHwI=;
 b=0d1GjFHyw0hNWxqlmXuYkjR853Y2s95/pA0FYQQP9fymiJtvfp71ubFKf5/uLSIfbaaQ2imIj
 jbN+OcGdoIIBDWtuKclwNKFtNDTXCNRilAmcI0/g6sHdpLk/99BGruL
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.214.173; envelope-from=eblot.ml@gmail.com;
 helo=mail-pl1-f173.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wire the reset through the Resettable hold phase instead of only
calling it from realize, so bus and system resets re-initialise the
device. The measured temperatures are no longer cleared on reset: they
represent the physical input the ADC re-samples, and boards may preset
them before the machine-wide power-on reset.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index 55e261a090..4b93d42b14 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -225,7 +225,7 @@ static void tmp421_read(TMP421State *s)
     }
 }
 
-static void tmp421_reset(I2CSlave *i2c);
+static void tmp421_reset(TMP421State *s);
 
 static void tmp421_write(TMP421State *s)
 {
@@ -240,7 +240,7 @@ static void tmp421_write(TMP421State *s)
         s->config[1] = s->buf[0];
         break;
     case TMP421_RESET:
-        tmp421_reset(I2C_SLAVE(s));
+        tmp421_reset(s);
         break;
     }
 }
@@ -304,17 +304,18 @@ static const VMStateDescription vmstate_tmp421 = {
     }
 };
 
-static void tmp421_reset(I2CSlave *i2c)
+static void tmp421_reset(TMP421State *s)
 {
-    TMP421State *s = TMP421(i2c);
     TMP421Class *sc = TMP421_GET_CLASS(s);
 
-    memset(s->temperature, 0, sizeof(s->temperature));
+    /*
+     * The measured temperatures are not cleared: they model the physical
+     * input the ADC re-samples after reset, and boards may preset them.
+     */
     s->pointer = 0;
+    s->config[0] = 0;
 
-    s->config[0] = 0; /* TMP421_CONFIG_RANGE */
-
-     /* resistance correction and channel enablement */
+    /* resistance correction and channel enablement */
     switch (sc->dev->model) {
     case TMP421_DEVICE_ID:
         s->config[1] = 0x1c;
@@ -331,23 +332,22 @@ static void tmp421_reset(I2CSlave *i2c)
     s->status = 0;
 }
 
-static void tmp421_realize(DeviceState *dev, Error **errp)
+static void tmp421_reset_hold(Object *obj, ResetType type)
 {
-    TMP421State *s = TMP421(dev);
-
-    tmp421_reset(&s->parent_obj);
+    tmp421_reset(TMP421(obj));
 }
 
 static void tmp421_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     TMP421Class *sc = TMP421_CLASS(klass);
 
-    dc->realize = tmp421_realize;
     k->event = tmp421_event;
     k->recv = tmp421_rx;
     k->send = tmp421_tx;
+    rc->phases.hold = tmp421_reset_hold;
     dc->vmsd = &vmstate_tmp421;
     sc->dev = (DeviceInfo *) data;
 

-- 
2.53.0-Meta


