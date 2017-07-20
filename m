Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w136sm2093304wmd.45.2017.07.20.08.04.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:04:33 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E3AAE3E01BD;
	Thu, 20 Jul 2017 16:04:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: rth@twiddle.net,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH for 2.11 07/23] softfloat3c: f16_to_f128M remove unused variable
Date: Thu, 20 Jul 2017 16:04:10 +0100
Message-Id: <20170720150426.12393-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ybz7PEpnNT1s

It causes some compilers to complain.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat3c/f16_to_f128M.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fpu/softfloat3c/f16_to_f128M.c b/fpu/softfloat3c/f16_to_f128M.c
index b947ffc08d..12c75d5990 100644
--- a/fpu/softfloat3c/f16_to_f128M.c
+++ b/fpu/softfloat3c/f16_to_f128M.c
@@ -63,7 +63,6 @@ void f16_to_f128M( float16_t a, float128_t *zPtr )
     struct commonNaN commonNaN;
     uint32_t uiZ96;
     struct exp8_sig16 normExpSig;
-    uint64_t frac64;
 
     /*------------------------------------------------------------------------
     *------------------------------------------------------------------------*/
-- 
2.13.0
