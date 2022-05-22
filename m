Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3082947lfh;
        Sun, 22 May 2022 12:17:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoGBsgLr4pFyM0HeTIrG3XN6gwIAZFfQ0ZGPxDfpR/ol8D+jyLDdt9y7XEkSFup5FIRxou
X-Received: by 2002:a05:620a:2588:b0:680:f657:fbd6 with SMTP id x8-20020a05620a258800b00680f657fbd6mr11814709qko.287.1653247057215;
        Sun, 22 May 2022 12:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653247057; cv=none;
        d=google.com; s=arc-20160816;
        b=chnwzsLf67A+XHEwx1VORM55IICrJeMogBDBCsENaOuOYQTjryxpNciaUzqDBfYHMe
         Ojy6uRNcyaRAR2xroC9G4Zyxvcg80vDSAz7CYziMe92KzIKd8Oy8S3ExLGkQoCr4PiDF
         cdNvhEInZMh+TttK5lyOU8pcM+9fJZitICkooyogRwrFMKvTdieZ/3ALcfLYZvdaLRfS
         JOeuyYodIbImmVk2+gyO1FoPIfsYaH0a2I6oXD8jUX54J1eSoxiD+66j1VHdTyHfya1M
         Qb0PhNTJBoFQQC1HnygCSZxu+8nIzrf01CTJeUucOF5iBx/gA/jhLKV4p9Y9SgYDrdf5
         /aOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VB3qCQhoVg7ObfQqjCbnzZBOPcxW5skV8GfxSlxj/cY=;
        b=eQHOKIDsHE6x5X3UTZOX9ETWFA4KrLFm/j92pl1mgKT/S6GxQZgpKsmq414iYwSuof
         4aEDl48l/q8Xixs7ZQ0D7Z8HicyjOaDfcQuy/Guw5RVsYWBBWwQQnSrdTbjVSbVFyJCh
         M+YCSioVYASr3gBd4XhXaP7mKJmymEIq2KI32lQ6z5bjFy8Hb6vST4ULViN47xSF4OD6
         /ZuunTLujI2l1K/xuYoTprC4RgaSAqdMUVebmrePulZcnesfv7maBdfg/+11hMrdxBiM
         oPcRlQQoARxjH3CSNmBnkzkHiwPgLOku+vKhsKZ6Xa0dUGDM153GdCzIKlubRbjOjOme
         s44Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Xqiy9pfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a05622a064600b002f90adae797si2089300qtb.358.2022.05.22.12.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 12:17:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Xqiy9pfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsr56-0002ME-PG
	for alex.bennee@linaro.org; Sun, 22 May 2022 15:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCV-0000mx-3q; Sun, 22 May 2022 14:21:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCR-0003va-7M; Sun, 22 May 2022 14:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VB3qCQhoVg7ObfQqjCbnzZBOPcxW5skV8GfxSlxj/cY=; b=Xqiy9pfVoVwET7bheU1glHf4yS
 JZc1/L9HLzR/y/VljWlpRsc9jXvNQL5fCvE+gGC5K1iXy8ExsT6FWTxBIvenH47qLEGUz0Rz0TcO6
 Ad7EeNYxmzWkqE3jUP2M3P4oSosdU2BLnPrQ7MpG6jY7tjvyn+np5n/s4zSCY5IY42Zd41Jo7heMJ
 fJQEexeofsNM69L+qbjTXB1R2bsA42U2OfZWeOdJNRV6v/Ekl+tEIv7gNJJbsIBdvU4DWw9WiO+6V
 XXMrCBy8VGpyYysscxWxkNvZgU4MHd8A5YFi9kOSve5dewo6NNi3kTYqX+zs2ZhyXCP434iYa6LTm
 ZDiIWqv6D+V/C5S99J2SPqvFDsXs3fnH5yqOj6nv+AnYhMQldequLl8xBwoXxXbkzHXm0G+oFSMZD
 NLOr3qJoUyev9Rd926ndtsFYPXGtmvy/79OCme/+OdY3fhaI6/KscmO0g9zRehHqjdIDDEmjiG9W4
 O8BcsuEyf9z50M0CWEdcMEZmoF5WZN9mvkLgdoFxgz3Jo0K23PE9P3Ggrr1cX5Y76l0+C1kB/2CVH
 9IK7ZpGwpZ4sveljZQnPlS+1WlneUf+RRCTU8XYG+JEJiipDzkcdaMimqWlzYS1Pzgsg3FRjDWPB/
 dvyfRXo4VOYa9PVRAdx6CUbJ4qIKzkh+tswFFhtpM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAw-0007pH-6A; Sun, 22 May 2022 19:19:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:31 +0100
Message-Id: <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 45/50] lasips2: use qdev gpio for output IRQ
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
X-TUID: mZHkI9tnNVO0

This enables the IRQ to be wired up using qdev_connect_gpio_out() in
lasips2_initfn().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 8 ++++----
 include/hw/input/lasips2.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 6849b71e5c..644cf70955 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -247,16 +247,14 @@ static void lasips2_port_set_irq(void *opaque, int level)
 
 LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
 {
-    LASIPS2State *s;
     DeviceState *dev;
 
     dev = qdev_new(TYPE_LASIPS2);
     qdev_prop_set_uint64(dev, "base", base);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    s = LASIPS2(dev);
+    qdev_connect_gpio_out(dev, LASIPS2_IRQ, irq);
 
-    s->irq = irq;
-    return s;
+    return LASIPS2(dev);
 }
 
 static void lasips2_realize(DeviceState *dev, Error **errp)
@@ -285,6 +283,8 @@ static void lasips2_init(Object *obj)
 
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
+
+    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
 }
 
 static Property lasips2_properties[] = {
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 7e4437b925..d3e9719d65 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -22,6 +22,8 @@ typedef struct LASIPS2Port {
     bool irq;
 } LASIPS2Port;
 
+#define LASIPS2_IRQ    0
+
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
-- 
2.20.1

