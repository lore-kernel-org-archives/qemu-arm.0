Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2387629ejb;
        Sun, 3 Dec 2023 16:33:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIZT1VKQcC1rVPW+qdmYv+DgKdafPPDTPu7vDoCSla2OZJ4i+7udRIpj2zMmWi9tivmlEz
X-Received: by 2002:a25:2517:0:b0:db7:dacf:ed80 with SMTP id l23-20020a252517000000b00db7dacfed80mr1795204ybl.97.1701650021281;
        Sun, 03 Dec 2023 16:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701650021; cv=none;
        d=google.com; s=arc-20160816;
        b=geZ9eiV2/W9FImj+Wb1qRhCC0vwdgk2Rwefj7qni9C9xm31T5V3zOKTWCCCkGRW8LD
         F+58ZL0j5H8bD4uBjK+dkRzGZd1VCPS/2jSWqA/ANq4QXK2R21lvkeha9Ph8fgjSWZDZ
         E4rFKCvXSaOAoRMoeXcgHF34ziaBgB0l/s46mMDmZU+OOcVSSwzg1YLSumfw5oO4J5+A
         3bLoUgz06Gq+MzFpZedIUN9rPMHIxvsFOeaBL/q8CypVH+b/P4PRkw8W9t+a4zBdX895
         vNyOrQqBEaNIjbKOQop3BsVBknuSf72Qrmwptx685wbehg3jWQ76zilkXam8CapZypnV
         AugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Wh1QnDZocCaPOy/8crynrl25nM9IxATZq1B+Q2/YqWE=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=QldoI6sdHDc3tR93EiVKviXxDpohmdu8zkKWvCS8vyVQKg+lComANwYANFT+w56sO8
         U6bG8UKFerL+MRKFBxSPWUFBoDvBzwZlskX/sS7rukSDVWBZq+cVK5Oui8t6V3JZyHwb
         kG7pfMnwUqDNQTinlRlYQoyIlNigOQnhHgDXkb8rKw8T9Lze7qYDqSypTLzMD72piCLr
         7DRSFPujtCM4+abvEmLjOQUugiXR12haqKY6iav0kbSaOrDfoEYRiG8itbMm3yI25nkR
         DQvU/bfDcdddNo4BQybZuTfrqu1avQKzEnlwthXFa3NaVOYEhjMxoanX7iw6aOvzuSP6
         E7PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ck3n9HSC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18-20020ac870d2000000b0042375b6b2c4si8046699qtp.771.2023.12.03.16.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:33:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ck3n9HSC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9wnq-0004qo-Fo; Sun, 03 Dec 2023 19:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnW-0004YS-Li; Sun, 03 Dec 2023 19:26:56 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnT-0000BF-Ix; Sun, 03 Dec 2023 19:26:53 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5d747dbf81eso10813467b3.1; 
 Sun, 03 Dec 2023 16:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649610; x=1702254410; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wh1QnDZocCaPOy/8crynrl25nM9IxATZq1B+Q2/YqWE=;
 b=ck3n9HSCwwyqar7+iwQKV8wTcix74G3eIzy4yME6CWC/pk0OGBzHZbu8pcNICn4iP1
 qpiTP/MZXr7WgYVCwFI6M5BRA/PqL66w2wozM7Y0wKp1lyliBhzSP/F6gtH2+VNM7DPy
 l1DWHwxu8xIu26vmbSX3aYH1MqqTKCpBvZg8/LYeYe6a3jLXJRFn4+KgoR0iLg540Z9G
 ygaeWYjDHx0JrpwnGJ/9mZxF9kUk4pGdABzj8qeRalQhEIGL8WbZRKUGnF5ZQQvH7N4o
 IkMCAGGd/yGxAy02NAJ/riEKVbVixLcADExaRaZj0WyY7D+O9QThkHuMrGS272HzqEz7
 YY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649610; x=1702254410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh1QnDZocCaPOy/8crynrl25nM9IxATZq1B+Q2/YqWE=;
 b=Y8LV2sfkm05Vgzudb/xr0hpPh8rNNZu8V/JV/JM4m+nykr3D7INv6DqYFkLavNxWsy
 tNX2TwZy19PXIZ7OfCHhw3dpcKroqnxp0kUkCNblAKWW6QW3TeEv8QbKYzh75OoqGBXm
 9lEnZfkGTkiy/EkIJkYK0zo7eJ6MzdTHKgiXv0VDVzfOeeyEex5Ow1B2QdK1lK/XrxxJ
 ye8P72GtL7MyE/ReVxNKRNejl19ZkbcJYQd6j2DuwiR/y4WXih9mgZBzIapStflWcAbu
 382WeB5Cz01FZBHjrVqxqabIYjiymVMoezk0VCsRbd5CfhEyXLXvoGZYmR16f9QjYLEP
 lA2Q==
X-Gm-Message-State: AOJu0YwlDP5N1fIXtTKEio4PMXRFI3MN27E9PUNGqtXVszUatyx346bC
 ArI1jG8NHKjOsxD0hfJHM5SgyQfJ51FTmA==
X-Received: by 2002:a81:830f:0:b0:5d7:1941:ac9 with SMTP id
 t15-20020a81830f000000b005d719410ac9mr2211587ywf.100.1701649609980; 
 Sun, 03 Dec 2023 16:26:49 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:26:49 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 21/45] Add clock_isp stub
Date: Sun,  3 Dec 2023 18:25:55 -0600
Message-Id: <20231204002619.1367044-22-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HQU8Yy2O0WKq

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c         | 6 ++++++
 include/hw/arm/bcm2838_peripherals.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index e9c6d47ba6..65a659c15c 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -17,6 +17,9 @@
 #define PCIE_MMIO_ARM_OFFSET    0x600000000
 #define PCIE_MMIO_SIZE          0x40000000
 
+#define CLOCK_ISP_OFFSET        0xc11000
+#define CLOCK_ISP_SIZE          0x100
+
 /* Lower peripheral base address on the VC (GPU) system bus */
 #define BCM2838_VC_PERI_LOW_BASE 0x7c000000
 
@@ -228,6 +231,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PCIE_MMIO_ARM_OFFSET,
                                 &s->pcie_mmio_alias);
 
+    create_unimp(s_base, &s->clkisp, "bcm2835-clkisp", CLOCK_ISP_OFFSET,
+                 CLOCK_ISP_SIZE);
+
     /* GPIO */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 0e8465ba34..20b7d1eb67 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -70,6 +70,7 @@ struct BCM2838PeripheralState {
     BCM2838Rng200State rng200;
     Bcm2838ThermalState thermal;
     SDHCIState emmc2;
+    UnimplementedDeviceState clkisp;
     BCM2838PcieHostState pcie_host;
     BCM2838GpioState gpio;
 
-- 
2.34.1

