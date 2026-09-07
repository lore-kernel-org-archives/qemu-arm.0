Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB87C79FA1
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:45:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cT8-0004eK-5k; Mon, 07 Sep 2026 12:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cT7-0004df-1d
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:45:17 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cT5-0003Sd-9L
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:45:16 -0400
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4843efcbdb2so2021720f8f.2
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799514; x=1789404314;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=G/mKfLQNBKAXK5zANjKJNAiRPm31akVLZZtUavo8HIg=;
 b=Djb+IbmmlESHbDJqWiHkNSHRfA37GYwEV2wDTdexLXDKGg6S05gtxYZMKpoi9JH2nA
 b2h/BEkHpvuM13XRttlBfr3YlFBXqIwDDaJ7mP7jEVmJuYcxEkYu/D8W3m/7IIsaluZ3
 LQArXF9W7bWOE1gOQr61A7HqgdIZogei/9DM6IBeTtONg7CDar5Qfa5CeCPwmWxsLfMr
 3jz3DBiS/NM/wg6akHjFR3xEjHtpeN7CFbDehs632xi8gFJU3KIlO8+e9OW3PD/okC16
 57MT26TPhibgPCROHH70txPrzC7U9GQnQLoO3yx+Qob3wyX60YCAZcDEmTgiOHzwZvcc
 V4xQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFEPa8ihFG0KwbfirTb4EIJCCpeqjlI1YyGPTD/kQild+cT/N+5v8FhqPivF17rRR9kwLGyrLQcQ==@nongnu.org
X-Gm-Message-State: AFuF++mmnkdVTacthh6QAgde4cjZ18PfZfN6s9cNFejIruef7xbzSjZn
 ziHcU/bV3wC4DhZFYvMOAdF7YYM/u6erVVtL/uil6h6DlvW8D5iiBG35
X-Gm-Gg: AYBFou0jwYGN2oOMzMFwdZd4Wr6UScUhIVTqM7qXGKZhhmyXjisxbUHcEBxV0taTAFr
 /zC9WSjOvhHjpTKCCi+8Xq4jBp9Pvvtc2u39HyWLf16jCCktN6Pdqtp+yCvhyehRNta+bm9BaKJ
 z4ZRtFzaFawU3t9SbNzytNGZlO5g4FjNlN0pEXtX7tb2qsCL7Uid0NDmXCAs4rmKQN2vQLhhqoy
 Ne5xeMtSUPA4XfTwa5E1JeLULqRkcAKyZux7XeUZH/9RZdOyuhmg0YSc3+L8s55WjR7FwGVDHr2
 0WqguXwZsrkgGGa0ecbcLyydww0QfNMFP6vPc8FinvenTDXsWyWNxtocn1fqVnGxB3ZW+QMesBy
 jpcj50VwaHOhrRCigFwRF8W1h5xcVdNlV1fKMHH4sHnQENCMx2tNbNMfu/lj1hFpp0tSUlRKRPO
 RlRSQu8LZfy9HmwNaUJtRHmI+C/vmIc4TYkVv0wPUqKvD7ZmJ7dQ+4hcNQP5Mae4cG9gg78dK1G
 lZ8W+CImmMnWPDkIEPyeRxOHHxMLCr+ybg=
X-Received: by 2002:a05:600c:4f83:b0:49d:91:274 with SMTP id
 5b1f17b1804b1-49d00910374mr160875785e9.10.1788799513726; 
 Mon, 07 Sep 2026 09:45:13 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cffdb2c40sm191187145e9.1.2026.09.07.09.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:45:13 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:04 +0200
Subject: [PATCH 14/50] hw/rtc: ds1338: implement the DS1338 clock-halt bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-14-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799320; l=4393;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=a6K3mP3V1bOItKsHSSEEMqE6FAeOlFgY8HlKMCgf6ls=;
 b=VNb4MoxMYZVwwCbNDVutS+tnhtgVQpwFStW+fZVVM/X22xzE23yQ7i+r/VM33+0PQECAIb6sB
 3zzCMySa26KA/Ug1uYX2OVMerXR5R+NdP2eOfrwzf3QfxZzL3wDnzmr
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

Bit 7 of the seconds register disables the oscillator, and the guest is
expected to clear it before trusting the time. The bit was masked away
on every write, so it always read back zero and the clock never
stopped.

