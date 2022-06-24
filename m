Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp365201lft;
        Fri, 24 Jun 2022 07:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0eS4ZGDUlsjP9J+Y52qJHb8jN/oL5c5xlWiHJyEA7wris3kGpXfuaG7mcoVlOzoAg3XSt
X-Received: by 2002:a05:6214:965:b0:470:5190:3350 with SMTP id do5-20020a056214096500b0047051903350mr17194721qvb.53.1656081015692;
        Fri, 24 Jun 2022 07:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656081015; cv=none;
        d=google.com; s=arc-20160816;
        b=T1W5nDhQy/TEdOhGvd8GSBCvWwA+Yx0etnBfIb5aKLP177Rye2uiRYfd5BsRczyYcE
         9009zJZ0cT8BsKa+8U7ntBHcb2H/zzBLzeLjPoPXS0YpC2yWZC9f0oOYAgROI49A7xcF
         QeZoL2FuBPTLxX6bCKlXIyhpceKIRHvCyae7suV+YdfrLk3RPROa4Eg7ZOI+9sMFclON
         9KpV+zv4qBIBLzzQYUdR/+wOkE3XF1WSvk3nVDKkDgQGcj9X+Kcbsb+SnAdSw8ZLzGlA
         7UVinZCNPU53E8tgXV4EhOioH+o04KBs3HJZ5qticbPq8fl8D4tGySOX/XeqjxGCO2W2
         Jrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=aTe6B8EoIVLhFLb93AWNsfsTKMaSIKi3WCmBzmOY49A=;
        b=CCVoCBeIStVBhhxVH6+D0roWDde0PlQsIoPBR6+i6HFWPfXTKMB7Q/zmSY40dmtWqQ
         x5FiL7bHGCutvdob7PGxqbff7EVAALK1YW77kLc2hxKQkv0mjrJtYrtEshHj0cOm8051
         bDvTObwNnRHHZKDribi/dIxt2CSB9JfHER0aSECPk088Gseg44FRnaZOXfTuPxBOI4Db
         VgcgDy05MlM3NR7jWqMai5Lv9o/zxHTPGGImLW+DnCtzEj+ijLNWxOIjAZUmATZqy0/T
         r4Ujg5eALeQFaGBKGoCcq2mmRBNN9pib9A1zYCV3DNLSrbWj+qgEDxK82x0ZQisunVOd
         owsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=ct9GSwOX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp36-20020a05622a1ba400b0030511b90b77si1999568qtb.506.2022.06.24.07.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=ct9GSwOX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4kK7-0000no-4P
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbt-0004b6-Pc; Fri, 24 Jun 2022 09:44:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbs-0005X5-7w; Fri, 24 Jun 2022 09:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aTe6B8EoIVLhFLb93AWNsfsTKMaSIKi3WCmBzmOY49A=; b=ct9GSwOXNWJ2POTb+WQgpeFlgE
 aeOQDCcNjoeZFgI0Xe8xt8DIlmHQ+6VTFaU77A7kEvg5pQzSpvva5DswwnsQPLKaPWfjFaSjklndB
 15kJBBKqVtWwBARYNB9TJeuxB/y+h90rZh10zrBTFtbrBXQwpDeDp+I1zpJHR19AadtyHlk/gwgwY
 gpTt80bKwLsqtpF8bbSNYr80U4X9OyVGhbj6rIebUuanoE6RB9vgbYHivXf4kRjyvMp5vpx88Sl+7
 1dq55oqg9TgKaoLrMqKNH0lNK6hV4AevEjn7InlYdeEQwD8zBRlWEwkUMgW29fRgHwomIOrZsGgJO
 FgoGtoZmlEYlS4qOVPQtm6F+n/9z2DvlrLY5UicZLr2UguT4F3cLv9/eWL6sHo3Li/XKy59RJe/Oo
 TLZMs1jHaxhkpCXza5TWYRZjswKkqm0qcRgZd4uHO9fYYBlpTQzvOk8f1bAFsbM1nTbFlAHj7fecx
 neYm0O65w2W3eh+Ei2TfPXg7gm5VkI9aIWeH/iexH79O3Uc6s4vvsIJnPlAEZOUWQtxyiMwUWiAfH
 TDH4hRAXKu53K5GfC8Y2PsD2iQp7hpOfP6qCenVYYLKH0wjY70+65NCp4N3fb9VPBFxc/M80fJCj5
 6S0/WN0tJSP2F/t+W5BBGY1O08GSsC+0a93B93u7I=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaF-00037t-5y; Fri, 24 Jun 2022 14:42:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:41:01 +0100
Message-Id: <20220624134109.881989-47-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 46/54] lasips2: use sysbus IRQ for output IRQ
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
X-TUID: RWPchWupzj/O

This enables the IRQ to be wired up using sysbus_connect_irq() in
lasips2_initfn().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/lasips2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 49405191cb..bd72505411 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -247,16 +247,15 @@ static void lasips2_port_set_irq(void *opaque, int level)
 
 LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
 {
-    LASIPS2State *s;
     DeviceState *dev;
 
     dev = qdev_new(TYPE_LASIPS2);
     qdev_prop_set_uint64(dev, "base", base);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    s = LASIPS2(dev);
 
-    s->irq = irq;
-    return s;
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq);
+
+    return LASIPS2(dev);
 }
 
 static void lasips2_realize(DeviceState *dev, Error **errp)
@@ -285,6 +284,8 @@ static void lasips2_init(Object *obj)
 
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
 }
 
 static Property lasips2_properties[] = {
-- 
2.30.2

