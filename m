Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679eeb1sm25318198a12.48.2025.01.08.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:10:55 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8A25F5F8AC;
	Wed,  8 Jan 2025 12:10:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-riscv@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <lvivier@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH v4 00/32] testing/next: functional tests, qtest clocks, vm and keymaps (pre-PR-FINAL)
Date: Wed,  8 Jan 2025 12:10:22 +0000
Message-Id: <20250108121054.1126164-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: BLAnsSTugeH0

There are number of parts to this series.

The first is the updated images for all the guests that didn't make it
into 9.2. There are also some new functional tests for virtio-gpu
along with some other clean-ups.

The qtest patches focus on ensuring things calling clock_step and
clock_set actually pay attention to return values. The virtio tests
needed a little little re-jigging as they don't need timeout
loops at all (v2).

We bump libvirt-ci so we can move the riscv64 cross container to
testing/trixie which will hopefully make the image less prone to sid
breakages.

Finally we make a few tweaks to tests/vm which were helpful when
chasing the keymap issue. I still think there is a race condition in
there somewhere as I can't reliably build the FreeBSD VMs from
scratch.

The pc-bios dependency fixup I think addresses the failure but I'm a
little unsure about the meason stuff.

I did a v4 re-spin because I split apart some unrelated changes. I
still plan to send the PR at the end of the week.

For v2
  - add test/vm and lcitool updates
  - don't move clock_step, remove them for virtio tests
For v3
  - review comments and checkpatch fixes
  - MAINTAINERS updates
  - add zstd uncompress function and use it
For v4
  - split unrelated changes from vulkan tests
  - use utility functions for tuxruntest

The following still need review:

  tests/functional: update tuxruntest to use uncompress utility
  pc-bios: ensure keymaps dependencies set vnc tests
  tests/vm: allow interactive login as root
  tests/vm: partially un-tabify help output
  tests/docker: move riscv64 cross container from sid to trixie
  tests/functional: extend test_aarch64_virt with vulkan test
  tests/functional: bail aarch64_virt tests early if missing TCG
  tests/functional: remove unused kernel_command_line
  tests/functional: add zstd support to uncompress utility

Alex.

Alex Bennée (28):
  tests/functional: update the arm tuxrun tests
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
  tests/qtest: remove clock_steps from virtio tests
  system/qtest: properly feedback results of clock_[step|set]
  tests/functional: remove hacky sleep from the tests
  tests/functional: add zstd support to uncompress utility
  tests/functional: update tuxruntest to use uncompress utility
  tests/functional: remove unused kernel_command_line
  tests/functional: bail aarch64_virt tests early if missing TCG
  tests/functional: extend test_aarch64_virt with vulkan test
  tests/lcitool: bump to latest version of libvirt-ci
  tests/docker: move riscv64 cross container from sid to trixie
  tests/vm: fix build_path based path
  tests/vm: partially un-tabify help output
  tests/vm: allow interactive login as root
  pc-bios: ensure keymaps dependencies set vnc tests

Daniel P. Berrangé (1):
  tests/lcitool: remove temp workaround for debian mips64el

Philippe Mathieu-Daudé (1):
  dockerfiles: Remove 'MAINTAINER' entry in debian-tricore-cross.docker

Pierrick Bouvier (1):
  tests/functional/aarch64: add tests for FEAT_RME

Wainer dos Santos Moschetta (1):
  MAINTAINERS: Remove myself from reviewers

 MAINTAINERS                                   |   3 +-
 system/qtest.c                                |  23 ++--
 tests/qtest/libqos/virtio.c                   |   4 -
 .gitlab-ci.d/cirrus/freebsd-14.vars           |   2 +-
 pc-bios/keymaps/meson.build                   |  17 ++-
 .../dockerfiles/debian-mips64el-cross.docker  |   9 ++
 .../dockerfiles/debian-riscv64-cross.docker   |   4 +-
 .../dockerfiles/debian-tricore-cross.docker   |   2 -
 tests/functional/meson.build                  |   5 +
 tests/functional/qemu_test/tuxruntest.py      |  12 +-
 tests/functional/qemu_test/uncompress.py      |  26 ++++
 tests/functional/test_aarch64_rme_sbsaref.py  |  69 +++++++++++
 tests/functional/test_aarch64_rme_virt.py     |  98 +++++++++++++++
 tests/functional/test_aarch64_virt.py         | 117 ++++++++++++++----
 tests/functional/test_arm_tuxrun.py           |  28 ++---
 tests/functional/test_i386_tuxrun.py          |   8 +-
 tests/functional/test_m68k_tuxrun.py          |  34 +++++
 tests/functional/test_mips64_tuxrun.py        |   8 +-
 tests/functional/test_mips64el_tuxrun.py      |   8 +-
 tests/functional/test_mips_tuxrun.py          |   8 +-
 tests/functional/test_mipsel_tuxrun.py        |   8 +-
 tests/functional/test_ppc64_tuxrun.py         |  16 +--
 tests/functional/test_ppc_tuxrun.py           |   8 +-
 tests/functional/test_riscv32_tuxrun.py       |   8 +-
 tests/functional/test_riscv64_tuxrun.py       |  16 +--
 tests/functional/test_s390x_tuxrun.py         |   8 +-
 tests/functional/test_sparc64_tuxrun.py       |   8 +-
 tests/functional/test_x86_64_tuxrun.py        |   8 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/mappings.yml                    |  29 -----
 tests/lcitool/refresh                         |   4 +-
 tests/qtest/meson.build                       |   2 +-
 tests/vm/Makefile.include                     |  29 ++---
 tests/vm/basevm.py                            |  12 +-
 tests/vm/generated/freebsd.json               |   2 +-
 35 files changed, 463 insertions(+), 182 deletions(-)
 create mode 100755 tests/functional/test_aarch64_rme_sbsaref.py
 create mode 100755 tests/functional/test_aarch64_rme_virt.py
 create mode 100644 tests/functional/test_m68k_tuxrun.py

-- 
2.39.5
