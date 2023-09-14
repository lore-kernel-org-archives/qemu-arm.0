Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a4-20020a5d4d44000000b00317e77106dbsm2075765wru.48.2023.09.14.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 08:54:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 02D6A1FFC0;
	Thu, 14 Sep 2023 16:54:23 +0100 (BST)
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
Subject: [PATCH 5/9] qtest: kill orphaned qtest QEMU processes on FreeBSD
Date: Thu, 14 Sep 2023 16:54:18 +0100
Message-Id: <20230914155422.426639-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914155422.426639-1-alex.bennee@linaro.org>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: R1kP8ZVPLj52

From: Daniel P. Berrangé <berrange@redhat.com>

On Linux we use PR_SET_PDEATHSIG to kill orphaned QEMU processes
if we fail to call qtest_quit(), or the test program aborts/segvs.
This prevents meson from hanging forever due to the orphaned
process keeping stdout open.

On FreeBSD we can achieve the same using PROC_PDEATHSIG_CTL, which
gives us the equivalent protection against hangs.

Signed-off-by: "Daniel P. Berrangé" <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230912184130.3056054-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/libqtest.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 34b9c14b75..b1eba71ffe 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -24,6 +24,9 @@
 #ifdef __linux__
 #include <sys/prctl.h>
 #endif /* __linux__ */
+#ifdef __FreeBSD__
+#include <sys/procctl.h>
+#endif /* __FreeBSD__ */
 
 #include "libqtest.h"
 #include "libqmp.h"
@@ -414,6 +417,10 @@ static QTestState *G_GNUC_PRINTF(1, 2) qtest_spawn_qemu(const char *fmt, ...)
          */
         prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
 #endif /* __linux__ */
+#ifdef __FreeBSD__
+        int sig = SIGKILL;
+        procctl(P_PID, getpid(), PROC_PDEATHSIG_CTL, &sig);
+#endif /* __FreeBSD__ */
         if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
             exit(1);
         }
-- 
2.39.2
