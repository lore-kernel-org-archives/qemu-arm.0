Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp764242ejc;
        Thu, 12 Oct 2023 05:20:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTBHoEdy/QMw7wZaAnQTg40HjEiaV7QtH43G7PyH60jg1ddhAcnE8IlFYnCVow8cI+Td+I
X-Received: by 2002:ad4:4528:0:b0:65d:660:25a8 with SMTP id l8-20020ad44528000000b0065d066025a8mr22714126qvu.20.1697113204707;
        Thu, 12 Oct 2023 05:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697113204; cv=none;
        d=google.com; s=arc-20160816;
        b=XX6wwTP9JBEuOI3bsEpKPMaI95SkUa9Yoq6TOn2fUw0G3EAEMeO9lLwyv2kS8OefgF
         FnRGW76HSxESxdoLaZ+IQo+pUX855ygyj4XxthaOsDssTmOiQ0QLMc4a4NGadaqZBdpa
         RKX71uGK9UCogp+9p2jM2M6+puNRT9yEuRKT9UnWgQVqgMcgNMuXUu5PiVV5X1IOf24h
         DmW0GcSaNHOS9bxqJtHkDbZ17H+yeafK3c/F+/6BiQ8bZm1fWKgBWBp0whws2wl01O7V
         l5XQMDqKlapwmARcYGTSKBdlBJ5KD4/+wz1Gm3BNZKeAhVSelmsRHRX9Apg7LvmCiVwg
         OxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gZd2RKyqgmNmX/QmPgvNjI61C3FFoLBUU4C4GM7tl24=;
        fh=uMYo3jOuXUsDthaXCE4/M6n3+voY5rtHQA7Grzg1cYU=;
        b=QK/XP/4eRr56otAieR1rN4ydIiMHB/+hVq5Je1H74dhlXBnhfIeWYobO/6OPsJiRrF
         gOAwJ6e4ioBnW2fZUVnHMpdmf00zW80UFkhHFNrdKA4lM4UN+TmP70lCR53wq9bTiHx/
         Ki5jWBda3iP7VdbzPcRmwhj54GFkQciCUqTYdhWnHepM7Lw77ZZKID93NMX7Z9sAiuv0
         az5hWfB+Fg+d2894TTpMVzpobOqagksgoc3roRzYkMVsMUYA7YBKBeIibYIf2Igs9B3l
         9K1jboxHjkMIfgp50GMvYYh4O2ExzhLoK+w01t0YhhiOjcZMSbDzjz5uCh0gx/iR/QaJ
         BW5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eT3NCh/S";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a0cab86000000b0065b087a5385si10884201qvb.431.2023.10.12.05.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 05:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eT3NCh/S";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qqueq-0002jt-MY; Thu, 12 Oct 2023 08:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qquem-0002ia-86
 for qemu-devel@nongnu.org; Thu, 12 Oct 2023 08:19:12 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qquek-0001kS-8o
 for qemu-devel@nongnu.org; Thu, 12 Oct 2023 08:19:11 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so147593666b.3
 for <qemu-devel@nongnu.org>; Thu, 12 Oct 2023 05:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697113146; x=1697717946; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZd2RKyqgmNmX/QmPgvNjI61C3FFoLBUU4C4GM7tl24=;
 b=eT3NCh/ShKWaEteKgQ7VrDKNKDniFaguhQGzEutHeea4RYbG5ZgwLb6vWK4GYeL6FU
 iHtAzbOrFLnouIqy3ZwJaf+XqS9CvnNNBUb2VvIQuBnFRwuyuX8PMw6Mszfqih5VMfX8
 Q0Hx5aNIzd+EjS4idcTim0sefSN8vq7C0gsvrTZez9YQ7XbppT8Sd90ZjuqRXPpticjm
 PninLPT8YBXm/X1ru3c6TW+j3U/5Mr2AVmPMdhxRE0ZpVuyQEP7oYDIqaYNMyE1pxlTw
 t+f9auV6KAonL1HumZci1qeeTH0aa4+tYt1aE7XdEx6aTjDx5UpX5uT9JxQC7BzSRXyj
 bGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697113146; x=1697717946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZd2RKyqgmNmX/QmPgvNjI61C3FFoLBUU4C4GM7tl24=;
 b=NroX5KEfAoF8XOB+ZfYz1afjw+WqDjyAkKmJSx8bjK3ppfTBRwotVQjnTfmpZ0sww8
 1HWVFWOoCIWlzUep3Sqt6IH3luqvEj5nsB9ZTS9/mDaulD+lHchK8fb2ip4ZIA2ikPZa
 8qGZoeo1pZf++Np4kruVGurL0fSiuH2Djf3aRDs6FOIDWu8udiYHAWoVGPMSriklhdQ1
 nx/Hi+yAY2MmOqhzPW55SwsIaNMKX01GMUzbKBZdvRpcBkr10sr7D15VVjKMGmNzU5WS
 tHlxHHBPctjkvFd6Et5hI+p7gojFp1l2b1Fc+S4mZGGweHvBIm+Wr4BWeUaboMQ5fXsJ
 IsBQ==
