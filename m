Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938b5e7sm1659443f8f.55.2025.04.09.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 06:19:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 84A0B5F8FE;
	Wed,  9 Apr 2025 14:19:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 1/3] tests/tcg: fix semihosting SYS_EXIT for aarch64 in boot.S
Date: Wed,  9 Apr 2025 14:19:40 +0100
Message-Id: <20250409131942.1706923-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409131942.1706923-1-alex.bennee@linaro.org>
References: <20250409131942.1706923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pvg5lBi4sQ22

We don't expect to hit exceptions in our testing so currently all the
vectors report an un-expected exception and then attempt to exit.
However for aarch64 we should always use the extended information
block as we do in _exit. Rather than duplicate the code on the error
handler just branch to the _exit handler with a failing status code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250404115641.258048-1-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index 4eb1b35b88..a5df9c173d 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -73,9 +73,8 @@ lower_a32_serror:
 	mov	x0, SYS_WRITE0
 	adr	x1, .error
 	semihosting_call
-	mov	x0, SYS_EXIT
-	mov	x1, 1
-	semihosting_call
+	mov	x0, 1 /* EXIT_FAILURE */
+	bl 	_exit
 	/* never returns */
 
 	.section .rodata
-- 
2.39.5
