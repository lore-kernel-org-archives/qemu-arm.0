Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E092FC53219
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:30:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6Eb-0003ir-2n; Wed, 29 Jul 2026 11:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6EZ-0003er-5R
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:30:15 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6EW-0008Kc-HR
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:30:14 -0400
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49555a0e68bso5839055e9.2
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785339006; x=1785943806;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2NJzAdGamh6q0UofkS1blWw4H+aSbe43q4hTcBp6DSQ=;
 b=GVK+j1BQOFFgxBDQMIMs7pG+1+NIMNTDQsJ8BvYrqXjlHSWLPYnlG2VBNoE5cWgHH0
 b2/9fZycaE7zPA9OUe48UTQPVlY6RKxYOMbqMsquxFyMOq/rBMf3B9tR8kz2UNTIMBhX
 A7DiWT2rQKNXnTkeV37s54iSSApH2h24Y1fIaZaP1VhXNsa+YS6cbghUca+rz/pcJ/Qb
 2W3udLCtKC3jXob8eZewZ+w7qCSmWJna+iahQVRMi8YgKcTuSvyrwHAP6nmeqhPtz52O
 EAux1U+tSfDkq2mQzGu6SBZg6pvuDFEUicP8jZPEzMnMn1Z/TwpgllQYA08u3LMar0WT
 nZzQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrs0Xd74YcCWOi0oyyeW45lgTTiNmaJiwn04iEBa/tSE+Iy4LK+nj4sKcaz/3wTKklow7x2q5quVw==@nongnu.org
X-Gm-Message-State: AOJu0Yz1LqeW8Nc11TkMJ/BKBKDYZ3nUx+ujmZtF7dJZlEsuCexBqqeV
 j19QPJ2AKMQmksS5ny37xc0vjhewseQ04qORGZ7BFB3jakfyrMCA9p7f
X-Gm-Gg: AR+sD124gM/MwT1mcb6RMC2sqUgKse9uCB3kE8sIXnyJuyzPbW8m0ZV4ib6b2GJeAHV
 PyN4FG4gUvzLP1Lh+VdOhHJXVmuHmxHsuBa/JR8s2VVF3ypV4A5HTR2hEt+oZN2KS8wCOtqByqi
 5s0lsU3hUI6ObhyIVkI8IEWmJZm9VUcSVU5y3URySl3MoOjOg98/e15K4qVBa9AGF1cZLYGAkOq
 Js9eCXFAPnQramX8/RlrNmYXIicZJ7ihYr81LB7fGgKfHq83gZiGwvAkJLt1NaOyEXNhF7vDlrv
 F281OS56BiWaFd8c6+3Jdx+cf6KYQXODBHdKvmt+80kRtg3nqBmHdvYn2C+YNqkQXlmm4wOAWHP
 fvU2iRBRXoP5bCdOmg/IB4XjubwCAT7mzcrGODX/AdA1bVAOW924MvN4PvkGGXyP8y29JbK+SEZ
 BAc25BoqMDQ9xbELlfeVW4K6P/ctbJkF6rxypVVh8EnELAR8xmVfl9DEAJfElZGjp7diHNgOJ67
 QQmXHyZq+4UdgEbdMtUlBgRrkX4qf+Dxzkr
X-Received: by 2002:a05:600c:81c8:b0:495:401d:9f4f with SMTP id
 5b1f17b1804b1-496c65764e0mr81396345e9.25.1785339006277; 
 Wed, 29 Jul 2026 08:30:06 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6aa3935sm9202485f8f.4.2026.07.29.08.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:30:05 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:12:43 +0200
Subject: [PATCH 07/25] hw/sensor: tmp105: add TMP75, TMP175 and LM75B variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-7-c8f9a8d101f6@free.fr>
References: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
In-Reply-To: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337963; l=11789;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=L67/MdlXgO5Di25siwtmOLs/rlQN0tXp5n3l9YtfUhA=;
 b=9098N82rvqT/Eev7J+05+WlgNRCGk7PBnrH5qj7rxchuGr63xqOSrsln89uvGKOGDldswFpTT
 PstM+YevBg4Bhon81exesWgyVXyNDGn1mEtXhtyOurk17ZBRCptxX2E
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

The TI TMP75/TMP175 and the NXP LM75B share the TMP105 register map and
control semantics, differing only in a few details. Model them as
variants of the TMP105, parameterised by a small per-type class
descriptor covering the fault-queue depths, the writable config bits,
the converter resolution, the set-point masks and the TMP75's
alert-clear on thermostat-mode change.

The variant is class data, not migrated state, so the wire format is
unchanged and all variants share the existing vmstate.

