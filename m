Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m10sm12337769wro.7.2021.01.29.10.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 10:13:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CBCED1FF7E;
	Fri, 29 Jan 2021 18:13:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] docs/system: document an example booting the versatilepb machine
Date: Fri, 29 Jan 2021 18:13:19 +0000
Message-Id: <20210129181319.2992-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vRenK4+xg8mZ

There is a bit more out there including Aurelien's excellent write up
and older Debian images here:

  https://www.aurel32.net/info/debian_arm_qemu.php
  https://people.debian.org/~aurel32/qemu/armel/

However the web is transitory and git is forever so lets add something
to the fine manual.

Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/versatile.rst | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/docs/system/arm/versatile.rst b/docs/system/arm/versatile.rst
index 51221c30a4..d16f20ccae 100644
--- a/docs/system/arm/versatile.rst
+++ b/docs/system/arm/versatile.rst
@@ -27,3 +27,35 @@ The Arm Versatile baseboard is emulated with the following devices:
    devices.
 
 -  PL181 MultiMedia Card Interface with SD card.
+
+Booting a Linux kernel
+----------------------
+
+Building a current Linux kernel with ``versatile_defconfig`` should be
+enough to get something running.
+
+.. code-block:: bash
+
+  $ export ARCH=arm
+  $ export CROSS_COMPILE=arm-linux-gnueabihf-
+  $ make versatile_defconfig
+  $ make
+
+You may want to enable some additional modules if you want to boot
+something from the SCSI interface::
+
+  CONFIG_PCI=y
+  CONFIG_PCI_VERSATILE=y
+  CONFIG_SCSI=y
+  CONFIG_SCSI_SYM53C8XX_2=y
+
+You can then boot with a command line like:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -machine type=versatilepb \
+      -serial mon:stdio \
+      -drive if=scsi,driver=file,filename=debian-buster-armel-rootfs.ext4 \
+      -kernel zImage \
+      -dtb versatile-pb.dtb  \
+      -append "console=ttyAMA0 ro root=/dev/sda"
-- 
2.20.1