The reset value stays clear rather than set as on real hardware,
keeping the model's convention that the clock comes up running and
synchronised with the host.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 862e03bd32..79bcff4599 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -14,6 +14,7 @@
  *   so the sub-second phase of the clock is not modelled.
  * - Leap years follow the Gregorian rule, where the parts stop at 2100: they
  *   derive the leap year from the two-digit year alone.
+ * - The model comes up with the clock running; real hardware comes up halted.
  */
 
 #include "qemu/osdep.h"
@@ -53,6 +54,7 @@ struct DS1338State {
     uint8_t nvram[NVRAM_SIZE];
     int32_t ptr;
     bool addr_byte;
+    bool osc_stopped;   /* oscillator halted: time is frozen */
 };
 
 struct DS1338Class {
@@ -64,11 +66,12 @@ struct DS1338Class {
     uint8_t osf_addr;       /* register holding the OSF flag */
     uint8_t osf_mask;       /* OSF bit within osf_addr */
     uint8_t ctrl_reset;     /* control-register power-on value */
+    uint8_t ch_mask;        /* Clock-halt bit in the seconds reg */
 };
 
 static const VMStateDescription vmstate_ds1338 = {
     .name = "ds1338",
-    .version_id = 2,
+    .version_id = 3,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
         VMSTATE_I2C_SLAVE(parent_obj, DS1338State),
@@ -77,6 +80,7 @@ static const VMStateDescription vmstate_ds1338 = {
         VMSTATE_UINT8_ARRAY(nvram, DS1338State, NVRAM_SIZE),
         VMSTATE_INT32(ptr, DS1338State),
         VMSTATE_BOOL(addr_byte, DS1338State),
+        VMSTATE_BOOL_V(osc_stopped, DS1338State, 3),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -122,6 +126,11 @@ static void ds1338_capture_current_time(DS1338State *s)
      * which will be actually read by the data transfer operation.
      */
     struct tm now;
+
+    if (s->osc_stopped) {
+        return;
+    }
+
     qemu_get_timedate(&now, s->offset);
     s->nvram[0] = to_bcd(now.tm_sec);
     s->nvram[1] = to_bcd(now.tm_min);
@@ -213,15 +222,30 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
          * is then rebuilt from it as a whole: a transfer that programs the
          * date before the month it belongs to must not be normalised away
          * against the month still held from the previous date.
-         *
-         * TODO: Implement CH (stop) bit.
          */
         static const uint8_t valid[7] = {
             0x7f, 0x7f, 0x7f, 0x07, 0x3f, 0x1f, 0xff
         };
+        uint8_t mask = valid[s->ptr];
+        bool halt = s->osc_stopped;
 
-        s->nvram[s->ptr] = data & valid[s->ptr];
-        ds1338_resync_from_regs(s);
+        if (s->ptr == 0) {
+            mask |= k->ch_mask;
+            if (k->ch_mask) {
+                halt = data & k->ch_mask;
+            }
+        }
+
+        if (halt && !s->osc_stopped) {
+            /* CH set: freeze the counters before the register is stored. */
+            ds1338_capture_current_time(s);
+            s->nvram[k->osf_addr] |= k->osf_mask;
+        }
+        s->nvram[s->ptr] = data & mask;
+        s->osc_stopped = halt;
+        if (!halt) {
+            ds1338_resync_from_regs(s);
+        }
     } else {
         if (s->ptr == k->ctrl_addr) {
             /* Control register: reserved bits read back as zero. */
@@ -253,6 +277,7 @@ static void ds1338_reset_hold(Object *obj, ResetType type)
     s->nvram[k->ctrl_addr] = k->ctrl_reset;
     s->ptr = 0;
     s->addr_byte = false;
+    s->osc_stopped = false;
 }
 
 static void ds1338_class_init(ObjectClass *klass, const void *data)
@@ -275,6 +300,7 @@ static void ds1338_class_init(ObjectClass *klass, const void *data)
     dsc->osf_addr   = DS1338_CONTROL;
     dsc->osf_mask   = CTRL_OSF;
     dsc->ctrl_reset = DS1338_CTRL_RESET;
+    dsc->ch_mask = SECONDS_CH;
 }
 
 static const TypeInfo ds1338_types[] = {

-- 
2.50.1


