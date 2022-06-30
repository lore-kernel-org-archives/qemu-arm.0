Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp254119lft;
        Thu, 30 Jun 2022 04:26:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1skjW3wrRRUHlMV/Ogy0S2X4RjOkHVg4rnokjHO43bA05QRODJJaT65UcBvkDJOrqNOsqUN
X-Received: by 2002:a37:2756:0:b0:6ae:f7c2:ae4a with SMTP id n83-20020a372756000000b006aef7c2ae4amr6016641qkn.504.1656588418963;
        Thu, 30 Jun 2022 04:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588418; cv=none;
        d=google.com; s=arc-20160816;
        b=AX1PJ9PbQtQucGc7Vb7foCDVWZiRkLEAqMX1eIbbOuU+jYZI4A01AlJRhlnxV6S9EQ
         YXyHfNybPP8gwgAWLgzJc7r7BfusDJKK3wgvDWIsymp3E4iWepzjauw3l+k2Db0Fl5Wr
         wkPfJe5eq6wh5q72mLOgkEv3Gw9laaF28KLNmUF01wm/qkZE+fHa0bnKCaVAMtMED8IG
         Bb4UMYRLols+ZGfJs1pyeQJN2ZXEMThj3SBRm+KQNU5M/Y3tcK4wGfx0QkiS00xoZ6f+
         wp03nNJarwec5APcwCxUKtJXfsG1R4MXYhvdtTMBu+vmd8SjqLT/B3PSE1+FYG1AxJUK
         kmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Oz2dhvwoWZlralYZ0GHW/OYGQwaJfO/kvu9+jofpfNM=;
        b=FYQS0ROnnuHrpnw/pt6RQ+3658y5UHUBiZuGvUXYwmtkY4GlMQA/TQlNleM+O38F2t
         T3Jn05LddU8Vwc0aVLx/T3CY+mIx795SCjZInbPAzOUkO/PB5IForrSJdFmul8UYA2pd
         ZjaWFAT/OKm6cxRowbb9T9umBwmYRJXlevhL8ixTP7emGYq07hAhpgYoV/klMHV2tY1z
         SP8KtkCn5YnBHwg1qUfmnTt84fNMUDeeOygqK/vc8ZQ0A4BaQ8j4Qk3IPflx3JozZWNJ
         P450drtd5B9CchQXDGp++sRRZUPDWlr3AcDhzCPu3B4eoUmDz6iGHO2eFIs1qTG+I1ZP
         REDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15-20020a05620a294f00b006a6a49dffb2si12880795qkp.22.2022.06.30.04.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sK2-0001mw-Ev
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHh-000746-3C; Thu, 30 Jun 2022 07:24:33 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:40183
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHf-0001xX-0c; Thu, 30 Jun 2022 07:24:32 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZY6Z8dz4xXF;
 Thu, 30 Jun 2022 21:24:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZW4SVYz4xD5;
 Thu, 30 Jun 2022 21:24:19 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Iris Chen <irischenlj@gmail.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/27] hw: m25p80: add WP# pin and SRWD bit for write protection
Date: Thu, 30 Jun 2022 13:23:45 +0200
Message-Id: <20220630112411.1474431-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ElUFwCTpj62g

From: Iris Chen <irischenlj@gmail.com>

