Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g83sm17218216wma.10.2021.06.21.08.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 08:21:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C5D221FF8F;
	Mon, 21 Jun 2021 16:21:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 3/5] hw/arm: move CONFIG_V7M out of default-devices
Date: Mon, 21 Jun 2021 16:21:18 +0100
Message-Id: <20210621152120.4465-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621152120.4465-1-alex.bennee@linaro.org>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jJlsDGAQqwoS

We currently select CONFIG_V7M for a bunch of our m-profile devices.
The last sticking point is translate.c which cannot be compiled
without expecting v7m support. Express this dependency in Kconfig
rather than in default devices as a stepping stone to a fully
configurable translate.c.

While we are at it we also need to select ARM_COMPATIBLE_SEMIHOSTING
as that is implied for M profile machines.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vconfigs
  - cherry pick from re-factor
  - minor tweak to subject line
---
 default-configs/devices/arm-softmmu.mak | 3 ---
 hw/arm/Kconfig                          | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c..4114aa9e35 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -1,8 +1,5 @@
 # Default configuration for arm-softmmu
 
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=y
-
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 528f71bb9d..062fe94b64 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -296,7 +296,10 @@ config ZYNQ
 
 config ARM_V7M
     bool
+    # currently v7M must be included in a TCG build due to translate.c
+    default y if TCG && (ARM || AARCH64)
     select PTIMER
+    select ARM_COMPATIBLE_SEMIHOSTING
 
 config ALLWINNER_A10
     bool
-- 
2.20.1
