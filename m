Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1026215ejo;
        Tue, 12 Dec 2023 08:31:59 -0800 (PST)
X-Received: by 2002:a17:906:81d4:b0:a1b:de0a:8de2 with SMTP id e20-20020a17090681d400b00a1bde0a8de2mr3480913ejx.64.1702398719330;
        Tue, 12 Dec 2023 08:31:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398719; cv=none;
        d=google.com; s=arc-20160816;
        b=0k1FmUZEsv4qk3IDxQH0N6VWoO6r4QRxGniTlmLz23KR6Q4hh13se3XEJyhFwucdzU
         jz/0ws4G67CV/GIwsHJHFnuokd4wE8B3XgDn7E9cR2n0BxECMS5G5TnT3foKiYmP+mWQ
         Zqi3SdM8Jlwr8ICbf299OS8zIcnJ4eILhtmhmDlf/RJ0nFws7ocnQbJIdJNhQeaGwqng
         1zYGgoWqbO6LePKXcotgGAPobRRA12gjK0t6Bwe5sUsR4LYSWNrIkWX11ZdI/WKxrk9j
         T9+As7B9Slti3JMilNxWtDRDbenO6E/VLAiOSMGRCCItVZlZ5H+mSW/cbqcZH9n2BPLK
         tNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7Pqc0Rrgak/xeltLwYcUfzRxHhc0ewXusv1vEQMSS3M=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=tD2YoLlyqbkONRqYm5dZIyROOy12+wtV1fVhuH8j2SwGTHIYdSJoJqvUAgsEMuMLE7
         FDkGdafMHd7mP5VXcGpyyskVFWLgBdVNhlnCJzsnAicktIUeAwi8XaXCW4kfZQ0OnUKK
         GtTz5NTqh+gKT/9DfwldtxFHSYFk5whbgJA7kf0hcs2/a8MJxYA8zXfMA8HcvEfL7LfP
         OmbE38siVp2UxYW8BewBEzSBoCHOQA+tyPztRJ7N+WTHcd+MZKJP9x3y2yflqMRGe0CA
         W4DwGog4eQTqg/bZkx8sBEyz4cD8AmdD+PU1Td/gQzXgSXDqaZyCaEW6wp+M9PV1ZyR0
         vVOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DjXCYjGT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hq31-20020a1709073f1f00b00a1f6ec8f0c0sor2302852ejc.9.2023.12.12.08.31.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:31:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DjXCYjGT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398719; x=1703003519; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Pqc0Rrgak/xeltLwYcUfzRxHhc0ewXusv1vEQMSS3M=;
        b=DjXCYjGTvIru+9OU9USGQ3kHXwJp5MbIAWda9k0cdmr7HvRgpDtsgwes4duNb9gkcQ
         6KJS0BHY47P0fHNvhBpHVXd5P/2o4MumYttOx8NhPgELppJPJOCgwPUONWWXVd36HBFx
         OssCdHS685CmWD4Q3XRTjZrKa6L7vq5CmoY3SrOpWXck3CAqIbc1J7o9uqcPHb98UDzN
         G5o48Ii1ABaN0HOIykATJ5AODgb11d8SYwjewJeBoVwY6fZSxNm2pVJpXbkqHxWt48jQ
         wjAxDldOXJsKkUfm1kYM1bevc+1ISwdRklB6B1+hLeJmtsaNIHstGBOhslgRDcuiFON4
         BMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398719; x=1703003519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Pqc0Rrgak/xeltLwYcUfzRxHhc0ewXusv1vEQMSS3M=;
        b=qEP0efW2FOzaLlq/WfL/Bu/j09Jk/i8tfvBo/juI5L0+nHp4VoLWM871Wdg3QFzuGN
         GkOmf0IWHZ5aPMwvzVw/91MgG3+0+2xhNEeat709909Kc8/E/qwc1JTTNpdbD2G0Vob2
         PBAhk0JPsB9OFaZV14akMdBIVilQ1OFHjw+U52zv32KTsxT4/na03gJItOWYbVd6ujRX
         M1Gd3ZcHL8m5TMEq3kP/uLeZDFZ/uZhs5s/O0O7H8o7yFobheepda2l0Yapa5TYUDgKm
         GpTT9Av+or8IuWYBWsac6xk6ukkx3jdzRWA9Qvtu+e8YwwxVrVJmFoPliOzxVLfPWjd/
         sNWg==
X-Gm-Message-State: AOJu0YzSibxTWLDH0NVmbY/4YO+0r/feSTlWOWDk4G5B9RPYMSAt+Piy
	UiEJF/kBpa0sdVe8WfqucE3YPefO
