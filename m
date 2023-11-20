Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bcbd7000000b004064ac107cfsm13599341wmi.39.2023.11.20.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:08:38 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E0A3765778;
	Mon, 20 Nov 2023 15:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 10/14] testing: move arm system tests into their own folder
Date: Mon, 20 Nov 2023 15:08:29 +0000
Message-Id: <20231120150833.2552739-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120150833.2552739-1-alex.bennee@linaro.org>
References: <20231120150833.2552739-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Witelvkyn6c/

Prepare for expanding the arm system tests by cleaning up the test
directory.

Message-Id: <20231115205542.3092038-9-alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/Makefile.softmmu-target           | 5 ++---
 tests/tcg/arm/{ => system}/test-armv6m-undef.S  | 0
 tests/tcg/arm/{ => system}/test-armv6m-undef.ld | 0
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename tests/tcg/arm/{ => system}/test-armv6m-undef.S (100%)
 rename tests/tcg/arm/{ => system}/test-armv6m-undef.ld (100%)

diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 8b546e2aa3..7857ab9324 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -3,7 +3,7 @@
 # ARM SoftMMU tests - included from tests/tcg/Makefile
 #
 
-ARM_SRC=$(SRC_PATH)/tests/tcg/arm
+ARM_SRC=$(SRC_PATH)/tests/tcg/arm/system
 
 # Set search path for all sources
 VPATH 		+= $(ARM_SRC)
@@ -12,7 +12,6 @@ ARM_TESTS=test-armv6m-undef
 
 TESTS += $(ARM_TESTS)
 
-CFLAGS+=-Wl,--build-id=none -x assembler-with-cpp
 LDFLAGS+=-nostdlib -N -static
 
 %: %.S %.ld
@@ -20,7 +19,7 @@ LDFLAGS+=-nostdlib -N -static
 
 # Specific Test Rules
 
-test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft
+test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft -Wl,--build-id=none -x assembler-with-cpp
 
 run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
 
diff --git a/tests/tcg/arm/test-armv6m-undef.S b/tests/tcg/arm/system/test-armv6m-undef.S
similarity index 100%
rename from tests/tcg/arm/test-armv6m-undef.S
rename to tests/tcg/arm/system/test-armv6m-undef.S
diff --git a/tests/tcg/arm/test-armv6m-undef.ld b/tests/tcg/arm/system/test-armv6m-undef.ld
similarity index 100%
rename from tests/tcg/arm/test-armv6m-undef.ld
rename to tests/tcg/arm/system/test-armv6m-undef.ld
-- 
2.39.2
