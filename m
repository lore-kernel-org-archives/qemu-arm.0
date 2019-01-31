Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6751361wrt;
        Thu, 31 Jan 2019 03:25:59 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7I102YE/zy+EF+xI+j1H1wn3i1SXZl6yM6lGXDewOcBKB7AtgN59PttvKztgMt7Mp6itlP
X-Received: by 2002:a81:4842:: with SMTP id v63mr32312126ywa.455.1548933959366;
        Thu, 31 Jan 2019 03:25:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548933959; cv=none;
        d=google.com; s=arc-20160816;
        b=RhaT+BKQFKYIAcyeVjTA3od/T1dC5Wy9zK9xaH57o/W2bWqYRVYdYoiF24h+Qv2MDD
         kjMtpCn4aGP6WXzo8e7NKin+m10shORPbq8u7xlbFCCdpZ/QmltbeJ8jBKgi8Ya/jPdG
         qft6LNrkO3ow9sLi1/diaDxwjHr6222U7CGs5KRbL6wHQmG9LgvvGbrToWsd4GDY39Ns
         /WpqnGHIAneA/5UQjggvY/cZjs5WvLGxt7IyZxztZ5BrO0BQaT/4r4VkA/UfSjHjA7Y9
         Wj6iXlhP//WTZdQdIDMuFUGLKPv0jHUGdo27mouLs1VSS2xMIWXBjBSWlcJj1NdfKQAL
         6xsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=JZc4mzY6BBahixnef7uoEzgPeqRX5DM7n3dLcUh9HJI=;
        b=dBUDZQpKcbNK3rqvAQjB5p7qUx8WTy/nWkx69kNzC5sCu9M1H3eYCm9cl0I+tTqB3n
         pWthw87gICp0R1ODyqDFM5Mzc8IAFIjVKz6MiYHJZdEkmKm9/fwKx+MOpMR3YohpRwyw
         37VJC1AfUxyTIVDMzvqmjoB3Ubi4e0m9fKAruIK9fnBfK4XBG2gSuJQFHbflVtEeZf7D
         AqApZkSzYCpJu690PSPcRi+99niGXCli07RXnCMu9q/WSyLhbmjk6JeILoK50Yob7WES
         cCDr75tE0PY4yT5lEdc6t3RtHGzwh/K6P5Hf0Lhc9oZsPEjKOE+WhxCV+4Bh41wP2LG7
         OOPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QMRTsi3T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d63si2434421ybf.111.2019.01.31.03.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 03:25:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QMRTsi3T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpATm-0004aC-R9
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 06:25:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQj-0002Em-Bo
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQi-0008DY-H6
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:49 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpAQi-0008D3-Ac
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:48 -0500
Received: by mail-wm1-x341.google.com with SMTP id y185so1866735wmd.1
	for <qemu-devel@nongnu.org>; Thu, 31 Jan 2019 03:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JZc4mzY6BBahixnef7uoEzgPeqRX5DM7n3dLcUh9HJI=;
	b=QMRTsi3TgcYgWepaE5Z6kPYRCz6uSV8Ge0pI7DslM0/rfpxMNwGZ3/kT5IOk0WqwGs
	Q2IDvSt0zhvB551jHJFnk+nFyv1lT1QcTGo6uBaZQ4jpjVnHfacsHD+BooxDj9WtgVYn
	H5UiY1newIHrzVytdMPkK9NmKYXQGxRpBF8Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JZc4mzY6BBahixnef7uoEzgPeqRX5DM7n3dLcUh9HJI=;
	b=erPX0DutU2cmVzntsyxsO7fgvpOsUbIDEbFd24xdPHO1q7fnif3ivYKhRIW0d6IBVn
	rYy0/gxowQ4CN3E5ukzfUWeVvNUojt2btxqYcYJzeIIHvSjAz/t+F/Waier9ORugrHvd
	iCMOHw98N5gqC5D2ClBsUgjZyumfrXCJvLm6PYVrPnLXroaFTI/aToPpHyXGfXtug5jv
	cT9MAjuXIL2+GfRBjHb3r9FLXfzpZtXWSk8iFbfja+TOe1319ND2XurwdXA99houc0AF
	PbiFTVcEWYGOmykQginik+9zPV6e+mZEGrpT6f8qQjhbzR+U5VvZk0cD+xb/LPsIdlZ9
	kR1w==
