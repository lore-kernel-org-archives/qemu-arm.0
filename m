Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m15sm1560862wrb.58.2018.02.23.07.46.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 07:46:18 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 4044B3E043F;
	Fri, 23 Feb 2018 15:46:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 6/8] contrib/run_risu.sh: don't set -e
Date: Fri, 23 Feb 2018 15:46:11 +0000
Message-Id: <20180223154613.2096-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180223154613.2096-1-alex.bennee@linaro.org>
References: <20180223154613.2096-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4OwMibvLL1qy

As the script is meant to summarise the results at the end it doesn't
make sense to bail out at the first error.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/run_risu.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/contrib/run_risu.sh b/contrib/run_risu.sh
index 63649dd..2d1897a 100755
--- a/contrib/run_risu.sh
+++ b/contrib/run_risu.sh
@@ -17,8 +17,6 @@
 #   (optional) export RISU=/path/to/risu
 #   ./run_risu.sh  ./testcases.aarch64/*.bin
 
-set -e
-
 passed=()
 failed=()
 missing=()
-- 
2.15.1
