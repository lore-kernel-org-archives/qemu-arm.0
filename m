Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d20sm3795035wrc.96.2017.07.20.08.12.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:12:32 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 0AEC53E0BC6;
	Thu, 20 Jul 2017 16:04:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: rth@twiddle.net,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH for 2.11 22/23] fpu/softfloat2a: improve comments on ARM NaN propagation
Date: Thu, 20 Jul 2017 16:04:25 +0100
Message-Id: <20170720150426.12393-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: A3qAe2f92+pq

Mention the pseudo-code fragment from which this is based and correct
the spelling of signalling.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat2a/softfloat-specialize.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fpu/softfloat2a/softfloat-specialize.h b/fpu/softfloat2a/softfloat-specialize.h
index c8282b8bf7..2ccd4abe11 100644
--- a/fpu/softfloat2a/softfloat-specialize.h
+++ b/fpu/softfloat2a/softfloat-specialize.h
@@ -445,14 +445,14 @@ static float32 commonNaNToFloat32(commonNaNT a, float_status *status)
 
 #if defined(TARGET_ARM)
 static int pickNaN(flag aIsQNaN, flag aIsSNaN, flag bIsQNaN, flag bIsSNaN,
-                    flag aIsLargerSignificand)
+                   flag aIsLargerSignificand)
 {
-    /* ARM mandated NaN propagation rules: take the first of:
-     *  1. A if it is signaling
-     *  2. B if it is signaling
+    /* ARM mandated NaN propagation rules (see FPProcessNaNs()), take the first of:
+     *  1. A if it is signalling
+     *  2. B if it is signalling
      *  3. A (quiet)
      *  4. B (quiet)
-     * A signaling NaN is always quietened before returning it.
+     * A signalling NaN is always quietened before returning it.
      */
     if (aIsSNaN) {
         return 0;
-- 
2.13.0
