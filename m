Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b7ebfsm534274966b.67.2024.07.18.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:45:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EDBC25F762;
	Thu, 18 Jul 2024 10:45:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-riscv@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Beraldo Leal <bleal@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Ed Maste <emaste@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 00/15] Final bits for 9.1-rc0 (docker, plugins, gdbstub, semihosting)
Date: Thu, 18 Jul 2024 10:45:08 +0100
Message-Id: <20240718094523.1198645-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Y2JSAZ4+I5VK

I'm just flushing my various maintainer queues for the up-coming 9.1
soft freeze. Mostly this is a collection of fixes and tweaks although
there is a new plugin in contrib. We've also bumped the libvirt-ci for
the BSD python updates.

The following still need review:

  tests/plugins: use qemu_plugin_outs for inline stats
  testing: bump to latest libvirt-ci

Alex Bennée (3):
  testing: bump to latest libvirt-ci
  gdbstub: Re-factor gdb command extensions
  tests/plugins: use qemu_plugin_outs for inline stats

Frédéric Pétrot (1):
  plugins/execlog.c: correct dump of registers values

Philippe Mathieu-Daudé (8):
  semihosting: Include missing 'gdbstub/syscalls.h' header
  target/m68k: Add semihosting stub
  target/mips: Add semihosting stub
  target/m68k: Restrict semihosting to TCG
  target/mips: Restrict semihosting to TCG
  target/riscv: Restrict semihosting to TCG
  target/xtensa: Restrict semihosting to TCG
  semihosting: Restrict to TCG

Pierrick Bouvier (1):
  plugins: fix mem callback array size

Simon Hamelin (1):
  plugins/stoptrigger: TCG plugin to stop execution under conditions

Thomas Huth (1):
  tests/avocado: Remove non-working sparc leon3 test

 MAINTAINERS                               |   1 -
 docs/devel/tcg-plugins.rst                |  22 ++++
 include/gdbstub/commands.h                |  19 ++-
 include/semihosting/syscalls.h            |   2 +
 target/arm/internals.h                    |   4 +-
 accel/tcg/plugin-gen.c                    |   3 +-
 contrib/plugins/execlog.c                 |   2 +-
 contrib/plugins/stoptrigger.c             | 151 ++++++++++++++++++++++
 gdbstub/gdbstub.c                         | 142 +++++++++++---------
 target/arm/gdbstub.c                      |  16 +--
 target/arm/gdbstub64.c                    |  11 +-
 target/m68k/semihosting-stub.c            |  15 +++
 target/mips/tcg/sysemu/semihosting-stub.c |  15 +++
 tests/plugin/inline.c                     |  58 +++++----
 .gitlab-ci.d/cirrus/freebsd-13.vars       |   2 +-
 contrib/plugins/Makefile                  |   1 +
 semihosting/Kconfig                       |   1 +
 target/m68k/Kconfig                       |   2 +-
 target/m68k/meson.build                   |   5 +-
 target/mips/Kconfig                       |   2 +-
 target/mips/tcg/sysemu/meson.build        |   6 +-
 target/riscv/Kconfig                      |   4 +-
 target/xtensa/Kconfig                     |   2 +-
 tests/avocado/machine_sparc_leon3.py      |  37 ------
 tests/lcitool/libvirt-ci                  |   2 +-
 tests/vm/generated/freebsd.json           |  14 +-
 26 files changed, 370 insertions(+), 169 deletions(-)
 create mode 100644 contrib/plugins/stoptrigger.c
 create mode 100644 target/m68k/semihosting-stub.c
 create mode 100644 target/mips/tcg/sysemu/semihosting-stub.c
 delete mode 100644 tests/avocado/machine_sparc_leon3.py

-- 
2.39.2