X-Gm-Message-State: AOJu0Yzo10zl0LERZwsUMob5M/1ptmvAYv8LRQfeYWUcK5l0g3brl/vl
 blBqgDz45+dGZrySL10UZZ1Bnq/2JhEX7DwWhQdZ2g==
X-Received: by 2002:a17:907:75f7:b0:9ae:658f:a80a with SMTP id
 jz23-20020a17090775f700b009ae658fa80amr20517353ejc.48.1697113146504; 
 Thu, 12 Oct 2023 05:19:06 -0700 (PDT)
Received: from m1x-phil.lan (176-131-211-232.abo.bbox.fr. [176.131.211.232])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a1709064ed000b0099bd0b5a2bcsm11065610ejv.101.2023.10.12.05.19.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Oct 2023 05:19:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/8] hw/pci-host/designware: Declare CPU QOM types using
 DEFINE_TYPES() macro
Date: Thu, 12 Oct 2023 14:18:49 +0200
Message-ID: <20231012121857.31873-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012121857.31873-1-philmd@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XpWDl57Lczc4

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

Remove a pointless structure declaration in "designware.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci-host/designware.h |  2 --
 hw/pci-host/designware.c         | 39 ++++++++++++++------------------
 2 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index 908f3d946b..c484e377a8 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -31,8 +31,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIEHost, DESIGNWARE_PCIE_HOST)
 #define TYPE_DESIGNWARE_PCIE_ROOT "designware-pcie-root"
 OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIERoot, DESIGNWARE_PCIE_ROOT)
 
-struct DesignwarePCIERoot;
-
 typedef struct DesignwarePCIEViewport {
     DesignwarePCIERoot *root;
 
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 6f5442f108..304eca1b5c 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -746,28 +746,23 @@ static void designware_pcie_host_init(Object *obj)
     qdev_prop_set_bit(DEVICE(root), "multifunction", false);
 }
 
-static const TypeInfo designware_pcie_root_info = {
-    .name = TYPE_DESIGNWARE_PCIE_ROOT,
-    .parent = TYPE_PCI_BRIDGE,
-    .instance_size = sizeof(DesignwarePCIERoot),
-    .class_init = designware_pcie_root_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_PCIE_DEVICE },
-        { }
+static const TypeInfo designware_pcie_types[] = {
+    {
+        .name           = TYPE_DESIGNWARE_PCIE_HOST,
+        .parent         = TYPE_PCI_HOST_BRIDGE,
+        .instance_size  = sizeof(DesignwarePCIEHost),
+        .instance_init  = designware_pcie_host_init,
+        .class_init     = designware_pcie_host_class_init,
+    }, {
+        .name           = TYPE_DESIGNWARE_PCIE_ROOT,
+        .parent         = TYPE_PCI_BRIDGE,
+        .instance_size  = sizeof(DesignwarePCIERoot),
+        .class_init     = designware_pcie_root_class_init,
+        .interfaces     = (InterfaceInfo[]) {
+            { INTERFACE_PCIE_DEVICE },
+            { }
+        },
     },
 };
 
-static const TypeInfo designware_pcie_host_info = {
-    .name       = TYPE_DESIGNWARE_PCIE_HOST,
-    .parent     = TYPE_PCI_HOST_BRIDGE,
-    .instance_size = sizeof(DesignwarePCIEHost),
-    .instance_init = designware_pcie_host_init,
-    .class_init = designware_pcie_host_class_init,
-};
-
-static void designware_pcie_register(void)
-{
-    type_register_static(&designware_pcie_root_info);
-    type_register_static(&designware_pcie_host_info);
-}
-type_init(designware_pcie_register)
+DEFINE_TYPES(designware_pcie_types)
-- 
2.41.0

