Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbc3sm622870366b.3.2025.04.28.05.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:59:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 42B225F905;
	Mon, 28 Apr 2025 13:59:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 0/9] Maintainer updates for May (testing, plugins, virtio-gpu)
Date: Mon, 28 Apr 2025 13:59:09 +0100
Message-Id: <20250428125918.449346-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: BHS8TK78aOM5

Now the tree is open here is the state of my current maintainer
queues. I've tagged the virtio-gpu changes as Cc: qemu-stable but
given how close to release we were it didn't seem worth rushing them
in for 10.0. I've included a MAINTAINERS patch just to make sure I can
route any more fixes until a more full time maintainer volunteers.

The following need review:

  MAINTAINERS: add myself to virtio-gpu for Odd Fixes
  contrib/plugins: allow setting of instructions per quantum
  contrib/plugins: add a scaling factor to the ips arg
  tests/tcg: make aarch64 boot.S handle different starting modes
  gitlab: disable debug info on CI builds
  tests/docker: expose $HOME/.cache as docker volume

Alex.

Alex Bennée (7):
  tests/docker: expose $HOME/.cache as docker volume
  gitlab: disable debug info on CI builds
  tests/tcg: make aarch64 boot.S handle different starting modes
  contrib/plugins: add a scaling factor to the ips arg
  contrib/plugins: allow setting of instructions per quantum
  MAINTAINERS: add myself to virtio-gpu for Odd Fixes
  hw/display: re-arrange memory region tracking

Manos Pitsidianakis (2):
  virtio-gpu: fix hang under TCG when unmapping blob
  virtio-gpu: refactor async blob unmapping

 MAINTAINERS                               |   3 +-
 docs/about/emulation.rst                  |   4 +
 include/system/memory.h                   |   1 +
 contrib/plugins/ips.c                     |  33 +++++-
 hw/display/virtio-gpu-virgl.c             |  60 +++++-----
 .gitlab-ci.d/buildtest-template.yml       |   1 +
 tests/docker/Makefile.include             |   1 +
 tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
 tests/tcg/aarch64/system/boot.S           | 127 +++++++++++++++++++++-
 9 files changed, 202 insertions(+), 31 deletions(-)

-- 
2.39.5
