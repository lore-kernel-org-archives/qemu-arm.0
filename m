Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1336431ejc;
        Fri, 13 Oct 2023 01:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWrgc94EtSlMVL2AWw8KXg812dbury2tmoVdVlsxviOFgFXlmzkoonSdDrqIGBCRvDWp7M
X-Received: by 2002:a05:6214:5296:b0:66d:1e8f:bb8b with SMTP id kj22-20020a056214529600b0066d1e8fbb8bmr2996779qvb.32.1697184253425;
        Fri, 13 Oct 2023 01:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697184253; cv=none;
        d=google.com; s=arc-20160816;
        b=DoNj0MqY6/Y5PkE2EQruye2xhpLzwxqJvi+TMKfb6kQZzeCTcKsfO4UioBI746hlsw
         Y7NPeLpQdT7BzPamSvdbd0CZfayatDg1FWMZr9ysdaS/A+eLkGvyPpltKc/b8D1fHNx1
         b87Lghoy1DKIeWZTLWLZ4fi18PoJ6sjS4FEgMqHaNcvVcsvaUtAN9twkOQXppsMtlkdh
         BC1fS5OB4VfEFT2llC+nikubBWVSEmjx34rAm2FTx/ONvJm6vvcpPAOLvF8sUVfaC+5f
         lJTxKferPsGr6FdP+d5rPYiM6DtYB+K+6rb9L+qnlEDgMOXFtcvxV5ck2BnWwA53UqcE
         mxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TgVJaEUfo38wurBGn+D3UK3JXthAmJ84+zCqcU6HvLo=;
        fh=gQ1RCyc3uP7CJi1mDAT8BZLlKuVlGP7hG0bBdYvZ48k=;
        b=BGBJl0rC5UiIiY9NQwQdkrZGSBdK6fVc/jTAKWjMIloUb38BpTGuKYoEar0of6ueY/
         HKrJ6xHkCRN1jbEz41qBgxYYXAPHJHMrUhWKC9uTo+A0WthZyfi4h4cJ/e/F8CVOAkt2
         0EAF6p7xV5Jius1YsNYPRF6CB2EyhyfOuOJ9H4W8bDSGTM/I1ATDjnxpM11J8VQDNUfv
         dExcYVex/tXpJzUXRQC8ddg6012elnvYMU/mu3BWXA2WdHIeS4/79vW0AUp7RRSKOUPM
         9xi/Mgo7jeSKeVujonR+nXANB/TaUuCOFWlF7pxSn3Y5U3b6fLmFTf6+mIepYTI0Uc4e
         RPNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QXXJ28VI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020ad4420f000000b0066d04196c41si830223qvp.143.2023.10.13.01.04.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:04:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QXXJ28VI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCzM-0005NA-Hv; Fri, 13 Oct 2023 03:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCyB-0002Ck-T0
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:52:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxr-0005Ma-Tl
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:52:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3296b3f03e5so1614805f8f.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183526; x=1697788326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgVJaEUfo38wurBGn+D3UK3JXthAmJ84+zCqcU6HvLo=;
 b=QXXJ28VI4GxcOAqDcNdbzAVI5q0WuVldZSSJVRn3+rPK981k5cn6Y07XxED4HEsp1g
 O25DPRjL46m/ZhHEeolNdgrZV7/Joatn/PTxtRqDVm8QWb6+DY/QGQYzxupgFyvkUz38
 rELP7KbiNAVWsrWpzNhewdjDvnnQXYRXwbv6qTv3hkSbh75ytKsJhtMU0QuiyY+/K+Io
 u89ksfOD6vKCvfTEnlExsrhenUi73Y+UDomAzeezQERcitogfPvkgUQNoJDONlIUsXIY
 +jCMCOgzx+/FblyyNm1w8nrlc3C3Dqp0vrASjbUfCcJpf43sOd1It6ME5SLcC4fBx2z/
 TNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183526; x=1697788326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TgVJaEUfo38wurBGn+D3UK3JXthAmJ84+zCqcU6HvLo=;
 b=usIA5TxXBEREXQq8Ga+WUbAN6Te85VAhkQveFHqGLVtR8vS0qACW3F18k0Wj+31na0
 B54TK8kbdtes2//ea8/J6myhjY+hOM1BqdGB4VnTKE45SON1ODksta7kKTEUr2hfkn57
 5MOe5ysoMF02u3vrIiy0pKUDVt3UrhIH8IdkF60f6iYnBtiaFtwknpWSOMvEfcuD5Gf4
 Jzex+Z3WCsSc1+z3rwsJdX2CyuNhT5u1xbKePEwIjR2UGgrSTIousjPd5jNwyY0AKJiR
 dPEK5FrdADafeITA8tdtDU1L+mHmssZ8lGrTAIo6B6B/10ArOT+X7fncOnOY6FUV+e7a
 P/4A==
