Received: by 2002:a17:906:2499:b0:a38:6d10:c5dd with SMTP id e25csp379308ejb;
        Tue, 13 Feb 2024 00:14:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXFD8MBdr+pKgl2GCWkFp/2pW0SaO8x0mOGAqFo6TWXOyKEuGeMjG1Ex4xozc3Kamu7clgxKhpridO2/KndpAxLPz4SAfV
X-Google-Smtp-Source: AGHT+IFmiI4LJYWSxnlN+c4ODepGN+KOq8uUTj67cuxzCKZE0U9YB6nre2VJtYP2sUMFtTVUoMoX
X-Received: by 2002:a05:6808:648a:b0:3c0:3966:625b with SMTP id fh10-20020a056808648a00b003c03966625bmr5176321oib.30.1707812067349;
        Tue, 13 Feb 2024 00:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707812067; cv=none;
        d=google.com; s=arc-20160816;
        b=uyrydB7ujQ5ojelfFGDehkluCUVXre8wYX3hDU5O1aGuvcYI6noBGj7IYrqs04lSlD
         AQUYGF5tMjUQIS3hEObir6BskY0oQOIaqOZ3KVlc5ALMo06OFAlvUHlJb14HdaPhMCwm
         45BkX8adbLlCThbj71R+bvTk+u9J8J9Lplz8GYUy/ZdeWAXmjceanOZdg8ih2ZyMdq/w
         ftpHjB0WrNBykudXJqCOLwR/sRi5rbsuseA1WCsaGtWmU0VhDESLQRbKzw5JVdX05hIx
         klA2ck/jLY4FFPaErXby96iIx50tPL1fLhQa9gZtaiBIOnZtZgbIz8NugYwxne8t3/V2
         aL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a4ug+gqIzlvgMFvPTiM99Fr6Vu5lvApMTDFifyvx+0U=;
        fh=j3rfC+V7WXFIhVR8HpncNuB/enMBX8StF9v8lUv1kDk=;
        b=TWAsy0/QRngpEYYU7sVoNiyMFRElVCGxqiBZnec1EpZjVw4KMjJQZ/9UHTGlAbLsWc
         PQm0pyl7tG/UE9efTCIEGBUYDAgNHKDZewUHIrVL/By1Da89669RFVGOR0etIz5Ch0Dp
         3kGSH32PxW0OQdA72hduVPnKVB2HsrpIOy7vp/G5w8QqgQ3RhBolksmNYcpeWbGbEkZm
         lKi4TZe/mgZy1jgaW2MX4N2Y05ga4DRsynj6VjKXTOTyEe750QVeOZZ4QNU4/vivjX7Z
         AGpJ/2sAYyFCDFt3jESNVcWIOD174Qe3+/eV9InpIiWLasiQUqS1j6F+RHUBY+idt+IG
         xkMA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hJl4/HnI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWhRfb3IhM0FHWTzgPv8vlnGBraXLEfFjTGP+gQ5Z9KCwNIl09cp4xfmt4/TJhNpLL3tzLAqmeaYSqLFuZQYJ8vEX9TSTdd
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020ac8480c000000b0042dace44a88si1032302qtq.457.2024.02.13.00.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 00:14:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hJl4/HnI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZnuH-0000bY-Uu; Tue, 13 Feb 2024 03:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZnuC-0000YM-Ew
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 03:12:43 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZnuA-0000sq-SA
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 03:12:40 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d0a4e1789cso48384991fa.3
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 00:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707811957; x=1708416757; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4ug+gqIzlvgMFvPTiM99Fr6Vu5lvApMTDFifyvx+0U=;
 b=hJl4/HnIRU9x3VmCmxM5Z8T/YkhtZbh5hcTPb9q8aWZFzMXcw6d70z5/eLM/3s025o
 ldyVN3XBbDC/gs0Eoi8z01F5AZrd2BvliFPciS8/md782TwExvsRN2K7vXwHDHljkztu
 xluKixYyA5VfP2wLuRO+uswJx04DeZMw0ZgAfHHAdT3XwO99AN0F1LgR74UnzwZOlIQm
 Tt0CVKHGWHR5UsBY8lOwwG0EjeeAjGlMb1gxpC0dSJcac7sA0vm/xMoWJlOkqLRcdGeA
 v3np/E5OwOCKW5CaiyWkEceLqgGZCdF5YRPV0CvbMWDIrSl+kM3nqOWpL87Z9Pa71Tw4
 plxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707811957; x=1708416757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a4ug+gqIzlvgMFvPTiM99Fr6Vu5lvApMTDFifyvx+0U=;
 b=cDeHL8k3hQtFajpHs4SY1IL5oTikNgF44t6yNLizFB25fKSb7AtJpwehqhZ+guaYDp
 w1IUKytHfbKHbQjmdprqAqW/1WeDK0Rw+LMzAEFlftOQIQLY0VDqsftE9YG4qpyS5j5M
 mFZL7TwmZiq3AZCXxp7J6H1ZlaJW/zmKUv92MzLFHbh/i2PLlcXqValGRMLjp7DdXUhx
 Fq8U+G5W8kF2LJ9TZitVIxW8GwdQoLhl4n8DcX5EvzYOZLkZ/MEU2GXxpsC51oLlTJqv
 jIbHdZdTuhrF+R2bv4xIpB7ERc3SH7bbuNLG9zEK3MhfYQuoXnuABQI2xjRq3fArz0Ym
 PlJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6mrniK1D2AENTqHXNGku5vjL4ucCrRf7Grfk7J5sIckdVXU2iqmOD1h1elQgsK97PlRYnOmcjezvcptdYbqki2xaw
