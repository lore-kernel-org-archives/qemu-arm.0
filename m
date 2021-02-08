Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x15sm11738456wro.66.2021.02.08.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 04:44:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3C2DA1FF9F;
	Mon,  8 Feb 2021 12:38:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org (open list:Versatile PB)
Subject: [PULL 16/16] docs/system: document an example booting the versatilepb machine
Date: Mon,  8 Feb 2021 12:38:21 +0000
Message-Id: <20210208123821.19818-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SJJPvcEbu9he

There is a bit more out there including Aurelien's excellent write up
and older Debian images here:

  https://www.aurel32.net/info/debian_arm_qemu.php
  https://people.debian.org/~aurel32/qemu/armel/

However the web is transitory and git is forever so lets add something
to the fine manual.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Message-Id: <20210202134001.25738-16-alex.bennee@linaro.org>

diff --git a/docs/system/arm/versatile.rst b/docs/system/arm/versatile.rst
index 51221c30a4..2ae792bac3 100644
--- a/docs/system/arm/versatile.rst
+++ b/docs/system/arm/versatile.rst
@@ -27,3 +27,37 @@ The Arm Versatile baseboard is emulated with the following devices:
    devices.
 
 -  PL181 MultiMedia Card Interface with SD card.
+
+Booting a Linux kernel
+----------------------
+
+Building a current Linux kernel with ``versatile_defconfig`` should be
+enough to get something running. Nowadays an out-of-tree build is
+recommended (and also useful if you build a lot of different targets).
+In the following example $BLD points to the build directory and $SRC
+points to the root of the Linux source tree. You can drop $SRC if you
+are running from there.
+
+.. code-block:: bash
+
+  $ make O=$BLD -C $SRC ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- versatile_defconfig
+  $ make O=$BLD -C $SRC ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
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
