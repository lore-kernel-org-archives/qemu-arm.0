Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3073085lfh;
        Sun, 22 May 2022 11:51:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy37TcYc2hRjq7I1ibCUoDPVbqJXeIK1CRUQoGbSv/JAf3admgRp/gj0Z5kSWMBlKBByrfa
X-Received: by 2002:a37:a385:0:b0:6a3:2baf:7e98 with SMTP id m127-20020a37a385000000b006a32baf7e98mr12226678qke.109.1653245471614;
        Sun, 22 May 2022 11:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653245471; cv=none;
        d=google.com; s=arc-20160816;
        b=wRRnDckPrxfA/0J6RaevVlkZTkShz4K68E/o7OYluVwf7L2nGqgJlluzljh0ISuYO+
         kP6Aqa6LUZRoeXC2inR2WCFfoBzqm9nGJ3RaGJTR1E4iuchChIvBRTuoH9COJ+avB+IH
         wbI0bu/vPcZDPyhUko6xreD57vO0sNuaSUfNqC+46yeeAwbXSEso94m3dHTjosWt6+V9
         l+yeBTrBbcrNyMIVpzGKNhsz8o/HuvxFtD803GiqyIxz0KlHy8WidAY4YFNFHMO9cXUU
         E1n14tFF/Z14jfJcj35Ujni032UGU0smNackSWLBKH85BnK6rLLRjyjxH1T31PzJnB41
         Ugkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=obfm0WA/cOM8kbIYlnDo2jKbTT3t2cD7xEJBM72jgyw=;
        b=0IosU3f1kRhYanVTtf8jPw3Vh4XcdQhH44oI6cp2w9xj0+957/vpv2kKDUkKHTG4T+
         x4Gk6+YwNfUuxwEoVpB0mLPBNS7M+9GDKT5MuYcBgKTeda6SI1PDZQgfle/fdFbDoaop
         eW2+cknsKE9teFUrIptPGaFMzUxL6llNwOdruUYSPbTDB2LkQvxLXGBqGaf7nQFuo50I
         ipZTEs+4m5b6WcoMrD5j5ycJxGHIkN07vY8+J4oZXMt3mX0U5eTRCJreUyzyNYdgZnJQ
         7JZM+dVNybYHPGPtaxzFrebq9cWX1Zgs7JIBeYwWBAr3wQMxam0fI0fwXaEcq1cklWnw
         Kacw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Q7DCVcIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020a05622a00d500b002f934d3d8eesi692412qtw.297.2022.05.22.11.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Q7DCVcIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqfX-0003su-4b
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBp-0007yz-T4; Sun, 22 May 2022 14:20:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBo-0003pL-Fk; Sun, 22 May 2022 14:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obfm0WA/cOM8kbIYlnDo2jKbTT3t2cD7xEJBM72jgyw=; b=Q7DCVcIb4xPA9cU5jy9ERDLbo/
 JW/ITBo/iPJmt1Pg+dKVZOUDgA/Ytc+xAus7CmYTyO6oThLOfr6Zd+nVKDK2yFQTESWn0jiJbAISr
 Wr0D0pln2tknx7/IifGLhHsjtrAjx9Qe4FTMpha2Uo6hsTcMdpjBUyxVx3pwIFGdbzUspLrj632WB
 d0xamCPco1hB6fSgg0h0aSsJ1dtxDbH1vwiCcmYa1Fb6qi4GVKYVPCACGCLLfxsdW7VRxGVfFYpRC
 rqICC3Ox/NthPQ3pHGw5uj48nvUjlGJkpeZGIblMLiZqo1AQZPuG05R+wT12UJI8cH0C6aJxJsA/n
 rKd0cRMFZ44l+r6sLDHq06gJE+6Zz1DIapTdSOvVUNR3pVeEd2cig23/NYGsj1eKfzWorJUA0axMS
 Exwtxl56TnHxa8uLJOK6pLFOJxkPutiy94MyJJ32mssYIOBjZxLVVKq0yZyH8gCKcA39USKeDsQsv
 f0EChnDwl7GhrtMSaKhtLrY13PfHj8+5+wvmW9z5NVtdpZu0ftPdvgYP4aFzWjocK3V9HumGx5U4O
 Yo4J+ZrMVLcZy4iWlV8E14dnmmMi8kVFDkKgWw1d/f6oARGmJCv3Eye3dplfasU5MY2bwuUeh+2U6
 J8NscAR6IVqUg19Zu0A3pWQ0NLKq6Ag+foE9z3u0c=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAL-0007pH-Sr; Sun, 22 May 2022 19:18:58 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:15 +0100
Message-Id: <20220522181836.864-30-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 29/50] pckbd: more vmstate_register() from i8042_mm_init() to
 i8042_mmio_realize()
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
X-TUID: vIXNgiHA6CbT

Note in this case it is not possible to register a (new) VMStateDescription in
the DeviceClass without breaking migration compatibility for the MIPS magnum
machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index eb77ad193e..7f3578aa4d 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -681,6 +681,9 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_io(&s->region, OBJECT(dev), &i8042_mmio_ops, ks,
                           "i8042", s->size);
+
+    /* Note we can't use dc->vmsd without breaking migration compatibility */
+    vmstate_register(NULL, 0, &vmstate_kbd, ks);
 }
 
 static void i8042_mmio_init(Object *obj)
@@ -721,8 +724,6 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
 
-    vmstate_register(NULL, 0, &vmstate_kbd, s);
-
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
 
-- 
2.20.1

