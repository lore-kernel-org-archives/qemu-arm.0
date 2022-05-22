Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3072642lfh;
        Sun, 22 May 2022 11:49:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZqcIduKuf5pvYk1omxJaEkpQhYPDeU1WpEIcjE5S/6W1uX3JeA8UOaG5fnEhkadtgchPi
X-Received: by 2002:ac8:5e08:0:b0:2f3:cda3:ec1b with SMTP id h8-20020ac85e08000000b002f3cda3ec1bmr14077671qtx.534.1653245386262;
        Sun, 22 May 2022 11:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653245386; cv=none;
        d=google.com; s=arc-20160816;
        b=xHGoWtfAu6N3KCAsqgf74RHwJvNoVpOt9tvSR49IoAT2ht3/dAxeXkr3GcZsov+fuK
         yDtMXES1WyjCntDSZEVjajcv+mbL8I7xECbrdPZFVovy5p/4zS8C+6B9DtasrNGu5c/H
         b9FI+c6XiP5jywez8prymQjNb4k7kTJAJagDj2ZFNaJhNggRmb92SY+cWshJDujjOMf1
         uA5xHfXcmS2r9rnnN8Imzro44afyFwGEVDnqkWIxA77JzYIZL/ciOfU5GaqOuKLiFeNc
         8dy2tzQekCphKpKmYRE2+jbIs1TsZaghGTOXxf+5LJSZi5OXo0C1c1JyqnfDPS3+QVdb
         N6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=oxVlHf98HL9bPkTIpGvX3oL4QhZPAMzaXJg3554V5Z8=;
        b=YUWVFnar+YhxZSgKFlWD3EAUUObh0RS4MJzX0F6xjh71VZpk0wgF/eS0fNoVaLcITW
         4FIVKHb/mIXA5lOKZs20lYC5/s/I2pSIf2QcpZFifA9/KxdT3C2XLAIsZVg90BW35Pn8
         M3lxrkxzG8TuP0LxCExxIO/4wgE4k+L2G/WujKciSk1wwMdxopcE3Swli6fNJUZ+9EIh
         YeHPDaRuyX1M9icxGig+wjKL7qKpyGpCwXDIvzMykyc2h61EAJv2J8XbI+9G1LWgC8ig
         zykBrx5Szh2/siQzjsMqdJi11SHghXYXTKxtP52Kxw9/LOX3Xgcw1weuYpyT1c7YLhiI
         14Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=etEXjdUx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020ac85785000000b002f9357a3aa2si511808qta.618.2022.05.22.11.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:49:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=etEXjdUx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqe9-0002Jw-Pi
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBi-0007y7-IW; Sun, 22 May 2022 14:20:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBb-0003cM-3u; Sun, 22 May 2022 14:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oxVlHf98HL9bPkTIpGvX3oL4QhZPAMzaXJg3554V5Z8=; b=etEXjdUxuk+55dLKD0+g36NGk6
 bJO8ngBDkBZDySVZlx247By1rguGacTaHPcYST2JT5qGcZD2jLxeVlAoeS9wDDeOqwCO1SovQTRjY
 6/9fq7QkGKaCFkWjA42V3Ml3h1oi769DZn05aMXTmN0tIOvBkNi16zgP8BDPOuRV7GXX/dYVJRGIO
 g3N079hPeXevcWeUWbBEtdtvkygaEDQSjCrC2aT7okKRDtYJobywpiFJvLQ+92vvkZnxjbYxq9TS+
 y3BsnwnjXO5/ygJTmshJ/LRN82ZUI786AG60ANuhzrBbo5i0V4gA/FuVjDcWGEukjiqfEEnWeoBkF
 CGV+SQ/c5K+3nI+zUxfq+zn1N1jDm7IX0+J9yTRKKhLW6vpmGdgrVrli32ZTFO/WbMGKfzzneujpr
 FPF/F6GXngAP8tbflLtBzJ57lB4y2meJ31w4xC+xFkhYYLvdBDveYPcr3JjDDdGLaOLjnDqMFWyR8
 udcbPklgVcFjlfPV9E4RIoEw1Dy7dm2jA8uPChY9M1YNnEVDmxZRfXOAC5WJ3TjOU3zzF755iJAcO
 wxNlkwE0EsBKP1mwBh7FWxWWXCXAhHICGRLHLK4cO9PFry/AmHheLsuEPjHkr686vZnV/KYqI97Wv
 XX8Sz/9WY9CFHJ+3NDbs49rKMZdFi0lwpTioXGwwQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqA7-0007pH-Kp; Sun, 22 May 2022 19:18:47 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:11 +0100
Message-Id: <20220522181836.864-26-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 25/50] pckbd: implement i8042_mmio_realize() function
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
X-TUID: LtLcYfTQBKon

Move the initialisation of the register memory region to the I8042_MMIO device
realize function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 12 +++++++++++-
 include/hw/input/i8042.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index e13a62bd4f..addd1f058a 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -674,6 +674,15 @@ static void i8042_mmio_reset(DeviceState *dev)
     kbd_reset(ks);
 }
 
+static void i8042_mmio_realize(DeviceState *dev, Error **errp)
+{
+    MMIOKBDState *s = I8042_MMIO(dev);
+    KBDState *ks = &s->kbd;
+
+    memory_region_init_io(&s->region, OBJECT(dev), &i8042_mmio_ops, ks,
+                          "i8042", s->size);
+}
+
 static Property i8042_mmio_properties[] = {
     DEFINE_PROP_UINT64("mask", MMIOKBDState, kbd.mask, UINT64_MAX),
     DEFINE_PROP_UINT32("size", MMIOKBDState, size, -1),
@@ -684,6 +693,7 @@ static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = i8042_mmio_realize;
     dc->reset = i8042_mmio_reset;
     device_class_set_props(dc, i8042_mmio_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
@@ -707,7 +717,7 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
     vmstate_register(NULL, 0, &vmstate_kbd, s);
 
-    memory_region_init_io(region, NULL, &i8042_mmio_ops, s, "i8042", size);
+    region = &I8042_MMIO(dev)->region;
 
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index ac4098b957..59d695a9dd 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -58,6 +58,7 @@ struct MMIOKBDState {
 
     KBDState kbd;
     uint32_t size;
+    MemoryRegion region;
 };
 
 #define I8042_A20_LINE "a20"
-- 
2.20.1

