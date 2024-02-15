Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp740064ejb;
        Thu, 15 Feb 2024 10:05:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVeMbz5U4NhGufan3Fs9HqVPso8hvZ1IaC69ZSS/5RYYxemP/Q8cP2sM9LFTaQLGtsvPzvru2VoTlAPoUSIwl5soFs0NB55
X-Google-Smtp-Source: AGHT+IGkMizZbfpcnZMQcSHDcWNqnkzG+rm1sBuMEhNp8HXTHah5SqV4xHujoz6ijSUsPFxk71gh
X-Received: by 2002:a81:6d04:0:b0:607:c7a5:d1af with SMTP id i4-20020a816d04000000b00607c7a5d1afmr2602135ywc.16.1708020302594;
        Thu, 15 Feb 2024 10:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020302; cv=none;
        d=google.com; s=arc-20160816;
        b=rfIF40QgHl6DYlu2Zpb1yOlCwWyadvYHmMW0hEJZGqMv55liKB81aif+v9l2Ni4CAW
         wEjLjULyFFordq4PzuwWL33U3lt5wr13/DQ/G36bAEvT3wAOxCIG13JQ+/jPMNcr3k2A
         9OuteE1kLeKjzDm3FoO1XhfYrYM46MQcfQdIEB3mIkOl00N2sWGKDTFBa71FW0WNmJjH
         tfFNSiFe+Ui5P4qDEa8xYt2KbCcHrxAi62hF7cYxvkcRqIeDFdyv6KAWzYBRBynAu5kp
         TSvY6YRpm7uwUyirgUhyiG7jvlYXNxxQ0CexCOvQTCKOfhUk5ZDWX8Pq6/oUzQzcfOWj
         ZMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OBV5qUeSmxg7d8YWWooFsnTAz7bZYxgfHwu1fmOUlCU=;
        fh=KLAI953NbjeA3dqvtgPuF7dr9rHlMRqazWGGpA3YFFY=;
        b=G6aJgpxTwUbYGXkCOXrEIgJpWEDF463Us2pI7wkc9qx7Wkm73BkgZ9NyrNMp0+ACDT
         KsGSYvl7RB+MitIAEhIwBW3HDdZ/YEY9VDtFyfKF8FSPNwZIs91MzVpa3blfNTvlO/Y/
         a3BTTl1+GQKIED85l8iCwqwPJPEfJdHr7eYqTy1zpqzHA7HiE3/Jyg9CRqsNPxbzCkpB
         rWi3saycwpbsUxbYRfulkf9DYRjbjlW5i3Hl+2dk8cTD5XN3Z79k98EKQ9GIhJB1A3fu
         7nODn2aeT+d8a6UT3tUvGWObz7QNFUgbd421c+qpbbeefzZy7sv9t/CtUsQ/q1kw1XmA
         lz2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mX6wJTbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x205-20020a81a0d6000000b00607ad14d76dsi857457ywg.12.2024.02.15.10.05.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:05:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mX6wJTbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag5U-0002ND-5m; Thu, 15 Feb 2024 13:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag5I-0001w2-75
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:03:47 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag5C-0003B9-SP
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:03:43 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3c1a6c10bbso148820566b.3
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020217; x=1708625017; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBV5qUeSmxg7d8YWWooFsnTAz7bZYxgfHwu1fmOUlCU=;
 b=mX6wJTbPzF1p33zih82b2xr+rvHG/p8upbcp2+etksbCBn124LuDniBoYQ3U+qzaq6
 0fsgDqUvpiwWxIbCeVzq2O4wDWnZQjIYaE8cuXIxHNbP2KkDsHDEAhuH0K6MuSp8mfCl
 DlaYV/cQ4Z77TarIYiYu8Pby2msS6QjWd54gbWSjB+is8xOLuh3lvsYPW1qMM0cL/XXf
 eaX66Y94yhrzQ9hfs8rtym1cqWaAv2RkEaRzbeGuu2XPfyrTR+u5/mBgUWXxe/4AuPDe
 WBxQBJn9MTydZMKD/8iMGtF5Twwz0pkyk4CLlUnZp0XuQFeGi5QH5U+iCiZC4R7oTo8V
 ydig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020217; x=1708625017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OBV5qUeSmxg7d8YWWooFsnTAz7bZYxgfHwu1fmOUlCU=;
 b=qCfsJnsj5dM/RoF3+xQJA9JA3dYov/iLMPoPPF9gbf48MPvgWHKufklW+5Zmcpvaku
 K/kxTv8pIznRenrpzWurU1lGdSIbzO7v+j2buL6cVG3zdZw3/ia8BKMEUNl7qOWn6C2Q
 OjvSkfP+n+HnDeP64MCxkQCv4DuoEDL14gc6wpfKm9RtRv1cuzJ7IhuHgmeAJ6QiycpW
 0afHTlPc0qL3xM1akfZxVvpD3tk9hkhBHOHwsykcqI4BvLt8is7f7ylaU3xJGUprrmzC
 gOYNgookujtIlFYcZ3aWI92CDe9Te3ibDC4g/HH8wbn2W+etSibwW+kUpIS0DK2TGJGI
 90tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRfy9RgEJkFi9sAgWWK8Xpy9OBaFjHHJYKCjLrmaS5WfnHoGbyHlUYiE5qCpOmT/hseNg1qvY6mrwVrBDmi9igKjNa
