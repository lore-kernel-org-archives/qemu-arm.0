Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp764593ejc;
        Thu, 12 Oct 2023 05:20:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8nQRGrKOtWlO06ompeoIULdVw9jd4HzCxvbSiJSFelIIeMiOQXeUMGOqVQoR2CEhze1hs
X-Received: by 2002:a05:620a:4156:b0:775:c0b9:2a83 with SMTP id k22-20020a05620a415600b00775c0b92a83mr26551064qko.8.1697113237947;
        Thu, 12 Oct 2023 05:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697113237; cv=none;
        d=google.com; s=arc-20160816;
        b=jyicuw153SCBhuNbT80eGdyyty7+/j96cbEimqLUAwhYmyVyUEqB0DqHFDMqKuAbSb
         E9Gb83U7oW/Vr7qFRlfdEo0j7tvXhk3fjW5iZRCiVXMIEk4o70tq2WkLcfXOPgF0PfI9
         +j+cnOZGPXfQVHexoLGLtGW5cdTDHKyHEMe4TazvAQbBYBSyxAWL3t/Y+InvkibrIVvG
         KP5B5o5YailStP1kQisuF2rFW885ETo/OmOGRWHE8Ibpiq7xrHAQ3Fy1ETp5lt/TEmCS
         Y62kTnX9YtquVh7gS8hOK+64VyxAJUSVAnsbxzV8ewBcwa/yMb8uUjyHICqlrVUP/Ldt
         0RNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Fa15t5TAOGLEwbp/XmPMZ/3+NPt1m11OvXKqtHI65yw=;
        fh=uMYo3jOuXUsDthaXCE4/M6n3+voY5rtHQA7Grzg1cYU=;
        b=Y6vRe6eN3vC4GEIESKpKOe1/UbtfLAK3IySNchGOu9+RdYkhiZAy28GYU4iHyLPReH
         geDe0vOpe//XRBisJWMv3fKIzNYCnbsYgH5/xZCIMgKHQQtg/osZ38E37wzEfjuSZd8y
         n7hoKuGP+OskWSPUpUaVDGaTRTIGi1IT4luiiH14Ss4PfbUSUqcZR9LQcHBp6G0SMQVZ
         679+REBMRP6Ao8hUDY6E16Be3Fm7W8I7Xj4GCFyOHZD9Ykit4V+IoKRTtpN79ITcS31w
         +ky4EF9MJMun4S3edBOm7qZfDvs8xY2ZdEYWUsBMWap08dhZ+q/cJO4gN80OufA3/rOb
         uD/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XnsZHgGN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ro10-20020a05620a398a00b00773c039a37fsi10524974qkn.163.2023.10.12.05.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 05:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XnsZHgGN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qquet-0002ky-Gk; Thu, 12 Oct 2023 08:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qques-0002kW-2H
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 08:19:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqueq-0001na-8E
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 08:19:17 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so135570466b.2
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697113153; x=1697717953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fa15t5TAOGLEwbp/XmPMZ/3+NPt1m11OvXKqtHI65yw=;
 b=XnsZHgGNkyKCh07e/ewz9lrRPHD4E0mYFWZ+55zuQuS70PRDCJVOCpS9XGAOPWQ64w
 hyGH2wv4jsfP4imhfvfEReyipmghs6dJHoIQLByxOxQIaeDmwQDaplkJa51NI67FyvTX
 sSJODgqskAg35U4RoLE0OFbIum2JmOokY5q8Px31UbNFsf/0JyFQ5s7A/vPK1fpPfTHf
 ciQWPx8KArFAxiaS/215NhJpcGN16ilS8oxin6uwKeAH/HXH4Q63u/rGi/hf4AKhHf32
 HkuOUleSs4My/i6fNh7xcYt3+ZJ+JMR8l81QHuh+EA6r5hnmPULI78YTFSXUmuyCW1Il
 PD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697113153; x=1697717953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fa15t5TAOGLEwbp/XmPMZ/3+NPt1m11OvXKqtHI65yw=;
 b=A5am62T08K8Y+LP/WRSOvC3N5rbP6fiD0YQy44F9lmSTrxA+wp9ZkqZekl6K/eU4JE
 9Qi0qBI9m63fGpvXKWhQHVfEHzYxRUfM0pqpEm78qBZnlOsELMhbjPk7Al2KMJ5xS9t7
 CGJfwRnWBAUwIXfpbx4vpqkrkhFUw97aP0U2/05kCvxe31WNUjEFdMg/QyVYaaQu1YiZ
 kWS/Qhz/2sKccAwYfInnMcr6eWk8X7HpwMLzwvJYoQot45J2q/ooTlU/pPJhAn8dsRaL
 B7YlMElRC38B8trspvvsfGWFP+8phg5sZm4xetrpNc31o17RILtpTzr1Me2XvEDFZR0X
 1AUQ==
X-Gm-Message-State: AOJu0YxlcHywcN3jLcUc1SSF+KWUPXQI/Ye6fcCHdW2j7k4d/y/kigR3
 GJRH5VjVKf/JJN0mWdkv6kiLLw==
X-Received: by 2002:a17:907:6c14:b0:9ae:5c99:f2e2 with SMTP id
 rl20-20020a1709076c1400b009ae5c99f2e2mr18605504ejc.43.1697113153692; 
 Thu, 12 Oct 2023 05:19:13 -0700 (PDT)
Received: from m1x-phil.lan (176-131-211-232.abo.bbox.fr. [176.131.211.232])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a170906299400b00997c1d125fasm11157488eje.170.2023.10.12.05.19.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Oct 2023 05:19:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/8] hw/pci-host/designware: Initialize root function in host
 bridge realize
Date: Thu, 12 Oct 2023 14:18:50 +0200
Message-ID: <20231012121857.31873-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012121857.31873-1-philmd@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: pxOw5BuhI3Z6

There are no root function properties exposed by the host
bridge, so using a 2-step QOM creation isn't really useful.

Simplify by creating the root function when the host bridge
is realized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/designware.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 304eca1b5c..692e0731cd 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -707,6 +707,10 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
                        "pcie-bus-address-space");
     pci_setup_iommu(pci->bus, designware_pcie_host_set_iommu, s);
 
+    object_initialize_child(OBJECT(dev), "root", &s->root,
+                            TYPE_DESIGNWARE_PCIE_ROOT);
+    qdev_prop_set_int32(DEVICE(&s->root), "addr", PCI_DEVFN(0, 0));
+    qdev_prop_set_bit(DEVICE(&s->root), "multifunction", false);
     qdev_realize(DEVICE(&s->root), BUS(pci->bus), &error_fatal);
 }
 
@@ -736,22 +740,11 @@ static void designware_pcie_host_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_designware_pcie_host;
 }
 
-static void designware_pcie_host_init(Object *obj)
-{
-    DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(obj);
-    DesignwarePCIERoot *root = &s->root;
-
-    object_initialize_child(obj, "root", root, TYPE_DESIGNWARE_PCIE_ROOT);
-    qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
-    qdev_prop_set_bit(DEVICE(root), "multifunction", false);
-}
-
 static const TypeInfo designware_pcie_types[] = {
     {
         .name           = TYPE_DESIGNWARE_PCIE_HOST,
         .parent         = TYPE_PCI_HOST_BRIDGE,
         .instance_size  = sizeof(DesignwarePCIEHost),
-        .instance_init  = designware_pcie_host_init,
         .class_init     = designware_pcie_host_class_init,
     }, {
         .name           = TYPE_DESIGNWARE_PCIE_ROOT,
-- 
2.41.0

