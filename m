Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359831sm569381466b.95.2024.12.18.08.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:21:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 18E245F796;
	Wed, 18 Dec 2024 16:21:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Beraldo Leal <bleal@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 00/27] testing/next: functional tests, qtest clocks, vm and keymaps
Date: Wed, 18 Dec 2024 16:20:36 +0000
Message-Id: <20241218162104.3493551-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: tP8Kf3P2i1mM

There are number of parts to this series.

The first is the updated images for all the guests that didn't make it
into 9.2. There are also some new functional tests for virtio-gpu
along with some other clean-ups.

The qtest patches focus on ensuring things calling clock_step and
clock_set actually pay attention to return values. Currently only the
virtio tests needed a little re-jigging although arguably the timeout
loops aren't needed at all.

We bump libvirt-ci so we can move the riscv64 cross container to
testing/trixie which will hopefully make the image less prone to sid
breakages.

Finally we make a few tweaks to tests/vm which were helpful when
chasing the keymap issue. I still think there is a race condition in
there somewhere as I can't reliably build the FreeBSD VMs from
scratch.

The pc-bios dependency fixup I think addresses the failure but I'm a
little unsure about the meason stuff.

For v2
  - add test/vm and lcitool updates
  - don't move clock_step, remove them for virtio tests

I was planning on on making this a pre-PR but as I'm off for Christmas
this may as well percolate on the list for now. If any of the other
testing maintainers want to cherry-pick stuff into their PRs then be
my guest.

The following still need review:

  pc-bios: ensure keymaps dependencies set vnc tests
  tests/vm: allow interactive login as root
  tests/vm: partially un-tabify help output
  tests/vm: fix build_path based path
  tests/docker: move riscv64 cross container from sid to trixie
  tests/lcitool: bump to latest version of libvirt-ci
  tests/functional: extend test_aarch64_virt with vulkan test
  tests/functional: remove hacky sleep from the tests
  system/qtest: properly feedback results of clock_[step|set]
  tests/qtest: remove clock_steps from virtio tests
  util/qemu-timer: fix indentation

Alex.

Alex Bennée (25):
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
  util/qemu-timer: fix indentation
  tests/qtest: remove clock_steps from virtio tests
  system/qtest: properly feedback results of clock_[step|set]
  tests/functional: remove hacky sleep from the tests
  tests/functional: extend test_aarch64_virt with vulkan test
  tests/lcitool: bump to latest version of libvirt-ci
  tests/docker: move riscv64 cross container from sid to trixie
  tests/vm: fix build_path based path
  tests/vm: partially un-tabify help output
  tests/vm: allow interactive login as root
  pc-bios: ensure keymaps dependencies set vnc tests

Daniel P. Berrangé (1):
  tests/lcitool: remove temp workaround for debian mips64el

Pierrick Bouvier (1):
  tests/functional/aarch64: add tests for FEAT_RME

 MAINTAINERS                                   |   1 +
 system/qtest.c                                |  23 ++--
 tests/qtest/libqos/virtio.c                   |   4 -
 util/qemu-timer.c                             |   2 +-
 .gitlab-ci.d/cirrus/freebsd-14.vars           |   2 +-
 pc-bios/keymaps/meson.build                   |  17 ++-
 .../dockerfiles/debian-mips64el-cross.docker  |   9 ++
 .../dockerfiles/debian-riscv64-cross.docker   |   4 +-
 tests/functional/meson.build                  |   5 +
 tests/functional/test_aarch64_rme_sbsaref.py  |  70 +++++++++++
 tests/functional/test_aarch64_rme_virt.py     | 100 ++++++++++++++++
 tests/functional/test_aarch64_virt.py         | 113 +++++++++++++++---
 tests/functional/test_arm_tuxrun.py           |  28 ++---
 tests/functional/test_i386_tuxrun.py          |   8 +-
 tests/functional/test_m68k_tuxrun.py          |  34 ++++++
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
 33 files changed, 441 insertions(+), 163 deletions(-)
 create mode 100755 tests/functional/test_aarch64_rme_sbsaref.py
 create mode 100755 tests/functional/test_aarch64_rme_virt.py
 create mode 100644 tests/functional/test_m68k_tuxrun.py

-- 
2.39.5
