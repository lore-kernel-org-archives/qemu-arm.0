Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3066459lfh;
        Sun, 22 May 2022 11:33:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5Gq/HtiTY8CMN0oP6w/cKZbpe+My24A70OlTG6fWVZ1DG09l4YejUHuI3oaZoQT/pnJoh
X-Received: by 2002:a05:622a:448:b0:2f3:d76d:7b98 with SMTP id o8-20020a05622a044800b002f3d76d7b98mr14019582qtx.679.1653244383681;
        Sun, 22 May 2022 11:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653244383; cv=none;
        d=google.com; s=arc-20160816;
        b=cn2D+5hcjjSyeZYj0hYNa467dsR2J67lluPYdhsz9hiBGRCFTV9byLGYUP4SvpY5bk
         +Jj5hyFdabJqM/7vsZ68431U29JUT9ySjb2g7YlynDHltcT7zrRqEobvV8vAk6G3x3Vz
         afSRF6DznE2oDD6RNQQxqFOL4PKgJbj2RS9gWCYL1Fyo+XWfDF7ee2vzsdg0J8jlDHsj
         OOd5kVLzw+IHjqbYnFEu30m9r71HNv2pmOczSvQAccYVQlG4TFekR7WPYUxPVaX2pqBL
         2P1B7hKBZ0VyW7nV7CCW79yVqKUhlOS7UrLKeAsODkTz96qn2w9itUjgLbQtyP+xbtcL
         5aiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=RuPoPe8DnX9QMlugXse1vui/tj77KN5fr2keNVGuvVQ=;
        b=qWY5wY4/KmCBdkm5qYrT5S3KCY//wG4hUSb3WP5GdhzO07f/RjHAl1hgGmZdQUauEu
         zPeZU0s5fiAT8ASQfj9nZ5VkAN/ikwTYW/UUqpi431Iz/63XvltEJIEZaLSL+S55+NrQ
         ypIU3aUBU/LqaUYZuClU/+THXyL8Pfpri0DPwSFK6YcKgslEvN1IBf21gnYwnKyHtBnc
         P712YLoXNUyMxa7ZzgYdH/qWU2po2mZXk7cIzgnFvkFarWIAP13LY3zYMxfaG2bwgUjr
         UJSyT+kWnduXxlpUE2iYP0W6fAg8LFJFWjb20eJHC69CbGATHBcQtjA8dy/+oOBZPWyI
         mSgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="Km7Kn9/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a05622a058e00b002e1fbf3c0bdsi1726394qtb.686.2022.05.22.11.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="Km7Kn9/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqNz-0000vS-6f
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAf-0006nQ-Td; Sun, 22 May 2022 14:19:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAd-0003Wz-7z; Sun, 22 May 2022 14:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RuPoPe8DnX9QMlugXse1vui/tj77KN5fr2keNVGuvVQ=; b=Km7Kn9/SHgbTOqWLs6JuvhVaYX
 K95lQklyY8aOthqH/t6SkyzlRGeoRZTwfrTN5WSMuPYgp7FdCGTVh3CIWj+pwnKWa4K8ujzNHIcXi
 hIRHQh3hVy/IeRApzG3IkeSTcU0FFznkJIOijAXDOwzDzKwDdH+z+Odqno5agy3Z8NfKilWvnc0Eu
 zuGjlYdQ9kizxVPLaDr5IiCdYvTEskBF56TIPggZa9X/bwMLa5mcQxyl32YOZo9oVPlyWuSwRB3GJ
 R+doAqq13aXmbfDfzCeDj2bpa9tKvIwzN4DpghbmHKrmZA7TYTLG5a3UTT/4L1ytTHYcQ7n2eEhbd
 63lFAEEN+fUiHZzrre8TcRvk+OGW2d/KpMnTo70NvRCzUCufnO477/fZ4UVFcdIzgDzIjrMPZ+Njn
 yPIk5F5+OihgvRP2v9YXf2zFPyYoVU3uGFCL1RI2xwcXodfuwEO15EbiyJkI03XYA7Jg0mf9tEVfr
 qKbU5gENcWgCaRGnOCSzk+paTLHWefLsVgfLkPai9HK6wnCSaMWMdz57WHjSpfUu8+Yl5HuOvVjhG
 Phi/lLWwVxqnZf9VJ24IuZF9zXshYdedXhb0uENpx21Rd/okEvwcqfeAgM5n4P2thdBfzqbOVVAnZ
 vegVn8yAVTi3F4xFXxAZHUSFAgoGJtu+deh5WBTm8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9W-0007pH-C1; Sun, 22 May 2022 19:18:06 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:52 +0100