X-Google-Smtp-Source: AGHT+IGAoWsuLGoO9Ag1O8wpNAZ/MH7VoxAIftcwIH/sievxL+UsNifhl17EdIKQcgiBfNJqSqy87A==
X-Received: by 2002:a17:907:7156:b0:a1e:36e0:1c79 with SMTP id zs22-20020a170907715600b00a1e36e01c79mr2869141ejb.89.1702398719059;
        Tue, 12 Dec 2023 08:31:59 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906564a00b009fea232316bsm6454240ejr.193.2023.12.12.08.31.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:31:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 19/33] hw/cpu/arm: Introduce TYPE_A7MPCORE_PRIV for Cortex-A7 MPCore
Date: Tue, 12 Dec 2023 17:29:19 +0100
Message-ID: <20231212162935.42910-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yICUuMyLn399

For QEMU modelling, the only difference between the A15 and A7
MPCore is the latter can have up to 480 SPIs.

In particular, since commit b151de69f6 ("hw/arm: ast2600: Set
AST2600_MAX_IRQ to value from datasheet") the AST2600 machine
initializes its GIC with 256 SPIs, which is more than the 224
maximum of the A15.

Since the A7 was not available, few boards were using the A15.
Replace them by a A7 MPCore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
The comment in a7mp_priv_class_init() is a bit off.
---
 include/hw/cpu/cortex_mpcore.h |  2 ++
 hw/arm/aspeed_ast2600.c        |  3 +--
 hw/arm/fsl-imx6ul.c            |  3 +--
 hw/arm/fsl-imx7.c              |  3 +--
 hw/cpu/a15mpcore.c             | 30 ++++++++++++++++++++++++++++++
 5 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/include/hw/cpu/cortex_mpcore.h b/include/hw/cpu/cortex_mpcore.h
index 7822d5cbc4..4e1aa9f7f7 100644
--- a/include/hw/cpu/cortex_mpcore.h
+++ b/include/hw/cpu/cortex_mpcore.h
@@ -118,4 +118,6 @@ struct A9MPPrivState {
 
 #define TYPE_A15MPCORE_PRIV "a15mpcore_priv"
 
+#define TYPE_A7MPCORE_PRIV "a7mpcore_priv"
+
 #endif
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index ca788e1cf0..88e2a23514 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -171,8 +171,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
     object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
                               "hw-prot-key");
 
-    object_initialize_child(obj, "a7mpcore", &a->a7mpcore,
-                            TYPE_A15MPCORE_PRIV);
+    object_initialize_child(obj, "a7mpcore", &a->a7mpcore, TYPE_A7MPCORE_PRIV);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_ASPEED_RTC);
 
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 93908811c5..6e4343efaa 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -40,8 +40,7 @@ static void fsl_imx6ul_init(Object *obj)
     /*
      * A7MPCORE
      */
-    object_initialize_child(obj, "a7mpcore", &s->a7mpcore,
-                            TYPE_A15MPCORE_PRIV);
+    object_initialize_child(obj, "a7mpcore", &s->a7mpcore, TYPE_A7MPCORE_PRIV);
 
     /*
      * CCM
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 8a3e9933c4..bd9266b8b5 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -48,8 +48,7 @@ static void fsl_imx7_init(Object *obj)
     /*
      * A7MPCORE
      */
-    object_initialize_child(obj, "a7mpcore", &s->a7mpcore,
-                            TYPE_A15MPCORE_PRIV);
+    object_initialize_child(obj, "a7mpcore", &s->a7mpcore, TYPE_A7MPCORE_PRIV);
 
     /*
      * GPIOs
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 87b0786781..5f28a97adb 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -121,6 +121,30 @@ static void a15mp_priv_class_init(ObjectClass *klass, void *data)
     /* We currently have no saveable state */
 }
 
+static void a7mp_priv_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    CortexMPPrivClass *cc = CORTEX_MPCORE_PRIV_CLASS(klass);
+
+    cc->container_size = 0x8000;
+
+    cc->gic_class_name = gic_class_name();
+    cc->gic_revision = 2;
+    /*
+     * The Cortex-A7MP may have anything from 0 to 480 external interrupt
+     * IRQ lines (with another 32 internal). We default to 128+32, which
+     * is the number provided by the Cortex-A15MP test chip in the
+     * Versatile Express A15 development board.
+     * Other boards may differ and should set this property appropriately.
+     */
+    cc->gic_spi_default = 160;
+    cc->gic_spi_max = 480;
+
+    device_class_set_parent_realize(dc, a15mp_priv_realize,
+                                    &cc->parent_realize);
+    /* We currently have no saveable state */
+}
+
 static const TypeInfo a15mp_types[] = {
     {
         .name           = TYPE_A15MPCORE_PRIV,
@@ -128,6 +152,12 @@ static const TypeInfo a15mp_types[] = {
         .instance_size  = sizeof(CortexMPPrivState),
         .class_init     = a15mp_priv_class_init,
     },
+    {
+        .name           = TYPE_A7MPCORE_PRIV,
+        .parent         = TYPE_CORTEX_MPCORE_PRIV,
+        .instance_size  = sizeof(CortexMPPrivState),
+        .class_init     = a7mp_priv_class_init,
+    },
 };
 
 DEFINE_TYPES(a15mp_types)
-- 
2.41.0
