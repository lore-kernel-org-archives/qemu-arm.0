Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d54-v6sm616952wrd.94.2018.05.10.02.42.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 May 2018 02:42:07 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 0276A3E0335;
	Thu, 10 May 2018 10:42:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v3 1/5] fpu/softfloat: int_to_float ensure r fully initialised
Date: Thu, 10 May 2018 10:42:02 +0100
Message-Id: <20180510094206.15354-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180510094206.15354-1-alex.bennee@linaro.org>
References: <20180510094206.15354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FnxqgJcQL+O1

Reported by Coverity (CID1390635). We ensure this for uint_to_float
later on so we might as well mirror that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 70e0c40a1c..3adf6a06e4 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1517,7 +1517,7 @@ FLOAT_TO_UINT(64, 64)
 
 static FloatParts int_to_float(int64_t a, float_status *status)
 {
-    FloatParts r;
+    FloatParts r = {};
     if (a == 0) {
         r.cls = float_class_zero;
         r.sign = false;
-- 
2.17.0
