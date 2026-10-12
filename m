Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA18ECA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:09:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHeD-000838-Ln; Mon, 12 Oct 2026 11:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHe1-00080e-4v
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:08:53 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHdy-0007KB-Bx
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:08:52 -0400
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so17416765e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817728; x=1792422528;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yoI5CWQNkKU3FBXCClJtroQLxmdLnKfTK0MOA70taBk=;
 b=LwZSJ8QK9iqZvI2dDPZVPIghXgnCKsvHouKq/Vlg9PCti953QDIsXoogbZ0zZbheCm
 aDmWt8ETWt7Gxx5EXihQiz6mUJoHLVipY/Fht1r5z8lmz4565PB4zY9AH9Q3IeTogdNs
 LxKlX/+MgIqkbjs/iRhJw9slMlqndPbAsiGAoP9XySJiDwVUtBW5fGSDOZB2O5UkTO8H
 OP67+OXA+Eg9Gs3tYroDYsx29yS5b5bacy3dAj0EyMfiOTZbSD69G752aDLhEcKaPsnX
 +eUHNu2A3VHBZPvFJh07cIdvwiXwv+6BEBQ/v77t43lNL49c3+NsuJSgpoPDmxrZiHRi
 n5cg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxEV2YCyTBbksHNpCIyRygXNowhUwaTMQsZuMFHxyZ/y3OZMchViPsVXKFis08GcImX9DGJbnHPlg==@nongnu.org
X-Gm-Message-State: AFq9FYLKY7Tk0HhZVijru0UIv0GLcFI/koRdb3eer2OiqQKygGKvukqY
 MA5/naGZIwDkFV87Ky1eO1qhUnvpyDcvCsLrP1FO5aGfYwRDgPCAnyFr
X-Gm-Gg: AYBFou2SVIm3qkLoqhjJbUoElgzNr3aMSerhMfoDVkWJFP/KKEbXFuuiL2wBIiqcMjQ
 tDWzCjwcl6glIBV1AWOW1vhD1HxtZ+IqBRKfnIIJaAd2RAV6ikiX9I02bNYm594oSQOhy9QyTUx
 6R89U7M8H+7QSTSvH+k9PRpNN/a//F52hNw84uRryMiaW2JAfvYZ5dAdv6fmYaHp/nnfHngRbhX
 TrPDM2f0XzTh4j2leoasigSEMdfXkZ8FYALfSxBgmhbrpygs3tDH2DgSA6ZvnCwigohKCUyvYwj
 vbN5LSN4v8N5V2Di8W9ZmwMMqcmGaiBHwj6jHAlkYbrn6x8IMInKXvVoVKJw1yYmHggGikAnBGD
 9tinJ/F9YNd+op11KrgCMlM+m/kcoByYiaxU3cxUWiCp3dfXNCy2usFiLaQ+RdOtUOQrTvYCXOX
 n1GX/uVgvYRtpoAFdEof5Jtj2GcQ1eMzNtTU0e1HyV/i4bVvHokIQGRdsVJJCIYU6QfxrDlKyko
 7s+lnfFHk2EeHs36UUEpldeylLYXEruS4oUcZDAkfpORg==
X-Received: by 2002:a05:600c:674a:b0:49f:f0bd:1e40 with SMTP id
 5b1f17b1804b1-4a18e4afe9cmr172116475e9.23.1791817727904; 
 Mon, 12 Oct 2026 08:08:47 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be8c5e7sm369203195e9.4.2026.10.12.08.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:08:47 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:09 +0200
Subject: [PATCH v2 16/50] hw/rtc: ds1338: add a persist-on-reset property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-16-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=2768;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=iRJ3rs2DSADN75Y/aKHhGRl/gUKlcklqtq6S9GY4iFg=;
 b=LDDgByaSsE/yCzMpiyeYGFE3fRE0Wq8PEfJurPiQ/qp7WDod40sbkL0nj7CsyRJxYzeRMsPnc
 OAA9dAKXSnzCjd9kplVbXmIQFhHqE/XjRIWRhoZEzBVB3DIGbnybUUO
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.53; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f53.google.com
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

A real RTC keeps counting across a reboot of the machine it sits in,
and its register file comes back with it. The model instead wiped the
registers on every reset and resynchronised the clock with the host.

Add a property selecting between the two. It defaults off, leaving
every board as it was.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index c5fc74e6ca..21deb94689 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -22,6 +22,7 @@
 #include "qemu/osdep.h"
 #include "hw/i2c/i2c.h"
 #include "hw/rtc/ds1338.h"
+#include "hw/core/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/bcd.h"
 #include "qom/object.h"
@@ -56,7 +57,8 @@ struct DS1338State {
     uint8_t nvram[NVRAM_SIZE];
     int32_t ptr;
     bool addr_byte;
-    bool osc_stopped;   /* oscillator halted: time is frozen */
+    bool osc_stopped;      /* oscillator halted: time is frozen */
+    bool persist_on_reset; /* keep the registers across a reset */
 };
 
 struct DS1338Class {
@@ -263,9 +265,8 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
     return 0;
 }
 
-static void ds1338_reset_hold(Object *obj, ResetType type)
+static void ds1338_power_on(DS1338State *s)
 {
-    DS1338State *s = DS1338(obj);
     DS1338Class *k = DS1338_GET_CLASS(s);
 
     /* The clock is running and synchronized with the host */
@@ -273,11 +274,29 @@ static void ds1338_reset_hold(Object *obj, ResetType type)
     s->wday_offset = 0;
     memset(s->nvram, 0, NVRAM_SIZE);
     s->nvram[k->ctrl_addr] = k->ctrl_reset;
+    s->osc_stopped = false;
+}
+
+static void ds1338_realize(DeviceState *dev, Error **errp)
+{
+    ds1338_power_on(DS1338(dev));
+}
+
+static void ds1338_reset_hold(Object *obj, ResetType type)
+{
+    DS1338State *s = DS1338(obj);
+
+    if (!s->persist_on_reset) {
+        ds1338_power_on(s);
+    }
     s->ptr = 0;
     s->addr_byte = false;
-    s->osc_stopped = false;
 }
 
+static const Property ds1338_properties[] = {
+    DEFINE_PROP_BOOL("persist-on-reset", DS1338State, persist_on_reset, false),
+};
+
 static void ds1338_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -289,6 +308,8 @@ static void ds1338_class_init(ObjectClass *klass, const void *data)
     k->recv = ds1338_recv;
     k->send = ds1338_send;
     rc->phases.hold = ds1338_reset_hold;
+    dc->realize = ds1338_realize;
+    device_class_set_props(dc, ds1338_properties);
     dc->desc = "DS1338 I2C RTC with 56-byte NV RAM";
     dc->vmsd = &vmstate_ds1338;
 

-- 
2.50.1


