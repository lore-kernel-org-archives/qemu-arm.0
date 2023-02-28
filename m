Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a14-20020a5d4d4e000000b002c57475c375sm10580099wru.110.2023.02.28.11.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 979B31FFC1;
	Tue, 28 Feb 2023 19:06:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 11/24] tests/docker: Use binaries for debian-tricore-cross
Date: Tue, 28 Feb 2023 19:06:40 +0000
Message-Id: <20230228190653.1602033-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yKVR/lKtgqcn

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

since binutils is pretty old, it fails our CI repeatedly during the
compilation of tricore-binutils. We created a precompiled version using
the debian docker image and download it instead of building it ourself.

We also updated the package to include a newer version of binutils, gcc,
and newlib. The default TriCore ISA version used by tricore-as changed
from the old version, so we have to specify it now. If we don't
'test_fadd' fails with 'unknown opcode'.

The new assembler also picks a new encoding in ld.h which fails the
'test_ld_h' test. We fix that by using the newest TriCore CPU for QEMU.

The old assembler accepted an extra ')' in 'test_imask'. The new one
does not, so lets remove it.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20230209145812.46730-1-kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230221094558.2864616-13-alex.bennee@linaro.org>
---
 tests/tcg/tricore/macros.h                           |  2 +-
 tests/docker/dockerfiles/debian-tricore-cross.docker | 10 +++-------
 tests/tcg/tricore/Makefile.softmmu-target            |  6 +++---
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index ec4f5bff52..3df2e0de82 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -174,7 +174,7 @@ test_ ## num:                                                    \
     TEST_CASE_E(num, res_lo, res_hi,                           \
     LI(DREG_RS1, rs1);                                         \
     rstv;                                                      \
-    insn EREG_CALC_RESULT, imm1, DREG_RS1, imm2);              \
+    insn EREG_CALC_RESULT, imm1, DREG_RS1, imm2;               \
     )
 
 
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 5ae58efa09..82e4576485 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -20,6 +20,7 @@ RUN apt update && \
        bzip2 \
        ca-certificates \
        ccache \
+       curl \
        flex \
        g++ \
        gcc \
@@ -34,13 +35,8 @@ RUN apt update && \
        python3-setuptools \
        python3-wheel
 
-RUN git clone --single-branch \
-        https://github.com/bkoppelmann/tricore-binutils.git \
-        /usr/src/binutils && \
-    cd /usr/src/binutils && chmod +x missing && \
-    CFLAGS=-w ./configure --prefix=/usr/local --disable-nls --target=tricore && \
-    make && make install && \
-    rm -rf /usr/src/binutils
+RUN curl -#SL https://github.com/bkoppelmann/package_940/releases/download/tricore-toolchain-9.40/tricore-toolchain-9.4.0.tar.gz \
+    | tar -xzC /usr/local/
 
 # This image can only build a very minimal QEMU as well as the tests
 ENV DEF_TARGET_LIST tricore-softmmu
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index d2446af8b4..b3cd56fffc 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -1,7 +1,7 @@
 TESTS_PATH = $(SRC_PATH)/tests/tcg/tricore
 
-LDFLAGS = -T$(TESTS_PATH)/link.ld
-ASFLAGS =
+LDFLAGS = -T$(TESTS_PATH)/link.ld --mcpu=tc162
+ASFLAGS = -mtc162
 
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
@@ -19,7 +19,7 @@ TESTS += test_madd.tst
 TESTS += test_msub.tst
 TESTS += test_muls.tst
 
-QEMU_OPTS += -M tricore_testboard -nographic -kernel
+QEMU_OPTS += -M tricore_testboard -cpu tc27x -nographic -kernel
 
 %.pS: $(TESTS_PATH)/%.S
 	$(HOST_CC) -E -o $@ $<
-- 
2.39.2
