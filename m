Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l2sm6843694wrp.21.2021.06.04.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6C56E20021;
	Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 94/99] target/arm: move CONFIG_V7M out of default-devices
Date: Fri,  4 Jun 2021 16:53:07 +0100
Message-Id: <20210604155312.15902-95-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FuvPtzxxDuNi

We currently select CONFIG_V7M for a bunch of our m-profile devices.
The last sticking point is translate.c which cannot be compiled
without expecting v7m support. Express this dependency in Kconfig
rather than in default devices as a stepping stone to a fully
configurable translate.c.

While we are at it we also need to select ARM_COMPATIBLE_SEMIHOSTING
as that is implied for M profile machines.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 default-configs/devices/arm-softmmu.mak | 3 ---
 hw/arm/Kconfig                          | 3 +++
 target/arm/tcg/sysemu/meson.build       | 5 ++++-
 3 files changed, 7 insertions(+), 4 deletions(-)

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
index 67723d9ea6..afaf807c92 100644
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
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
index 56e4b5ccea..520f305deb 100644
--- a/target/arm/tcg/sysemu/meson.build
+++ b/target/arm/tcg/sysemu/meson.build
@@ -1,7 +1,10 @@
 arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'debug_helper.c',
-  'm_helper.c',
   'mte_helper.c',
   'tcg-cpu.c',
   'tlb_helper.c',
 ))
+
+arm_softmmu_ss.add(when: 'CONFIG_ARM_V7M', if_true: files(
+  'm_helper.c',
+))
-- 
2.20.1
