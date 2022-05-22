Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3071542lfh;
        Sun, 22 May 2022 11:46:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2jFal61eAJjp5tX/kkKAa7q4Nou4WGEk5n43Nfxa9l9nsbQoIyonPsSVmVbsE6FZyg6L0
X-Received: by 2002:a37:9381:0:b0:69f:62c6:56a7 with SMTP id v123-20020a379381000000b0069f62c656a7mr12047324qkd.643.1653245198125;
        Sun, 22 May 2022 11:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653245198; cv=none;
        d=google.com; s=arc-20160816;
        b=JB/cSUB4tdQJ70az0a78t8f4TNvQC45/VcvzWbiMMEdLpX/BeQnRq5ngwuUdxVzYke
         Y3wu3w+YiBZdVXkLbFX4lWAHCsEd6uTCEqzcoI72XT3oqxrg33ZG0MrwnH3BS3e2IKJk
         Y2vpZ+FsitnqZ/FObqqEYKUbR5bMq3GsJCrUtGoRuw9WgLjZfu8Q5cIhPoIQnxJjFmQe
         /H5jOAEq6YaTuJ8j/g2mXhHLuLXYgl9PD1HMe/GMeEE0/91DrlY4L17e/Fc2FoyavwsL
         M89EjaoCH7538QbnxvG5Bm6mNR9Jyk+93//IOJBqBML90txEg3duRzP9y7Vz2jm398EV
         J+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=22bIroDhBreWsaaHwndPgcAMeyX+9wuBvAN28qBFq9Y=;
        b=V6rQrvp5a6Y3pTUPXp3As7jz960QNDjHQtWmHip70dA5R5L3x8JTVFwcASKd+4P9dx
         g4+7Cje1i6UnTaOcoH4U6milW8emobc7Gnn2dNAYOtpfVhOLob0YEV+sL696ts960mSB
         VrwVVpQP8BSKsquRfOSzP6nlvKK1ro/kyG8q5eHjBSLnYyMpB5P4p/Hu1YNWNrkKxL73
         mB6YrlQWLx27oG274tflEbt/eS0v0Iuq+/rXHPVrIIjUEtILaYAXEV0qzVKaGZW+dO6/
         YR3hK2ZhuDW0bTcF2PMyaSKTS8y94pKJBSjnM+sUhnLwP3QMd6T03qWr74dBf+cRJFkj
         Mi0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="w/2sVlKR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020a05622a100b00b002f3b8d3261fsi1895426qte.230.2022.05.22.11.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="w/2sVlKR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:46212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqb7-0003Q9-Jr
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCV-0000mw-3r; Sun, 22 May 2022 14:21:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCR-0003vj-7b; Sun, 22 May 2022 14:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=22bIroDhBreWsaaHwndPgcAMeyX+9wuBvAN28qBFq9Y=; b=w/2sVlKRI8mbXml953Tg8Zd9v2
 7SEUII3Pa7Onm4HcNHI+kW+1AQ2sHb3M+f7C2atxUiHYK7Y/plWEQ1oMeZg4F+kmetoAr/He1CYfc
 f8HYMezcsnKbFlZSHnH2mqzH9uUyd4VWiLBbCgkCo2Ds7zx7uJJ8sL8SOwjSfo3m92YUWyG6JZTaY
 /3mzNPV20av2nV/JfkJmDRfuKXmreDXV1vdLskRkAmf1UsMp8x2iQX8lvArXfD2L5o4+FiuBjgq2W
 oH4Jzpy83DMqniISz/bMVYxCzZoGniPoAXyB7AvxqyMELs/0vUwRwnDz9sEY+GTZx6RRbSAdhqeQG
 8mTUNcEF1m2TNbApIxjtm8L7MDRHblfc3RCyeFdqb6GdWAo+WkbD3Y1G6PCUMU0blys+1cDfMReHC
 eLqJ2G1mb//qFVn2fc+2kkECnKC7N9KgfMS9QZGPjmwZUwA/sNJA/BL+9M7Rj7YVZJ3G2UfmkqkII
 SgFlgx7EZk4arxu51kK2UsU1hgUCztJqVezasJT+lrqIamA9vGonnEchsfhom5S1weLQPdhcJDl5A
 60WxXyO40UJP6nzCJUmsisFj0g1Xc17qh1cdNPYQeA17sxpYBlMI32bDuizdKHu40+67uBlSQfwoJ
 wwjsmP/L7CtvPpRmkV9Nj0htLZnJ2rZYRsju/CcPc=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAv-0007pH-Or; Sun, 22 May 2022 19:19:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:30 +0100
Message-Id: <20220522181836.864-45-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 44/50] lasips2: implement lasips2_realize()
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
X-TUID: ypwATQ9pzDpk

Move ps2_kbd_init() and ps2_mouse_init() from lasips2_initfn() to lasips2_realize.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index a7c7192c07..6849b71e5c 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -256,13 +256,17 @@ LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
     s = LASIPS2(dev);
 
     s->irq = irq;
+    return s;
+}
+
+static void lasips2_realize(DeviceState *dev, Error **errp)
+{
+    LASIPS2State *s = LASIPS2(dev);
 
-    vmstate_register(NULL, base, &vmstate_lasips2, s);
+    vmstate_register(NULL, s->base, &vmstate_lasips2, s);
 
     s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
     s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
-
-    return s;
 }
 
 static void lasips2_init(Object *obj)
@@ -292,6 +296,7 @@ static void lasips2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = lasips2_realize;
     device_class_set_props(dc, lasips2_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
-- 
2.20.1

