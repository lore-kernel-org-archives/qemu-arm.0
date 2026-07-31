Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936A2C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:26:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmJK-0001jE-7Q; Fri, 31 Jul 2026 08:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmJI-0001iu-Ik
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:25:56 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmJH-0007Tt-5U
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:25:56 -0400
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09aaso953400f8f.3
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500754; x=1786105554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9Rx1so6O2DvHoxNj8RGDiYjwjmDl40dAURIIyBXbKtg=;
 b=a/iVWvE1qCymgZFNJXg1hzmrLcvXi/AdhGqxZd6MyIpp6tw+kzFb7nkf1lCWVpDzjv
 736dUYQAajp1AXMWQ0hbr3XQHFW8YMKAL9xGEysm+qd01C9/9YfJQqpz6T7H/mnUpvxB
 +A2DYr2+VV8bTA+BTJo4oCrA/WeFLBkrR3dXw/tzvthOMbXGT+W34Alc5VT+EoZd+Y0B
 5B5e6mnLPzz94xsJ7aCqOlAQxWkG8gx6YzfGu/FoUfjtX/aEdX6Y/HSQQj8/Lp0vh0M5
 q8KwMucmwweayrYj/8EBI/XtZfWlhD5rPbNd9okyEfLqFHkIC9dSMhfKCrJrEXcnLWM4
 Yf+A==
X-Forwarded-Encrypted: i=1;
 AHgh+RplsVRSt6Jx/Ik6ET67dp2iVdcw9e3KC8MY0mmCd6SB2kpCYzpbcD80p/rDurxYTeb60GQcFFKLTg==@nongnu.org
X-Gm-Message-State: AOJu0Yy/tmuBGTrszs0Yz0377npi/RRKPIeKbQfg9lrR4M9i4yr+cTLP
 zAlXp2LumkrxV5ydttMH2HilMzETdXf/EJrwRuP5tMcTSKRL8wfoF6kz
X-Gm-Gg: AR+sD11p34KHgy39I6HfyYupe2sflhryXrE4O8vATOqqjr0lPw3Z2Ow2lprvDq+pJd0
 PbTdqAplg89VsD2RE4/2p2AGpnrVJ5ARH1ISVABQjGJUBrEqtm6lF64iEakXBomdJvGlS7K7znr
 e32YdOHYss3fAlECBVvbmJl/xYvlz9mOU1AJvrhIxxXjKp7jcCqhXo7P5VQIoDkt9DXaeJLU14h
 Ar4bHd9yOrw4KF9fykKBqdpB5brBpmNwTv1y5oAXH+MiZFQ0C2kHLWMLqBRO5II1KSGnxvUg36r
 Y+GXWpK28nwPNMpUWiIvJ+sW0bHG3Q4Y2yEQ2gB1MkAtjKA4B6a/OpZKJtU2Qe/mRSBDLlB+svN
 9RvK7F7RBREDW1Fan576aZs/g4aKQd/EkNo9aQFJOliRxN7/z3FsH5dgVg42iauqbvwYce3dHB6
 C4Xic4nXHLW4SR3yYrMZob3NBgqnbcc0tdMLYzaw3xKTeu0Thjn+sW475sHiTkXQY8+16vGvZ3g
 xw0JIUTBRmx9u+9rqc5G8qQViJFPYf/LAOa
X-Received: by 2002:a05:6000:2c02:b0:475:f0f0:9ef7 with SMTP id
 ffacd0b85a97d-47fd2b653e6mr4749189f8f.60.1785500753574; 
 Fri, 31 Jul 2026 05:25:53 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456a6d7sm4455881f8f.19.2026.07.31.05.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:25:53 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:01 +0200
Subject: [PATCH v2 02/25] hw/sensor: tmp105: name the parent object field
 parent_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-2-1266926ba769@free.fr>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494707; l=2294;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=IPpKdB4GNfibCBuZaz5CjB0TPUppqW5ZDDXX0F0+Glo=;
 b=eZW/p0A+N6UUAczLR7SIkQA4mEdwYgg4QdPiKGpwSCI4ay9LnsvtdaVbJEi9mxOdIgLtkyCRk
 Fpu/jwFsk6IAoBWndOiQz8363WM7HDhwsW8sCaS+1QqK7u3z2Shr5Ty
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.53; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f53.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

QEMU coding conventions expect the embedded parent object of a QOM type
to be named parent_obj. Rename the TMP105State I2CSlave member
accordingly and update its references; the change is purely cosmetic.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp105.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
index 6069c0905d..aabeb34f08 100644
--- a/hw/sensor/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -42,7 +42,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(TMP105State, TMP105)
  */
 struct TMP105State {
     /*< private >*/
-    I2CSlave i2c;
+    I2CSlave parent_obj;
     /*< public >*/
 
     uint8_t len;
@@ -187,12 +187,12 @@ static void tmp105_read(TMP105State *s)
         break;
     }
 
-    trace_tmp105_read(s->i2c.address, s->pointer);
+    trace_tmp105_read(s->parent_obj.address, s->pointer);
 }
 
 static void tmp105_write(TMP105State *s)
 {
-    trace_tmp105_write(s->i2c.address, s->pointer);
+    trace_tmp105_write(s->parent_obj.address, s->pointer);
 
     switch (s->pointer & 3) {
     case TMP105_REG_TEMPERATURE:
@@ -200,7 +200,7 @@ static void tmp105_write(TMP105State *s)
 
     case TMP105_REG_CONFIG:
         if (FIELD_EX8(s->buf[0] & ~s->config, CONFIG, SHUTDOWN_MODE)) {
-            trace_tmp105_write_shutdown(s->i2c.address);
+            trace_tmp105_write_shutdown(s->parent_obj.address);
         }
         s->config = FIELD_DP8(s->buf[0], CONFIG, ONE_SHOT, 0);
         s->faults = tmp105_faultq[FIELD_EX8(s->config, CONFIG, FAULT_QUEUE)];
@@ -305,7 +305,7 @@ static const VMStateDescription vmstate_tmp105 = {
         VMSTATE_INT16(temperature, TMP105State),
         VMSTATE_INT16_ARRAY(limit, TMP105State, 2),
         VMSTATE_UINT8(alarm, TMP105State),
-        VMSTATE_I2C_SLAVE(i2c, TMP105State),
+        VMSTATE_I2C_SLAVE(parent_obj, TMP105State),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription * const []) {
@@ -338,7 +338,7 @@ static void tmp105_realize(DeviceState *dev, Error **errp)
 
     qdev_init_gpio_out(&i2c->qdev, &s->pin, 1);
 
-    tmp105_reset(&s->i2c);
+    tmp105_reset(&s->parent_obj);
 }
 
 static void tmp105_initfn(Object *obj)

-- 
2.50.1


