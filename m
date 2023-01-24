Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id g16-20020adffc90000000b002882600e8a0sm2545747wrr.12.2023.01.24.10.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:07:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 23E681FFC9;
	Tue, 24 Jan 2023 18:01:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 20/35] docs: add a new section to outline emulation support
Date: Tue, 24 Jan 2023 18:01:12 +0000
Message-Id: <20230124180127.1881110-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zSosw3f/idCh

This affects both system and user mode emulation so we should probably
list it up front.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - HPs -> HP's
  - MIPs-like -> MIPS-like
---
 docs/about/emulation.rst      | 103 ++++++++++++++++++++++++++++++++++
 docs/about/index.rst          |   1 +
 docs/devel/tcg-plugins.rst    |   2 +
 docs/system/arm/emulation.rst |   2 +
 4 files changed, 108 insertions(+)
 create mode 100644 docs/about/emulation.rst

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
new file mode 100644
index 0000000000..bdc0630b35
--- /dev/null
+++ b/docs/about/emulation.rst
@@ -0,0 +1,103 @@
+Emulation
+=========
+
+QEMU's Tiny Code Generator (TCG) gives it the ability to emulate a
+number of CPU architectures on any supported platform. Both
+:ref:`System Emulation` and :ref:`User Mode Emulation` are supported
+depending on the guest architecture.
+
+.. list-table:: Supported Guest Architectures for Emulation
+  :widths: 30 10 10 50
+  :header-rows: 1
+
+  * - Architecture (qemu name)
+    - System
+    - User-mode
+    - Notes
+  * - Alpha
+    - Yes
+    - Yes
+    - Legacy 64 bit RISC ISA developed by DEC
+  * - Arm (arm, aarch64)
+    - Yes
+    - Yes
+    - Wide range of features, see :ref:`Arm Emulation` for details
+  * - AVR
+    - Yes
+    - No
+    - 8 bit micro controller, often used in maker projects
+  * - Cris
+    - Yes
+    - Yes
+    - Embedded RISC chip developed by AXIS
+  * - Hexagon
+    - No
+    - Yes
+    - Family of DSPs by Qualcomm
+  * - PA-RISC (hppa)
+    - Yes
+    - Yes
+    - A legacy RISC system used in HP's old minicomputers
+  * - x86 (i386, x86_64)
+    - Yes
+    - Yes
+    - The ubiquitous desktop PC CPU architecture, 32 and 64 bit.
+  * - Loongarch
+    - Yes
+    - Yes
+    - A MIPS-like 64bit RISC architecture developed in China
+  * - m68k
+    - Yes
+    - Yes
+    - Motorola 68000 variants and ColdFire
+  * - Microblaze
+    - Yes
+    - Yes
+    - RISC based soft-core by Xilinx
+  * - MIPS (mips, mipsel, mips64, mips64el)
+    - Yes
+    - Yes
+    - Venerable RISC architecture originally out of Stanford University
+  * - Nios2
+    - Yes
+    - Yes
+    - 32 bit embedded soft-core by Altera
+  * - OpenRISC
+    - Yes
+    - Yes
+    - Open source RISC architecture developed by the OpenRISC community
+  * - Power (ppc, ppc64)
+    - Yes
+    - Yes
+    - A general purpose RISC architecture now managed by IBM
+  * - RISC-V
+    - Yes
+    - Yes
+    - An open standard RISC ISA maintained by RISC-V International
+  * - RX
+    - Yes
+    - No
+    - A 32 bit micro controller developed by Renesas
+  * - s390x
+    - Yes
+    - Yes
+    - A 64 bit CPU found in IBM's System Z mainframes
+  * - sh4
+    - Yes
+    - Yes
+    - A 32 bit RISC embedded CPU developed by Hitachi
+  * - SPARC (sparc, sparc64)
+    - Yes
+    - Yes
+    - A RISC ISA originally developed by Sun Microsystems
+  * - Tricore
+    - Yes
+    - No
+    - A 32 bit RISC/uController/DSP developed by Infineon
+  * - Xtensa
+    - Yes
+    - Yes
+    - A configurable 32 bit soft core now owned by Cadence
+
+A number of features are are only available when running under
+emulation including :ref:`Record/Replay<replay>` and :ref:`TCG Plugins`.
diff --git a/docs/about/index.rst b/docs/about/index.rst
index bae1309cc6..b00b584b31 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -23,6 +23,7 @@ allows you to create, convert and modify disk images.
    :maxdepth: 2
 
    build-platforms
+   emulation
    deprecated
    removed-features
    license
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 9740a70406..81dcd43a61 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -3,6 +3,8 @@
    Copyright (c) 2019, Linaro Limited
    Written by Emilio Cota and Alex Bennée
 
+.. _TCG Plugins:
+
 QEMU TCG Plugins
 ================
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b33d7c28dc..b87e064d9d 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -1,3 +1,5 @@
+.. _Arm Emulation:
+
 A-profile CPU architecture support
 ==================================
 
-- 
2.34.1
