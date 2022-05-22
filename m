Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3067852lfh;
        Sun, 22 May 2022 11:36:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXaqHI4A2CdQZrCKly9a4DVkqP8xaC6FGRzH+h9D2aGMyDdug/CBAlAE55w6NJgd3mwWHK
X-Received: by 2002:a37:9207:0:b0:6a3:45ac:a42c with SMTP id u7-20020a379207000000b006a345aca42cmr9217157qkd.350.1653244587859;
        Sun, 22 May 2022 11:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653244587; cv=none;
        d=google.com; s=arc-20160816;
        b=q0asOFS0wUsUZ7ffIT31qGwcQezPGkj6W33+dk4UQpL2s+nwIVPkNlKmuMRq8bWlll
         FYvTM5rNXZi1gFygkfNxwGXpG06LjuuHCWv+hw107BlTE+ezuNg4DRRciFmcTSONaga7
         bRF3SBwtagiu+EdsFfaMPhAt0qo97ORObhSM5kVPynQ6ZzZCryw0JxaTQOFkavGhtktA
         V/7/m5kfptegpLEHsBgsIQPTiF/mXsUdCdlIThS8mjKBwjaJdPHbFqI5R1h9Gn2urqe5
         MNGqcfpC9opfeYjQeZpDaIoO+H2moNnnDy6QwwmidLeERylLeZ8R2YEJHxKQL1h+duv2
         vClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=99ZsLsVSKZKYLmNzVWibXfl0svDvqCK/Kq9Rs95rMvU=;
        b=cgVDU1eOt6dW5IzRjpHgyfx787i/zQS7wsBhgCf8cIb+j12/AEO31hbn0wk1mq7yKa
         PX16rClCH66oeEBg4F6aOW7dVBgmQIpjKnUqIzSsVTr1ibrBa0uTspErp9Fnd2SnK+HI
         6YVUY+6dj3VkRJ7ktRppdw0QDgzH/5X4w4F8PSbZ81P9TiqHnkYmOW5mC01ZOw1nMMRn
         encri6K3nddHj4lGcnIpCdOH4TY2ofF7TDUdkEeygBHchDlg73ZyaPeogi4xCojJdtZ2
         1ENQVGh0nOsZv1sMQQBIS4m5dU4kmBuJYhgAKodpq5MeIEqjA94govfeqRTtjAkQ2b8o
         5GqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=0Uz5rur0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu12-20020ad45ccc000000b0045a8a410e18si1942092qvb.411.2022.05.22.11.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=0Uz5rur0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:55818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqRH-0007Ri-9B
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBI-0007bP-A4; Sun, 22 May 2022 14:19:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBF-0003a1-33; Sun, 22 May 2022 14:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=99ZsLsVSKZKYLmNzVWibXfl0svDvqCK/Kq9Rs95rMvU=; b=0Uz5rur0aiLC6yAwrMZrLrF97A
 mTuEdE8NZg6UVnyVZT3o1wfuYJYgd1nIPv0yaSsB30ns/GlodMhQhsqPcp0FUk8a1DFNP/YB/3BGX
 wo8zfkJeEyPiLIZsi1n0u+NuhQkWVa6cwU7ilCd3vdx/iL/K/eu6wLGtdeLeyo3auCbnHwAitxd2n
 fUvE6eokB9T8Rk8xChsJGnHMWXeV36od9G8ICAgKWHdZiFMxmNot9mzH8vMjxT4r13VtKGr3+DbSw
 j0pvEb7nOvL6TDvo4hEQDArmx1SvSpnfHOEQva8yvblbA/7o1bTJABKpkDiQIeS/OI2tDJZR6cZLT
 NaDwkjXVxiddTcK/gFKetE0mhahzblcLr0xh+lwUd3vn5HrQSV4byPNCnBUH6eubyTXUPrPKrEcyi
 YjvJi1x9KfZrKdAEDGgOp/KrcATTgk7BhcJ9xMJnXFipKeGEz3NFPqFK2aeexSwQzoVslIrGFBB1t
 bV8V2gdRmKAQWFp5+65SGltCjzS7qeY3AaKVuyFPY2CNiX181SPI4S52lVVIivpZZ8kpNV6FyC6ul
 npyKBQanxJYynjWIWsUD2bINRtHCxqwvT+Kld3Ybc/1HhqVCL04haFz4gJZoTWqDXvk6Uu4nuj8WK
 ISc8Js2X22hzUWySBdPBtdXpZePdgS1GnjlWp8XZQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9m-0007pH-68; Sun, 22 May 2022 19:18:26 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:01 +0100
Message-Id: <20220522181836.864-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 15/50] pl050: split pl050_update_irq() into separate
 pl050_set_irq() and pl050_update_irq() functions
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
X-TUID: ErDHvTuGtftL

This will soon allow pl050_set_irq() to be used as a GPIO input function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 889a0674d3..66f8c20d9f 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -57,15 +57,20 @@ static const unsigned char pl050_id[] = {
     0x50, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
 };
 
-static void pl050_update(void *opaque, int level)
+static void pl050_update_irq(PL050State *s)
+{
+    int level = (s->pending && (s->cr & 0x10) != 0)
+                 || (s->cr & 0x08) != 0;
+
+    qemu_set_irq(s->irq, level);
+}
+
+static void pl050_set_irq(void *opaque, int level)
 {
     PL050State *s = (PL050State *)opaque;
-    int raise;
 
     s->pending = level;
-    raise = (s->pending && (s->cr & 0x10) != 0)
-            || (s->cr & 0x08) != 0;
-    qemu_set_irq(s->irq, raise);
+    pl050_update_irq(s);
 }
 
 static uint64_t pl050_read(void *opaque, hwaddr offset,
@@ -124,7 +129,7 @@ static void pl050_write(void *opaque, hwaddr offset,
     switch (offset >> 2) {
     case 0: /* KMICR */
         s->cr = value;
-        pl050_update(s, s->pending);
+        pl050_update_irq(s);
         /* ??? Need to implement the enable/disable bit.  */
         break;
     case 2: /* KMIDATA */
@@ -159,9 +164,9 @@ static void pl050_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     if (s->is_mouse) {
-        s->dev = ps2_mouse_init(pl050_update, s);
+        s->dev = ps2_mouse_init(pl050_set_irq, s);
     } else {
-        s->dev = ps2_kbd_init(pl050_update, s);
+        s->dev = ps2_kbd_init(pl050_set_irq, s);
     }
 }
 
-- 
2.20.1

