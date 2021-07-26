Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3034620lfc;
        Mon, 26 Jul 2021 09:34:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHMqpNnii1bMGU0c5nv89iK36wSkAZNUer+bOwogI4zgaWDi1h1hWXBiZ20AD4YT+IksAL
X-Received: by 2002:a67:e891:: with SMTP id x17mr8911175vsn.7.1627317244807;
        Mon, 26 Jul 2021 09:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627317244; cv=none;
        d=google.com; s=arc-20160816;
        b=dXiXLaVK92XRWi/UbauC856q8y30ZfJ3Hkdf6f9g8zaL5GHwOuuLI/UYyqrqjJuz9S
         EfzUW03nDld5CsQkBw4zFbE46DyosO66Z3PVQl06tkNMkXE/u5taCF+WNjEZh7Fi6fMq
         l71hs0dm8wm6SNiRYmR1dznhkjxl/XQcT6BRIi1E4PRXVN/Bc2UBq+bzgs6k+hx5VkDA
         4eypN93WMj9XAcIkaQFBjVXuCGS/KkJdF0XneAIeq8HhCzgmJdV5lf+7TXAxXrMc1L/X
         l3tBo66eAfaoqKona8UmKnN/wJY+RAjMYeybMnoNo0RgvDWuXnfM59yHTrYZ+2sHerPg
         hq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=WpXLmn65XHv7xnK6Qk1mytWSngxvajkN43MTrCt/aqU=;
        b=lFSaFM7vuFp6j/cA55KLjtCIK6jU8lJ41kbGWGO0Xi21tseaxW9ihnq1yElcBe2AUi
         rj5j2sX4Qck7QLabzX2zDzdk07aPKPDuAGSjghmYwr45+eOkvcrxRbEKip6NWE/UA+gC
         LDh9Gj88lCvzsvhkJjBvb5uvd5DnYY5XuhK+Cptd7JPZArE51fI5YQ8OZMpJt0QinMyB
         ehbxp/J4xFOBYeqHTMdTV4sTbpR2NNw/J3lbMjyVn7uhBPHXffLn14pjFzvIjwYSMNux
         XdYcCVQTTSvUnfiaJjUzk2MCLFIoUfj0siYcu0BjHCn83OkqWcXaCeRCDJmQXEKY3wky
         dqhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gio1lCja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si279762vsh.362.2021.07.26.09.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 09:34:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gio1lCja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m83YK-0002GG-5Z
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 12:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m83YC-0002G0-Ke
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 12:33:56 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m83YA-0005DF-Nc
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 12:33:56 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n12so8279956wrr.2
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 09:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WpXLmn65XHv7xnK6Qk1mytWSngxvajkN43MTrCt/aqU=;
 b=Gio1lCjaQKSvg96OzbsskFO8sxCY2sVOtqq2WfUkQEVxOZ4wkKuhJkEGSz2Ej8k+5h
 zACkv1LYG6ON98u6+2fM2Z46xczPvKuR+KA1QpunOrumgdciPW+7uMt/PhasCaptDlvt
 ZZr4J3O7MulsLx4xiVUKVuNizCwfGqeqleKV9M7SVwj1uLKEUeP+yL3bTpHrToRFFBso
 8obde575imadhUIUnozaQrlxKLQ8BOmWJ6049zD69b8rE9aaqgJIfFTOSxMl8hHDLd/H
 iYj7Vt1n5uVElbV1hNbtQzE0zTa3kx8l1JJ5eyEOWlyINw4u0s31OnlWAsu0FVB6vBll
 FOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WpXLmn65XHv7xnK6Qk1mytWSngxvajkN43MTrCt/aqU=;
 b=Lc6HQ9A13gXBOGDaOCP8p72Pfmv12Rm0eXTTkR1+OpMRDVxTTLeg1ElWRdKod78LNM
 ZoqkQ4ARwGd9F1hQ4Uq/bxgMKYvaSE29jdrp3xTkQoTzCjU16HNqkZULg3Vt4F/F8ITA
 LbQ5w5rYrRjziL56N2AFmRBRPShd/7kGne9Vqq5/HB+qMYIJz4uWLT82WgE2Kzhr2xFU
 wK83+oP1A+7W/pIjFcg7tmnMOaE7s9+pqNYJuLvpEzOw9G68FZOpN6dDXf/UHbSaFifR
 PwP3fUEdVoie5sMhuKavM8ZDv7drhipKUvo28bNsd4Lkit+bXgCu55Fmkdnl5gMf5XPa
 gYHA==
