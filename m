Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 141-v6sm8357190wmf.35.2018.05.17.10.47.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 May 2018 10:47:30 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 467F93E0EF2;
	Thu, 17 May 2018 18:47:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: cota@braap.org,
	famz@redhat.com,
	berrange@redhat.com,
	f4bug@amsat.org,
	richard.henderson@linaro.org,
	balrogg@gmail.com,
	aurelien@aurel32.net,
	agraf@suse.de
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v4 31/49] tests/tcg/aarch64: add Makefile.target
Date: Thu, 17 May 2018 18:47:00 +0100
Message-Id: <20180517174718.10107-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517174718.10107-1-alex.bennee@linaro.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JUti6a7a4RuU

Nothing much here yet.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 tests/tcg/aarch64/Makefile.target

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
new file mode 100644
index 0000000000..4ac8fbe73f
--- /dev/null
+++ b/tests/tcg/aarch64/Makefile.target
@@ -0,0 +1,5 @@
+# -*- Mode: makefile -*-
+#
+# AArch64 specific tweaks
+
+fcvt: LDFLAGS+=-lm
-- 
2.17.0
