Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp932235njb;
        Wed, 12 Feb 2025 03:41:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUp1NPUSPhFaUnBIWkEu2QVtXkurixJPn6mKqSnkKUAQk/Fa2onGCsHppYnGQSP9sRsTfYTgwlyN1aviQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEMPF6+AYkT4MLXAd6VX08wq5LonQW+QDDvskazrdN1wl7t75fbdklABTuCtJo315R3gaLr
X-Received: by 2002:a05:600c:4e4d:b0:439:31e0:d9a4 with SMTP id 5b1f17b1804b1-43958176b21mr30075975e9.10.1739360484232;
        Wed, 12 Feb 2025 03:41:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739360484; cv=none;
        d=google.com; s=arc-20240605;
        b=avB7dy6VMb375WaTl05uaXEOB8NxWFhRhl1zNiUkV56WVtU/P4o1Ta3D/TW/Tdh4ij
         S8VGViA/xt2ECYA+t74/vUmt77YYUHBGwhZ56IBcpqUklv3NYDDGhHkN/ktNfo9iH0M4
         lBYxkmhdcaNsIt4kEnJssLyZd3frM/UwL+mSnmkzvztc72LsNEQbpAilLeTVOuhytj65
         2GDIYlDzlTV2em35Lhj1SdRqKFthpIVdfWOo/QaXSH9pL79gVQPXAMukSCZlcdQ6fiH1
         Z3eVM7Nho1r9BpixzZvFS66CFteTswUZfFh0w1rv4UqAH8fTYl3NCU+vhopWP9TmOSL1
         7ubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vSBsnGlk959thSozzz+sJPLc7aQCOLFJmGFeqcx443k=;
        fh=szM3HMcestpZ1LX6vsNCllYdSew+rCEmXE4QQzbCgA8=;
        b=HL3D6lQRY6rBDMMsxbIFFpGC43Cit98o54l1DocHt3zgADPdLIBJO0D8JUOwRCbBxK
         smCIPjyirH2eveE2MrK1G2I75DvX0fDx/ZKmHagF66Mmb8ZNVatbltQCoNL43Y6oBsmU
         1ufUWcmgtlJ26fotK1HoUsjwpkTKdo1y0e2YojBSsUa5YC8YF/LlFKS0wOh6JnyZE37N
         G8TNCKFvYmBqxP69pv2sn3fbDo+17efk4kVIzcnZOVTjU4JPlpdg0yNsuO5QHoz/P0m8
         oZem98V0GgboSZEMc7ae9V9uNh7/+l4sfwEJYVM3zHvSf9O8j4BCHxv0CMuXmNI6LKSU
         GaVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hpcMi23s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4395a04ecb4si8774535e9.109.2025.02.12.03.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:41:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hpcMi23s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiB6C-0002P2-0e; Wed, 12 Feb 2025 06:40:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiB68-0002Mv-KS
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:40:08 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiB63-0000ny-09
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:40:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso30763225e9.1
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739360400; x=1739965200; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSBsnGlk959thSozzz+sJPLc7aQCOLFJmGFeqcx443k=;
 b=hpcMi23suxG4FrX4wOWXSuiP8ZVnC4NZTDaGGOlBGfcvbfyP+43EWwUhpPZ7DCiNoN
 3bNRMUxhCDHKN0t0kpBc9kGFGAjvEV3mJ1v4pZMP9bs8ASkFzeEMXWMGEVZ6pJ3a/Fjq
 tJMdaSDwsTuujvvRz8cgoHFnC67rIruEI7IMJEgbazrWzGncGmpTRCmqCnZlESB87Wtv
 BOefD+rCEhSu61B+34KyVwSPTOsm5eoIHamuLfJavVBuvFkLwA2SdGeVjFoEX8agJrHS
 zXSHGgTX09c89mL7cUzy/nYc0w2FW2e9Wm+RgGwksMjk1AZchxp7WwJDZ/ZGeG4e+UVw
 fb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739360400; x=1739965200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSBsnGlk959thSozzz+sJPLc7aQCOLFJmGFeqcx443k=;
 b=xBWzjH7GeC1wHMboiBrGQbShm3IZEeCyF3HRCJS7JzihHUbXHIuYrengEuL3VwX1Qe
 +s9uBxWzz80eOWuPAMq99KtIkqtaUpRawZt0txGBD2k6fK1VCdbVV9h/UPG8ecR1ohMq
 UdzOdVKDD/oIgS0SBIp7eU5vj3xFJE6cvFZ9RWK19mG7qKPKs9oV+ybZRIKD32GuurYs
 e6imEBWMcjkpColUjUmh0Bg1ugTm6rTcxkQWYz+Ba0P93QM3zYQroM3vtMI8NIL3YthA
 w7eTiCzwo9xcxSjmPStfzGoYtu8YzBmYEdWGHMYbrhZFGxo/3y+0O72hksqStCe2SBY3
 rEFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJYuJxUD5QaeDdty+z3CL5Yvu8C2zdedIdIK/ePiye009bIq8sGE7B8iqS5M6wcAZOmCzbLkqPbg==@nongnu.org
