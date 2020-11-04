Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u3sm3509429wro.33.2020.11.04.08.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:53:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 600761FF7E;
	Wed,  4 Nov 2020 16:53:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Graeme Gregory <graeme@nuviainc.com>,
	Leif Lindholm <leif@nuviainc.com>,
	Shashi Mallela <shashi.mallela@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2] docs: add some notes on the sbsa-ref machine
Date: Wed,  4 Nov 2020 16:52:54 +0000
Message-Id: <20201104165254.24822-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9rbdmc1B7+KI

We should at least document what this machine is about.

Reviewed-by: Graeme Gregory <graeme@nuviainc.com>
Cc: Leif Lindholm <leif@nuviainc.com>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - reworded command line bit as per Leif
  - s/cortex-a57 cpus/AArch64 CPUs/
  - dropped the trailing .'s
---
 docs/system/arm/sbsa.rst   | 32 ++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 docs/system/arm/sbsa.rst

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
new file mode 100644
index 0000000000..b8ecfdb62f
--- /dev/null
+++ b/docs/system/arm/sbsa.rst
@@ -0,0 +1,32 @@
+Arm Server Base System Architecture Reference board (``sbsa-ref``)
+==================================================================
+
+While the `virt` board is a generic board platform that doesn't match
+any real hardware the `sbsa-ref` board intends to look like real
+hardware. The `Server Base System Architecture
+<https://developer.arm.com/documentation/den0029/latest>` defines a
+minimum base line of hardware support and importantly how the firmware
+reports that to any operating system. It is a static system that
+reports a very minimal DT to the firmware for non-discoverable
+information about components affected by the qemu command line (i.e.
+cpus and memory). As a result it must have a firmware specifically
+built to expect a certain hardware layout (as you would in a real
+machine).
+
+It is intended to be a machine for developing firmware and testing
+standards compliance with operating systems.
+
+Supported devices
+"""""""""""""""""
+
+The sbsa-ref board supports:
+
+  - A configurable number of AArch64 CPUs
+  - GIC version 3
+  - System bus AHCI controller
+  - System bus EHCI controller
+  - CDROM and hard disc on AHCI bus
+  - E1000E ethernet card on PCIe bus
+  - VGA display adaptor on PCIe bus
+  - A generic SBSA watchdog device
+
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index fdcf25c237..9636f3fd00 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -79,6 +79,7 @@ undocumented; you can get a complete list by running
    arm/mps2
    arm/musca
    arm/realview
+   arm/sbsa-ref
    arm/versatile
    arm/vexpress
    arm/aspeed
-- 
2.20.1
