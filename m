Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a76841c4ffcsm261248866b.41.2024.07.05.01.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:40:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5BE075F9EB;
	Fri,  5 Jul 2024 09:40:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 07/40] tests/tcg: Adjust variable defintion from cc-option
Date: Fri,  5 Jul 2024 09:40:14 +0100
Message-Id: <20240705084047.857176-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 59PNqDLTuRtr

From: Richard Henderson <richard.henderson@linaro.org>

Define the variable to the compiler flag used, not "y".
This avoids replication of the compiler flag itself.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240630190050.160642-3-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile.target                 |  2 +-
 tests/tcg/aarch64/Makefile.softmmu-target |  2 +-
 tests/tcg/aarch64/Makefile.target         | 15 ++++++++-------
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index f21be50d3b..cb8cfeb6da 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -49,7 +49,7 @@ quiet-command = $(call quiet-@,$2,$3)$1
 
 cc-test = $(CC) -Werror $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1
 cc-option = if $(call cc-test, $1); then \
-    echo "$(TARGET_PREFIX)$1 detected" && echo "$(strip $2)=y" >&3; else \
+    echo "$(TARGET_PREFIX)$1 detected" && echo "$(strip $2)=$(strip $1)" >&3; else \
     echo "$(TARGET_PREFIX)$1 not detected"; fi
 
 # $1 = test name, $2 = cmd, $3 = desc
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 4b03ef602e..39d3f961c5 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -81,7 +81,7 @@ run-memory-replay: memory-replay run-memory-record
 EXTRA_RUNS+=run-memory-replay
 
 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
-pauth-3: CFLAGS += -march=armv8.3-a
+pauth-3: CFLAGS += $(CROSS_CC_HAS_ARMV8_3)
 else
 pauth-3:
 	$(call skip-test, "BUILD of $@", "missing compiler support")
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 4ecbca6a41..11ccde5579 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -32,17 +32,17 @@ config-cc.mak: Makefile
 
 ifneq ($(CROSS_CC_HAS_ARMV8_2),)
 AARCH64_TESTS += dcpop
-dcpop: CFLAGS += -march=armv8.2-a
+dcpop: CFLAGS += $(CROSS_CC_HAS_ARMV8_2)
 endif
 ifneq ($(CROSS_CC_HAS_ARMV8_5),)
 AARCH64_TESTS += dcpodp
-dcpodp: CFLAGS += -march=armv8.5-a
+dcpodp: CFLAGS += $(CROSS_CC_HAS_ARMV8_5)
 endif
 
 # Pauth Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5 test-2375
-pauth-%: CFLAGS += -march=armv8.3-a
+pauth-%: CFLAGS += $(CROSS_CC_HAS_ARMV8_3)
 test-2375: CFLAGS += -march=armv8.3-a
 run-pauth-1: QEMU_OPTS += -cpu max
 run-pauth-2: QEMU_OPTS += -cpu max
@@ -55,7 +55,7 @@ endif
 # bti-1 tests the elf notes, so we require special compiler support.
 ifneq ($(CROSS_CC_HAS_ARMV8_BTI),)
 AARCH64_TESTS += bti-1 bti-3
-bti-1 bti-3: CFLAGS += -fno-stack-protector -mbranch-protection=standard
+bti-1 bti-3: CFLAGS += -fno-stack-protector $(CROSS_CC_HAS_ARMV8_BTI)
 bti-1 bti-3: LDFLAGS += -nostdlib
 endif
 # bti-2 tests PROT_BTI, so no special compiler support required.
@@ -64,12 +64,13 @@ AARCH64_TESTS += bti-2
 # MTE Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
 AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7
-mte-%: CFLAGS += -march=armv8.5-a+memtag
+mte-%: CFLAGS += $(CROSS_CC_HAS_ARMV8_MTE)
 endif
 
 # SME Tests
 ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
 AARCH64_TESTS += sme-outprod1 sme-smopa-1 sme-smopa-2
+sme-outprod1 sme-smopa-1 sme-smopa-2: CFLAGS += $(CROSS_AS_HAS_ARMV9_SME)
 endif
 
 # System Registers Tests
@@ -99,7 +100,7 @@ TESTS += sha512-vector
 ifneq ($(CROSS_CC_HAS_SVE),)
 # SVE ioctl test
 AARCH64_TESTS += sve-ioctls
-sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
+sve-ioctls: CFLAGS += $(CROSS_CC_HAS_SVE)
 
 sha512-sve: CFLAGS=-O3 -march=armv8.1-a+sve
 sha512-sve: sha512.c
@@ -134,7 +135,7 @@ endif
 
 ifneq ($(CROSS_CC_HAS_SVE2),)
 AARCH64_TESTS += test-826
-test-826: CFLAGS+=-march=armv8.1-a+sve2
+test-826: CFLAGS += $(CROSS_CC_HAS_SVE2)
 endif
 
 TESTS += $(AARCH64_TESTS)
-- 
2.39.2
