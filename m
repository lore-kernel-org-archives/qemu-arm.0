Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1713269lfp;
        Tue, 12 Jul 2022 15:26:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sV7JX0wsg4N/e2hPuiLWzwV6JPjEeMnDR29KwDjKcOrRkF7erk4kpZEDV9OC5eYJNq6FWz
X-Received: by 2002:ac8:5a94:0:b0:31e:c94f:bdb1 with SMTP id c20-20020ac85a94000000b0031ec94fbdb1mr212978qtc.406.1657664789371;
        Tue, 12 Jul 2022 15:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657664789; cv=none;
        d=google.com; s=arc-20160816;
        b=YelXJ08uBKnd6VKAC1mUaYBKVttXqqsNfcn4wR4iG8d+4XmBoGz97Vk77sbQ6kpKie
         EAXqBuNEYQZwHjxgOz4SSP4jBRoIizFl9X3yeULjIMRKjekE5OTQuN/AqPcYu7XIsu08
         59bpB/5e7T/izI6G+ZN/ihNAH3KIeAd5o0w4m7c7pUzxuCVYM3rh/7uu7P7NFpHLOpXQ
         FuWppGa6fL74lrlB6O2216jq0NW8iXbxhXcRJ8qqeYY7d8TLcsfmXMHsoCK1PXEp0WmJ
         N4vRMosmRNhTpQhYOdTMcPzVLDfZDoEEjS7Nvck9S+sXduIoaT0mBcQj1+btyPYnNG5a
         Mk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=i19Au1Xthb6eQNOLGqspmaK5Lua03BoRBL4DB8X5lJY=;
        b=M0UGegsNNtGFWzyRAnGUZjtO2kQd+rCq9nnWaPB77V/SQdB6D1jHQdYuyYkrqKYK2K
         V1I1XeO1hN3C7f0SJqEVG7BrFYoaXXCjHnjPP3WQsUbEJtOWYldl9X6b/OK5Ari4XiWC
         BQtM330tYNCluCR+ZWz+fjkZ0pRCrMkF3Ogq8O4o0DY7zGwGylgUWqoFZ4I6A1UL33Tv
         o2pp0EYa2GPeYk0MyRcDd6+7rtIWlrI8XEmwDxpPY0Ko+zAVGNOf40NE7mnIOYxZQQkw
         9pAZQUcAM+hoy2g+0XgOS1mff4RU62zGgPYlLmoLVRkVHFHYJV9RYyyS+FfuD3EBh5Wf
         B8/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=nzIbsk77;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu12-20020ad45ccc000000b0047359545977si6867488qvb.181.2022.07.12.15.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 15:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=nzIbsk77;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBOKq-0006Yd-Qn
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 18:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqt-0004nP-1R; Tue, 12 Jul 2022 17:55:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqr-0008Av-IR; Tue, 12 Jul 2022 17:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i19Au1Xthb6eQNOLGqspmaK5Lua03BoRBL4DB8X5lJY=; b=nzIbsk77+UWL2M0mOP84pSCZvs
 ZpbsquE5ogQb+yIjdELzp0Kq2YDV98qnLmZjC0yGp7g1QNW0VFBpd89/GIc0dRocFxuK2o8J+FtGd
 sdYq6FSQxfPehILkfRIfFo2RB1ZuSpuU2HgxQJma/FlzfVLpmw4IF0hDKa2tQ8OUp8OuPqO2VnxEx
 QKNp2VF+nC0AKAfb57/miwHuovAdBrlvCPXtpkShjiEIvhmwsNLKKvhkFo+mhTTdWeUBcqT9mcynR
 ydxJhJL2OY3VrH//nnhqyoYDkAhzmHitk4E1lenyfo7rYgI/6siS24+1daMOhuet8wt8sztOEP3iE
 pH6MILy7YCNbgXYD2n0pmH59SYAc4IuhQPdQdYXV+4T1wTy+1DmL+VXa5Vu3I0MSX/qc+qWqiyi7a
 gQfV777tj/wBvhJNUkqwSYcZ/V+Y9d0zi3yQTRXX0K010qurFHALJSrS1ntw89ojgvoDd91C6MAjb
 7ZbVPeo/nX2enL4eYy/jUZabuvH7YN2/0NCmairqEdX/1Ro/PCqcVBNvgJAPvwOVxYel66nvekUdf
 KNWeKzcFKDYDvrmJtJ0H9hYBwihfXWjGrcN6mmrsa75J5PCuFBgoKsDummQg7kCBkzj+0EkHYDCPO
 gW7P16ZNhtjlfp700FDCPT8aQHN1rmGaG+Nb3pZw4=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpA-000Bqt-4D; Tue, 12 Jul 2022 22:53:47 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:46 +0100
Message-Id: <20220712215251.7944-36-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 35/40] pckbd: introduce new vmstate_kbd_mmio
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
X-TUID: MbyZ0ha5s+ml

This enables us to register the VMStateDescription using the DeviceClass vmsd
property rather than having to call vmstate_register() from i8042_mmio_realize().

Note that this is a migration break for the MIPS magnum machine which is the only
user of the I8042_MMIO device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

