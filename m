Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2592022ejb;
        Wed, 25 Oct 2023 02:00:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjS3M1XysNBUIrp6NGlFD/XdK7t/lgQT6iQC1zGRr3k5sfvMj1vqwzF4CZ6/PAk1CrXb5T
X-Received: by 2002:a0c:f0d0:0:b0:66d:ab53:1508 with SMTP id d16-20020a0cf0d0000000b0066dab531508mr9703168qvl.51.1698224402568;
        Wed, 25 Oct 2023 02:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698224402; cv=none;
        d=google.com; s=arc-20160816;
        b=e1Yes8jfa8Q5SFBzFL2ZEI0q1OM+urMH1Mh/Z8LAPpTyl5TSfnGaGoELf5LPYuvX4J
         hQUDPI4SqSrDJYLbPvenTZM8ol9OpExNUIBJU9KeJJeEqaI0Nx4TwNc57w59/JrlFB4P
         oOcWIyL0x5sykKksrzvCpkO2mHQt7Hmlmr52bFEDS8NK6aus4Tb4OKn4jcS77qW0TuNI
         1yzfLVm46BsFGktpqeyYTTHknSGjsgxvEHEL4CCczRJihYewoR8fu++l8TONm4Rk0J9/
         azRMhGb5zrDBD5lKMHcm9GScQyPFGhPc7hgoS2XN2g97fruLPVW9NnmV+PieHL7rjWpO
         ugrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=/UijNn3QNRsRs7xnnksiIaf2wzp2CteSl15ozH5i2Mc=;
        fh=2AKgK1B3EYiX6882ovZW+CwIStVbar5zReCRX1lYnfY=;
        b=vcGJafBEm71OUGd5nikUGICcGQHrJEZ+r3U/nWk2dcNIOCOSWjcQqZYUBEXGe7MemK
         6iDpBr+L11RWxQZdOb6lfv81Em9fOMh24ZYdFgSvOAoJRVXjNeQtZg1kjkixJQNNUbAc
         uXpdPIE7icXldtoxehv2ji22cBGIX2Yvo7xR6c0qA5CanzhHaj6A8VXK4B2YgKQvXK7U
         v2DwUCKU6HVRe1dSYiV8QPvbqskS12htNi5BHkfg/UJP1Uk0xkhhrdFS/iBpdMifNV6F
         D+mXBV9cCv4QAZFng75ouJ0xaBG2YXZ6U9wXs0dPd5c0GHbH3QP9Xhoa23R6yA2uoMFr
         dbAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ml14-20020a056214584e00b0065af0cce08esi8191995qvb.156.2023.10.25.02.00.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 02:00:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvZjw-00086Z-Jt; Wed, 25 Oct 2023 04:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZju-000857-13; Wed, 25 Oct 2023 04:59:46 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZjr-0004OR-9A; Wed, 25 Oct 2023 04:59:44 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFjYB1n71z4wcM;
 Wed, 25 Oct 2023 19:59:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFjY856wLz4wnw;
 Wed, 25 Oct 2023 19:59:40 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/12] hw/arm/aspeed: Introduce TYPE_ASPEED2600_SOC
Date: Wed, 25 Oct 2023 10:59:16 +0200
Message-ID: <20231025085921.733686-8-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025085921.733686-1-clg@kaod.org>
References: <20231025085921.733686-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: hHjQ7vLJYG3M

From: Philippe Mathieu-Daudé <philmd@linaro.org>

TYPE_ASPEED2600_SOC inherits from TYPE_ASPEED_SOC.
In few commits we'll add more fields, but to keep
review process simple, don't add any yet.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  7 +++++++
 hw/arm/aspeed_ast2600.c     | 26 +++++++++++++-------------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index dcb43a4ecd7f..103b1598f64a 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -101,6 +101,13 @@ struct AspeedSoCState {
 #define TYPE_ASPEED_SOC "aspeed-soc"
 OBJECT_DECLARE_TYPE(AspeedSoCState, AspeedSoCClass, ASPEED_SOC)
 
+struct Aspeed2600SoCState {
+    AspeedSoCState parent;
+};
+
+#define TYPE_ASPEED2600_SOC "aspeed2600-soc"
+OBJECT_DECLARE_SIMPLE_TYPE(Aspeed2600SoCState, ASPEED2600_SOC)
+
 struct Aspeed10x0SoCState {
     AspeedSoCState parent;
 };
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e122e1c32d42..1ee460e56c79 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -646,18 +646,18 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->get_irq      = aspeed_soc_ast2600_get_irq;
 }
 
-static const TypeInfo aspeed_soc_ast2600_type_info = {
-    .name           = "ast2600-a3",
-    .parent         = TYPE_ASPEED_SOC,
-    .instance_size  = sizeof(AspeedSoCState),
-    .instance_init  = aspeed_soc_ast2600_init,
-    .class_init     = aspeed_soc_ast2600_class_init,
-    .class_size     = sizeof(AspeedSoCClass),
+static const TypeInfo aspeed_soc_ast2600_types[] = {
+    {
+        .name           = TYPE_ASPEED2600_SOC,
+        .parent         = TYPE_ASPEED_SOC,
+        .instance_size  = sizeof(Aspeed2600SoCState),
+        .abstract       = true,
+    }, {
+        .name           = "ast2600-a3",
+        .parent         = TYPE_ASPEED2600_SOC,
+        .instance_init  = aspeed_soc_ast2600_init,
+        .class_init     = aspeed_soc_ast2600_class_init,
+    },
 };
 
-static void aspeed_soc_register_types(void)
-{
-    type_register_static(&aspeed_soc_ast2600_type_info);
-};
-
-type_init(aspeed_soc_register_types)
+DEFINE_TYPES(aspeed_soc_ast2600_types)
-- 
2.41.0

