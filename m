Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g10sm3400523wrw.80.2019.05.09.10.05.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 10:05:24 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8F13C1FFA5;
	Thu,  9 May 2019 17:59:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH  v1 18/23] tests/qemu-iotests: Do not hard-code the path to bash
Date: Thu,  9 May 2019 17:59:06 +0100
Message-Id: <20190509165912.10512-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509165912.10512-1-alex.bennee@linaro.org>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BlFt5pN3pK2R

From: Thomas Huth <thuth@redhat.com>

bash is installed in a different directory on non-Linux systems like
FreeBSD. Do not hard-code /bin/bash here so that the tests can run
there, too.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190502084506.8009-4-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/239 | 2 +-
 tests/qemu-iotests/240 | 2 +-
 tests/qemu-iotests/241 | 2 +-
 tests/qemu-iotests/243 | 2 +-
 tests/qemu-iotests/244 | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/239 b/tests/qemu-iotests/239
index 6f085d573da..b0991ffe594 100755
--- a/tests/qemu-iotests/239
+++ b/tests/qemu-iotests/239
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 #
 # Test case for dmg
 #
diff --git a/tests/qemu-iotests/240 b/tests/qemu-iotests/240
index 65cc3b39b13..d3e663ed65c 100755
--- a/tests/qemu-iotests/240
+++ b/tests/qemu-iotests/240
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 #
 # Test hot plugging and unplugging with iothreads
 #
diff --git a/tests/qemu-iotests/241 b/tests/qemu-iotests/241
index 017a736aaba..58b64ebf41f 100755
--- a/tests/qemu-iotests/241
+++ b/tests/qemu-iotests/241
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 #
 # Test qemu-nbd vs. unaligned images
 #
diff --git a/tests/qemu-iotests/243 b/tests/qemu-iotests/243
index 5838c6e89cb..e563761307d 100755
--- a/tests/qemu-iotests/243
+++ b/tests/qemu-iotests/243
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 #
 # Test qcow2 preallocation
 #
diff --git a/tests/qemu-iotests/244 b/tests/qemu-iotests/244
index d8e71223058..13978f93d24 100755
--- a/tests/qemu-iotests/244
+++ b/tests/qemu-iotests/244
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 #
 # Test qcow2 with external data files
 #
-- 
2.20.1
