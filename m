Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234be76sm77763245e9.15.2025.06.27.04.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:25:20 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2B7E25F913;
	Fri, 27 Jun 2025 12:25:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-s390x@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Rowan Hart <rowanbhart@gmail.com>
Subject: [PATCH 10/15] tests/tcg: Remove copy-pasted notes and from i386 and add x86_64 system tests to tests
Date: Fri, 27 Jun 2025 12:25:06 +0100
Message-ID: <20250627112512.1880708-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250627112512.1880708-1-alex.bennee@linaro.org>
References: <20250627112512.1880708-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: azLeGP0uaQsu

From: Rowan Hart <rowanbhart@gmail.com>

The x86_64-softmmu Makefile seems to have been copy-pasted from the i386
Makefile at some point in the past. Cleaning up a vestigial unused
variable and removing some outdated comments.

Signed-off-by: Rowan Hart <rowanbhart@gmail.com>
Message-ID: <20250624175351.440780-7-rowanbhart@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/x86_64/Makefile.softmmu-target | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
index ef6bcb4dc7..d3e09708a5 100644
--- a/tests/tcg/x86_64/Makefile.softmmu-target
+++ b/tests/tcg/x86_64/Makefile.softmmu-target
@@ -1,13 +1,11 @@
 #
-# x86 system tests
-#
-# This currently builds only for i386. The common C code is built
-# with standard compiler flags however so we can support both by
-# adding additional boot files for x86_64.
+# x86_64 system tests
 #
 
-I386_SYSTEM_SRC=$(SRC_PATH)/tests/tcg/i386/system
 X64_SYSTEM_SRC=$(SRC_PATH)/tests/tcg/x86_64/system
+X64_SYSTEM_TESTS=$(patsubst $(X64_SYSTEM_SRC)/%.c, %, $(wildcard $(X64_SYSTEM_SRC)/*.c))
+
+VPATH+=$(X64_SYSTEM_SRC)
 
 # These objects provide the basic boot code and helper functions for all tests
 CRT_OBJS=boot.o
@@ -18,7 +16,7 @@ LDFLAGS=-Wl,-T$(LINK_SCRIPT) -Wl,-melf_x86_64
 CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
-TESTS+=$(MULTIARCH_TESTS)
+TESTS+=$(MULTIARCH_TESTS) $(X64_SYSTEM_TESTS)
 EXTRA_RUNS+=$(MULTIARCH_RUNS)
 
 # building head blobs
-- 
2.47.2
