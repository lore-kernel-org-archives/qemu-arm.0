Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t8-20020a1c7708000000b003f50d6ee334sm8708659wmi.47.2023.06.26.14.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 14:59:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D0D571FFC4;
	Mon, 26 Jun 2023 22:59:27 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 09/26] tests/docker: add test-fuzz
Date: Mon, 26 Jun 2023 22:59:09 +0100
Message-Id: <20230626215926.2522656-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626215926.2522656-1-alex.bennee@linaro.org>
References: <20230626215926.2522656-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NEgQ34pL5hK6

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