X-Gm-Message-State: AOJu0Yzr389GBpxgwvpAv+jy1rwUcsFRjrpwLfsb6VmW5+UleSsD1RPs
 qr3q/DwlctLvEY7ZI4TeqWp1DbfO9Ye69mfLKcyYVE68smbCDZgUWteAMd6An3k=
X-Gm-Gg: ASbGncvtcEyV+GWFByXfcEOWlRjFS4jlqiP9rxe/hd1Rn1rCWbuJW1j/l4AyKotM9nW
 Yl+/lTtPrlA2GtFYNNDCD51GVD4wTCzkO+KSEp+ughDUT0/K2MHFC4r9jcoS9Mm8Qc3jzsizobi
 5ZCZIJKDb/Pe3/EE9ZA669gAoKeK1cds8kIpT7Gy8DavuNGRuvi3ju6qoaBERvBG6JTHeG8jzjj
 XRjjBg37cK3XJzOrWflcjndLQq6ULoJj/HPJAjn59vf1v8Ih3WslIZlQvvKuRGP6eIypbpvkjTj
 7Kf4C5DucLjj7O04UlTQrzVdqEzgmOyJ/fsO847vy1U6hY5lZ7ZEoy7Jw2TCvQk/wg==
X-Received: by 2002:a05:600c:46ce:b0:434:f4fa:83c4 with SMTP id
 5b1f17b1804b1-439581cb901mr28046955e9.29.1739360399833; 
 Wed, 12 Feb 2025 03:39:59 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcf416619sm13810127f8f.38.2025.02.12.03.39.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:39:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Burton <paulburton@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH 4/5] hw/pci-host: Mark versatile regions as little-endian
Date: Wed, 12 Feb 2025 12:39:37 +0100
Message-ID: <20250212113938.38692-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212113938.38692-1-philmd@linaro.org>
References: <20250212113938.38692-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: HLjDkRQosXFw

This device is only used by the ARM targets, which are only
built as little-endian. Therefore the DEVICE_NATIVE_ENDIAN
definition expand to DEVICE_LITTLE_ENDIAN (besides, the
DEVICE_BIG_ENDIAN case isn't tested). Simplify directly
using DEVICE_LITTLE_ENDIAN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/versatile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index c3fbf4cbf94..33a8ceb3b54 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -246,7 +246,7 @@ static uint64_t pci_vpb_reg_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps pci_vpb_reg_ops = {
     .read = pci_vpb_reg_read,
     .write = pci_vpb_reg_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -312,7 +312,7 @@ static uint64_t pci_vpb_config_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps pci_vpb_config_ops = {
     .read = pci_vpb_config_read,
     .write = pci_vpb_config_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static int pci_vpb_map_irq(PCIDevice *d, int irq_num)
-- 
2.47.1

