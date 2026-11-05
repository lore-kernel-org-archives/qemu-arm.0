Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A57606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:29:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtmG-00075y-Hv; Thu, 05 Nov 2026 04:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtm9-00070K-B8
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:54 -0500
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtm7-0006xq-9F
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:53 -0500
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-8a05effaf8dso1040620b3a.2
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870930; x=1794475730;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mKxKyo4fCuncIjIg3ptOGVyWIQnIG439vq+7oNa+8Mg=;
 b=rmkL1vVARcLDtsryVFwtc6GABA+5H+9K22E9tAFO6TbbKYwqQHODShFEJPeh3Mtanb
 omrS8iaD3g3Lruo20SkfAtCwLwODURJ1mP+HXqYtLf/qnlKEMoH4ZdrVsPfs53KEf6yp
 Nl63uBU5zCnkkE8ixGW4vyfJTaPswCLtxlbDR+Va3j7+ZiIquGK02Ig/+hKB4xNe35gu
 aCcvDiav/IRhshlOBdPM1JN3gAlGlr+OO5Bq3hWo/gkCBrL4d8do8SUD5f1OuNIMmLwl
 aNUrM2yXe6D18u0INf01lahB3siZXpHLu+TbbdQ58iUSMGG0I9FM3NChZfcLEOc1AET/
 hJ1w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxh8EVNoN8VPzYERzego7XduakeQ7bOV1YG+RKvbj2WcMds9+ORawcysmMSgfLflvosPBG82SLgHw==@nongnu.org
X-Gm-Message-State: APuU4Z/A/4IiPUh4f+PZvwwtMXfX2ObE2iI95DDtZuPSdy/iXUQb28Oq
 nRFuAblxyCMTGE3CkYg+wjQqTdO4pwVzdbj95i+GAd5qzmjBeWt9BQ2E
X-Gm-Gg: AYBFou12lOn5Ssj3ZL+kzTbUL3I/V+zTO3JylT/vyTUsL3ZwZnEIPeUaqSNGUBqNGK3
 pShyjHIcAvW30m+Y94m2vniwhJ2QHk1Jqo3EsHIu0BFixNgJoOptcQm+sNsyjkhNtDtMaT9yVwA
 UZkAAyMzRm0PPOEC6IILAu80bkiv7SMgUjJLnh6mhEG+25rwbjacwDQiaLbStzo30ViRI0xSYY3
 4YdfMfCm01eIbm8C9zm2/96h7/0zfAaDkWhu/iR4Yx+8+Mpb65raH5ZM+5jOrvmv+qjEMH3xcBO
 0c5yvuJ2/J5JbXV8nYaaxKN1BCuj08wXQpLLW5HFKr3RfbzOz0WCdgWQBcWByCGKLSHs4jXhLkH
 3E/tsYrwmrteVQKpTnkWTGoUmtjDfJucIkMPiDDt718k3hlc/xZxRYzy3FcDTYsegMUDacAq7uy
 D61RrmHQpjDcvwcS7Hu8+LRQ92k85e5SDW5HS/u/4Sxy34guDssLKdVWq2xic5M1K/VpkVY+ijM
 JqaFO4OK1GWXdPJr1ql6+QC0FGXLIcOwjT/vZfeg8Z71TDq1W0Hzhn9ymwO470aeKI72IBW3ZrS
 cmQ9fquNmyFjBEjzhiuktLIhqtT0xuUjJWA9CYvHyuJDgoXseHoKnBsryEf4L9uE7TYEAfPkD0h
 5
X-Received: by 2002:a05:6a00:2e8f:b0:8a0:1c79:b442 with SMTP id
 d2e1a72fcca58-8a9b69872fbmr16762945b3a.0.1793870929824; 
 Thu, 05 Nov 2026 01:28:49 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8b09a8c303dsm1720886b3a.20.2026.11.05.01.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:28:49 -0800 (PST)
