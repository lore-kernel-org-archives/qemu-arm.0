Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac6377e06fsm5901911a12.28.2024.07.29.07.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:44:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9DEE25F9F3;
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
Subject: [PATCH 06/14] docs/devel: update the testing introduction
Date: Mon, 29 Jul 2024 15:44:06 +0100
Message-Id: <20240729144414.830369-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729144414.830369-1-alex.bennee@linaro.org>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RRw8yuB09rNw

Move the mention of "check-help" up to the intro text and also mention
the meson test integration.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing.rst | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 23d3f44f52..b984c5dd26 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -3,13 +3,28 @@
 Testing in QEMU
 ===============
 
-This document describes the testing infrastructure in QEMU.
+QEMU's testing infrastructure is fairly complex as it covers
+everything from unit testing and exercising specific sub-systems all
+the way to full blown acceptance tests. To get an overview of the
+tests you can run ``make check-help`` from either the source or build
+tree.
+
+Most (but not all) tests are also integrated into the meson build
+system so can be run directly from the build tree, for example:
+
+.. code::
+
+  [./pyvenv/bin/]meson test --suite qemu:softfloat
+
+will run just the softfloat tests.
+
+The rest of this document will cover the details for specific test
+groups.
 
 Testing with "make check"
 -------------------------
 
-The "make check" testing family includes most of the C based tests in QEMU. For
-a quick help, run ``make check-help`` from the source tree.
+The "make check" testing family includes most of the C based tests in QEMU.
 
 The usual way to run these tests is:
 
-- 
2.39.2
