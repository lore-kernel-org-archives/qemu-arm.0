Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEFBCCA463
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 15:10:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHN66-0005hs-Vi; Thu, 15 Oct 2026 11:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN65-0005hR-1U
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:10:21 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN62-0001e4-5o
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:10:20 -0400
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so3482081f8f.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 08:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792077017; x=1792681817;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DrWxbSnsvaHk4FolD7xYhC/5nO5JDheWb9wR5efBY2k=;
 b=C6X0Jz1+ItvRHQ9Bu8LNjvp9yXsj/52EVM8aaweqtI2NlJy1ynnjaEv5u+W8hRKquR
 HL4iIuPt4G/LGe1s/ZgYTtJISv3O6v0W5G4Aw8hIGt5HUTCZmNHZ8E397EIixzKMFYCL
 OaDzRXjNsu4DwBwL2c2jUhWAQ+RYisqtOnuPy+99oe+87vAiSy/dmE0can/jHCA/B7d3
 4VYUiHbA9AOpYuGCZoAjZW2+4zhWQhBn9GfhqCZzl/JX9bXjZvM/VmsswXQWLNp8Bsrz
 Eq9s1KwBKyNzCYlUnQsXxvJFG7jh36Zs4R3N11ni4Kv2feBXdFeHf59N90eRwhuWOyBZ
 Lepg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhAUrdGWsQKOJEfYcaZb4hpFEGkIm29A+Eh2wogMYj+h/DXgeW8nyZ/TOl3Y2gHnN4yaJ2M+MCbA==@nongnu.org
X-Gm-Message-State: AFq9FYLhvZ4vaOjw/GqIei68dmib0QzQiagJgKaOnA7v4Rn2VWBcwxUz
 IzkacooM8rl3y6x3QIcrTFBSkS/2R/RbvaLzhWc3GyAQPO1yfoP0SLg9
X-Gm-Gg: AYBFou2MrbFgCgfs99+qDo+PpHpt6Gx4eJIuJ6lTBWd5oOG2U4RzwgafPVF3lOqyV02
 VM37f20Uevc90/ohe+EQN/ko8fC0GFMIaZMp6s+mVPr60wFd+SEN7psmMxS8Svx6rmba69iSybL
 bfV9oYUAmGP6ehFNxoeroePnR9Lan7qMwYxAmPvIOExDtY7k0oWDMt2/a5db5Q4PJIWp4tYnUj/
 CLNK5Jgwjaijq3gzrjEYY0ZYwxYt5bDh5h9rVekDoHBiXX+Cqdi4A9pw0NMcxU160BG9TfvVUmH
 1QiZSz8K8hPp0WaQT+n4/SX+XGQwjXRlrdK0nluHa06S3GVbGUvnMVRKTj4O5b94UnzSVjugzlt
 I/x1kX2NlAn0Ib89MU79w8t7fH+gMcoLfi+CLC2lmt4Gfg1Pl2NG50Ez+7JqWl+O/9Q4rTXYrDZ
 IV1UDIjLkxAQic6Nw33uqvwnVw+VMTQ1n3hXoK8Y7E+CLFoam0gKLBcYHQ9bOViI+varp5wnNWj
 siSl8tjlh/dlVXue9q90QNR0WclQ72WWgKinsakuYl3JVA+PjsubfoX
X-Received: by 2002:a05:6000:290f:b0:48d:f485:5f34 with SMTP id
 ffacd0b85a97d-48df4855fbfmr5188731f8f.45.1792077016245; 
 Thu, 15 Oct 2026 08:10:16 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48defca4013sm9546455f8f.9.2026.10.15.08.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 08:10:15 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:57:42 +0200
Subject: [PATCH 04/22] hw/sensor: tmp421: model device variants with a
 class descriptor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-clemente-v1-4-bf591886b5b6@free.fr>
References: <20261015-bmc-clemente-v1-0-bf591886b5b6@free.fr>
In-Reply-To: <20261015-bmc-clemente-v1-0-bf591886b5b6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792065465; l=4905;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=nYz/UVk+7v4ORl7v0nKTPKyz2xEqXKmkO03V/LuED0w=;
 b=lHK58tIcIUrhEryl11iCJpmtCXq0KyJvgFDG2jm21GX8BmIYvGomljYK4GFTqHVTXU7FxtNlH
 2KabCzGnjO/ASoBs8smE7id2Fbx3LYtbE2GBMlPY8ESAAUpu6Ciyj04
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f43.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
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

Replace the ad-hoc DeviceInfo table and its manual type-registration
loop with per-variant fields on the device class, set by a dedicated
class_init for each part and registered through DEFINE_TYPES. This
drops the abstract base type in favour of the TMP421 acting as the base
for its TMP422/TMP423 supersets.

The three instantiable type names are unchanged, but TYPE_TMP421 now
spells "tmp421" rather than the abstract "tmp421-generic", which no
longer exists, and a TMP421 cast now succeeds for the two supersets.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c | 98 +++++++++++++++++++++++++-----------------------------
 1 file changed, 46 insertions(+), 52 deletions(-)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index a9d15601cb..7f0e3b3214 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -38,17 +38,6 @@
 #define TMP422_DEVICE_ID                0x22
 #define TMP423_DEVICE_ID                0x23
 
