Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp485551lfc;
        Thu, 28 May 2020 05:40:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4DR7Hc/hk1P0rqWvgSJvfoeY/8ekbkb4Zh6f16xRuiJTS0iZeB9wJWgIy3V8w6qHwRHWh
X-Received: by 2002:a25:7b87:: with SMTP id w129mr5076398ybc.446.1590669621929;
        Thu, 28 May 2020 05:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669621; cv=none;
        d=google.com; s=arc-20160816;
        b=vSff54z31J8XQWEXUxGBJathmizgkN8DZ8tmp74UkxaaRdEig9h103GAsUnaB/6xQJ
         Wn4oBuE/OS7sBuesDT7PxVIbOeOOTgW5k6sQjcfkB2N5WuAMxIHJgZ6GVmgXvMU7LuVb
         jAeIgy5TIF0rdiExUFup9C91kv3q7TONEFjdMcmixHpm6jzl6CoKfvBc+UtQac0XBjSm
         k7Xp58JpfKDjOl0GMrIrAWEtf/DvYXKufo+CfF5jZAwMogNI4sS7GByk7qAykh2MPaxo
         xRduyP46wYcC5Iq42dPwSHXbxvzxi47WtpcimILz6vGqy7y004VB3xVRQyM9Yz4P6yZf
         OF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=kl0xBtkQvSUQVd60CS6Y6dEgde7UHK4QkuNltk2B7pU=;
        b=PtywpoCaeysDziNWJ/Ma64iNZzLwDoJY6hHkzg6HMBGxN2uOxirfj7fbp75GNroJh/
         ZjVFyLvInzTIhcMDoNE7rllmKgbDCCntNwrahpabhCHakIJI8i8NAwnhUWIaC5u58BTU
         jk4EYpsiOtu3+8XVtNuFa3gG6cybqpvirB85M77dC6u2/bCceRikqibtFxh7/PYc7grw
         G6aMRlifI00GbuSsT6ChuPx+TeHNUaTUIwEQZRnQJoZOn5CK5XYifo8AX7odD7fKjk5C
         mOktyNfyt229rHO8N2OL0+rN0xcKtujU2WBL6a6yiG8w1x2RsruH029rxeVquGYb6NOb
         locg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CXxfpclX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n128si5363914ybc.217.2020.05.28.05.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CXxfpclX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHpd-0001TQ-66
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlq-0001UI-Fj
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:26 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54173
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlo-00059t-Nd
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=kl0xBtkQvSUQVd60CS6Y6dEgde7UHK4QkuNltk2B7pU=;
 b=CXxfpclXo8KOeUmq+GqcMRqXRLs7F0Eu14Xui6qDVJn6f0CE1o6DqgmWObrGuhDWqzlH1e
 U6rAxKKul95FjzN7LQLKcp6ATsiGlhDNr3k3Jklf2xq/nXeWcXsPm/ybrEcrJCQ4B/t+8y
 gSckLJgejL7fRkirH0Evp4bwmZ2NI9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-O7_HnLG7PO67Hlo35-CL6A-1; Thu, 28 May 2020 08:36:21 -0400
X-MC-Unique: O7_HnLG7PO67Hlo35-CL6A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7924EC1A2;
 Thu, 28 May 2020 12:36:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21D547A8B4;
 Thu, 28 May 2020 12:36:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 130659D71; Thu, 28 May 2020 14:36:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/21] sm501: Replace hand written implementation with pixman
 where possible
Date: Thu, 28 May 2020 14:36:07 +0200
Message-Id: <20200528123609.27362-20-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 06:31:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 20o1QOISZ/9N

From: BALATON Zoltan <balaton@eik.bme.hu>

Besides being faster this should also prevent malicious guests to
abuse 2D engine to overwrite data or cause a crash.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-id: 58666389b6cae256e4e972a32c05cf8aa51bffc0.1590089984.git.balaton@eik.bme.hu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/sm501.c | 205 ++++++++++++++++++++++++++-------------------
 1 file changed, 118 insertions(+), 87 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 5ed57703d811..8bf4d111f4b3 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -706,13 +706,12 @@ static void sm501_2d_operation(SM501State *s)
     /* 1 if rop2 source is the pattern, otherwise the source is the bitmap */
     int rop2_source_is_pattern = (s->twoD_control >> 14) & 0x1;
     int rop = s->twoD_control & 0xFF;
-    int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
-    int dst_y = s->twoD_destination & 0xFFFF;
-    int width = (s->twoD_dimension >> 16) & 0x1FFF;
-    int height = s->twoD_dimension & 0xFFFF;
+    unsigned int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
+    unsigned int dst_y = s->twoD_destination & 0xFFFF;
+    unsigned int width = (s->twoD_dimension >> 16) & 0x1FFF;
+    unsigned int height = s->twoD_dimension & 0xFFFF;
     uint32_t dst_base = s->twoD_destination_base & 0x03FFFFFF;
