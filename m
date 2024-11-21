Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45bd4d1sm63014115e9.12.2024.11.21.08.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 711BC5F77B;
	Thu, 21 Nov 2024 16:58:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-riscv@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-s390x@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-rust@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ani Sinha <anisinha@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 00/39] maintainer updates for -rc2 pre-PR
Date: Thu, 21 Nov 2024 16:57:27 +0000
Message-Id: <20241121165806.476008-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: +p9aNVfcQ9Y7

This is a mostly testing focused set of patches but a few bug fixes as
well. I plan to send the PR in on Monday. I can drop any patches that
are objected to but I think its pretty safe.

Contains:

  - Daniel's clean-up of functional tests
  - Another avocado->function conversion from Thomas
  - Update the tuxrun baseline images
  - Minor fix to the rust pl011 device
  - Documentation clarification on identity

The following could do with some review:

  tests/functional: update the x86_64 tuxrun tests
  tests/functional: update the sparc64 tuxrun tests
  tests/functional: update the s390x tuxrun tests
  tests/functional: update the riscv64 tuxrun tests
  tests/functional: update the riscv32 tuxrun tests
  tests/functional: update the ppc64 tuxrun tests
  tests/functional: update the ppc32 tuxrun tests
  tests/functional: update the mips64el tuxrun tests
  tests/functional: update the mips64 tuxrun tests
  tests/functional: update the mips32el tuxrun tests
  tests/functional: update the mips32 tuxrun tests
  tests/functional: add a m68k tuxrun tests
  tests/functional: update the i386 tuxrun tests
  tests/functional: update the aarch64 tuxrun tests
  tests/functional: update the arm tuxrun tests
  tests/functional: Convert the Avocado aarch64 tuxrun tests

Thanks,

Alex.

Alex Bennée (15):
  tests/functional: update the arm tuxrun tests
  tests/functional: update the aarch64 tuxrun tests
  tests/functional: update the i386 tuxrun tests
  tests/functional: add a m68k tuxrun tests
  tests/functional: update the mips32 tuxrun tests
  tests/functional: update the mips32el tuxrun tests
  tests/functional: update the mips64 tuxrun tests
  tests/functional: update the mips64el tuxrun tests
  tests/functional: update the ppc32 tuxrun tests
  tests/functional: update the ppc64 tuxrun tests
  tests/functional: update the riscv32 tuxrun tests
  tests/functional: update the riscv64 tuxrun tests
  tests/functional: update the s390x tuxrun tests
  tests/functional: update the sparc64 tuxrun tests
  tests/functional: update the x86_64 tuxrun tests

Daniel P. Berrangé (19):
  tests/functional: fix mips64el test to honour workdir
  tests/functional: automatically clean up scratch files after tests
  tests/functional: remove "AVOCADO" from env variable name
  tests/functional: remove todo wrt avocado.utils.wait_for
  tests/functional: remove leftover :avocado: tags
  tests/functional: remove obsolete reference to avocado bug
  tests/functional: remove comments talking about avocado
  tests/functional: honour self.workdir in ACPI bits tests
  tests/functional: put QEMUMachine logs in testcase log directory
  tests/functional: honour requested test VM name in QEMUMachine
  tests/functional: enable debug logging for QEMUMachine
  tests/functional: logs details of console interaction operations
  tests/functional: don't try to wait for the empty string
  tests/functional: require non-NULL success_message for console wait
  tests/functional: rewrite console handling to be bytewise
  tests/functional: remove time.sleep usage from tuxrun tests
  tests/functional: add a QMP backdoor for debugging stalled tests
  tests/functional: avoid accessing log_filename on earlier failures
  docs: explicitly permit a "commonly known identity" with SoB

Junjie Mao (1):
  rust/pl011: Fix range checks for device ID accesses

Pierrick Bouvier (3):
  plugins: add missing export for qemu_plugin_num_vcpus
  plugins: detect qemu plugin API symbols from header
  plugins: eradicate qemu-plugins.symbols static file

Thomas Huth (1):
  tests/functional: Convert the Avocado aarch64 tuxrun tests

 MAINTAINERS                              |   4 +-
 docs/devel/submitting-a-patch.rst        |   7 +-
 docs/devel/testing/functional.rst        |  16 ++
 include/qemu/qemu-plugin.h               |   1 +
 .gitlab-ci.d/check-dco.py                |   5 +-
 plugins/meson.build                      |  12 +-
 plugins/qemu-plugins.symbols             |  59 ------
 rust/hw/char/pl011/src/device.rs         |   2 +-
 scripts/qemu-plugin-symbols.py           |  45 +++++
 tests/avocado/tuxrun_baselines.py        | 224 -----------------------
 tests/functional/meson.build             |   3 +
 tests/functional/qemu_test/cmd.py        |  89 +++++++--
 tests/functional/qemu_test/testcase.py   |  43 +++--
 tests/functional/qemu_test/tuxruntest.py |  17 +-
 tests/functional/test_aarch64_tuxrun.py  |  50 +++++
 tests/functional/test_acpi_bits.py       |  57 ++----
 tests/functional/test_arm_bpim2u.py      |  20 --
 tests/functional/test_arm_orangepi.py    |  27 ---
 tests/functional/test_arm_tuxrun.py      |  28 +--
 tests/functional/test_i386_tuxrun.py     |   8 +-
 tests/functional/test_m68k_nextcube.py   |   3 +-
 tests/functional/test_m68k_tuxrun.py     |  34 ++++
 tests/functional/test_mips64_tuxrun.py   |   8 +-
 tests/functional/test_mips64el_malta.py  |   4 +-
 tests/functional/test_mips64el_tuxrun.py |   8 +-
 tests/functional/test_mips_tuxrun.py     |   8 +-
 tests/functional/test_mipsel_tuxrun.py   |   8 +-
 tests/functional/test_ppc64_tuxrun.py    |  16 +-
 tests/functional/test_ppc_tuxrun.py      |   8 +-
 tests/functional/test_riscv32_tuxrun.py  |   8 +-
 tests/functional/test_riscv64_tuxrun.py  |  16 +-
 tests/functional/test_s390x_tuxrun.py    |   8 +-
 tests/functional/test_sparc64_tuxrun.py  |   8 +-
 tests/functional/test_virtio_gpu.py      |   3 +-
 tests/functional/test_x86_64_tuxrun.py   |   8 +-
 35 files changed, 376 insertions(+), 489 deletions(-)
 delete mode 100644 plugins/qemu-plugins.symbols
 create mode 100755 scripts/qemu-plugin-symbols.py
 delete mode 100644 tests/avocado/tuxrun_baselines.py
 create mode 100755 tests/functional/test_aarch64_tuxrun.py
 create mode 100644 tests/functional/test_m68k_tuxrun.py

-- 
2.39.5
