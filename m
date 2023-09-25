Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h12-20020a5d688c000000b0031779a6b451sm11975569wru.83.2023.09.25.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:48:55 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6E5AF1FFBE;
	Mon, 25 Sep 2023 15:48:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	John Snow <jsnow@redhat.com>,
	libvir-list@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Nicholas Piggin <npiggin@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cleber Rosa <crosa@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 03/31] gitlab: shuffle some targets and reduce avocado noise
Date: Mon, 25 Sep 2023 15:48:26 +0100
Message-Id: <20230925144854.1872513-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Syv7p5+tJUi3

We move a couple of targets out of the avocado runs because there are
no tests to run. Tricore already has some coverage.  The cris target
only really has check-tcg tests but its getting harder to find
anything that packages the compiler.

To reduce the noise of CANCEL messages we also set AVOCADO_TAGS
appropriately so we filter down the number of tests we attempt.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

---
v2
  - minor commit reword, no longer attempt to keep cris going
---
 .gitlab-ci.d/buildtest.yml | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index aee9101507..25af1bc41e 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -30,6 +30,7 @@ avocado-system-alpine:
   variables:
     IMAGE: alpine
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:avr arch:loongarch64 arch:mips64 arch:mipsel
 
 build-system-ubuntu:
   extends:
@@ -40,8 +41,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-docs
-    TARGETS: alpha-softmmu cris-softmmu hppa-softmmu
-      microblazeel-softmmu mips64el-softmmu
+    TARGETS: alpha-softmmu microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
 
 check-system-ubuntu:
@@ -61,6 +61,7 @@ avocado-system-ubuntu:
   variables:
     IMAGE: ubuntu2204
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:alpha arch:microblaze arch:mips64el
 
 build-system-debian:
   extends:
@@ -72,7 +73,7 @@ build-system-debian:
     IMAGE: debian-amd64
     CONFIGURE_ARGS: --with-coroutine=sigaltstack
     TARGETS: arm-softmmu i386-softmmu riscv64-softmmu sh4eb-softmmu
-      sparc-softmmu xtensaeb-softmmu
+      sparc-softmmu xtensa-softmmu
     MAKE_CHECK_ARGS: check-build
 
 check-system-debian:
@@ -92,6 +93,7 @@ avocado-system-debian:
   variables:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:arm arch:i386 arch:riscv64 arch:sh4 arch:sparc arch:xtensa
 
 crash-test-debian:
   extends: .native_test_job_template
@@ -114,7 +116,7 @@ build-system-fedora:
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
-    TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
+    TARGETS: microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
     MAKE_CHECK_ARGS: check-build
 
@@ -135,6 +137,8 @@ avocado-system-fedora:
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:microblaze arch:mips arch:xtensa arch:m68k
+      arch:riscv32 arch:ppc arch:sparc64
 
 crash-test-fedora:
   extends: .native_test_job_template
@@ -180,6 +184,8 @@ avocado-system-centos:
   variables:
     IMAGE: centos8
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:ppc64 arch:or1k arch:390x arch:x86_64 arch:rx
+      arch:sh4 arch:nios2
 
 build-system-opensuse:
   extends:
@@ -209,6 +215,7 @@ avocado-system-opensuse:
   variables:
     IMAGE: opensuse-leap
     MAKE_CHECK_ARGS: check-avocado
+    AVOCADO_TAGS: arch:s390x arch:x86_64 arch:aarch64
 
 
 # This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
-- 
2.39.2