Signed-off-by: Iris Chen <irischenlj@gmail.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220621202427.2680413-1-irischenlj@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 82 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 67 insertions(+), 15 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 81ba3da4df10..3045dda53b81 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -472,11 +472,13 @@ struct Flash {
     uint8_t spansion_cr2v;
     uint8_t spansion_cr3v;
     uint8_t spansion_cr4v;
+    bool wp_level;
     bool write_enable;
     bool four_bytes_address_mode;
     bool reset_enable;
     bool quad_enable;
     bool aai_enable;
+    bool status_register_write_disabled;
     uint8_t ear;
 
     int64_t dirty_page;
@@ -723,6 +725,8 @@ static void complete_collecting_data(Flash *s)
         flash_erase(s, s->cur_addr, s->cmd_in_progress);
         break;
     case WRSR:
+        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
+
         switch (get_man(s)) {
         case MAN_SPANSION:
             s->quad_enable = !!(s->data[1] & 0x02);
@@ -1165,22 +1169,34 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         break;
 
     case WRSR:
-        if (s->write_enable) {
-            switch (get_man(s)) {
-            case MAN_SPANSION:
-                s->needed_bytes = 2;
-                s->state = STATE_COLLECTING_DATA;
-                break;
-            case MAN_MACRONIX:
-                s->needed_bytes = 2;
-                s->state = STATE_COLLECTING_VAR_LEN_DATA;
-                break;
-            default:
-                s->needed_bytes = 1;
-                s->state = STATE_COLLECTING_DATA;
-            }
-            s->pos = 0;
+        /*
+         * If WP# is low and status_register_write_disabled is high,
+         * status register writes are disabled.
+         * This is also called "hardware protected mode" (HPM). All other
+         * combinations of the two states are called "software protected mode"
+         * (SPM), and status register writes are permitted.
+         */
+        if ((s->wp_level == 0 && s->status_register_write_disabled)
+            || !s->write_enable) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "M25P80: Status register write is disabled!\n");
+            break;
+        }
+
+        switch (get_man(s)) {
+        case MAN_SPANSION:
+            s->needed_bytes = 2;
+            s->state = STATE_COLLECTING_DATA;
+            break;
+        case MAN_MACRONIX:
+            s->needed_bytes = 2;
+            s->state = STATE_COLLECTING_VAR_LEN_DATA;
+            break;
+        default:
+            s->needed_bytes = 1;
+            s->state = STATE_COLLECTING_DATA;
         }
+        s->pos = 0;
         break;
 
     case WRDI:
@@ -1195,6 +1211,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case RDSR:
         s->data[0] = (!!s->write_enable) << 1;
+        s->data[0] |= (!!s->status_register_write_disabled) << 7;
+
         if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
             s->data[0] |= (!!s->quad_enable) << 6;
         }
@@ -1484,6 +1502,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
     return r;
 }
 
+static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
+{
+    Flash *s = M25P80(opaque);
+    /* WP# is just a single pin. */
+    assert(n == 0);
+    s->wp_level = !!level;
+}
+
 static void m25p80_realize(SSIPeripheral *ss, Error **errp)
 {
     Flash *s = M25P80(ss);
@@ -1515,12 +1541,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         s->storage = blk_blockalign(NULL, s->size);
         memset(s->storage, 0xFF, s->size);
     }
+
+    qdev_init_gpio_in_named(DEVICE(s),
+                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
 }
 
 static void m25p80_reset(DeviceState *d)
 {
     Flash *s = M25P80(d);
 
+    s->wp_level = true;
+    s->status_register_write_disabled = false;
+
     reset_memory(s);
 }
 
@@ -1587,6 +1619,25 @@ static const VMStateDescription vmstate_m25p80_aai_enable = {
     }
 };
 
+static bool m25p80_wp_level_srwd_needed(void *opaque)
+{
+    Flash *s = (Flash *)opaque;
+
+    return !s->wp_level || s->status_register_write_disabled;
+}
+
+static const VMStateDescription vmstate_m25p80_write_protect = {
+    .name = "m25p80/write_protect",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = m25p80_wp_level_srwd_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(wp_level, Flash),
+        VMSTATE_BOOL(status_register_write_disabled, Flash),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m25p80 = {
     .name = "m25p80",
     .version_id = 0,
@@ -1618,6 +1669,7 @@ static const VMStateDescription vmstate_m25p80 = {
     .subsections = (const VMStateDescription * []) {
         &vmstate_m25p80_data_read_loop,
         &vmstate_m25p80_aai_enable,
+        &vmstate_m25p80_write_protect,
         NULL
     }
 };
-- 
2.35.3

