Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1706117lfp;
        Tue, 12 Jul 2022 15:05:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzMAOkj5uPezdD5GU3UQ754bpJ2HYW3+oFpH5J91JxEKeA8tBJaB8P+bKP+RCNX80ArXID
X-Received: by 2002:a05:620a:12cb:b0:6b5:6de8:5779 with SMTP id e11-20020a05620a12cb00b006b56de85779mr323631qkl.303.1657663539267;
        Tue, 12 Jul 2022 15:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657663539; cv=none;
        d=google.com; s=arc-20160816;
        b=Bzzu6/y07l6cQUPWByXyWFJ6zfiFry3XE+Q31V+o4lBOmuuWLfSCmE+fzcvV6AqBEq
         +Q8GHnHds7b/pa0QakoA98zDIgRCx9vZ5EGV8HOdIU2XbJSuCEieRaKCqukTHNGYEW4a
         P05wv3C7i4MHAe0gpO7Le4CnejxjOKdmXGx0TbY9TW5V0+Lo66KJhvpOJ1YG0qO0M+Tz
         EllmWfRrf0pxDRKgNiuTUWOZhr/d+iyQ/y4RK9QyI7tE9Em6+nCyKJgANqbqcQxIAjI8
         icyfpnDmq4roHz2/zHFX81ZuC3693CWqqzTBzbLZIBHf1G2uBCme/+Dvs9I/9KQOgziU
         cQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Nv+MjNauFM7d8s3RY2hSbgxq4uIv0MM6IJKLOjx0wjo=;
        b=cF6Ezwk/IutMG4rBdDChkjcxbdHSoPEM40RVGfvJFRP4ekgUtzDwEdhzyvfne/Owqn
         UmMuEZiato8+knqC+f21ZAioy6bwaid0ldsyyIcQxxzcqpb0WSkNISECIxTKyV88ArPi
         VHCWVXjV9jMiEQRdzTld+3OcgtRzzV1g9MxypfLgHylgeKNKDyQX8gWMaByF/IQimnHH
         pfQuWdJz5H8CgR2r6IVHWMeKpxhXcmhw5x9X8OCHUPtC6yRVFVy1nPfMoB5oBTt4vOsc
         7zRS9LiUff2mf4M2PrhF/dzMbRS92/gUUz8+uYhmbFG4E7nUFxfZhZA7UAjbLglLtr8W
         wWYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=DH5E8hhW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k69-20020a37a148000000b006b5671b63absi1144454qke.400.2022.07.12.15.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 15:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=DH5E8hhW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:52800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBO0f-0001gb-4l
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 18:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqB-0003mB-Hx; Tue, 12 Jul 2022 17:54:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqA-0007vO-0o; Tue, 12 Jul 2022 17:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nv+MjNauFM7d8s3RY2hSbgxq4uIv0MM6IJKLOjx0wjo=; b=DH5E8hhWDqeaLs375zK3f8SVXO
 9EhqwJ1B/+C05V4d0Mg5Kd8WbCvrAzdtRCxca/Wym8bJcnU/qvV0vcrfo5oCWloCrK/Dzn7Iahx5p
 4ay3GfiwpGJC4MlU7RsrRRgMV3rNOj3tjJeP7nZEweRPgU4WCn4/xGHWL9VcIMXaUWrzfCuT3Fe51
 rXLhPPJE+MkcmI0LncMyTvICkqaELnbeIrQUF20Onyc/0KjvNrL71Rt1mQ9UH47+AYUg8PX8SJMnW
 94VZhRzoVWAsJlvoS5UJ55Hx+nzh2y1H/eVCJsNzkcqYEQIAo/WTB5Dd9FUjgvMznaex/RCZiyYGo
 wngvFL/icf5AuENzZFjy2WaQb8x4kG0IsARhjKrm43nyiGOeQbn++tn/5yov507OwKiVk1Z9WeSt3
 SWzPKO5sSb6+cKsgWxBh89sYSRNA48Ed/rViIllHISxXGfM+ivWQdexleVMnt2o6FdyDDsibiQzKY
 f3FOx47t1oKhSmig5hMI00JosMfxlpAduiHAa7SP82DEIUguSNyPg01P9jVniyKIpxpCxJ0kKRprC
 Ast5zXsyJc3RVy3gpBz3NlMfwVKiyPblm17+qee0el4Kyw3Cfg9+i3/uWoxu/DnpcysfgDs5EZ+p2
 mYeDhhJdXXNuRpC2jIw20ONRj5KGOte3NyWa1JNEM=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoP-000Bqt-PR; Tue, 12 Jul 2022 22:53:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:33 +0100
Message-Id: <20220712215251.7944-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 22/40] lasips2: introduce lasips2_mouse_port_class_init()
 and lasips2_mouse_port_realize()
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
X-TUID: PvBCr/7RqrfE

Introduce a new lasips2_mouse_port_class_init() function which uses a new
lasips2_mouse_port_realize() function to initialise the PS2 mouse device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index b4fdaed5cb..ce87c66f2a 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -277,7 +277,6 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    lp->ps2dev = ps2_mouse_init();
     qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
@@ -363,6 +362,13 @@ static const TypeInfo lasips2_kbd_port_info = {
     .class_init    = lasips2_kbd_port_class_init,
 };
 
+static void lasips2_mouse_port_realize(DeviceState *dev, Error **errp)
+{
+    LASIPS2Port *lp = LASIPS2_PORT(dev);
+
+    lp->ps2dev = ps2_mouse_init();
+}
+
 static void lasips2_mouse_port_init(Object *obj)
 {
     LASIPS2MousePort *s = LASIPS2_MOUSE_PORT(obj);
@@ -374,11 +380,19 @@ static void lasips2_mouse_port_init(Object *obj)
     lp->parent = container_of(s, LASIPS2State, mouse_port);
 }
 
+static void lasips2_mouse_port_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = lasips2_mouse_port_realize;
+}
+
 static const TypeInfo lasips2_mouse_port_info = {
     .name          = TYPE_LASIPS2_MOUSE_PORT,
     .parent        = TYPE_LASIPS2_PORT,
     .instance_size = sizeof(LASIPS2MousePort),
     .instance_init = lasips2_mouse_port_init,
+    .class_init    = lasips2_mouse_port_class_init,
 };
 
 static void lasips2_register_types(void)
-- 
2.30.2

