Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5710c2sm22311775e9.32.2025.02.26.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:52 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4BC05604F0;
	Wed, 26 Feb 2025 14:03:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 14/25] tests/tcg: enable -fwrapv for test-i386-bmi
Date: Wed, 26 Feb 2025 14:03:32 +0000
Message-Id: <20250226140343.3907080-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: D9p6xnS+K0cb

We allow things like:

  tests/tcg/i386/test-i386-bmi2.c:124:35: warning: shifting a negative signed value is undefined [-Wshift-negative-value]
      assert(result == (mask & ~(-1 << 30)));

in the main code, so allow it for the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/i386/Makefile.target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index bbe2c44b2a..f1df40411b 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -22,7 +22,7 @@ run-test-i386-sse-exceptions: QEMU_OPTS += -cpu max
 test-i386-pcmpistri: CFLAGS += -msse4.2
 run-test-i386-pcmpistri: QEMU_OPTS += -cpu max
 
-test-i386-bmi2: CFLAGS=-O2
+test-i386-bmi2: CFLAGS=-O2 -fwrapv
 run-test-i386-bmi2: QEMU_OPTS += -cpu max
 
 test-i386-adcox: CFLAGS=-O2
-- 
2.39.5
