Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1781841lfj;
        Sun, 15 May 2022 22:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp+dY53VuKs2yAbdBdP0Ps406lzEA3mZi6F1uHPubdD4kFEFWZzFKHHzXsFyyec2aO4u1q
X-Received: by 2002:a05:622a:30e:b0:2f3:cfab:77a4 with SMTP id q14-20020a05622a030e00b002f3cfab77a4mr13823627qtw.326.1652680647748;
        Sun, 15 May 2022 22:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652680647; cv=none;
        d=google.com; s=arc-20160816;
        b=K3QcpNu2TPFnkLtIAPSBfhH5Lcx4flzlAez90DH04aRziqliqjMZzp2WBhWegzip1s
         WtjGe5Tbz97Ddj24rJkibo0WjVmBT39zYs0+gLTdwNBseFl2NufZiqJzbsVAcSH8UOAe
         wUy2SI3HdalkJKSyCVt0ngph08dA7jOJV9GfbowJLrH235A1pJ4ub5q96UgWvNUW74ph
         S4rTnecjXBGViVP2x8rNCe0GlVSGHzCv4u9OUZbybhXPFWn9vtD81fUqx3rKDWd5sPwh
         F1/x9HMy4zAfLnpzm3ylEfxB2N8u5FsKo51aUrnSzeAmjbUfrYrdw5FRp/O+vBV8UwWQ
         jjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=yIQb785NXVZYvL6Vlio++YSYvE1aYL+BGADNQxbwQZE=;
        b=qsDo6ZpfZ798s5/wVKTpbr2AelOc+J0XbCs68DdLl7tJcsoynW7L4hx8RIslNMQPd2
         RoY2TOOcPmDUpyPBGuoBw5aWDJu9cxmNdfyRVyK2TIUyqX/hLviKFQ9tb08CLthOkZ01
         HUmIpMiorBmv09n8wFsS2Oy6OzINQ+k3bfQWS4BdfKl4OHTSu6If40G29JWT4aOzuR+R
         ocIOvTAS5mMZfWUJ9xfu4y39CBuJKFe6p087QQlFEDDHvmNdpiDYyLuZ1L00HTUjol/n
         OOHRrZ8fIi90swI62bYmxtmozhA41qM/G11MYTl4T+J7cbvKX37vyAJYfx+YiEPrn7eM
         SUQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc30-20020a056214411e00b00441097cc3dbsi5797777qvb.149.2022.05.15.22.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 May 2022 22:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqTjT-0006Vz-6U
	for alex.bennee@linaro.org; Mon, 16 May 2022 01:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HzNt=VY=kaod.org=clg@ozlabs.org>)
 id 1nqTip-00068w-JS; Mon, 16 May 2022 01:56:48 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HzNt=VY=kaod.org=clg@ozlabs.org>)
 id 1nqTim-0002z9-Ic; Mon, 16 May 2022 01:56:47 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L1pR35dfhz4xZ0;
 Mon, 16 May 2022 15:56:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1pQx3PWcz4xLR;
 Mon, 16 May 2022 15:56:25 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v2] aspeed: Introduce a get_irq AspeedSoCClass method
Date: Mon, 16 May 2022 07:56:20 +0200
Message-Id: <20220516055620.2380197-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=HzNt=VY=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: YXKXkB3j5mkd

and make routine aspeed_soc_get_irq() common to all SoCs. This will be
useful to share code.

Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Peter Delevoryas <pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast10x0.c     |  5 +++--
 hw/arm/aspeed_ast2600.c     |  5 +++--
 hw/arm/aspeed_soc.c         | 13 ++++++++++---
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e13af374b923..3789f38603e5 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -94,6 +94,7 @@ struct AspeedSoCClass {
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
+    qemu_irq (*get_irq)(AspeedSoCState *s, int dev);
 };
 
 
@@ -153,4 +154,6 @@ enum {
     ASPEED_DEV_I3C,
 };
 
+qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
+
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 427154928254..9ae9efaac144 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -61,11 +61,11 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
 };
 
-static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
+static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
 
-    return qdev_get_gpio_in(DEVICE(&s->armv7m), sc->irqmap[ctrl]);
+    return qdev_get_gpio_in(DEVICE(&s->armv7m), sc->irqmap[dev]);
 }
 
 static void aspeed_soc_ast1030_init(Object *obj)
@@ -280,6 +280,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->irqmap = aspeed_soc_ast1030_irqmap;
     sc->memmap = aspeed_soc_ast1030_memmap;
     sc->num_cpus = 1;
+    sc->get_irq = aspeed_soc_ast1030_get_irq;
 }
 
 static const TypeInfo aspeed_soc_ast1030_type_info = {
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index eedda7badc37..4161a0cc4bbe 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -114,11 +114,11 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
 };
 
-static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
+static qemu_irq aspeed_soc_ast2600_get_irq(AspeedSoCState *s, int dev)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
 
-    return qdev_get_gpio_in(DEVICE(&s->a7mpcore), sc->irqmap[ctrl]);
+    return qdev_get_gpio_in(DEVICE(&s->a7mpcore), sc->irqmap[dev]);
 }
 
 static void aspeed_soc_ast2600_init(Object *obj)
@@ -572,6 +572,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->irqmap       = aspeed_soc_ast2600_irqmap;
     sc->memmap       = aspeed_soc_ast2600_memmap;
     sc->num_cpus     = 2;
+    sc->get_irq      = aspeed_soc_ast2600_get_irq;
 }
 
 static const TypeInfo aspeed_soc_ast2600_type_info = {
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 58714cb2a01d..c339b5c74de5 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -121,11 +121,11 @@ static const int aspeed_soc_ast2400_irqmap[] = {
 
 #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
 
-static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
+static qemu_irq aspeed_soc_ast2400_get_irq(AspeedSoCState *s, int dev)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
 
-    return qdev_get_gpio_in(DEVICE(&s->vic), sc->irqmap[ctrl]);
+    return qdev_get_gpio_in(DEVICE(&s->vic), sc->irqmap[dev]);
 }
 
 static void aspeed_soc_init(Object *obj)
@@ -487,6 +487,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
     sc->irqmap       = aspeed_soc_ast2400_irqmap;
     sc->memmap       = aspeed_soc_ast2400_memmap;
     sc->num_cpus     = 1;
+    sc->get_irq      = aspeed_soc_ast2400_get_irq;
 }
 
 static const TypeInfo aspeed_soc_ast2400_type_info = {
@@ -512,6 +513,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
     sc->irqmap       = aspeed_soc_ast2500_irqmap;
     sc->memmap       = aspeed_soc_ast2500_memmap;
     sc->num_cpus     = 1;
+    sc->get_irq      = aspeed_soc_ast2400_get_irq;
 }
 
 static const TypeInfo aspeed_soc_ast2500_type_info = {
@@ -528,4 +530,9 @@ static void aspeed_soc_register_types(void)
     type_register_static(&aspeed_soc_ast2500_type_info);
 };
 
-type_init(aspeed_soc_register_types)
+type_init(aspeed_soc_register_types);
+
+qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
+{
+    return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
+}
-- 
2.35.1

