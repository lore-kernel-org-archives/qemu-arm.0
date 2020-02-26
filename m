Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y7sm6732756wmd.1.2020.02.25.23.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 23:39:30 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 58DD61FF8C;
	Wed, 26 Feb 2020 07:39:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Robert Foley <robert.foley@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 01/19] tests/tcg: include a skip runner for pauth3 with plugins
Date: Wed, 26 Feb 2020 07:39:11 +0000
Message-Id: <20200226073929.28237-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226073929.28237-1-alex.bennee@linaro.org>
References: <20200226073929.28237-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OHQYm2stot20

If we have plugins enabled we still need to have built the test to be
able to run it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Robert Foley <robert.foley@linaro.org>
Message-Id: <20200225124710.14152-2-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index d2299b98b76..71f72cfbe34 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -70,4 +70,6 @@ pauth-3:
 	$(call skip-test, "BUILD of $@", "missing compiler support")
 run-pauth-3:
 	$(call skip-test, "RUN of pauth-3", "not built")
+run-plugin-pauth-3-with-%:
+	$(call skip-test, "RUN of pauth-3 ($*)", "not built")
 endif
-- 
2.20.1
