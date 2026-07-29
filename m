Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FA1C53219
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:28:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6DC-0001fH-RS; Wed, 29 Jul 2026 11:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6DA-0001dp-KS
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:28:48 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6D8-00083h-EP
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:28:48 -0400
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493f6de72faso8247125e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785338925; x=1785943725;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6TeMroFC0RkCp4VBi9WC++CXDwcuWrermHZePSESP/4=;
 b=JoALvrBZQvJPkOlA9D3i12+eBkvlQDQbNYL4cRl+gFkLzWn3602X2CfjeuFqAFYmRn
 1Rj1WK6ySM/gcwgloLKozSmds/B7pcDSlGa8yTuVqjPbM8mKq9zUfHnOynN3sxK7woQU
 p/cY0OHqxu2pDSbZh9BoLDBSVmEGEqvKzCXRamiVqT3ptogd06T4tdUIlhEpbUoN4yAZ
 vEQOLib31q6mth5aIKhuswK3AwHMNgmZuliH3BeC4eP7iB/BnZlHiLEz3lT5X7vfO0n/
 RxMrS2R5nzzcciVKplXTIKKu1Qu3annNeU9RqNoy+Uelb5Cj6oS6lBWBq85ztcebCCdL
 PQQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpX9zrc0eqDFjcSrJl7cfM8AgNvzpxnOZtsX+LR7iRBPrb17EiRFuKu1WIsfqPBRx2uXi5nhIKLGA==@nongnu.org
X-Gm-Message-State: AOJu0YxNAJk/5DZd+92tD4v6uZ2w//6VpgPJgMUBv7Sk0qpqwe/Hugb9
 al2RpYpk5XJWfCvSTDwJkc3WY6kvdy2PZXhRUqj8sCogFW6n/c6b/Bu1
X-Gm-Gg: AR+sD1323sJ5OEJkmP58PHe6x/JVgDscsB3YUNPgiyJTTegHbUjAsX5pBNXrPi6d2+2
 mHXFoyuxG6wr+/cMzbqGyrNIeyGGwoi6+kECg0J1RjmWlaHyVVZ8VLeirdmsdwxMODbKXDgD3+B
 lT5xO0amF/HXnpD+hq2BOVcSP4CTxevSdc2ipT/1MwtmaBTsmZpG5iSbztHhivhHUBqQ5S7QcRx
 1zc/9TqZcP31bh+Mj3ziHKEml1clWoWgK/H7/gT58M1PIaiqha2L3/dsMbkkTCj22oe8nfRDTA+
 H4tfy5NSdTpYMWEAABpoXCBn2+l/d0Ku8XZNApPHrl3e01dQ7rNncivOcE/IQieoB39eBjKHkLa
 ZtIPmYUpgVPuEMQFHYcogeMRSekcENuAGH9xifO7nouPLxCz+ldgjVzHpiul0M3NQd/SZnVpaib
 dcI5c0+5hAAmI16Jyz7nIU9q3u1fxvkEv1jNyR945M2F7FJGHChbPPNC6mhQhVqDVuBVHytzNz+
 LojHkZHZHjDoY+25o11H7IErNBBmZQhX0Xv
X-Received: by 2002:a05:600c:1e0a:b0:495:6193:c6c0 with SMTP id
 5b1f17b1804b1-497fd31a32dmr31294815e9.18.1785338925020; 
 Wed, 29 Jul 2026 08:28:45 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-497fecfccc7sm51853475e9.12.2026.07.29.08.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:28:44 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:12:40 +0200
Subject: [PATCH 04/25] hw/sensor: tmp105: enforce the configurable fault queue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-4-c8f9a8d101f6@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337963; l=5924;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=wwzB72eiHroHgVASMgeEaV/IOYNCK41LnLDKlIYNhaw=;
 b=qclnMbBBl89pIwmlJvsnRWjTsMVMyTUqwR/avwjEkWmoLp/xHt+doV+8U+o+2UNYZYU4OaumB
 ZCrLNsP4RdWDc49Z8abnmLy2Is/aXArBzkpgxUYGsK1tF2hIl+yYPdx
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.52; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f52.google.com
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

The fault-queue depth selected in the configuration register was decoded
but never consulted, so the ALERT pin tripped on the very first
out-of-limit conversion regardless of the programmed depth.

Track the consecutive-fault count and only change the ALERT state once
it reaches the programmed depth; any in-range conversion clears the
count. The default configuration keeps the previous behaviour. The count
is migrated through an optional subsection so existing streams stay
compatible.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp105.c | 87 ++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 55 insertions(+), 32 deletions(-)

diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
index f7d0c738ca..5c77f991cc 100644
--- a/hw/sensor/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -54,6 +54,7 @@ struct TMP105State {
     int16_t temperature;
     int16_t limit[2];
     int faults;
+    uint8_t fault_count;
     uint8_t alarm;
     /*
      * The TMP105 initially looks for a temperature rising above T_high;
@@ -78,43 +79,40 @@ static void tmp105_interrupt_update(TMP105State *s)
 
 static void tmp105_alarm_update(TMP105State *s, bool one_shot)
 {
+    bool fault;
+
     if (FIELD_EX8(s->config, CONFIG, SHUTDOWN_MODE) && !one_shot) {
         return;
     }
 
-    if (FIELD_EX8(s->config, CONFIG, THERMOSTAT_MODE)) {
-        /*
-         * TM == 1 : Interrupt mode. We signal Alert when the
-         * temperature rises above T_high, and expect the guest to clear
-         * it (eg by reading a device register).
-         */
-        if (s->detect_falling) {
-            if (s->temperature < s->limit[0]) {
-                s->alarm = 1;
-                s->detect_falling = false;
-            }
-        } else {
-            if (s->temperature >= s->limit[1]) {
-                s->alarm = 1;
-                s->detect_falling = true;
-            }
-        }
+    /*
+     * A fault is a conversion that lies outside the limit currently being
+     * watched: above T_high while looking for the alarm to trip, below T_low
+     * afterwards.
+     */
+    if (s->detect_falling) {
+        fault = s->temperature < s->limit[0];
     } else {
-        /*
-         * TM == 0 : Comparator mode. We signal Alert when the temperature
-         * rises above T_high, and stop signalling it when the temperature
-         * falls below T_low.
-         */
+        fault = s->temperature >= s->limit[1];
+    }
+
+    if (!fault) {
+        s->fault_count = 0;
+    } else if (++s->fault_count >= s->faults) {
+        s->fault_count = 0;
         if (s->detect_falling) {
-            if (s->temperature < s->limit[0]) {
-                s->alarm = 0;
-                s->detect_falling = false;
-            }
+            /*
+             * Temperature fell back below T_low. In comparator mode (TM == 0)
+             * the alarm is released; in interrupt mode (TM == 1) it is
+             * asserted again and the guest is expected to clear it by reading
+             * a register.
+             */
+            s->alarm = FIELD_EX8(s->config, CONFIG, THERMOSTAT_MODE);
+            s->detect_falling = false;
         } else {
-            if (s->temperature >= s->limit[1]) {
-                s->alarm = 1;
-                s->detect_falling = true;
-            }
+            /* Temperature rose to or above T_high: assert the alarm. */
+            s->alarm = 1;
+            s->detect_falling = true;
         }
     }
 
@@ -204,7 +202,12 @@ static void tmp105_write(TMP105State *s)
         }
         s->config = FIELD_DP8(s->buf[0], CONFIG, ONE_SHOT, 0);
         s->faults = tmp105_faultq[FIELD_EX8(s->config, CONFIG, FAULT_QUEUE)];
-        tmp105_alarm_update(s, FIELD_EX8(s->buf[0], CONFIG, ONE_SHOT));
+        if (FIELD_EX8(s->buf[0], CONFIG, ONE_SHOT) &&
+            FIELD_EX8(s->config, CONFIG, SHUTDOWN_MODE)) {
+            tmp105_alarm_update(s, true);
+        } else {
+            tmp105_interrupt_update(s);
+        }
         break;
 
     case TMP105_REG_T_LOW:
@@ -213,7 +216,7 @@ static void tmp105_write(TMP105State *s)
             s->limit[s->pointer & 1] = (int16_t)
                     ((((uint16_t) s->buf[0]) << 8) | (s->buf[1] & 0xf0));
         }
-        tmp105_alarm_update(s, false);
+        tmp105_interrupt_update(s);
         break;
     }
 }
@@ -281,6 +284,13 @@ static bool detect_falling_needed(void *opaque)
     return s->detect_falling;
 }
 
+static bool fault_count_needed(void *opaque)
+{
+    const TMP105State *s = opaque;
+
+    return s->fault_count != 0;
+}
+
 static const VMStateDescription vmstate_tmp105_detect_falling = {
     .name = "TMP105/detect-falling",
     .version_id = 1,
@@ -292,6 +302,17 @@ static const VMStateDescription vmstate_tmp105_detect_falling = {
     }
 };
 
+static const VMStateDescription vmstate_tmp105_fault_count = {
+    .name = "TMP105/fault-count",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = fault_count_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT8(fault_count, TMP105State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_tmp105 = {
     .name = "TMP105",
     .version_id = 0,
@@ -310,6 +331,7 @@ static const VMStateDescription vmstate_tmp105 = {
     },
     .subsections = (const VMStateDescription * const []) {
         &vmstate_tmp105_detect_falling,
+        &vmstate_tmp105_fault_count,
         NULL
     }
 };
@@ -322,6 +344,7 @@ static void tmp105_reset_hold(Object *obj, ResetType type)
     s->pointer = 0;
     s->config = 0;
     s->faults = tmp105_faultq[FIELD_EX8(s->config, CONFIG, FAULT_QUEUE)];
+    s->fault_count = 0;
     s->alarm = 0;
     s->detect_falling = false;
 

-- 
2.50.1