X-Gm-Message-State: AOAM530Q9bk4s8Kcz4KUKnQTgSjp0QtNPuiMkL4IXEY6UdxfA6FAVY2t
 hAeS1wGl328doJ50tT9N1e9l7xgEIyQlzg==
X-Received: by 2002:adf:f282:: with SMTP id k2mr7096392wro.183.1627317233150; 
 Mon, 26 Jul 2021 09:33:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q5sm339930wrx.33.2021.07.26.09.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 09:33:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1] hw/arm/boot: Report error if there is no fw_cfg
 device in the machine
Date: Mon, 26 Jul 2021 17:33:51 +0100
Message-Id: <20210726163351.32086-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NuraF0QZnCXH

If the user provides both a BIOS/firmware image and also a guest
kernel filename, arm_setup_firmware_boot() will pass the
kernel image to the firmware via the fw_cfg device. However we
weren't checking whether there really was a fw_cfg device present,
and if there wasn't we would crash.

This crash can be provoked with a command line such as
 qemu-system-aarch64 -M raspi3 -kernel /dev/null -bios /dev/null -display none

It is currently only possible on the raspi3 machine, because unless
the machine sets info->firmware_loaded we won't call
arm_setup_firmware_boot(), and the only machines which set that are:
 * virt (has a fw-cfg device)
 * sbsa-ref (checks itself for kernel_filename && firmware_loaded)
 * raspi3 (crashes)

But this is an unfortunate beartrap to leave for future machine
model implementors, so we should handle this situation in boot.c.

Check in arm_setup_firmware_boot() whether the fw-cfg device exists
before trying to load files into it, and if it doesn't exist then
exit with a hopefully helpful error message.

Because we now handle this check in a machine-agnostic way, we
can remove the check from sbsa-ref.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/503
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I didn't reuse exactly the same wording sbsa-ref used to have,
because the bit about loading an OS from hard disk might not
apply to all machine types.
---
 hw/arm/boot.c     | 9 +++++++++
 hw/arm/sbsa-ref.c | 7 -------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d7b059225e6..57efb61ee41 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1243,6 +1243,15 @@ static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
         bool try_decompressing_kernel;
 
         fw_cfg = fw_cfg_find();
+
+        if (!fw_cfg) {
+            error_report("This machine type does not support loading both "
+                         "a guest firmware/BIOS image and a guest kernel at "
+                         "the same time. You should change your QEMU command "
+                         "line to specify one or the other, but not both.");
+            exit(1);
+        }
+
         try_decompressing_kernel = arm_feature(&cpu->env,
                                                ARM_FEATURE_AARCH64);
 
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 43c19b49234..c1629df6031 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -691,13 +691,6 @@ static void sbsa_ref_init(MachineState *machine)
 
     firmware_loaded = sbsa_firmware_init(sms, sysmem, secure_sysmem);
 
-    if (machine->kernel_filename && firmware_loaded) {
-        error_report("sbsa-ref: No fw_cfg device on this machine, "
-                     "so -kernel option is not supported when firmware loaded, "
-                     "please load OS from hard disk instead");
-        exit(1);
-    }
-
     /*
      * This machine has EL3 enabled, external firmware should supply PSCI
      * implementation, so the QEMU's internal PSCI is disabled.
-- 
2.20.1

