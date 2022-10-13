Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp738743ejn;
        Thu, 13 Oct 2022 10:42:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72WR7DDE+L8kQ3kDYr3ghDBlvC/rTEzFOEtUZiFJdJ1dN0GKf+qr3i4hof31aowS90KpwQ
X-Received: by 2002:a05:620a:2945:b0:6ee:c2d2:a925 with SMTP id n5-20020a05620a294500b006eec2d2a925mr869185qkp.498.1665682943220;
        Thu, 13 Oct 2022 10:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665682943; cv=none;
        d=google.com; s=arc-20160816;
        b=f93ja39B/9RpicIoJZbkzYlZQOWOUoki3fCiJ8M7oy44j0ieOytuW0/qbf2/+3oRF9
         IpOgjM11ZpsYoNWYUsUqihvk7IMUs7v98Psk6sJymGUXp1dqj2A/rvvUWYI1ruusKEaU
         L4RHb+0jg86qmP89Sd0oEEzHlj5RNX9znskXynsG+OqA5PN6PhklzPf/Ml0qdAUc+GVI
         Gxd2U3v8A/earD9zz+9hHEeHO0iM8JKy8Bqof1Tkbz7hKB7SSq3U/fHM8ltmttsPt9+0
         RUZhFJUtOeda3TwEyEXHVCrmoSwzGow7h7vAdHGMKorGFlApk4e1VwYMAcT4xc7OxIr0
         SnoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8FM5XpZ8DTUHfnBF91yhMamKEwGHnIFRRp55KtGJXy0=;
        b=b1hWRfYEc1fxkmZbF9NnE9YaIh5lgaEBt9eunlK4SqWXM/0/MPAWYpdPa7mYCtOqBR
         e3yRXzVxQP/i9brURgL9fkX1T9CzDYU0nqzctkJAGnn4BqWQ7/w5bngoVVZPwgceXIEe
         vTjZiecrLYlu3s4nfYYN9VsCYmUMv/CqmZBWxwBuK1ziCUlxU/Fk54ZP2KU44qXe3naP
         COH5XW3GXdoeVoac3wsO9V5NRYfK8z4v3kngTItekggErjt3qgpCwwGtLNVX9UBl5uln
         sb+uEMrw5umPYTfGdBSMbKrplHnB6BJAuzjEd9As1j4W49wLd/vtHX1hnYSJ2pa/LPE/
         wGQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hkmDy0nl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1-20020ac857c1000000b00343582e11c7si247577qta.603.2022.10.13.10.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Oct 2022 10:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hkmDy0nl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oj2Du-0005bq-O4
	for alex.bennee@linaro.org; Thu, 13 Oct 2022 13:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj2CO-0005CJ-PW
 for qemu-arm@nongnu.org; Thu, 13 Oct 2022 13:40:48 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj2CM-0000u3-Lx
 for qemu-arm@nongnu.org; Thu, 13 Oct 2022 13:40:48 -0400
Received: by mail-wm1-x334.google.com with SMTP id n9so1667662wms.1
 for <qemu-arm@nongnu.org>; Thu, 13 Oct 2022 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8FM5XpZ8DTUHfnBF91yhMamKEwGHnIFRRp55KtGJXy0=;
 b=hkmDy0nluB2ty51U98GJcr4Owod3yzVZHGy/sP0x4yiDZ/caccH1ZEkZP9KVT9POaG
 TjwMW7oZbfyRgiDFgmIJ0S6wQhNjoG2cQj86yTmBfT3kaZ46D/WiH8vhrRYmNVrWFNaL
 iiuZ4KNywDJSDlDRM6iVMnhfWm+q91xvFS7E9/v0BQalXN7lY/76LEZF5lbrTYwojDGU
 17xj8xwJR9Pkyj2Hx4aCm0xZrTL1jnq7Fkzs7EmLlCm555KJsWAJUPYWvwmnIuBzNXXb
 gwnNNI2Qd7kX7jZyL2ZZJrryDmGf/yLDeeoybknCEYxu56vit7ItVLeTAVpxUjqwxRtG
 k1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8FM5XpZ8DTUHfnBF91yhMamKEwGHnIFRRp55KtGJXy0=;
 b=KMQyPkrTiAjgxTD40gEP9LAjhAtFkGoUNopE+L8P9tCnXJDm3Ne3rduV4bpHD4uHBc
 iPtu7/wH0doZIun5FyOczsiNhyJYnDjJViYhAW1jwIv22ec4AaLMzQQ/e9MGhrgEKdea
 IJbTSxbjObo0HOkpy9G/cvdo9uVqNiWBkvcQcW97+UVZrGdiGMFxu16c8Oq2WIN1GyVC
 dmERmOnycRtVsJ2yV2j59AgGJieGBM47ZgtM4nK7m+tb0JrdSma9oNS/Dug+56Zp30dE
 14rQfwAW+PYsi0dTdgSWr3TuVPD8GE/H6eKRvFyyzg62gzH/JD8zMiIKeHItMXmbQ3sr
 LgLw==
