Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm4617103wrw.29.2023.01.10.09.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:39:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0AC211FFC7;
	Tue, 10 Jan 2023 17:39:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Ed Maste <emaste@freebsd.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 16/26] semihosting: add semihosting section to the docs
Date: Tue, 10 Jan 2023 17:39:12 +0000
Message-Id: <20230110173922.265055-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fm3H/Do5+J6p

The main reason to do this is to document our O_BINARY implementation
decision somewhere. However I've also moved some of the implementation
details out of qemu-options and added links between the two. As a
bonus I've highlighted the scary warnings about host access with the
appropriate RST tags.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/features.rst    | 10 ++---
 docs/specs/index.rst       |  1 +
 docs/specs/semihosting.rst | 79 ++++++++++++++++++++++++++++++++++++++
 qemu-options.hx            | 27 +++++--------
 4 files changed, 95 insertions(+), 22 deletions(-)
 create mode 100644 docs/specs/semihosting.rst

diff --git a/docs/about/features.rst b/docs/about/features.rst
index 0808c35a4a..aed0f9b9a2 100644
--- a/docs/about/features.rst
+++ b/docs/about/features.rst
@@ -187,11 +187,11 @@ See `User Mode Emulation` for more details on running in this mode.
 Semihosting
 ~~~~~~~~~~~~
 
-A number of guest architecture support semihosting which provides a
-way for guest programs to access the host system though a POSIX-like
-system call layer. This has applications for early software bring-up
-making it easy for a guest to dump data or read configuration files
-before a full operating system is implemented.
+A number of guest architecture support :ref:`Semihosting` which
+provides a way for guest programs to access the host system though a
+POSIX-like system call layer. This has applications for early software
+bring-up making it easy for a guest to dump data or read configuration
+files before a full operating system is implemented.
 
 Some of those guest architectures also support semihosting in
 user-mode making the testing of "bare-metal" micro-controller code
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index a58d9311cb..b46a16b2c8 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -21,3 +21,4 @@ guest hardware that is specific to QEMU.
    acpi_erst
    sev-guest-firmware
    fw_cfg
+   semihosting
diff --git a/docs/specs/semihosting.rst b/docs/specs/semihosting.rst
new file mode 100644
index 0000000000..343eb4bbb3
--- /dev/null
+++ b/docs/specs/semihosting.rst
@@ -0,0 +1,79 @@
+.. _Semihosting:
+
+Semihosting
+-----------
+
+Semihosting is a feature provided by a number of guests that allow the
+program running on the target to interact with the host system. On
+real hardware this is usually provided by a debugger hooked directly
+to the system.
+
+Generally semihosting makes it easier to bring up low level code before a
+more fully functional operating system has been enabled. On QEMU it
+also allows for embedded micro-controller code which typically doesn't
+have a full libc to be run as "bare-metal" code under QEMU's user-mode
+emulation. It is also useful for writing test cases and indeed a
+number of compiler suites as well as QEMU itself use semihosting calls
+to exit test code while reporting the success state.
+
+Semihosting is only available using TCG emulation. This is because the
+instructions to trigger a semihosting call are typically reserved
+causing most hypervisors to trap and fault on them.
+
+.. warning::
+   Semihosting inherently bypasses any isolation there may be between
+   the guest and the host. As a result a program using semihosting can
+   happily trash your host system. You should only ever run trusted
+   code with semihosting enabled.
+
+Redirection
+~~~~~~~~~~~
+
+Semihosting calls can be re-directed to a (potentially remote) gdb
+during debugging via the :ref:`gdbstub<GDB usage>`. Output to the
+semihosting console is configured as a ``chardev`` so can be
+redirected to a file, pipe or socket like any other ``chardev``
+device.
+
+See :ref:`Semihosting Options<Semihosting Options>` for details.
+
+Supported Targets
+~~~~~~~~~~~~~~~~~
+
+Most targets offer a similar semihosting implementations with some
+minor changes to define the appropriate instruction to encode the
+semihosting call and which registers hold the parameters. They tend to
+presents a simple POSIX-like API which allows your program to read and
+write files, access the console and some other basic interactions.
+
+.. note::
+   QEMU makes an implementation decision to implement all file access
+   in ``O_BINARY`` mode regardless of the host operating system. This
+   is because gdb semihosting support doesn't make the distinction
+   between the modes and magically processing line endings can be confusing.
+
+.. list-table:: Guest Architectures supporting Semihosting
+  :widths: 10 10 80
+  :header-rows: 1
+
+  * - Architecture
+    - Modes
+    - Specification
+  * - Arm
+    - System and User-mode
+    - https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst
+  * - m68k
+    - System
+    - https://sourceware.org/git/?p=newlib-cygwin.git;a=blob;f=libgloss/m68k/m68k-semi.txt;hb=HEAD
+  * - mips
+    - System
+    - Unified Hosting Interface (MD01069)
+  * - Nios II
+    - System
+    - https://sourceware.org/git/gitweb.cgi?p=newlib-cygwin.git;a=blob;f=libgloss/nios2/nios2-semi.txt;hb=HEAD
+  * - RISC-V
+    - System and User-mode
+    - https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
+  * - Xtensa
+    - System
+    - Tensilica ISS SIMCALL
diff --git a/qemu-options.hx b/qemu-options.hx
index 3aa3a2f5a3..de3a368f58 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4633,10 +4633,13 @@ DEF("semihosting", 0, QEMU_OPTION_semihosting,
     QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting``
-    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
+    Enable :ref:`Semihosting` mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
 
-    Note that this allows guest direct access to the host filesystem, so
-    should only be used with a trusted guest OS.
+    .. warning::
+      Note that this allows guest direct access to the host filesystem, so
+      should only be used with a trusted guest OS.
+
+    .. _Semihosting Options:
 
     See the -semihosting-config option documentation for further
     information about the facilities this enables.
@@ -4648,22 +4651,12 @@ QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
 QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,userspace=on|off][,arg=str[,...]]``
-    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
+    Enable and configure :ref:`Semihosting` (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
     only).
 
-    Note that this allows guest direct access to the host filesystem, so
-    should only be used with a trusted guest OS.
-
-    On Arm this implements the standard semihosting API, version 2.0.
-
-    On M68K this implements the "ColdFire GDB" interface used by
-    libgloss.
-
-    Xtensa semihosting provides basic file IO calls, such as
-    open/read/write/seek/select. Tensilica baremetal libc for ISS and
-    linux platform "sim" use this interface.
-
-    On RISC-V this implements the standard semihosting API, version 0.2.
+    .. warning::
+      Note that this allows guest direct access to the host filesystem, so
+      should only be used with a trusted guest OS.
 
     ``target=native|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU
-- 
2.34.1