Message-Id: <20220522181836.864-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 06/50] ps2: improve function prototypes in ps2.c and ps2.h
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
X-TUID: 8M1k1t1klysg

With the latest changes it is now possible to improve some of the function
prototypes in ps2.c and ps.h to use the appropriate PS2KbdState or
PS2MouseState type instead of being a void opaque.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c         | 22 +++++++++-------------
 include/hw/input/ps2.h |  8 ++++----
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index f4bad9876a..3a770f3b78 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -581,12 +581,11 @@ static void ps2_reset_keyboard(PS2KbdState *s)
     ps2_set_ledstate(s, 0);
 }
 
-void ps2_write_keyboard(void *opaque, int val)
+void ps2_write_keyboard(PS2KbdState *s, int val)
 {
-    PS2KbdState *s = (PS2KbdState *)opaque;
     PS2State *ps2 = PS2_DEVICE(s);
 
-    trace_ps2_write_keyboard(opaque, val);
+    trace_ps2_write_keyboard(s, val);
     ps2_cqueue_reset(ps2);
     switch (ps2->write_cmd) {
     default:
@@ -675,10 +674,9 @@ void ps2_write_keyboard(void *opaque, int val)
  * 1 = translated scancodes (used by qemu internally).
  */
 
-void ps2_keyboard_set_translation(void *opaque, int mode)
+void ps2_keyboard_set_translation(PS2KbdState *s, int mode)
 {
-    PS2KbdState *s = (PS2KbdState *)opaque;
-    trace_ps2_keyboard_set_translation(opaque, mode);
+    trace_ps2_keyboard_set_translation(s, mode);
     s->translate = mode;
 }
 
@@ -857,20 +855,18 @@ static void ps2_mouse_sync(DeviceState *dev)
     }
 }
 
-void ps2_mouse_fake_event(void *opaque)
+void ps2_mouse_fake_event(PS2MouseState *s)
 {
-    PS2MouseState *s = opaque;
-    trace_ps2_mouse_fake_event(opaque);
+    trace_ps2_mouse_fake_event(s);
     s->mouse_dx++;
-    ps2_mouse_sync(opaque);
+    ps2_mouse_sync(DEVICE(s));
 }
 
-void ps2_write_mouse(void *opaque, int val)
+void ps2_write_mouse(PS2MouseState *s, int val)
 {
-    PS2MouseState *s = (PS2MouseState *)opaque;
     PS2State *ps2 = PS2_DEVICE(s);
 
-    trace_ps2_write_mouse(opaque, val);
+    trace_ps2_write_mouse(s, val);
     switch (ps2->write_cmd) {
     default:
     case -1:
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 7f2c3f6090..1a3321d77e 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -92,8 +92,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PS2MouseState, PS2_MOUSE_DEVICE)
 /* ps2.c */
 void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg);
 void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg);
-void ps2_write_mouse(void *, int val);
-void ps2_write_keyboard(void *, int val);
+void ps2_write_mouse(PS2MouseState *s, int val);
+void ps2_write_keyboard(PS2KbdState *s, int val);
 uint32_t ps2_read_data(PS2State *s);
 void ps2_queue_noirq(PS2State *s, int b);
 void ps2_raise_irq(PS2State *s);
@@ -101,8 +101,8 @@ void ps2_queue(PS2State *s, int b);
 void ps2_queue_2(PS2State *s, int b1, int b2);
 void ps2_queue_3(PS2State *s, int b1, int b2, int b3);
 void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4);
-void ps2_keyboard_set_translation(void *opaque, int mode);
-void ps2_mouse_fake_event(void *opaque);
+void ps2_keyboard_set_translation(PS2KbdState *s, int mode);
+void ps2_mouse_fake_event(PS2MouseState *s);
 int ps2_queue_empty(PS2State *s);
 
 #endif /* HW_PS2_H */
-- 
2.20.1

