Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862f0e6ea2sm13170856f8f.79.2024.12.10.12.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:43:51 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6DB445F87D;
	Tue, 10 Dec 2024 20:43:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Eric Farman <farman@linux.ibm.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Bernhard Beschow <shentey@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Markus Armbruster <armbru@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 00/20] testing/next: functional tests and qtest timers
Date: Tue, 10 Dec 2024 20:43:29 +0000
Message-Id: <20241210204349.723590-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: w1oMlGDA7PZO

There are two parts to this series. The first is the updated images
for all the guests that didn't make it into 9.2. There are also some
new functional tests for virtio-gpu along with some other clean-ups.

The qtest patches focus on ensuring things calling clock_step and
clock_set actually pay attention to return values. Currently only the
virtio tests needed a little re-jigging although arguably the timeout
loops aren't needed at all.

Please review:

  tests/functional: extend test_aarch64_virt with vulkan test
  tests/functional: remove hacky sleep from the tests
  system/qtest: properly feedback results of clock_[step|set]
  tests/qtest: move clock_steps to after checks
  util/qemu-timer: fix indentation

Alex.

Alex Bennée (19):
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
  tests/qtest: move clock_steps to after checks
  system/qtest: properly feedback results of clock_[step|set]
  tests/functional: remove hacky sleep from the tests
  tests/functional: extend test_aarch64_virt with vulkan test

Pierrick Bouvier (1):
  tests/functional/aarch64: add tests for FEAT_RME

 system/qtest.c                               |  23 ++--
 tests/qtest/libqos/virtio.c                  |   6 +-
 util/qemu-timer.c                            |   2 +-
 tests/functional/meson.build                 |   5 +
 tests/functional/test_aarch64_rme_sbsaref.py |  70 +++++++++++++
 tests/functional/test_aarch64_rme_virt.py    | 100 ++++++++++++++++++
 tests/functional/test_aarch64_virt.py        | 105 ++++++++++++++++---
 tests/functional/test_arm_tuxrun.py          |  28 ++---
 tests/functional/test_i386_tuxrun.py         |   8 +-
 tests/functional/test_m68k_tuxrun.py         |  34 ++++++
 tests/functional/test_mips64_tuxrun.py       |   8 +-
 tests/functional/test_mips64el_tuxrun.py     |   8 +-
 tests/functional/test_mips_tuxrun.py         |   8 +-
 tests/functional/test_mipsel_tuxrun.py       |   8 +-
 tests/functional/test_ppc64_tuxrun.py        |  16 +--
 tests/functional/test_ppc_tuxrun.py          |   8 +-
 tests/functional/test_riscv32_tuxrun.py      |   8 +-
 tests/functional/test_riscv64_tuxrun.py      |  16 +--
 tests/functional/test_s390x_tuxrun.py        |   8 +-
 tests/functional/test_sparc64_tuxrun.py      |   8 +-
 tests/functional/test_x86_64_tuxrun.py       |   8 +-
 21 files changed, 387 insertions(+), 98 deletions(-)
 create mode 100755 tests/functional/test_aarch64_rme_sbsaref.py
 create mode 100755 tests/functional/test_aarch64_rme_virt.py
 create mode 100644 tests/functional/test_m68k_tuxrun.py

-- 
2.39.5