X-Gm-Message-State: AOJu0YyxxeeQWJar9DIzg60z4J4MYs7g1/2o9zLM+XpzpHyYBWYfth/D
 +sucoXbyUXrkOwIBclL7TplOrv0gjrwe9XtCFp6pO2vzumfZrVaA8iejaHA/Q7Y=
X-Received: by 2002:a17:906:c415:b0:a3d:7d6b:2dc3 with SMTP id
 u21-20020a170906c41500b00a3d7d6b2dc3mr1755304ejz.73.1708020217134; 
 Thu, 15 Feb 2024 10:03:37 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a1709063e5600b00a3c091ead20sm784624eji.222.2024.02.15.10.03.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:03:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 51/56] hw/ide/ahci: Pass AHCI context to ahci_ide_create_devs()
Date: Thu, 15 Feb 2024 18:57:45 +0100
Message-ID: <20240215175752.82828-52-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: c4gKK0vGKZvJ

Since ahci_ide_create_devs() is not PCI specific, pass
it an AHCIState argument instead of PCIDevice.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213081201.78951-6-philmd@linaro.org>
---
 include/hw/ide/ahci.h | 2 +-
 hw/i386/pc_q35.c      | 2 +-
 hw/ide/ahci.c         | 5 +----
 hw/mips/boston.c      | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index dbef377f3d..8cd55b1333 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -52,7 +52,7 @@ typedef struct AHCIState {
 } AHCIState;
 
 
-void ahci_ide_create_devs(PCIDevice *dev, DriveInfo **hd);
+void ahci_ide_create_devs(AHCIState *ahci, DriveInfo **hd);
 
 #define TYPE_SYSBUS_AHCI "sysbus-ahci"
 OBJECT_DECLARE_SIMPLE_TYPE(SysbusAHCIState, SYSBUS_AHCI)
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 09e12418f9..d346fa3b1d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -304,7 +304,7 @@ static void pc_q35_init(MachineState *machine)
         idebus[1] = qdev_get_child_bus(DEVICE(pdev), "ide.1");
         g_assert(MAX_SATA_PORTS == ich9->ahci.ports);
         ide_drive_get(hd, ich9->ahci.ports);
-        ahci_ide_create_devs(pdev, hd);
+        ahci_ide_create_devs(&ich9->ahci, hd);
     } else {
         idebus[0] = idebus[1] = NULL;
     }
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 8b97c6b0e7..bac1871a31 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1896,10 +1896,8 @@ static void sysbus_ahci_register_types(void)
 
 type_init(sysbus_ahci_register_types)
 
-void ahci_ide_create_devs(PCIDevice *dev, DriveInfo **hd)
+void ahci_ide_create_devs(AHCIState *ahci, DriveInfo **hd)
 {
-    AHCIPCIState *d = ICH9_AHCI(dev);
-    AHCIState *ahci = &d->ahci;
     int i;
 
     for (i = 0; i < ahci->ports; i++) {
@@ -1908,5 +1906,4 @@ void ahci_ide_create_devs(PCIDevice *dev, DriveInfo **hd)
         }
         ide_bus_create_drive(&ahci->dev[i].port, 0, hd[i]);
     }
-
 }
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index a6c7bc18ff..1b44fb354c 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -775,7 +775,7 @@ static void boston_mach_init(MachineState *machine)
     ich9 = ICH9_AHCI(pdev);
     g_assert(ARRAY_SIZE(hd) == ich9->ahci.ports);
     ide_drive_get(hd, ich9->ahci.ports);
-    ahci_ide_create_devs(pdev, hd);
+    ahci_ide_create_devs(&ich9->ahci, hd);
 
     if (machine->firmware) {
         fw_size = load_image_targphys(machine->firmware,
-- 
2.41.0

