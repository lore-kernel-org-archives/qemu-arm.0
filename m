Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1702982lfp;
        Tue, 12 Jul 2022 14:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tsGBgqGPjWDlGLDxq3kI0vBcjyZN7cykZDRzCdAERknRsXsaSZBa8ZOGwQLqP5HqXNHAuD
X-Received: by 2002:a05:620a:44c6:b0:6b5:6b78:cc0a with SMTP id y6-20020a05620a44c600b006b56b78cc0amr281918qkp.607.1657663017144;
        Tue, 12 Jul 2022 14:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657663017; cv=none;
        d=google.com; s=arc-20160816;
        b=WsA88esdeGHhuvc8NTti0DjY5cDKMeTh6J+PG8VHgR04vGno78TG4vb4cGVMHfkXmT
         zvO0GqsUgKwep3q90EFxXmJ14DiWkjqKLfPNj2dwUFs1CHXEQOwplJJRVljjMhrhjNuV
         h0N7qBuaFvvqB4V6C3njrjhjSaKTTAW/78lBJnHWzoT10QwsCZpZMCPBN86dTlJgfcOy
         6N4rPoA7OSrjFt9sNyxGp+nv4Az8bx+Npx7MMhgOCN2hts+kEAjCfuhHG7+Ag0zzzrFa
         ezt5KtrYPl0MBUPeXmkw3xGaBH/p3N+FWRwezGV9APVp+lgAz7uvQQyWDys4P9MmoliM
         ySNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Mb8hBJuEMzvF+Xnm14EqKiinjkKQKTf1lUgasdea4BY=;
        b=YCM97UY2dKHhwrPVCcrjrRw0019vbvGT16zdp03sUah9xWbCJ/w2J4abqkbWcBeeEw
         gxcNx1mNicpvbwLEkYitfTLlH1p23uB9bTk+jqLB3FcfEwYYijzy91j3f2igwKAYtekJ
         /YdJLzbStymQx1AIrc8vxhW0E6UljEX9w/tIIdGqE4QIhz6iqqMoJd7JoD7Xaq1A8Vgs
         WMPVspd7iems0hch3F/I9qY9ztsRPzrt75WUsw7OHPcWzO41Pqv/0GCd25xmCP/1WvK4
         DpIk1O7mp5iExb22Q/XClHGAaXDECMRvB5tTShB2yQVvdg8NjcZxsptkZ/UjwNQzrPnD
         r0IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=ZXrzfsdN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17-20020ac84991000000b0031b65078715si5852459qtq.561.2022.07.12.14.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 14:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=ZXrzfsdN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBNsG-0006P1-JB
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 17:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNom-0008Gb-NS; Tue, 12 Jul 2022 17:53:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNol-0007mT-5i; Tue, 12 Jul 2022 17:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mb8hBJuEMzvF+Xnm14EqKiinjkKQKTf1lUgasdea4BY=; b=ZXrzfsdNqiHa3JlyOI/sGlT7Q8
 9xQl6sEByBq2gm7Wpdy9YcoSlknNF8DC7rtA0uIjBLdoblry4vGrRZvkWfzI3+Nv09RtJOi5pvXZ8
 X9dICvwMjUevC63liBl0MN0sqQIcDmf0cJjGc5JljWJTaUfnyBWir48oMfZVvB/K7lavlpJymTFwY
 qMuu+GSL2vdofEQXNh/AnuFiDegnw0Vnet0kFZJvjcDltfytfYVZUehbuF6Z8C9BA1YWUmNXRR7eJ
 Wilc26mI9pYurBQe7cpTL0+t9d/SmLjKfbSQUdx94ZR4c8eMdTkXlY9KD8F+eEcOPrrojkm1p6ckn
 QeuRIoqkEsQ+b0r+Es2qpHynG95CvNLAhZWOMDRIXUZ0s/AudQJR6MWFdUm38UZRWMy11MXBGYtPN
 mJ1rxC3JhxU0hKK1xNy6QsD3/j79zp7MEl+Ih/IQ+VcAeEd0tHkfJV1Akw2+RMkaj70TfzbsmZ0Wm
 /hkfJQwbt8f60B5nvInGX7GyuiKMw6d72EQitoq8h0Y7XGWUSU/nM3QYRH9TtV+iQAK/CiIK50CE7
 1n0UhBZUzaMcfQHC3W7LuEX16Avt1JxCvE/UFkVQCyPIWz3EgKnrmMzJLyylikj1dKukXOGwZ4vXW
 4bi0NYZOS5KnT9lDdEwZvKNIJrdsJvuAyyIOuRSO8=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnL-000Bqt-7k; Tue, 12 Jul 2022 22:51:55 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:14 +0100
Message-Id: <20220712215251.7944-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 03/40] pl050: change PL050State dev pointer from void to
 PS2State
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
X-TUID: COo5KLDF2KRs

This allows the compiler to enforce that the PS2 device pointer is always of
type PS2State. Update the name of the pointer from dev to ps2dev to emphasise
this type change.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pl050.c         | 13 +++++++------
 include/hw/input/pl050.h |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 8e32b8ed46..0d91b0eaea 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -101,7 +101,7 @@ static uint64_t pl050_read(void *opaque, hwaddr offset,
         }
     case 2: /* KMIDATA */
         if (s->pending) {
-            s->last = ps2_read_data(s->dev);
+            s->last = ps2_read_data(s->ps2dev);
         }
         return s->last;
     case 3: /* KMICLKDIV */
@@ -130,9 +130,9 @@ static void pl050_write(void *opaque, hwaddr offset,
         /* ??? This should toggle the TX interrupt line.  */
         /* ??? This means kbd/mouse can block each other.  */
         if (s->is_mouse) {
-            ps2_write_mouse(s->dev, value);
+            ps2_write_mouse(PS2_MOUSE_DEVICE(s->ps2dev), value);
         } else {
-            ps2_write_keyboard(s->dev, value);
+            ps2_write_keyboard(PS2_KBD_DEVICE(s->ps2dev), value);
         }
         break;
     case 3: /* KMICLKDIV */
@@ -158,11 +158,12 @@ static void pl050_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     if (s->is_mouse) {
-        s->dev = ps2_mouse_init();
+        s->ps2dev = ps2_mouse_init();
     } else {
-        s->dev = ps2_kbd_init();
+        s->ps2dev = ps2_kbd_init();
     }
-    qdev_connect_gpio_out(DEVICE(s->dev), PS2_DEVICE_IRQ,
+
+    qdev_connect_gpio_out(DEVICE(s->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
 }
 
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index 2bbf7a9d50..c1f6c5a1fb 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -23,7 +23,7 @@ struct PL050State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
-    void *dev;
+    PS2State *ps2dev;
     uint32_t cr;
     uint32_t clk;
     uint32_t last;
-- 
2.30.2