-    uint8_t *dst = s->local_mem + dst_base;
-    int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
+    unsigned int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
     int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
 
@@ -721,104 +720,136 @@ static void sm501_2d_operation(SM501State *s)
         return;
     }
 
-    if (rop_mode == 0) {
-        if (rop != 0xcc) {
-            /* Anything other than plain copies are not supported */
-            qemu_log_mask(LOG_UNIMP, "sm501: rop3 mode with rop %x is not "
-                          "supported.\n", rop);
-        }
-    } else {
-        if (rop2_source_is_pattern && rop != 0x5) {
-            /* For pattern source, we support only inverse dest */
-            qemu_log_mask(LOG_UNIMP, "sm501: rop2 source being the pattern and "
-                          "rop %x is not supported.\n", rop);
-        } else {
-            if (rop != 0x5 && rop != 0xc) {
-                /* Anything other than plain copies or inverse dest is not
-                 * supported */
-                qemu_log_mask(LOG_UNIMP, "sm501: rop mode %x is not "
-                              "supported.\n", rop);
-            }
-        }
-    }
-
     if (s->twoD_source_base & BIT(27) || s->twoD_destination_base & BIT(27)) {
         qemu_log_mask(LOG_UNIMP, "sm501: only local memory is supported.\n");
         return;
     }
 
