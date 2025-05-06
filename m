Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557aesm7474495a12.12.2025.05.06.05.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1A6AE5F8BD;
	Tue,  6 May 2025 13:57:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 00/14] Maintainer updates for May (testing, plugins, virtio-gpu)
Date: Tue,  6 May 2025 13:57:01 +0100
Message-Id: <20250506125715.232872-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: HDg6OpM+3M+5

Now the tree is open here is the state of my current maintainer
queues. I've tagged the virtio-gpu changes as Cc: qemu-stable but
given how close to release we were it didn't seem worth rushing them
in for 10.0. I've included a MAINTAINERS patch just to make sure I can
route any more fixes until a more full time maintainer volunteers.

For v2
  - addressed various comments (see bellow --- in commits)
  - added Akihiko/Dmitry as virtio-gpu reviewers

The following still need review:

  MAINTAINERS: add Akihiko and Dmitry as reviewers
  MAINTAINERS: add myself to virtio-gpu for Odd Fixes
  tests/tcg: make aarch64 boot.S handle different starting modes
  tests/docker: expose $HOME/.cache/qemu as docker volume

Alex.

Alex Bennée (8):
  tests/docker: expose $HOME/.cache/qemu as docker volume
  gitlab: disable debug info on CI builds
  tests/tcg: make aarch64 boot.S handle different starting modes
  contrib/plugins: add a scaling factor to the ips arg
  contrib/plugins: allow setting of instructions per quantum
  MAINTAINERS: add myself to virtio-gpu for Odd Fixes
  MAINTAINERS: add Akihiko and Dmitry as reviewers
  hw/display: re-arrange memory region tracking

Dongwon Kim (1):
  ui/gtk-gl-area: Remove extra draw call in refresh

Manos Pitsidianakis (2):
  virtio-gpu: fix hang under TCG when unmapping blob
  virtio-gpu: refactor async blob unmapping

Nabih Estefan (1):
  Running with --enable-ubsan leads to a qtest failure

Peter Maydell (2):
  docs: Create a uniquelabel Sphinx extension
  docs: Use uniquelabel in qemu-block-drivers.rst.inc

 MAINTAINERS                               |   5 +-
 docs/about/emulation.rst                  |   4 +
 docs/conf.py                              |   1 +
 docs/devel/codebase.rst                   |   2 +-
 docs/sphinx/uniquelabel.py                |  74 ++++++++++++
 docs/system/qemu-block-drivers.rst.inc    |   2 +-
 include/system/memory.h                   |   1 +
 contrib/plugins/ips.c                     |  46 +++++++-
 hw/display/virtio-gpu-virgl.c             |  60 +++++-----
 tests/qtest/libqos/igb.c                  |   4 +-
 ui/gtk-gl-area.c                          |   1 -
 .gitlab-ci.d/buildtest-template.yml       |   1 +
 tests/docker/Makefile.include             |  10 +-
 tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
 tests/tcg/aarch64/system/boot.S           | 135 +++++++++++++++++++++-
 15 files changed, 309 insertions(+), 40 deletions(-)
 create mode 100644 docs/sphinx/uniquelabel.py

-- 
2.39.5
