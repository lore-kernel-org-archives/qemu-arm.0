Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v6sm10600099wrs.39.2020.11.03.02.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 02:47:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 28F471FF7E;
	Tue,  3 Nov 2020 10:47:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Graeme Gregory <graeme@nuviainc.com>,
	Leif Lindholm <leif@nuviainc.com>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] docs: add some notes on the sbsa-ref machine
Date: Tue,  3 Nov 2020 10:47:10 +0000
Message-Id: <20201103104710.27150-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xltz0yBchFkk

We should at least document what this machine is about.

Cc: Graeme Gregory <graeme@nuviainc.com>
Cc: Leif Lindholm <leif@nuviainc.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/sbsa.rst   | 30 ++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 docs/system/arm/sbsa.rst

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
new file mode 100644
index 0000000000..a47c9360de
--- /dev/null
+++ b/docs/system/arm/sbsa.rst
@@ -0,0 +1,30 @@
+Arm Server Base System Architecture Reference board (``sbsa-ref``)
+==================================================================
+
+While the `virt` board is a generic board platform that doesn't match
+any real hardware the `sbsa-ref` board intends to look like real
+hardware. The `Server Base System Architecture
+<https://developer.arm.com/documentation/den0029/latest>` defines a
+minimum base line of hardware support and importantly how the firmware
+reports that to any operating system. It is a static system that
+reports a very minimal DT to the firmware for command line input to
+the firmware. As a result it must have a firmware specifically built
+to expect a certain hardware layout (as you would in a real machine).
+
+It is intended to be a machine for developing firmware and testing
+standards compliance with operating systems.
+
+Supported devices
+"""""""""""""""""
+
+The sbsa-ref board supports:
+
+  - A configurable number of Cortex-A57 cpus
+  - GIC version 3
+  - System bus AHCI controller.
+  - System bus EHCI controller.
+  - CDROM and hard disc on AHCI bus.
+  - E1000E ethernet card on PCIE bus.
+  - VGA display adaptor on PCIE bus.
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