Date: Thu, 05 Nov 2026 17:25:47 +0800
Subject: [PATCH 08/16] hw/sensor: tmp421: keep the measurement across a
 range change
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-tmp421-v1-8-c46853f5e1f0@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793870743; l=6919;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=qoPYlE2KGeqUXqEXuY48ROoEFeJ8AsOvINnq4nphwJk=;
 b=qq0WB1SHrobf5sZ5jZDqQ2ARcuPd9ctGUgou38hVw2o322Q8stvB+Vob7RxELr6f1L6jHnzHX
 NmfOje17jK4BBF++TGqTkpfGUdmj/G9dXk5WVYZR2+luzJIn627FHgB
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.210.174; envelope-from=eblot.ml@gmail.com;
 helo=mail-pf1-f174.google.com
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

The model stored temperatures in their register form, which carries
the extended-range offset. Leaving that range therefore reinterpreted
the stored value and shifted the reported temperature by 64 degrees,
whether the range bit was cleared by a configuration write or by a
reset. The encoding was wrong at both ends too: the extended range is
offset binary, so it does not fit a signed register above +64 C, and
neither range saturated where the datasheet says it should.

Hold the measurement in millidegrees and derive the register from it
on each read, which is what the range bit selects: an encoding, not a
new measurement.

The stream keeps carrying the register form, which is what a released
QEMU writes and expects, so it stays loadable both ways; the
measurement is converted to and from it on save and load.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c | 96 +++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 15 deletions(-)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index 87cbd9dd4b..943295240d 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -54,9 +54,13 @@ struct TMP421State {
     I2CSlave parent_obj;
     /*< public >*/
 
-    int16_t temperature[4];
+    /* Measured temperature, millidegrees Celsius */
+    int32_t temp_mc[4];
     uint8_t n_correct[3];   /* remote channels only */
 
+    /* migration only: the register form the stream carries */
+    int16_t temperature[4];
+
     uint8_t status;
     uint8_t config[2];
     uint8_t rate;
@@ -115,12 +119,51 @@ OBJECT_DECLARE_TYPE(TMP421State, TMP421Class, TMP421)
 static const int32_t mins[2] = { -40000, -55000 };
 static const int32_t maxs[2] = { 127000, 150000 };
 
+/*
+ * Register form of a measurement (datasheet Table 1): whole degrees in the
+ * high byte, the fraction in the upper nibble of the low byte. The standard
+ * range is two's complement and saturates at -64 C (C0h) and +127 C (7Fh);
+ * the extended range is unsigned with a -64 C offset, spanning -64 C (00h) to
+ * +191 C (FFh). The range only selects an encoding: the measurement itself is
+ * held apart, so switching range re-reads the same temperature.
+ */
+#define TMP421_EXT_OFFSET   (64 * 256)
+#define TMP421_STD_REG_MIN  (-64 * 256)          /* C0h, -64 C */
+#define TMP421_STD_REG_MAX  (127 * 256 + 0xf0)   /* 7Fh, +127 C */
+#define TMP421_EXT_REG_MAX  (255 * 256 + 0xf0)   /* FFh, +191 C offset */
+
+static uint16_t tmp421_encode(const TMP421State *s, unsigned channel)
+{
+    bool ext_range = s->config[0] & TMP421_CONFIG_RANGE;
+    int raw = s->temp_mc[channel] * 256 / 1000;
+
+    if (ext_range) {
+        raw = MAX(0, MIN(TMP421_EXT_REG_MAX, raw + TMP421_EXT_OFFSET));
+    } else {
+        raw = MAX(TMP421_STD_REG_MIN, MIN(TMP421_STD_REG_MAX, raw));
+    }
+
+    return raw;
+}
+
+/*
+ * The inverse of tmp421_encode(). Only the standard range is signed: the
+ * extended one spans the whole byte, so its top bit is a temperature, not a
+ * sign. Rounding follows the sign so that every register value the encoder
+ * can produce decodes back to the measurement it came from.
+ */
+static int32_t tmp421_decode(const TMP421State *s, int16_t reg)
+{
+    bool ext_range = s->config[0] & TMP421_CONFIG_RANGE;
+    int32_t raw = ext_range ? (uint16_t)reg - TMP421_EXT_OFFSET : reg;
+
+    return (raw * 1000 + (raw < 0 ? -128 : 128)) / 256;
+}
+
 static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
     TMP421State *s = TMP421(obj);
-    bool ext_range = (s->config[0] & TMP421_CONFIG_RANGE);
-    int offset = ext_range * 64 * 256;
     int64_t value;
     int tempid;
 
@@ -134,21 +177,18 @@ static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    value = ((s->temperature[tempid] - offset) * 1000 + 128) / 256;
+    value = s->temp_mc[tempid];
 
     visit_type_int(v, name, &value, errp);
 }
 
