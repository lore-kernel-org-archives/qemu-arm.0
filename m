Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906771600b006cf8a37ebf5sm1224218ejm.103.2022.02.25.09.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:26:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8836B1FFC8;
	Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 16/18] tests/tcg: completely disable threadcount for sh4
Date: Fri, 25 Feb 2022 17:20:19 +0000
Message-Id: <20220225172021.3493923-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kottoAIvIbaG

The previous disabling of threadcount 3bdc19af00 ("tests/tcg/sh4:
disable another unreliable test") just for plugins was being too
conservative. It's all broken so skip it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/sh4/Makefile.target | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 620ccc23c1..35ebe6b4e3 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -20,5 +20,7 @@ run-plugin-linux-test-with-%:
 	$(call skip-test, $<, "BROKEN")
 
 # This test is currently unreliable: https://gitlab.com/qemu-project/qemu/-/issues/856
+run-threadcount:
+	$(call skip-test, $<, "BROKEN")
 run-plugin-threadcount-with-%:
 	$(call skip-test, $<, "BROKEN")
-- 
2.30.2