While here, align the shared shutdown handling with the hardware:
entering shutdown now clears the ALERT/OS output in interrupt mode,
correcting the base TMP105 as well.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp105.c         | 171 +++++++++++++++++++++++++++++++++++++--------
 include/hw/sensor/tmp105.h |   6 +-
 2 files changed, 147 insertions(+), 30 deletions(-)

diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
index fefa661711..69ade2013d 100644
--- a/hw/sensor/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -1,5 +1,5 @@
 /*
- * Texas Instruments TMP105 temperature sensor.
+ * Texas Instruments TMP105/TMP75/TMP175/LM75B temperature sensor.
  *
  * Copyright (C) 2008 Nokia Corporation
  * Written by Andrzej Zaborowski <andrew@openedhand.com>
@@ -16,6 +16,13 @@
  *
  * You should have received a copy of the GNU General Public License along
  * with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ * Limitations:
+ * - The SMBus Alert Response Address protocol and the general-call commands
+ *   are not implemented.
+ * - The over-limit comparison uses the full 8.8 fixed-point temperature and a
+ *   ">=" boundary for every variant. The LM75B's 9-bit comparison quantisation
+ *   and strict-exceed boundary are therefore only approximated.
  */
 
 #include "qemu/osdep.h"
@@ -31,15 +38,29 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-OBJECT_DECLARE_SIMPLE_TYPE(TMP105State, TMP105)
+OBJECT_DECLARE_TYPE(TMP105State, TMP105Class, TMP105)
 
 /**
- * TMP105State:
- * @config: Bits 5 and 6 (value 32 and 64) determine the precision of the
- * temperature. See Table 8 in the data sheet.
+ * TMP105Variant:
+ * Per-device-model parameters. The TMP105, TMP75, TMP175 and LM75B share the
+ * same register map and control semantics; they differ only in a handful of
+ * details captured here.
  *
- * @see_also: http://www.ti.com/lit/gpn/tmp105
+ * @faultq: fault-queue length table selected by Config bits
+ * @config_wmask: writable Config bits. The LM75B has no resolution (R1:R0) or
+ * one-shot (OS) bits.
+ * @fixed_res: converter resolution field pinned by the device, or -1 when it is
+ * software-selectable.
+ * @limit_lsb_mask: low-byte mask applied to the T_LOW/T_HIGH limit registers.
  */
