Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3004399wru;
        Mon, 1 Jul 2019 12:50:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQhasW9aPP8OhJyurmBZY8jJcuDQCWBsVIWCHNjk5j3LfAjKX1w/O/rwKK7mg/wGknB99T
X-Received: by 2002:ac8:22db:: with SMTP id g27mr22390574qta.221.1562010627537;
        Mon, 01 Jul 2019 12:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562010627; cv=none;
        d=google.com; s=arc-20160816;
        b=GGbpH6fUZwePJmkwgiPMe07hJ5r35LGAuoYtGLd9EM/BwiHajL28GrMTso8nXb8eqa
         z6nsg2UIATs6stobk0qa7W7E+yf67aO0r6soUqrZy5tuNgu5hyRS83bwK+GQH7JJFrpM
         qNL9dlKImXYdVH2pnOMLaPNMRF+RF+mkqnO5bTc6Fg1v39bEyY8cV/iACD//ZahUs98z
         pcNkeGXoomKqeJFu0bqg7l3ckVkOG08iJr6mLQwOxTHOrT1TgRU7WslAcP87/n2gAd+1
         UbdBoA1XX37W5AzVaKm9PoboQ2SXncCcMQh6nlloSEoPPPUu+OxxS5q7CE0GSncqquTt
         XXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=KlEB3TzEBBIVvGamwZdYSqBiBw9YY6fmULtCieqlIKE=;
        b=g92H6SMysgZdhR0y+fubTd5ATc7jB7FPcld2N2vmwiSM186EPiS3xxWgAfM5MjxVk6
         Kh7ls28PBIySQnlF00eXUg2tQqyqOPzF8WPKE7Go0/HPpQ1sbQ9skIRhkVxtdJZBR8KC
         YiO3AdILYuMUAHtkttqtEE/HU6QHQhTMgtqBwhXgnjubkQBDyjIBRIX/K7psDelXXGaX
         7WXNhMlugbGT/XjhxD5ul+13ounJSez1sLWUp8G+V4F8bJLF/q4Ka5dPdX+YXsFdM4/V
         vRnYFdVZfyYoH+xb8VQQ8xB06HG/+PHcjNJyysX82OmHF+YCam/tQlsAlkZsqgPilFf1
         8pGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id q2si9022732qvc.123.2019.07.01.12.50.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 12:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B80E6223884;
	Mon,  1 Jul 2019 19:50:26 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A719089;
	Mon,  1 Jul 2019 19:50:21 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	qemu-arm@nongnu.org,
	Andrew Jones <drjones@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yang Zhong <yang.zhong@intel.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 7/8] RFC target/arm: Do not build A/M-profile cpus when using KVM
Date: Mon,  1 Jul 2019 21:49:41 +0200
Message-Id: <20190701194942.10092-8-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-1-philmd@redhat.com>
References: <20190701194942.10092-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 01 Jul 2019 19:50:26 +0000 (UTC)
X-TUID: p61EJrKtUeoJ

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
index b4d31c6026..f8242068ad 100644
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
@@ -295,9 +307,6 @@ config ZYNQ
     select XILINX_SPIPS
     select ZYNQ_DEVCFG
 
-config ARM_V7M
-    bool
-
 config ALLWINNER_A10
     bool
     select AHCI
@@ -323,6 +332,7 @@ config STM32F205_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    select ARM_V7R
     select AHCI
     select ARM_GIC
     select CADENCE
-- 
2.20.1
