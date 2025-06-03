Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-605671437e0sm7347925a12.52.2025.06.03.04.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:02:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D5B715F839;
	Tue, 03 Jun 2025 12:02:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH v4 00/17] Maintainer updates for May (testing, plugins, virtio-gpu) - pre-PR
Date: Tue,  3 Jun 2025 12:01:47 +0100
Message-ID: <20250603110204.838117-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: jlQK9W2dX/pq

Now the tree is open here is the state of my current maintainer
queues. I've tagged the virtio-gpu changes as Cc: qemu-stable but
given how close to release we were it didn't seem worth rushing them
in for 10.0. I've included a MAINTAINERS patch just to make sure I can
route any more fixes until a more full time maintainer volunteers.

As there is still controversy about a theoretical UAF in virtio-gpu
I've dropped that patch for now. There were a number of other review
comments addressed so I'm re-sending the pre-PR so I can roll the PR
later this week.

For v4
  - more review comments
  - made boot.S error handling more robust
  - dropped virtio-gpu hang fix for TCG
  - dropped test-plugins fix for Makefile

For v3
  - addressed review comments
  - included gdb/next patches

For v2
  - addressed various comments (see bellow --- in commits)
  - added Akihiko/Dmitry as virtio-gpu reviewers

The following still need review:

  tests/tcg: make aarch64 boot.S handle different starting modes

Alex.

Alex Bennée (11):
  tests/docker: expose $HOME/.cache/qemu as docker volume
  gitlab: disable debug info on CI builds
  tests/tcg: make aarch64 boot.S handle different starting modes
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

Manos Pitsidianakis (2):
  virtio-gpu: refactor async blob unmapping
  gdbstub: update aarch64-core.xml

Nabih Estefan (1):
  tests/qtest: Avoid unaligned access in IGB test

Yiwei Zhang (1):
  virtio-gpu: support context init multiple timeline

 MAINTAINERS                               |   5 +-
 docs/about/emulation.rst                  |   4 +
 include/exec/memop.h                      |   4 +-
 include/gdbstub/commands.h                |   2 +-
 include/system/memory.h                   |   1 +
 contrib/plugins/ips.c                     |  49 +++++-
 gdbstub/gdbstub.c                         |  19 ++-
 hw/display/virtio-gpu-virgl.c             | 102 +++++++++----
 tests/qtest/libqos/igb.c                  |   4 +-
 ui/gtk-gl-area.c                          |   1 -
 .gitlab-ci.d/buildtest-template.yml       |   1 +
 gdb-xml/aarch64-core.xml                  |  52 ++++++-
 tests/docker/Makefile.include             |  10 +-
 tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
 tests/tcg/aarch64/system/boot.S           | 172 +++++++++++++++++++++-
 15 files changed, 382 insertions(+), 47 deletions(-)

-- 
2.47.2
