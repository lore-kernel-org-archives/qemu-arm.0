Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1e77dff28sm254369066b.24.2025.03.04.14.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:41 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 664F65F932;
	Tue,  4 Mar 2025 22:24:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Warner Losh <imp@bsdimp.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 00/32] maintainer updates for 10.0 softfreeze (gpu/tcg tests, plugins, MAINTAINERS) pre-PR
Date: Tue,  4 Mar 2025 22:24:07 +0000
Message-Id: <20250304222439.2035603-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: etUzHjg/XdQb

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
  - I have added a gitlab script to track the total number of build units

Misc

  - MAINTAINERS updates due to sanctions
  - meson.build split debug change

I should send out the pre-PR sometime next week, hopefully getting my
10.0 PR submitted with time to spare ;-)

The following still need review:

  meson.build: default to -gsplit-dwarf for debug info
  plugins/core: make a single build unit
  gitlab: add a new build_unit job to track build size
  tests/tcg: fix constraints in test-i386-adcox
  tests/functional: update the aarch64_virg_gpu images
  tests/functional: bail early if vkmark hangs
  tests/functional: factor out common code in gpu test
  tests/functional: move aarch64 GPU test into own file

Alex.

Alex Bennée (27):
  tests/functional: move aarch64 GPU test into own file
  tests/functional: factor out common code in gpu test
  tests/functional: ensure we have a GPU device for tests
  tests/functional: bail early if vkmark hangs
  tests/functional: skip vulkan tests with nVidia
  tests/functional: expand tests to cover virgl
  tests/functional: update the aarch64_virg_gpu images
  libvirt-ci: bump to latest for vulkan-tools
  tests/vm: bump timeout for shutdown
  tests/tcg: mark test-vma as a linux-only test
  tests/tcg: add message to _Static_assert in test-avx
  tests/tcg: fix constraints in test-i386-adcox
  tests/tcg: enable -fwrapv for test-i386-bmi
  gitlab: add a new build_unit job to track build size
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
  plugins/core: make a single build unit
  MAINTAINERS: remove widely sanctioned entities
  meson.build: default to -gsplit-dwarf for debug info

Peter Maydell (1):
  tests/tcg: Suppress compiler false-positive warning on sha1.c

Philippe Mathieu-Daudé (2):
  tests/functional: Introduce the dso_suffix() helper
  tests/functional: Allow running TCG plugins tests on non-Linux/BSD
    hosts

Pierrick Bouvier (2):
  plugins: add explicit dependency in functional tests
  tests/functional: add boot error detection for RME tests

 MAINTAINERS                                   |   7 +-
 meson.build                                   |   8 +-
 include/qemu/plugin-memory.h                  |   1 -
 plugins/plugin.h                              |   7 +
 bsd-user/plugin-api.c                         |  15 ++
 linux-user/plugin-api.c                       |  15 ++
 plugins/api-system.c                          | 131 ++++++++++++++
 plugins/api-user.c                            |  57 ++++++
 plugins/api.c                                 | 171 +-----------------
 plugins/core.c                                |  10 +-
 plugins/loader.c                              |  15 +-
 plugins/system.c                              |  24 +++
 plugins/user.c                                |  19 ++
 tests/tcg/i386/test-avx.c                     |   2 +-
 tests/tcg/i386/test-i386-adcox.c              |   4 +-
 tests/tcg/multiarch/{ => linux}/test-vma.c    |   0
 common-user/plugin-api.c.inc                  |  43 +++++
 .gitlab-ci.d/check-units.py                   |  66 +++++++
 .gitlab-ci.d/cirrus/freebsd-14.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-14.vars             |   2 +-
 .gitlab-ci.d/static_checks.yml                |  22 +++
 bsd-user/meson.build                          |   1 +
 contrib/plugins/meson.build                   |   2 +
 linux-user/meson.build                        |   1 +
 meson_options.txt                             |   2 +
 plugins/meson.build                           |  11 +-
 .../ci/setup/ubuntu/ubuntu-2204-aarch64.yaml  |   1 +
 .../ci/setup/ubuntu/ubuntu-2204-s390x.yaml    |   1 +
 scripts/meson-buildoptions.sh                 |   2 +
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
 tests/functional/meson.build                  |   6 +-
 tests/functional/qemu_test/__init__.py        |   2 +-
 tests/functional/qemu_test/config.py          |  12 ++
 tests/functional/qemu_test/testcase.py        |  12 +-
 tests/functional/test_aarch64_rme_sbsaref.py  |   3 +-
 tests/functional/test_aarch64_rme_virt.py     |   3 +-
 tests/functional/test_aarch64_tcg_plugins.py  |   5 +-
 tests/functional/test_aarch64_virt.py         |  71 --------
 tests/functional/test_aarch64_virt_gpu.py     | 133 ++++++++++++++
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   1 +
 tests/lcitool/refresh                         |   2 +-
 tests/tcg/aarch64/Makefile.target             |   3 +-
 tests/tcg/arm/Makefile.target                 |   3 +-
 tests/tcg/i386/Makefile.target                |   2 +-
 tests/tcg/multiarch/Makefile.target           |   8 +
 tests/tcg/plugins/meson.build                 |   2 +
 tests/vm/basevm.py                            |   2 +-
 tests/vm/generated/freebsd.json               |   1 +
 64 files changed, 650 insertions(+), 303 deletions(-)
 create mode 100644 bsd-user/plugin-api.c
 create mode 100644 linux-user/plugin-api.c
 create mode 100644 plugins/api-system.c
 create mode 100644 plugins/api-user.c
 create mode 100644 plugins/system.c
 create mode 100644 plugins/user.c
 rename tests/tcg/multiarch/{ => linux}/test-vma.c (100%)
 create mode 100644 common-user/plugin-api.c.inc
 create mode 100755 .gitlab-ci.d/check-units.py
 create mode 100755 tests/functional/test_aarch64_virt_gpu.py

-- 
2.39.5
