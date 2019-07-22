Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7014668wrv;
        Mon, 22 Jul 2019 08:18:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLREE1SF5gQ4KfCo8/Be+MJGrmadI9I0Fx0Eo6dyUlfKZ/IVRkN5nWGiac/lzBAMZQHSFD
X-Received: by 2002:a05:6402:3d5:: with SMTP id t21mr60681936edw.13.1563808732562;
        Mon, 22 Jul 2019 08:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563808732; cv=none;
        d=google.com; s=arc-20160816;
        b=OsQnIJkWGsq+gguEfSnhVNhmE6s3h/gS+GZm6RtzFFiaDWVgjILfXvhQokQ6QVwfZ1
         qF2uOQTBMK6gjZUZ7hHwtIhdARBLalGciXiudF9ZdTuH6q7dWkJ13tr7IXdrvhXqT+nI
         f9zE1biyzpdIUPnVPvn6Aq48ROUuhWQY+zX9YAtLE2kZoVIJxQFFD1hWyfkMtFXWigZW
         Olz5AnZSUaTwCkoTjmSv3NSVWRA3336Zg6/RA5t1wdoaEHJwH5b/VPeYS+zfnhYbof9I
         Tofg9u5bO1c38JLBd9vYyD7K7eXOjDPxr9d4XAGuV34pFl/KhViKOTVOlSzQMrNVmHKP
         UI6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=/NdFL2eE2NyzoRO+IY8mz8AvTFGhq77kL34oQBTviGk=;
        b=aH0KRt+JEziA98ggatwDPaIQYwzqcpfPURBSb/UFhBE1U/g53RvtEk7o8kia2GoqC/
         Yjze3FUiOuPuRl7Qv3sshrMfWBFjfpY3iV26PLx5Dq8PvLjA/DN8wr99qzVGaa1jkpbG
         RdmwPlcYpVJdyyLKFdjzW+sWZUFkVUNg1ZS9MTWHRUvSG+fKbznRSGBS1Xt7DIF++Mzn
         b9jYigRBJqVFQ4WLIJaUQV0eP9l/dwh1Tse8cPdmfkjks+x3nXnE8rsT/sXHB6NCxRWm
         L6lvigSzzvUHs6Zu8jAPJ6a/i2sJWzJ5Fq7iv83CE2+afm4je+mEigxHvvS6GaltDIYc
         LZ/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BrRpNOVk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j42si5284320ede.285.2019.07.22.08.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 08:18:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BrRpNOVk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpa5S-0004AX-UI
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 11:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46799)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hpa4p-0002hx-HQ
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:18:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hpa4n-00023n-Vu
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:18:11 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46649)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hpa4n-00022p-QE
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:18:09 -0400
Received: by mail-wr1-x443.google.com with SMTP id z1so39811622wru.13
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/NdFL2eE2NyzoRO+IY8mz8AvTFGhq77kL34oQBTviGk=;
 b=BrRpNOVkaPV255ZFUuGNIc2CvIAdZCFUs1NNvj1jxSUbQ0L+t2VIuxoeRs6RKbnyrB
 agA3oOzPSv5R8XrpJobB9Lt/M9Ket+8LXU785yh8e9ZPaBWPlydBv++PV3rX6EggIIog
 SVkE6/aVoe5v8UEybIAu0dXDICHnTg+pg/aaRV+C1Xq/ByCgdKpS6qFbLhmFuo+HPh+i
 yEPEwK3EP4uKymXXCnrXCdXwbURS6t8a9/+nIS6hVZqGXxiudm8Z8n9JJFiwoD0A27pV
 K0xP1O0ZMvBMCwxsGOyCQSSj6LkZU71FlwZ6lC1JePC72Pasfhv8vBLEkz2jxFimIl5j
 A4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/NdFL2eE2NyzoRO+IY8mz8AvTFGhq77kL34oQBTviGk=;
 b=GxdwxDX6C6Z9vCvG0hnP0iTWIB4CaPvwujV0dtQYgZxmr9pFVETTUNLea2LbR9EqaM
 CptoKI4rvLJFoZyRJF3FNgK4gg9kHjz/NpSSlDqceSxyNC1+Cy/imXxgotqyZnIW0gJH
 ET/zqpk3q8fgXsatmuzy61wZskomYPekkiEmLie4SyM+3EMe8EVySWp95CBiIqCsyA6O
 Ru3KvmBXdFbmI5SF1zuvbVchwaIoQnxSl1l1Ds0i251Sv/GWC0el1I0bMz/tEHwEGtGM
 ENhnCSWcOErWDqyPi5R7y2vzzg1iyhHYyK8Iwf6zdyBFidjXpCAb62XNiA+U1g2ayPdE
 UmGg==
