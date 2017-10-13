Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b190sm1885439wma.22.2017.10.13.09.24.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:24:42 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 019123E07E1;
	Fri, 13 Oct 2017 17:24:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH 08/30] softfloat: add half-precision expansions for MINMAX fns
Date: Fri, 13 Oct 2017 17:24:16 +0100
Message-Id: <20171013162438.32458-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: P6cDFoTRqqMr

Expand the current helpers to include half-precision functions. The
includes having f16 version of the compare functions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat.c         |  2 ++
 include/fpu/softfloat.h | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 3a4ab1355f..013b223947 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -7579,6 +7579,7 @@ int float ## s ## _compare_quiet(float ## s a, float ## s b,                 \
     return float ## s ## _compare_internal(a, b, 1, status);                 \
 }
 
+COMPARE(16, 0x1f)
 COMPARE(32, 0xff)
 COMPARE(64, 0x7ff)
 
@@ -7779,6 +7780,7 @@ float ## s float ## s ## _maxnummag(float ## s a, float ## s b,         \
     return float ## s ## _minmax(a, b, 0, 1, 1, status);                \
 }
 
+MINMAX(16)
 MINMAX(32)
 MINMAX(64)
 
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index edf402d422..d89fdf7675 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -381,6 +381,17 @@ static inline float16 float16_abs(float16 a)
      */
     return make_float16(float16_val(a) & 0x7fff);
 }
+
+/* Expanded by the MINMAX macro in softfloat.c */
+int float16_compare(float16, float16, float_status *status);
+int float16_compare_quiet(float16, float16, float_status *status);
+float16 float16_min(float16, float16, float_status *status);
+float16 float16_max(float16, float16, float_status *status);
+float16 float16_minnum(float16, float16, float_status *status);
+float16 float16_maxnum(float16, float16, float_status *status);
+float16 float16_minnummag(float16, float16, float_status *status);
+float16 float16_maxnummag(float16, float16, float_status *status);
+
 /*----------------------------------------------------------------------------
 | The pattern for a default generated half-precision NaN.
 *----------------------------------------------------------------------------*/
-- 
2.14.1
