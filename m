Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5af2f233be4sm4597887a12.41.2024.07.29.07.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:44:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 850715F9CC;
	Mon, 29 Jul 2024 15:44:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Song Gao <gaosong@loongson.cn>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 05/14] tests/tcg: update README
Date: Mon, 29 Jul 2024 15:44:05 +0100
Message-Id: <20240729144414.830369-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729144414.830369-1-alex.bennee@linaro.org>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FHjazy2J+Vci

Update the document with details about the layout of tests. Remove the
out of date cris comments. Refer to the developer guide for details
about how to run the tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/README | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/tcg/README b/tests/tcg/README
index 706bb185b4..6d08ca50dc 100644
--- a/tests/tcg/README
+++ b/tests/tcg/README
@@ -1,9 +1,14 @@
-This directory contains various interesting guest programs for
-regression testing. Tests are either multi-arch, meaning they can be
-built for all guest architectures that support linux-user executable,
-or they are architecture specific.
-
-CRIS
-====
-The testsuite for CRIS is in tests/tcg/cris.  You can run it
-with "make test-cris".
+This directory contains various interesting guest binaries for
+regression testing the Tiny Code Generator doing system and user-mode
+emulation.
+
+The multiarch directory contains shared code for tests that can be
+built for all guest architectures. Architecture specific code can be
+found in their respective directories.
+
+System mode tests will be under the "system" subdirectories.
+
+GDB scripts for exercising the gdbstub on specific tests will be found
+under the "gdbstb" subdirectories.
+
+See the developer guide for more instructions on "make check-tcg"
-- 
2.39.2