X-Gm-Message-State: AOJu0Yxi4cqHGk36zz82yLMRFVD0hejqogkSRJaXoeyT2hM1MPo/aSRG
 yBSrL00/6GvfJqmI72ZzajJ/fg==
X-Received: by 2002:a5d:4c8a:0:b0:32d:8f5d:c6db with SMTP id
 z10-20020a5d4c8a000000b0032d8f5dc6dbmr3286780wrs.16.1697183526541; 
 Fri, 13 Oct 2023 00:52:06 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:52:06 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH 56/78] hw/input: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:48:19 +0300
Message-Id: <7f9ab65c5376669408c00fa27d187aef66f2d26e.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bKWnzeO0c1NV

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/input/hid.c     | 3 ++-
 hw/input/tsc2005.c | 4 ++--
 hw/input/tsc210x.c | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index a9c7dd1ce1..15fffc5dfb 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -250,88 +250,89 @@ static void hid_keyboard_event(DeviceState *dev, QemuConsole *src,
 static void hid_keyboard_process_keycode(HIDState *hs)
 {
     uint8_t hid_code, index, key;
     int i, keycode, slot;
 
     if (hs->n == 0) {
         return;
     }
     slot = hs->head & QUEUE_MASK; QUEUE_INCR(hs->head); hs->n--;
     keycode = hs->kbd.keycodes[slot];
 
     if (!hs->n) {
         trace_hid_kbd_queue_empty();
     }
 
     key = keycode & 0x7f;
     index = key | ((hs->kbd.modifiers & (1 << 8)) >> 1);
     hid_code = hid_usage_keys[index];
     hs->kbd.modifiers &= ~(1 << 8);
 
     switch (hid_code) {
     case 0x00:
         return;
 
     case 0xe0:
         assert(key == 0x1d);
         if (hs->kbd.modifiers & (1 << 9)) {
             /* The hid_codes for the 0xe1/0x1d scancode sequence are 0xe9/0xe0.
              * Here we're processing the second hid_code.  By dropping bit 9
              * and setting bit 8, the scancode after 0x1d will access the
              * second half of the table.
              */
             hs->kbd.modifiers ^= (1 << 8) | (1 << 9);
             return;
         }
         /* fall through to process Ctrl_L */
+        fallthrough;
     case 0xe1 ... 0xe7:
         /* Ctrl_L/Ctrl_R, Shift_L/Shift_R, Alt_L/Alt_R, Win_L/Win_R.
          * Handle releases here, or fall through to process presses.
          */
         if (keycode & (1 << 7)) {
             hs->kbd.modifiers &= ~(1 << (hid_code & 0x0f));
             return;
         }
-        /* fall through */
+        fallthrough;
     case 0xe8 ... 0xe9:
         /* USB modifiers are just 1 byte long.  Bits 8 and 9 of
          * hs->kbd.modifiers implement a state machine that detects the
          * 0xe0 and 0xe1/0x1d sequences.  These bits do not follow the
          * usual rules where bit 7 marks released keys; they are cleared
          * elsewhere in the function as the state machine dictates.
          */
         hs->kbd.modifiers |= 1 << (hid_code & 0x0f);
         return;
 
     case 0xea ... 0xef:
         abort();
 
     default:
         break;
     }
 
     if (keycode & (1 << 7)) {
         for (i = hs->kbd.keys - 1; i >= 0; i--) {
             if (hs->kbd.key[i] == hid_code) {
                 hs->kbd.key[i] = hs->kbd.key[-- hs->kbd.keys];
                 hs->kbd.key[hs->kbd.keys] = 0x00;
                 break;
             }
         }
         if (i < 0) {
             return;
         }
     } else {
         for (i = hs->kbd.keys - 1; i >= 0; i--) {
             if (hs->kbd.key[i] == hid_code) {
                 break;
             }
         }
         if (i < 0) {
             if (hs->kbd.keys < sizeof(hs->kbd.key)) {
                 hs->kbd.key[hs->kbd.keys++] = hid_code;
             }
         } else {
             return;
         }
     }
 }
diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index db2b80e35f..4f3f1d9d12 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -234,70 +234,70 @@ static void tsc2005_write(TSC2005State *s, int reg, uint16_t data)
 /* This handles most of the chip's logic.  */
 static void tsc2005_pin_update(TSC2005State *s)
 {
     int64_t expires;
     bool pin_state;
 
     switch (s->pin_func) {
     case 0:
         pin_state = !s->pressure && !!s->dav;
         break;
     case 1:
     case 3:
     default:
         pin_state = !s->dav;
         break;
     case 2:
         pin_state = !s->pressure;
     }
 
     if (pin_state != s->irq) {
         s->irq = pin_state;
         qemu_set_irq(s->pint, s->irq);
     }
 
     switch (s->nextfunction) {
     case TSC_MODE_XYZ_SCAN:
     case TSC_MODE_XY_SCAN:
         if (!s->host_mode && s->dav)
             s->enabled = false;
         if (!s->pressure)
             return;
-        /* Fall through */
+        fallthrough;
     case TSC_MODE_AUX_SCAN:
         break;
 
     case TSC_MODE_X:
     case TSC_MODE_Y:
     case TSC_MODE_Z:
         if (!s->pressure)
             return;
-        /* Fall through */
+        fallthrough;
     case TSC_MODE_AUX:
     case TSC_MODE_TEMP1:
     case TSC_MODE_TEMP2:
     case TSC_MODE_X_TEST:
     case TSC_MODE_Y_TEST:
     case TSC_MODE_TS_TEST:
         if (s->dav)
             s->enabled = false;
         break;
 
     case TSC_MODE_RESERVED:
     case TSC_MODE_XX_DRV:
     case TSC_MODE_YY_DRV:
     case TSC_MODE_YX_DRV:
     default:
         return;
     }
 
     if (!s->enabled || s->busy)
         return;
 
     s->busy = true;
     s->precision = s->nextprecision;
     s->function = s->nextfunction;
     s->pdst = !s->pnd0;	/* Synchronised on internal clock */
     expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
         (NANOSECONDS_PER_SECOND >> 7);
     timer_mod(s->timer, expires);
 }
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index 950506fb38..9ae426e1a6 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -774,70 +774,70 @@ static void tsc2102_audio_register_write(
 /* This handles most of the chip logic.  */
 static void tsc210x_pin_update(TSC210xState *s)
 {
     int64_t expires;
     bool pin_state;
 
     switch (s->pin_func) {
     case 0:
         pin_state = s->pressure;
         break;
     case 1:
         pin_state = !!s->dav;
         break;
     case 2:
     default:
         pin_state = s->pressure && !s->dav;
     }
 
     if (!s->enabled)
         pin_state = false;
 
     if (pin_state != s->irq) {
         s->irq = pin_state;
         qemu_set_irq(s->pint, !s->irq);
     }
 
     switch (s->nextfunction) {
     case TSC_MODE_XY_SCAN:
     case TSC_MODE_XYZ_SCAN:
         if (!s->pressure)
             return;
         break;
 
     case TSC_MODE_X:
     case TSC_MODE_Y:
     case TSC_MODE_Z:
         if (!s->pressure)
             return;
-        /* Fall through */
+        fallthrough;
     case TSC_MODE_BAT1:
     case TSC_MODE_BAT2:
     case TSC_MODE_AUX:
     case TSC_MODE_TEMP1:
     case TSC_MODE_TEMP2:
         if (s->dav)
             s->enabled = false;
         break;
 
     case TSC_MODE_AUX_SCAN:
     case TSC_MODE_PORT_SCAN:
         break;
 
     case TSC_MODE_NO_SCAN:
     case TSC_MODE_XX_DRV:
     case TSC_MODE_YY_DRV:
     case TSC_MODE_YX_DRV:
     default:
         return;
     }
 
     if (!s->enabled || s->busy || s->dav)
         return;
 
     s->busy = true;
     s->precision = s->nextprecision;
     s->function = s->nextfunction;
     expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
         (NANOSECONDS_PER_SECOND >> 10);
     timer_mod(s->timer, expires);
 }
-- 
2.39.2

