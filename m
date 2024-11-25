Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569355njc;
        Mon, 25 Nov 2024 11:59:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVDrMeMJwvqygAAhCvu1+tpcBK7TwAeR9+z4oRVk5IOmIlx7NxsoYTmO4V6C06zCCTmuBBIAz7O5KeV/A==@linaro.org
X-Received: by 2002:a05:600c:1f0b:b0:434:a39b:5e43 with SMTP id 5b1f17b1804b1-434a39b5ee4mr13324435e9.8.1732564775311;
        Mon, 25 Nov 2024 11:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564775; cv=none;
        d=google.com; s=arc-20240605;
        b=aSCQ/uwmF2s+qxVw/DzOxTEyPSmmXHmfWc47w/vCyDt3YOP5DWq1OnyOLucX0BUqjH
         0ngLM4DDH/bzdYSH8FlPhs1dE61I28F6XuXLomH8pqhKvZJJdiKfKUF7TiQ/XRLxyO+q
         4rJC2SFMvdX7XSsuFBPWvJU+NW8ftZfG/K+yKUItG58wuCSBmz36dGChW6elfnd/+dzA
         c/qvpi72lyZC9yIZ05P3aUM3Nd0jP1wzLE3TamM4jDRK9K0XKevL90E6nLkN33ST30XT
         NWQIbJyKm8DESa0BVC0dqpRPrqx0l1HykAzNsllmf8wvdLuLvP4XtMU9aFrHMTQFy5Tk
         X/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=a59XHnG8h+nIeFzh80GUuHguY0Zka09dW1/TbkEKxDk=;
        fh=h3MDKDceNHm83+Aauqg8YHJJAg/bR7nDPMooXpqL29g=;
        b=Rw1FrGM3EkicjJQOEk0jACCiHI03uwZffdlvmz2/w0cuYYt2BsyzEuqAAoucObwQZ8
         A2jgmm8ggPeBNiIZ54X9t1NoW+VSazMpa7TKs3kRA6jXSaByRPQRx6nNJiNMLsdIotJD
         i6i7jZzDYafso8+wn1nH7DgG/K49sOyBGjM+UhWK+aaTocH2lqQIA0ohecLb+2iiXOZi
         8wvfX7pOZaURFmry7AusskqthW8e1/2lxOJY5CC9CT/4ECCYL3K5Ty1yg+4LQ6zbRK9o
         x1e72qSdPrHhJl6r9oz8dJOv39q0IhCtH2+xH2WatDIQbO46OwBpJhy3oUQdtXJR84Rr
         3okA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wI+nbZfL;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434898a5f8esor30619365e9.0.2024.11.25.11.59.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wI+nbZfL;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564775; x=1733169575; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a59XHnG8h+nIeFzh80GUuHguY0Zka09dW1/TbkEKxDk=;
        b=wI+nbZfL9mDnUoRHcmMSjbvpLBf1TcxkEfiEw0UnoOzSezABvf3+GgOnySLb+68G67
         Gw8Dggsj33JtFNmZrzPIRdPoeEaeWG+if22ZeDUOT0wlK7ZTjAj3RzlDaTCzYZJGPw54
         1ZmjKwmkltY57AZ3Xpd0Sfqp3gYCLkTWGiJdyp9Wk1pFoGJ9X567ssrieS3xDD42aUM7
         R+0XXnWWXwcs8UN46kHdWeHRn+URGBC+zoFJcZYjfMXSSzC3QK9ExiQdpbGcBhH2vo9m
         iK53LEMMzLmqULEN62+zWIMf2TWqT10ZeGGAVyrwJZTMOPtny76BR7ZofdYwXbpsMqe/
         rdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564775; x=1733169575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a59XHnG8h+nIeFzh80GUuHguY0Zka09dW1/TbkEKxDk=;
        b=gq6sPsxn9h4rkOwzS6QEisF31MQ2LKRPHtJqVOtfGI/KMtpW7QC3l5ItA/2ff0807D
         Co3dr1VC4UL5bBJOgQ6DBJ39om3TsmrzipkfAeoATj6W604moBU2rJTzyzoXVH617qR3
         m/DiaoK5TGb2njrqnRc3V2wSPZe1aHgeLliS765cNijipTHajG1FSgMcYSB10gHuCQoS
         f8ezj75+LvSkA192EE8HvbSB6ctveFC/pkTXrJ0XZs9XzwyYPdh9XHv/Iqbol7KlbMgp
         hiZK2HaGXy6FmZIfqhUHKTN3DXGjljWdwGdr9vVyK4IKNNHe7fWNRZZvyS4BPANkQ0oY
         uk5g==
X-Forwarded-Encrypted: i=1; AJvYcCUIDbnsDU/dIZl6t6kIc/jH7v5AqqE43iZxFV6ZO6+65l6aqXsZiVpZQcSl4ot0PCIIEa1v2QHeGnH8Lg==@linaro.org
X-Gm-Message-State: AOJu0Yy1zmES8MkFSrSzk7joe/P2HyDGzgXrMjr8LwkNGN7MRo5+d1Xo
	6p5kkEgVGxdiEUZcj5TdShEt4Hx4DNJyNepnHiZdkemm6O2qIqGaJs9MLkBx/HoXmQ==
X-Gm-Gg: ASbGncvm/IFPBG//5uDWolzrNpOwvzf03qkyQQXEnmBamzkmP+4bNKwZsG/lrNDB2fK
	rimhMlzBtVPnWsxBvicXtHQFy2SQC9cIVisIDd46uXd/R7I3a1VM7mlAqimsGQBsaCBydk00q+2
	ETWp7dvrJIWX8o3qNLnW2FIFqi3tVFn6X5sX4YJeJJWyoRXYcbpZXlYnmMZCrIe+yZv+3gxLh0a
	GhUPYu/AuV4MAYsguqYmvNtF7z4eYfdqFsTtbYGG4ssfrkMlqqYDL//LpU5qoeJ2xuh
X-Google-Smtp-Source: AGHT+IHw3piCsY1SYgCrnqKdV96wffE5D/aAxPSvz1IACBcKd/oVvMDVzCGHC+uO8C/BpUQCIXl+JQ==
X-Received: by 2002:a05:6000:184d:b0:382:4b5c:419d with SMTP id ffacd0b85a97d-38260b878e1mr11702601f8f.28.1732564774795;
        Mon, 25 Nov 2024 11:59:34 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:34 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 18/26] hw/arm/boot: Mark all guest memory as RIPAS_RAM.
Date: Mon, 25 Nov 2024 19:56:17 +0000
Message-ID: <20241125195626.856992-20-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: AE+MbPRNyiPL

All Realm IPA states are by default RIPAS_EMPTY, and accessing them in
that state causes injection of synchronous exception. Either the loader
or the guest needs to set IPA state to RIPAS_RAM before accessing it.
Since a Linux guest needs all memory ready at boot [1], initialize it
here.

[1] https://docs.kernel.org/arch/arm64/booting.html
    https://lore.kernel.org/all/20241004144307.66199-12-steven.price@arm.com/

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3: New: the Linux guest does not initialize RIPAS itself anymore,
and expects the loader to do it.
---
 hw/arm/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 5301d8d318..a2414b1f98 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -26,6 +26,7 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "kvm_arm.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
@@ -1238,6 +1239,9 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
     info->dtb_filename = ms->dtb;
     info->dtb_limit = 0;
 
+    /* Mark all Realm memory as RAM */
+    kvm_arm_rme_init_guest_ram(info->loader_start, info->ram_size);
+
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
         arm_setup_firmware_boot(cpu, info);
-- 
2.47.0
