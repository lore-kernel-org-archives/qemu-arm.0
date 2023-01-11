Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3821283ejc;
        Wed, 11 Jan 2023 00:52:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv7OCtRQwnoQWjrwncWb8lGENi8RKzXfjIjX2ntfrrK0vYoOODVK5lU8ws9uEpexeI0KS8L
X-Received: by 2002:a05:622a:4f0a:b0:3b0:a99f:a2db with SMTP id ei10-20020a05622a4f0a00b003b0a99fa2dbmr2101292qtb.15.1673427168083;
        Wed, 11 Jan 2023 00:52:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673427168; cv=none;
        d=google.com; s=arc-20160816;
        b=aZ2PR2s1+x8ifQnDcUoLkyeYEU8oLPXdHQwGngOjF4g0BfBKp9ouzCkHosEB8KGdzP
         2sD2izYNqd/4YRorSTbO3Kh2Vk4Zq5kSQgGkMY0+OH7UM8digy5EB3TrbM8XnPSUdbHj
         DczSrI9nyg9dPAFvudUntFv+9s8gwg6ABiGe7YTNBXf+QdrupMlehqgh0yz57sVfHGNs
         yTj6DrMOt8+8aGZ1QZTEW1hwzpELh8uHNAnPQrx5PXBcakCoBUVro17DvGOijnuNr0bH
         /1uCU1rb2sjWc14Iv/95a8ZQ3Zy2GlVfGLvhJB7g36wOp5+V7N41efYApWi6JbflpK93
         zeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rqfudLgvWami2CjesLmeGlPtQtwdVZ+Jj9zyr+J7ES0=;
        b=0v3hlAtBLWGm9lK5+sxMWvubUEFsAq1yKlMhEMf9SuEqjodPcoPrHMhgSuQgJboL/V
         n+uSwtuHpww3Zmg+niIyRZcTk5QtBpRqs9EFXbaJ4WflitdEFyNsSWLy0+aQvDgAAosK
         TQ4NrR+PYOtgHtHNMPia1U9zk3L+YnF1WyGHTUzbGQYsIiSMz5YmbU+djNJm93jg6UZ8
         5cq0hF9VP0KN1658iihGnebawiXHWJo+wR6628id8gmxR9NUFRHX6O65/jM0tlYO/dh3
         jDqy+RU52mAi8a8EWhI+BL0mjH0VA2857WGMnH5oCUQMVGknohH2/+J67riw8nDSSwx+
         FRNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jczFMNTW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id bl12-20020a05620a1a8c00b006feff66a187si8199610qkb.105.2023.01.11.00.52.47
        for <alex.bennee@linaro.org>;
        Wed, 11 Jan 2023 00:52:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jczFMNTW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWoa-0003Ex-Rx; Wed, 11 Jan 2023 03:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoV-0003AS-JR
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:50:28 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoT-0007bg-7f
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:50:27 -0500
Received: by mail-wr1-x434.google.com with SMTP id j7so9288911wrn.9
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 00:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqfudLgvWami2CjesLmeGlPtQtwdVZ+Jj9zyr+J7ES0=;
 b=jczFMNTWQboy88S4lf0GnHBvBod3ophmlNQm+X0fkQYN7Yokkl3HfouvXkX31GbR6+
 MJHIeWdz/SlJq1NJ6q4pW1Bze91qgjXOAz0rbizPv+dOB8ZSLRTCTryqugLb4bMb2K2H
 ECuv+f9ZxNzWY+xv8H2Dhl9tev8bTIEmhT6TW2BuZLEUK5s2aF2jSv16PdlAwKXXuwFR
 IugBfUVMwKurlWsV85+PhOjU5boR+ZwP9L1bTRYuo78xJgFt5/NnwWKXN+rjnvqe4Z+t
 qyPFm9ZAkd2XOmM1EOA0ZxPBG+B/wTkaAhn/JlAYqAnhjHRNWhDGymseT1uDmoM0tfpd
 3xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqfudLgvWami2CjesLmeGlPtQtwdVZ+Jj9zyr+J7ES0=;
 b=6ZXN8yRvNKqFWCMn6kkIzZtVxfsXijG9mgt0qd9c5BHQGCHNGxE//CdtTqpdWLZRNR
 ldyGW5foiCiTeDGCwgaXnho4jiVcF8Ga1aSd0Ecu1fFdg+FP+DAOV9s2ZNkAIqlkLFdP
 ZBGyr+UHeingvowzRKeb1rUh0KQVmS9PhchP64gWGyXSVDznG6CZSLTUlrRTbH9R58hI
 y4BXDm4QtiALJRByRsDDRTotasxL1ISPL9mKPtv5NamSJXUqSFlwRiGYyOBIfRdhS0+Q
 TGUhi1QetCzw0AVkz/IaKrny5ghFtPFtOI/WtIS8+oY/N1GqgtsPuu6/aJqXYB2QxFgN
 FCEQ==
