Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d277a1fsm922258566b.85.2025.05.21.09.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:42:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 31CB75F786;
	Wed, 21 May 2025 17:42:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	John Snow <jsnow@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 00/20] Maintainer updates for May (testing, plugins, virtio-gpu) - pre-PR
Date: Wed, 21 May 2025 17:42:30 +0100
Message-Id: <20250521164250.135776-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: bXGKoaGE6mUQ

Now the tree is open here is the state of my current maintainer
queues. I've tagged the virtio-gpu changes as Cc: qemu-stable but
given how close to release we were it didn't seem worth rushing them
in for 10.0. I've included a MAINTAINERS patch just to make sure I can
route any more fixes until a more full time maintainer volunteers.

Unless there are any major objections I intend to send the PR on Friday.

For v3
  - addressed review comments
  - included gdb/next patches

For v2
  - addressed various comments (see bellow --- in commits)
  - added Akihiko/Dmitry as virtio-gpu reviewers

The following still need review:

  MAINTAINERS: add Akihiko and Dmitry as reviewers
  MAINTAINERS: add myself to virtio-gpu for Odd Fixes
  tests/Makefile: include test-plugins in per-arch build deps
  tests/tcg: make aarch64 boot.S handle different starting modes
  tests/docker: expose $HOME/.cache/qemu as docker volume

Alex.

Alex Bennée (12):
  tests/docker: expose $HOME/.cache/qemu as docker volume
  gitlab: disable debug info on CI builds
  tests/tcg: make aarch64 boot.S handle different starting modes
  tests/Makefile: include test-plugins in per-arch build deps
  contrib/plugins: add a scaling factor to the ips arg
  contrib/plugins: allow setting of instructions per quantum
  MAINTAINERS: add myself to virtio-gpu for Odd Fixes
  MAINTAINERS: add Akihiko and Dmitry as reviewers
  hw/display: re-arrange memory region tracking
  include/exec: fix assert in size_memop
  include/gdbstub: fix include guard in commands.h
  gdbstub: assert earlier in handle_read_all_regs

Dominik 'Disconnect3d' Czarnota (1):
  gdbstub: Implement qGDBServerVersion packet

Dongwon Kim (1):
  ui/gtk-gl-area: Remove extra draw call in refresh

Gustavo Romero (1):
  tests/functional: Add PCI hotplug test for aarch64

Manos Pitsidianakis (3):
  virtio-gpu: fix hang under TCG when unmapping blob
  virtio-gpu: refactor async blob unmapping
  gdbstub: update aarch64-core.xml

Nabih Estefan (1):
  tests/qtest: fix igb test failure under --enable-ubsan

Yiwei Zhang (1):
  virtio-gpu: support context init multiple timeline

 MAINTAINERS                                  |  11 +-
 docs/about/emulation.rst                     |   4 +
 include/exec/memop.h                         |   4 +-
 include/gdbstub/commands.h                   |   2 +-
 include/system/memory.h                      |   1 +
 contrib/plugins/ips.c                        |  49 +++++-
 gdbstub/gdbstub.c                            |  19 ++-
 hw/display/virtio-gpu-virgl.c                | 104 ++++++++---
 tests/qtest/libqos/igb.c                     |   4 +-
 ui/gtk-gl-area.c                             |   1 -
 .gitlab-ci.d/buildtest-template.yml          |   1 +
 gdb-xml/aarch64-core.xml                     |  52 +++++-
 tests/Makefile.include                       |   2 +-
 tests/docker/Makefile.include                |  10 +-
 tests/functional/meson.build                 |   1 +
 tests/functional/test_aarch64_hotplug_pci.py |  74 ++++++++
 tests/tcg/aarch64/Makefile.softmmu-target    |   3 +-
 tests/tcg/aarch64/system/boot.S              | 171 ++++++++++++++++++-
 18 files changed, 464 insertions(+), 49 deletions(-)
 create mode 100755 tests/functional/test_aarch64_hotplug_pci.py

-- 
2.39.5
