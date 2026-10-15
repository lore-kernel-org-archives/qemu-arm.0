Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613B1CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 15:17:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHN6s-0006aP-4p; Thu, 15 Oct 2026 11:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN6q-0006UX-RB
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:11:08 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN6p-0001iF-1J
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:11:08 -0400
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so562347f8f.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 08:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792077065; x=1792681865;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QALtB1JjwJWKzUBaARxhOo0RyLWLhPW//31H+iGWjAk=;
 b=E8i+sajTUR1jlbfyFa5cxeSfmPgDllbmM9rP1W4DGx/cwmjaQ/F8w/5VLWZCdH2jw2
 T3dTPf1ctQxualUN2MzUCWmSrLE1CDZRdiojlm0F+KqdqUEeZ0d3tJBOIyWbDZzS0w1Y
 RY8Lp+XXIYvKD74AZ2oiRPwzPL4uVRAjLOang2f1qofvL+4HscX8zEtwrkYOBBI3bit9
 o4m2CdFT036AB1M5yJYMxW90Ao2bzDyeOadpGdOuok6Vf6tE/A7kLyfMmDOJ3DsThtQy
 Gge9jtz+GpCAxUmPglm4ZAFKih06tm2cd0HQMTpbugsCDw9guxj1d7aa4eBiOArTaOHh
 OhfA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz0njEQPRNMd/TyhH0VxfUzfp8RORRQ8Moko7ZBG4J1+9+1/I+yMIIqUzMlm5luejryIYwzmpXilA==@nongnu.org
X-Gm-Message-State: AFq9FYLu9x1k30U3SyGCB3FyZJcM68hvgS+8FZC/pxb51I/zowawe2HD
 LYkBszQYD3qHc0JKKzXtgnwr8+GCo8Kj+n8hRx8l/BgZry4yuPUJ8dI9
X-Gm-Gg: AYBFou15wtuDlPJLSE3lW9zdmolx7uuVdtrJIjrc6TAqEQTDGKKhNjQBoEL3L3DhyA8
 3GSFzISUUjIr9P+nU+q9gsiXKmw9FgbjC4TSAopqkS1Ik/iDlm07d/b2sQBiAq1XAxOp0Sxc4QP
 YuU2MWWHGxtalqIwRqKzSsyMab430mnuNdYhYHVjUzAFZ3AkzQJniX8QH0HIvbNKUmRgP/EymsA
 PLeGwDUWW3TuNiPOYprjGH09Ln+wQYVzyD/8uEjVqjLmbcDrAhhwdZhFtbpUF/64acM/2PKu0We
 UerQmjNQ80Wy4G3jFd1nTq45QWklZ3V0Z+/JjHuBE7fv7tFfk93MiZx5aV7ZGnZIBQWwR7b9Rv9
 Mnshazr4hli2JBU1ibWwUOQLquiP+lawRyTMOmqONGJZrbkJkydIOwqy/SqRuNKlXQBtCMq9Vpa
 CDu/G4rsFgGqj2cXLAmo+w6XbN5qccinroH81CLVf0ISCPa1Wdcypnj7INPNc3gvR3hgdGf4cZl
 sJUIiKExRHj75Xn2qf2KT3+kTmcKVL9AfMzT9kGYNePeg==
X-Received: by 2002:a05:6000:2606:b0:48d:eb45:742d with SMTP id
 ffacd0b85a97d-48deb45757dmr10400041f8f.22.1792077065222; 
 Thu, 15 Oct 2026 08:11:05 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac5265sm20302446f8f.41.2026.10.15.08.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 08:11:03 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:57:47 +0200
Subject: [PATCH 09/22] hw/sensor: tmp421: migrate the exact measurement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-clemente-v1-9-bf591886b5b6@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792065465; l=3784;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=WkdVkGiPzxeWatF4oFQP9cdVEfej5xbiLCyVJyd/Exg=;
 b=iTInpBgYCl9BA8spP92Lp0rju5OGi6Ykf9mvFhRxNkqTIW6K6EIizFAEUjgVD8Eh5sLol4dj2
 iMHQ7e+ePNlApbO+C2RWgUwGVgNV5pw0daZjYdZBZfl7npDyKU4ULV2
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.53; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f53.google.com
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

The register form the stream carries only resolves a sixteenth of a
degree, so a temperature set through the property does not survive a
round trip unless it happens to fall on that grid.

Add a subsection holding the measurement itself, sent only when the
register form cannot reproduce it. A stream from a sensor holding an
expressible value -- the usual case, boards preset whole degrees --
therefore stays loadable by a QEMU that knows nothing of it.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index 1e061045cb..e391bb20e1 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -59,6 +59,7 @@ struct TMP421State {
 
     /* migration only: the register form the stream carries */
     int16_t temperature[4];
+    bool temp_mc_loaded;
 
     uint8_t status;
     uint8_t config[2];
@@ -379,6 +380,56 @@ static const VMStateDescription vmstate_tmp421_n_correct = {
     }
 };
 
+/*
+ * That form only resolves a sixteenth of a degree, so the measurement itself
+ * travels in a subsection -- sent only when the register form cannot
+ * reproduce it, which leaves the usual stream loadable by a QEMU that does
+ * not know the subsection.
+ */
+static bool tmp421_temp_mc_needed(void *opaque)
+{
+    TMP421State *s = opaque;
+    bool ext_range = s->config[0] & TMP421_CONFIG_RANGE;
+    int32_t offset = ext_range ? TMP421_EXT_OFFSET : 0;
+
+    /*
+     * The register form reproduces a measurement when the conversion divides
+     * exactly and the encoder had nothing to clamp. Asking the decoder
+     * instead would settle the question with the function whose result the
+     * subsection exists to protect, and hide any error it has.
+     */
+    for (unsigned channel = 0; channel < ARRAY_SIZE(s->temp_mc); channel++) {
+        int32_t scaled = s->temp_mc[channel] * 256;
+
+        if (scaled % 1000 ||
+            (uint16_t)(scaled / 1000 + offset) != tmp421_encode(s, channel)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static int tmp421_temp_mc_post_load(void *opaque, int version_id)
+{
+    TMP421State *s = opaque;
+
+    s->temp_mc_loaded = true;
+    return 0;
+}
+
+static const VMStateDescription vmstate_tmp421_temp_mc = {
+    .name = "TMP421/temperature-mc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = tmp421_temp_mc_needed,
+    .post_load = tmp421_temp_mc_post_load,
+    .fields = (const VMStateField[]) {
+        VMSTATE_INT32_ARRAY(temp_mc, TMP421State, 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 /*
  * The stream carries the register form of the measurement: that is what a
  * QEMU predating the millidegree state writes, and what it expects back.
@@ -398,9 +449,13 @@ static int tmp421_post_load(void *opaque, int version_id)
 {
     TMP421State *s = opaque;
 
-    for (unsigned channel = 0; channel < ARRAY_SIZE(s->temp_mc); channel++) {
-        s->temp_mc[channel] = tmp421_decode(s, s->temperature[channel]);
+    if (!s->temp_mc_loaded) {
+        for (unsigned channel = 0; channel < ARRAY_SIZE(s->temp_mc);
+             channel++) {
+            s->temp_mc[channel] = tmp421_decode(s, s->temperature[channel]);
+        }
     }
+    s->temp_mc_loaded = false;
 
     return 0;
 }
@@ -423,6 +478,7 @@ static const VMStateDescription vmstate_tmp421 = {
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription * const []) {
+        &vmstate_tmp421_temp_mc,
         &vmstate_tmp421_n_correct,
         NULL
     }

-- 
2.53.0-Meta