X-Gm-Message-State: AFqh2krLKdcexuCjBC/lvy1qMF0nY8dXMARrXrvNxPSkOPbjyXVg21bf
 npC0lr9aD34Al3LEszFE3ZC7ZHCWoBL26yiy
X-Received: by 2002:a05:6000:1e04:b0:273:e385:1a89 with SMTP id
 bj4-20020a0560001e0400b00273e3851a89mr43507356wrb.67.1673427023360; 
 Wed, 11 Jan 2023 00:50:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j17-20020adff011000000b002a64e575b4esm13421054wro.47.2023.01.11.00.50.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:50:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 1/5] hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public
 header
Date: Wed, 11 Jan 2023 09:50:12 +0100
Message-Id: <20230111085016.44551-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111085016.44551-1-philmd@linaro.org>
References: <20230111085016.44551-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3FgZ6nmvKqsG

Define TYPE_GPIO_I2C in the public "hw/i2c/bitbang_i2c.h"
header and use it in hw/arm/musicpal.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/musicpal.c            | 3 ++-
 hw/i2c/bitbang_i2c.c         | 1 -
 include/hw/i2c/bitbang_i2c.h | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b65c020115..813232682f 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -25,6 +25,7 @@
 #include "hw/block/flash.h"
 #include "ui/console.h"
 #include "hw/i2c/i2c.h"
+#include "hw/i2c/bitbang_i2c.h"
 #include "hw/irq.h"
 #include "hw/or-irq.h"
 #include "hw/audio/wm8750.h"
@@ -1300,7 +1301,7 @@ static void musicpal_init(MachineState *machine)
 
     dev = sysbus_create_simple(TYPE_MUSICPAL_GPIO, MP_GPIO_BASE,
                                qdev_get_gpio_in(pic, MP_GPIO_IRQ));
-    i2c_dev = sysbus_create_simple("gpio_i2c", -1, NULL);
+    i2c_dev = sysbus_create_simple(TYPE_GPIO_I2C, -1, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(i2c_dev, "i2c");
 
     lcd_dev = sysbus_create_simple(TYPE_MUSICPAL_LCD, MP_LCD_BASE, NULL);
diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index e9a0612a04..ac84bf0262 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -162,7 +162,6 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 
 /* GPIO interface.  */
 
-#define TYPE_GPIO_I2C "gpio_i2c"
 OBJECT_DECLARE_SIMPLE_TYPE(GPIOI2CState, GPIO_I2C)
 
 struct GPIOI2CState {
diff --git a/include/hw/i2c/bitbang_i2c.h b/include/hw/i2c/bitbang_i2c.h
index 92334e9016..a079e6d70f 100644
--- a/include/hw/i2c/bitbang_i2c.h
+++ b/include/hw/i2c/bitbang_i2c.h
@@ -3,6 +3,8 @@
 
 #include "hw/i2c/i2c.h"
 
+#define TYPE_GPIO_I2C "gpio_i2c"
+
 typedef struct bitbang_i2c_interface bitbang_i2c_interface;
 
 #define BITBANG_I2C_SDA 0
-- 
2.38.1

