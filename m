Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cf91sm900672366b.1.2024.05.15.13.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 13:23:35 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id AFA105F8D3;
	Wed, 15 May 2024 21:23:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 01/11] tests/tcg: don't append QEMU_OPTS for armv6m-undef test
Date: Wed, 15 May 2024 21:23:24 +0100
Message-Id: <20240515202334.710324-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240515202334.710324-1-alex.bennee@linaro.org>
References: <20240515202334.710324-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1IxjwtX6iwJ7

We don't want to build on the default machine setup here but define a
custom one for the microbit.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240514174253.694591-2-alex.bennee@linaro.org>

diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 4c9264057f..39e01ce49d 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -16,7 +16,7 @@ test-armv6m-undef: test-armv6m-undef.S
 		$< -o $@ -nostdlib -N -static \
 		-T $(ARM_SRC)/$@.ld
 
-run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
+run-test-armv6m-undef: QEMU_OPTS=-semihosting-config enable=on,target=native,chardev=output -M microbit -kernel
 
 ARM_TESTS+=test-armv6m-undef
 
-- 
2.39.2
