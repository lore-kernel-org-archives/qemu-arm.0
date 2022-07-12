Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1702737lfp;
        Tue, 12 Jul 2022 14:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBWxCqC6ySHkJB/hKZMYx5E2eDTzpSX7+aaxJEJVOynoxB5AWmV3fADBjRzRCsWQf7rjuT
X-Received: by 2002:a05:620a:29cf:b0:6a6:ebdc:ed65 with SMTP id s15-20020a05620a29cf00b006a6ebdced65mr291762qkp.161.1657662954897;
        Tue, 12 Jul 2022 14:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657662954; cv=none;
        d=google.com; s=arc-20160816;
        b=X8Ba0d6ENzeskCJ8sptFm0b4xH7Yl3C6pj7LiP73PS+V1hQSxt5sQw0kQ49EZ9b3eu
         23pyqJ+C3jIqEbVI66RVK6YAWa5eqyZj0yRd/2uXJyTX//IfhYZIZlatcY3SMittbkD+
         fmI3qXhD7hK/qf9ricEHNKslEK9io9/lMgapLi565Gt7W9kagRg23S7/lfmX01xGbUEF
         7jUVAE+By8WGu2ntk/c+yrMWx+2s0YCfQi8ZAZOYzkGYXTBhLUhMg59nMkOexWRusEGF
         iRc0VPxuvgdj3Cz5imG0EBVH1FxCYPzLDCn7XAUew7gpWJbr5eOGGecwT/SA/r3C0Xkk
         7DwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Vhqbmb/OfAp1EbToOlQ9t2ACxijfrv+podwunxLOmZg=;
        b=HqQMQQ95kWp/kREXIeOcaE5UMfRuAZhUQciI7RPMhjdZZqfcWrHmSSReMvvURHOrY5
         RsdXNEgXWr3NbIKJG3IdfoXPVZ4e1oD2yo2GmYvMlFec3QLR5zfjcCY6JeOZq0e3F4GV
         N/js+meJCUgJE2zca9DKeHc2uydFINVCWwYnO7rYjwdfGc2eM219SsOhqcyJqhg2wGjn
         MBQjhD66cNVXgi2hSnF6hxwE9aMi3q2+RGy6eYQFsgXL8uiAmE+L4cGSEL9LqJOz0fch
         zrahKbJ1NC8Igk2lm7gtMb14C+RmwCF9UKbIsrB5BJAW0rYDy/1nRrZrcZChOp75M66X
         ZDRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=aTR5d9bJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc12-20020a05622a410c00b0031e7aaf7355si6718099qtb.453.2022.07.12.14.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 14:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=aTR5d9bJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:59198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBNrG-0003Rh-Ca
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 17:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoj-00088s-Er; Tue, 12 Jul 2022 17:53:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoi-0007m1-0P; Tue, 12 Jul 2022 17:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vhqbmb/OfAp1EbToOlQ9t2ACxijfrv+podwunxLOmZg=; b=aTR5d9bJs4PzzJ4evvv7kU40S+
 qeUA3K9cb3OAYCLIrsBhoC54euocZn9Etx4dfGLXclbQ/+NsDpo4aFKEFuyKizct8+Y/oGlQ0YRaL
 BK8hrfphE+4VX3ZfevG9dJXF+pwH9HHTI93JatKiHYg+WjtVz7wPoJe2M2sNLre7dlelWM6bmNkuR
 xxAmjSGJDNaq938U0LvhxReWZf6f+5NnNSFQRoKdzrJY5Hm3EUo+kBHEPTS6Z4jqvqCgi6ESKElzC
 d84zw6WhiMN0TA2sqVNROtCReDTdJpMBq2S1/yswLdhBsKgEhm8AEY/ldsu7x5u3GIDFMDiQtNaOR
 WRLsJApjoZm2jQ8IAyiipETscXZ6GVuhBnEqOw71Pgrq2joePli64VHFcXUp+ZkYC5NgodYlhogUE
 3OUQhz2zpGakuVPYZwPGQmScYrLlmTfhaYkyS7sziFL6eDoYD5ElxKdM8q6RBp6er089MmC6ZAwZx
 BpoNGZBvvrLPf7WiL8K2nqCvE6xN1cxjN+JD9bOr9WFos6do0vFyeHDmgaGCWz778/rh/b4jH+RNJ
 ssa0hK08Y/MRGkVpuO5uEkgE8XyOqjPDuQOKLRiUtlUxa535LYer+RgeDUJh+Tb/1II+YLEk5ZbZv
 gOdtLzFcRBsXuL2PI9TP/S+Vj1lbgxNJxomVuV/+8=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnH-000Bqt-8q; Tue, 12 Jul 2022 22:51:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:13 +0100
Message-Id: <20220712215251.7944-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 02/40] pl050: rename pl050_keyboard_init() to
 pl050_kbd_init()
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
X-TUID: wPqZHHYAVW60

This is for consistency with all of the other devices that use the PS2 keyboard
device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pl050.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index c7980b6ed7..8e32b8ed46 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -166,7 +166,7 @@ static void pl050_realize(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
 }
 
-static void pl050_keyboard_init(Object *obj)
+static void pl050_kbd_init(Object *obj)
 {
     PL050State *s = PL050(obj);
 
@@ -183,7 +183,7 @@ static void pl050_mouse_init(Object *obj)
 static const TypeInfo pl050_kbd_info = {
     .name          = "pl050_keyboard",
     .parent        = TYPE_PL050,
-    .instance_init = pl050_keyboard_init,
+    .instance_init = pl050_kbd_init,
 };
 
 static const TypeInfo pl050_mouse_info = {
-- 
2.30.2

