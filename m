Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77d965dc4asm37881266b.87.2024.07.05.08.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 08:31:04 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A26546211C;
	Fri,  5 Jul 2024 16:30:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 17/40] tests/tcg/arm: Use -march and -mfpu for fcvt
Date: Fri,  5 Jul 2024 16:30:29 +0100
Message-Id: <20240705153052.1219696-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705153052.1219696-1-alex.bennee@linaro.org>
References: <20240705153052.1219696-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GJoEU9J45w1U

From: Richard Henderson <richard.henderson@linaro.org>

Clang requires the architecture to be set properly
in order to assemble the half-precision instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240630190050.160642-13-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240705084047.857176-18-alex.bennee@linaro.org>

diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 95f891bf8c..8e287191af 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -29,8 +29,8 @@ test-arm-iwmmxt: test-arm-iwmmxt.S
 
 # Float-convert Tests
 ARM_TESTS += fcvt
-fcvt: LDFLAGS+=-lm
-# fcvt: CFLAGS+=-march=armv8.2-a+fp16 -mfpu=neon-fp-armv8
+fcvt: LDFLAGS += -lm
+fcvt: CFLAGS += -march=armv8.2-a+fp16 -mfpu=neon-fp-armv8
 run-fcvt: fcvt
 	$(call run-test,fcvt,$(QEMU) $<)
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
-- 
2.39.2
