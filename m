Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h12-20020a05600c2cac00b003942a244f40sm16096213wmc.25.2022.06.13.17.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 17:42:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2A1361FFB8;
	Tue, 14 Jun 2022 01:42:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 1/7] test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
Date: Tue, 14 Jun 2022 01:42:03 +0100
Message-Id: <20220614004209.1970284-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614004209.1970284-1-alex.bennee@linaro.org>
References: <20220614004209.1970284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZUzrGv3udwcu

From: Richard Henderson <richard.henderson@linaro.org>

GCC11 from crossbuild-essential-armhf from ubuntu 22.04 errors:
cc1: error: ‘-mfloat-abi=hard’: selected architecture lacks an FPU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220604032713.174976-1-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220613171258.1905715-2-alex.bennee@linaro.org>

diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 3fe237ba39..7df88ddea8 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -20,7 +20,7 @@ LDFLAGS+=-nostdlib -N -static
 
 # Specific Test Rules
 
-test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0
+test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft
 
 run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
 run-plugin-test-armv6m-undef-%: QEMU_OPTS+=-semihosting -M microbit -kernel
-- 
2.30.2
