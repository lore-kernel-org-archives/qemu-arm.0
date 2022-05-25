Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1030171lfh;
        Wed, 25 May 2022 09:17:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE0atLckYSBg6VuK+Z482T2F+/0N0/Jdd99S9/vbbgro9ITJBtAAWEiZNfPPmOoAtSVDKU
X-Received: by 2002:ac8:7d46:0:b0:2f3:dd89:5557 with SMTP id h6-20020ac87d46000000b002f3dd895557mr25207589qtb.567.1653495458592;
        Wed, 25 May 2022 09:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495458; cv=none;
        d=google.com; s=arc-20160816;
        b=w+eV6zbIfoCW/FwOcZMeu7dqw50zu4vGiHqwpxE9fSONre8sROmB4vqVBmPXd256jw
         eCrLF9UN1d9WGM3Gaz0jMXAsfiIuYeojrwcGG54rIAWZ4s5aFXd+I1vEVOCCSVFCG+1O
         uB1qjDl4c8YKh+Yx1wzQTU7mu/cWwrgI5gCrpMM8oSSToHDPkVYN8A+IDcQ0lU6I9a4d
         Ld55WqHFcaRfSjY9Sm9YapAI1Ad+ZMwL1dZGF/htIvYiukXxaA+cdjIpMl23GzQDj5KI
         LS1wTSS0GrIdhIjSsbLUJpQwuNqcvGKFiPOd6zgBf93Bm0rA9CefqzkYyI1YSSikksVP
         ix9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=qeKlC+LXZjGCaEsa+j0E9ReK4Vf+BQMg2OfTEySLRS4=;
        b=Es6A5rocr+FIdpeQAwLpdJwKd7Du+LsKp8Vy4KNyxrgNAsygmbJsZiBqYX0wm/WkNg
         wIUoWTYVVQQoKhSASeLsSZuW0XtMtpk+oLsmu9GapEll2oQY13d6Z8PoxmCoeorwdWpT
         ZI22qodN+QfnCONXu+4br54iokvRg/wQFVIm0JfMJNWwaJPwFmVV7Yx6EwTDZoHAG3wF
         PxtuB533brXbbMxZIc2nIVhsMa9ydi9olZsUgStMKyKBm6KZgBgRiCDuEjrV+WWC1Pj6
         2Pp/d91osn1ALtRCmayG+DYg52NIj6WbWAtSbmFLf0qGpUgOZBFw6GodzOHs5U5Fw2ln
         GOhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a05622a030200b002f92d429b6esi1733402qtw.217.2022.05.25.09.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttha-0002BE-2j
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSV-00074a-Lr; Wed, 25 May 2022 12:02:07 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:48649
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSR-00049O-L0; Wed, 25 May 2022 12:02:03 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRR44pYz4xDK;
 Thu, 26 May 2022 02:01:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRP3qNdz4xXj;
 Thu, 26 May 2022 02:01:53 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>
Subject: [PULL 05/15] aspeed: Introduce a get_irq AspeedSoCClass method
Date: Wed, 25 May 2022 18:01:26 +0200
Message-Id: <20220525160136.556277-6-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: JxV5kBkrIpth

and make routine aspeed_soc_get_irq() common to all SoCs. This will be
useful to share code.

Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Peter Delevoryas <pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220516055620.2380197-1-clg@kaod.org>
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
2.35.3

