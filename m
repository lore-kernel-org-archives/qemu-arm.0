Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2c226esm4455006f8f.36.2024.09.25.10.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 10:11:41 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 542CF5F8E4;
	Wed, 25 Sep 2024 18:11:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	kvm@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	devel@lists.libvirt.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Yanan Wang <wangyanan55@huawei.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 00/10] maintainer updates (testing, gdbstub)
Date: Wed, 25 Sep 2024 18:11:30 +0100
Message-Id: <20240925171140.1307033-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: kT5UPQ78FHZN

Welcome to the first post KVM forum series. We have:

  - fix from Ilya for microblaze atomics
  - Pierrick's tsan updates
  - I've added my testing and gdbstub trees to MAINTAINERS
  - enabled a very basic aarch64_be-linux-user test
  - fixed the missing gdb XML fails that cause aarch64_be-linux-user to assert
  - finally I've made the mips64el cross compiler bookworm and allow_fail

Alex Bennée (6):
  testing: bump mips64el cross to bookworm and allow to fail
  tests/docker: add NOFETCH env variable for testing
  MAINTAINERS: mention my testing/next tree
  MAINTAINERS: mention my gdbstub/next tree
  config/targets: update aarch64_be-linux-user gdb XML list
  tests/tcg: enable basic testing for aarch64_be-linux-user

Ilya Leoshkevich (1):
  tests/docker: Fix microblaze atomics

Pierrick Bouvier (3):
  meson: hide tsan related warnings
  target/i386: fix build warning (gcc-12 -fsanitize=thread)
  docs/devel: update tsan build documentation

 MAINTAINERS                                   |  2 ++
 docs/devel/testing/main.rst                   | 26 +++++++++++---
 configure                                     |  5 +++
 configs/targets/aarch64_be-linux-user.mak     |  2 +-
 meson.build                                   | 10 +++++-
 target/i386/kvm/kvm.c                         |  4 +--
 tests/tcg/aarch64_be/hello.c                  | 35 +++++++++++++++++++
 .gitlab-ci.d/container-cross.yml              |  3 ++
 tests/docker/Makefile.include                 |  5 +--
 .../build-toolchain.sh                        |  8 +++++
 .../dockerfiles/debian-mips64el-cross.docker  | 10 +++---
 .../dockerfiles/debian-toolchain.docker       |  7 ++++
 tests/lcitool/refresh                         |  2 +-
 tests/tcg/Makefile.target                     |  7 +++-
 tests/tcg/aarch64_be/Makefile.target          | 17 +++++++++
 15 files changed, 125 insertions(+), 18 deletions(-)
 create mode 100644 tests/tcg/aarch64_be/hello.c
 create mode 100644 tests/tcg/aarch64_be/Makefile.target

-- 
2.39.5
