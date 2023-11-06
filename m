Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m13-20020a5d4a0d000000b00327b5ca093dsm300326wrq.117.2023.11.06.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:58:30 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6DCEC65766;
	Mon,  6 Nov 2023 18:51:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 22/22] Revert "tests/tcg/nios2: Re-enable linux-user tests"
Date: Mon,  6 Nov 2023 18:51:12 +0000
Message-Id: <20231106185112.2755262-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106185112.2755262-1-alex.bennee@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qqabPuJb42en

nios2 signal tests are broken again:

  retry.py -n 10 -c -- ./qemu-nios2 ./tests/tcg/nios2-linux-user/signals
  Results summary:
  0: 8 times (80.00%), avg time 2.254 (0.00 varience/0.00 deviation)
  -11: 2 times (20.00%), avg time 0.253 (0.00 varience/0.00 deviation)
  Ran command 10 times, 8 passes

This wasn't picked up by CI as we don't have a docker container that
can build QEMU with the nios2 compiler. I don't have to bisect the
breakage and the target is orphaned anyway so take the easy route and
revert it.

This reverts commit 20e7524ff9f0cab4c9a0306014d6f3d7b467ae1e.

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/nios2/Makefile.target | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 tests/tcg/nios2/Makefile.target

diff --git a/tests/tcg/nios2/Makefile.target b/tests/tcg/nios2/Makefile.target
new file mode 100644
index 0000000000..b38e2352b7
--- /dev/null
+++ b/tests/tcg/nios2/Makefile.target
@@ -0,0 +1,11 @@
+# nios2 specific test tweaks
+
+# Currently nios2 signal handling is broken
+run-signals: signals
+	$(call skip-test, $<, "BROKEN")
+run-plugin-signals-with-%:
+	$(call skip-test, $<, "BROKEN")
+run-linux-test: linux-test
+	$(call skip-test, $<, "BROKEN")
+run-plugin-linux-test-with-%:
+	$(call skip-test, $<, "BROKEN")
-- 
2.39.2
