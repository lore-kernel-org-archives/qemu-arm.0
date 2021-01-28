Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v6sm8019721wrx.32.2021.01.28.10.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 10:53:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BE9FD1FF7E;
	Thu, 28 Jan 2021 18:53:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] docs/system: document an example vexpress-a15 invocation
Date: Thu, 28 Jan 2021 18:53:00 +0000
Message-Id: <20210128185300.2875-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1cr6peBmJsrO

The wiki and the web are curiously absent of the right runes to boot a
vexpress model so I had to work from first principles to work it out.
Use the more modern -drive notation so alternative backends can be
used (unlike the hardwired -sd mode).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
index 7f1bcbef07..30b1823b95 100644
--- a/docs/system/arm/vexpress.rst
+++ b/docs/system/arm/vexpress.rst
@@ -58,3 +58,29 @@ Other differences between the hardware and the QEMU model:
   ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
   provided on the command line then QEMU will edit it to include
   suitable entries describing these transports for the guest.
+
+Booting a Linux kernel
+----------------------
+
+Building a current Linux kernel with ``multi_v7_defconfig`` should be
+enough to get something running.
+
+.. code-block:: bash
+
+  $ export ARCH=arm
+  $ export CROSS_COMPILE=arm-linux-gnueabihf-
+  $ make multi_v7_defconfig
+  $ make
+
+By default you will want to boot your rootfs of the sdcard interface.
+Your rootfs will need to be padded to the right size. With a suitable
+DTB you could also add devices to the virtio-mmio bus.
+
+.. code-block:: bash
+
+  $ qemu-system-arm -cpu cortex-a15 -smp 4 -m 4096 \
+      -machine type=vexpress-a15 -serial mon:stdio \
+      -drive if=sd,driver=file,filename=armel-rootfs.ext4 \
+      -kernel zImage  \
+      -dtb vexpress-v2p-ca15-tc1.dtb \
+      -append "console=ttyAMA0 root=/dev/mmcblk0 ro"
-- 
2.20.1
