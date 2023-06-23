Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g7-20020a7bc4c7000000b003f7eeec829asm2259310wmk.10.2023.06.23.05.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:21:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9582C1FFBC;
	Fri, 23 Jun 2023 13:21:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Xu <peterx@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Riku Voipio <riku.voipio@iki.fi>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leonardo Bras <leobras@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 10/26] tests/docker: add test-fuzz
Date: Fri, 23 Jun 2023 13:20:44 +0100
Message-Id: <20230623122100.1640995-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623122100.1640995-1-alex.bennee@linaro.org>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZzOv1X6jzTd/

Running the fuzzer requires some hoop jumping and some problems only
show up in containers. This basically replicates the build-oss-fuzz
job from our CI so we can run in the same containers we use in CI.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/test-fuzz | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100755 tests/docker/test-fuzz

diff --git a/tests/docker/test-fuzz b/tests/docker/test-fuzz
new file mode 100755
index 0000000000..7e506ae1f6
--- /dev/null
+++ b/tests/docker/test-fuzz
@@ -0,0 +1,28 @@
+#!/bin/bash -e
+#
+# Compile and check with oss-fuzz.
+#
+# Copyright (c) 2023 Linaro Ltd.
+#
+# Authors:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+. common.rc
+
+requires_binary clang
+
+# the build script runs out of $src so we need to copy across
+cd "$BUILD_DIR"
+cp -a $QEMU_SRC .
+cd src
+mkdir build-oss-fuzz
+export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
+env CC="clang" CXX="clang++" CFLAGS="-fsanitize=address" ./scripts/oss-fuzz/build.sh
+export ASAN_OPTIONS="fast_unwind_on_malloc=0"
+for fuzzer in $(find ./build-oss-fuzz/DEST_DIR/ -executable -type f | grep -v slirp); do
+        grep "LLVMFuzzerTestOneInput" ${fuzzer} > /dev/null 2>&1 || continue ;
+        echo Testing ${fuzzer} ... ;
+        "${fuzzer}" -runs=1 -seed=1 || exit 1 ;
+done
-- 
2.39.2
