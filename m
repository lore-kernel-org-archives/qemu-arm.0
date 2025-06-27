Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e62144sm2475188f8f.92.2025.06.27.04.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:25:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2F5A25F82D;
	Fri, 27 Jun 2025 12:25:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-s390x@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH 00/15] Maintainer updates for June (tests, semihosting, plugins, gpu) pre-PR
Date: Fri, 27 Jun 2025 12:24:56 +0100
Message-ID: <20250627112512.1880708-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: byfPThIEmVtt

Hi,

Here is the rolled up set of patches from my various maintainer trees.

From testing/next:

  - new pci hotplug tests

From semihosting/next

  - compile once updates

From plugins/next

  - register write support for plugins
  - memory read/write support (see caveats in APIs)

I've also been tracking the discontinuity changes but I don't know if
they will be ready by 10.1 softfreeze.

From virtio-gpu/next:

  - MAINTAINER updates
  - context init

I've left the other patches which try to untangle the various
memory race conditions until we have a clear path forward.

Only one patch needs review:

  gitlab: mark s390x-system to allow failures

I intend to send the PR in next week.

Alex.

Alex Bennée (3):
  gitlab: mark s390x-system to allow failures
  MAINTAINERS: add myself to virtio-gpu for Odd Fixes
  MAINTAINERS: add Akihiko and Dmitry as reviewers

Gustavo Romero (1):
  tests/functional: Add PCI hotplug test for aarch64

Philippe Mathieu-Daudé (2):
  semihosting/uaccess: Remove uses of target_ulong type
  semihosting/uaccess: Compile once

Rowan Hart (8):
  gdbstub: Expose gdb_write_register function to consumers of gdbstub
  plugins: Add register write API
  plugins: Add enforcement of QEMU_PLUGIN_CB flags in register R/W
    callbacks
  plugins: Add memory virtual address write API
  plugins: Add memory hardware address read/write API
  tests/tcg: Remove copy-pasted notes and from i386 and add x86_64
    system tests to tests
  plugins: Add patcher plugin and test
  plugins: Update plugin version and add notes

Yiwei Zhang (1):
  virtio-gpu: support context init multiple timeline

 MAINTAINERS                                   |  11 +-
 include/exec/gdbstub.h                        |  14 +
 include/hw/core/cpu.h                         |   1 +
 include/qemu/plugin.h                         |  15 ++
 include/qemu/qemu-plugin.h                    | 176 +++++++++++-
 include/semihosting/uaccess.h                 |  12 +-
 accel/tcg/plugin-gen.c                        |  30 +++
 gdbstub/gdbstub.c                             |   2 +-
 hw/display/virtio-gpu-virgl.c                 |  44 +++
 plugins/api.c                                 | 135 +++++++++-
 plugins/core.c                                |  33 +++
 semihosting/uaccess.c                         |  10 +-
 tests/tcg/plugins/patch.c                     | 251 ++++++++++++++++++
 tests/tcg/x86_64/system/patch-target.c        |  22 ++
 .../custom-runners/ubuntu-22.04-s390x.yml     |   2 +
 semihosting/meson.build                       |   5 +-
 tests/functional/meson.build                  |   1 +
 tests/functional/test_aarch64_hotplug_pci.py  |  71 +++++
 tests/tcg/Makefile.target                     |   7 +-
 tests/tcg/plugins/meson.build                 |   2 +-
 tests/tcg/x86_64/Makefile.softmmu-target      |  21 +-
 tests/tcg/x86_64/system/validate-patch.py     |  39 +++
 22 files changed, 862 insertions(+), 42 deletions(-)
 create mode 100644 tests/tcg/plugins/patch.c
 create mode 100644 tests/tcg/x86_64/system/patch-target.c
 create mode 100755 tests/functional/test_aarch64_hotplug_pci.py
 create mode 100755 tests/tcg/x86_64/system/validate-patch.py

-- 
2.47.2