X-Gm-Message-State: AOJu0Yy0gSYZDziu8VswZxINXwAR2m6Q6t+GbXLDe5hwP4m2IfX7Atid
 4cS8n9gx3gi4+AEn8BwM8U9bC//RT0lbaMnpNXiLhA68YJS4rpgBuiadxfNjAKw=
X-Received: by 2002:a2e:86c5:0:b0:2d0:f8d7:a91c with SMTP id
 n5-20020a2e86c5000000b002d0f8d7a91cmr3119336ljj.52.1707811957191; 
 Tue, 13 Feb 2024 00:12:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXEBS51Yaa0dYKasaqeIyfMKcL4ZSG91xMTOHjNyeFwjuSoeUHGg2W0J45PZpF5sfTAWq4O7AamRSKu609B/uMQ0dwdKcligWmgyYw+B1eZ1e0o1Qyo4jN+2Ca5SrEGs+QpQDodMAsoIXcuPsdTshJicxnT3SzNCyXxIOat2WLZCrvklPdpd4yk2fjH4fAN4rE2LDHyB4g0zgdPmpfvQF3wIHKYtNGLnrPcVvbo5Q4pmqJlW13N9k2pymquFbpYzntB00J7RTT+2KF/cbG+KPcHwz3/gzptU3ilBaIfZ1+Aund3yXUmu2L89n1kPqnkORWVYvUcHMYBoFo+n8y87PvH9xABqy0aSv3GKQ==
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 fa1-20020a056000258100b0033b79d385f6sm6566745wrb.47.2024.02.13.00.12.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 00:12:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 5/9] hw/ide/ahci: Pass AHCI context to ahci_ide_create_devs()
Date: Tue, 13 Feb 2024 09:11:56 +0100
Message-ID: <20240213081201.78951-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213081201.78951-1-philmd@linaro.org>
References: <20240213081201.78951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: cR8tLPuMI34T

Since ahci_ide_create_devs() is not PCI specific, pass
it an AHCIState argument instead of PCIDevice.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index c50e3bfc42..7f4f51fcdf 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -316,7 +316,7 @@ static void pc_q35_init(MachineState *machine)
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

