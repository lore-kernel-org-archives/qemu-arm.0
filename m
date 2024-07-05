Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0651easm662620666b.137.2024.07.05.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:40:57 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3122D5F876;
	Fri,  5 Jul 2024 09:40:49 +0100 (BST)
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
Subject: [PATCH v2 15/40] tests/tcg/arm: Use -fno-integrated-as for test-arm-iwmmxt
Date: Fri,  5 Jul 2024 09:40:22 +0100
Message-Id: <20240705084047.857176-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9yv7dum8WDpk

From: Richard Henderson <richard.henderson@linaro.org>

Clang does not support IWMXT instructions.
Fall back to the external assembler.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240630190050.160642-11-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/Makefile.target | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 0a1965fce7..95f891bf8c 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -8,6 +8,11 @@ ARM_SRC=$(SRC_PATH)/tests/tcg/arm
 # Set search path for all sources
 VPATH 		+= $(ARM_SRC)
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+	    $(call cc-option,-fno-integrated-as, CROSS_CC_HAS_FNIA)) 3> config-cc.mak
+-include config-cc.mak
+
 float_madds: CFLAGS+=-mfpu=neon-vfpv4
 
 # Basic Hello World
@@ -17,7 +22,8 @@ hello-arm: LDFLAGS+=-nostdlib
 
 # IWMXT floating point extensions
 ARM_TESTS += test-arm-iwmmxt
-test-arm-iwmmxt: CFLAGS+=-marm -march=iwmmxt -mabi=aapcs -mfpu=fpv4-sp-d16
+# Clang assembler does not support IWMXT, so use the external assembler.
+test-arm-iwmmxt: CFLAGS += -marm -march=iwmmxt -mabi=aapcs -mfpu=fpv4-sp-d16 $(CROSS_CC_HAS_FNIA)
 test-arm-iwmmxt: test-arm-iwmmxt.S
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
 
-- 
2.39.2
