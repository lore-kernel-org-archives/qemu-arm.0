Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b74-v6sm6238027wma.8.2018.09.26.04.20.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Sep 2018 04:20:49 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E10203E0504;
	Wed, 26 Sep 2018 12:20:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	omair.javaid@linaro.org,
	ard.biesheuvel@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 4/4] tests/guest-debug: fix scoping of failcount
Date: Wed, 26 Sep 2018 12:20:48 +0100
Message-Id: <20180926112048.17778-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926112048.17778-1-alex.bennee@linaro.org>
References: <20180926112048.17778-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0vjvnXUOwfXr

You should declare you are using a global version of a variable before
you attempt to modify it in a function.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/guest-debug/test-gdbstub.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/guest-debug/test-gdbstub.py b/tests/guest-debug/test-gdbstub.py
index 474d2c5c65..7bfc95b187 100644
--- a/tests/guest-debug/test-gdbstub.py
+++ b/tests/guest-debug/test-gdbstub.py
@@ -16,6 +16,7 @@ def report(cond, msg):
         print ("PASS: %s" % (msg))
     else:
         print ("FAIL: %s" % (msg))
+        global failcount
         failcount += 1
 
 
-- 
2.17.1