X-Gm-Message-State: ACrzQf1bpG8OXuS9bRErPBGJvJfKrLXI9Af6ha9FlqRqqr1V0fU8BqFE
 mSNH2eYwUwG/dpSdwxRyEAA0L8ZpHCyrRQ==
X-Received: by 2002:a05:600c:a09:b0:3b5:2f6b:c7c5 with SMTP id
 z9-20020a05600c0a0900b003b52f6bc7c5mr665125wmp.141.1665682845096; 
 Thu, 13 Oct 2022 10:40:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a05600c54c600b003c6c3fb3cf6sm118482wmb.18.2022.10.13.10.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 10:40:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org
Subject: [PATCH] hw/ide/microdrive: Use device_cold_reset() for self-resets
Date: Thu, 13 Oct 2022 18:40:42 +0100
Message-Id: <20221013174042.1602926-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PQauRn+yHNC7

Currently the microdrive code uses device_legacy_reset() to reset
itself, and has its reset method call reset on the IDE bus as the
last thing it does.  Switch to using device_cold_reset().

The only concrete microdrive device is the TYPE_DSCM1XXXX; it is not
command-line pluggable, so it is used only by the old pxa2xx Arm
boards 'akita', 'borzoi', 'spitz', 'terrier' and 'tosa'.

You might think that this would result in the IDE bus being
reset automatically, but it does not, because the IDEBus type
does not set the BusClass::reset method. Instead the controller
must explicitly call ide_bus_reset(). We therefore leave that
call in md_reset().

Note also that because the PCMCIA card device is a direct subclass of
TYPE_DEVICE and we don't model the PCMCIA controller-to-card
interface as a qbus, PCMCIA cards are not on any qbus and so they
don't get reset when the system is reset.  The reset only happens via
the dscm1xxxx_attach() and dscm1xxxx_detach() functions during
machine creation.

Because our aim here is merely to try to get rid of calls to the
device_legacy_reset() function, we leave these other dubious
reset-related issues alone.  (They all stem from this code being
absolutely ancient.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ide/microdrive.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 6df9b4cbbe1..56c5be36551 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -175,7 +175,7 @@ static void md_attr_write(PCMCIACardState *card, uint32_t at, uint8_t value)
     case 0x00:	/* Configuration Option Register */
         s->opt = value & 0xcf;
         if (value & OPT_SRESET) {
-            device_legacy_reset(DEVICE(s));
+            device_cold_reset(DEVICE(s));
         }
         md_interrupt_update(s);
         break;
@@ -318,7 +318,7 @@ static void md_common_write(PCMCIACardState *card, uint32_t at, uint16_t value)
     case 0xe:	/* Device Control */
         s->ctrl = value;
         if (value & CTRL_SRST) {
-            device_legacy_reset(DEVICE(s));
+            device_cold_reset(DEVICE(s));
         }
         md_interrupt_update(s);
         break;
@@ -543,7 +543,7 @@ static int dscm1xxxx_attach(PCMCIACardState *card)
     md->attr_base = pcc->cis[0x74] | (pcc->cis[0x76] << 8);
     md->io_base = 0x0;
 
-    device_legacy_reset(DEVICE(md));
+    device_cold_reset(DEVICE(md));
     md_interrupt_update(md);
 
     return 0;
@@ -553,7 +553,7 @@ static int dscm1xxxx_detach(PCMCIACardState *card)
 {
     MicroDriveState *md = MICRODRIVE(card);
 
-    device_legacy_reset(DEVICE(md));
+    device_cold_reset(DEVICE(md));
     return 0;
 }
 
-- 
2.25.1

