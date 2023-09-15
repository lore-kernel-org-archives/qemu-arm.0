Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ba13-20020a0560001c0d00b0031ddf6cc89csm1940914wrb.98.2023.09.15.08.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:08:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6067C1FFBF;
	Fri, 15 Sep 2023 16:08:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org (open list:NRF51)
Subject: [PULL 4/9] microbit: add missing qtest_quit() call
Date: Fri, 15 Sep 2023 16:08:44 +0100
Message-Id: <20230915150849.595896-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230915150849.595896-1-alex.bennee@linaro.org>
References: <20230915150849.595896-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: K+GeTVUxXMs/

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
Message-Id: <20230914155422.426639-5-alex.bennee@linaro.org>

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
