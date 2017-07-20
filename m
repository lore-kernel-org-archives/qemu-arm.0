Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b80sm2711527wmf.10.2017.07.20.08.04.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:04:33 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id D2F6D3E04F1;
	Thu, 20 Jul 2017 16:04:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: rth@twiddle.net,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH for 2.11 06/23] softfloat3c: silence compiler warning
Date: Thu, 20 Jul 2017 16:04:09 +0100
Message-Id: <20170720150426.12393-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sVG5GUOZr14W

While you could pass a 0 size_words to the function it would be a bug.
At least by ensuring the leg is followed it stops the compiler
complaining about a potential uninitialised access.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat3c/s_shiftRightJamM.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat3c/s_shiftRightJamM.c b/fpu/softfloat3c/s_shiftRightJamM.c
index 47ba5ddaf9..035d5d3c1f 100644
--- a/fpu/softfloat3c/s_shiftRightJamM.c
+++ b/fpu/softfloat3c/s_shiftRightJamM.c
@@ -66,7 +66,7 @@ void
         } while ( i );
         ptr = zPtr;
     }
-    if ( wordDist < size_words ) {
+    if ( wordDist <= size_words ) {
         aPtr += indexMultiwordHiBut( size_words, wordDist );
         innerDist = dist & 31;
         if ( innerDist ) {
-- 
2.13.0
