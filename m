Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab4de85sm515866566b.52.2024.07.29.07.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:44:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B4C765FA06;
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
Subject: [PATCH 07/14] docs/devel: document how to run individual TCG tests
Date: Mon, 29 Jul 2024 15:44:07 +0100
Message-Id: <20240729144414.830369-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729144414.830369-1-alex.bennee@linaro.org>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HeW2VE93ouDa

Since 6f6ca067d2 (tests/tcg: add some help output for running
individual tests) we made it easier to run individual tests for a
given architecture. Lets reference that in the developer
documentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index b984c5dd26..af73d3d64f 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1490,6 +1490,19 @@ And run with::
 Adding ``V=1`` to the invocation will show the details of how to
 invoke QEMU for the test which is useful for debugging tests.
 
+Running individual tests
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Tests can also be run directly from the test build directory. If you
+run ``make help`` from the test build directory you will get a list of
+all the tests that can be run. Please note that same binaries are used
+in multiple tests, for example::
+
+  make run-plugin-test-mmap-with-libinline.so
+
+will run the mmap test with the ``libinline.so`` TCG plugin. The
+gdbstub tests also re-use the test binaries but while exercising gdb.
+
 TCG test dependencies
 ~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.39.2
