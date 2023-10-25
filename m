Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2593261ejb;
        Wed, 25 Oct 2023 02:01:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAKJiWJzPD+Vn8ACLuJKxN9D1TKPdv+QVkW6jtLLGP4PKk5oRO5NdG76Jx9QnnukK1p/HG
X-Received: by 2002:ad4:5f86:0:b0:66d:5ea8:a7ba with SMTP id jp6-20020ad45f86000000b0066d5ea8a7bamr19270038qvb.1.1698224509898;
        Wed, 25 Oct 2023 02:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698224509; cv=none;
        d=google.com; s=arc-20160816;
        b=bX/afWOpuxhqjQdbDoAL54HpPQ28WnGkPi0rHLdbw/yTD8XqiG5PnBVjjiW2m35gMx
         hA1xnuiDkQMfhPy1sx+ovKum0QkQHmzKz61GyUlFQp06rgs7OnsGCrVJkLrBoL3zaY01
         JcHIDtr4kOEPbHSc2rgWn+wQR1W0iBbr50FiW8MAsCKJDcn9zVsbIteBzda/FLpdY2ck
         J7OQKGBl3fLxp6DaNiwUtJqQW8UP86JhGjNtlZtnRp9W0FpmfxC4O77W/h0Q5xC4Te82
         XT4fyulHCp1JWA3IEN0KILCBgP3P+qbnIoRV2Osf2w2RStGq9KmTD1Ow9C9XbdXgqPYX
         YpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=3SdMLXyWTw5jzHfQKvO8zCVi6XTNfYG56/vJTf4rWdk=;
        fh=2AKgK1B3EYiX6882ovZW+CwIStVbar5zReCRX1lYnfY=;
        b=gVKs0BrklGut7qyn9SbXwJ5jAICOIQ0atNDMthkhSihTY924Cono+b9k2Q0Bkgw2QQ
         NiI9Oro7xML2Mfd8tWzaAQcuoTAhN7yq42OHJP6dhsWgKnwIPIFqiO87sBR3OUaxWXlc
         jKSac7RUDkoS7cJH95JPaAQ28KrqSckJKCMKuWGXJwtd7kM1rZ/byMSv3V7b5zz4rme0
         pn6jZC3vhbG/MPvnrXSzO9xQgk6kpPeOGHWhE9fCSZE9hC9hK9+lhj9kk6MUR3p+Kan4
         9EydnocXFBoXlo/ctw1/6xhMaOaDASYA/FZSVdzOXZ1sqTTDG2/r3NcSJ8EbgVu6qfyp
         mpPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id et19-20020a056214177300b0065b262017ecsi8362339qvb.214.2023.10.25.02.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 02:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvZju-00085x-VD; Wed, 25 Oct 2023 04:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZju-00085a-BE; Wed, 25 Oct 2023 04:59:46 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZjr-0004U0-Iv; Wed, 25 Oct 2023 04:59:46 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFjY81XLMz4wxX;
 Wed, 25 Oct 2023 19:59:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFjY64szdz4wnw;
 Wed, 25 Oct 2023 19:59:38 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 06/12] hw/arm/aspeed: Introduce TYPE_ASPEED10X0_SOC
Date: Wed, 25 Oct 2023 10:59:15 +0200
Message-ID: <20231025085921.733686-7-clg@kaod.org>
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
X-TUID: LwmCSW61AD2u

From: Philippe Mathieu-Daudé <philmd@linaro.org>

TYPE_ASPEED10X0_SOC inherits from TYPE_ASPEED_SOC.
In few commits we'll add more fields, but to keep
review process simple, don't add any yet.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  7 +++++++
 hw/arm/aspeed_ast10x0.c     | 26 +++++++++++++-------------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8adff7007286..dcb43a4ecd7f 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -101,6 +101,13 @@ struct AspeedSoCState {
 #define TYPE_ASPEED_SOC "aspeed-soc"
 OBJECT_DECLARE_TYPE(AspeedSoCState, AspeedSoCClass, ASPEED_SOC)
 
+struct Aspeed10x0SoCState {
+    AspeedSoCState parent;
+};
+
+#define TYPE_ASPEED10X0_SOC "aspeed10x0-soc"
+OBJECT_DECLARE_SIMPLE_TYPE(Aspeed10x0SoCState, ASPEED10X0_SOC)
+
 struct AspeedSoCClass {
     DeviceClass parent_class;
 
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 649b3b13c132..1c15bf422f0e 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -435,18 +435,18 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->get_irq = aspeed_soc_ast1030_get_irq;
 }
 
-static const TypeInfo aspeed_soc_ast1030_type_info = {
-    .name          = "ast1030-a1",
-    .parent        = TYPE_ASPEED_SOC,
-    .instance_size = sizeof(AspeedSoCState),
-    .instance_init = aspeed_soc_ast1030_init,
-    .class_init    = aspeed_soc_ast1030_class_init,
-    .class_size    = sizeof(AspeedSoCClass),
+static const TypeInfo aspeed_soc_ast10x0_types[] = {
+    {
+        .name           = TYPE_ASPEED10X0_SOC,
+        .parent         = TYPE_ASPEED_SOC,
+        .instance_size  = sizeof(Aspeed10x0SoCState),
+        .abstract       = true,
+    }, {
+        .name           = "ast1030-a1",
+        .parent         = TYPE_ASPEED10X0_SOC,
+        .instance_init  = aspeed_soc_ast1030_init,
+        .class_init     = aspeed_soc_ast1030_class_init,
+    },
 };
 
-static void aspeed_soc_register_types(void)
-{
-    type_register_static(&aspeed_soc_ast1030_type_info);
-}
-
-type_init(aspeed_soc_register_types)
+DEFINE_TYPES(aspeed_soc_ast10x0_types)
-- 
2.41.0

