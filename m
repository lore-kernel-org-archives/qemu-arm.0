Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp446726lft;
        Wed, 29 Jun 2022 06:28:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u9uu9R4Kl/vLP/gsFyau8w9+Fgifr2H/CKhtDW8Dww6W5ZUUj3n9VTcHX2qiwv9M9JXhMA
X-Received: by 2002:ac8:5e07:0:b0:305:2d2e:5bd9 with SMTP id h7-20020ac85e07000000b003052d2e5bd9mr2331225qtx.537.1656509296915;
        Wed, 29 Jun 2022 06:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656509296; cv=none;
        d=google.com; s=arc-20160816;
        b=pU2KhpxHvy4hHQZv8Uuuh50fgixtj/gj8AYvUmbeQhUhaU00fDqA+LJ4X+sjHJLHqv
         BHdvwionZfaszIZcnlIvJ5IzkxAscswVzEC2+iA//DHfRV9T0LGWFILUw9EuSqjAxZVg
         M+3Erfk+tewjsWyXEBuLB9Dvhq29fzEn7zweSq8jV5eH81BUCXXwk0o7ueswcY3WeY3V
         h/OIwKPPzQcaHPnL++BwufvIMP/cG8VIKOyaVxJEONBXb7Xv8vSJDOv3qms0pTXStldC
         sB9MK/n6hwadTPgF8x/Ymo7VWrMfT1LqHmjGIzXUrIlYvrrkCKwsgXDO9G1GlDtFPbX6
         uMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=vm5CODCEw5+uAgwwl3NwGbM1GURCO6yW/Nt+Bt/RNpY=;
        b=igmEUOR+gfwuR8kv+LF4OzBZ5OoSr07dHVjgHSF3E+LEVaCGvLDLPKmTOZgd1+cuIw
         FCegLLrn8Ra8yKsII3gr/7FbfFTjkJ+MhkhROc4qOkL+eK/lWu8eoiYac4bCY+Y8/UTa
         CG6aQS4itg3nKrCksaVzDcVDa4zviHDdkqoZL9ci3Vi5uiCaQz70EJZXDqfbVv+sDYHZ
         PrhQOc2CaV563/KvA5MpfFcLxTCTA0ZDUU4CK+8uYsgQgNitxhejFOQipdtvt5YJDGgp
         YskqaI5dTDHl45L9YcrIHcSV1vDJ3Xbfx0C+JqdGHOyjmVX0+aUfCvYZ7mu8MiA+w49R
         4ceA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=KARgPK8g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk3-20020ad45d43000000b0047054417e66si10823821qvb.98.2022.06.29.06.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 06:28:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=KARgPK8g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:47462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6Xjs-00028Y-6R
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 09:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1Q-0001CM-DE; Wed, 29 Jun 2022 08:42:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1O-0004zt-R3; Wed, 29 Jun 2022 08:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vm5CODCEw5+uAgwwl3NwGbM1GURCO6yW/Nt+Bt/RNpY=; b=KARgPK8g0c70S1HoF6MRBEcwa9
 9KzQJ9H81sZk0UI/tuVNRpW+JBEPelAe/8ZokquIwoaohl5T3w/agzWvmQrNFM4tcmlOwSvLtGrsp
 405SvsZffsz9UZHSZfAtOhk2t5bhPzysp37gYVQxcOOn6lbdHODQlKq5xKz5giYVpryaGcdT1mroi
 6GdkMjnQkZos7tKTQLqSzvMPZubEqIvkLbvMGJnU2TiNAj0MNtAcbf6zKJ25YQY8CXZlVYMCX6P/W
 AYDnryQJN9VRQGkcpEQsl1LDtUOPRbWQMQWh8OcBKYw+ZnPQPoVpJ8X0e+lLGLkkVNscmb6D5Ysfi
 f9wIYu0b0KeeC8rekKaGnLiMi+BD1of87bEYgL4HP1xETWOUXx/n7OfU5mMQvYEjvHFmRa3MnqET0
 wwR++RLztvC18g6BsakUDVNGbKyE6cxdw2lpqYBbFgyz3W/6IF/rl/bDvekWeK/tXsxdTwzSM619H
 OTcd6CflOjjon4xA6TUytENTY9Tx7yBp3/8VlzAH853O0ELrGmMn5/5dhS3nOnI+ccWKmhI4ocVV3
 WZUOS4+zl8sJJ6PfId7EVyWBT6IDkv0LPBFm5GA4moe+ZWo4tbGA164vorsqpy1HVvVHxzgaOTPno
 JXOrYBSXQ6nBiK64OK9vjKlGB/qRkOE4uSJiJsmqU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzo-0002tZ-3G; Wed, 29 Jun 2022 13:40:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:21 +0100
Message-Id: <20220629124026.1077021-36-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 35/40] pckbd: introduce new vmstate_kbd_mmio
 VMStateDescription for the I8042_MMIO device
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
X-TUID: Ob/GPkzPENDq

This enables us to register the VMStateDescription using the DeviceClass vmsd
property rather than having to call vmstate_register() from i8042_mmio_realize().

Note that this is a migration break for the MIPS jazz machine which is the only
user of the I8042_MMIO device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 9184411c3e..195a64f520 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -699,9 +699,6 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->region);
 
-    /* Note we can't use dc->vmsd without breaking migration compatibility */
-    vmstate_register(NULL, 0, &vmstate_kbd, ks);
-
     ks->kbd = ps2_kbd_init();
     qdev_connect_gpio_out(DEVICE(ks->kbd), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
@@ -732,12 +729,23 @@ static Property i8042_mmio_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static const VMStateDescription vmstate_kbd_mmio = {
+    .name = "pckbd-mmio",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(kbd, MMIOKBDState, 0, vmstate_kbd, KBDState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = i8042_mmio_realize;
     dc->reset = i8042_mmio_reset;
+    dc->vmsd = &vmstate_kbd_mmio;
     device_class_set_props(dc, i8042_mmio_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
-- 
2.30.2

