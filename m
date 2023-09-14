Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g13-20020a7bc4cd000000b003fc02e8ea68sm5199620wmk.13.2023.09.14.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 08:54:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DE6AF1FFBF;
	Thu, 14 Sep 2023 16:54:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 4/9] microbit: add missing qtest_quit() call
Date: Thu, 14 Sep 2023 16:54:17 +0100
Message-Id: <20230914155422.426639-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914155422.426639-1-alex.bennee@linaro.org>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OV+KViZfUue8

From: Daniel P. Berrangé <berrange@redhat.com>

Without this call, the QEMU process is being left running which on
FreeBSD 13.2 at least, makes meson think the test is still running,
and thus execution of "make check" continues forever.

This fixes the regression introduced in:

  commit a9c9bbee855877293683012942d3485d50f286af
  Author: Chris Laplante <chris@laplante.io>
  Date:   Tue Aug 22 17:31:02 2023 +0100

    qtest: microbit-test: add tests for nRF51 DETECT

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1882
Signed-off-by: "Daniel P. Berrangé" <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230912184130.3056054-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/microbit-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
index 2abcad8e31..72190d38f7 100644
--- a/tests/qtest/microbit-test.c
+++ b/tests/qtest/microbit-test.c
@@ -434,6 +434,8 @@ static void test_nrf51_gpio_detect(void)
     g_assert_true(qtest_get_irq(qts, 0));
     qtest_set_irq_in(qts, "/machine/nrf51", "unnamed-gpio-in", 3, 0);
     g_assert_true(qtest_get_irq(qts, 0));
+
+    qtest_quit(qts);
 }
 
 static void timer_task(QTestState *qts, hwaddr task)
-- 
2.39.2
