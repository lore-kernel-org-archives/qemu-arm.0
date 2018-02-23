Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u136sm2072951wmf.5.2018.02.23.07.46.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 07:46:19 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 4AF4B3E047D;
	Fri, 23 Feb 2018 15:46:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 7/8] contrib/run_risu.sh: add a visual cue for a clean-run
Date: Fri, 23 Feb 2018 15:46:12 +0000
Message-Id: <20180223154613.2096-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180223154613.2096-1-alex.bennee@linaro.org>
References: <20180223154613.2096-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: m7Tv0DEkT6Lr

It saves you from having to check the status code or wonder if the
errors just scrolled off your screen.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/run_risu.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/contrib/run_risu.sh b/contrib/run_risu.sh
index 2d1897a..fc69d83 100755
--- a/contrib/run_risu.sh
+++ b/contrib/run_risu.sh
@@ -61,6 +61,8 @@ if test ${#failed[@]} -gt 0; then
     for f in "${failed[@]}"; do
         echo "$f"
     done
+else
+    echo "No Failures ;-)"
 fi
 
 exit ${#failed[@]}
-- 
2.15.1