+    if (!dst_pitch) {
+        qemu_log_mask(LOG_GUEST_ERROR, "sm501: Zero dest pitch.\n");
+        return;
+    }
+
+    if (!width || !height) {
+        qemu_log_mask(LOG_GUEST_ERROR, "sm501: Zero size 2D op.\n");
+        return;
+    }
+
+    if (rtl) {
+        dst_x -= width - 1;
+        dst_y -= height - 1;
+    }
+
+    if (dst_base >= get_local_mem_size(s) || dst_base +
+        (dst_x + width + (dst_y + height) * (dst_pitch + width)) *
+        (1 << format) >= get_local_mem_size(s)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "sm501: 2D op dest is outside vram.\n");
+        return;
+    }
+
     switch (cmd) {
-    case 0x00: /* copy area */
+    case 0: /* BitBlt */
     {
-        int src_x = (s->twoD_source >> 16) & 0x01FFF;
-        int src_y = s->twoD_source & 0xFFFF;
+        unsigned int src_x = (s->twoD_source >> 16) & 0x01FFF;
+        unsigned int src_y = s->twoD_source & 0xFFFF;
         uint32_t src_base = s->twoD_source_base & 0x03FFFFFF;
-        uint8_t *src = s->local_mem + src_base;
-        int src_pitch = s->twoD_pitch & 0x1FFF;
+        unsigned int src_pitch = s->twoD_pitch & 0x1FFF;
 
-#define COPY_AREA(_bpp, _pixel_type, rtl) {                                   \
-        int y, x, index_d, index_s;                                           \
-        for (y = 0; y < height; y++) {                              \
-            for (x = 0; x < width; x++) {                           \
-                _pixel_type val;                                              \
-                                                                              \
-                if (rtl) {                                                    \
-                    index_s = ((src_y - y) * src_pitch + src_x - x) * _bpp;   \
-                    index_d = ((dst_y - y) * dst_pitch + dst_x - x) * _bpp;   \
-                } else {                                                      \
-                    index_s = ((src_y + y) * src_pitch + src_x + x) * _bpp;   \
-                    index_d = ((dst_y + y) * dst_pitch + dst_x + x) * _bpp;   \
-                }                                                             \
-                if (rop_mode == 1 && rop == 5) {                              \
-                    /* Invert dest */                                         \
-                    val = ~*(_pixel_type *)&dst[index_d];                     \
-                } else {                                                      \
-                    val = *(_pixel_type *)&src[index_s];                      \
-                }                                                             \
-                *(_pixel_type *)&dst[index_d] = val;                          \
-            }                                                                 \
-        }                                                                     \
-    }
-        switch (format) {
-        case 0:
-            COPY_AREA(1, uint8_t, rtl);
-            break;
-        case 1:
-            COPY_AREA(2, uint16_t, rtl);
-            break;
-        case 2:
-            COPY_AREA(4, uint32_t, rtl);
-            break;
+        if (!src_pitch) {
+            qemu_log_mask(LOG_GUEST_ERROR, "sm501: Zero src pitch.\n");
+            return;
+        }
+
+        if (rtl) {
+            src_x -= width - 1;
+            src_y -= height - 1;
+        }
+
+        if (src_base >= get_local_mem_size(s) || src_base +
+            (src_x + width + (src_y + height) * (src_pitch + width)) *
+            (1 << format) >= get_local_mem_size(s)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "sm501: 2D op src is outside vram.\n");
+            return;
+        }
+
+        if ((rop_mode && rop == 0x5) || (!rop_mode && rop == 0x55)) {
+            /* Invert dest, is there a way to do this with pixman? */
+            unsigned int x, y, i;
+            uint8_t *d = s->local_mem + dst_base;
+
+            for (y = 0; y < height; y++) {
+                i = (dst_x + (dst_y + y) * dst_pitch) * (1 << format);
+                for (x = 0; x < width; x++, i += (1 << format)) {
+                    switch (format) {
+                    case 0:
+                        d[i] = ~d[i];
+                        break;
+                    case 1:
+                        *(uint16_t *)&d[i] = ~*(uint16_t *)&d[i];
+                        break;
+                    case 2:
+                        *(uint32_t *)&d[i] = ~*(uint32_t *)&d[i];
+                        break;
+                    }
+                }
+            }
+        } else {
+            /* Do copy src for unimplemented ops, better than unpainted area */
+            if ((rop_mode && (rop != 0xc || rop2_source_is_pattern)) ||
+                (!rop_mode && rop != 0xcc)) {
+                qemu_log_mask(LOG_UNIMP,
+                              "sm501: rop%d op %x%s not implemented\n",
+                              (rop_mode ? 2 : 3), rop,
+                              (rop2_source_is_pattern ?
+                                  " with pattern source" : ""));
+            }
+            /* Check for overlaps, this could be made more exact */
+            uint32_t sb, se, db, de;
+            sb = src_base + src_x + src_y * (width + src_pitch);
+            se = sb + width + height * (width + src_pitch);
+            db = dst_base + dst_x + dst_y * (width + dst_pitch);
+            de = db + width + height * (width + dst_pitch);
+            if (rtl && ((db >= sb && db <= se) || (de >= sb && de <= se))) {
+                /* regions may overlap: copy via temporary */
+                int llb = width * (1 << format);
+                int tmp_stride = DIV_ROUND_UP(llb, sizeof(uint32_t));
+                uint32_t *tmp = g_malloc(tmp_stride * sizeof(uint32_t) *
+                                         height);
+                pixman_blt((uint32_t *)&s->local_mem[src_base], tmp,
+                           src_pitch * (1 << format) / sizeof(uint32_t),
+                           tmp_stride, 8 * (1 << format), 8 * (1 << format),
+                           src_x, src_y, 0, 0, width, height);
+                pixman_blt(tmp, (uint32_t *)&s->local_mem[dst_base],
+                           tmp_stride,
+                           dst_pitch * (1 << format) / sizeof(uint32_t),
+                           8 * (1 << format), 8 * (1 << format),
+                           0, 0, dst_x, dst_y, width, height);
+                g_free(tmp);
+            } else {
+                pixman_blt((uint32_t *)&s->local_mem[src_base],
+                           (uint32_t *)&s->local_mem[dst_base],
+                           src_pitch * (1 << format) / sizeof(uint32_t),
+                           dst_pitch * (1 << format) / sizeof(uint32_t),
+                           8 * (1 << format), 8 * (1 << format),
+                           src_x, src_y, dst_x, dst_y, width, height);
+            }
         }
         break;
     }
-    case 0x01: /* fill rectangle */
+    case 1: /* Rectangle Fill */
     {
         uint32_t color = s->twoD_foreground;
 
-#define FILL_RECT(_bpp, _pixel_type) {                                      \
-        int y, x;                                                           \
-        for (y = 0; y < height; y++) {                            \
-            for (x = 0; x < width; x++) {                         \
-                int index = ((dst_y + y) * dst_pitch + dst_x + x) * _bpp;   \
-                *(_pixel_type *)&dst[index] = (_pixel_type)color;           \
-            }                                                               \
-        }                                                                   \
-    }
-
-        switch (format) {
-        case 0:
-            FILL_RECT(1, uint8_t);
-            break;
-        case 1:
-            color = cpu_to_le16(color);
-            FILL_RECT(2, uint16_t);
-            break;
-        case 2:
+        if (format == 2) {
             color = cpu_to_le32(color);
-            FILL_RECT(4, uint32_t);
-            break;
+        } else if (format == 1) {
+            color = cpu_to_le16(color);
         }
+
+        pixman_fill((uint32_t *)&s->local_mem[dst_base],
+                    dst_pitch * (1 << format) / sizeof(uint32_t),
+                    8 * (1 << format), dst_x, dst_y, width, height, color);
         break;
     }
     default:
-- 
2.18.4

