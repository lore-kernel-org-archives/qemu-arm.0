Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d408b000000b0032196c508e3sm11489021wrp.53.2023.11.15.12.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 12:55:43 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B55AB5F76C;
	Wed, 15 Nov 2023 20:55:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH 00/10] random fixes for 8.2 (tests, plugins, docs, semihosting)
Date: Wed, 15 Nov 2023 20:55:32 +0000
Message-Id: <20231115205542.3092038-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Q3oDhSGsZv1a

I've just been trying to clear some of the bugs against various
subsystems. These are mostly testing changes and a minor tweak I found
while checking up on semihosting behaviour. Enabling arm-softmmu
check-tcg tests expands our testing abilities slightly for the 32 bit
side of the family.

Let me know if there are any other patches worth picking up.

The following need review:

  tests/tcg: enable semiconsole test for Arm
  tests/tcg: enable arm softmmu tests
  testing: move arm system tests into their own folder
  hw/core: skip loading debug on all failures
  docs/emulation: expand warning about semihosting
  tests/tcg: fixup Aarch64 semiconsole test

Alex Bennée (7):
  tests/docker: merge debian-native with debian-amd64
  tests/tcg: fixup Aarch64 semiconsole test
  docs/emulation: expand warning about semihosting
  hw/core: skip loading debug on all failures
  testing: move arm system tests into their own folder
  tests/tcg: enable arm softmmu tests
  tests/tcg: enable semiconsole test for Arm

Daniel P. Berrangé (1):
  tests/docker: replace fedora-i386 with debian-i686

Greg Manning (1):
  plugins: fix win plugin tests on cross compile

Philippe Mathieu-Daudé (1):
  .gitlab-ci.d/cirrus: Upgrade macOS to 13 (Ventura)

 docs/about/emulation.rst                      |   5 +-
 configure                                     |   2 +-
 hw/core/loader.c                              |   2 +-
 tests/tcg/arm/system/semiconsole.c            |  42 +++
 .gitlab-ci.d/buildtest.yml                    |  12 +-
 .gitlab-ci.d/cirrus.yml                       |   6 +-
 .../cirrus/{macos-12.vars => macos-13.vars}   |   2 +-
 .gitlab-ci.d/container-cross.yml              |  11 +-
 .gitlab-ci.d/containers.yml                   |   2 +-
 .gitlab-ci.d/crossbuilds.yml                  |  14 +-
 contrib/plugins/Makefile                      |   2 +-
 plugins/meson.build                           |   2 +-
 tests/docker/Makefile.include                 |   3 -
 .../dockerfiles/debian-i686-cross.docker      | 182 +++++++++++
 tests/docker/dockerfiles/debian-native.docker |  54 ----
 .../{debian-amd64.docker => debian.docker}    |   7 +-
 .../dockerfiles/fedora-i386-cross.docker      |  40 ---
 tests/lcitool/refresh                         |  18 +-
 tests/plugin/meson.build                      |   3 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   5 +-
 tests/tcg/arm/Makefile.softmmu-target         |  76 ++++-
 tests/tcg/arm/system/boot.S                   | 288 ++++++++++++++++++
 tests/tcg/arm/system/kernel.ld                |  24 ++
 .../tcg/arm/{ => system}/test-armv6m-undef.S  |   0
 .../tcg/arm/{ => system}/test-armv6m-undef.ld |   0
 25 files changed, 655 insertions(+), 147 deletions(-)
 create mode 100644 tests/tcg/arm/system/semiconsole.c
 rename .gitlab-ci.d/cirrus/{macos-12.vars => macos-13.vars} (95%)
 create mode 100644 tests/docker/dockerfiles/debian-i686-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-native.docker
 rename tests/docker/dockerfiles/{debian-amd64.docker => debian.docker} (96%)
 delete mode 100644 tests/docker/dockerfiles/fedora-i386-cross.docker
 create mode 100644 tests/tcg/arm/system/boot.S
 create mode 100644 tests/tcg/arm/system/kernel.ld
 rename tests/tcg/arm/{ => system}/test-armv6m-undef.S (100%)
 rename tests/tcg/arm/{ => system}/test-armv6m-undef.ld (100%)

-- 
2.39.2
