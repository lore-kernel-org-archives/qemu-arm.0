Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd882602sm5654984f8f.41.2025.02.26.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:44 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DB8195F924;
	Wed, 26 Feb 2025 14:03:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 00/25] maintainer updates for 10.0 softfreeze (gpu/tcg tests, plugins, MAINTAINERS)
Date: Wed, 26 Feb 2025 14:03:18 +0000
Message-Id: <20250226140343.3907080-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: bzHLXpm/3Jc0

As we rapidly approach softfreeze (due March 11th) its time to collect
together what I'm planning to merge for this release.

Testing

  - expand the aarch64 GPU tests
  - bump libvirt-ci for vulkan-tools
  - some fixes for clang compile of tcg

I've dropped the host-gpu patch in favour of just skipping the test in
python when we detect nVidia drivers.

The clang fixes are part way to removing the skip we have in
configure:

      case $target_arch in
        i386|x86_64)
          if $target_cc --version | grep -qi "clang"; then
            continue
          fi
          ;;
      esac

So that we can build tcg tests on the BSDs (at least for native
guests) and widen the testing. The work is unfinished but anyone wants
to tackle it just patch out the above bit in configure and try and
build and run check-tcg.

Plugins

  - reduce the total number of compilation units

I'll see if I can add a test to track the total number as we aim to
clean-up stuff for single binary purposes.

MAINTAINERS

  - updates due to sanctions

I should send out the pre-PR sometime next week, hopefully getting my
10.0 PR submitted with time to spare ;-)

The following still need review:

  plugins/api: split out binary path/start/end/entry code
  plugins/api: use qemu_target_page_mask() to get value
  tests/tcg: enable -fwrapv for test-i386-bmi
  tests/tcg: fix constraints in test-i386-adcox
  tests/tcg: add message to _Static_assert in test-avx
  tests/tcg: mark test-vma as a linux-only test
  tests/vm: bump timeout for shutdown
  libvirt-ci: bump to latest for vulkan-tools (libvirt MR 525)
  tests/functional: skip vulkan tests with nVidia
  tests/functional: expand tests to cover virgl
  tests/functional: ensure we have a GPU device for tests
  tests/functional: factor out common code in gpu test
  tests/functional: move aarch64 GPU test into own file

Alex.

Alex Bennée (22):
  tests/functional: move aarch64 GPU test into own file
  tests/functional: factor out common code in gpu test
  tests/functional: ensure we have a GPU device for tests
  tests/functional: expand tests to cover virgl
  tests/functional: skip vulkan tests with nVidia
  libvirt-ci: bump to latest for vulkan-tools (libvirt MR 525)
  tests/vm: bump timeout for shutdown
  tests/tcg: mark test-vma as a linux-only test
  tests/tcg: add message to _Static_assert in test-avx
  tests/tcg: fix constraints in test-i386-adcox
  tests/tcg: enable -fwrapv for test-i386-bmi
  plugins/api: use qemu_target_page_mask() to get value
  plugins/loader: populate target_name with target_name()
  include/qemu: plugin-memory.h doesn't need cpu-defs.h
  plugins/api: clean-up the includes
  plugins/plugin.h: include queue.h
  plugins/loader: compile loader only once
  plugins/api: split out binary path/start/end/entry code
  plugins/api: split out the vaddr/hwaddr helpers
  plugins/api: split out time control helpers
  plugins/api: build only once
  MAINTAINERS: remove widely sanctioned entities

Philippe Mathieu-Daudé (2):
  tests/functional: Introduce the dso_suffix() helper
  tests/functional: Allow running TCG plugins tests on non-Linux/BSD
    hosts

Pierrick Bouvier (1):
  plugins: add explicit dependency in functional tests

 MAINTAINERS                                   |   7 +-
 meson.build                                   |   1 +
 include/qemu/plugin-memory.h                  |   1 -
 plugins/plugin.h                              |   7 +
 bsd-user/plugin-api.c                         |  15 ++
 linux-user/plugin-api.c                       |  14 ++
 plugins/api-system.c                          | 131 ++++++++++++++
 plugins/api-user.c                            |  57 ++++++
 plugins/api.c                                 | 171 +-----------------
 plugins/loader.c                              |  15 +-
 plugins/system.c                              |  24 +++
 plugins/user.c                                |  19 ++
 tests/tcg/i386/test-avx.c                     |   2 +-
 tests/tcg/i386/test-i386-adcox.c              |   4 +-
 tests/tcg/multiarch/{ => linux}/test-vma.c    |   0
 common-user/plugin-api.c.inc                  |  43 +++++
 .gitlab-ci.d/cirrus/freebsd-14.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-14.vars             |   2 +-
 bsd-user/meson.build                          |   1 +
 contrib/plugins/meson.build                   |   2 +
 linux-user/meson.build                        |   1 +
 plugins/meson.build                           |   8 +-
 .../ci/setup/ubuntu/ubuntu-2204-aarch64.yaml  |   1 +
 .../ci/setup/ubuntu/ubuntu-2204-s390x.yaml    |   1 +
 tests/docker/dockerfiles/alpine.docker        |   5 +-
 tests/docker/dockerfiles/centos9.docker       |   1 +
 .../dockerfiles/debian-amd64-cross.docker     |   3 +-
 .../dockerfiles/debian-arm64-cross.docker     |   3 +-
 .../dockerfiles/debian-armhf-cross.docker     |   3 +-
 .../dockerfiles/debian-i686-cross.docker      |   3 +-
 .../dockerfiles/debian-mips64el-cross.docker  |   3 +-
 .../dockerfiles/debian-mipsel-cross.docker    |   3 +-
 .../dockerfiles/debian-ppc64el-cross.docker   |   3 +-
 .../dockerfiles/debian-s390x-cross.docker     |   3 +-
 tests/docker/dockerfiles/debian.docker        |   3 +-
 .../dockerfiles/fedora-rust-nightly.docker    |   1 +
 .../dockerfiles/fedora-win64-cross.docker     |   1 +
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker |   1 +
 tests/docker/dockerfiles/ubuntu2204.docker    |   1 +
 tests/functional/meson.build                  |   4 +-
 tests/functional/qemu_test/__init__.py        |   2 +-
 tests/functional/qemu_test/config.py          |   6 +
 tests/functional/test_aarch64_tcg_plugins.py  |  11 +-
 tests/functional/test_aarch64_virt.py         |  71 --------
 tests/functional/test_aarch64_virt_gpu.py     | 131 ++++++++++++++
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   1 +
 tests/lcitool/refresh                         |   2 +-
 tests/tcg/i386/Makefile.target                |   2 +-
 tests/tcg/plugins/meson.build                 |   2 +
 tests/vm/basevm.py                            |   2 +-
 tests/vm/generated/freebsd.json               |   1 +
 53 files changed, 520 insertions(+), 284 deletions(-)
 create mode 100644 bsd-user/plugin-api.c
 create mode 100644 linux-user/plugin-api.c
 create mode 100644 plugins/api-system.c
 create mode 100644 plugins/api-user.c
 create mode 100644 plugins/system.c
 create mode 100644 plugins/user.c
 rename tests/tcg/multiarch/{ => linux}/test-vma.c (100%)
 create mode 100644 common-user/plugin-api.c.inc
 create mode 100755 tests/functional/test_aarch64_virt_gpu.py

-- 
2.39.5