X-Gm-Message-State: AJcUuke3ADnDusf9ckX0iWZHtodxAZBzzXuHXEeu77xOKrvGzMD6zyHM
	/efIQLdz6h1BOegrMqD3rvNXYg==
X-Received: by 2002:a1c:47:: with SMTP id 68mr27850125wma.89.1548933767383;
	Thu, 31 Jan 2019 03:22:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id c8sm4078173wrx.42.2019.01.31.03.22.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 03:22:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Jan 2019 11:22:38 +0000
Message-Id: <20190131112240.8395-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131112240.8395-1-peter.maydell@linaro.org>
References: <20190131112240.8395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH 3/5] hw/arm/boot: Factor out "set up firmware
 boot" code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mO+/RQ4m6Gbn

Factor out the "boot via firmware" code path from arm_load_kernel()
into its own function.

This commit only moves code around; no semantic changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 92 +++++++++++++++++++++++++++------------------------
 1 file changed, 49 insertions(+), 43 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 108e9b979f8..a2e724ac68a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1142,6 +1142,54 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     }
 }
 
+static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
+{
+    /* Set up for booting firmware (which might load a kernel via fw_cfg) */
+
+    if (have_dtb(info)) {
+        /*
+         * If we have a device tree blob, but no kernel to supply it to (or
+         * the kernel is supposed to be loaded by the bootloader), copy the
+         * DTB to the base of RAM for the bootloader to pick up.
+         */
+        info->dtb_start = info->loader_start;
+    }
+
+    if (info->kernel_filename) {
+        FWCfgState *fw_cfg;
+        bool try_decompressing_kernel;
+
+        fw_cfg = fw_cfg_find();
+        try_decompressing_kernel = arm_feature(&cpu->env,
+                                               ARM_FEATURE_AARCH64);
+
+        /*
+         * Expose the kernel, the command line, and the initrd in fw_cfg.
+         * We don't process them here at all, it's all left to the
+         * firmware.
+         */
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
+                             info->kernel_filename,
+                             try_decompressing_kernel);
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
+                             info->initrd_filename, false);
+
+        if (info->kernel_cmdline) {
+            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
+                           strlen(info->kernel_cmdline) + 1);
+            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
+                              info->kernel_cmdline);
+        }
+    }
+
+    /*
+     * We will start from address 0 (typically a boot ROM image) in the
+     * same way as hardware.
+     */
+}
+
 void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
 {
     CPUState *cs;
@@ -1169,49 +1217,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
 
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
-
-        if (have_dtb(info)) {
-            /*
-             * If we have a device tree blob, but no kernel to supply it to (or
-             * the kernel is supposed to be loaded by the bootloader), copy the
-             * DTB to the base of RAM for the bootloader to pick up.
-             */
-            info->dtb_start = info->loader_start;
-        }
-
-        if (info->kernel_filename) {
-            FWCfgState *fw_cfg;
-            bool try_decompressing_kernel;
-
-            fw_cfg = fw_cfg_find();
-            try_decompressing_kernel = arm_feature(&cpu->env,
-                                                   ARM_FEATURE_AARCH64);
-
-            /*
-             * Expose the kernel, the command line, and the initrd in fw_cfg.
-             * We don't process them here at all, it's all left to the
-             * firmware.
-             */
-            load_image_to_fw_cfg(fw_cfg,
-                                 FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
-                                 info->kernel_filename,
-                                 try_decompressing_kernel);
-            load_image_to_fw_cfg(fw_cfg,
-                                 FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
-                                 info->initrd_filename, false);
-
-            if (info->kernel_cmdline) {
-                fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
-                               strlen(info->kernel_cmdline) + 1);
-                fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
-                                  info->kernel_cmdline);
-            }
-        }
-
-        /*
-         * We will start from address 0 (typically a boot ROM image) in the
-         * same way as hardware.
-         */
+        arm_setup_firmware_boot(cpu, info);
         return;
     } else {
         arm_setup_direct_kernel_boot(cpu, info);
-- 
2.20.1

