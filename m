Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q14sm21784913wrw.39.2019.02.07.10.37.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:45 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 945ED1FF80;
	Thu,  7 Feb 2019 18:37:44 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 00/16] current testing/next queue (with build fixes)
Date: Thu,  7 Feb 2019 18:37:28 +0000
Message-Id: <20190207183744.5054-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QwEI7CZQnO7m


Hi,

There are a few more additions from the last iteration including some
more fixes to try and get Travis green again. It's nice to see our ARM
features are now catching up we need a newer toolchain to build
things. I did try upgrading to debian 10 for the cross build but there
are some upstream problems with the multiarch build deps that get in
the way of that. People with Debian packaging experience can jump in
on:

  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=921458
  (dependancy on gcc-s390x-linux-gnu fails on non-x86 hosts)

  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=921648
  (apt-get build-dep -a arm64 qemu fails on multiarch setup)

as it would be good to get these problems fixed as we get to
softfreeze (and given how much we leverage Debian's cross toolchains).

If all the testing is green by tomorrow I'll put together a pull
request. Unless people are desperate to grab the arm64 compiler image
now as a build fix?

The following patches need review
 patch 0004/.travis.yml fold disable tcg into alternate corou.patch
 patch 0007/docker add debian buster arm64 cross.patch
 patch 0008/tests make docker.py update use configured binfmt.patch
 patch 0009/tests make docker.py check for persistent configs.patch
 patch 0010/tests docker.py be even smarter with persistent b.patch
 patch 0011/tests PEP8 cleanup of docker.py mostly white spac.patch
 patch 0016/scripts qemu.py allow arches use KVM for their 32.patch


Alex Bennée (11):
  .travis.yml: separate tools and docs into another entry
  .travis.yml: fold --disable-tcg into alternate coroutine builds
  docker: add debian-buster-arm64-cross
  tests: make docker.py update use configured binfmt path
  tests: make docker.py check for persistent configs
  tests: docker.py be even smarter with persistent binfmt_misc
  tests: PEP8 cleanup of docker.py, mostly white space
  tests/vm: call make check directly for netbsd/freebsd/ubuntu.i386
  tests/vm: add --build-target option
  tests/vm: expose BUILD_TARGET, TARGET_LIST and EXTRA_CONFIGURE_OPTS
  scripts/qemu.py: allow arches use KVM for their 32bit cousins

Daniel P. Berrangé (1):
  .travis.yml: stop requesting libffi & gettext from homebrew

Ed Maste (1):
  .cirrus.yml: basic compile and test for FreeBSD

Gerd Hoffmann (1):
  tests/vm: move images to $HOME/.cache/qemu-vm/images

Philippe Mathieu-Daudé (2):
  MAINTAINERS: Add an entry for scripts/archive-source.sh
  archive-source.sh: Clone the submodules locally

 .cirrus.yml                                   |  16 +++
 .travis.yml                                   |  31 +++--
 MAINTAINERS                                   |   9 ++
 scripts/archive-source.sh                     |   7 ++
 scripts/qemu.py                               |  12 +-
 tests/docker/Makefile.include                 |   1 +
 tests/docker/docker.py                        | 110 +++++++++++++-----
 .../debian-buster-arm64-cross.docker          |  15 +++
 tests/docker/dockerfiles/debian10.docker      |  31 +++++
 tests/tcg/aarch64/Makefile.include            |   2 +-
 tests/vm/Makefile.include                     |  22 +++-
 tests/vm/basevm.py                            |   3 +
 tests/vm/freebsd                              |   3 +-
 tests/vm/netbsd                               |   3 +-
 tests/vm/ubuntu.i386                          |   3 +-
 15 files changed, 213 insertions(+), 55 deletions(-)
 create mode 100644 .cirrus.yml
 create mode 100644 tests/docker/dockerfiles/debian-buster-arm64-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian10.docker

-- 
2.20.1
