Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2592833ejb;
        Wed, 25 Oct 2023 02:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFwrgzYWycGBldF/shoer4eNdwbKyEdEavTdmZc3uEKakPy3uogLfG+CKkghg2/YncCNo3
X-Received: by 2002:a05:6214:2121:b0:66d:35b8:e661 with SMTP id r1-20020a056214212100b0066d35b8e661mr17725356qvc.45.1698224469723;
        Wed, 25 Oct 2023 02:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698224469; cv=none;
        d=google.com; s=arc-20160816;
        b=YZwk6JVt07Hp0aTI80KfxOdmvo0X2KAEmMNq0M+4vNlIwtizmsxxAcM6q9fNddxnbE
         EnPdzSgQp9TmaMttCSdYxmGf3uBo5MHZUV/wONIwFHZI/lwkEZWhR9NG4ordgMmPqHbD
         yrBx8ZIsmpZTgWBLf+ll0GrgtVhKhZEiyK29ZU6jPAwIGZT+mUSYZ97YzTAA5WTZJlrI
         csUs0fBjbnHUaaa67AZbpu7HaUNg6usjWgq1DzannkfL0E7b7RDTWtVc7ewyTmXYsT6b
         iHIODERTd439xTA03jF/27C6fUymrwsbFShVMi51R+J2r4EHOK3VA4PLoqpTZVT1tG7+
         kBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=6ee1tjgAO5bZL8ubjUIW3dwEEQw8l8xxc3gDyUJEZoQ=;
        fh=2AKgK1B3EYiX6882ovZW+CwIStVbar5zReCRX1lYnfY=;
        b=eVu6WjFLasuB9itMIMBP6ltKwag6OJ1cVTFbFDu2vIYPXTk2uOXF7MaGM6NdR3enta
         mCUufV0xT20DuutlXqKg5x2XicA3qlqZ/GCBie6XfnhVkKNhqbkQOoSlpiuzf6x6LnI8
         eMi5vDuBg7qUUErCIcQ87vouvlyZTZtztzJqqqFRsEHCCMszStwWcGsuDCyS1qLeaySZ
         KtFUJOZxzbf5B/COiPzrwlxtL89KnACCCZ8mdxYSS99AHtS1QbrCZ46E0kOkIfwQ+NkF
         ZcEvJntnmKxBQQDMGcjE20a4d68762Hvgoq3GxLG51KAQWH2f7PGuU15eOq1e9mgiqzN
         Fiyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pg2-20020a0562144a0200b0065afa9743aesi8496461qvb.460.2023.10.25.02.01.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 02:01:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvZk0-00088m-AP; Wed, 25 Oct 2023 04:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZjy-00087Z-43; Wed, 25 Oct 2023 04:59:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZjk-0004R1-Iz; Wed, 25 Oct 2023 04:59:49 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFjY20g4zz4wp0;
 Wed, 25 Oct 2023 19:59:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFjY03hVhz4wnw;
 Wed, 25 Oct 2023 19:59:32 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 03/12] hw/arm/aspeed: Rename aspeed_soc_init() as AST2400/2500
 specific
Date: Wed, 25 Oct 2023 10:59:12 +0200
Message-ID: <20231025085921.733686-4-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025085921.733686-1-clg@kaod.org>
References: <20231025085921.733686-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: fhMRhL0JN7z3

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index f6c2ead4ace0..bb377e9e6e32 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -140,7 +140,7 @@ static qemu_irq aspeed_soc_ast2400_get_irq(AspeedSoCState *s, int dev)
     return qdev_get_gpio_in(DEVICE(&s->vic), sc->irqmap[dev]);
 }
 
-static void aspeed_soc_init(Object *obj)
+static void aspeed_ast2400_soc_init(Object *obj)
 {
     AspeedSoCState *s = ASPEED_SOC(obj);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
@@ -546,7 +546,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
 static const TypeInfo aspeed_soc_ast2400_type_info = {
     .name           = "ast2400-a1",
     .parent         = TYPE_ASPEED_SOC,
-    .instance_init  = aspeed_soc_init,
+    .instance_init  = aspeed_ast2400_soc_init,
     .instance_size  = sizeof(AspeedSoCState),
     .class_init     = aspeed_soc_ast2400_class_init,
 };
@@ -573,7 +573,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
 static const TypeInfo aspeed_soc_ast2500_type_info = {
     .name           = "ast2500-a1",
     .parent         = TYPE_ASPEED_SOC,
-    .instance_init  = aspeed_soc_init,
+    .instance_init  = aspeed_ast2400_soc_init,
     .instance_size  = sizeof(AspeedSoCState),
     .class_init     = aspeed_soc_ast2500_class_init,
 };
-- 
2.41.0

