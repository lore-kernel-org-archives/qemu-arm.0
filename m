Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp765023ejc;
        Thu, 12 Oct 2023 05:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6WQzDEll7jjuUpkcm1zxef4h39B+wI9aShXa4LvQ+6VFSow7o0YAVhrhET6u2oRJ4V1MZ
X-Received: by 2002:a05:622a:1189:b0:412:2911:7e16 with SMTP id m9-20020a05622a118900b0041229117e16mr29014103qtk.24.1697113278362;
        Thu, 12 Oct 2023 05:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697113278; cv=none;
        d=google.com; s=arc-20160816;
        b=et1Ngm+JEhzK/IABhzcl3XQVPmDX84ilA7rZJ3gsaMtjL6DWegcVHZTP8n3ToybdaT
         BFqgUR2VTfOgDpTclPZ5X7c8Qmsok6SBq8SajJQPlYPHCund7UyivFZR9B35qDZ8kYAf
         HkYgC8QoLL9ouNRjhCo26mT/h3yLi3TdzapJJ0aKPRWDgmXl7W2s4d0S5Ij8OPnOaRY1
         xqTcXdyx6RTV8LQ7kUKXNe00RMd3H7hVu7AfFM+a4vJHt0I2ZwXMrl/olp45CHHNTqgS
         MC7bf73dRo+boxQ/zaodshWMuRSg7NF7jz5mY4LXGt1JrBQ725tMkilDiztlDROc/udA
         gTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x9j0wB4sagFap8UlCk3DGG3Emv5eeF0Xy9DDluHlDSM=;
        fh=uMYo3jOuXUsDthaXCE4/M6n3+voY5rtHQA7Grzg1cYU=;
        b=f7nVAmek/0i0MmU8dqD2HCZGZeP0aPz+DAMmPRE70KjfhtnLHJZuoH6ettzrNTWGbY
         YrVmzFiGQBIS8rcNkNeq2So/zNAZyA9xcUlAyZ29EcjoS+Jnqc9oiCoATXVYM+MruLO1
         T/er8hmnJO1ZIOd2akakIw0x3tYIE4wHY0En7h3cHAqWqyXPKBBJDmyjBBTECjgFDfCa
         wg9Fm55rK+l9pnP99jUb3HnJ9kgurXPGR1DVzuHWxTvDwZyIw1ytk/wg8zoRO7VjhIIm
         UlERzAC2DpsHq8MHvsMlZyFATQvhitAR/Y2TEswPn0EVr3khahBGlEezuEBWMHV/qT3a
         KxeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Op3YQS6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a05622a050c00b004035b30ed1bsi10885949qtx.589.2023.10.12.05.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 05:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Op3YQS6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qquey-0002u2-KD; Thu, 12 Oct 2023 08:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qquex-0002qg-EY
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 08:19:23 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qquev-0001oX-Uo
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 08:19:23 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so147627566b.3
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697113160; x=1697717960; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9j0wB4sagFap8UlCk3DGG3Emv5eeF0Xy9DDluHlDSM=;
 b=Op3YQS6ii/w+7k2SJnNHXrk/kAAJsSBVqntkgWO0CFTlGNUQT0P9OEIEy/6SO3hkht
 w4ywhxzzwqHrNXTSw97p10oxyAFjVjEuq8LLIU6+V/26THL0nGcetp8Btu2w5kCUYhfs
 JXqqeEeVpIBnjXI/7Bl07CfUEz6nglBWbGes11tLaHDhnqZZtx0N4RFX57G9r9PUAOZr
 kuIQ1WRMOOeGsM+0C6zN0BZBnbP14/jtO4n7aw9gv4eRIk1NN1nmpx+7w8eVKLnLP2/8
 2m/CsuRMInH3mzUZwjB0GOK2rZJNl1A35aFQ6rqMjwbRs7+u10vysecr5dnvOPlOle7Q
 j1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697113160; x=1697717960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x9j0wB4sagFap8UlCk3DGG3Emv5eeF0Xy9DDluHlDSM=;
 b=ZxyWpZ3WAiVwJRE6x9k/NznRIlN2IpPrRN5XpVmmizt4ybFvuhdL1WOGdKXg+arG4U
 1IkjeYZz70hLvyjoyaVjqov6F7eFe9E9XYHUE405Cfun5MNF9yxnyIhFA/WGCt1BCnpl
 AkVSJVO+bpDsRkan0zrDQOLaFyF54bYHXEdjr4vCAGbBjoSAIdE/UuapXak0My2Xqeo9
 0bqdQAgoVOrAOU1lMQrikC5petnKZw0sUyiSJc5aNkzjheFfyCVKbiHV39VDMqrkrtj6
 frEyPl6WtP1ewSS4izWWzDMhUddnMz4I6EVj5nRCzWU0/79/BRhCS2zPWdQXcZ4ZcnTH
 r8GA==
X-Gm-Message-State: AOJu0YyyCHTGKIX1N4ZkSIaie40EZxHO91p6brCatidFXYKwBo40V3tx
 uTaNvvAaVa2SqzugmSQ2tzY9MA==
X-Received: by 2002:a17:906:3288:b0:9a1:fb4c:3b6c with SMTP id
 8-20020a170906328800b009a1fb4c3b6cmr21893209ejw.59.1697113160687; 
 Thu, 12 Oct 2023 05:19:20 -0700 (PDT)
Received: from m1x-phil.lan (176-131-211-232.abo.bbox.fr. [176.131.211.232])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a170906139700b0098f99048053sm11226132ejc.148.2023.10.12.05.19.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Oct 2023 05:19:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/8] hw/pci-host/designware: Add 'host_mem' variable for
 clarity
Date: Thu, 12 Oct 2023 14:18:51 +0200
Message-ID: <20231012121857.31873-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012121857.31873-1-philmd@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: 1yAetjbuLFAQ

designware_pcie_root_realize() uses get_system_memory()
as the "host side memory region", as opposed to the "PCI
side" one. Introduce the 'host_mem' variable for clarity.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/designware.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 692e0731cd..bacb2bdb2d 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -393,6 +393,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 {
     DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(dev);
     DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
+    MemoryRegion *host_mem = get_system_memory();
     MemoryRegion *address_space = &host->pci.memory;
     PCIBridge *br = PCI_BRIDGE(dev);
     DesignwarePCIEViewport *viewport;
@@ -433,7 +434,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
         viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
 
         source      = &host->pci.address_space_root;
-        destination = get_system_memory();
+        destination = host_mem;
         direction   = "Inbound";
 
         /*
@@ -458,7 +459,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 
         destination = &host->pci.memory;
         direction   = "Outbound";
-        source      = get_system_memory();
+        source      = host_mem;
 
         /*
          * Configure MemoryRegion implementing CPU -> PCI memory
-- 
2.41.0

