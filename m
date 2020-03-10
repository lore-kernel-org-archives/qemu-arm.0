Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y69sm4254503wmd.46.2020.03.10.06.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 06:30:26 -0700 (PDT)
Received: from zen.home.arpa (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C0ECD1FF7E;
	Tue, 10 Mar 2020 13:30:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] docs/system: add a little more detail to ARM machines
Date: Tue, 10 Mar 2020 13:30:20 +0000
Message-Id: <20200310133020.27196-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6y3XGHG48eA6

Taking from the wiki page mention:

  - both 32 and 64 bit architectures
  - the roll of A/M profile chips
  - warn about kernel portability
  - gently suggest -M virt
  - add headlines for groups of boards

This is still incomplete but hopefully is a less of a straight dive
into a dry list of peripherals.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/target-arm.rst | 47 +++++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index d2a3b44ce88..28aaef011d6 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -3,8 +3,35 @@
 ARM System emulator
 -------------------
 
-Use the executable ``qemu-system-arm`` to simulate a ARM machine. The
-ARM Integrator/CP board is emulated with the following devices:
+Use the executable ``qemu-system-arm`` to simulate a 32 bit ARM
+machine. The ``qemu-system-aarch64`` executable is used to simulate
+the 64 bit ARM AArch64 architecture. AArch64 CPUs can often include an
+AArch32 execution unit and execute a mix of 64 and 32 bit code.
+
+The emulator supports both "A-profile" and "M-profile" CPUs. The
+A-profile CPUs have a full MMU and can run things like the Linux while
+the M-profile CPUs are typically used in embedded micro-controller
+boards.
+
+Because ARM systems differ so much and in fundamental ways, typically
+operating system or firmware images intended to run on one machine
+will not run at all on any other.
+
+If you don't care about running on a particular piece of hardware the
+``-M virt`` board provides a PCI based virtio board which can be
+configured with a range of RAM sizes, CPU types and virtio based
+peripherals. It is generally the target you want to use if general
+purpose operating systems.
+
+Otherwise a range of other machine types are available. Passing ``-M
+help`` to the command line will list them all. They include the
+following:
+
+ARM Integrator/CP
+~~~~~~~~~~~~~~~~~
+
+This is a development board intended for prototyping and developing
+ARM-based devices.
 
 -  ARM926E, ARM1026E, ARM946E, ARM1136 or Cortex-A8 CPU
 
@@ -18,7 +45,11 @@ ARM Integrator/CP board is emulated with the following devices:
 
 -  PL181 MultiMedia Card Interface with SD card.
 
-The ARM Versatile baseboard is emulated with the following devices:
+ARM Versatile/Versatile Express
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Another family of development boards. The more recent Versatile
+Express boards are designed for modern Cortex processors.
 
 -  ARM926E, ARM1136 or Cortex-A8 CPU
 
@@ -45,6 +76,9 @@ The ARM Versatile baseboard is emulated with the following devices:
 
 -  PL181 MultiMedia Card Interface with SD card.
 
+ARM RealView
+~~~~~~~~~~~~
+
 Several variants of the ARM RealView baseboard are emulated, including
 the EB, PB-A8 and PBX-A9. Due to interactions with the bootloader, only
 certain Linux kernel configurations work out of the box on these boards.
@@ -77,6 +111,9 @@ The following devices are emulated:
 
 -  PL181 MultiMedia Card Interface with SD card.
 
+Various PDA machines
+~~~~~~~~~~~~~~~~~~~~
+
 The XScale-based clamshell PDA models (\"Spitz\", \"Akita\", \"Borzoi\"
 and \"Terrier\") emulation includes the following peripherals:
 
@@ -156,6 +193,10 @@ Nokia N800 and N810 internet tablets (known also as RX-34 and RX-44 /
 -  Nokia RETU and TAHVO multi-purpose chips with an RTC, connected
    through CBUS
 
+
+M-profile boards
+~~~~~~~~~~~~~~~~
+
 The Luminary Micro Stellaris LM3S811EVB emulation includes the following
 devices:
 
-- 
2.20.1
