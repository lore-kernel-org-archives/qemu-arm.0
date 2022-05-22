Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3072539lfh;
        Sun, 22 May 2022 11:49:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK6Wz6qx/REZNhTMLr9wLgze1W96+z8XqhLDXL65Ckti0qzczTLKW/97JFpLlD7RPEN4Eq
X-Received: by 2002:ac8:5985:0:b0:2f3:d36b:dea4 with SMTP id e5-20020ac85985000000b002f3d36bdea4mr14584796qte.488.1653245366348;
        Sun, 22 May 2022 11:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653245366; cv=none;
        d=google.com; s=arc-20160816;
        b=KDJBD0VDVyZqvpOS6ATAfnZJk2KEhCjXspgE8AQUQjUr83Y96rvA75g6J1EkX6Raqc
         1N2DhNxI6Sun1G8vXJrHgBBNCQBUuQW9eBB5D4v+IVdgxN9k4Sh8NDOFmEZOg47fBpw3
         bIpNX9oht5CiAXVkdSOOsxMFJaafX6bnSpvyiKB4t7ug26vQd+IUSjAb4hXLabjZBLWG
         k6SgSynhzvvLz6ZVyHgapYMJYrL621EZVQ88r9PAkkGxG9cc4zMLVA/kPariFMgfyMp5
         qef6gEmn0Ig7Q51tyMFiSU82EC+KryPDoFXNMyC6ywpaunfK29ytIrbHlZPeOcsn1XSl
         mhQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=owJa9ksMuZrAnm+DcVyAc3XwEqhiEJAr8xpOQuSc9uE=;
        b=ispAMykdn5Mnyy58P3tJARp8gNq0W3BjZpCSJbtz5G8b3AlfxR0YyLeiTA7A0n29BV
         oqcVwkjOxaJF427+Go4o6ffWFzJiKJ+Ut9F7+wz4iduS/MkB+ce8+rcvKvJYgs+gKE0J
         NIBbHEhtuj2x4SM/xN3ouUu6cA0eSILvcRfuSTFHNAfNmNhOPH4uu0HYPJZf5DVJXHCX
         pd/qG+Tski/P0zYUUvkPpZ7ydo5S/u9tBSYOluQoiMBp+/7MlKt/IysYXBrmg9zsW2dB
         u2gN+UyAOsWqzRfYOTEiaxGs0GIzcMPDXDH6AT0XyfX3GY/EljfKzwgbv8y6W+siMIt1
         mIcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=eehE70a0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js5-20020a0562142aa500b004563029c775si981681qvb.133.2022.05.22.11.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:49:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=eehE70a0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqdp-0001H1-Qz
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBM-0007n3-8g; Sun, 22 May 2022 14:20:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBK-0003aP-HZ; Sun, 22 May 2022 14:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=owJa9ksMuZrAnm+DcVyAc3XwEqhiEJAr8xpOQuSc9uE=; b=eehE70a0DizH+HnWs6iYtQOEBr
 V13NfyAQDYOf3GMtLQeXeXBvjs308ZqgMESZ1PvioKz8Gm0GmvY3nlXkGA7mg7YQHZUCuLCF7Yrvf
 IXrI0Y2/zOWRkbp3pRh32gT07XJNDMMVTD7rOm2yc3kqVDwsOyu69QZ/bIg0YYYcDqntja69L0TSH
 WZnyR9vXDYKyvgmh+KKhG4hl2nvblunDYS6z/fB+Y4bGIYHvbqXCBo5kOLA6YQRFmTlGjjzir57b9
 /qMV8blgNQsTIBWAS/l0SXjGUS6Te3saS707Es/R5fMtbv1IgCzw9wG35/l7/kMOh9HvjMZJVz9+K
 vLYIol74EirJAP4t3qKQHGUpY6GCp6fmvB+KJD9djkxbsB8CVzujPjgWqKq0B+xuPNyqmN+4H7ptI
 U4Nn1NawTaDbHtrAjsTHljwx/V5cP0rdyjQ4AiOSPDL34CNMZdVxjjwkUz9QOnVOlvpry8DiKqfy4
 kWDCdQ+1N51YQcGVIkK61/8RRu9al8sgGiT5tLBiNG/fnSMRd6Rpo4Kftm1gw6jMpyqQ/+GSyE5lh
 61GvlWibOh5rg1wM4BiOKhpi8XDcV0hmyUwTQIn1M1Se1ye13Y2IJuR3p81IAFqXa9ky69q+OQxF0
 Kdl+RMSVGWyhpyAjqUckBppiQ3tOAnOIYXZ/ro6aQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9u-0007pH-Pq; Sun, 22 May 2022 19:18:31 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:03 +0100
Message-Id: <20220522181836.864-18-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 17/50] lasips2: rename ps2dev_update_irq() to
 lasips2_port_set_irq()
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
X-TUID: bU+C8e6aQJB6

This better reflects that the IRQ input opaque is a LASIPS2Port structure
and not a PS2_DEVICE.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 2ac3433014..adfde1684f 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -253,7 +253,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void ps2dev_update_irq(void *opaque, int level)
+static void lasips2_port_set_irq(void *opaque, int level)
 {
     LASIPS2Port *port = opaque;
 
@@ -275,8 +275,8 @@ void lasips2_init(MemoryRegion *address_space,
 
     vmstate_register(NULL, base, &vmstate_lasips2, s);
 
-    s->kbd.dev = ps2_kbd_init(ps2dev_update_irq, &s->kbd);
-    s->mouse.dev = ps2_mouse_init(ps2dev_update_irq, &s->mouse);
+    s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
+    s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
 
     memory_region_init_io(&s->kbd.reg, NULL, &lasips2_reg_ops, &s->kbd,
                           "lasips2-kbd", 0x100);
-- 
2.20.1

