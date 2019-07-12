Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v15sm7084872wru.61.2019.07.12.04.18.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 04:18:50 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 031ED1FF8C;
	Fri, 12 Jul 2019 12:18:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v1 1/7] tests/docker: add test-misc for building tools & docs
Date: Fri, 12 Jul 2019 12:18:43 +0100
Message-Id: <20190712111849.9006-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190712111849.9006-1-alex.bennee@linaro.org>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: a5mwtoUP4ynu

Add yet another test type so we cna quickly exercise the miscellaneous
build products of the build system under various docer configurations.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/test-misc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100755 tests/docker/test-misc

diff --git a/tests/docker/test-misc b/tests/docker/test-misc
new file mode 100755
index 00000000000..d480afedca7
--- /dev/null
+++ b/tests/docker/test-misc
@@ -0,0 +1,22 @@
+#!/bin/bash -e
+#
+# Build the miscellaneous components
+#
+# Copyright (c) 2019 Linaro Ltd.
+#
+# Authors:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+. common.rc
+
+cd "$BUILD_DIR"
+
+# build everything else but QEMU
+configure_qemu --disable-user --disable-system --enable-docs --enable-tools
+build_qemu
+install_qemu
-- 
2.20.1
