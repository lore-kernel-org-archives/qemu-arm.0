Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p13-20020a1c544d000000b003e208cec49bsm8971006wmi.3.2023.02.24.10.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 10:08:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 98F121FFB7;
	Fri, 24 Feb 2023 18:08:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Ed Maste <emaste@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-block@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Hanna Reitz <hreitz@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Date: Fri, 24 Feb 2023 18:08:50 +0000
Message-Id: <20230224180857.1050220-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Alz2G04lpN5b

This series attempts to remove our dependence on the docker.py script
and build things directly with the appropriate tool. I've been
noodling around with how we build images on gitlab to see if they can
cache better because the normal case should be we don't need to
rebuild everything if the upstream distro hasn't updated its package
list.

Anyway what do people think?

Alex Bennée (7):
  configure: expose the direct container command
  tests/dockerfiles: unify debian-toolchain references
  tests/lcitool: append user setting stanza to dockerfiles
  tests/docker: add USER stanzas to non-lci images
  tests/docker: use direct RUNC call to build containers
  tests/docker: use direct RUNC call to run test jobs
  tests/gitlab: use kaniko to build images

 configure                                     |  3 +++
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  5 ++++
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  5 ++++
 .gitlab-ci.d/cirrus/macos-12.vars             |  5 ++++
 .gitlab-ci.d/container-template.yml           | 23 +++++++---------
 tests/docker/Makefile.include                 | 27 +++++++++++--------
 tests/docker/dockerfiles/alpine.docker        |  5 ++++
 tests/docker/dockerfiles/centos8.docker       |  5 ++++
 .../dockerfiles/debian-all-test-cross.docker  |  5 ++++
 .../dockerfiles/debian-alpha-cross.docker     |  5 ++++
 .../dockerfiles/debian-amd64-cross.docker     |  5 ++++
 tests/docker/dockerfiles/debian-amd64.docker  |  5 ++++
 .../dockerfiles/debian-arm64-cross.docker     |  5 ++++
 .../dockerfiles/debian-armel-cross.docker     |  5 ++++
 .../dockerfiles/debian-armhf-cross.docker     |  5 ++++
 .../dockerfiles/debian-hexagon-cross.docker   |  5 ++++
 .../dockerfiles/debian-hppa-cross.docker      |  5 ++++
 .../dockerfiles/debian-loongarch-cross.docker |  5 ++++
 .../dockerfiles/debian-m68k-cross.docker      |  5 ++++
 .../dockerfiles/debian-mips-cross.docker      |  5 ++++
 .../dockerfiles/debian-mips64-cross.docker    |  5 ++++
 .../dockerfiles/debian-mips64el-cross.docker  |  5 ++++
 .../dockerfiles/debian-mipsel-cross.docker    |  5 ++++
 tests/docker/dockerfiles/debian-native.docker |  5 ++++
 .../debian-powerpc-test-cross.docker          |  6 ++++-
 .../dockerfiles/debian-ppc64el-cross.docker   |  5 ++++
 .../dockerfiles/debian-riscv64-cross.docker   |  5 ++++
 .../debian-riscv64-test-cross.docker          |  5 ++++
 .../dockerfiles/debian-s390x-cross.docker     |  5 ++++
 .../dockerfiles/debian-sh4-cross.docker       |  5 ++++
 .../dockerfiles/debian-sparc64-cross.docker   |  5 ++++
 .../dockerfiles/debian-toolchain.docker       |  9 +++++--
 .../dockerfiles/debian-tricore-cross.docker   |  5 ++++
 .../dockerfiles/debian-xtensa-cross.docker    |  5 ++++
 .../dockerfiles/fedora-cris-cross.docker      |  5 ++++
 .../dockerfiles/fedora-i386-cross.docker      |  5 ++++
 .../dockerfiles/fedora-win32-cross.docker     |  5 ++++
 .../dockerfiles/fedora-win64-cross.docker     |  5 ++++
 tests/docker/dockerfiles/fedora.docker        |  5 ++++
 tests/docker/dockerfiles/opensuse-leap.docker |  5 ++++
 tests/docker/dockerfiles/python.docker        |  5 ++++
 tests/docker/dockerfiles/ubuntu2004.docker    |  5 ++++
 tests/docker/dockerfiles/ubuntu2204.docker    |  5 ++++
 tests/lcitool/refresh                         | 11 +++++++-
 44 files changed, 240 insertions(+), 29 deletions(-)

-- 
2.39.1
