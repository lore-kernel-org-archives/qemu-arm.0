Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 91sm1900253wrp.3.2019.07.05.09.04.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 09:04:22 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B65081FF90;
	Fri,  5 Jul 2019 17:04:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH  v1 3/5] tests/tcg: fix diff-out pass to properly report failure
Date: Fri,  5 Jul 2019 17:04:19 +0100
Message-Id: <20190705160421.19015-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705160421.19015-1-alex.bennee@linaro.org>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yZ6giUNXWJKB

A side effect of piping the output to head is squash the exit status
of the diff command. Fix this by only doing the pipe if the diff
failed and then ensuring the status is non-zero.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile b/tests/tcg/Makefile
index 6fa63cc8d5..7973cd1ba2 100644
--- a/tests/tcg/Makefile
+++ b/tests/tcg/Makefile
@@ -45,7 +45,11 @@ run-test = $(call quiet-command, timeout $(TIMEOUT) $2,"TEST",$3)
 endif
 
 # $1 = test name, $2 = reference
-diff-out = $(call quiet-command, diff -u $1.out $2 | head -n 10,"DIFF","$1.out with $2")
+# to work around the pipe squashing the status we only pipe the result if
+# we know it failed and then force failure at the end.
+diff-out = $(call quiet-command, diff -q $1.out $2 || \
+				 (diff -u $1.out $2 | head -n 10 && false), \
+				 "DIFF","$1.out with $2")
 
 # $1 = test name, $2 = reason
 skip-test = @printf "  SKIPPED %s on $(TARGET_NAME) because %s\n" $1 $2
-- 
2.20.1