X-Gm-Message-State: APjAAAWiAHdPR/b9HD3zbrcpU6qUk0/YnSfS+fb1vT7I2drYbI/D/Mvl
 /vl3iW2uehgbTpoYyB3Phe9022Qi7VyiaQ==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr75043000wrs.105.1563808688874; 
 Mon, 22 Jul 2019 08:18:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s15sm23163990wrw.21.2019.07.22.08.18.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:18:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 16:18:04 +0100
Message-Id: <20190722151804.25467-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722151804.25467-1-peter.maydell@linaro.org>
References: <20190722151804.25467-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH for-4.1? 2/2] hw/arm/boot: Further improve
 initrd positioning code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VlC4ivc+SJ5V

In commit e6b2b20d9735d4ef we made the boot loader code try to avoid
putting the initrd on top of the kernel.  However the expression used
to calculate the start of the initrd:

    info->initrd_start = info->loader_start +
        MAX(MIN(info->ram_size / 2, 128 * 1024 * 1024), kernel_size);

incorrectly uses 'kernel_size' as the offset within RAM of the
highest address to avoid.  This is incorrect because the kernel
doesn't start at address 0, but slightly higher than that.  This
means that we can still incorrectly end up overlaying the initrd on
the kernel in some cases, for example:

* The kernel's image_size is 0x0a7a8000
* The kernel was loaded at   0x40080000
* The end of the kernel is   0x4A828000
* The DTB was loaded at      0x4a800000

To get this right we need to track the actual highest address used
by the kernel and use that rather than kernel_size. We already
set image_low_addr and image_high_addr for ELF images; set them
also for the various other image types we support, and then use
image_high_addr as the lowest allowed address for the initrd.
(We don't use image_low_addr, but we set it for consistency
with the existing code path for ELF files.)

Fixes: e6b2b20d9735d4ef
Reported-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b7b31753aca..c2b89b3bb9b 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -988,7 +988,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     int is_linux = 0;
     uint64_t elf_entry;
     /* Addresses of first byte used and first byte not used by the image */
-    uint64_t image_low_addr, image_high_addr;
+    uint64_t image_low_addr = 0, image_high_addr = 0;
     int elf_machine;
     hwaddr entry;
     static const ARMInsnFixup *primary_loader;
@@ -1041,17 +1041,29 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         uint64_t loadaddr = info->loader_start + KERNEL_NOLOAD_ADDR;
         kernel_size = load_uimage_as(info->kernel_filename, &entry, &loadaddr,
                                      &is_linux, NULL, NULL, as);
+        if (kernel_size >= 0) {
+            image_low_addr = loadaddr;
+            image_high_addr = image_low_addr + kernel_size;
+        }
     }
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
         kernel_size = load_aarch64_image(info->kernel_filename,
                                          info->loader_start, &entry, as);
         is_linux = 1;
+        if (kernel_size >= 0) {
+            image_low_addr = entry;
+            image_high_addr = image_low_addr + kernel_size;
+        }
     } else if (kernel_size < 0) {
         /* 32-bit ARM */
         entry = info->loader_start + KERNEL_LOAD_ADDR;
         kernel_size = load_image_targphys_as(info->kernel_filename, entry,
                                              ram_end - KERNEL_LOAD_ADDR, as);
         is_linux = 1;
+        if (kernel_size >= 0) {
+            image_low_addr = entry;
+            image_high_addr = image_low_addr + kernel_size;
+        }
     }
     if (kernel_size < 0) {
         error_report("could not load kernel '%s'", info->kernel_filename);
@@ -1083,7 +1095,10 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
      * we might still make a bad choice here.
      */
     info->initrd_start = info->loader_start +
-        MAX(MIN(info->ram_size / 2, 128 * 1024 * 1024), kernel_size);
+        MIN(info->ram_size / 2, 128 * 1024 * 1024);
+    if (image_high_addr) {
+        info->initrd_start = MAX(info->initrd_start, image_high_addr);
+    }
     info->initrd_start = TARGET_PAGE_ALIGN(info->initrd_start);
 
     if (is_linux) {
-- 
2.20.1