+typedef struct TMP105Variant {
+    const uint8_t *faultq;
+    uint8_t config_wmask;
+    int8_t fixed_res;
+    uint8_t limit_lsb_mask;
+    bool tm_change_clears_alert;
+} TMP105Variant;
+
 struct TMP105State {
     /*< private >*/
     I2CSlave parent_obj;
@@ -53,7 +74,7 @@ struct TMP105State {
     uint8_t config;
     int16_t temperature;
     int16_t limit[2];
-    int faults;
+    uint8_t faults;
     uint8_t fault_count;
     uint8_t alarm;
     /*
@@ -65,6 +86,11 @@ struct TMP105State {
     bool detect_falling;
 };
 
+struct TMP105Class {
+    I2CSlaveClass parent_class;
+    const TMP105Variant *var;
+};
+
 FIELD(CONFIG, SHUTDOWN_MODE,        0, 1)
 FIELD(CONFIG, THERMOSTAT_MODE,      1, 1)
 FIELD(CONFIG, POLARITY,             2, 1)
@@ -152,10 +178,11 @@ static void tmp105_set_temperature(Object *obj, Visitor *v, const char *name,
     tmp105_alarm_update(s, false);
 }
 
-static const int tmp105_faultq[4] = { 1, 2, 4, 6 };
-
 static void tmp105_read(TMP105State *s)
 {
+    const TMP105Variant *var = TMP105_GET_CLASS(s)->var;
+    int res;
+
     s->len = 0;
 
     if (FIELD_EX8(s->config, CONFIG, THERMOSTAT_MODE)) {
@@ -165,9 +192,11 @@ static void tmp105_read(TMP105State *s)
 
     switch (s->pointer & 3) {
     case TMP105_REG_TEMPERATURE:
+        res = var->fixed_res >= 0 ? var->fixed_res :
+              FIELD_EX8(s->config, CONFIG, CONVERTER_RESOLUTION);
         s->buf[s->len++] = (((uint16_t) s->temperature) >> 8);
         s->buf[s->len++] = (((uint16_t) s->temperature) >> 0) &
-                (0xf0 << (FIELD_EX8(~s->config, CONFIG, CONVERTER_RESOLUTION)));
+                (0xf0 << (3 - res));
         break;
 
     case TMP105_REG_CONFIG:
@@ -190,6 +219,10 @@ static void tmp105_read(TMP105State *s)
 
 static void tmp105_write(TMP105State *s)
 {
+    const TMP105Variant *var = TMP105_GET_CLASS(s)->var;
+    uint8_t config, one_shot;
+    bool waking;
+
     trace_tmp105_write(s->parent_obj.address, s->pointer);
 
     switch (s->pointer & 3) {
@@ -197,14 +230,27 @@ static void tmp105_write(TMP105State *s)
         break;
 
     case TMP105_REG_CONFIG:
-        if (FIELD_EX8(s->buf[0] & ~s->config, CONFIG, SHUTDOWN_MODE)) {
+        config = s->buf[0] & var->config_wmask;
+        if (FIELD_EX8(config & ~s->config, CONFIG, SHUTDOWN_MODE)) {
             trace_tmp105_write_shutdown(s->parent_obj.address);
+            if (FIELD_EX8(config, CONFIG, THERMOSTAT_MODE)) {
+                s->alarm = 0;
+            }
         }
-        s->config = FIELD_DP8(s->buf[0], CONFIG, ONE_SHOT, 0);
-        s->faults = tmp105_faultq[FIELD_EX8(s->config, CONFIG, FAULT_QUEUE)];
-        if (FIELD_EX8(s->buf[0], CONFIG, ONE_SHOT) &&
-            FIELD_EX8(s->config, CONFIG, SHUTDOWN_MODE)) {
+        if (var->tm_change_clears_alert &&
+            FIELD_EX8(config ^ s->config, CONFIG, THERMOSTAT_MODE)) {
+            s->alarm = 0;
+            s->fault_count = 0;
+            s->detect_falling = false;
+        }
+        waking = FIELD_EX8(s->config & ~config, CONFIG, SHUTDOWN_MODE);
+        one_shot = FIELD_EX8(config, CONFIG, ONE_SHOT);
+        s->config = FIELD_DP8(config, CONFIG, ONE_SHOT, 0);
+        s->faults = var->faultq[FIELD_EX8(s->config, CONFIG, FAULT_QUEUE)];
+        if (one_shot && FIELD_EX8(s->config, CONFIG, SHUTDOWN_MODE)) {
             tmp105_alarm_update(s, true);
+        } else if (waking) {
+            tmp105_alarm_update(s, false);
         } else {
             tmp105_interrupt_update(s);
         }
@@ -214,7 +260,8 @@ static void tmp105_write(TMP105State *s)
     case TMP105_REG_T_HIGH:
         if (s->len >= 3) {
             s->limit[s->pointer & 1] = (int16_t)
-                    ((((uint16_t) s->buf[0]) << 8) | (s->buf[1] & 0xf0));
+                    ((((uint16_t) s->buf[0]) << 8) |
+                     (s->buf[1] & var->limit_lsb_mask));
         }
         tmp105_interrupt_update(s);
         break;
@@ -265,8 +312,9 @@ static int tmp105_event(I2CSlave *i2c, enum i2c_event event)
 static int tmp105_post_load(void *opaque, int version_id)
 {
     TMP105State *s = opaque;
+    const TMP105Variant *var = TMP105_GET_CLASS(s)->var;
 
-    s->faults = tmp105_faultq[FIELD_EX8(s->config, CONFIG, FAULT_QUEUE)];
+    s->faults = var->faultq[FIELD_EX8(s->config, CONFIG, FAULT_QUEUE)];
 
     tmp105_interrupt_update(s);
     return 0;
@@ -339,11 +387,12 @@ static const VMStateDescription vmstate_tmp105 = {
 static void tmp105_reset_hold(Object *obj, ResetType type)
 {
     TMP105State *s = TMP105(obj);
+    const TMP105Variant *var = TMP105_GET_CLASS(s)->var;
 
     s->temperature = 0;
     s->pointer = 0;
     s->config = 0;
-    s->faults = tmp105_faultq[FIELD_EX8(s->config, CONFIG, FAULT_QUEUE)];
+    s->faults = var->faultq[FIELD_EX8(s->config, CONFIG, FAULT_QUEUE)];
     s->fault_count = 0;
     s->alarm = 0;
     s->detect_falling = false;
@@ -376,6 +425,7 @@ static void tmp105_class_init(ObjectClass *klass, const void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
+    TMP105Class *tc = TMP105_CLASS(klass);
 
     dc->realize = tmp105_realize;
     k->event = tmp105_event;
@@ -383,19 +433,82 @@ static void tmp105_class_init(ObjectClass *klass, const void *data)
     k->send = tmp105_tx;
     rc->phases.hold = tmp105_reset_hold;
     dc->vmsd = &vmstate_tmp105;
+    tc->var = data;
 }
 
-static const TypeInfo tmp105_info = {
-    .name          = TYPE_TMP105,
-    .parent        = TYPE_I2C_SLAVE,
-    .instance_size = sizeof(TMP105State),
-    .instance_init = tmp105_initfn,
-    .class_init    = tmp105_class_init,
+/*
+ * Fault-queue length selected by Config F1:F0. Row 0 (1/2/4/6) is used by the
+ * TMP105, TMP175 and LM75B; row 1 (1/2/3/4) by the TMP75.
+ */
+static const uint8_t tmp105_faultq[][4] = {
+    { 1, 2, 4, 6 },
+    { 1, 2, 3, 4 },
 };
 
-static void tmp105_register_types(void)
-{
-    type_register_static(&tmp105_info);
-}
+/* The F1:F0 field must never index past a fault-queue table row. */
+QEMU_BUILD_BUG_ON((1 << R_CONFIG_FAULT_QUEUE_LENGTH) - 1 >=
+                  ARRAY_SIZE(tmp105_faultq[0]));
+
+static const TMP105Variant tmp105_variant = {
+    .faultq = tmp105_faultq[0],
+    .config_wmask = 0xff,
+    .fixed_res = -1,
+    .limit_lsb_mask = 0xf0,
+    .tm_change_clears_alert = false,
+};
+
+static const TMP105Variant tmp175_variant = {
+    .faultq = tmp105_faultq[0],
+    .config_wmask = 0xff,
+    .fixed_res = -1,
+    .limit_lsb_mask = 0xf0,
+    .tm_change_clears_alert = false,
+};
+
+static const TMP105Variant tmp75_variant = {
+    .faultq = tmp105_faultq[1],
+    .config_wmask = 0xff,
+    .fixed_res = -1,
+    .limit_lsb_mask = 0xf0,
+    .tm_change_clears_alert = true,
+};
+
+static const TMP105Variant lm75b_variant = {
+    .faultq = tmp105_faultq[0],
+    .config_wmask = 0x1f,    /* R1:R0 and OS are reserved */
+    .fixed_res = 2,          /* fixed 11-bit resolution, 0.125 C */
+    .limit_lsb_mask = 0x80,  /* 9-bit limits, 0.5 C */
+    .tm_change_clears_alert = false,
+};
+
+static const TypeInfo tmp105_types[] = {
+    {
+        .name          = TYPE_TMP105,
+        .parent        = TYPE_I2C_SLAVE,
+        .instance_size = sizeof(TMP105State),
+        .class_size    = sizeof(TMP105Class),
+        .instance_init = tmp105_initfn,
+        .class_init    = tmp105_class_init,
+        .class_data    = &tmp105_variant,
+    },
+    {
+        .name          = TYPE_TMP175,
+        .parent        = TYPE_TMP105,
+        .class_init    = tmp105_class_init,
+        .class_data    = &tmp175_variant,
+    },
+    {
+        .name          = TYPE_TMP75,
+        .parent        = TYPE_TMP105,
+        .class_init    = tmp105_class_init,
+        .class_data    = &tmp75_variant,
+    },
+    {
+        .name          = TYPE_LM75B,
+        .parent        = TYPE_TMP105,
+        .class_init    = tmp105_class_init,
+        .class_data    = &lm75b_variant,
+    },
+};
 
-type_init(tmp105_register_types)
+DEFINE_TYPES(tmp105_types)
diff --git a/include/hw/sensor/tmp105.h b/include/hw/sensor/tmp105.h
index daece592e9..0698aeead7 100644
--- a/include/hw/sensor/tmp105.h
+++ b/include/hw/sensor/tmp105.h
@@ -1,5 +1,5 @@
 /*
- * Texas Instruments TMP105 Temperature Sensor
+ * Texas Instruments TMP105/TMP75/TMP175/LM75B Temperature Sensor
  *
  * Browse the data sheet:
  *
@@ -14,6 +14,10 @@
 #ifndef HW_SENSOR_TMP105_H
 #define HW_SENSOR_TMP105_H
 
+/* TMP75, TMP175 and NXP LM75B are register-compatible with TMP105. */
 #define TYPE_TMP105 "tmp105"
+#define TYPE_TMP175 "tmp175"
+#define TYPE_TMP75  "tmp75"
+#define TYPE_LM75B  "lm75b"
 
 #endif

-- 
2.50.1


