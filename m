Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b46bbsm47078965e9.36.2025.04.04.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:56:45 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 57A075F871;
	Fri,  4 Apr 2025 12:56:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] tests/tcg: fix semihosting SYS_EXIT for aarch64 in boot.S
Date: Fri,  4 Apr 2025 12:56:41 +0100
Message-Id: <20250404115641.258048-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QwWXYgl9mf4R

We don't expect to hit exceptions in our testing so currently all the
vectors report an un-expected exception and then attempt to exit.
However for aarch64 we should always use the extended information
block as we do in _exit. Rather than duplicate the code on the error
handler just branch to the _exit handler with a failing status code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/boot.S | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index 8fbcba757e..81a60b9c43 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -73,9 +73,8 @@ lower_a32_serror:
 	mov	x0, SYS_WRITE0
 	adr	x1, .error
 	semihosting_call
-	mov	x0, SYS_EXIT
-	mov	x1, 1
-	semihosting_call
+	mov	x0, -1
+	bl 	_exit
 	/* never returns */
 
 	.section .rodata
-- 
2.39.5
