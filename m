Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f17122587bsm1257673wml.36.2023.05.03.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:12:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0B7E31FFBA;
	Wed,  3 May 2023 10:12:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Andrew Jeffery <andrew@aj.id.au>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Beraldo Leal <bleal@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/22] testing/next: cirrus, docker, docs, ci, configs, gitlab
Date: Wed,  3 May 2023 10:12:22 +0100
Message-Id: <20230503091244.1450613-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: W1YwJHN4RRMG

This started as trying to un-wedge the FreeBSD 13 failure by running a
restricted build but then led down a rabbit hole of getting the
--without-default-devices build to pass. Fabiano had already been down
some of this road with ARM so I've nabbed his patches here but feel
free to cherry-pick into the arch tree if needed.

There are also patches to clean up the ansible configuration (driven
via lcitool) and prepare for upgrading the s390x runner to ubuntu
22.04.

Please review.

Alex Bennée (16):
  gitlab/cirrus: reduce scope of the FreeBSD testing matrix
  tests/docker: bump the xtensa base to debian:11-slim
  docs: document breakpoint and watchpoint support
  scripts/ci: add gitlab-runner to kvm group
  hw/alpha: make E1000_PCI a hard dependency for clipper
  hw/hppa: add TULIP as a dependency for HPPA_B160L
  hw/sparc: add a TCX dependency for SUN4M machines
  hw/loongarch: add VIRTIO as a dependency for LOONGARCH_VIRT
  hw/sh4: make RTL8139 a hard dependency for RD2
  hw/mips: add VIRTIO and USB dependencies for LOONGSON3V
  hw/xtensa: add VIRTIO as dependencies for XTENSA_VIRT
  scripts/ci: clean-up the 20.04/22.04 confusion in ansible
  gitlab: add ubuntu-22.04-aarch64-without-defaults
  gitlab: enable minimal device profoile for aarch64 --disable-tcg
  tests/avocado: use http for mipsdistros.mips.com
  tests/qtest: skip bcm2835-test if no raspi3b model

Fabiano Rosas (6):
  hw/arm: Select VIRTIO_NET for virt machine
  hw/arm: Select VIRTIO_BLK for virt machine
  hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine
  hw/arm: Select GICV3_TCG for sbsa-ref machine
  hw/arm: Select e1000e for sbsa-ref machine
  hw/arm: Select VGA_PCI for sbsa-ref machine

 docs/system/gdb.rst                           |  22 ++++
 tests/qtest/bcm2835-dma-test.c                |  11 +-
 .gitlab-ci.d/cirrus.yml                       |   1 +
 .../custom-runners/ubuntu-22.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |  28 ++++-
 hw/alpha/Kconfig                              |   2 +-
 hw/arm/Kconfig                                |   7 ++
 hw/hppa/Kconfig                               |   1 +
 hw/loongarch/Kconfig                          |   2 +
 hw/mips/Kconfig                               |   3 +
 hw/sh4/Kconfig                                |   2 +-
 hw/sparc/Kconfig                              |   1 +
 hw/usb/Kconfig                                |   1 -
 hw/xtensa/Kconfig                             |   2 +
 scripts/ci/setup/build-environment.yml        | 111 ++++++++++++------
 scripts/ci/setup/gitlab-runner.yml            |   1 +
 tests/avocado/replay_kernel.py                |   6 +-
 .../dockerfiles/debian-xtensa-cross.docker    |   2 +-
 18 files changed, 154 insertions(+), 51 deletions(-)

-- 
2.39.2
