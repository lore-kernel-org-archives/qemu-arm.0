Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e71sm1097302wma.13.2017.11.07.07.06.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Nov 2017 07:06:10 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id A79063E0410;
	Tue,  7 Nov 2017 15:06:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: Dave.Martin@arm.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 03/10] risu.c: add missing --trace longopt
Date: Tue,  7 Nov 2017 15:05:51 +0000
Message-Id: <20171107150558.22131-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171107150558.22131-1-alex.bennee@linaro.org>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FxEubBZZontF

This got missed when trace support was added.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/risu.c b/risu.c
index a5d155d..616fc33 100644
--- a/risu.c
+++ b/risu.c
@@ -289,6 +289,7 @@ struct option * setup_options(char **short_opts)
         {"master", no_argument, &ismaster, 1},
         {"host", required_argument, 0, 'h'},
         {"port", required_argument, 0, 'p'},
+        {"trace", required_argument, 0, 't'},
         {"test-fp-exc", no_argument, &test_fp_exc, 1},
         {0, 0, 0, 0}
     };
-- 
2.14.2
