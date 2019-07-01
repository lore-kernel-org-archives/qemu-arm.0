Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2654269wru;
        Mon, 1 Jul 2019 06:27:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzOWpQz5ckZdhIpqf/vC215O0y5ycVv1Oa7QYv5V+jVOkxdcP68F5HkdW3G9ONO22dkncAb
X-Received: by 2002:ac8:1c54:: with SMTP id j20mr20128052qtk.158.1561987630871;
        Mon, 01 Jul 2019 06:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987630; cv=none;
        d=google.com; s=arc-20160816;
        b=n00yzSU0B2ZD+vPBAEg+niUvWNJV9G+3isNZbfZTB48Y83KFjkxtAwQBCDuaeqs8i0
         YORV3CdmX7L9fyicGSzWwfFSEWy6ie1+9bG1tZAQIc+54C1z2QiPPi4C/JkjBhjid+/u
         VA9SDbO+nHLI5Hvn0TwCm5Iom2/ZwtOQR6Cm4LznEXRp0zsg4UK8LkZHMYc0O9s8oJfD
         bea51JLwlP9bXr/X+qwIaKbcn8Lb7MJsxD7edbnjGKNrcnnM2JG+UilWSEl5OYuUmiW8
         w/1cSYCY+ZOXs3T19AM1cxi6iMChYKNEqHPiRtw5ozg4yEKHFo/ZujtkjcL4s8U8glaR
         wUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=tC6l0BpdN4qImVRJN3KPrxi8LhbTHU5soQaGD/427gA=;
        b=pEEBqTIbn3I0eiu6iSfIIVp8m34dCZOgJXGBnZxKrJ1AXn0VXBm0sq8Tp5K7p5lQpw
         2Hw8KZlwbvJb4chV9gbL4IsUP6aGH8zuwRf5lP9aPhPmgzLhKIQEEekXUBKDSKX6n4Br
         swGu4SHVobdbn0eax65iHXFccKMhMsliIgREsoAvivilN/9EoWGAvKC0L0+w8Pp76PVs
         mSrYntJUfVCnYWGcl4GiiJls0IEAb32Sc3xlWFAfFOzNDiYBDMymaicMS72/Ym31Agg7
         mITLj6E4sa0CP7WYVEfjNUH1RZW6D5qVkw2DiOmSrW+yqevOj1Iop06vJ2TCyOIHicOD
         6LTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r28si8328676qvj.85.2019.07.01.06.27.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 156BC316290C;
	Mon,  1 Jul 2019 13:27:10 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ABB76085B;
	Mon,  1 Jul 2019 13:27:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH v3 26/27] target/arm: Do not build A/M-profile cpus when using KVM
Date: Mon,  1 Jul 2019 15:25:15 +0200
Message-Id: <20190701132516.26392-27-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 01 Jul 2019 13:27:10 +0000 (UTC)
X-TUID: yHvJi9EASiEx

A KVM-only build won't be able to run A or M-profile cpus,
disable them.

If KVM is not enabled, they are enabled by default.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Sadly this does not work with --enable-tcg --enable-kvm dual config.
---
 default-configs/arm-softmmu.mak | 14 ++++++--------
 hw/arm/Kconfig                  | 16 +++++++++++++---
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 081d507c87..3995c4bb65 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -1,25 +1,18 @@
 # Default configuration for arm-softmmu
 
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=y
-
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
+CONFIG_ARM_V7M=n
 
 CONFIG_ARM_VIRT=y
 CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
 CONFIG_FSL_IMX31=y
-CONFIG_MUSCA=y
-CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
 CONFIG_VEXPRESS=y
 CONFIG_ZYNQ=y
-CONFIG_NETDUINO2=y
-CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_SABRELITE=y
-CONFIG_EMCRAFT_SF2=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 CONFIG_SEMIHOSTING=y
@@ -38,4 +31,9 @@ CONFIG_SEMIHOSTING=y
 #CONFIG_ASPEED_SOC=y
 #CONFIG_NSERIES=y
 #CONFIG_HIGHBANK=n
+#CONFIG_MUSCA=n
+#CONFIG_STELLARIS=n
+#CONFIG_NETDUINO2=n
+#CONFIG_MPS2=n
+#CONFIG_EMCRAFT_SF2=n
 #CONFIG_MICROBIT=n
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9320509979..1724c21ece 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -13,6 +13,18 @@ config ARM_V6
     depends on !KVM
     bool
 
+# ARM Microcontroller profile
+config ARM_V7M
+    default y
+    depends on !KVM
+    bool
+
+# ARM Realtime profile
+config ARM_V7R
+    default y
+    depends on !KVM
+    bool
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -281,9 +293,6 @@ config ZYNQ
     select XILINX_SPIPS
     select ZYNQ_DEVCFG
 
-config ARM_V7M
-    bool
-
 config ALLWINNER_A10
     bool
     select AHCI
@@ -309,6 +318,7 @@ config STM32F205_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    select ARM_V7R
     select AHCI
     select ARM_GIC
     select CADENCE
-- 
2.20.1