-typedef struct DeviceInfo {
-    int model;
-    const char *name;
-} DeviceInfo;
-
-static const DeviceInfo devices[] = {
-    { TMP421_DEVICE_ID, "tmp421" },
-    { TMP422_DEVICE_ID, "tmp422" },
-    { TMP423_DEVICE_ID, "tmp423" },
-};
-
 struct TMP421State {
     /*< private >*/
     I2CSlave parent_obj;
@@ -68,10 +57,14 @@ struct TMP421State {
 
 struct TMP421Class {
     I2CSlaveClass parent_class;
-    const DeviceInfo *dev;
+
+    uint8_t device_id;
+    uint8_t config2_reset;
 };
 
-#define TYPE_TMP421 "tmp421-generic"
+#define TYPE_TMP421 "tmp421"
+#define TYPE_TMP422 "tmp422"
+#define TYPE_TMP423 "tmp423"
 OBJECT_DECLARE_TYPE(TMP421State, TMP421Class, TMP421)
 
 
@@ -177,7 +170,7 @@ static void tmp421_read(TMP421State *s)
         s->buf[s->len++] = TMP421_MANUFACTURER_ID;
         break;
     case TMP421_DEVICE_ID_REG:
-        s->buf[s->len++] = sc->dev->model;
+        s->buf[s->len++] = sc->device_id;
         break;
     case TMP421_CONFIG_REG_1:
         s->buf[s->len++] = s->config[0];
@@ -313,20 +306,7 @@ static void tmp421_reset(TMP421State *s)
      */
     s->pointer = 0;
     s->config[0] = 0;
-
-    /* resistance correction and channel enablement */
-    switch (sc->dev->model) {
-    case TMP421_DEVICE_ID:
-        s->config[1] = 0x1c;
-        break;
-    case TMP422_DEVICE_ID:
-        s->config[1] = 0x3c;
-        break;
-    case TMP423_DEVICE_ID:
-        s->config[1] = 0x7c;
-        break;
-    }
-
+    s->config[1] = sc->config2_reset;
     s->rate = 0x7;       /* 8Hz */
     s->status = 0;
 }
@@ -348,7 +328,9 @@ static void tmp421_class_init(ObjectClass *klass, const void *data)
     k->send = tmp421_tx;
     rc->phases.hold = tmp421_reset_hold;
     dc->vmsd = &vmstate_tmp421;
-    sc->dev = (DeviceInfo *) data;
+
+    sc->device_id = TMP421_DEVICE_ID;
+    sc->config2_reset = 0x1c;
 
     object_class_property_add(klass, "temperature0", "int",
                               tmp421_get_temperature,
@@ -364,28 +346,40 @@ static void tmp421_class_init(ObjectClass *klass, const void *data)
                               tmp421_set_temperature, NULL, NULL);
 }
 
-static const TypeInfo tmp421_info = {
-    .name          = TYPE_TMP421,
-    .parent        = TYPE_I2C_SLAVE,
-    .instance_size = sizeof(TMP421State),
-    .class_size    = sizeof(TMP421Class),
-    .abstract      = true,
+static void tmp422_class_init(ObjectClass *klass, const void *data)
+{
+    TMP421Class *sc = TMP421_CLASS(klass);
+
+    sc->device_id = TMP422_DEVICE_ID;
+    sc->config2_reset = 0x3c;
+}
+
+static void tmp423_class_init(ObjectClass *klass, const void *data)
+{
+    TMP421Class *sc = TMP421_CLASS(klass);
+
+    sc->device_id = TMP423_DEVICE_ID;
+    sc->config2_reset = 0x7c;
+}
+
+static const TypeInfo tmp421_types[] = {
+    {
+        .name          = TYPE_TMP421,
+        .parent        = TYPE_I2C_SLAVE,
+        .instance_size = sizeof(TMP421State),
+        .class_size    = sizeof(TMP421Class),
+        .class_init    = tmp421_class_init,
+    },
+    {
+        .name          = TYPE_TMP422,
+        .parent        = TYPE_TMP421,
+        .class_init    = tmp422_class_init,
+    },
+    {
+        .name          = TYPE_TMP423,
+        .parent        = TYPE_TMP421,
+        .class_init    = tmp423_class_init,
+    },
 };
 
-static void tmp421_register_types(void)
-{
-    int i;
-
-    type_register_static(&tmp421_info);
-    for (i = 0; i < ARRAY_SIZE(devices); ++i) {
-        TypeInfo ti = {
-            .name       = devices[i].name,
-            .parent     = TYPE_TMP421,
-            .class_init = tmp421_class_init,
-            .class_data = &devices[i],
-        };
-        type_register_static(&ti);
-    }
-}
-
-type_init(tmp421_register_types)
+DEFINE_TYPES(tmp421_types)

-- 
2.53.0-Meta