-/* Units are 0.001 centigrades relative to 0 C.  s->temperature is 8.8
- * fixed point, so units are 1/256 centigrades.  A simple ratio will do.
- */
+/* Units are 0.001 centigrades relative to 0 C. */
 static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
     TMP421State *s = TMP421(obj);
     int64_t temp;
     bool ext_range = (s->config[0] & TMP421_CONFIG_RANGE);
-    int offset = ext_range * 64 * 256;
     int tempid;
 
     if (!visit_type_int(v, name, &temp, errp)) {
@@ -171,7 +211,7 @@ static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    s->temperature[tempid] = (int16_t) ((temp * 256 - 128) / 1000) + offset;
+    s->temp_mc[tempid] = temp;
 }
 
 static bool tmp421_channel_enabled(TMP421State *s, unsigned channel)
@@ -188,16 +228,14 @@ static bool tmp421_channel_enabled(TMP421State *s, unsigned channel)
  */
 static uint8_t tmp421_temp_high(TMP421State *s, unsigned channel)
 {
-    uint16_t reg = s->temperature[channel];
-
-    return tmp421_channel_enabled(s, channel) ? reg >> 8 : 0;
+    return tmp421_channel_enabled(s, channel) ?
+           tmp421_encode(s, channel) >> 8 : 0;
 }
 
 static uint8_t tmp421_temp_low(TMP421State *s, unsigned channel)
 {
-    uint16_t reg = s->temperature[channel];
-
-    return tmp421_channel_enabled(s, channel) ? reg & 0xf0 : 0;
+    return tmp421_channel_enabled(s, channel) ?
+           tmp421_encode(s, channel) & 0xf0 : 0;
 }
 
 static void tmp421_read(TMP421State *s)
@@ -342,10 +380,38 @@ static const VMStateDescription vmstate_tmp421_n_correct = {
     }
 };
 
+/*
+ * The stream carries the register form of the measurement: that is what a
+ * QEMU predating the millidegree state writes, and what it expects back.
+ */
+static int tmp421_pre_save(void *opaque)
+{
+    TMP421State *s = opaque;
+
+    for (unsigned channel = 0; channel < ARRAY_SIZE(s->temp_mc); channel++) {
+        s->temperature[channel] = tmp421_encode(s, channel);
+    }
+
+    return 0;
+}
+
+static int tmp421_post_load(void *opaque, int version_id)
+{
+    TMP421State *s = opaque;
+
+    for (unsigned channel = 0; channel < ARRAY_SIZE(s->temp_mc); channel++) {
+        s->temp_mc[channel] = tmp421_decode(s, s->temperature[channel]);
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_tmp421 = {
     .name = "TMP421",
     .version_id = 0,
     .minimum_version_id = 0,
+    .pre_save = tmp421_pre_save,
+    .post_load = tmp421_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT8(len, TMP421State),
         VMSTATE_UINT8_ARRAY(buf, TMP421State, 2),

-- 
2.53.0-Meta


