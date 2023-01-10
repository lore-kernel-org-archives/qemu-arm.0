Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3030095ejc;
        Tue, 10 Jan 2023 01:40:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuSuTuqUFh8iewzHYrFJBTBbfREA50/VQhmFXIPf/dPOwuMtW80dA0l8am5i5fF/YIvMhIU
X-Received: by 2002:a05:6214:2c06:b0:4e3:6a82:82ba with SMTP id lc6-20020a0562142c0600b004e36a8282bamr109048113qvb.33.1673343632582;
        Tue, 10 Jan 2023 01:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673343632; cv=none;
        d=google.com; s=arc-20160816;
        b=VgE0tXxRseip0jeKxFQF1dySyFnhjUmq+Xd4iy0JAlVQfc/CVBEaetjB4VXeq5btne
         O0B1lilfk7b8Ut0UTwI3VAgqwI2yZjaTxGrXRLrNUutxpGpZDr9fRcqGgsZruY0KBQIy
         D9tmBTGOEhYM5ecgV9abIGLQPkvjUD9D6xkQHMMPyksOlV4HpbWQd0ogb//cocKZYwoO
         TE78TljyGVxAzEvk8cBZvzAu8438RJypFQeth2Y5jEeza7e6WwCw3z2Mg36Q35GnlTlS
         Cf9+65j3DQOqfkLxgXgiCw/s5SAen9GozLnP3I91eunv9GwVKkeo752Eu0IsuvnSeLEU
         86Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rqfudLgvWami2CjesLmeGlPtQtwdVZ+Jj9zyr+J7ES0=;
        b=Cb3+hRrpoPzsSdaQ4dIZJihaBLVFORZo5KIM2bukif3O/yth0T+IAQQbDVD1nD10ae
         lyQZsP3OAW13xdfs3+ZTSjC0rU5OowtJUraNmXEnsETmy8pDq5z6Zz8xLlid5Phuj8Yt
         cllF22n2a6/BB/KzFLjyt1e89ieOlXxLPyS6vVq9kdZ5gieG/vG8IKUVe3+RLtC+uIMt
         j8nj2l8xbdRUBlLwEJErc9LNqyrT2ToKu9a2QWia9kRFn98Kbb0VzjXX5+iV5gqcZJNS
         6rvy4y2Bmkf+lmjZ0F37gFr1PEfQ5uF8+YKrXzxVEQfzvW5mbhIOzqxUrwXbwzISufHc
         NNZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l3/4IQsQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05621421ed00b00531e43c0d34si5741931qvj.41.2023.01.10.01.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jan 2023 01:40:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l3/4IQsQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFA0w-0006bq-Tf; Tue, 10 Jan 2023 03:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA0v-0006ay-Cm
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:29:45 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA0q-0006Hi-Hb
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:29:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so11173653wms.0
 for <qemu-arm@nongnu.org>; Tue, 10 Jan 2023 00:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqfudLgvWami2CjesLmeGlPtQtwdVZ+Jj9zyr+J7ES0=;
 b=l3/4IQsQcHjdJ8gVMLyumejQnIBIzZNC4o+TDUN2meomeWY//80u0fa+uJLXb3h0Ou
 cEiptMY1EKC4c5ZWx5jRP/2ng4NRdoCbdSCxlp5hV+pEx0KGwZYW5CVfshRKupEN+pFA
 ClFQh9c209MxqQ6KqVBTB5lJXaa89scw2GlJACbx80E7nQPbrpldImBjcs4D3ONNMb3T
 WJP/GC3chwTWjyl+L0raTUvb0qnConk7L8HXQut47mw0glneKfEcLCD3BU9m8r7pAlED
 YPHtf50bL8fEo2Bn4d8ISTxZld37fmSrwInhS6+XdKXZNN/DfQSGen6RoDlFIv7ptyPB
 SVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqfudLgvWami2CjesLmeGlPtQtwdVZ+Jj9zyr+J7ES0=;
 b=BVyS6NLZcSfiqhGrM69Oj7jZBsBFAGzIKD37AsLe40hj6Dw8OtraFluJHqAOcScPyW
 zlsdQMJp1SAAbw1t6uRcMwDdIoPYKZAq0CLwmNXTk7H5xUi6nVZSowNDShVaPAuKpFWQ
 YaDy0roSdilHMZzyFFgiHHtbmdGxFxUbCs9Ytl6rSecXaahPVUgBe9zJaXs+S2nHABsI
 bapmsonM4buMtCnQYOkj6KlQXg2K7dLrgn2ZlcbukipsZEl9sZsLfDPcn0P8X5rCS72s
 EyYyNANOOW1YgFC+OAY+7a2LuqyVGaXogvM+pelq4gcu/Hi17IdwhgStyX7xoooHrbHf
 GzXw==
X-Gm-Message-State: AFqh2kq1hPyyQNs3nlrKecZOHjX0Jy/SaYMC5j2HnSK0olEaBgBhxw9q
 KS9uA3qaZyCCEgBUd5hJTMfDtg==
X-Received: by 2002:a05:600c:ac8:b0:3d7:7cea:b410 with SMTP id
 c8-20020a05600c0ac800b003d77ceab410mr48540659wmr.33.1673339379237; 
 Tue, 10 Jan 2023 00:29:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg23-20020a05600c3c9700b003d1de805de5sm15998885wmb.16.2023.01.10.00.29.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:29:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/5] hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public
 header
Date: Tue, 10 Jan 2023 09:29:28 +0100
Message-Id: <20230110082932.24386-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082932.24386-1-philmd@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: PAKyK9BXELHl

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

