Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp333602lft;
        Fri, 24 Jun 2022 06:43:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uUH4TYpecFhxSDFhPv6k3EFrnGLqRSo7CZzRCFZuNpRVzM72KCCbj4RxbEkIl0tBokZW2J
X-Received: by 2002:a0c:e3cd:0:b0:470:5aec:e158 with SMTP id e13-20020a0ce3cd000000b004705aece158mr14719078qvl.42.1656078222709;
        Fri, 24 Jun 2022 06:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656078222; cv=none;
        d=google.com; s=arc-20160816;
        b=aKP266o92qubEsC24RlyD0+PYl6irKMPp/r1lk2OgT7fUWDJkS7OJViSKSFXs7W/cy
         p9saKiM/vyGOXUTzpzAcS69F5M4GGYF74mkcQBBuIyXMx+Wd2QLWBqeB9I0H7rd7nHtZ
         QaZiWcNMakha4b3Pb64r0hv6ZdJ1xnoOaoWLReKdniJwd7KX0MDz+hXn/xn0NSVyek/8
         XVoA1npBUri6PDaMeeBrAcWjFt/pisd5tSxXW3/YaJXebHjT28vJrwot0gv7Mhw3hlJx
         aVNC/ivzmxTo4NERcOyXI2+ZlV82O/qQ/KPu2qIrKSWAmZIhGssg0z0B/URP4M9fdL8H
         EHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=RWSKun6L8MebER57mxQ4p2jMPfbaX5SY4yJS+6wIw+Y=;
        b=pAx10VipBEiCb0pKKBTcmUu4TgkHsTR4uH9PEeluivdvrrQ/wS5pNGU/oBifCO331M
         /BP//jFsbGCK3EYFmvj+iU2Cf3DYmqr+d0XQFE1M/IIQoe6+VBoiKZofkgBpsy8LNWj9
         Q55fvYryC16PZmoSGyXBCtbP4UxKSZS002Bb/I2/rGvT3L1QTYJYTXw9IXHksoSPtllf
         XEBFSZnNqz1DRjh/SlSg2jMwtWXlUZ99DVI2s4cCWdu2YOEyAz1zQykKFf95a6qQXBX/
         Ux/uRQpME5lb5A/V2vh36ivdBdscQdVl58mVcW/XAvsHvkmdJ+nDPa4BHRy/pLkiXmsc
         V1IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=V1LUS1Xg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dp4-20020a05620a2b4400b006a7172b071fsi1687920qkb.360.2022.06.24.06.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=V1LUS1Xg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4jb4-0002Ab-5t
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZ9-0007Ij-I9; Fri, 24 Jun 2022 09:41:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZ7-00055H-Ko; Fri, 24 Jun 2022 09:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RWSKun6L8MebER57mxQ4p2jMPfbaX5SY4yJS+6wIw+Y=; b=V1LUS1Xgp2NqT3hEZ9OAk4mKzT
 e9Z8+sWw3ZlXIIGukNITVVrH2OT5AlEauTfZ1NFy5uW/6Qn3MDtY68DuLLG8kJ2/6F4AijgJK2xkb
 zP/ZGbBDiOFtQG6nXaBzyqClPL4RgXROjXXhmfl4w9wAUX5ZAp1gBGFzMzJ1uqquQXJkU8DOCBYdf
 BfaCcn0Jj+oLP57Z5rXPCU11iBH9r12RJ7o/KGvD0Efk7T73lmss/srf4tLy/9cGh/lEfPC1bKR9+
 uhqph9IDCqRMuLD1/z8UGxADje+gt7N0CGf+7XyF0Qy3VqlpGuepKhaVk+0nity4dNLV7k5QuMCx4
 9gTZXzoloz81RNnBDgmQ7n/B4eAnNtp2flcSlEuhZrLQuhn/wJloEQGpDV2gj6CGvsLG88L4+NOU5
 u1NYbegB7n90tuLRZnVsbDcArxclF+TyJfPtMK9j1P99ER9M8yLqKIjTmqCvH34S8aygkopnS2zQs
 wJxPxv9lxCh0HP4wQSSNw5LWrR08cqcesgRVoNwpWf+yWh3XKbu85vorOZKi9n+/jBnt7uc5B3J7p
 aK0VYfHHq5Or92RPJ3HUqOqaX8xRX8yY/kdYg5utsfaQaBBr2uF+LFKzwaBb8obAuZtA9cCCYEjL6
 I49KSptuuBfstde0y4q3PgeYPp2pCYnzSWpPA38SU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jXp-00037t-B4; Fri, 24 Jun 2022 14:40:24 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:20 +0100
Message-Id: <20220624134109.881989-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 05/54] ps2: move QOM type definitions from ps2.c to ps2.h
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y2QiMTeB9oM+

Move the QOM type definitions into the ps2.h header file to allow the new QOM
types to be used by other devices.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/ps2.c         | 55 ---------------------------------------
 include/hw/input/ps2.h | 58 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index ee7c36d4f2..f4bad9876a 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -76,11 +76,6 @@
 #define MOUSE_STATUS_ENABLED    0x20
 #define MOUSE_STATUS_SCALE21    0x10
 
