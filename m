Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o27-v6sm5903744wro.24.2018.11.09.07.21.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Nov 2018 07:21:21 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 631C63E0581;
	Fri,  9 Nov 2018 15:21:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 4/7] tests/guest-debug: fix scoping of failcount
Date: Fri,  9 Nov 2018 15:21:16 +0000
Message-Id: <20181109152119.9242-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109152119.9242-1-alex.bennee@linaro.org>
References: <20181109152119.9242-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yS7j45L6qqLZ

You should declare you are using a global version of a variable before
you attempt to modify it in a function.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/guest-debug/test-gdbstub.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/guest-debug/test-gdbstub.py b/tests/guest-debug/test-gdbstub.py
index 0e4ac01426..c7e3986a24 100644
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
