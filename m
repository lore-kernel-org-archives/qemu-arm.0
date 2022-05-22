Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3064928lfh;
        Sun, 22 May 2022 11:29:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz02kkxjeB1gns1AGP0/1T9BNz5i2iB/b7IjoSMvSbfFrDRuEDj/Ac9DvtsWF9tAeN/4z7a
X-Received: by 2002:ac8:594b:0:b0:2f3:cb25:facf with SMTP id 11-20020ac8594b000000b002f3cb25facfmr14061109qtz.631.1653244149660;
        Sun, 22 May 2022 11:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653244149; cv=none;
        d=google.com; s=arc-20160816;
        b=JmzJJXTX/lLrfbCVq66Fs01m2Jet3caNOO1dY8jKGhVhCml8Ijlm1rhKafuuKUhdkK
         zqcyB8v//18f3NsKDkQZE7G1gh3IOiLwtL5lhp2X/TWBI+5frw7DXp7tN1Wc4A2fQMjN
         gxEIIP+R+GmSMDGcQTSKZCAzDXlhrgVdfq2YK+P/N96MK6sCLDRWxRdJeE2QvyppEgJf
         +lHSMatASr4MgixjWXA7bw2YNCy4zW7sFvnpdaNdlhEJIuU6f7vObeVke5nTiE12N9oD
         duy1wjbFhj8SLJvFf2MHmxfvD0XM73ByCOWB6lV+8BB5v11wWXti4xBVUIhyVF/5+DP8
         psEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=I0VPS71VXtn5mqfuBaY8i3Y6GRXsjpQM3fNl/iuWzEQ=;
        b=kfMaU8HG4XweAEKncP8XmFfkMHsNXmLHvHAb1pPBCjTotmM8+VWUaSrJK5pRwUYPC1
         iDPcAEqmgP/gBIW4mj/KtyXz0MrnCQHGBloklB8swG47oR4RrQqB2Od37p0uN2378lQq
         bBDAcRCEmLvQ5Hth89J+Oqj83n/VnbcW4S1Ob5MzmVDPso8Xy4IDJRZvUAlRSuo4qYCp
         e2/siYu32JUzjWi42aYWHdNlRUbs/S/zZF6k6NY5vkrP/XCqmVLvJcYfGSvs6GaAwyRe
         7BDh/z5Egi7R9VEhSB1aeAKUOPFExh6dCHrg4iRdHKtn6zUKz9A4c+/bZItQhomqt8bl
         OSaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=pVbRkz0E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o204-20020a37a5d5000000b0069eaaf48eebsi1815533qke.224.2022.05.22.11.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=pVbRkz0E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:40284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqKB-0004bb-UU
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBi-0007y8-Ij; Sun, 22 May 2022 14:20:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBW-0003bw-Mb; Sun, 22 May 2022 14:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I0VPS71VXtn5mqfuBaY8i3Y6GRXsjpQM3fNl/iuWzEQ=; b=pVbRkz0Ejst9+5YobYZb7cMKLH
 5RXH0Lcu/X0qAKCT3QQFfvk7DxOzDgpg7Grj/tKO+g5vEjMVSvNRnVXmGljrrIEA4iowJwBT8Ffsk
 8JOPkcXBnHxBGo0xovlYoY0XGLo34pZc6vY0BOwfBjvONn2YW1dZz9QZEwoKVm58D49fBOfMPKm9C
 kCC2xnzw2pXHrg/89dbDfZZ6DIFXUdeCV/eU+u842Tiz6FjpQgkWUIx3fESp4Xp7ch2UXZxbdq4Pj
 5SzYLQ4Dm6Z1Pipgt3/SyWvc7jBVm4FEmJY067S2w/0RIPUZomcRhvJjzhm1IbMkNNJW2XCxcKDfL
 Iaq3D8yqQcu/XRo+AjwInH88MC0oo6JrtqdUSGY1wBJ3xH5+O6A+YZJo6hQAq30PLlgXPJBhwVjx+
 L/RQ9+zrDLyDybl+ApPWWALbT+3KK7R6ue39fkwGJ3w1ADYhHKO2nqv+Eq9/yCHauDxhkXYJYAN+f
 hUtxAc/oH3Huj9chOFWdd+WiTa/O5kVsGOfoTkA2UvKxHSCpknb0LrTNna/WpukMSWLOZTY4PN22h
 S1ovc3N6UnR+ZPvVNJVGvBpsG/STm58tdXsTZep6MpzrB8OaAQFLsuiKOQu0hXKN/ZW6m6kiQp0uK
 1LNZNalgxthC52smXTGzgISqGz24PyaChc7722iss=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqA2-0007pH-RT; Sun, 22 May 2022 19:18:42 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:09 +0100
Message-Id: <20220522181836.864-24-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 23/50] pckbd: add mask qdev property to I8042_MMIO device
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
X-TUID: gidAfuSCWnqk

This allows the KBDState mask value to be set using a qdev property rather
than directly in i8042_mm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index df443aaff2..9da602fb47 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -674,11 +674,17 @@ static void i8042_mmio_reset(DeviceState *dev)
     kbd_reset(ks);
 }
 
+static Property i8042_mmio_properties[] = {
+    DEFINE_PROP_UINT64("mask", MMIOKBDState, kbd.mask, UINT64_MAX),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->reset = i8042_mmio_reset;
+    device_class_set_props(dc, i8042_mmio_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
@@ -690,12 +696,12 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     KBDState *s;
 
     dev = qdev_new(TYPE_I8042_MMIO);
+    qdev_prop_set_uint64(dev, "mask", mask);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s = &I8042_MMIO(dev)->kbd;
 
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
-    s->mask = mask;
 
     vmstate_register(NULL, 0, &vmstate_kbd, s);
 
-- 
2.20.1

