Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m22sm33154710wrh.66.2021.02.02.05.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 05:48:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 51B8D1FF9D;
	Tue,  2 Feb 2021 13:40:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:Versatile Express)
Subject: [PATCH  v1 14/15] docs/system: document an example vexpress-a15 invocation
Date: Tue,  2 Feb 2021 13:39:59 +0000
Message-Id: <20210202134001.25738-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wi+TLAH+km8x

The wiki and the web are curiously absent of the right runes to boot a
vexpress model so I had to work from first principles to work it out.
Use the more modern -drive notation so alternative backends can be
used (unlike the hardwired -sd mode).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>

---
v2
  - reword kernel build.
---
 docs/system/arm/vexpress.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
index 7f1bcbef07..3e3839e923 100644
--- a/docs/system/arm/vexpress.rst
+++ b/docs/system/arm/vexpress.rst
@@ -58,3 +58,31 @@ Other differences between the hardware and the QEMU model:
   ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
   provided on the command line then QEMU will edit it to include
   suitable entries describing these transports for the guest.
+
+Booting a Linux kernel
+----------------------
+
+Building a current Linux kernel with ``multi_v7_defconfig`` should be
+enough to get something running. Nowadays an out-of-tree build is
+recommended (and also useful if you build a lot of different targets).
+In the following example $BLD points to the build directory and $SRC
+points to the root of the Linux source tree. You can drop $SRC if you
+are running from there.
+
+.. code-block:: bash
+
+  $ make O=$BLD -C $SRC ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- multi_v7_defconfig
+  $ make O=$BLD -C $SRC ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
+
+By default you will want to boot your rootfs off the sdcard interface.
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
