Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2091390ejc;
        Mon, 9 Jan 2023 00:46:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJFUTf50nfiTVBoVFKuU8+uhHyun8LIS6SspmPo37K3EJEKqmvPiSJkmN1NKbncke7KAKF
X-Received: by 2002:a05:6214:2e85:b0:532:2aea:dd6 with SMTP id oc5-20020a0562142e8500b005322aea0dd6mr8471319qvb.40.1673254000712;
        Mon, 09 Jan 2023 00:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673254000; cv=none;
        d=google.com; s=arc-20160816;
        b=i0u1su1rAACkghdzQOzLXSRlxub5XAcHRtV0zTkrb0coI3iW4rumULIU1Xy1qrzegc
         HloqSr3Ul4zpBbbIOclIVKs5wnkRgN0dLEx6IszbzIhA/1OHtZnZRNElKjuc12R1Am6S
         9rqhIDZs758oHBaJekfglblO5oxYc3jzGpsUn3UiW5XKfvdGakHuwykFPwLarnorpJvj
         4e7eTNNQhRhs3RQtyTeYSg2WJLVDDsAl23w8SSwxhBQuUfJQHHqEKDru3TpRWsrbDHKv
         FVSB8+y42YxZqcV8MJ/eb9Ok1xCR3KMWucov8pHbtoU+x+YHQRyifd/BVfQMo2gB8CnO
         KnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HTqoT3kxPcjorZ3mugLt6fynVNQ3ed1VmFMT7P6iTBY=;
        b=bFeer6w+JM4caBhFTnoKroAVTHSdWkZ3ZGZCFLKdybtdUZHnQdKR8Dwm1sM/jKhL8N
         WLidPh9dobc61lejjmHyhnXY4BJ9c+9p287Kzqaok//M0WFktZaQKdl29hjTaDxfX+11
         FTJk7KBQ4tAi5HieDcnjlKd4vNSRhOMJ3Dk3NBzunzhC2MCYIFtIHSpF2KMAdi/d6tRW
         t/tEDYI0i79FdypyZSWecwl1SMwB60MO4ZRy2YjJY/4s/cBljDs41u0rgi3N4izTZiu5
         qRSJPoB76QrT7VeyHPdMa7oaZUxV+1aDFA0qV8nVnf4DQAnpjzhpCqY4a+RkBwdvZejk
         rg3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YgSNwICS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv11-20020a056214240b00b004c704932562si4275036qvb.74.2023.01.09.00.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 00:46:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YgSNwICS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEnil-0005f3-Qe; Mon, 09 Jan 2023 03:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnil-0005eq-9q
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 03:41:31 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnij-0001iF-NP
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 03:41:31 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso6532282wmb.1
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 00:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTqoT3kxPcjorZ3mugLt6fynVNQ3ed1VmFMT7P6iTBY=;
 b=YgSNwICSTdBN20I0dQ+7Tcgu3fsIsNfGWs9BHqt5lyQ1ieWs23OzjVVDtIbh7od5Uq
 vU3/iqdr6GLDXuo7UwGD5oTZobSr+a3VwqcXpLNjIj4y1iypO9dUHn86gmbyPtyTmmMh
 ue3XZGBqbY/ct6j9iLdhzyERR5kVQ8Y2fCOUTDJ+B7WFNV2761P7BBx5M23t3nlciafi
 qUmrAEtP/CXRlLwjaCrTtDM5wyfHZzWRsz5xrmALIzPe59pGgzN6t2n5l+j0DQqiyGAo
 Yi1lk+UPa0+16MWa77rOK3IvVFFFYpXTSfR8pxEWrma1Rlo1+9JwRLrYV6Og67v6/G65
 lkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTqoT3kxPcjorZ3mugLt6fynVNQ3ed1VmFMT7P6iTBY=;
 b=IuuCjR+XycOM2CIrlRs2vorM5ThHvMKEwe0hT8hxFfKxXruB7E+HK69h91KyZjDapm
 ACZoktlZnrVoAfcD9NEZUlVkGjzUnsj0vI132wWGUfc/KfYkOPwtrmcOFMg/cIkujoYP
 b0p6T1/h+VBWRDHaR4jpinn/BXPbMUkHWQw+BxTw175uAMXHnt3TKs7dBJpEQ0QrOQhN
 Gjj0t4kLXARrNZhxMC1WDH5TGjNiQjnmjZOLIQkkjStVu0y4hhyAzt3bynsHe3OK6et+
 h+KqbBhPg8jMgiTAQPMFz1j2yhjAipWnujMyzHYLGIDXUVzUuLPuTs/XqPZpG33R87nu
 aa5A==
X-Gm-Message-State: AFqh2koKQ8LLhJbKTDrLX82y0a3DdO47eKnAXilN9OP/jhPZGeMshu91
 9gLIZ4C9t25c+/eqyYDA2nUXR8O2X9+U6Plz
X-Received: by 2002:a05:600c:21d9:b0:3d1:d396:1adc with SMTP id
 x25-20020a05600c21d900b003d1d3961adcmr55848029wmj.14.1673253688366; 
 Mon, 09 Jan 2023 00:41:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b003b4cba4ef71sm17107033wmb.41.2023.01.09.00.41.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 00:41:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public header
Date: Mon,  9 Jan 2023 09:41:17 +0100
Message-Id: <20230109084121.72138-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109084121.72138-1-philmd@linaro.org>
References: <20230109084121.72138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oFj4IRilJNYs

Define TYPE_GPIO_I2C in the public "hw/i2c/bitbang_i2c.h"
header and use it in hw/arm/musicpal.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