-/*
- * PS/2 buffer size. Keep 256 bytes for compatibility with
- * older QEMU versions.
- */
-#define PS2_BUFFER_SIZE     256
 #define PS2_QUEUE_SIZE      16  /* Queue size required by PS/2 protocol */
 #define PS2_QUEUE_HEADROOM  8   /* Queue size for keyboard command replies */
 
@@ -92,56 +87,6 @@
 #define MOD_SHIFT_R (1 << 4)
 #define MOD_ALT_R   (1 << 5)
 
-typedef struct {
-    uint8_t data[PS2_BUFFER_SIZE];
-    int rptr, wptr, cwptr, count;
-} PS2Queue;
-
-struct PS2State {
-    SysBusDevice parent_obj;
-
-    PS2Queue queue;
-    int32_t write_cmd;
-    void (*update_irq)(void *, int);
-    void *update_arg;
-};
-
-#define TYPE_PS2_DEVICE "ps2-device"
-OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
-
-struct PS2KbdState {
-    PS2State parent_obj;
-
-    int scan_enabled;
-    int translate;
-    int scancode_set; /* 1=XT, 2=AT, 3=PS/2 */
-    int ledstate;
-    bool need_high_bit;
-    unsigned int modifiers; /* bitmask of MOD_* constants above */
-};
-
-#define TYPE_PS2_KBD_DEVICE "ps2-kbd"
-OBJECT_DECLARE_SIMPLE_TYPE(PS2KbdState, PS2_KBD_DEVICE)
-
-struct PS2MouseState {
-    PS2State parent_obj;
-
-    uint8_t mouse_status;
-    uint8_t mouse_resolution;
-    uint8_t mouse_sample_rate;
-    uint8_t mouse_wrap;
-    uint8_t mouse_type; /* 0 = PS2, 3 = IMPS/2, 4 = IMEX */
-    uint8_t mouse_detect_state;
-    int mouse_dx; /* current values, needed for 'poll' mode */
-    int mouse_dy;
-    int mouse_dz;
-    int mouse_dw;
-    uint8_t mouse_buttons;
-};
-
-#define TYPE_PS2_MOUSE_DEVICE "ps2-mouse"
-OBJECT_DECLARE_SIMPLE_TYPE(PS2MouseState, PS2_MOUSE_DEVICE)
-
 static uint8_t translate_table[256] = {
     0xff, 0x43, 0x41, 0x3f, 0x3d, 0x3b, 0x3c, 0x58,
     0x64, 0x44, 0x42, 0x40, 0x3e, 0x0f, 0x29, 0x59,
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 35d983897a..7f2c3f6090 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -25,13 +25,69 @@
 #ifndef HW_PS2_H
 #define HW_PS2_H
 
+#include "hw/sysbus.h"
+
 #define PS2_MOUSE_BUTTON_LEFT   0x01
 #define PS2_MOUSE_BUTTON_RIGHT  0x02
 #define PS2_MOUSE_BUTTON_MIDDLE 0x04
 #define PS2_MOUSE_BUTTON_SIDE   0x08
 #define PS2_MOUSE_BUTTON_EXTRA  0x10
 
-typedef struct PS2State PS2State;
+/*
+ * PS/2 buffer size. Keep 256 bytes for compatibility with
+ * older QEMU versions.
+ */
+#define PS2_BUFFER_SIZE     256
+
+typedef struct {
+    uint8_t data[PS2_BUFFER_SIZE];
+    int rptr, wptr, cwptr, count;
+} PS2Queue;
+
+struct PS2State {
+    SysBusDevice parent_obj;
+
+    PS2Queue queue;
+    int32_t write_cmd;
+    void (*update_irq)(void *, int);
+    void *update_arg;
+};
+
+#define TYPE_PS2_DEVICE "ps2-device"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
+
+struct PS2KbdState {
+    PS2State parent_obj;
+
+    int scan_enabled;
+    int translate;
+    int scancode_set; /* 1=XT, 2=AT, 3=PS/2 */
+    int ledstate;
+    bool need_high_bit;
+    unsigned int modifiers; /* bitmask of MOD_* constants above */
+};
+
+#define TYPE_PS2_KBD_DEVICE "ps2-kbd"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2KbdState, PS2_KBD_DEVICE)
+
+struct PS2MouseState {
+    PS2State parent_obj;
+
+    uint8_t mouse_status;
+    uint8_t mouse_resolution;
+    uint8_t mouse_sample_rate;
+    uint8_t mouse_wrap;
+    uint8_t mouse_type; /* 0 = PS2, 3 = IMPS/2, 4 = IMEX */
+    uint8_t mouse_detect_state;
+    int mouse_dx; /* current values, needed for 'poll' mode */
+    int mouse_dy;
+    int mouse_dz;
+    int mouse_dw;
+    uint8_t mouse_buttons;
+};
+
+#define TYPE_PS2_MOUSE_DEVICE "ps2-mouse"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2MouseState, PS2_MOUSE_DEVICE)
 
 /* ps2.c */
 void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg);
-- 
2.30.2

