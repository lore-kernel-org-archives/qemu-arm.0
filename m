Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp431187lft;
        Wed, 29 Jun 2022 06:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vy4NK6e6rOMEAQLDq8+l7TPahxlOHQfhkNNsZx+wjnPW2/RMtg2LUTLJI2ufqZmnUCF5JF
X-Received: by 2002:a05:622a:138c:b0:306:98ba:ab0f with SMTP id o12-20020a05622a138c00b0030698baab0fmr2285691qtk.642.1656508024351;
        Wed, 29 Jun 2022 06:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656508024; cv=none;
        d=google.com; s=arc-20160816;
        b=NLfwue/c4iNiC00neQ2PyqonogqJlwcWOA1gAjeVOr7+2B4uMaNhCD1nHaC3Hlr7RB
         wTw3WhZ9LZEwmAIrPpgrAPLpa2Uekk6AklWls5ggOg0MWGL/akMTrE9W5o7J7uN9Smtx
         AYhREVm9HXpZ0A7zeAsShMOKFB46RZRsoY2XaapHvL6A6rWOdSSg+iWyAv8UIfa8Hf6k
         7JX8Pr/Pz/GFtLO+gmRLhHSSGyQEadaWTwRxWJu2hCUVtEp5R/sewvB4xpJOxWZXKdMj
         u2PjAzuiuhyn2vzQeIS89ZfCOMEHjIN7P0nrzlmH+NkiIDDMxGOyuEoHNiJHS4oaTTtd
         NHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=lB2/N+UWeTMozzLfCLXvZRKYPj8HL2k9kFD1KcW+hj8=;
        b=fxO8ghsfiBdpc8aUs6/v3/7pATgWcMT6Pv1Gkl1JzF6Cj6qnYQaD/sXmlET7x4MY+7
         /JDMiXeHBHQS/idZ0uIxTafolQ+BLUytrNioBrtp0tC3iqwSLMdb6NSA2mVn54t8pqUf
         va9ipBIzRoX1g7I5vmQZnAr4EFzuYd2QEmoLd7UtvuKZAcAGoyZlYxlVLKmUBPjzt01I
         CaKv91D+59lgkzqM8c6/5SdYoGbNi4OkSXuAsze8jtpYKSqvd8v7baffTyzJTo1/EdGd
         iGEWRGl/sRccGdCCYpSxtHJtkdDJwYykdd6FpeCB8jD18WPbIsKcu1ErcZrIXYfi/3XU
         jWBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=F+dhJV2y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020ac859cc000000b0031b29f6e708si4180863qtf.352.2022.06.29.06.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 06:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=F+dhJV2y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6XPL-0003AQ-Ly
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 09:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0L-0007hV-R6; Wed, 29 Jun 2022 08:41:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0I-0004fL-Ty; Wed, 29 Jun 2022 08:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lB2/N+UWeTMozzLfCLXvZRKYPj8HL2k9kFD1KcW+hj8=; b=F+dhJV2ygjTW0vMwXAAXm4jEkQ
 o5Bk54uUuBLDrpSUBHh/dPyWxmOp37FlEZiO35Nsp+ove8X+Q2RX9JriOO7QYp3Zim35WuICJ0gLy
 FSAQ/jFC3WtZ9I1G00ku7N6bLTIlRZ45A19WP+qIKPxPMDKuALt+47zWO23+ixdyyw1fUL9A6E3A0
 s2nFldo5195B7AXIgF98m9B5GXzywZLbRgYQkZa3WjBXegDNZC7OqAo6APmYmU4H3vx7OtGR2PFGD
 0QT/BsJJzS577HbahEn06/dzZ4EcEoEfRYMSN/mRMrTuaMuoul+z39RHuZKj05CLK57dgkEtxGg9b
 xgkXxXCrZ9jx4thiANpaggNgN6tITTqB2rIn9Zra2YuQv4ucNucv0Eeo8U4W2RINLtxITNpmL6Oq2
 YPVNZHaOq0MJfKL4p/PBqksBhHEBQ61jFBonLhJPjCBoh6n94a6YulhenfrIPBcihNR7JBLfee+ET
 3nT1L94GUf0sv9etMM5IPXLAtBrnRi3qKtO4U723KLR8kWhUHW2DbgzVrzIrd5wraA85YrotzfpQg
 XVKkS+bwNo8mykodZnPj1AScbM84lG0RHzBr89X6z2JNcwwxtXIJU4O2N+ENsZoCGES1pSeHE274p
 oEoaO/PNfeQm+E7164LAAd/Xp62ObmDuY26z73x3M=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wz2-0002tZ-5M; Wed, 29 Jun 2022 13:39:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:57 +0100
Message-Id: <20220629124026.1077021-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 11/40] pl050: don't use legacy ps2_mouse_init() function
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
X-TUID: tAnHLW5HuWE+

Instantiate the PS2 mouse device within PL050MouseState using
object_initialize_child() in pl050_mouse_init() and realize it in
pl050_mouse_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c         | 13 ++++++++++---
 include/hw/input/pl050.h |  2 ++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 64b579e877..ec5e19285e 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -183,17 +183,24 @@ static void pl050_kbd_init(Object *obj)
 static void pl050_mouse_realize(DeviceState *dev, Error **errp)
 {
     PL050DeviceClass *pdc = PL050_GET_CLASS(dev);
+    PL050MouseState *s = PL050_MOUSE_DEVICE(dev);
     PL050State *ps = PL050(dev);
 
-    ps->ps2dev = ps2_mouse_init();
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->mouse), errp)) {
+        return;
+    }
+
+    ps->ps2dev = PS2_DEVICE(&s->mouse);
     pdc->parent_realize(dev, errp);
 }
 
 static void pl050_mouse_init(Object *obj)
 {
-    PL050State *s = PL050(obj);
+    PL050MouseState *s = PL050_MOUSE_DEVICE(obj);
+    PL050State *ps = PL050(obj);
 
-    s->is_mouse = true;
+    ps->is_mouse = true;
+    object_initialize_child(obj, "mouse", &s->mouse, TYPE_PS2_MOUSE_DEVICE);
 }
 
 static void pl050_kbd_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index 28f6216dc3..89ec4fafc9 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -52,6 +52,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PL050MouseState, PL050_MOUSE_DEVICE)
 
 struct PL050MouseState {
     PL050State parent_obj;
+
+    PS2MouseState mouse;
 };
 
 #endif
-- 
2.30.2

