Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3075922lfh;
        Sun, 22 May 2022 12:00:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbdN8Nvffyd721xVtRqzntBh7vEQOKW3odJUbPl40/HzF1DF55K7kaxR5CGOhNOBpsNznD
X-Received: by 2002:a05:620a:4114:b0:6a0:86ac:92a8 with SMTP id j20-20020a05620a411400b006a086ac92a8mr11959852qko.663.1653246004862;
        Sun, 22 May 2022 12:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653246004; cv=none;
        d=google.com; s=arc-20160816;
        b=hHmiJ5ZmB26ICy3VZooKkvq003C8bgkp4Va5AzmtxxhjtdMS71co8+ZmveXfxaIpum
         4YzjsFsYc3FTMscSKVr90crno8T5MAqWlvofatuRvASgw8ixXl/QAWr6oGoefckX9cLz
         o8znUoJtqhZAyG1cP+h8NjJveKntl+O0EigwJKFUlo1FmWq3Zh/nywhyk8XKmqlZwe55
         +CWqPNPJgi69PHv+UJkjOO0Em/yrz79BOJ/WiwCr8VQ7uL3Y/ZymRkcynsnTidR3G523
         O5g2Cj2i+F+D2wy2AjCAAkXXOIHCQUodShzwu8WBD2/KmWhHSHjew5VD0/oITYn2bQqj
         hErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=qVffcWhZTjD2ITQoPU/MjFUySUV/A9OQ1qypPal6+Ms=;
        b=Al3AlvOjcLGsKwPZXa9q9StYCbS5HkHJh23tDmsZ8Dg0TBEzEhAnNeeqRBu7nF50xf
         moMdD38WmjNPzBbmDpc+qKSVtW33fo6KJciA8JWevudPa1Wka71Gfz4ZnE4eLTpD09hs
         4AwDNzzaf9nY1Kmi5M/t09mXZKZEmq5KcSu20Sh3o8nxkfDoDgRsCJ1/Khf/2K8K6b9s
         m552eCvl0SkZdokvVlOKBtodJYGPfn8ziq+ZyU8bidfumc0vTQjLhHwpl/S65vHXEW0G
         YeOGotMPobr4d84gT6fHMtji1SYaFAFMDA3lomiL70tQKgMSccLX5SgO+d5PNHxCt72N
         TbZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=f+DdTag1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi4-20020a056214248400b0044666054d57si2028159qvb.518.2022.05.22.12.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 12:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=f+DdTag1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:46188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqo8-0006H6-93
	for alex.bennee@linaro.org; Sun, 22 May 2022 15:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBi-0007y6-IX; Sun, 22 May 2022 14:20:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBe-0003d0-Hm; Sun, 22 May 2022 14:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qVffcWhZTjD2ITQoPU/MjFUySUV/A9OQ1qypPal6+Ms=; b=f+DdTag1FxD2frPEM8cm7oEH/1
 t5G4gKJCiCAV5Oeb+JddLT39AiCqFWH7jEQuJoF1NJy5UUZedjV3PIx0b3j7Jhu920fP5pCK5veLQ
 CuOva3ym6RW0OUvHIFxt0WpFmuD8U35GNRyVrZndc3zi7XES0V6QAnPVLvjb7d/kHk3WQc0DDZE5O
 uwa4s0n+Bkl4IqYCi+xXUmay/cslpOiqVgMK29ZsVL2EAwzOw/CuaUzYjMpg6IMCLHkWCA03qwxFG
 VKaJ6zyr0R9LCWE0afO+bEi4YD0W/xaAWSpz4VV10aT6AyA9dE/GhbW+A12nA9L57zqEDebZgYBvy
 JiB67b6gd0kV5toojTY4nge0H7maqBYg+ozeDWDk5TNOsKx12DeVqhI/d0zzm/f/Jt2WDSusXCMxP
 trXP3PmKpxGXD/Znc/w1kloeiqb12T20+ZJi+os5Wn7OxAtkW/X+e7LPfk/vkDfvd6PqWtV1KgqLg
 b1teIAT/QMQF2dZD0RPFSd/vc3CI4PVRaQecHG3T9IYHn2bYCnEaC/rI+DYqw6jJp9PwXaEV7v3bN
 2GMyMbj0i7xLDyJPqSz/M2sATgfxX1kXKhuRDkvZb89yDbrX6Bne9cY5savJANrthvy2SQOqMLEYP
 uMA9tC0SQB1C7QRyXUbniIE8+cp/DdRp2G3fV7zOo=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAB-0007pH-Up; Sun, 22 May 2022 19:18:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:12 +0100
Message-Id: <20220522181836.864-27-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 26/50] pckbd: implement i8042_mmio_init() function
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
X-TUID: B3/3KfNGrE9A

This enables use to expose the register memory region of the I8042_MMIO device
using sysbus_init_mmio().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index addd1f058a..c407c082e2 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -683,6 +683,13 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
                           "i8042", s->size);
 }
 
+static void i8042_mmio_init(Object *obj)
+{
+    MMIOKBDState *s = I8042_MMIO(obj);
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->region);
+}
+
 static Property i8042_mmio_properties[] = {
     DEFINE_PROP_UINT64("mask", MMIOKBDState, kbd.mask, UINT64_MAX),
     DEFINE_PROP_UINT32("size", MMIOKBDState, size, -1),
@@ -726,6 +733,7 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 static const TypeInfo i8042_mmio_info = {
     .name          = TYPE_I8042_MMIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = i8042_mmio_init,
     .instance_size = sizeof(MMIOKBDState),
     .class_init    = i8042_mmio_class_init
 };
-- 
2.20.1

